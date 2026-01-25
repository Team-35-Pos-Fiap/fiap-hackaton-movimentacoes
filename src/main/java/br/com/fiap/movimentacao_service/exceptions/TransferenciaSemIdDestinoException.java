package br.com.fiap.movimentacao_service.exceptions;

public class TransferenciaSemIdDestinoException extends RuntimeException {
    public TransferenciaSemIdDestinoException(String message) {
        super(message);
    }
}
