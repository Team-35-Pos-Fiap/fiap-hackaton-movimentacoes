package br.com.fiap.movimentacao_service.services;

import br.com.fiap.movimentacao_service.entities.domain.MovimentacaoDomain;
import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.entities.record.request.MovimentacaoRecordRequest;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordPaginacaoResponse;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordResponse;
import br.com.fiap.movimentacao_service.exceptions.AccessoNegadoException;
import br.com.fiap.movimentacao_service.exceptions.DataInvalidaException;
import br.com.fiap.movimentacao_service.exceptions.PaginaInvalidaException;
import br.com.fiap.movimentacao_service.exceptions.TransferenciaSemIdDestinoException;
import br.com.fiap.movimentacao_service.mappers.MovimentacaoMapper;
import br.com.fiap.movimentacao_service.repositories.iterfaces.IMovimentacaoRepository;
import br.com.fiap.movimentacao_service.services.interfaces.IMovimentacaoService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
public class MovimentacaoService implements IMovimentacaoService {

    IMovimentacaoRepository movimentacaoRepository;

    public MovimentacaoService(IMovimentacaoRepository movimentacaoRepository) {
        this.movimentacaoRepository = movimentacaoRepository;
    }

    /**
     * Registra uma movimentação de insumo.
     * Pode ser ENTRADA, SAIDA, PERDA ou TRANSFERENCIA.
     *
     * @param dados dados da movimentação
     * @return MovimentacaoRecordResponse com os dados registrados
     */
    @Override
    public List<MovimentacaoRecordResponse> movimentar(MovimentacaoRecordRequest dados) {
        return switch (dados.tipoMovimentacao()) {
            case TRANSFERENCIA -> trasnferencia(dados);
            case SAIDA, ENTRADA, PERDA ->
                movimentacao(dados.idInsumo(), dados.idUnidadeOrigem(), dados.tipoMovimentacao(), dados.quantidade());
        };
    }

    /**
     * Busca movimentações com filtros de unidade, insumo e período.
     *
     * @param idUnidade ID da unidade
     * @param idInsumo ID do insumo (opcional)
     * @param dataInicio data inicial do período (opcional)
     * @param dataFim data final do período (opcional)
     * @param pagina número da página
     * @return MovimentacaoRecordPaginacaoResponse com os resultados
     */
    @Override
    public MovimentacaoRecordPaginacaoResponse buscar(
        UUID idUnidade,
        UUID idInsumo,
        LocalDate dataInicio,
        LocalDate dataFim,
        Integer pagina
    ) {
        validarPagina(pagina);

        LocalDateTime inicio = null;
        LocalDateTime fim = null;

        // Valida e converte datas
        if (dataInicio != null || dataFim != null) {
            if (dataInicio == null || dataFim == null) {
                throw new DataInvalidaException("dataInicio e dataFim devem ser informados juntos");
            }
            if (dataInicio.isAfter(dataFim)) {
                throw new DataInvalidaException("dataInicio não pode ser maior que dataFim");
            }
            LocalDate hoje = LocalDate.now();
            if (dataInicio.isAfter(hoje) || dataFim.isAfter(hoje)) {
                throw new DataInvalidaException("Datas não podem ser maiores que a data atual");
            }
            inicio = dataInicio.atStartOfDay();
            fim = dataFim.atTime(23, 59, 59);
        }

        Page<MovimentacaoModel> movimentacoes;
        boolean filtraInsumo = idInsumo != null;
        boolean filtraPeriodo = inicio != null;

        // Busca de acordo com os filtros aplicados
        if (filtraInsumo && filtraPeriodo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeInsumoEPeriodo(idUnidade, idInsumo, inicio, fim, pagina);
        } else if (filtraInsumo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeEInsumo(idUnidade, idInsumo, pagina);
        } else if (filtraPeriodo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeEPeriodo(idUnidade, inicio, fim, pagina);
        } else {
            movimentacoes = movimentacaoRepository.buscarPorUnidade(idUnidade, pagina);
        }

        return MovimentacaoMapper.fromModelToResponsePaginated(movimentacoes);
    }

    /** Valida se o número da página é maior ou igual a 1 */
    private void validarPagina(int pagina) {
        if (pagina < 1) {
            throw new PaginaInvalidaException("O número da página deve ser maior ou igual a 1.");
        }
    }

    /**
     * Realiza uma transferência de insumo entre unidades.
     * Gera um ID único de transferência para vincular saída e entrada.
     *
     * @param dados dados da transferência
     */
    private List<MovimentacaoRecordResponse> trasnferencia(MovimentacaoRecordRequest dados) {
        validarTransferencia(dados);

        UUID idTrasnferencia = UUID.randomUUID();

        // registra entrada na unidade destino
        MovimentacaoRecordResponse entrada = movimentacao(dados.idInsumo(), dados.idUnidadeDestino(), idTrasnferencia, TipoMovimentacao.ENTRADA, dados.quantidade());

        // registra saída na unidade origem
        MovimentacaoRecordResponse saida = movimentacao(dados.idInsumo(), dados.idUnidadeOrigem(), idTrasnferencia, TipoMovimentacao.SAIDA, dados.quantidade());

        // retorna lista com ambos registros
        return List.of(entrada,saida);
    }

    /**
     * Cria uma movimentação simples (ENTRADA, SAIDA ou PERDA) sem ID de transferência
     *
     * @param idInsumo ID do insumo
     * @param idUnidade ID da unidade
     * @param tipoMovimentacao tipo da movimentação
     * @param quantidade quantidade movimentada
     */
    private List<MovimentacaoRecordResponse> movimentacao(UUID idInsumo, UUID idUnidade, TipoMovimentacao tipoMovimentacao, int quantidade) {
        MovimentacaoDomain domain = MovimentacaoDomain.movimentacaoSimples(idInsumo, idUnidade, tipoMovimentacao, quantidade);
        MovimentacaoModel model = MovimentacaoMapper.fromDomainToModel(domain);
        movimentacaoRepository.salvar(model);
        return List.of(MovimentacaoMapper.fromModelToResponse(model));
    }

    /**
     * Cria uma movimentação vinculada a uma transferência
     *
     * @param idInsumo ID do insumo
     * @param idUnidade ID da unidade
     * @param idTransferencia ID da transferência
     * @param tipoMovimentacao tipo da movimentação
     * @param quantidade quantidade movimentada
     */
    private MovimentacaoRecordResponse movimentacao(UUID idInsumo, UUID idUnidade, UUID idTransferencia, TipoMovimentacao tipoMovimentacao, int quantidade) {
        MovimentacaoDomain domain = MovimentacaoDomain.transferencia(idInsumo, idUnidade, idTransferencia, tipoMovimentacao, quantidade);
        MovimentacaoModel model = MovimentacaoMapper.fromDomainToModel(domain);
        movimentacaoRepository.salvar(model);
        return MovimentacaoMapper.fromModelToResponse(model);
    }

    /** Valida dados da transferência, exigindo unidade destino */
    private void validarTransferencia(MovimentacaoRecordRequest dados) {
        if (dados.tipoMovimentacao() == TipoMovimentacao.TRANSFERENCIA && dados.idUnidadeDestino() == null) {
            throw new TransferenciaSemIdDestinoException("idUnidadeDestino é obrigatório para TRANSFERENCIA");
        }
    }
}
