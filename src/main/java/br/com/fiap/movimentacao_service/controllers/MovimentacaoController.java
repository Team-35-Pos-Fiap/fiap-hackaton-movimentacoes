package br.com.fiap.movimentacao_service.controllers;

import br.com.fiap.movimentacao_service.dto.request.MovimentacaoRequestDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoPaginacaoResponseDto;
import br.com.fiap.movimentacao_service.dto.response.MovimentacaoResponseDto;
import br.com.fiap.movimentacao_service.services.interfaces.MovimentacaoService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/movimentacoes")
@Slf4j
public class MovimentacaoController {

    MovimentacaoService movimentacaoService;

    public MovimentacaoController(MovimentacaoService movimentacaoService) {
        this.movimentacaoService = movimentacaoService;
    }

    @GetMapping
    public ResponseEntity<MovimentacaoPaginacaoResponseDto> buscarMovimentacoes(
        @RequestParam(required = false) UUID idUnidade,
        @RequestParam(required = false) UUID idInsumo,
        @RequestParam(required = false) LocalDate dataInicio,
        @RequestParam(required = false) LocalDate dataFim,
        @RequestParam(defaultValue = "1") Integer pagina
    ) {
        log.info(
            "buscarMovimentacoes(): unidade={}, insumo={}, inicio={}, fim={}, pagina={}",
            idUnidade, idInsumo, dataInicio, dataFim, pagina
        );

        return ResponseEntity.ok(
            movimentacaoService.buscar(
                idUnidade,
                idInsumo,
                dataInicio,
                dataFim,
                pagina
            )
        );
    }

    @PostMapping
    public ResponseEntity<List<MovimentacaoResponseDto>> movimentacao(@RequestBody @Valid MovimentacaoRequestDto dadosMovimentacao) {
        log.info("movimentacao(): dados da movimentação {}", dadosMovimentacao);

        return ResponseEntity.ok().body(movimentacaoService.movimentar(dadosMovimentacao));
    }
}
