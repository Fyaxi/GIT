-- BANCO MODELO CRIADO
-- C:\xampp\htdocs\sic\backup_db\jairob58_casacelebrar_zerado(NO_VIEW).sql
-- C:\xampp\htdocs\sic\_scripts\zeraBanco.sql
-- 6a76700062f21708c3e6891a84fd464b3359426a7d0f4aac6861b4b2e26b1001

-- -----------------------------------------------------------------------------------------------------------------------------
-- update 01 solução para o valor da quantidade dos itens nos contratos
ALTER TABLE `contrato_item` CHANGE `total` `total` DECIMAL(10,2) NULL DEFAULT NULL;
ALTER TABLE `decoracao_item` CHANGE `total` `total` DECIMAL(10,2) NULL DEFAULT NULL;

ALTER TABLE `contrato` CHANGE `ValorTotal` `ValorTotal` DECIMAL(10,2) NOT NULL;
ALTER TABLE `decoracao` CHANGE `ValorTotal` `ValorTotal` DECIMAL(10,2) NOT NULL;

ALTER TABLE `contrato_item` CHANGE `quantidade` `quantidade` DECIMAL(10,2) NULL DEFAULT NULL;
ALTER TABLE `decoracao_item` CHANGE `quantidade` `quantidade` DECIMAL(10,2) NULL DEFAULT NULL;

-- update 02 - Correção nas formas de recebimento para exibição nas telas (25/04)
UPDATE `forma_pagamento` SET `ativo` = 'Y' WHERE `forma_pagamento`.`id` = 1;
UPDATE `forma_recebimento` SET `ativo` = 'Y' WHERE `forma_recebimento`.`id` = 1;

-- update 03 - Correção na view de festa e decoração. alteração do nome do (cliente) para (nome_fantasia).
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

-- update 04 - ViewReceber - Atualização referente ao relatório apra emissão de recibo de pagamento. (ULTIMO UPDATE NO BANCO QUENTE)
DROP TABLE IF EXISTS `view_conta_receber`;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `view_conta_receber`  AS 
SELECT 
`conta_receber`.`id` AS `ReceberId`,
`conta_receber`.`dt_emissao` AS `dt_emissao`,
`conta_receber`.`dt_vencimento` AS `dt_vencimento`,
`conta_receber`.`dt_pagamento` AS `dt_pagamento`,
`conta_receber`.`pessoa_id` AS `pessoa_id`,
`conta_receber`.`VendedorID` AS `VendedorID`,
`conta_receber`.`valor` AS `valor`,
`conta_receber`.`desconto` AS `desconto`,
`conta_receber`.`valor_total` AS `valor_total`,
`conta_receber`.`obs` AS `obs`,
`conta_receber`.`mes` AS `mes`,
`conta_receber`.`ano` AS `ano`,
`conta_receber`.`ativo` AS `ativo`,
`conta_receber`.`origem` AS `origem`,
`conta_receber`.`id_caixa` AS `id_caixa`,
`pessoa`.`nome_fantasia` AS `nome_cliente`, 
`forma_recebimento`.`nome` AS `FormaRecebimentoEntrada`
FROM ((`conta_receber` join `forma_recebimento`) join `pessoa`) 
WHERE `conta_receber`.`forma_recebimento` = `forma_recebimento`.`id` 
AND `conta_receber`.`pessoa_id` = `pessoa`.`id`;