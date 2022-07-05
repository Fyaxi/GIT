-- ------------------------------------------------------------------------------
-- SCRIPT ZERA BANCO MYSQL
-- ------------------------------------------------------------------------------
-- PESSOA
TRUNCATE pessoa;
ALTER TABLE pessoa AUTO_INCREMENT = 1;

-- EMPRESA
TRUNCATE empresa;
ALTER TABLE empresa AUTO_INCREMENT = 1;

-- PESSOA
TRUNCATE caixa;
ALTER TABLE pessoa AUTO_INCREMENT = 1;

-- GRUPO
TRUNCATE grupo;
ALTER TABLE grupo AUTO_INCREMENT = 1;

-- PEPEL
TRUNCATE papel;
ALTER TABLE papel AUTO_INCREMENT = 1;

-- PESSOA PAPEL
TRUNCATE pessoa_papel;
ALTER TABLE pessoa_papel AUTO_INCREMENT = 1;

-- PRODUTO
TRUNCATE produto;
TRUNCATE tipo_produto;
ALTER TABLE produto AUTO_INCREMENT = 1;
ALTER TABLE tipo_produto AUTO_INCREMENT = 1;

-- VENDAS
TRUNCATE venda;
TRUNCATE venda_item;
TRUNCATE venda_conta_receber;
ALTER TABLE venda AUTO_INCREMENT = 1;
ALTER TABLE venda_item AUTO_INCREMENT = 1;
ALTER TABLE venda_conta_receber AUTO_INCREMENT = 1;

-- PRODUÇÃO
TRUNCATE producao;
TRUNCATE producao_item;
TRUNCATE producao_conta_pagar;
ALTER TABLE producao AUTO_INCREMENT = 1;
ALTER TABLE producao_item AUTO_INCREMENT = 1;
ALTER TABLE producao_conta_pagar AUTO_INCREMENT = 1;

-- SERVIÇO
TRUNCATE servico;
TRUNCATE tipo_servico;
ALTER TABLE servico AUTO_INCREMENT = 1;
ALTER TABLE tipo_servico AUTO_INCREMENT = 1;

-- CONTRATO
TRUNCATE contrato;
TRUNCATE contrato_item;
TRUNCATE tipo_contrato;
ALTER TABLE contrato AUTO_INCREMENT = 1;
ALTER TABLE contrato_item AUTO_INCREMENT = 1;
ALTER TABLE tipo_contrato AUTO_INCREMENT = 1;

-- FATURA
TRUNCATE fatura;
TRUNCATE fatura_item;
TRUNCATE fatura_conta_receber;
ALTER TABLE fatura AUTO_INCREMENT = 1;
ALTER TABLE fatura_item AUTO_INCREMENT = 1;
ALTER TABLE fatura_conta_receber AUTO_INCREMENT = 1;

-- CONTA PAGAR
TRUNCATE conta_pagar;
ALTER TABLE conta_pagar AUTO_INCREMENT = 1;

-- FORMA PAGAMENTO
TRUNCATE forma_pagamento;
ALTER TABLE forma_pagamento AUTO_INCREMENT = 1;
INSERT INTO `forma_pagamento`(`nome`) VALUES ('DIVIDIR PAGAMENTO');

-- CONTA RECEBER
TRUNCATE conta_receber;
ALTER TABLE conta_receber AUTO_INCREMENT = 1;

-- FORMA RECEBIMENTO
TRUNCATE forma_recebimento;
ALTER TABLE forma_recebimento AUTO_INCREMENT = 1;
INSERT INTO `forma_recebimento`(`nome`) VALUES ('DIVIDIR RECEBIMENTO');

-- CONTA RECEBER PG
TRUNCATE conta_receber_pg;
ALTER TABLE conta_receber AUTO_INCREMENT = 1;

-- CAIXA
TRUNCATE caixa;
ALTER TABLE caixa AUTO_INCREMENT = 1;

-- CAIXA MOV
TRUNCATE caixa_mov;
ALTER TABLE caixa_mov AUTO_INCREMENT = 1;

-- CAIXA MOV PG
TRUNCATE caixa_mov_pg;
ALTER TABLE caixa_mov_pg AUTO_INCREMENT = 1;

-- EVENTO
TRUNCATE evento;
ALTER TABLE evento AUTO_INCREMENT = 1;

-- FAVORECIDOR
TRUNCATE favorecido;
ALTER TABLE favorecido AUTO_INCREMENT = 1;


