CREATE DATABASE  IF NOT EXISTS `sgft` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sgft`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: sgft
-- ------------------------------------------------------
-- Server version	5.1.46-community

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
-- Table structure for table `chamado_cliente`
--

DROP TABLE IF EXISTS `chamado_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_cliente` (
  `cod_chamado` int(11) NOT NULL AUTO_INCREMENT,
  `cod_status` int(11) NOT NULL DEFAULT '1',
  `cod_passageiro` int(11) NOT NULL,
  `rua_origem` varchar(45) NOT NULL,
  `numero_origem` varchar(10) NOT NULL,
  `bairro_origem` varchar(45) NOT NULL,
  `cidade_origem` varchar(45) NOT NULL,
  `estado_origem` char(2) NOT NULL,
  `cep_origem` varchar(15) NOT NULL,
  `rua_destino` varchar(45) NOT NULL,
  `numero_destino` varchar(10) NOT NULL,
  `bairro_destino` varchar(45) NOT NULL,
  `cidade_destino` varchar(45) NOT NULL,
  `estado_destino` char(2) NOT NULL,
  `cep_destino` varchar(45) NOT NULL,
  `dataInclusao` datetime NOT NULL,
  `complemento_origem` varchar(45) DEFAULT NULL,
  `complemento_destino` varchar(45) DEFAULT NULL,
  `justificativa` varchar(2000) DEFAULT NULL,
  `convenio` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`cod_chamado`),
  KEY `FK_cod_status` (`cod_status`),
  KEY `FK_cod_passageiro` (`cod_passageiro`),
  CONSTRAINT `FK_cod_passageiro` FOREIGN KEY (`cod_passageiro`) REFERENCES `passageiro` (`cod_passageiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cod_status` FOREIGN KEY (`cod_status`) REFERENCES `status` (`cod_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_cliente`
--

LOCK TABLES `chamado_cliente` WRITE;
/*!40000 ALTER TABLE `chamado_cliente` DISABLE KEYS */;
INSERT INTO `chamado_cliente` VALUES (36,4,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','av interlagos','3501','','sao paulo','SP','','2010-12-09 23:42:18','','','chamado cancelado','S'),(37,5,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','av hermilo alves','523','','sao paulo','SP','','2010-12-09 23:51:28','','','chamado cancelado','N'),(38,5,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Av. Alcantara Machado','120','','São Paulo','SP','','2010-12-10 00:38:47','','',NULL,'S'),(39,5,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Av. Roberto Marinho','372','','São Paulo','SP','','2010-12-10 00:52:13','','',NULL,'S'),(40,5,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Av. Getulio Vargas','105','','São Paulo','SP','','2010-12-10 00:59:34','','',NULL,'S'),(41,4,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','fsdafd','5432','','São Paulo','SP','','2010-12-10 01:18:17','','','dhglkdhfkjhgsdlkjhl','N'),(42,4,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Av. Roberto Marinho','454','','São Paulo','SP','','2010-12-10 01:20:28','','','boa noiteeeeee','N'),(43,4,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Av. Rebouças','87','','São Paulo','SP','','2010-12-10 21:35:24','','','já era essa porra do caralho','N'),(44,5,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Av. Jabaquara','182','','São Paulo','SP','','2010-12-10 22:42:00','','',NULL,'N'),(45,5,36,'Atuaí','140','','São Paulo','SP','','Rua Serra de Jaire','941','Quarta Parada','Sao Paulo','SP','03175010','2010-12-12 16:35:11','','',NULL,'N'),(46,5,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Rua Itinguçu','342','','São Paulo','SP','','2010-12-12 18:45:58','','',NULL,'N'),(47,5,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Av. Indianópolis','45','','São Paulo','SP','','2010-12-12 18:56:36','','',NULL,'N'),(48,4,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Av. Ribeiro','34','','São Paulo','SP','','2010-12-12 19:06:04','','','fadsfasdfdsaf','N'),(49,5,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','av. teste','34','','s','SP','','2010-12-12 19:22:58','','',NULL,'N'),(50,4,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Av. Paulista','43','Cerqueira Cesar','São Paulo','SP','','2010-12-12 22:07:34','','','jhnkjhnkjkj','N'),(51,4,38,'Ilha de Tatuoca','159','São Miguel','São Paulo','SP','08042120','Ilha de Tatuoca','130','São Miguel','São Paulo','SP','08042120','2010-12-13 15:38:54','Cidade Nova','Complemento','teste antes da apresentação','S'),(52,5,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Ilha de Tatuoca','129','São Miguel','São Paulo','SP','08042120','2010-12-13 16:31:58','Complemento','cemiterio',NULL,'N'),(53,4,36,'Rua Amborés','106','Cidade Vargas','São Paulo','SP','','Ilha de Tatuoca','129','São Miguel','São Paulo','SP','08042120','2010-12-13 16:42:04','','','teste antes da apresentação','N'),(54,5,39,'Ilha de Tatuoca','130','São Miguel','São Paulo','SP','08042120','Ilha de Tatuoca','130','São Miguel','São Paulo','SP','08042120','2010-12-13 17:03:06','','',NULL,'N'),(55,5,39,'Ilha de Tatuoca','130','São Miguel','São Paulo','SP','08042120','Rua Vicente Xavier','123','Vila Regina','São Paulo','SP','08225240','2010-12-13 19:50:18','','',NULL,'N'),(56,4,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Rua Vicente Xavier','123','Vila Regina','São Paulo','SP','08225240','2010-12-13 19:56:19','','','errooo hjhj','N'),(57,6,37,'Av. Jabaquara','1501','Saúde','São Paulo','SP','','Rua Serra de Jairé','941','Quarta Parada','São Paulo','SP','03175010','2010-12-13 20:07:36','','',NULL,'N');
/*!40000 ALTER TABLE `chamado_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:48
