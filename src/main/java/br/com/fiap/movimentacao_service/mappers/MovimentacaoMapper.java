package br.com.fiap.movimentacao_service.mappers;

import br.com.fiap.movimentacao_service.entities.domain.MovimentacaoDomain;
import br.com.fiap.movimentacao_service.entities.model.MovimentacaoModel;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoPaginacaoResponseDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoResponseDto;
import br.com.fiap.movimentacao_service.dto.response.PaginacaoResponseDto;
import org.springframework.data.domain.Page;

import java.util.List;

public class MovimentacaoMapper {

    public static MovimentacaoModel fromDomainToModel(MovimentacaoDomain dados) {
        return new MovimentacaoModel(
            null,
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidade(),
            dados.getIdTransferencia(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoDomain fromModelToDomain(MovimentacaoModel dados) {
        return new MovimentacaoDomain(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidade(),
            dados.getIdTransferencia(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoResponseDto fromDomainToResponse(MovimentacaoDomain dados) {
        return new MovimentacaoResponseDto(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidade(),
            dados.getIdTransferencia(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoResponseDto fromModelToResponse(MovimentacaoModel dados) {
        return new MovimentacaoResponseDto(
            dados.getId(),
            dados.getTipoMovimentacao(),
            dados.getIdInsumo(),
            dados.getIdUnidade(),
            dados.getIdTransferencia(),
            dados.getQuantidade(),
            dados.getTimestamp()
        );
    }

    public static MovimentacaoPaginacaoResponseDto fromModelToResponsePaginated(Page<MovimentacaoModel> dados){
        List<MovimentacaoResponseDto> movimentacoes = dados.toList()
            .stream()
            .map(MovimentacaoMapper::fromModelToResponse)
            .toList();

        PaginacaoResponseDto dadosPaginacao = new PaginacaoResponseDto(dados.getNumber() + 1, dados.getTotalPages(), Long.valueOf(dados.getTotalElements()).intValue());

        return new MovimentacaoPaginacaoResponseDto(movimentacoes, dadosPaginacao);
    }
}
