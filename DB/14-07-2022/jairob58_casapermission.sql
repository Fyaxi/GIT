-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jul-2022 às 16:22
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jairob58_permission`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group`
--

DROP TABLE IF EXISTS `system_group`;
CREATE TABLE `system_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_group`
--

INSERT INTO `system_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Standard'),
(3, 'Pessoas'),
(5, 'Festa'),
(6, 'Faturas'),
(7, 'Financeiro'),
(8, 'Empresa'),
(9, 'Produtos'),
(14, 'Decoracao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group_program`
--

DROP TABLE IF EXISTS `system_group_program`;
CREATE TABLE `system_group_program` (
  `id` int(11) NOT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_group_program`
--

INSERT INTO `system_group_program` (`id`, `system_group_id`, `system_program_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 8),
(8, 1, 9),
(9, 1, 11),
(10, 1, 14),
(11, 1, 15),
(13, 2, 12),
(14, 2, 13),
(15, 2, 16),
(16, 2, 17),
(17, 2, 18),
(18, 2, 19),
(19, 2, 20),
(20, 1, 21),
(21, 2, 22),
(22, 2, 23),
(23, 2, 24),
(24, 2, 25),
(25, 1, 26),
(26, 1, 27),
(27, 1, 28),
(28, 1, 29),
(29, 2, 30),
(30, 1, 31),
(31, 1, 32),
(32, 1, 33),
(33, 1, 34),
(34, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(42, 3, 41),
(44, 3, 42),
(47, 3, 43),
(49, 3, 44),
(51, 3, 45),
(53, 3, 46),
(55, 3, 47),
(57, 3, 48),
(59, 3, 49),
(61, 3, 50),
(63, 3, 51),
(351, 3, 124),
(353, 3, 125),
(355, 3, 126),
(357, 3, 127),
(359, 3, 128),
(361, 3, 129),
(373, 8, 101),
(374, 8, 102),
(411, 6, 60),
(412, 6, 61),
(413, 6, 64),
(414, 6, 65),
(415, 6, 68),
(416, 6, 123),
(571, 7, 63),
(572, 7, 64),
(573, 7, 65),
(574, 7, 67),
(575, 7, 68),
(576, 7, 69),
(577, 7, 78),
(578, 7, 79),
(579, 7, 81),
(580, 7, 89),
(581, 7, 90),
(582, 7, 91),
(583, 7, 92),
(584, 7, 105),
(585, 7, 106),
(586, 7, 122),
(587, 9, 83),
(588, 9, 84),
(589, 9, 85),
(590, 9, 86),
(591, 9, 87),
(592, 9, 88),
(593, 9, 131),
(594, 9, 132),
(595, 1, 1),
(596, 1, 2),
(597, 1, 5),
(598, 1, 6),
(599, 1, 7),
(600, 1, 8),
(601, 1, 9),
(603, 1, 11),
(604, 1, 12),
(605, 1, 13),
(606, 1, 14),
(607, 1, 15),
(608, 1, 16),
(609, 1, 17),
(610, 1, 18),
(611, 1, 19),
(612, 1, 20),
(613, 1, 21),
(614, 1, 22),
(615, 1, 23),
(616, 1, 24),
(617, 1, 25),
(618, 1, 28),
(619, 1, 30),
(620, 1, 31),
(621, 1, 32),
(622, 1, 33),
(623, 1, 34),
(624, 1, 35),
(625, 1, 36),
(626, 1, 37),
(627, 1, 38),
(628, 1, 39),
(629, 1, 40),
(630, 1, 41),
(631, 1, 42),
(632, 1, 43),
(633, 1, 44),
(634, 1, 45),
(635, 1, 46),
(636, 1, 47),
(637, 1, 48),
(638, 1, 49),
(639, 1, 50),
(640, 1, 51),
(641, 1, 52),
(642, 1, 53),
(643, 1, 54),
(644, 1, 55),
(645, 1, 56),
(646, 1, 57),
(647, 1, 58),
(648, 1, 59),
(649, 1, 60),
(650, 1, 61),
(652, 1, 63),
(653, 1, 64),
(654, 1, 65),
(655, 1, 66),
(656, 1, 67),
(657, 1, 68),
(658, 1, 69),
(659, 1, 70),
(660, 1, 71),
(661, 1, 78),
(662, 1, 79),
(663, 1, 80),
(664, 1, 81),
(665, 1, 83),
(666, 1, 84),
(667, 1, 85),
(668, 1, 86),
(669, 1, 87),
(670, 1, 88),
(671, 1, 89),
(672, 1, 90),
(673, 1, 91),
(674, 1, 92),
(675, 1, 101),
(676, 1, 102),
(677, 1, 105),
(678, 1, 106),
(679, 1, 109),
(680, 1, 117),
(681, 1, 118),
(682, 1, 119),
(683, 1, 120),
(684, 1, 122),
(685, 1, 123),
(686, 1, 124),
(687, 1, 125),
(688, 1, 126),
(689, 1, 127),
(690, 1, 128),
(691, 1, 129),
(692, 1, 130),
(693, 1, 131),
(694, 1, 132),
(695, 1, 133),
(698, 1, 134),
(701, 5, 52),
(702, 5, 53),
(703, 5, 54),
(704, 5, 55),
(705, 5, 56),
(706, 5, 57),
(707, 5, 58),
(708, 5, 59),
(709, 5, 70),
(710, 5, 71),
(711, 5, 133),
(712, 5, 134),
(713, 14, 56),
(714, 14, 57),
(715, 14, 58),
(716, 14, 59),
(717, 14, 70),
(718, 14, 71),
(719, 14, 117),
(720, 14, 118),
(721, 14, 119),
(722, 14, 120),
(723, 14, 133),
(724, 14, 134),
(725, 1, 10),
(726, 1, 115),
(727, 1, 116),
(728, 1, 62),
(729, 1, 135),
(730, 7, 135),
(731, 1, 136);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_preference`
--

DROP TABLE IF EXISTS `system_preference`;
CREATE TABLE `system_preference` (
  `id` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_program`
--

DROP TABLE IF EXISTS `system_program`;
CREATE TABLE `system_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(41, 'Estado Form', 'EstadoForm'),
(42, 'Estado List', 'EstadoList'),
(43, 'Cidade Form', 'CidadeForm'),
(44, 'Cidade List', 'CidadeList'),
(45, 'Grupo Form', 'GrupoForm'),
(46, 'Grupo List', 'GrupoList'),
(47, 'Papel Form', 'PapelForm'),
(48, 'Papel List', 'PapelList'),
(49, 'Pessoa Form', 'PessoaForm'),
(50, 'Pessoa List', 'PessoaList'),
(51, 'Pessoa Form View', 'PessoaFormView'),
(52, 'Tipo Contrato Form', 'TipoContratoForm'),
(53, 'Tipo Contrato List', 'TipoContratoList'),
(54, 'Contrato Form', 'ContratoForm'),
(55, 'Contrato List', 'ContratoList'),
(56, 'Tipo Servico Form', 'TipoServicoForm'),
(57, 'Tipo Servico List', 'TipoServicoList'),
(58, 'Servico Form', 'ServicoForm'),
(59, 'Servico List', 'ServicoList'),
(60, 'Fatura Form', 'FaturaForm'),
(61, 'Fatura List', 'FaturaList'),
(62, 'Conta Receber Form', 'ContaReceberForm'),
(63, 'Conta Receber List', 'ContaReceberList'),
(64, 'Gera Faturas List', 'GeraFaturasList'),
(65, 'Gera Contas Receber List', 'GeraContasReceberList'),
(66, 'Conta Receber Quitacao List', 'ContaReceberQuitacaoList'),
(67, 'Contrato Dashboard', 'ContratoDashboard'),
(68, 'Fatura Dashboard', 'FaturaDashboard'),
(69, 'Financeiro Dashboard', 'FinanceiroDashboard'),
(70, 'Calendario Form', 'CalendarioForm'),
(71, 'Calendario View', 'CalendarioView'),
(72, 'Projeto Form', 'ProjetoForm'),
(73, 'Projeto List', 'ProjetoList'),
(74, 'Projeto Card List', 'ProjetoCardList'),
(75, 'Kanban View', 'KanbanView'),
(76, 'Kanban Fase Form', 'KanbanFaseForm'),
(77, 'Kanban Atividade Form', 'KanbanAtividadeForm'),
(78, 'Conta Pagar Form', 'ContaPagarForm'),
(79, 'Conta Pagar List', 'ContaPagarList'),
(80, 'Conta Pagar Quitacao List', 'ContaPagarQuitacaoList'),
(81, 'Financeiro2Dashboard', 'Financeiro2Dashboard'),
(82, 'Multi Unit Test', 'MultiUnitTest'),
(83, 'Produto Form', 'ProdutoForm'),
(84, 'Produto List', 'ProdutoList'),
(85, 'Tipo Produto Form', 'TipoProdutoForm'),
(86, 'Tipo Produto List', 'TipoProdutoList'),
(87, 'Estoque Form', 'EstoqueForm'),
(88, 'Estoque List', 'EstoqueList'),
(89, 'Forma Recebimento Form', 'FormaRecebimentoForm'),
(90, 'Forma Recebimento List', 'FormaRecebimentoList'),
(91, 'Forma Pagamento Form', 'FormaPagamentoForm'),
(92, 'Forma Pagamento List', 'FormaPagamentoList'),
(93, 'Venda Form', 'VendaForm'),
(94, 'Venda List', 'VendaList'),
(95, 'Gera Venda Receber List', 'GeraVendaReceberList'),
(96, 'Venda Dashboard', 'VendaDashboard'),
(98, 'Producao Form', 'ProducaoForm'),
(99, 'Producao List', 'ProducaoList'),
(100, 'Gera Producao Pagar List', 'GeraProducaoPagarList'),
(101, 'Empresa Form', 'EmpresaForm'),
(102, 'Empresa List', 'EmpresaList'),
(103, 'Caixa Form', 'CaixaForm'),
(104, 'Caixa List', 'CaixaList'),
(105, 'Receber Form', 'ReceberForm'),
(106, 'Pagar Form', 'PagarForm'),
(107, 'Caixa Mov List', 'CaixaMovList'),
(108, 'Caixa Mov Form', 'CaixaMovForm'),
(109, 'Teste', 'Teste'),
(110, 'Venda Caixa Form', 'VendaCaixaForm'),
(111, 'Venda Caixa List', 'VendaCaixaList'),
(112, 'Venda List Caixa', 'VendaListCaixa'),
(113, 'Parametros Form', 'ParametrosForm'),
(114, 'Parametros List', 'ParametrosList'),
(115, 'Relat Clientes', 'RelatClientes'),
(116, 'Relat Clientes2', 'RelatClientes2'),
(117, 'Decoracao List', 'DecoracaoList'),
(118, 'Tipo Decoracao List', 'TipoDecoracaoList'),
(119, 'Tipo Decoracao Form', 'TipoDecoracaoForm'),
(120, 'Decoracao Form', 'DecoracaoForm'),
(122, 'Decoracao Dashboard', 'DecoracaoDashboard'),
(123, 'Gera Faturas List2', 'GeraFaturasList2'),
(124, 'Favorecido Form', 'FavorecidoForm'),
(125, 'Favorecido Form View', 'FavorecidoFormView'),
(126, 'Favorecido List', 'FavorecidoList'),
(127, 'Colaborador Form', 'ColaboradorForm'),
(128, 'Colaborador List', 'ColaboradorList'),
(129, 'Colaborador Form View', 'ColaboradorFormView'),
(130, 'Pag Teste', 'PagTeste'),
(131, 'Saida Form', 'SaidaForm'),
(132, 'Saida List', 'SaidaList'),
(133, 'Texto Personalizado Form', 'TextoPersonalizadoForm'),
(134, 'Texto Personalizado List', 'TextoPersonalizadoList'),
(135, 'Recibo Evento', 'ReciboEvento'),
(136, 'Recibo Entrada', 'ReciboEntradaView');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_unit`
--

DROP TABLE IF EXISTS `system_unit`;
CREATE TABLE `system_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `connection_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_unit`
--

INSERT INTO `system_unit` (`id`, `name`, `connection_name`) VALUES
(4, 'CASACELEBRAR', 'DBCASACELEBRAR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user`
--

DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `frontpage_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  `active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_user`
--

INSERT INTO `system_user` (`id`, `name`, `login`, `password`, `email`, `frontpage_id`, `system_unit_id`, `active`) VALUES
(1, 'Desenvolvedor', 'sic.dev', 'e46cac0ecd0b491c2eb6531326e57f9a', 'dev@sistemaintegrado.tech', 38, 4, 'Y'),
(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, 4, 'Y'),
(5, 'Matias', 'matias', '202cb962ac59075b964b07152d234b70', 'matias@sistemaintegrado.tech', 68, 4, 'Y'),
(6, 'Comercial', 'comercial', '202cb962ac59075b964b07152d234b70', 'comercial@comercial.com', 71, 4, 'Y'),
(7, 'Luan', 'luan', '202cb962ac59075b964b07152d234b70', 'luan@luan.com', NULL, 4, 'Y'),
(8, 'Administracao', 'adm', '202cb962ac59075b964b07152d234b70', 'adm@adm.com', 71, 4, 'Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_group`
--

DROP TABLE IF EXISTS `system_user_group`;
CREATE TABLE `system_user_group` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_user_group`
--

INSERT INTO `system_user_group` (`id`, `system_user_id`, `system_group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 2),
(78, 1, 1),
(79, 5, 1),
(80, 7, 1),
(92, 6, 3),
(93, 6, 5),
(94, 6, 6),
(95, 6, 14),
(96, 8, 3),
(97, 8, 5),
(98, 8, 6),
(99, 8, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_program`
--

DROP TABLE IF EXISTS `system_user_program`;
CREATE TABLE `system_user_program` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_user_program`
--

INSERT INTO `system_user_program` (`id`, `system_user_id`, `system_program_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 26),
(4, 1, 27);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_unit`
--

DROP TABLE IF EXISTS `system_user_unit`;
CREATE TABLE `system_user_unit` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_user_unit`
--

INSERT INTO `system_user_unit` (`id`, `system_user_id`, `system_unit_id`) VALUES
(19, 7, 4),
(24, 5, 4),
(25, 1, 4),
(26, 6, 4),
(27, 8, 4);

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
