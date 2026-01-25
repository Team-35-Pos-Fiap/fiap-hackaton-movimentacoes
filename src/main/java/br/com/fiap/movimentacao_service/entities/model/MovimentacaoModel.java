package br.com.fiap.movimentacao_service.entities.model;

import br.com.fiap.movimentacao_service.entities.enums.TipoMovimentacao;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "movimentacao")
@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MovimentacaoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    @Column(nullable = false, name = "tipo_movimentacao")
    @Enumerated(EnumType.STRING)
    private TipoMovimentacao tipoMovimentacao;
    @Column(nullable = false, name = "id_insumo")
    private UUID idInsumo;
    @Column(nullable = false, name = "id_unidade_origem")
    private UUID idUnidadeOrigem;
    @Column(name = "id_unidade_destino")
    private UUID idUnidadeDestino;
    @Column(nullable = false)
    private Integer quantidade;
    @Column(nullable = false, updatable = false)
    private LocalDateTime timestamp;

    @PrePersist
    public void prePersist() {
        this.timestamp = LocalDateTime.now();
    }
}
