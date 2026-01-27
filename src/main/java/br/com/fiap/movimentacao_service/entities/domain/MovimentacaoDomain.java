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
    private final UUID idUnidade;
    private final UUID idTransferencia;
    private final int quantidade;
    private final LocalDateTime timestamp;

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidade,
                              UUID idTransferencia,
                              int quantidade,
                              LocalDateTime timestamp) {
        if (quantidade <= 0) {
            throw new QuantidadeMenorQueZeroException("Quantidade deve ser maior que zero");
        }

//        if (tipoMovimentacao == TipoMovimentacao.TRANSFERENCIA && idTransferencia == null) {
//            throw new TransferenciaSemIdDestinoException("Transferência exige id da transferencia");
//        }
//
//        if (tipoMovimentacao != TipoMovimentacao.TRANSFERENCIA && idTransferencia != null) {
//            throw new IdDestinoDesnecessarioException("Id da transferencia só é permitido em transferências");
//        }

        if (timestamp == null) {
            throw new TimestampFaltandoException("Timestamp não pode ser nulo");
        }

        this.id = id;
        this.tipoMovimentacao = tipoMovimentacao;
        this.idInsumo = idInsumo;
        this.idUnidade = idUnidade;
        this.idTransferencia = idTransferencia;
        this.quantidade = quantidade;
        this.timestamp = timestamp;
    }

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidade,
                              UUID idTransferencia,
                              int quantidade) {
        this(id, tipoMovimentacao, idInsumo, idUnidade, idTransferencia, quantidade, LocalDateTime.now());
    }

    public MovimentacaoDomain(UUID id,
                              TipoMovimentacao tipoMovimentacao,
                              UUID idInsumo,
                              UUID idUnidade,
                              int quantidade) {
        this(id, tipoMovimentacao, idInsumo, idUnidade, null, quantidade, LocalDateTime.now());
    }

    public static MovimentacaoDomain transferencia(UUID idInsumo, UUID origem, UUID idTransferencia,TipoMovimentacao tipoMovimentacao, int quantidade) {
        return new MovimentacaoDomain(null, tipoMovimentacao, idInsumo, origem, idTransferencia, quantidade);
    }

    public static MovimentacaoDomain movimentacaoSimples(UUID idInsumo, UUID origem, TipoMovimentacao tipo, int quantidade) {
        if (tipo == TipoMovimentacao.TRANSFERENCIA) {
            throw new TransferenciaEmMovimentacaoSimplesException("Use o método transferencia() para esse tipo");
        }
        return new MovimentacaoDomain(null, tipo, idInsumo, origem, quantidade);
    }
}
