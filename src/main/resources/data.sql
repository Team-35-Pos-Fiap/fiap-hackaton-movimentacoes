-- UNIDADES
-- u1 = 11111111-1111-1111-1111-111111111111
-- u2 = 22222222-2222-2222-2222-222222222222
-- u3 = 33333333-3333-3333-3333-333333333333

-- INSUMOS
-- i1 = aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
-- i2 = bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb
-- i3 = cccccccc-cccc-cccc-cccc-cccccccccccc
-- i4 = dddddddd-dddd-dddd-dddd-dddddddddddd
-- i5 = eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee
-- i6 = ffffffff-ffff-ffff-ffff-ffffffffffff

INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111101', 'ENTRADA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','11111111-1111-1111-1111-111111111111', NULL, 120, '2026-01-01 08:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111102', 'SAIDA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', NULL, 30, '2026-01-02 09:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111103', 'PERDA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', NULL, 5, '2026-01-03 10:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111104', 'TRANSFERENCIA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 50, '2026-01-04 11:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111105', 'ENTRADA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '22222222-2222-2222-2222-222222222222', NULL, 200, '2026-01-05 12:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111106', 'SAIDA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '22222222-2222-2222-2222-222222222222', NULL, 40, '2026-01-06 13:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111107', 'TRANSFERENCIA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '22222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 25, '2026-01-07 08:30:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111108', 'ENTRADA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '33333333-3333-3333-3333-333333333333', NULL, 80, '2026-01-08 09:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111109', 'SAIDA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '11111111-1111-1111-1111-111111111111', NULL, 60, '2026-01-09 10:15:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111110', 'TRANSFERENCIA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 35, '2026-01-10 11:20:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111111', 'ENTRADA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '11111111-1111-1111-1111-111111111111', NULL, 150, '2026-01-11 12:30:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111112', 'SAIDA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '22222222-2222-2222-2222-222222222222', NULL, 20, '2026-01-12 14:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111113', 'PERDA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '33333333-3333-3333-3333-333333333333', NULL, 15, '2026-01-13 08:15:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111114', 'TRANSFERENCIA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 45, '2026-01-14 09:40:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111115', 'ENTRADA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', NULL, 70, '2026-01-15 10:50:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111116', 'SAIDA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '33333333-3333-3333-3333-333333333333', NULL, 40, '2026-01-16 11:10:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111117', 'TRANSFERENCIA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 55, '2026-01-17 12:25:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111118', 'ENTRADA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '11111111-1111-1111-1111-111111111111', NULL, 130, '2026-01-18 13:35:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111119', 'SAIDA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '22222222-2222-2222-2222-222222222222', NULL, 25, '2026-01-19 14:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111120', 'PERDA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '33333333-3333-3333-3333-333333333333', NULL, 10, '2026-01-20 15:55:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111121', 'TRANSFERENCIA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 60, '2026-01-21 16:05:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111122', 'ENTRADA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '22222222-2222-2222-2222-222222222222', NULL, 90, '2026-01-22 08:15:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111123', 'SAIDA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '33333333-3333-3333-3333-333333333333', NULL, 50, '2026-01-23 09:30:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111124', 'TRANSFERENCIA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 35, '2026-01-24 10:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111125', 'ENTRADA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '22222222-2222-2222-2222-222222222222', NULL, 75, '2026-01-25 11:55:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111126', 'SAIDA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', NULL, 20, '2026-01-26 12:10:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111127', 'PERDA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', NULL, 8, '2026-01-27 13:20:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111128', 'TRANSFERENCIA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 45, '2026-01-28 14:30:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111129', 'ENTRADA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '11111111-1111-1111-1111-111111111111', NULL, 110, '2026-01-29 15:40:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111130', 'SAIDA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '22222222-2222-2222-2222-222222222222', NULL, 35, '2026-01-30 16:50:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111131', 'TRANSFERENCIA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '33333333-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', 65, '2026-01-31 08:10:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111132', 'ENTRADA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', NULL, 95, '2026-02-01 09:20:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111133', 'SAIDA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', NULL, 40, '2026-02-02 10:35:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111134', 'PERDA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '33333333-3333-3333-3333-333333333333', NULL, 12, '2026-02-03 11:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111135', 'TRANSFERENCIA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 50, '2026-02-04 12:55:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111136', 'ENTRADA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '22222222-2222-2222-2222-222222222222', NULL, 120, '2026-02-05 14:05:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111137', 'SAIDA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '33333333-3333-3333-3333-333333333333', NULL, 28, '2026-02-06 15:15:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111138', 'TRANSFERENCIA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 55, '2026-02-07 16:25:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111139', 'ENTRADA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', NULL, 85, '2026-02-08 08:35:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111140', 'SAIDA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '33333333-3333-3333-3333-333333333333', NULL, 38, '2026-02-09 09:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111141', 'PERDA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '11111111-1111-1111-1111-111111111111', NULL, 7, '2026-02-10 10:55:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111142', 'TRANSFERENCIA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '22222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 48, '2026-02-11 12:05:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111143', 'ENTRADA', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
        '33333333-3333-3333-3333-333333333333', NULL, 100, '2026-02-12 13:15:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111144', 'SAIDA', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
        '11111111-1111-1111-1111-111111111111', NULL, 33, '2026-02-13 14:25:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111145', 'TRANSFERENCIA', 'cccccccc-cccc-cccc-cccc-cccccccccccc',
        '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 52, '2026-02-14 15:35:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111146', 'ENTRADA', 'dddddddd-dddd-dddd-dddd-dddddddddddd',
        '11111111-1111-1111-1111-111111111111', NULL, 90, '2026-02-15 16:45:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111147', 'SAIDA', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
        '22222222-2222-2222-2222-222222222222', NULL, 42, '2026-02-16 08:55:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade_origem, id_unidade_destino, quantidade,
                          timestamp)
VALUES ('11111111-1111-1111-1111-111111111148', 'PERDA', 'ffffffff-ffff-ffff-ffff-ffffffffffff',
        '33333333-3333-3333-3333-333333333333', NULL, 9, '2026-02-16 08:55:00');