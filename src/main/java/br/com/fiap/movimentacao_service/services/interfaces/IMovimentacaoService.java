package br.com.fiap.movimentacao_service.services.interfaces;

import br.com.fiap.movimentacao_service.entities.record.request.MovimentacaoRecordRequest;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordPaginacaoResponse;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordResponse;

import java.time.LocalDate;
import java.util.UUID;

public interface IMovimentacaoService {
    MovimentacaoRecordResponse movimentar(String internalKey, MovimentacaoRecordRequest dados);
    MovimentacaoRecordPaginacaoResponse buscar(
        UUID idUnidade,
        UUID idInsumo,
        LocalDate dataInicio,
        LocalDate dataFim,
        Integer pagina
    );
}
