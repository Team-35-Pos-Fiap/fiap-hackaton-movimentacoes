package br.com.fiap.movimentacao_service.exceptions;

public class TimestampFaltandoException extends RuntimeException {
    public TimestampFaltandoException(String message) {
        super(message);
    }
}
