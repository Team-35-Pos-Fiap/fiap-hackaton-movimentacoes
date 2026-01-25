package br.com.fiap.movimentacao_service.mappers;

import br.com.fiap.movimentacao_service.entities.domain.MovimentacaoDomain;
import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.entities.record.request.MovimentacaoRecordRequest;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordPaginacaoResponse;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordResponse;
import br.com.fiap.movimentacao_service.entities.record.response.PaginacaoRecordResponse;
import org.springframework.data.domain.Page;

import java.util.List;

public class MovimentacaoMapper {

    public static MovimentacaoDomain fromRecordToDomain(MovimentacaoRecordRequest dados) {
        return switch (dados.tipoMovimentacao()){
            case TRANSFERENCIA -> MovimentacaoDomain.transferencia(dados.idInsumo(), dados.idUnidadeOrigem(), dados.idUnidadeDestino(), dados.quantidade());
            case ENTRADA, SAIDA, PERDA -> MovimentacaoDomain.movimentacaoSimples(dados.idInsumo(), dados.idUnidadeOrigem(), dados.tipoMovimentacao(),dados.quantidade());
        };
    }

    public static MovimentacaoModel fromDomainToModel(MovimentacaoDomain dados) {
        return new MovimentacaoModel(
            null,
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidadeOrigem(),
            dados.getIdUnidadeDestino(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoDomain fromModelToDomain(MovimentacaoModel dados) {
        return new MovimentacaoDomain(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidadeOrigem(),
            dados.getIdUnidadeDestino(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoRecordResponse fromDomainToResponse(MovimentacaoDomain dados) {
        return new MovimentacaoRecordResponse(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidadeOrigem(),
            dados.getIdUnidadeDestino(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoRecordResponse fromModelToResponse(MovimentacaoModel dados) {
        return new MovimentacaoRecordResponse(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidadeOrigem(),
            dados.getIdUnidadeDestino(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoRecordPaginacaoResponse fromModelToResponsePaginated(Page<MovimentacaoModel> dados){
        List<MovimentacaoRecordResponse> movimentacoes = dados.toList()
            .stream()
            .map(MovimentacaoMapper::fromModelToResponse)
            .toList();

        PaginacaoRecordResponse dadosPaginacao = new PaginacaoRecordResponse(dados.getNumber() + 1, dados.getTotalPages(), Long.valueOf(dados.getTotalElements()).intValue());

        return new MovimentacaoRecordPaginacaoResponse(movimentacoes, dadosPaginacao);
    }
}
