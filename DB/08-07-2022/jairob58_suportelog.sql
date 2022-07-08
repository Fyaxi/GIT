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
-- Banco de dados: `jairob58_suportelog`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_access_log`
--

CREATE TABLE `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text,
  `login` text,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_year` varchar(4) DEFAULT NULL,
  `login_month` varchar(2) DEFAULT NULL,
  `login_day` varchar(2) DEFAULT NULL,
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impersonated` char(1) DEFAULT NULL,
  `access_ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_access_log`
--

INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `login_year`, `login_month`, `login_day`, `logout_time`, `impersonated`, `access_ip`) VALUES
(1, 'i7pl0lgt4sgptv1o1girjiliuh', 'admin', '2022-04-23 23:48:55', '2022', '04', '23', '2022-04-23 23:50:15', 'N', '::1'),
(2, 'vcds88dsojee03m4671mlre55j', 'admin', '2022-04-23 23:50:59', '2022', '04', '23', '0000-00-00 00:00:00', 'N', '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_change_log`
--

CREATE TABLE `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login` text,
  `tablename` text,
  `primarykey` text,
  `pkvalue` text,
  `operation` text,
  `columnname` text,
  `oldvalue` text,
  `newvalue` text,
  `access_ip` text,
  `transaction_id` text,
  `log_trace` text,
  `session_id` text,
  `class_name` text,
  `php_sapi` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_request_log`
--

CREATE TABLE `system_request_log` (
  `id` int(11) NOT NULL,
  `endpoint` text,
  `logdate` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL,
  `session_id` text,
  `login` text,
  `access_ip` text,
  `class_name` text,
  `http_host` text,
  `server_port` text,
  `request_uri` text,
  `request_method` text,
  `query_string` text,
  `request_headers` text,
  `request_body` text,
  `request_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_sql_log`
--

CREATE TABLE `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login` text,
  `database_name` text,
  `sql_command` text,
  `statement_type` text,
  `access_ip` varchar(45) DEFAULT NULL,
  `transaction_id` text,
  `log_trace` text,
  `session_id` text,
  `class_name` text,
  `php_sapi` text,
  `request_id` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `system_sql_log`
--

INSERT INTO `system_sql_log` (`id`, `logdate`, `login`, `database_name`, `sql_command`, `statement_type`, `access_ip`, `transaction_id`, `log_trace`, `session_id`, `class_name`, `php_sapi`, `request_id`, `log_year`, `log_month`, `log_day`) VALUES
(1, '2022-04-23 23:51:23', 'admin', 'permission', 'UPDATE system_user SET name = \'Administrator\', login = \'admin\', email = \'admin@test.com\', system_unit_id = NULL, frontpage_id = \'6\' WHERE (id = \'1\')', 'UPDATE', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'UPDATE system_u...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'UPDATE system_u...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(187): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemUserForm->onSave(Array)\n#4 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#9 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(2, '2022-04-23 23:51:23', 'admin', 'permission', 'DELETE FROM system_user_group WHERE (system_user_id = \'1\')', 'DELETE', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRepository.php(503): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(250): Adianti\\Database\\TRepository->delete()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(188): SystemUser->clearParts()\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(3, '2022-04-23 23:51:23', 'admin', 'permission', 'DELETE FROM system_user_unit WHERE (system_user_id = \'1\')', 'DELETE', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRepository.php(503): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(251): Adianti\\Database\\TRepository->delete()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(188): SystemUser->clearParts()\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(4, '2022-04-23 23:51:23', 'admin', 'permission', 'DELETE FROM system_user_program WHERE (system_user_id = \'1\')', 'DELETE', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRepository.php(503): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(252): Adianti\\Database\\TRepository->delete()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(188): SystemUser->clearParts()\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(5, '2022-04-23 23:51:23', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (\'1\', \'1\', 21)', 'INSERT', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(127): Adianti\\Database\\TRecord->store()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(6, '2022-04-23 23:51:23', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (\'2\', \'1\', 22)', 'INSERT', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(127): Adianti\\Database\\TRecord->store()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(7, '2022-04-23 23:51:23', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (\'3\', \'1\', 23)', 'INSERT', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(127): Adianti\\Database\\TRecord->store()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(8, '2022-04-23 23:51:23', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (\'4\', \'1\', 24)', 'INSERT', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(127): Adianti\\Database\\TRecord->store()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23'),
(9, '2022-04-23 23:51:23', 'admin', 'permission', 'INSERT INTO system_user_group (system_group_id, system_user_id, id) VALUES (\'5\', \'1\', 25)', 'INSERT', '::1', '626490fb882d6', '#0 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TTransaction.php(224): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\database\\TRecord.php(644): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\model\\admin\\SystemUser.class.php(127): Adianti\\Database\\TRecord->store()\n#3 C:\\xampp\\htdocs\\producao\\SUPORTE\\app\\control\\admin\\SystemUserForm.class.php(194): SystemUser->addSystemUserGroup(Object(SystemGroup))\n#4 [internal function]: SystemUserForm->onSave(Array)\n#5 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(59): call_user_func(Array, Array)\n#6 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\control\\TPage.php(213): Adianti\\Control\\TPage->run()\n#7 C:\\xampp\\htdocs\\producao\\SUPORTE\\lib\\adianti\\core\\AdiantiCoreApplication.php(82): Adianti\\Control\\TPage->show(Array)\n#8 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\xampp\\htdocs\\producao\\SUPORTE\\engine.php(64): TApplication::run()\n#10 {main}', 'vcds88dsojee03m4671mlre55j', 'SystemUserForm', 'apache2handler', '626490fb5e110', '2022', '04', '23');

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
