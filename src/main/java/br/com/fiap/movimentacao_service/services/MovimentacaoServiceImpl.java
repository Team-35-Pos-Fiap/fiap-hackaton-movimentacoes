package br.com.fiap.movimentacao_service.services;

import br.com.fiap.movimentacao_service.entities.domain.MovimentacaoDomain;
import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.dto.request.MovimentacaoRequestDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoPaginacaoResponseDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoResponseDto;
import br.com.fiap.movimentacao_service.exceptions.DataInvalidaException;
import br.com.fiap.movimentacao_service.exceptions.PaginaInvalidaException;
import br.com.fiap.movimentacao_service.exceptions.TransferenciaSemIdDestinoException;
import br.com.fiap.movimentacao_service.mappers.MovimentacaoMapper;
import br.com.fiap.movimentacao_service.repositories.iterfaces.MovimentacaoRepository;
import br.com.fiap.movimentacao_service.services.interfaces.MovimentacaoService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
public class MovimentacaoServiceImpl implements MovimentacaoService {

    MovimentacaoRepository movimentacaoRepository;

    public MovimentacaoServiceImpl(MovimentacaoRepository movimentacaoRepository) {
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
    public List<MovimentacaoResponseDto> movimentar(MovimentacaoRequestDto dados) {
        return switch (dados.tipoMovimentacao()) {
            case TRANSFERENCIA -> trasnferencia(dados);
            case SAIDA, ENTRADA, PERDA ->
                movimentacao(dados.idInsumo(), dados.idUnidadeOrigem(), dados.tipoMovimentacao(), dados.quantidade());
        };
    }

    /**
     * Busca movimentações com filtros de unidade, insumo e período.
     *
     * @param idUnidade ID da unidade (opcional)
     * @param idInsumo ID do insumo (opcional)
     * @param dataInicio data inicial do período (opcional)
     * @param dataFim data final do período (opcional)
     * @param pagina número da página
     * @return MovimentacaoRecordPaginacaoResponse com os resultados
     */
    @Override
    public MovimentacaoPaginacaoResponseDto buscar(
        UUID idUnidade, UUID idInsumo, LocalDate dataInicio, LocalDate dataFim, Integer pagina
    ) {
        validarPagina(pagina);
        validarDatas(dataInicio, dataFim);

        // Começa com uma especificação vazia (seleciona tudo)
        Specification<MovimentacaoModel> spec = (root, query, cb) -> cb.conjunction();

        if (idUnidade != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("idUnidade"), idUnidade));
        }

        if (idInsumo != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("idInsumo"), idInsumo));
        }

        if (dataInicio != null && dataFim != null) {
            spec = spec.and((root, query, cb) -> cb.between(
                root.get("timestamp"),
                dataInicio.atStartOfDay(),
                dataFim.atTime(23, 59, 59)
            ));
        }

        // Spring Data usa índice 0 para páginas. Se o usuário envia 1, subtraímos 1.
        Pageable pageable = PageRequest.of(pagina > 0 ? pagina - 1 : 0, 10);

        Page<MovimentacaoModel> movimentacoes = movimentacaoRepository.buscarTodos(spec, pageable);

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
    private List<MovimentacaoResponseDto> trasnferencia(MovimentacaoRequestDto dados) {
        validarTransferencia(dados);

        UUID idTrasnferencia = UUID.randomUUID();

        // registra entrada na unidade destino
        MovimentacaoResponseDto entrada = movimentacao(dados.idInsumo(), dados.idUnidadeDestino(), idTrasnferencia, TipoMovimentacao.ENTRADA, dados.quantidade());

        // registra saída na unidade origem
        MovimentacaoResponseDto saida = movimentacao(dados.idInsumo(), dados.idUnidadeOrigem(), idTrasnferencia, TipoMovimentacao.SAIDA, dados.quantidade());

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
    private List<MovimentacaoResponseDto> movimentacao(UUID idInsumo, UUID idUnidade, TipoMovimentacao tipoMovimentacao, int quantidade) {
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
    private MovimentacaoResponseDto movimentacao(UUID idInsumo, UUID idUnidade, UUID idTransferencia, TipoMovimentacao tipoMovimentacao, int quantidade) {
        MovimentacaoDomain domain = MovimentacaoDomain.transferencia(idInsumo, idUnidade, idTransferencia, tipoMovimentacao, quantidade);
        MovimentacaoModel model = MovimentacaoMapper.fromDomainToModel(domain);
        movimentacaoRepository.salvar(model);
        return MovimentacaoMapper.fromModelToResponse(model);
    }

    /** Valida dados da transferência, exigindo unidade destino */
    private void validarTransferencia(MovimentacaoRequestDto dados) {
        if (dados.tipoMovimentacao() == TipoMovimentacao.TRANSFERENCIA && dados.idUnidadeDestino() == null) {
            throw new TransferenciaSemIdDestinoException("idUnidadeDestino é obrigatório para TRANSFERENCIA");
        }
    }

    private void validarDatas(LocalDate inicio, LocalDate fim) {
        if (inicio == null && fim == null) return;

        if (inicio == null || fim == null)
            throw new DataInvalidaException("dataInicio e dataFim devem ser informados juntos");

        if (inicio.isAfter(fim))
            throw new DataInvalidaException("dataInicio não pode ser maior que dataFim");

        if (inicio.isAfter(LocalDate.now()))
            throw new DataInvalidaException("Datas não podem ser maiores que a data atual");
    }
}
