package br.com.fiap.movimentacao_service.repositories.iterfaces;

import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDateTime;
import java.util.UUID;

public interface MovimentacaoRepository {
    void salvar(MovimentacaoModel movimentacaoModel);

    Page<MovimentacaoModel> buscarTodos(Specification<MovimentacaoModel> spec, Pageable pageable);

    Page<MovimentacaoModel> buscarPorUnidade(UUID idUnidade, Integer pagina);

    Page<MovimentacaoModel> buscarPorUnidadeInsumoEPeriodo(UUID idUnidade, UUID idInsumo, LocalDateTime dataInicio, LocalDateTime dataFim, Integer pagina);

    Page<MovimentacaoModel> buscarPorUnidadeEInsumo(UUID idUnidade, UUID idInsumo, Integer pagina);

    Page<MovimentacaoModel> buscarPorUnidadeEPeriodo(UUID idUnidade, LocalDateTime dataInicio, LocalDateTime dataFim, Integer pagina);
}
