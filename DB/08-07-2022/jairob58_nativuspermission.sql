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
-- Banco de dados: `jairob58_nativuspermission`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group`
--

CREATE TABLE `system_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_group`
--

INSERT INTO `system_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Standard');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group_program`
--

CREATE TABLE `system_group_program` (
  `id` int(11) NOT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_group_program`
--

INSERT INTO `system_group_program` (`id`, `system_group_id`, `system_program_id`) VALUES
(12, 2, 10),
(13, 2, 12),
(14, 2, 13),
(15, 2, 16),
(16, 2, 17),
(17, 2, 18),
(18, 2, 19),
(19, 2, 20),
(21, 2, 22),
(22, 2, 23),
(23, 2, 24),
(24, 2, 25),
(29, 2, 30),
(30, 1, 1),
(31, 1, 2),
(32, 1, 3),
(33, 1, 4),
(34, 1, 5),
(35, 1, 6),
(36, 1, 7),
(37, 1, 8),
(38, 1, 9),
(39, 1, 10),
(40, 1, 11),
(41, 1, 12),
(42, 1, 13),
(43, 1, 14),
(44, 1, 15),
(45, 1, 16),
(46, 1, 17),
(47, 1, 18),
(48, 1, 19),
(49, 1, 20),
(50, 1, 21),
(51, 1, 22),
(52, 1, 23),
(53, 1, 24),
(54, 1, 25),
(55, 1, 26),
(56, 1, 27),
(57, 1, 28),
(58, 1, 29),
(59, 1, 30),
(60, 1, 31),
(61, 1, 32),
(62, 1, 33),
(63, 1, 34),
(64, 1, 35),
(65, 1, 36),
(66, 1, 37),
(67, 1, 38),
(68, 1, 39),
(69, 1, 40),
(70, 1, 41),
(71, 1, 42),
(72, 1, 43),
(73, 1, 44),
(74, 1, 45),
(75, 1, 46),
(76, 1, 47),
(77, 1, 48),
(78, 1, 49),
(79, 1, 50),
(80, 1, 51),
(81, 1, 52),
(82, 1, 53),
(83, 1, 54),
(84, 1, 55),
(85, 1, 56),
(86, 1, 57),
(87, 1, 58),
(88, 1, 59),
(89, 1, 60),
(90, 1, 61),
(91, 1, 62),
(92, 1, 63),
(93, 1, 64),
(94, 1, 65),
(95, 1, 66),
(96, 1, 67),
(97, 1, 68),
(98, 1, 69),
(99, 1, 70),
(100, 1, 71),
(101, 1, 72),
(102, 1, 73),
(103, 1, 74),
(104, 1, 75),
(105, 1, 76),
(106, 1, 77),
(107, 1, 78),
(108, 1, 79);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_preference`
--

CREATE TABLE `system_preference` (
  `id` text COLLATE utf8_unicode_ci,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_program`
--

CREATE TABLE `system_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_program`
--

INSERT INTO `system_program` (`id`, `name`, `controller`) VALUES
(1, 'System Group Form', 'SystemGroupForm'),
(2, 'System Group List', 'SystemGroupList'),
(3, 'System Program Form', 'SystemProgramForm'),
(4, 'System Program List', 'SystemProgramList'),
(5, 'System User Form', 'SystemUserForm'),
(6, 'System User List', 'SystemUserList'),
(7, 'Common Page', 'CommonPage'),
(8, 'System PHP Info', 'SystemPHPInfoView'),
(9, 'System ChangeLog View', 'SystemChangeLogView'),
(10, 'Welcome View', 'WelcomeView'),
(11, 'System Sql Log', 'SystemSqlLogList'),
(12, 'System Profile View', 'SystemProfileView'),
(13, 'System Profile Form', 'SystemProfileForm'),
(14, 'System SQL Panel', 'SystemSQLPanel'),
(15, 'System Access Log', 'SystemAccessLogList'),
(16, 'System Message Form', 'SystemMessageForm'),
(17, 'System Message List', 'SystemMessageList'),
(18, 'System Message Form View', 'SystemMessageFormView'),
(19, 'System Notification List', 'SystemNotificationList'),
(20, 'System Notification Form View', 'SystemNotificationFormView'),
(21, 'System Document Category List', 'SystemDocumentCategoryFormList'),
(22, 'System Document Form', 'SystemDocumentForm'),
(23, 'System Document Upload Form', 'SystemDocumentUploadForm'),
(24, 'System Document List', 'SystemDocumentList'),
(25, 'System Shared Document List', 'SystemSharedDocumentList'),
(26, 'System Unit Form', 'SystemUnitForm'),
(27, 'System Unit List', 'SystemUnitList'),
(28, 'System Access stats', 'SystemAccessLogStats'),
(29, 'System Preference form', 'SystemPreferenceForm'),
(30, 'System Support form', 'SystemSupportForm'),
(31, 'System PHP Error', 'SystemPHPErrorLogView'),
(32, 'System Database Browser', 'SystemDatabaseExplorer'),
(33, 'System Table List', 'SystemTableList'),
(34, 'System Data Browser', 'SystemDataBrowser'),
(35, 'System Menu Editor', 'SystemMenuEditor'),
(36, 'System Request Log', 'SystemRequestLogList'),
(37, 'System Request Log View', 'SystemRequestLogView'),
(38, 'System Administration Dashboard', 'SystemAdministrationDashboard'),
(39, 'System Log Dashboard', 'SystemLogDashboard'),
(40, 'System Session dump', 'SystemSessionDumpView'),
(41, 'Calendario Form', 'CalendarioForm'),
(42, 'Calendario View', 'CalendarioView'),
(43, 'Cidade Form', 'CidadeForm'),
(44, 'Cidade List', 'CidadeList'),
(45, 'Conta Receber Form', 'ContaReceberForm'),
(46, 'Conta Receber List', 'ContaReceberList'),
(47, 'Conta Receber Quitacao List', 'ContaReceberQuitacaoList'),
(48, 'Contrato Dashboard', 'ContratoDashboard'),
(49, 'Contrato Form', 'ContratoForm'),
(50, 'Contrato List', 'ContratoList'),
(51, 'Estado Form', 'EstadoForm'),
(52, 'Estado List', 'EstadoList'),
(53, 'Fatura Dashboard', 'FaturaDashboard'),
(54, 'Fatura Form', 'FaturaForm'),
(55, 'Fatura List', 'FaturaList'),
(56, 'Financeiro Dashboard', 'FinanceiroDashboard'),
(57, 'Gera Contas Receber List', 'GeraContasReceberList'),
(58, 'Gera Faturas List', 'GeraFaturasList'),
(59, 'Grupo Form', 'GrupoForm'),
(60, 'Grupo List', 'GrupoList'),
(61, 'Kanban Atividade Form', 'KanbanAtividadeForm'),
(62, 'Kanban Fase Form', 'KanbanFaseForm'),
(63, 'Kanban View', 'KanbanView'),
(64, 'Multi Unit Test', 'MultiUnitTest'),
(65, 'Papel Form', 'PapelForm'),
(66, 'Papel List', 'PapelList'),
(67, 'Pessoa Form', 'PessoaForm'),
(68, 'Pessoa Form View', 'PessoaFormView'),
(69, 'Pessoa List', 'PessoaList'),
(70, 'Projeto Card List', 'ProjetoCardList'),
(71, 'Projeto Form', 'ProjetoForm'),
(72, 'Projeto List', 'ProjetoList'),
(73, 'Public View', 'PublicView'),
(74, 'Servico Form', 'ServicoForm'),
(75, 'Servico List', 'ServicoList'),
(76, 'Tipo Contrato Form', 'TipoContratoForm'),
(77, 'Tipo Contrato List', 'TipoContratoList'),
(78, 'Tipo Servico Form', 'TipoServicoForm'),
(79, 'Tipo Servico List', 'TipoServicoList');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_unit`
--

CREATE TABLE `system_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_unit`
--

INSERT INTO `system_unit` (`id`, `name`, `connection_name`) VALUES
(1, 'Unit A', 'unit_a'),
(2, 'Unit B', 'unit_b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user`
--

CREATE TABLE `system_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frontpage_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  `active` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_user`
--

INSERT INTO `system_user` (`id`, `name`, `login`, `password`, `email`, `frontpage_id`, `system_unit_id`, `active`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y'),
(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_group`
--

CREATE TABLE `system_user_group` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_user_group`
--

INSERT INTO `system_user_group` (`id`, `system_user_id`, `system_group_id`) VALUES
(2, 2, 2),
(3, 1, 2),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_program`
--

CREATE TABLE `system_user_program` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_user_program`
--

INSERT INTO `system_user_program` (`id`, `system_user_id`, `system_program_id`) VALUES
(1, 2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_unit`
--

CREATE TABLE `system_user_unit` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_user_unit`
--

INSERT INTO `system_user_unit` (`id`, `system_user_id`, `system_unit_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `system_group`
--
ALTER TABLE `system_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_group_program_program_idx` (`system_program_id`),
  ADD KEY `sys_group_program_group_idx` (`system_group_id`);

--
-- Índices para tabela `system_program`
--
ALTER TABLE `system_program`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_unit`
--
ALTER TABLE `system_unit`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_user`
--
ALTER TABLE `system_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_idx` (`frontpage_id`);

--
-- Índices para tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_group_group_idx` (`system_group_id`),
  ADD KEY `sys_user_group_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_program_idx` (`system_program_id`),
  ADD KEY `sys_user_program_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_user_id` (`system_user_id`),
  ADD KEY `system_unit_id` (`system_unit_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD CONSTRAINT `system_group_program_ibfk_1` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`),
  ADD CONSTRAINT `system_group_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user`
--
ALTER TABLE `system_user`
  ADD CONSTRAINT `system_user_ibfk_1` FOREIGN KEY (`frontpage_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD CONSTRAINT `system_user_group_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_group_ibfk_2` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`);

--
-- Limitadores para a tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD CONSTRAINT `system_user_program_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD CONSTRAINT `system_user_unit_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_unit_ibfk_2` FOREIGN KEY (`system_unit_id`) REFERENCES `system_unit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
