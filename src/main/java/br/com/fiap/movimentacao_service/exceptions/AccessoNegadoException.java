package br.com.fiap.movimentacao_service.exceptions;

public class AccessoNegadoException extends RuntimeException {
    public AccessoNegadoException(String message) {
        super(message);
    }
}
