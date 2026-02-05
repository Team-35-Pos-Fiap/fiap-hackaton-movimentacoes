-- =========================
-- movimentacao-service (DYNAMIC DATES)
-- Table: movimentacao
-- Uses DATEADD('DAY', <offset>, CURRENT_TIMESTAMP)
-- Types used: ENTRADA, SAIDA, PERDA (no TRANSFERENCIA rows)
-- =========================

-- Notes:
-- - Offsets roughly emulate the static dates spread across ~90 days.
-- - Run this file alone (or after truncating movimentacao), since IDs match the static script.

-- --------- Seringa 5ml (d111...) ---------
-- UPA Sé (ALTO + UP trend expected)
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a001-0001-0001-0001-000000000001','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,18,DATEADD('DAY',-86,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a002-0002-0002-0002-000000000002','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,20,DATEADD('DAY',-72,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a003-0003-0003-0003-000000000003','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,22,DATEADD('DAY',-58,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a004-0004-0004-0004-000000000004','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,25,DATEADD('DAY',-44,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a005-0005-0005-0005-000000000005','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,30,DATEADD('DAY',-15,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a006-0006-0006-0006-000000000006','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,30,DATEADD('DAY',-8,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a007-0007-0007-0007-000000000007','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,30,DATEADD('DAY',-5,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a008-0008-0008-0008-000000000008','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,25,DATEADD('DAY',-4,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a009-0009-0009-0009-000000000009','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,20,DATEADD('DAY',-3,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a010-0010-0010-0010-000000000010','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,22,DATEADD('DAY',-2,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111a011-0011-0011-0011-000000000011','SAIDA','d1111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,24,DATEADD('DAY',-1,CURRENT_TIMESTAMP));

-- Hospital RJ (BAIXO donor expected)
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b001-1001-1001-1001-000000000012','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-82,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b002-1002-1002-1002-000000000013','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-68,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b003-1003-1003-1003-000000000014','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,12,DATEADD('DAY',-54,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b004-1004-1004-1004-000000000015','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-40,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b005-1005-1005-1005-000000000016','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-26,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111b006-1006-1006-1006-000000000017','SAIDA','d1111111-1111-1111-1111-111111111111','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,8,DATEADD('DAY',-12,CURRENT_TIMESTAMP));

-- UPA Salvador (MEDIO + DOWN expected)
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111c001-2001-2001-2001-000000000018','SAIDA','d1111111-1111-1111-1111-111111111111','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,20,DATEADD('DAY',-79,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111c002-2002-2002-2002-000000000019','SAIDA','d1111111-1111-1111-1111-111111111111','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,22,DATEADD('DAY',-51,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111c003-2003-2003-2003-000000000020','SAIDA','d1111111-1111-1111-1111-111111111111','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,20,DATEADD('DAY',-23,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1111c004-2004-2004-2004-000000000021','SAIDA','d1111111-1111-1111-1111-111111111111','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,8,DATEADD('DAY',-6,CURRENT_TIMESTAMP));

-- --------- Gaze (d333...) ---------
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333a001-3001-3001-3001-000000000022','SAIDA','d3333333-3333-3333-3333-333333333333','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,12,DATEADD('DAY',-76,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333a002-3002-3002-3002-000000000023','SAIDA','d3333333-3333-3333-3333-333333333333','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,15,DATEADD('DAY',-55,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333a003-3003-3003-3003-000000000024','SAIDA','d3333333-3333-3333-3333-333333333333','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,12,DATEADD('DAY',-13,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333a004-3004-3004-3004-000000000025','SAIDA','d3333333-3333-3333-3333-333333333333','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,12,DATEADD('DAY',-6,CURRENT_TIMESTAMP));

INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333b001-3101-3101-3101-000000000026','SAIDA','d3333333-3333-3333-3333-333333333333','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-69,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333b002-3102-3102-3102-000000000027','SAIDA','d3333333-3333-3333-3333-333333333333','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-28,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333b003-3103-3103-3103-000000000028','SAIDA','d3333333-3333-3333-3333-333333333333','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','20000000-0000-0000-0000-000000000001',50,DATEADD('DAY',-4,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1333b004-3104-3104-3104-000000000029','ENTRADA','d3333333-3333-3333-3333-333333333333','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','20000000-0000-0000-0000-000000000001',50,DATEADD('DAY',-4,CURRENT_TIMESTAMP));

-- --------- Soro fisiológico 500ml (d555...) ---------
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555a001-5001-5001-5001-000000000030','SAIDA','d5555555-5555-5555-5555-555555555555','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,20,DATEADD('DAY',-84,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555a002-5002-5002-5002-000000000031','SAIDA','d5555555-5555-5555-5555-555555555555','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,18,DATEADD('DAY',-56,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555a003-5003-5003-5003-000000000032','SAIDA','d5555555-5555-5555-5555-555555555555','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,15,DATEADD('DAY',-28,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555a004-5004-5004-5004-000000000033','SAIDA','d5555555-5555-5555-5555-555555555555','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,16,DATEADD('DAY',-7,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555a005-5005-5005-5005-000000000034','SAIDA','d5555555-5555-5555-5555-555555555555','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,14,DATEADD('DAY',-2,CURRENT_TIMESTAMP));

INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555b001-5101-5101-5101-000000000035','SAIDA','d5555555-5555-5555-5555-555555555555','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-74,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555b002-5102-5102-5102-000000000036','SAIDA','d5555555-5555-5555-5555-555555555555','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-46,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1555b003-5103-5103-5103-000000000037','SAIDA','d5555555-5555-5555-5555-555555555555','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-18,CURRENT_TIMESTAMP));

-- --------- Cateter 22G (d666...) ---------
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666a001-6001-6001-6001-000000000038','SAIDA','d6666666-6666-6666-6666-666666666666','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,8,DATEADD('DAY',-63,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666a002-6002-6002-6002-000000000039','SAIDA','d6666666-6666-6666-6666-666666666666','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,10,DATEADD('DAY',-25,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666a003-6003-6003-6003-000000000040','SAIDA','d6666666-6666-6666-6666-666666666666','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,8,DATEADD('DAY',-5,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666b001-6101-6101-6101-000000000041','SAIDA','d6666666-6666-6666-6666-666666666666','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,6,DATEADD('DAY',-80,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666b002-6102-6102-6102-000000000042','SAIDA','d6666666-6666-6666-6666-666666666666','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,6,DATEADD('DAY',-52,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1666b003-6103-6103-6103-000000000043','SAIDA','d6666666-6666-6666-6666-666666666666','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,6,DATEADD('DAY',-24,CURRENT_TIMESTAMP));

-- --------- Máscara cirúrgica (d777...) ---------
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777b001-7101-7101-7101-000000000044','SAIDA','d7777777-7777-7777-7777-777777777777','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,30,DATEADD('DAY',-64,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777b002-7102-7102-7102-000000000045','SAIDA','d7777777-7777-7777-7777-777777777777','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,25,DATEADD('DAY',-36,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777b003-7103-7103-7103-000000000046','PERDA','d7777777-7777-7777-7777-777777777777','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,10,DATEADD('DAY',-21,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777b004-7104-7104-7104-000000000047','SAIDA','d7777777-7777-7777-7777-777777777777','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',NULL,20,DATEADD('DAY',-7,CURRENT_TIMESTAMP));

INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777c001-7201-7201-7201-000000000048','SAIDA','d7777777-7777-7777-7777-777777777777','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,15,DATEADD('DAY',-59,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777c002-7202-7202-7202-000000000049','SAIDA','d7777777-7777-7777-7777-777777777777','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,12,DATEADD('DAY',-31,CURRENT_TIMESTAMP));
INSERT INTO movimentacao (id, tipo_movimentacao, id_insumo, id_unidade, id_transferencia, quantidade, timestamp) VALUES ('1777c003-7203-7203-7203-000000000050','SAIDA','d7777777-7777-7777-7777-777777777777','cccccccc-cccc-cccc-cccc-cccccccccccc',NULL,10,DATEADD('DAY',-3,CURRENT_TIMESTAMP));

-- --------- Luva M (d444...) ---------
-- Intentionally no rows -> SEM_CONSUMO
