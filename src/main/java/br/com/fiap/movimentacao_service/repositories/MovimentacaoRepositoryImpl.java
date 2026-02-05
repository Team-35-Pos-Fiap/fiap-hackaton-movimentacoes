package br.com.fiap.movimentacao_service.repositories;

import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.repositories.iterfaces.MovimentacaoRepository;
import br.com.fiap.movimentacao_service.repositories.iterfaces.jpa.MovimentacaoJpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.UUID;

@Repository
public class MovimentacaoRepositoryImpl implements MovimentacaoRepository {

    MovimentacaoJpaRepository movimentacaoRepository;
    private static final int QUANTIDADE_REGISTROS = 5;

    public MovimentacaoRepositoryImpl(MovimentacaoJpaRepository movimentacaoRepository) {
        this.movimentacaoRepository = movimentacaoRepository;
    }

    @Override
    public void salvar(MovimentacaoModel movimentacaoModel) {
        movimentacaoRepository.save(movimentacaoModel);
    }

    @Override
    public Page<MovimentacaoModel> buscarTodos(Specification<MovimentacaoModel> spec, Pageable pageable) {
        return movimentacaoRepository.findAll(spec, pageable);
    }

    @Override
    public Page<MovimentacaoModel> buscarPorUnidade(UUID idUnidade, Integer pagina) {

        return movimentacaoRepository.findAllByIdUnidade(idUnidade, PageRequest.of(pagina - 1, QUANTIDADE_REGISTROS));
    }

    @Override
    public Page<MovimentacaoModel> buscarPorUnidadeInsumoEPeriodo(UUID idUnidade, UUID idInsumo, LocalDateTime dataInicio, LocalDateTime dataFim, Integer pagina) {

        return movimentacaoRepository.findByIdUnidadeAndIdInsumoAndTimestampBetween(idUnidade, idInsumo, dataInicio, dataFim, PageRequest.of(pagina - 1, QUANTIDADE_REGISTROS));
    }

    @Override
    public Page<MovimentacaoModel> buscarPorUnidadeEInsumo(UUID idUnidade, UUID idInsumo, Integer pagina) {

        return movimentacaoRepository.findByIdUnidadeAndIdInsumo(idUnidade, idInsumo, PageRequest.of(pagina - 1, QUANTIDADE_REGISTROS));
    }

    @Override
    public Page<MovimentacaoModel> buscarPorUnidadeEPeriodo(UUID idUnidade, LocalDateTime dataInicio, LocalDateTime dataFim, Integer pagina) {

        return movimentacaoRepository.findByIdUnidadeAndTimestampBetween(idUnidade, dataInicio, dataFim, PageRequest.of(pagina - 1, QUANTIDADE_REGISTROS));
    }
}
