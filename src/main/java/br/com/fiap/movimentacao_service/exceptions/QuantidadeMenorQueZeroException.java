package br.com.fiap.movimentacao_service.exceptions;

public class QuantidadeMenorQueZeroException extends RuntimeException {
    public QuantidadeMenorQueZeroException(String message) {
        super(message);
    }
}
