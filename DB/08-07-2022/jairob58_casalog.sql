-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 08-Jul-2022 às 17:49
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
-- Banco de dados: `jairob58_casalog`
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
(1, 'a640a66563d6597af9f3d66707e4fc15', 'sic.dev', '2022-04-17 05:21:20', '2022', '04', '17', '2022-04-17 05:21:24', 'N', '168.0.113.241'),
(2, '1938983ac89494255033297290fc1975', 'sic.dev', '2022-04-17 22:59:21', '2022', '04', '17', '2022-04-17 23:00:16', 'N', '168.0.113.241'),
(3, '66cf991a46d721552adfb8eb869a5a62', 'suporte', '2022-04-17 23:00:38', '2022', '04', '17', '2022-04-17 23:14:11', 'N', '177.89.194.43'),
(4, 'ab43aeeefe87684458562b7f329aaedd', 'suporte', '2022-04-17 23:14:17', '2022', '04', '17', '2022-04-18 00:23:34', 'N', '177.89.194.43'),
(5, '14bebefe5fbd5e065174798a83bccba7', 'sic.dev', '2022-04-18 00:23:34', '2022', '04', '17', '2022-04-18 00:47:04', 'N', '168.0.113.241'),
(6, 'c1cb6281cac7a8d936a232112167b86d', 'suporte', '2022-04-18 00:23:39', '2022', '04', '17', '2022-04-18 00:39:09', 'N', '177.89.194.43'),
(7, 'e8b54c63a0be450b01d2df7b74dd2d70', 'sic.dev', '2022-04-18 00:57:57', '2022', '04', '17', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(8, 'e7d26d8cb07a2da60acd76330d5b0271', 'sic.dev', '2022-04-18 01:40:12', '2022', '04', '17', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(9, 'e47d51bd8061d1b3cc12bed728deb5bb', 'suporte', '2022-04-18 02:12:14', '2022', '04', '17', '2022-04-18 04:16:32', 'N', '177.89.194.43'),
(10, '2dc710a1824ae1ec0d357faef1d545b2', 'adm', '2022-04-18 07:41:45', '2022', '04', '18', '2022-04-18 07:42:22', 'N', '168.0.113.241'),
(11, '0f99473cd21841e6f0406fef48029339', 'comercial', '2022-04-18 07:42:28', '2022', '04', '18', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(12, 'e1872648ba94e59eb28d627e7f00f909', 'sic.dev', '2022-04-18 07:42:49', '2022', '04', '18', '2022-04-18 08:38:55', 'N', '168.0.113.241'),
(13, 'b3e2f4ecb372faa9808f3a5b25507423', 'matias', '2022-04-18 08:39:00', '2022', '04', '18', '2022-04-18 08:40:43', 'N', '168.0.113.241'),
(14, 'd68725b58cce6e68b78b9dc36dbeca58', 'adm', '2022-04-18 08:40:47', '2022', '04', '18', '2022-04-18 08:46:37', 'N', '168.0.113.241'),
(15, '7a06945f0c1e4f687199bae963d856da', 'comercial', '2022-04-18 08:46:45', '2022', '04', '18', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(16, 'dc6f5e9a67db23b1502bd9344c068091', 'sic.dev', '2022-04-18 11:17:41', '2022', '04', '18', '2022-04-18 11:24:42', 'N', '168.0.113.241'),
(17, '06586a63d7b669c3efe0f54b62c55864', 'sic.dev', '2022-04-18 15:13:45', '2022', '04', '18', '2022-04-18 15:19:22', 'N', '168.0.113.241'),
(18, 'd8d50f544fd4b375f95e8868a23c374a', 'sic.dev', '2022-04-18 16:56:47', '2022', '04', '18', '2022-04-18 16:58:05', 'N', '168.0.113.241'),
(19, '447c66256ad069dcafbf71e8c02869ca', 'sic.dev', '2022-04-18 16:58:22', '2022', '04', '18', '2022-04-18 16:59:05', 'N', '168.0.113.241'),
(20, '0374a5813e70ee5c2e3503a27cfaadee', 'suporte', '2022-04-18 16:59:16', '2022', '04', '18', '2022-04-18 16:59:27', 'N', '168.0.113.241'),
(21, 'b25787d95d6035dcee1a10435f649366', 'sic.dev', '2022-04-18 16:59:33', '2022', '04', '18', '2022-04-18 17:00:32', 'N', '168.0.113.241'),
(22, '8772fe6d174b776f3ad0e574fe5215af', 'suporte', '2022-04-18 21:48:37', '2022', '04', '18', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(23, '26daa5d638adba89ffdb0de7c19e27b9', 'suporte', '2022-04-20 02:45:41', '2022', '04', '19', '0000-00-00 00:00:00', 'N', '177.25.153.151'),
(24, '3b983a97be3b4d5da809f307800f39ed', 'suporte', '2022-04-20 04:42:45', '2022', '04', '20', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(25, '0175a97e17b5972aedcae36d25a1e8a7', 'suporte', '2022-04-21 09:02:48', '2022', '04', '21', '2022-04-21 12:31:48', 'N', '177.89.194.43'),
(26, '8653f7e38fcfb849649d15f0f93170b1', 'suporte', '2022-04-21 12:32:22', '2022', '04', '21', '2022-04-23 19:35:19', 'N', '177.89.194.43'),
(27, '1aaf7b80a18771339701ad65b8e48a51', 'suporte', '2022-04-23 02:10:56', '2022', '04', '22', '0000-00-00 00:00:00', 'N', '177.25.146.1'),
(28, '9148bd3d7e90212c42e62a80c7c93566', 'suporte', '2022-04-23 05:21:22', '2022', '04', '23', '2022-04-23 05:24:01', 'N', '168.0.113.241'),
(29, '1f6b6d6e8a4c62e5dd6355bf7c86a429', 'sic.dev', '2022-04-23 05:24:14', '2022', '04', '23', '2022-04-23 05:28:35', 'N', '168.0.113.241'),
(30, '9952388ac84d5e9bba481172cf798e49', 'suporte', '2022-04-23 05:28:46', '2022', '04', '23', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(31, 'bf03804a4277665d21d483237435466d', 'sic.dev', '2022-04-23 14:35:24', '2022', '04', '23', '0000-00-00 00:00:00', 'N', '168.0.113.241'),
(32, '17f16488b4da65beabb24f7f361da807', 'suporte', '2022-04-23 19:35:26', '2022', '04', '23', '0000-00-00 00:00:00', 'N', '177.89.194.43');

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
