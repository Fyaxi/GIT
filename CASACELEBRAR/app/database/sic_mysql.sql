--
-- File generated with SQLiteStudio v3.2.1 on qui jul 22 19:03:49 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;
-- ================================================================================
-- Table: atividade
CREATE TABLE atividade (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, 
  conteudo TEXT, 
  cor TEXT, 
  ordem TEXT, 
  fase_id INTEGER NOT NULL, 
  CONSTRAINT fk_atividade_fase1 FOREIGN KEY (fase_id) REFERENCES fase (id)
);

-- Index: fk_atividade_fase1_idx
CREATE INDEX fk_atividade_fase1_idx ON atividade (fase_id);

-- Index: fk_atividade_fase1_idx
CREATE INDEX fk_atividade_fase1_idx ON atividade (fase_id);
-- ================================================================================
ALTER TABLE `atividade` ADD CONSTRAINT `fk_atividade_fase1` FOREIGN KEY ( `fase_id` ) REFERENCES `fase` ( `id` ) ;
-- ================================================================================
-- Table: cidade
CREATE TABLE cidade (
  id integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, 
  codigo_ibge TEXT, 
  estado_id integer REFERENCES estado (id), 
  updated_at TIMESTAMP
);
-- ================================================================================
-- Table: conta_pagar
CREATE TABLE conta_pagar (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  dt_emissao DATE,
  dt_vencimento DATE, 
  dt_pagamento DATE, 
  forma_recebimento INT NOT NULL, 
  pessoa_id INTEGER NOT NULL, 
  valor FLOAT, 
  obs TEXT, 
  mes char (2), 
  ano char (4), 
  ativo char (1), 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_conta_receber_pessoa1 FOREIGN KEY (pessoa_id) REFERENCES pessoa (id), 
  CONSTRAINT fk_forma_recebimento FOREIGN KEY (forma_recebimento) REFERENCES forma_pagamento (id)
);

-- Index: fk_conta_receber_pessoa1_idx
CREATE INDEX fk_conta_receber_pessoa1_idx ON conta_receber (pessoa_id);
-- ================================================================================
ALTER TABLE `conta_pagar` ADD CONSTRAINT `fk_conta_pagar_pessoa1` FOREIGN KEY ( `pessoa_id` ) REFERENCES `pessoa` ( `id` ) ;
ALTER TABLE `conta_pagar` ADD CONSTRAINT `fk_forma_pagamento` FOREIGN KEY ( `forma_recebimento` ) REFERENCES `forma_pagamento` ( `id` ) ;
-- ================================================================================
-- Table: conta_receber
CREATE TABLE conta_receber (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  dt_emissao DATE, 
  dt_vencimento DATE, 
  dt_pagamento DATE, 
  forma_recebimento INT NOT NULL, 
  pessoa_id INTEGER NOT NULL, 
  valor FLOAT, 
  obs TEXT, 
  mes char (2), 
  ano char (4), 
  ativo char (1), 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_conta_receber_pessoa1 FOREIGN KEY (pessoa_id) REFERENCES pessoa (id), 
  CONSTRAINT fk_forma_recebimento FOREIGN KEY (forma_recebimento) REFERENCES forma_recebimento (id)
);

-- Index: fk_conta_receber_pessoa1_idx
CREATE INDEX fk_conta_receber_pessoa1_idx ON conta_receber (pessoa_id);
-- ================================================================================
ALTER TABLE `conta_receber` ADD CONSTRAINT `fk_conta_receber_pessoa1` FOREIGN KEY ( `pessoa_id` ) REFERENCES `pessoa` ( `id` ) ;
ALTER TABLE `conta_receber` ADD CONSTRAINT `fk_forma_recebimento` FOREIGN KEY ( `forma_recebimento` ) REFERENCES `forma_recebimento` ( `id` ) ;
-- ================================================================================
-- Table: contrato
CREATE TABLE contrato (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  cliente_id INTEGER NOT NULL, 
  tipo_contrato_id INTEGER NOT NULL, 
  ativo CHAR (1), 
  dt_inicio DATE, 
  dt_fim DATE, 
  obs TEXT, 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_contrato_pessoa1 FOREIGN KEY (cliente_id) REFERENCES pessoa (id),
  CONSTRAINT fk_contrato_tipo_contrato1 FOREIGN KEY (tipo_contrato_id) REFERENCES tipo_contrato (id)
);

-- Index: fk_contrato_pessoa1_idx
CREATE INDEX fk_contrato_pessoa1_idx ON contrato (cliente_id);

-- Index: fk_contrato_tipo_contrato1_idx
CREATE INDEX fk_contrato_tipo_contrato1_idx ON contrato (tipo_contrato_id);

