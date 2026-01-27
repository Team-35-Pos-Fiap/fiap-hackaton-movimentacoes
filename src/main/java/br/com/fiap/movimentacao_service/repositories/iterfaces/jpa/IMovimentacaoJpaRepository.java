package br.com.fiap.movimentacao_service.repositories.iterfaces.jpa;

import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.UUID;

public interface IMovimentacaoJpaRepository extends JpaRepository<MovimentacaoModel, UUID> {
    Page<MovimentacaoModel> findAllByIdUnidade(
        UUID idUnidadeOrigem,
        Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeAndTimestampBetween(
        UUID idUnidade,
        LocalDateTime inicio,
        LocalDateTime fim, Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeAndIdInsumo(
        UUID idUnidade,
        UUID idInsumo,
        Pageable pageable
    );

    Page<MovimentacaoModel> findByIdUnidadeAndIdInsumoAndTimestampBetween(
        UUID idUnidade,
        UUID idInsumo,
        LocalDateTime inicio,
        LocalDateTime fim,
        Pageable pageable
    );
}
