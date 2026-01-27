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

-- MOVIMENTAÇÕES SIMPLES
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111101','ENTRADA','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','11111111-1111-1111-1111-111111111111',NULL,120,'2022-01-01 08:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111102','SAIDA','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','11111111-1111-1111-1111-111111111111',NULL,30,'2022-01-02 09:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111103','PERDA','cccccccc-cccc-cccc-cccc-cccccccccccc','22222222-2222-2222-2222-222222222222',NULL,5,'2022-01-03 10:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111104','ENTRADA','eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee','22222222-2222-2222-2222-222222222222',NULL,200,'2022-01-04 12:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111105','SAIDA','ffffffff-ffff-ffff-ffff-ffffffffffff','22222222-2222-2222-2222-222222222222',NULL,40,'2022-01-05 13:00:00');

-- TRANSFERÊNCIAS
-- Transferencia 1
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111106','SAIDA','dddddddd-dddd-dddd-dddd-dddddddddddd','11111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',50,'2022-01-06 10:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111107','ENTRADA','dddddddd-dddd-dddd-dddd-dddddddddddd','22222222-2222-2222-2222-222222222222','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',50,'2022-01-06 10:00:00');

-- Transferencia 2
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111108','SAIDA','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','22222222-2222-2222-2222-222222222222','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',25,'2022-01-07 08:30:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111109','ENTRADA','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','33333333-3333-3333-3333-333333333333','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',25,'2022-01-07 08:30:00');

-- Transferencia 3
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111110','SAIDA','dddddddd-dddd-dddd-dddd-dddddddddddd','33333333-3333-3333-3333-333333333333','cccccccc-cccc-cccc-cccc-cccccccccccc',35,'2022-01-08 09:20:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111111','ENTRADA','dddddddd-dddd-dddd-dddd-dddddddddddd','11111111-1111-1111-1111-111111111111','cccccccc-cccc-cccc-cccc-cccccccccccc',35,'2022-01-08 09:20:00');

-- Transferencia 4
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111112','SAIDA','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','11111111-1111-1111-1111-111111111111','dddddddd-dddd-dddd-dddd-dddddddddddd',45,'2022-01-09 11:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111113','ENTRADA','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','33333333-3333-3333-3333-333333333333','dddddddd-dddd-dddd-dddd-dddddddddddd',45,'2022-01-09 11:00:00');

-- Transferencia 5
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111114','SAIDA','eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee','22222222-2222-2222-2222-222222222222','eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',55,'2022-01-10 12:25:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111115','ENTRADA','eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee','11111111-1111-1111-1111-111111111111','eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',55,'2022-01-10 12:25:00');

-- Transferencia 6
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111116','SAIDA','cccccccc-cccc-cccc-cccc-cccccccccccc','11111111-1111-1111-1111-111111111111','ffffffff-ffff-ffff-ffff-ffffffffffff',60,'2022-01-11 14:00:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111117','ENTRADA','cccccccc-cccc-cccc-cccc-cccccccccccc','22222222-2222-2222-2222-222222222222','ffffffff-ffff-ffff-ffff-ffffffffffff',60,'2022-01-11 14:00:00');

-- Transferencia 7
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111118','SAIDA','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','33333333-3333-3333-3333-333333333333','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbb02',65,'2022-01-12 08:10:00');
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('11111111-1111-1111-1111-111111111119','ENTRADA','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','22222222-2222-2222-2222-222222222222','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbb02',65,'2022-01-12 08:10:00');