-- ------------------------------------------------------------------------------
-- SCRIPT ZERA BANCO MYSQL
-- ------------------------------------------------------------------------------
-- EMPRESA
-- TRUNCATE empresa;
-- ALTER TABLE empresa AUTO_INCREMENT = 1;

-- GRUPO
-- TRUNCATE grupo;
-- ALTER TABLE grupo AUTO_INCREMENT = 1;

-- PEPEL
-- TRUNCATE papel;
-- ALTER TABLE papel AUTO_INCREMENT = 1;

-- FORMA RECEBIMENTO
-- TRUNCATE forma_recebimento;
-- INSERT INTO `forma_recebimento`(`nome`) VALUES ('DINHEIRO');
-- ALTER TABLE forma_recebimento AUTO_INCREMENT = 2;

-- FORMA PAGAMENTO
-- TRUNCATE forma_pagamento;
-- INSERT INTO `forma_pagamento`(`nome`) VALUES ('DINHEIRO');
-- ALTER TABLE forma_pagamento AUTO_INCREMENT = 2;

-- FATURA CONTA RECEBER
TRUNCATE fatura_conta_receber;
ALTER TABLE fatura_conta_receber AUTO_INCREMENT = 1;

-- FATURA ITEM
TRUNCATE fatura_item;
ALTER TABLE fatura_item AUTO_INCREMENT = 1;

-- EVENTO
TRUNCATE evento;
ALTER TABLE evento AUTO_INCREMENT = 1;

-- DECORAÇÃO ITEM
TRUNCATE decoracao_item;
ALTER TABLE decoracao_item AUTO_INCREMENT = 1;

-- DECORAÇÃO
TRUNCATE decoracao;
ALTER TABLE decoracao AUTO_INCREMENT = 1;

-- FESTA ITEM
TRUNCATE contrato_item;
ALTER TABLE contrato_item AUTO_INCREMENT = 1;

-- FESTA
TRUNCATE contrato;
ALTER TABLE contrato AUTO_INCREMENT = 1;

-- PESSOA PAPEL
TRUNCATE pessoa_papel;
ALTER TABLE papel AUTO_INCREMENT = 1;

-- PRODUÇÃO CONTA PAGAR
TRUNCATE producao_conta_pagar;
ALTER TABLE producao_conta_pagar AUTO_INCREMENT = 1;

-- PRODUÇÃO ITEM
TRUNCATE producao_item;
ALTER TABLE producao_item AUTO_INCREMENT = 1;

-- PRODUCAO
TRUNCATE producao;
ALTER TABLE producao AUTO_INCREMENT = 1;

-- TIPO CONTRATO / FESTA
TRUNCATE tipo_contrato;
ALTER TABLE tipo_contrato AUTO_INCREMENT = 1;

-- TIPO DECORAÇÃO
TRUNCATE tipo_decoracao;
ALTER TABLE tipo_decoracao AUTO_INCREMENT = 1;

-- TIPO SERVIÇO
TRUNCATE tipo_servico;
ALTER TABLE tipo_servico AUTO_INCREMENT = 1;

-- TIPO DECORAÇÃO
TRUNCATE tipo_decoracao;
ALTER TABLE tipo_decoracao AUTO_INCREMENT = 1;

-- VENDA CONTA RECEBER
TRUNCATE venda_conta_receber;
ALTER TABLE venda_conta_receber AUTO_INCREMENT = 1;

-- VENDA ITEM
TRUNCATE venda_item;
ALTER TABLE venda_item AUTO_INCREMENT = 1;

-- VENDA
TRUNCATE venda;
ALTER TABLE venda AUTO_INCREMENT = 1;

-- VENDA CAIXA ITEM
TRUNCATE venda_caixa_item;
ALTER TABLE venda AUTO_INCREMENT = 1;

-- VENDA CAIXA
TRUNCATE venda_caixa;
ALTER TABLE venda AUTO_INCREMENT = 1;

-- CAIXA MOV PG
TRUNCATE caixa_mov_pg;
ALTER TABLE caixa_mov_pg AUTO_INCREMENT = 1;

-- CAIXA MOV
TRUNCATE caixa_mov;
ALTER TABLE caixa_mov AUTO_INCREMENT = 1;

-- CAIXA
TRUNCATE caixa;
ALTER TABLE caixa AUTO_INCREMENT = 1;

-- FATURA
TRUNCATE fatura;
ALTER TABLE fatura AUTO_INCREMENT = 1;

-- CONTA RECEBER PG
TRUNCATE conta_receber_pg;
ALTER TABLE conta_receber_pg AUTO_INCREMENT = 1;

