package br.com.fiap.movimentacao_service.dto.response;

import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;

import java.time.LocalDateTime;
import java.util.UUID;

public record MovimentacaoResponseDto(
    UUID id,
    TipoMovimentacao tipoMovimentacao,
    UUID idInsumo,
    UUID idUnidade,
    UUID idTransferencia,
    int quantidade,
    LocalDateTime timestamp
) {
}
