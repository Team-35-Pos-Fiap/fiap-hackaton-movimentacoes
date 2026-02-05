package br.com.fiap.movimentacao_service.dto.response;

public record ErrorResponse(
    int status,
    String erro,
    String mensagem
) {}
