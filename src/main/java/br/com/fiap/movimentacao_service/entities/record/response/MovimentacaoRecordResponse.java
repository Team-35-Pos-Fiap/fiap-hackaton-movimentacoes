package br.com.fiap.movimentacao_service.entities.record.response;

import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.time.LocalDateTime;
import java.util.UUID;

public record MovimentacaoRecordResponse(
    UUID id,
    TipoMovimentacao tipoMovimentacao,
    UUID idInsumo,
    UUID idUnidadeOrigem,
    UUID idUnidadeDestino,
    int quantidade,
    LocalDateTime timestamp
) {
}
