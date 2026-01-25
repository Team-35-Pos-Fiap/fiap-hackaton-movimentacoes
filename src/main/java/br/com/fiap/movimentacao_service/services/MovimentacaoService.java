package br.com.fiap.movimentacao_service.services;

import br.com.fiap.movimentacao_service.entities.domain.MovimentacaoDomain;
import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.entities.record.request.MovimentacaoRecordRequest;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordPaginacaoResponse;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordResponse;
import br.com.fiap.movimentacao_service.exceptions.AccessoNegadoException;
import br.com.fiap.movimentacao_service.exceptions.DataInvalidaException;
import br.com.fiap.movimentacao_service.exceptions.PaginaInvalidaException;
import br.com.fiap.movimentacao_service.mappers.MovimentacaoMapper;
import br.com.fiap.movimentacao_service.repositories.iterfaces.IMovimentacaoRepository;
import br.com.fiap.movimentacao_service.services.interfaces.IMovimentacaoService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
public class MovimentacaoService implements IMovimentacaoService {

    IMovimentacaoRepository movimentacaoRepository;
    private final String ACCESS_KEY = "estoque-service-request";

    public MovimentacaoService(IMovimentacaoRepository movimentacaoRepository) {
        this.movimentacaoRepository = movimentacaoRepository;
    }

    @Override
    public MovimentacaoRecordResponse movimentar(String internalKey, MovimentacaoRecordRequest dados) {

        // Usado para validar se é o serviço de Estoque fazendo o request
        // Outro mode de fazer é usando o Security com JWT
        if (!internalKey.equals(ACCESS_KEY)) {
            throw new AccessoNegadoException("Acesso interno inválido");
        }

        // record -> domain
        MovimentacaoDomain domain = MovimentacaoMapper.fromRecordToDomain(dados);

        // domain -> model
        MovimentacaoModel model = MovimentacaoMapper.fromDomainToModel(domain);
        movimentacaoRepository.salvar(model);

        // model -> record
        return MovimentacaoMapper.fromModelToResponse(model);
    }

    @Override
    public MovimentacaoRecordPaginacaoResponse buscar(
        UUID idUnidade,
        UUID idInsumo,
        LocalDate dataInicio,
        LocalDate dataFim,
        Integer pagina
    ) {
        validarPagina(pagina);

        // Converte e valida datas
        LocalDateTime inicio = null;
        LocalDateTime fim = null;
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
            fim = dataFim.atTime(23, 59, 59); // fim do dia
        }

        Page<MovimentacaoModel> movimentacoes;

        boolean filtraInsumo = idInsumo != null;
        boolean filtraPeriodo = inicio != null;

        if (filtraInsumo && filtraPeriodo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeInsumoEPeriodo(
                idUnidade, idInsumo, inicio, fim, pagina
            );
        } else if (filtraInsumo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeEInsumo(
                idUnidade, idInsumo, pagina
            );
        } else if (filtraPeriodo) {
            movimentacoes = movimentacaoRepository.buscarPorUnidadeEPeriodo(
                idUnidade, inicio, fim, pagina
            );
        } else {
            movimentacoes = movimentacaoRepository.buscarPorUnidade(
                idUnidade, pagina
            );
        }

        return MovimentacaoMapper.fromModelToResponsePaginated(movimentacoes);
    }

    private void validarPagina(int pagina){
        if (pagina < 1) {
            throw new PaginaInvalidaException("O número da página deve ser maior ou igual a 1.");
        }
    }
}
