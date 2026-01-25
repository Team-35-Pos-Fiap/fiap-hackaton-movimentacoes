package br.com.fiap.movimentacao_service.entities.record.response;

import java.util.List;

public record MovimentacaoRecordPaginacaoResponse(
    List<MovimentacaoRecordResponse> movimentacoes,
    PaginacaoRecordResponse dadosPaginacao
) {
}
