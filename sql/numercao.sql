-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.5.4-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para numeracaodoc
CREATE DATABASE IF NOT EXISTS `numeracaodoc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `numeracaodoc`;

-- Copiando estrutura para tabela numeracaodoc.certidoes
CREATE TABLE IF NOT EXISTS `certidoes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numero` varchar(100) NOT NULL DEFAULT '0',
  `datacada` date NOT NULL,
  `codcredor` int(10) NOT NULL DEFAULT 0,
  `finalidade` varchar(255) NOT NULL DEFAULT '0',
  `datavalidade` date NOT NULL DEFAULT '0000-00-00',
  `status` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela numeracaodoc.credores
CREATE TABLE IF NOT EXISTS `credores` (
  `codcredor` int(11) NOT NULL AUTO_INCREMENT,
  `credor` varchar(70) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `cidade` varchar(70) DEFAULT NULL,
  `doc` varchar(18) DEFAULT NULL,
  `doc1` varchar(18) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `datacad` datetime DEFAULT NULL,
  `tp` int(1) DEFAULT 0,
  KEY `CODCREDOR` (`codcredor`) USING BTREE
) ENGINE=Aria AUTO_INCREMENT=1300 DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela numeracaodoc.entes
CREATE TABLE IF NOT EXISTS `entes` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela numeracaodoc.numleis
CREATE TABLE IF NOT EXISTS `numleis` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `ente` int(6) NOT NULL,
  `numero` int(6) NOT NULL DEFAULT 0,
  `tipo` int(1) NOT NULL DEFAULT 0,
  `ementa` text NOT NULL,
  `data` date NOT NULL,
  `idusuario` int(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela numeracaodoc.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `usuario` varchar(40) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `nivel` int(1) DEFAULT 0,
  `ano` int(4) DEFAULT 0,
  `mes` int(2) DEFAULT 0,
  `ativa` int(1) DEFAULT 0,
  `email` varchar(100) DEFAULT '0',
  `datacadastro` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dataatual` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
