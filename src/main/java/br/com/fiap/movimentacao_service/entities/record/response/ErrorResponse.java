package br.com.fiap.movimentacao_service.entities.record.response;

public record ErrorResponse(
    int status,
    String erro,
    String mensagem
) {}