-- CONTA RECEBER PG
TRUNCATE conta_pagar_pg;
ALTER TABLE conta_receber_pg AUTO_INCREMENT = 1;

-- CONTA A RECEBER
TRUNCATE conta_receber;
ALTER TABLE conta_receber AUTO_INCREMENT = 1;

-- CONTA A RECEBER
TRUNCATE conta_pagar;
ALTER TABLE conta_receber AUTO_INCREMENT = 1;

-- COLABORADOR
TRUNCATE colaboradores;
ALTER TABLE colaboradores AUTO_INCREMENT = 1;

-- FAVORECIDO
TRUNCATE favorecido;
ALTER TABLE favorecido AUTO_INCREMENT = 1;

-- PESSOA
TRUNCATE pessoa;
ALTER TABLE pessoa AUTO_INCREMENT = 1;

-- SERVIÇO
TRUNCATE servico;
ALTER TABLE servico AUTO_INCREMENT = 1;

-- PRODUTO
TRUNCATE produto;
ALTER TABLE produto AUTO_INCREMENT = 1;

-- TIPO PRODUTO
TRUNCATE tipo_produto;
ALTER TABLE tipo_produto AUTO_INCREMENT = 1;

-- PROJETO USUARIO
TRUNCATE projeto_usuario;
ALTER TABLE projeto_usuario AUTO_INCREMENT = 1;

-- PROJETO
TRUNCATE projeto;
ALTER TABLE projeto AUTO_INCREMENT = 1;

-- ATIVIDADE
TRUNCATE atividade;
ALTER TABLE projeto AUTO_INCREMENT = 1;
-- ------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------
-- SCRIPT ZERA BANCO MYSQL VIEWS
-- ------------------------------------------------------------------------------

DROP TABLE IF EXISTS `view_decoracao`;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `view_decoracao`  AS 
SELECT 
`decoracao`.`id` AS `contrato_id`, 
`decoracao`.`cliente_id` AS `cliente_id`, 
`decoracao`.`tipo_contrato_id` AS `tipo_contrato_id`, 
`decoracao`.`dt_inicio` AS `dt_inicio`, 
`decoracao`.`dt_fim` AS `dt_fim`, 
`tipo_decoracao`.`nome` AS `tipo_contrato`, 
`pessoa`.`nome_fantasia` AS `nome_cliente`, 
`cidade`.`nome` AS `cidade`, 
`estado`.`uf` AS `uf`, 
`estado`.`nome` AS `nome_estado`, 
`grupo`.`nome` AS `nome_grupo`, 
`decoracao`.`ativo` AS `ativo`, 
`decoracao`.`valor` AS `total` 
FROM (((((`decoracao` join `tipo_decoracao`) join `pessoa`) join `cidade`) join `estado`) join `grupo`) 
WHERE `decoracao`.`tipo_contrato_id` = `tipo_decoracao`.`id` 
AND `decoracao`.`cliente_id` = `pessoa`.`id` 
AND `pessoa`.`cidade_id` = `cidade`.`id` 
AND `cidade`.`estado_id` = `estado`.`id` 
AND `pessoa`.`grupo_id` = `grupo`.`id` ;


DROP TABLE IF EXISTS `view_contrato`;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `view_contrato`  AS 
SELECT 
`contrato`.`id` AS `contrato_id`,  
`contrato`.`cliente_id` AS `cliente_id`, 
`contrato`.`tipo_contrato_id` AS `tipo_contrato_id`, 
`contrato`.`dt_inicio` AS `dt_inicio`, 
`contrato`.`dt_fim` AS `dt_fim`, 
`tipo_contrato`.`nome` AS `tipo_contrato`, 
`pessoa`.`nome_fantasia` AS `nome_cliente`, 
`cidade`.`nome` AS `cidade`, 
`estado`.`uf` AS `uf`, 
`estado`.`nome` AS `nome_estado`, 
`grupo`.`nome` AS `nome_grupo`, 
`contrato`.`ativo` AS `ativo`, 
`contrato`.`valor` AS `total` 
FROM (((((`contrato` join `tipo_contrato`) join `pessoa`) join `cidade`) join `estado`) join `grupo`) 
WHERE `contrato`.`tipo_contrato_id` = `tipo_contrato`.`id` 
AND `contrato`.`cliente_id` = `pessoa`.`id` 
AND `pessoa`.`cidade_id` = `cidade`.`id` 
AND `cidade`.`estado_id` = `estado`.`id` 
AND `pessoa`.`grupo_id` = `grupo`.`id` ;