-- Index: fk_contrato_tipo_contrato1_idx
CREATE INDEX fk_contrato_tipo_contrato1_idx ON contrato (tipo_contrato_id);

-- Index: fk_contrato_tipo_contrato1_idx
CREATE INDEX fk_contrato_tipo_contrato1_idx ON contrato (tipo_contrato_id);
-- ================================================================================
ALTER TABLE `contrato` ADD CONSTRAINT `fk_contrato_pessoa1` FOREIGN KEY ( `cliente_id` ) REFERENCES `pessoa` ( `id` ) ;
ALTER TABLE `contrato` ADD CONSTRAINT `fk_contrato_tipo_contrato1` FOREIGN KEY ( `tipo_contrato_id` ) REFERENCES `tipo_contrato` ( `id` ) ;
-- ================================================================================
-- Table: contrato_item
CREATE TABLE contrato_item (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  servico_id INTEGER NOT NULL, 
  contrato_id INTEGER NOT NULL, 
  valor FLOAT, 
  quantidade FLOAT, 
  total FLOAT, 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_table1_servico1 FOREIGN KEY (servico_id) REFERENCES servico (id), 
  CONSTRAINT fk_table1_contrato1 FOREIGN KEY (contrato_id) REFERENCES contrato (id)
);

-- Index: fk_table1_contrato1_idx
CREATE INDEX fk_table1_contrato1_idx ON contrato_item (contrato_id);

-- Index: fk_table1_servico1_idx
CREATE INDEX fk_table1_servico1_idx ON contrato_item (servico_id);
-- ================================================================================
ALTER TABLE `contrato_item` ADD CONSTRAINT `fk_table1_servico1` FOREIGN KEY ( `servico_id` ) REFERENCES `servico` ( `id` ) ;
ALTER TABLE `contrato_item` ADD CONSTRAINT `fk_table1_contrato1` FOREIGN KEY ( `contrato_id` ) REFERENCES `contrato` ( `id` ) ;
-- ================================================================================
-- Table: estado
CREATE TABLE estado (
  id integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, 
  uf varchar (2), 
  updated_at TIMESTAMP
);
-- ================================================================================
-- Table: evento
CREATE TABLE evento (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  inicio TIMESTAMP, 
  fim TIMESTAMP, 
  titulo TEXT, 
  descricao TEXT, 
  cor TEXT, 
  system_user_id INTEGER NOT NULL, 
  updated_at TIMESTAMP
);
-- ================================================================================
-- Table: fase
CREATE TABLE fase (
  id integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome text, 
  ordem int, 
  projeto_id int REFERENCES projeto (id)
);
-- ================================================================================
-- Table: fatura
CREATE TABLE fatura (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  cliente_id INTEGER NOT NULL, 
  dt_fatura DATE, 
  total FLOAT, 
  financeiro_gerado CHAR (1), 
  mes char (2), 
  ano char (4), 
  ativo char (1), 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_fatura_pessoa1 FOREIGN KEY (cliente_id) REFERENCES pessoa (id)
);

-- Index: fk_fatura_pessoa1_idx
CREATE INDEX fk_fatura_pessoa1_idx ON fatura (cliente_id);
-- ================================================================================
ALTER TABLE `fatura` ADD CONSTRAINT `fk_fatura_pessoa1` FOREIGN KEY ( `cliente_id` ) REFERENCES `pessoa` ( `id` ) ;
-- ================================================================================
-- Table: fatura_conta_receber
CREATE TABLE fatura_conta_receber (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  fatura_id int REFERENCES fatura (id), 
  conta_receber_id int REFERENCES conta_receber (id)
);
-- ================================================================================
ALTER TABLE `fatura_conta_receber` ADD CONSTRAINT `fk_fatura_id` FOREIGN KEY ( `fatura_id` ) REFERENCES `fatura` ( `id` ) ;
ALTER TABLE `fatura_conta_receber` ADD CONSTRAINT `fk_conta_receber_id` FOREIGN KEY ( `conta_receber_id` ) REFERENCES `contas_receber` ( `id` ) ;
-- ================================================================================
-- Table: fatura_item
CREATE TABLE fatura_item (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  servico_id INTEGER NOT NULL, 
  fatura_id INTEGER NOT NULL, 
  valor FLOAT, 
  quantidade FLOAT, 
  total FLOAT, 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_fatura_item_servico1 FOREIGN KEY (servico_id) REFERENCES servico (id), 
  CONSTRAINT fk_fatura_item_fatura1 FOREIGN KEY (fatura_id) REFERENCES fatura (id)
);
-- ================================================================================
ALTER TABLE `fatura_item` ADD CONSTRAINT `fk_fatura_item_servico1` FOREIGN KEY ( `servico_id` ) REFERENCES `servico` ( `id` ) ;
ALTER TABLE `fatura_item` ADD CONSTRAINT `fk_fatura_item_fatura1` FOREIGN KEY ( `fatura_id` ) REFERENCES `fatura` ( `id` ) ;
-- ================================================================================
-- Table: forma_pagamento
CREATE TABLE forma_pagamento (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT
);
-- ================================================================================
-- Table: forma_recebimento
CREATE TABLE forma_recebimento (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  nome TEXT
);
-- ================================================================================
-- Table: grupo
CREATE TABLE grupo (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT
);-- ================================================================================

