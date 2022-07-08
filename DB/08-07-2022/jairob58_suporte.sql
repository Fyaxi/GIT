-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 08-Jul-2022 às 17:51
-- Versão do servidor: 5.6.41-84.1
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jairob58_suporte`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `category`
--

INSERT INTO `category` (`id`, `description`) VALUES
(1, 'Bug'),
(2, 'New feature'),
(3, 'Improvement'),
(4, 'Task'),
(5, 'Support');

-- --------------------------------------------------------

--
-- Estrutura da tabela `issue`
--

CREATE TABLE `issue` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_priority` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `register_date` date NOT NULL,
  `close_date` date DEFAULT NULL,
  `issue_time` char(5) DEFAULT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `solution` text,
  `file` text,
  `close_time` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `issue`
--

INSERT INTO `issue` (`id`, `id_user`, `id_status`, `id_project`, `id_priority`, `id_category`, `id_member`, `register_date`, `close_date`, `issue_time`, `title`, `description`, `solution`, `file`, `close_time`) VALUES
(1, 1, 1, 2, 2, 1, NULL, '2021-07-18', NULL, '19:55', 'Envio de e-mail após abrir tópico', '<p>Após a abertuda do chamado, o e-mail automatico não é enviado.</p><p>Acusando erro de conexão ao host.</p>', NULL, NULL, NULL),
(2, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '00:25', 'Tabela itens por festa', '<p style=\"line-height: 1;\">Verificar com o Luan qual é a tabela de itens de festas / decoação de acordo com o número de convidados.</p><p style=\"line-height: 1;\"><b style=\"background-color: rgb(255, 255, 0);\">Exemplo:</b></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\">Festa 50 Convidados = X Itens / Valor</span></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\">Festa 100 Convidados = XX Itens / Valor</span></p>', NULL, NULL, NULL),
(3, 1, 1, 3, 2, 2, NULL, '2022-03-08', NULL, '00:29', 'Funcionalidade para gerar pagamento de colaboradores', '<p style=\"line-height: 1;\">Melhoria proposta por Matias</p><p style=\"line-height: 1;\">Criar funcionalidade para gerar de forma automatica a conta a pagar de pagamento dos colaboradores.</p><p style=\"line-height: 1;\">Funcionalidade semelhante ao gerar Pagamento / Recebimento.</p>', NULL, NULL, NULL),
(4, 1, 1, 3, 2, 2, NULL, '2022-03-08', NULL, '00:33', 'Funcionalidade no dashboard para trazer EVENTOS não finalizadas', '<p style=\"line-height: 1;\">Melhoria posta por Matias.</p><p style=\"line-height: 1;\">Ser adicionado no dashboard da festa / decoração uma listagem de eventos não finalizados.</p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\"><b>Exemplo:</b></span></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\">Na listagem fazer a verificação de qual festa está inativa e teve financeiro gerado. </span></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\">Nessa situação caracteriza-se uma prospecção.</span></p>', NULL, NULL, NULL),
(5, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '00:39', 'Relatório de clientes que não realizam festas por X meses', '<p style=\"line-height: 1;\">Melhoria posta por Matias.</p><p style=\"line-height: 1;\">Ser desernvolvido um relatório com a listagem de clientes que não realizam nenhum evento a mais de X meses.</p><p style=\"line-height: 1;\">Podendo ser separado por festas e decorações.</p>', NULL, NULL, NULL),
(6, 1, 1, 3, 4, 3, NULL, '2022-03-08', NULL, '00:43', 'Relatório para imprimir os contratos dos eventos', '<p style=\"line-height: 1;\">Criar um relatório para puxar as informações de uma festa em especifico <b>(funcionalidae pode ficar disponível no campo de ações na list do form) </b></p><p style=\"line-height: 1;\">Nessa visualização ser organizado um relatório contendo as informações presentes nos itens dos eventos.</p><p style=\"line-height: 1;\">Verificar com o luan algum modelo já utilizado por ele no sistema antigo.</p>', NULL, NULL, NULL),
(7, 1, 1, 3, 4, 2, NULL, '2022-03-08', NULL, '00:55', 'Criar recibo para de movimentações de pagamento e recebimentos', '<p style=\"line-height: 1;\">Criar um relatório com modelo para RECIBO para comprovação de pagamentos e recebimentos.</p><p style=\"line-height: 1;\"><b style=\"background-color: rgb(255, 255, 0);\">Exemplo:</b></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\">Formato Matricial e Formato A4</span></p>', NULL, NULL, NULL),
(8, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '01:06', 'Criar vinculo de EVENTO com colaboradores (Oriundo Ticket 3)', '<p style=\"line-height: 1;\">Criar uma listagem de colaboradores com vinculo em eventos, o intuito dessa tela é listar os pagamentos a serem feitos de forma que facilite a visualização.</p><p style=\"line-height: 1;\"><b style=\"background-color: rgb(255, 255, 0);\">Exemplo:</b></p><p style=\"line-height: 1;\"><span style=\"background-color: rgb(255, 255, 0);\"><b>Nome / Telefone / Chave PIX</b></span></p>', NULL, NULL, NULL),
(9, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '02:37', 'Melhoria nos filtros na tela recebimento e pagamento', '<p style=\"line-height: 1;\">Ser adicionado nos filtros na pagina os seguintes filtros de pesquisa:</p><ol><li style=\"line-height: 1;\"><b>Emissão</b></li><li style=\"line-height: 1;\"><b>Vencimento</b></li><li style=\"line-height: 1;\"><b>Pagmaento</b><br></li></ol><p style=\"line-height: 1;\">Contendo data de inicio e final das datas.</p>', NULL, NULL, NULL),
(10, 1, 1, 3, 2, 3, NULL, '2022-03-08', NULL, '02:42', 'Melhoria nos filtros na tela de EVENTOS', '<p>Ser adicionado ao filtros de pesquisa da página a possibilidade do ususário fazer a busca pelo campo data evento.</p>', NULL, NULL, NULL),
(11, 1, 1, 3, 3, 3, NULL, '2022-03-08', NULL, '03:10', 'Melhoria na tela de EVENTOS ao salvar itens', '<p style=\"line-height: 1;\">Melhoria no ato de salvar o <b>EVENTO</b>, para fazer com que o sistema verifique se há um faturamento já gerado.</p><p style=\"line-height: 1;\">Caso <b>NÃO</b>, permitir que o <b>EVENTO</b> seja editado.</p><p style=\"line-height: 1;\">Caso <b>SIM</b>, sistema deve exibir uma mensagem informado para o ususário que não é possível alterar.</p>', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `id_issue` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `note` text,
  `register_date` date DEFAULT NULL,
  `register_time` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `priority`
--

INSERT INTO `priority` (`id`, `description`) VALUES
(1, 'Low'),
(2, 'Normal'),
(3, 'High'),
(4, 'Urgent');

-- --------------------------------------------------------

--
-- Estrutura da tabela `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `project`
--

INSERT INTO `project` (`id`, `description`) VALUES
(1, 'Sistema Integrado - ERP'),
(2, 'Sistema Integrado - SUPORTE'),
(3, 'CASA CELEBRAR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `project_member`
--

CREATE TABLE `project_member` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `project_member`
--

INSERT INTO `project_member` (`id`, `project_id`, `member_id`) VALUES
(5, 1, 1),
(6, 1, 2),
(7, 1, 4),
(8, 2, 1),
(9, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `final_state` char(1) DEFAULT NULL,
  `color` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id`, `description`, `final_state`, `color`) VALUES
(1, 'New', 'N', '#4d993a'),
(2, 'In progress', 'N', NULL),
(3, 'Waiting feedback', 'N', '#ff8514'),
(4, 'Resolved', 'N', NULL),
(5, 'Testing', 'N', NULL),
(6, 'Deploy', 'N', NULL),
(7, 'Closed', 'Y', '#5761ba'),
(8, 'Rejected', 'Y', '#ff1414');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_priority` (`id_priority`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_status` (`id_status`);

--
-- Índices para tabela `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_issue` (`id_issue`);

--
-- Índices para tabela `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Índices para tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`id_priority`) REFERENCES `priority` (`id`),
  ADD CONSTRAINT `issue_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `issue_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`);

--
-- Limitadores para a tabela `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_issue`) REFERENCES `issue` (`id`);

--
-- Limitadores para a tabela `project_member`
--
ALTER TABLE `project_member`
  ADD CONSTRAINT `project_member_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
