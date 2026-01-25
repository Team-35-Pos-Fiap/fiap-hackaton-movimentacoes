package br.com.fiap.movimentacao_service.entities.domain;

import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import br.com.fiap.movimentacao_service.exceptions.*;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
public class MovimentacaoDomain {

    private final UUID id;
    private final TipoMovimentacao tipoMovimentacao;
    private final UUID idInsumo;
    private final UUID idUnidadeOrigem;
    private final UUID idUnidadeDestino;
    private final int quantidade;
    private final LocalDateTime timestamp;

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidadeOrigem,
                              UUID idUnidadeDestino,
                              int quantidade,
                              LocalDateTime timestamp) {
        if (quantidade <= 0) {
            throw new QuantidadeMenorQueZeroException("Quantidade deve ser maior que zero");
        }

        if (tipoMovimentacao == TipoMovimentacao.TRANSFERENCIA && idUnidadeDestino == null) {
            throw new TransferenciaSemIdDestinoException("Transferência exige unidade destino");
        }

        if (tipoMovimentacao != TipoMovimentacao.TRANSFERENCIA && idUnidadeDestino != null) {
            throw new IdDestinoDesnecessarioException("Unidade destino só é permitida em transferências");
        }

        if (timestamp == null) {
            throw new TimestampFaltandoException("Timestamp não pode ser nulo");
        }

        this.id = id;
        this.tipoMovimentacao = tipoMovimentacao;
        this.idInsumo = idInsumo;
        this.idUnidadeOrigem = idUnidadeOrigem;
        this.idUnidadeDestino = idUnidadeDestino;
        this.quantidade = quantidade;
        this.timestamp = timestamp;
    }

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidadeOrigem,
                              UUID idUnidadeDestino,
                              int quantidade) {
        this(id, tipoMovimentacao, idInsumo, idUnidadeOrigem, idUnidadeDestino, quantidade, LocalDateTime.now());
    }

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidadeOrigem,
                              int quantidade) {
        this(id, tipoMovimentacao, idInsumo, idUnidadeOrigem, null, quantidade, LocalDateTime.now());
    }

    public static MovimentacaoDomain transferencia(UUID idInsumo, UUID origem, UUID destino, int quantidade) {
        return new MovimentacaoDomain(null, TipoMovimentacao.TRANSFERENCIA, idInsumo, origem, destino, quantidade);
    }

    public static MovimentacaoDomain movimentacaoSimples(UUID idInsumo, UUID origem, TipoMovimentacao tipo, int quantidade) {
        if (tipo == TipoMovimentacao.TRANSFERENCIA) {
            throw new TransferenciaEmMovimentacaoSimplesException("Use o método transferencia() para esse tipo");
        }
        return new MovimentacaoDomain(null, tipo, idInsumo, origem, quantidade);
    }
}
