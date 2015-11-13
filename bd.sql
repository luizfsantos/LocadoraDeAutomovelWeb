CREATE DATABASE  IF NOT EXISTS `locadora_de_automovel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `locadora_de_automovel`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora_de_automovel
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acessorios`
--

DROP TABLE IF EXISTS `acessorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acessorios` (
  `ace_cha_automovel` varchar(20) DEFAULT NULL,
  `navegador_gps` int(1) DEFAULT NULL,
  `cadeira_de_bebe` int(1) DEFAULT NULL,
  `motorista` int(1) DEFAULT NULL,
  KEY `acessorio_ibfk_1` (`ace_cha_automovel`),
  CONSTRAINT `acessorios_ibfk_1` FOREIGN KEY (`ace_cha_automovel`) REFERENCES `automovel` (`chassi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automovel`
--

DROP TABLE IF EXISTS `automovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automovel` (
  `id_automovel` int(11) NOT NULL AUTO_INCREMENT,
  `chassi` varchar(20) DEFAULT NULL,
  `placa` varchar(8) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `fabricante` varchar(20) DEFAULT NULL,
  `grupo` int(2) DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `situacao` int(1) DEFAULT NULL,
  `agencia` int(3) DEFAULT NULL,
  `cidade_agencia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_automovel`),
  UNIQUE KEY `chassi_UNIQUE` (`chassi`),
  KEY `key_1` (`id_automovel`,`chassi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `cpfPassaporte` varchar(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `rg` int(9) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `estado_emissor` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `validade_carteira_de_motorista` varchar(10) DEFAULT NULL,
  `data_nascimento` varchar(10) DEFAULT NULL,
  `tempo_habilitacao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpfPassaporte` (`cpfPassaporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao` (
  `devo_numero_locacao` int(11) DEFAULT NULL,
  `data_devolucao` varchar(11) DEFAULT NULL,
  `km_percorrido` int(11) DEFAULT NULL,
  `agencia_devolucao` varchar(60) DEFAULT NULL,
  KEY `fk_numero_devolucao_idx` (`devo_numero_locacao`),
  CONSTRAINT `fk_numero_devolucao` FOREIGN KEY (`devo_numero_locacao`) REFERENCES `emprestimo` (`numero_locacao`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `data_emprestimo` varchar(11) DEFAULT NULL,
  `data_devolucao` varchar(11) DEFAULT NULL,
  `hora_emprestimo` varchar(5) DEFAULT NULL,
  `hora_devolucao` varchar(5) DEFAULT NULL,
  `tipo_tarifa` int(1) DEFAULT NULL,
  `local_emprestimo` int(3) DEFAULT NULL,
  `local_devolucao` int(3) DEFAULT NULL,
  `emp_id_automovel` int(11) DEFAULT NULL,
  `emp_id_cliente` int(11) DEFAULT NULL,
  `ativo` int(1) DEFAULT NULL,
  `numero_locacao` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numero_locacao`),
  KEY `local_emprestimo` (`local_emprestimo`),
  KEY `emp_id_automovel` (`emp_id_automovel`),
  KEY `emp_id_cliente` (`emp_id_cliente`),
  CONSTRAINT `emprestimo_fk_automovel` FOREIGN KEY (`emp_id_automovel`) REFERENCES `automovel` (`id_automovel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emprestimo_ibfk_3` FOREIGN KEY (`emp_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagens_url`
--

DROP TABLE IF EXISTS `imagens_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagens_url` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `img_cha_automovel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `imagens_url_ibfk_1` (`img_cha_automovel`),
  CONSTRAINT `imagens_url_ibfk_1` FOREIGN KEY (`img_cha_automovel`) REFERENCES `automovel` (`chassi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `pag_id_cliente` int(11) DEFAULT NULL,
  `pag_id_emprestimo` int(11) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome_do_titular` varchar(50) NOT NULL,
  `valor` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `pag_id_cliente` (`pag_id_cliente`),
  KEY `fk_pagamento_num_devolucao` (`pag_id_emprestimo`),
  CONSTRAINT `fk_pagamento_num_devolucao` FOREIGN KEY (`pag_id_emprestimo`) REFERENCES `emprestimo` (`numero_locacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`pag_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifa` (
  `id_tarifa` int(11) NOT NULL AUTO_INCREMENT,
  `tarifa_km_livre` double(5,2) DEFAULT NULL,
  `controlado_inicial` double(5,2) DEFAULT NULL,
  `controlado_km` double(5,2) DEFAULT NULL,
  `tarifa_automovel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`),
  KEY `automovel_fk_idx` (`tarifa_automovel`),
  CONSTRAINT `automovel_fk` FOREIGN KEY (`tarifa_automovel`) REFERENCES `automovel` (`chassi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `tel_id_cliente` int(11) DEFAULT NULL,
  `numero_telefone` varchar(11) DEFAULT NULL,
  KEY `tel_id_cliente` (`tel_id_cliente`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`tel_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13  0:24:28
