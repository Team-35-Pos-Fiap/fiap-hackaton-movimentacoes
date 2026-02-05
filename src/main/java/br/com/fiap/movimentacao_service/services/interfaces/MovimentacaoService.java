package br.com.fiap.movimentacao_service.services.interfaces;

import br.com.fiap.movimentacao_service.dto.request.MovimentacaoRequestDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoPaginacaoResponseDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoResponseDto;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface MovimentacaoService {
    List<MovimentacaoResponseDto> movimentar(MovimentacaoRequestDto dados);
    MovimentacaoPaginacaoResponseDto buscar(
        UUID idUnidade,
        UUID idInsumo,
        LocalDate dataInicio,
        LocalDate dataFim,
        Integer pagina
    );
}
