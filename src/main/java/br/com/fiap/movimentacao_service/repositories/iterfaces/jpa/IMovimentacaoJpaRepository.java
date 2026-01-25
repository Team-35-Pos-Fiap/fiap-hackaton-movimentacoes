package br.com.fiap.movimentacao_service.repositories.iterfaces.jpa;

import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.UUID;

public interface IMovimentacaoJpaRepository extends JpaRepository<MovimentacaoModel, UUID> {
    Page<MovimentacaoModel> findAllByIdUnidadeOrigem(
        UUID idUnidadeOrigem,
        Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeOrigemAndTimestampBetween(
        UUID idUnidade,
        LocalDateTime inicio,
        LocalDateTime fim, Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeOrigemAndIdInsumo(
        UUID idUnidade,
        UUID idInsumo,
        Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeOrigemAndIdInsumoAndTimestampBetween(
        UUID idUnidade,
        UUID idInsumo,
        LocalDateTime inicio,
        LocalDateTime fim,
        Pageable pageable
    );
}
