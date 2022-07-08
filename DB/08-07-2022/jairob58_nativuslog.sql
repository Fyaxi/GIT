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
-- Banco de dados: `jairob58_nativuslog`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_access_log`
--

CREATE TABLE `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text COLLATE utf8_unicode_ci,
  `login` text COLLATE utf8_unicode_ci,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_day` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impersonated` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `system_access_log`
--

INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `login_year`, `login_month`, `login_day`, `logout_time`, `impersonated`, `access_ip`) VALUES
(1, '1d69b5b0740c7ee38b963bb749c0855d', 'admin', '2022-04-18 08:18:26', '2022', '04', '18', '2022-04-18 08:29:20', 'N', '168.0.113.241'),
(2, '6cdb34d16d5146279f8ebaea1ab9a6ff', 'admin', '2022-04-18 08:29:30', '2022', '04', '18', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(3, 'b34cf5258e95982fe8606309b63938a2', 'admin', '2022-04-23 06:16:10', '2022', '04', '23', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(4, 'ff74d01f5ff1a7d50b3378233643e7dd', 'sic.dev', '2022-04-26 06:26:11', '2022', '04', '26', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(5, 'fac2e488e0bc8c8f15ef58a1960c1a33', 'sic.dev', '2022-05-07 09:19:41', '2022', '05', '07', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(6, 'c2704aa2394b55987af97b840eebcef7', 'comercial', '2022-05-11 20:22:58', '2022', '05', '11', '0000-00-00 00:00:00', 'N', '187.61.251.214'),
(7, 'a1124ed6f358977a6e0005747c96ef27', 'sic.dev', '2022-05-12 02:51:04', '2022', '05', '11', '2022-05-12 03:39:09', 'N', '177.89.194.43'),
(8, 'c58bff694a77fc09e3e75933e6696cff', 'sic.dev', '2022-05-12 03:39:16', '2022', '05', '12', '2022-05-12 04:05:59', 'N', '177.89.194.43'),
(9, '3598ebcddbe8e49d4553361976d62e5c', 'sic.dev', '2022-05-14 02:57:41', '2022', '05', '13', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(10, '572bd09467b1ce9f278b9cf002fd40f7', 'sic.dev', '2022-05-16 13:10:34', '2022', '05', '16', '0000-00-00 00:00:00', 'N', '177.89.194.43'),
(11, 'e2719219d17b853335320620f249fcc3', 'comercial', '2022-05-20 13:16:17', '2022', '05', '20', '2022-05-20 14:53:57', 'N', '187.61.251.214'),
(12, 'c3f65de748f7ecd5a2b6604edf4ee4ce', 'comercial', '2022-05-20 14:54:03', '2022', '05', '20', '2022-05-20 16:23:00', 'N', '187.61.251.214'),
(13, 'bf498398e0f448017454af1441e7204e', 'sic.dev', '2022-05-20 15:29:19', '2022', '05', '20', '0000-00-00 00:00:00', 'N', '177.79.83.212'),
(14, '18f2b8407ec032320b78633934819b43', 'sic.dev', '2022-05-20 16:22:29', '2022', '05', '20', '2022-05-20 16:28:19', 'N', '189.124.135.114'),
(15, 'c0d44b6e7598d9a59beb307bc55fce3a', 'comercial', '2022-05-20 16:23:06', '2022', '05', '20', '2022-05-20 17:43:39', 'N', '187.61.251.214'),
(16, '8b3debf0f7f97c27227ce2f279c05c27', 'comercial', '2022-05-20 19:29:16', '2022', '05', '20', '0000-00-00 00:00:00', 'N', '187.61.251.214'),
(17, '3c043127cfa9f75a07d0428c82076a9b', 'sic.dev', '2022-05-20 20:10:09', '2022', '05', '20', '0000-00-00 00:00:00', 'N', '189.124.135.114'),
(18, '426673cfb196af76c0670d69c9c59510', 'sic.dev', '2022-05-22 19:33:45', '2022', '05', '22', '0000-00-00 00:00:00', 'N', '177.89.194.43'),
(19, '1055c941a345727db392c139b748bc5a', 'sic.dev', '2022-05-22 23:53:13', '2022', '05', '22', '2022-05-23 00:39:43', 'N', '177.89.194.43'),
(20, '770739ad07cacb74fc3b07cc2036b30c', 'comercial', '2022-05-23 00:39:57', '2022', '05', '22', '2022-05-23 00:54:19', 'N', '177.89.194.43'),
(21, '28372ccc7b3f9c0a75eb97dd5d6bd8e4', 'sic.dev', '2022-05-23 00:42:55', '2022', '05', '22', '2022-05-23 00:49:45', 'N', '177.89.194.43'),
(22, '5205871d863dda7ba994064b72cde046', 'suporte', '2022-05-23 00:49:50', '2022', '05', '22', '2022-05-23 00:51:36', 'N', '177.89.194.43'),
(23, '07546d3ea6be102269fe2bd1763b3cb7', 'sic.dev', '2022-05-23 00:51:42', '2022', '05', '22', '0000-00-00 00:00:00', 'N', '177.89.194.43'),
(24, '1ad3ee49a50806ad8da3dde4fe93e10a', 'sic.dev', '2022-05-23 01:50:44', '2022', '05', '22', '0000-00-00 00:00:00', 'N', '177.89.194.43'),
(25, 'aef87cb33646ad03f3953f722a398823', 'sic.dev', '2022-05-25 01:24:47', '2022', '05', '24', '2022-05-25 01:31:11', 'N', '168.0.112.137'),
(26, '44786d5a693945992075251456286700', 'sic.dev', '2022-05-25 04:42:08', '2022', '05', '25', '0000-00-00 00:00:00', 'N', '168.0.112.137'),
(27, 'ed15b56bdd189781eacbc9114d610646', 'comercial', '2022-05-25 12:58:10', '2022', '05', '25', '2022-05-25 14:38:07', 'N', '187.61.251.214'),
(28, 'e6ff70c5ac75ab6144608188269b6b68', 'comercial', '2022-05-25 14:38:14', '2022', '05', '25', '0000-00-00 00:00:00', 'N', '187.61.251.214'),
(29, 'be7c5d111ec521ebf7a6f49b58de4c95', 'suporte', '2022-05-26 03:57:53', '2022', '05', '26', '0000-00-00 00:00:00', 'N', '177.89.194.43'),
(30, 'd9f0d8302acf24b74a44e5b25c57a53a', 'sic.dev', '2022-05-27 22:07:33', '2022', '05', '27', '0000-00-00 00:00:00', 'N', '168.0.112.137'),
(31, '5b0a7ed848f0f4426c41a64a6671eb08', 'sic.dev', '2022-05-28 17:51:25', '2022', '05', '28', '0000-00-00 00:00:00', 'N', '168.0.112.137'),
(32, '1a0d3f0e999cc93f210d90852c6741c6', 'comercial', '2022-05-31 19:46:14', '2022', '05', '31', '0000-00-00 00:00:00', 'N', '187.61.251.214'),
(33, '1881e373d6b1c03339c4de33e3d7d3a9', 'sic.dev', '2022-06-08 15:06:31', '2022', '06', '08', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(34, '9f673aa4430d0d6c43dffac716d278f4', 'comercial', '2022-06-09 19:37:58', '2022', '06', '09', '0000-00-00 00:00:00', 'N', '187.61.251.214'),
(35, 'f11219d30fab535d6b79880d7047e4e9', 'sic.dev', '2022-06-09 23:56:36', '2022', '06', '09', '2022-06-10 01:34:59', 'N', '168.0.112.165'),
(36, '3c9ea0c103d7895a0f9404896882e6bf', 'sic.dev', '2022-06-10 01:35:09', '2022', '06', '09', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(37, '1e03a8bdc67ca0bc66dd22d824d61635', 'sic.dev', '2022-06-18 04:35:07', '2022', '06', '18', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(38, 'd617bb12887609300308843b9848d453', 'sic.dev', '2022-06-18 14:19:06', '2022', '06', '18', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(39, '88c47c8d943729f049b45a39cbe7a08f', 'sic.dev', '2022-07-03 06:21:03', '2022', '07', '03', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(40, '0cbf42901860d8714aa397f46c315551', 'sic.dev', '2022-07-04 14:05:28', '2022', '07', '04', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(41, 'e9aa11f017761ed0b45acc9f5b752ce7', 'sic.dev', '2022-07-05 08:39:57', '2022', '07', '05', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(42, 'f0200c808f7f1ae19a5b4a6e6f08336f', 'sic.dev', '2022-07-05 15:42:18', '2022', '07', '05', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(43, '134aee6aaf40dc16650a364f28373459', 'suporte', '2022-07-06 22:22:33', '2022', '07', '06', '0000-00-00 00:00:00', 'N', '168.0.112.165'),
(44, 'b7c05774019d281fc9cafaf88e33d653', 'suporte', '2022-07-06 22:25:18', '2022', '07', '06', '0000-00-00 00:00:00', 'N', '187.19.227.48'),
(45, 'a03eb5120946e74760fc4b8f29dfbadd', 'suporte', '2022-07-06 22:25:33', '2022', '07', '06', '0000-00-00 00:00:00', 'N', '177.89.10.49'),
(46, '13f6350be225617593d31664486360b3', 'suporte', '2022-07-07 00:07:07', '2022', '07', '06', '0000-00-00 00:00:00', 'N', '179.234.138.76'),
(47, 'a598d6b75b81d244934ea5654377dad9', 'sic.dev', '2022-07-08 14:04:33', '2022', '07', '08', '0000-00-00 00:00:00', 'N', '177.89.194.43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_change_log`
--

CREATE TABLE `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login` text COLLATE utf8_unicode_ci,
  `tablename` text COLLATE utf8_unicode_ci,
  `primarykey` text COLLATE utf8_unicode_ci,
  `pkvalue` text COLLATE utf8_unicode_ci,
  `operation` text COLLATE utf8_unicode_ci,
  `columnname` text COLLATE utf8_unicode_ci,
  `oldvalue` text COLLATE utf8_unicode_ci,
  `newvalue` text COLLATE utf8_unicode_ci,
  `access_ip` text COLLATE utf8_unicode_ci,
  `transaction_id` text COLLATE utf8_unicode_ci,
  `log_trace` text COLLATE utf8_unicode_ci,
  `session_id` text COLLATE utf8_unicode_ci,
  `class_name` text COLLATE utf8_unicode_ci,
  `php_sapi` text COLLATE utf8_unicode_ci,
  `log_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_request_log`
--

CREATE TABLE `system_request_log` (
  `id` int(11) NOT NULL,
  `endpoint` text COLLATE utf8_unicode_ci,
  `logdate` text COLLATE utf8_unicode_ci,
  `log_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` text COLLATE utf8_unicode_ci,
  `login` text COLLATE utf8_unicode_ci,
  `access_ip` text COLLATE utf8_unicode_ci,
  `class_name` text COLLATE utf8_unicode_ci,
  `http_host` text COLLATE utf8_unicode_ci,
  `server_port` text COLLATE utf8_unicode_ci,
  `request_uri` text COLLATE utf8_unicode_ci,
  `request_method` text COLLATE utf8_unicode_ci,
  `query_string` text COLLATE utf8_unicode_ci,
  `request_headers` text COLLATE utf8_unicode_ci,
  `request_body` text COLLATE utf8_unicode_ci,
  `request_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_sql_log`
--

CREATE TABLE `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login` text COLLATE utf8_unicode_ci,
  `database_name` text COLLATE utf8_unicode_ci,
  `sql_command` text COLLATE utf8_unicode_ci,
  `statement_type` text COLLATE utf8_unicode_ci,
  `access_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` text COLLATE utf8_unicode_ci,
  `log_trace` text COLLATE utf8_unicode_ci,
  `session_id` text COLLATE utf8_unicode_ci,
  `class_name` text COLLATE utf8_unicode_ci,
  `php_sapi` text COLLATE utf8_unicode_ci,
  `request_id` int(11) DEFAULT NULL,
  `log_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `system_access_log`
--
ALTER TABLE `system_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_change_log`
--
ALTER TABLE `system_change_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_request_log`
--
ALTER TABLE `system_request_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_sql_log`
--
ALTER TABLE `system_sql_log`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