-- Table: papel
CREATE TABLE papel (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT
);
-- ================================================================================
-- Table: pessoa
CREATE TABLE pessoa (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, nome_fantasia TEXT, tipo CHAR (1), 
  codigo_nacional TEXT, codigo_estadual TEXT, 
  codigo_municipal TEXT, 
  fone TEXT, 
  email TEXT, 
  observacao TEXT, 
  cep TEXT, 
  logradouro TEXT, 
  numero TEXT, c
  complemento TEXT, 
  bairro TEXT, 
  cidade_id INTEGER NOT NULL, 
  grupo_id INTEGER NOT NULL, 
  created_at TIMESTAMP, 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_pessoa_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id), 
  CONSTRAINT fk_pessoa_grupo1 FOREIGN KEY (grupo_id) REFERENCES grupo (id)
);

-- Index: fk_pessoa_cidade_idx
CREATE INDEX fk_pessoa_cidade_idx ON pessoa (cidade_id);

-- Index: fk_pessoa_grupo1_idx
CREATE INDEX fk_pessoa_grupo1_idx ON pessoa (grupo_id);
-- ================================================================================
ALTER TABLE `pessoa` ADD CONSTRAINT `fk_pessoa_cidade` FOREIGN KEY ( `cidade_id` ) REFERENCES `cidade` ( `id` ) ;
ALTER TABLE `pessoa` ADD CONSTRAINT `fk_pessoa_grupo1` FOREIGN KEY ( `grupo_id` ) REFERENCES `grupo` ( `id` ) ;
-- ================================================================================
-- Table: pessoa_papel
CREATE TABLE pessoa_papel(
  id INTEGER,
  pessoa_id INTEGER NOT NULL,
  papel_id INTEGER NOT NULL,
  CONSTRAINT fk_pessoa_has_papel_pessoa1 FOREIGN KEY(pessoa_id) REFERENCES pessoa(id),
  CONSTRAINT fk_pessoa_has_papel_papel1 FOREIGN KEY(papel_id) REFERENCES papel(id)
);

-- Index: fk_pessoa_has_papel_papel1_idx
CREATE INDEX fk_pessoa_has_papel_papel1_idx ON pessoa_papel (papel_id);

-- Index: fk_pessoa_has_papel_pessoa1_idx
CREATE INDEX fk_pessoa_has_papel_pessoa1_idx ON pessoa_papel (pessoa_id);
-- ================================================================================
ALTER TABLE `pessoa_papel` ADD CONSTRAINT `fk_pessoa_has_papel_papel1_idx` FOREIGN KEY ( `pessoa_id` ) REFERENCES `pessoa` ( `id` ) ;
ALTER TABLE `pessoa_papel` ADD CONSTRAINT `fk_pessoa_has_papel_pessoa1_idx` FOREIGN KEY ( `papel_id` ) REFERENCES `papel` ( `id` ) ;
-- ================================================================================
-- Table: produto
CREATE TABLE produto (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, 
  valor FLOAT, 
  tipo_servico_id INTEGER NOT NULL, 
  estoque INT DEFAULT (0), 
  ativo CHAR (1), 
  created_at TIMESTAMP, 
  updated_at TIMESTAMP, 
  CONSTRAINT fk_servico_tipo_servico1 FOREIGN KEY (tipo_servico_id) REFERENCES tipo_servico (id)
);
-- ================================================================================
ALTER TABLE `produto` ADD CONSTRAINT `fk_servico_tipo_produto1` FOREIGN KEY ( `tipo_servico_id` ) REFERENCES `tipo_servico` ( `id` ) ;
-- ================================================================================
-- Table: projeto
CREATE TABLE projeto (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  nome TEXT
);
-- ================================================================================
-- Table: projeto_usuario
CREATE TABLE projeto_usuario (
	id integer primary key not null,
	projeto_id int references projeto(id),
	system_user_id int
);
-- ================================================================================
ALTER TABLE `projeto_usuario` ADD CONSTRAINT `fk_projeto_usuario` FOREIGN KEY ( `projeto_id` ) REFERENCES `projeto` ( `id` ) ;
-- ================================================================================
-- Table: servico
CREATE TABLE servico (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT, 
  valor FLOAT, 
  tipo_servico_id INTEGER NOT NULL, 
  ativo CHAR (1), 
  CONSTRAINT fk_servico_tipo_servico1 FOREIGN KEY (tipo_servico_id) REFERENCES tipo_servico (id)
);

