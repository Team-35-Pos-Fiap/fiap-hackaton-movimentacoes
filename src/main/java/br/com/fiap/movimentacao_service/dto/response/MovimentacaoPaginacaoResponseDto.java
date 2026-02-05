package br.com.fiap.movimentacao_service.dto.response;

import java.util.List;

public record MovimentacaoPaginacaoResponseDto(
    List<MovimentacaoResponseDto> movimentacoes,
    PaginacaoResponseDto dadosPaginacao
) {
}
