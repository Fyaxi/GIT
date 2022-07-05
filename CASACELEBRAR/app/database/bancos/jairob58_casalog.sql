-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Abr-2022 às 05:32
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
-- Banco de dados: `jairob58_casalog`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_access_log`
--

DROP TABLE IF EXISTS `system_access_log`;
CREATE TABLE `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text DEFAULT NULL,
  `login` text DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_year` varchar(4) DEFAULT NULL,
  `login_month` varchar(2) DEFAULT NULL,
  `login_day` varchar(2) DEFAULT NULL,
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impersonated` char(1) DEFAULT NULL,
  `access_ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_change_log`
--

DROP TABLE IF EXISTS `system_change_log`;
CREATE TABLE `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` text DEFAULT NULL,
  `tablename` text DEFAULT NULL,
  `primarykey` text DEFAULT NULL,
  `pkvalue` text DEFAULT NULL,
  `operation` text DEFAULT NULL,
  `columnname` text DEFAULT NULL,
  `oldvalue` text DEFAULT NULL,
  `newvalue` text DEFAULT NULL,
  `access_ip` text DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `log_trace` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `class_name` text DEFAULT NULL,
  `php_sapi` text DEFAULT NULL,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_request_log`
--

DROP TABLE IF EXISTS `system_request_log`;
CREATE TABLE `system_request_log` (
  `id` int(11) NOT NULL,
  `endpoint` text DEFAULT NULL,
  `logdate` text DEFAULT NULL,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `login` text DEFAULT NULL,
  `access_ip` text DEFAULT NULL,
  `class_name` text DEFAULT NULL,
  `http_host` text DEFAULT NULL,
  `server_port` text DEFAULT NULL,
  `request_uri` text DEFAULT NULL,
  `request_method` text DEFAULT NULL,
  `query_string` text DEFAULT NULL,
  `request_headers` text DEFAULT NULL,
  `request_body` text DEFAULT NULL,
  `request_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_sql_log`
--

DROP TABLE IF EXISTS `system_sql_log`;
CREATE TABLE `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` text DEFAULT NULL,
  `database_name` text DEFAULT NULL,
  `sql_command` text DEFAULT NULL,
  `statement_type` text DEFAULT NULL,
  `access_ip` varchar(45) DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `log_trace` text DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `class_name` text DEFAULT NULL,
  `php_sapi` text DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