-- Index: fk_servico_tipo_servico1_idx
CREATE INDEX fk_servico_tipo_servico1_idx ON servico (tipo_servico_id);
-- ================================================================================
ALTER TABLE `servico` ADD CONSTRAINT `fk_servico_tipo_servico1` FOREIGN KEY ( `tipo_servico_id` ) REFERENCES `tipo_servico` ( `id` ) ;
-- ================================================================================
-- Table: tipo_contrato
CREATE TABLE tipo_contrato (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome TEXT
);
-- ================================================================================
-- Table: tipo_produto
CREATE TABLE tipo_produto (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome VARCHAR (45), 
  created_at TIMESTAMP, 
  updated_at TIMESTAMP
);
-- ================================================================================
-- Table: tipo_servico
CREATE TABLE tipo_servico (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  nome VARCHAR (45)
);
-- ================================================================================
-- Table: venda
CREATE TABLE venda (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  cliente_id INTEGER NOT NULL, 
  dt_fatura DATE, 
  total FLOAT, 
  financeiro_gerado CHAR (1), 
  mes char (2), 
  ano char (4), 
  ativo char (1), 
  CONSTRAINT fk_fatura_pessoa1 FOREIGN KEY (cliente_id) REFERENCES pessoa (id)
);

-- Index: fk_fatura_pessoa1_idx
CREATE INDEX fk_fatura_pessoa1_idx ON venda (cliente_id);
-- ================================================================================
ALTER TABLE `venda` ADD CONSTRAINT `fk_venda_pessoa1` FOREIGN KEY ( `cliente_id` ) REFERENCES `pessoa` ( `id` ) ;
-- ================================================================================
-- Table: venda_conta_receber
CREATE TABLE venda_conta_receber (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  fatura_id int REFERENCES venda (id), 
  conta_receber_id int REFERENCES conta_receber (id)
);
-- ================================================================================
ALTER TABLE `venda_conta_receber` ADD CONSTRAINT `fk_venda_fatura_r` FOREIGN KEY ( `fatura_id` ) REFERENCES `venda` ( `id` ) ;
ALTER TABLE `venda_conta_receber` ADD CONSTRAINT `fk_venda_conta_receber` FOREIGN KEY ( `conta_receber_id` ) REFERENCES `conta_receber` ( `id` ) ;
-- ================================================================================
-- Table: venda_item
CREATE TABLE venda_item (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  servico_id INTEGER NOT NULL, 
  fatura_id INTEGER NOT NULL, 
  valor FLOAT, 
  quantidade FLOAT, 
  total FLOAT,
  CONSTRAINT fk_fatura_item_servico1 FOREIGN KEY (servico_id) REFERENCES produto (id), 
  CONSTRAINT fk_fatura_item_fatura1 FOREIGN KEY (fatura_id) REFERENCES venda (id)
);

-- Index: fk_fatura_item_fatura1_idx
CREATE INDEX fk_fatura_item_fatura1_idx ON fatura_item (fatura_id);

-- Index: fk_fatura_item_servico1_idx
CREATE INDEX fk_fatura_item_servico1_idx ON fatura_item (servico_id);
-- ================================================================================
ALTER TABLE `venda_item` ADD CONSTRAINT `fk_fatura_item_servico1` FOREIGN KEY ( `servico_id` ) REFERENCES `produto` ( `id` ) ;
ALTER TABLE `venda_item` ADD CONSTRAINT `fk_fatura_item_fatura1` FOREIGN KEY ( `fatura_id` ) REFERENCES `venda` ( `id` ) ;
-- ================================================================================

-- View: view_contratos
CREATE VIEW view_contratos AS
SELECT contrato.id as "contrato_id",
       contrato.cliente_id,
       contrato.tipo_contrato_id,
       contrato.dt_inicio,
       contrato.dt_fim,
       tipo_contrato.nome as "tipo_contrato",
       pessoa.nome as "nome_cliente",
       cidade.nome as "cidade",
       estado.uf as "uf",
       estado.nome as "nome_estado",
       grupo.nome as "nome_grupo",
       ativo as "ativo",
       (SELECT sum(total) FROM contrato_item where contrato_id = contrato.id) as "total"
  FROM contrato, tipo_contrato, pessoa, cidade, estado, grupo
 WHERE contrato.tipo_contrato_id = tipo_contrato.id
   AND contrato.cliente_id = pessoa.id
   AND pessoa.cidade_id = cidade.id
   AND cidade.estado_id = estado.id
   AND pessoa.grupo_id = grupo.id;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
