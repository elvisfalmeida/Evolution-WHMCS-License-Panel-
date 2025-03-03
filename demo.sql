-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 02/03/2025 às 21:11
-- Versão do servidor: 10.6.21-MariaDB-cll-lve
-- Versão do PHP: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ebytenet_evopanellicense`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@whmcs.com.br', '$2y$10$eCZ1LLO293JpCsgHR7iuve733yYFtBaEqtZmL.6GeuiKXj80KG74S', '2025-03-01 00:51:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `admin_id`, `action`, `details`, `created_at`) VALUES
(18, 1, 'Atualização de Configurações', 'Config keys atualizadas: smtp_encryption, smtp_from_address, smtp_from_name, smtp_host, smtp_password, smtp_port, smtp_username, token_expiration', '2025-03-03 00:00:32'),
(19, 1, 'Atualização de Configurações', 'Config keys atualizadas: smtp_encryption, smtp_from_address, smtp_from_name, smtp_host, smtp_password, smtp_port, smtp_username, token_expiration', '2025-03-03 00:11:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `configurations`
--

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `config_key` varchar(100) NOT NULL,
  `config_value` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `configurations`
--

INSERT INTO `configurations` (`id`, `config_key`, `config_value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'smtp_host', 'mail.meudominio.com.br', 'Servidor SMTP para envio de e-mails', '2025-03-01 01:32:44', '2025-03-03 00:00:32'),
(2, 'smtp_username', 'noreply@meudominio.com.br', 'E-mail usado para envio SMTP', '2025-03-01 01:32:44', '2025-03-03 00:00:32'),
(3, 'smtp_password', ']gB!npgv1L6U', 'Senha do e-mail SMTP', '2025-03-01 01:32:44', '2025-03-01 01:32:44'),
(4, 'smtp_port', '587', 'Porta do SMTP', '2025-03-01 01:32:44', '2025-03-01 01:32:44'),
(5, 'token_expiration', '7200', 'Tempo de expiração do token em segundos (ex.: 7200 = 2 horas)', '2025-03-01 01:32:44', '2025-03-01 01:32:44'),
(6, 'smtp_from_address', 'noreply@meudominio.com.br', 'Endereço de e-mail do remetente (FROM)', '2025-03-01 01:57:04', '2025-03-03 00:00:32'),
(7, 'smtp_from_name', 'Suporte Licenciamento', 'Nome do remetente (FROM)', '2025-03-01 01:57:04', '2025-03-01 01:57:04'),
(8, 'smtp_encryption', 'tls', 'Criptografia usada no SMTP: tls, ssl ou none', '2025-03-01 01:57:04', '2025-03-01 01:57:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `license_key` varchar(100) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `status` enum('active','expired','suspended') DEFAULT 'active',
  `expiration_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices de tabela `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Índices de tabela `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Índices de tabela `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `config_key` (`config_key`);

--
-- Índices de tabela `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_key` (`license_key`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD CONSTRAINT `admin_password_resets_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
