package br.com.fiap.movimentacao_service.controllers;

import br.com.fiap.movimentacao_service.entities.record.request.MovimentacaoRecordRequest;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordPaginacaoResponse;
import br.com.fiap.movimentacao_service.entities.record.response.MovimentacaoRecordResponse;
import br.com.fiap.movimentacao_service.services.interfaces.IMovimentacaoService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.UUID;

@RestController
@RequestMapping("/movimentacoes")
@Slf4j
public class MovimentacaoController {

    IMovimentacaoService movimentacaoService;

    public MovimentacaoController(IMovimentacaoService movimentacaoService) {
        this.movimentacaoService = movimentacaoService;
    }

    @GetMapping("/unidades/{idUnidade}")
    public ResponseEntity<MovimentacaoRecordPaginacaoResponse> buscarMovimentacoes(
        @PathVariable UUID idUnidade,
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
    public ResponseEntity<MovimentacaoRecordResponse> movimentacao(@RequestHeader("X-INTERNAL-KEY") String internalKey, @RequestBody @Valid MovimentacaoRecordRequest dadosMovimentacao) {
        log.info("movimentacao(): chave interna {} e dados da movimentação {}", internalKey, dadosMovimentacao);

        return ResponseEntity.ok().body(movimentacaoService.movimentar(internalKey, dadosMovimentacao));
    }
}
