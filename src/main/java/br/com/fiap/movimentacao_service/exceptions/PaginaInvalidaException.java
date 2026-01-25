package br.com.fiap.movimentacao_service.exceptions;

public class PaginaInvalidaException extends RuntimeException {
    public PaginaInvalidaException(String message) {
        super(message);
    }
}
