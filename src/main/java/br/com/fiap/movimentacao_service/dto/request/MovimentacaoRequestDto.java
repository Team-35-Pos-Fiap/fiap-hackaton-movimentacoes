package br.com.fiap.movimentacao_service.dto.request;

import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.util.UUID;

public record MovimentacaoRequestDto(
    @Valid
    TipoMovimentacao tipoMovimentacao,
    @NotNull
    UUID idInsumo,
    @NotNull
    UUID idUnidadeOrigem,
    UUID idUnidadeDestino,
    @NotNull
    @Positive
    int quantidade
) {
}
