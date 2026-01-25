package br.com.fiap.movimentacao_service.exceptions;

public class DataInvalidaException extends RuntimeException {
    public DataInvalidaException(String message) {
        super(message);
    }
}
