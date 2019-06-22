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

--
-- Table structure for table `chamado_final`
--

DROP TABLE IF EXISTS `chamado_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_final` (
  `cod_fechamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_chamado` int(11) NOT NULL,
  `id_dispositivo` varchar(40) NOT NULL,
  `data_fechamento` datetime NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`cod_fechamento`),
  KEY `FK_cod_chamado_final` (`cod_chamado`),
  KEY `FK_id_dispositivo_final` (`id_dispositivo`),
  CONSTRAINT `FK_cod_chamado_final` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo_final` FOREIGN KEY (`id_dispositivo`) REFERENCES `chamado_motorista_aceite` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_final`
--

LOCK TABLES `chamado_final` WRITE;
/*!40000 ALTER TABLE `chamado_final` DISABLE KEYS */;
INSERT INTO `chamado_final` VALUES (12,37,'2','2010-12-10 00:37:14',50),(13,38,'2','2010-12-10 00:53:50',25),(14,39,'1','2010-12-10 00:56:15',25),(15,40,'1','2010-12-10 01:00:55',3000),(16,44,'1','2010-12-10 22:44:24',30),(17,45,'1','2010-12-12 16:59:38',120),(18,46,'1','2010-12-12 18:53:34',100),(19,47,'2','2010-12-12 18:59:53',34),(20,49,'2','2010-12-12 19:23:55',36),(21,52,'91293092','2010-12-13 16:35:40',100),(22,54,'91293092','2010-12-13 17:04:08',500),(23,55,'91293092','2010-12-13 20:01:56',100);
/*!40000 ALTER TABLE `chamado_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado_motorista_aceite`
--

DROP TABLE IF EXISTS `chamado_motorista_aceite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_motorista_aceite` (
  `cod_aceite` int(11) NOT NULL AUTO_INCREMENT,
  `id_dispositivo` varchar(40) NOT NULL,
  `cod_chamado` int(11) NOT NULL,
  `data_aceite` datetime NOT NULL,
  `justificativa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_aceite`),
  KEY `FK_id_dispositivo_aceite` (`id_dispositivo`),
  KEY `FK_cod_chamado_aceite` (`cod_chamado`),
  CONSTRAINT `FK_cod_chamado_aceite` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo_aceite` FOREIGN KEY (`id_dispositivo`) REFERENCES `chamado_motorista_envio` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_motorista_aceite`
--

LOCK TABLES `chamado_motorista_aceite` WRITE;
/*!40000 ALTER TABLE `chamado_motorista_aceite` DISABLE KEYS */;
INSERT INTO `chamado_motorista_aceite` VALUES (36,'2',36,'2010-12-09 23:52:49','Testeeeeeeee\r\n'),(37,'1',37,'2010-12-09 23:57:27','Testeeeee'),(38,'2',37,'2010-12-09 23:58:56',NULL),(39,'2',37,'2010-12-09 23:59:36',NULL),(40,'2',37,'2010-12-10 00:10:34',NULL),(41,'2',37,'2010-12-10 00:13:00',NULL),(42,'2',37,'2010-12-10 00:13:47',NULL),(43,'2',38,'2010-12-10 00:53:01',NULL),(44,'2',38,'2010-12-10 00:53:12',NULL),(45,'1',39,'2010-12-10 00:55:41',NULL),(46,'1',40,'2010-12-10 01:00:34',NULL),(47,'2',42,'2010-12-10 01:39:20','Chamado recusado por demora de resposta'),(48,'2',43,'2010-12-10 21:40:01','desculpaaaaaa'),(49,'2',44,'2010-12-10 22:43:06','recusei essa porra'),(50,'1',44,'2010-12-10 22:44:07',NULL),(51,'1',45,'2010-12-12 16:37:01',NULL),(52,'2',46,'2010-12-12 18:52:32','VAI SE FODER'),(53,'1',46,'2010-12-12 18:53:13',NULL),(54,'2',47,'2010-12-12 18:58:25',NULL),(55,'2',49,'2010-12-12 19:23:49',NULL),(56,'91293092',51,'2010-12-13 16:25:48','Não quero ir até lah.. é muito longe!!'),(57,'91293092',52,'2010-12-13 16:34:45',NULL),(58,'91293092',53,'2010-12-13 16:51:34','Chamado recusado por demora de resposta'),(59,'91293092',54,'2010-12-13 17:03:50',NULL),(60,'91293092',55,'2010-12-13 20:01:12',NULL),(61,'91293092',57,'2010-12-13 20:17:12','Chamado recusado por demora de resposta');
/*!40000 ALTER TABLE `chamado_motorista_aceite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado_motorista_envio`
--

DROP TABLE IF EXISTS `chamado_motorista_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_motorista_envio` (
  `cod_envio` int(11) NOT NULL AUTO_INCREMENT,
  `cod_chamado` int(11) NOT NULL,
  `id_dispositivo` varchar(40) NOT NULL,
  `data_envio` datetime NOT NULL,
  PRIMARY KEY (`cod_envio`),
  KEY `FK_cod_chamado` (`cod_chamado`),
  KEY `FK_id_dispositivo` (`id_dispositivo`),
  CONSTRAINT `FK_cod_chamado` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo` FOREIGN KEY (`id_dispositivo`) REFERENCES `motorista` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_motorista_envio`
--

LOCK TABLES `chamado_motorista_envio` WRITE;
/*!40000 ALTER TABLE `chamado_motorista_envio` DISABLE KEYS */;
INSERT INTO `chamado_motorista_envio` VALUES (28,36,'2','2010-12-09 23:42:19'),(29,37,'1','2010-12-09 23:51:29'),(30,37,'2','2010-12-09 23:57:27'),(31,38,'2','2010-12-10 00:50:00'),(32,39,'1','2010-12-10 00:52:13'),(33,40,'1','2010-12-10 00:59:35'),(34,42,'2','2010-12-10 01:20:28'),(35,43,'2','2010-12-10 21:35:27'),(36,43,'1','2010-12-10 21:40:02'),(37,44,'2','2010-12-10 22:42:01'),(38,44,'1','2010-12-10 22:43:08'),(39,45,'1','2010-12-12 16:35:12'),(40,46,'2','2010-12-12 18:46:00'),(41,46,'1','2010-12-12 18:52:32'),(42,47,'2','2010-12-12 18:56:36'),(43,48,'2','2010-12-12 19:06:06'),(44,49,'2','2010-12-12 19:22:58'),(45,51,'91293092','2010-12-13 15:50:00'),(46,52,'91293092','2010-12-13 16:31:58'),(47,53,'91293092','2010-12-13 16:42:04'),(48,54,'91293092','2010-12-13 17:03:07'),(49,55,'91293092','2010-12-13 19:55:00'),(50,57,'91293092','2010-12-13 20:07:37');
/*!40000 ALTER TABLE `chamado_motorista_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convenio` (
  `cod_convenio` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  `nome_fantasia` varchar(45) NOT NULL,
  `cnpj` varchar(16) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` char(2) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `ddd` varchar(5) DEFAULT NULL,
  `valor_limite` varchar(15) DEFAULT NULL,
  `valor_gasto` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (8,'Santander Banespa SA','Santander','66730247000171','São Paulo','SP','Av. Interlagos','Interlagos','3501','','','2010-12-09 23:27:37','','50502121','11','3000','3050.0'),(9,'Sistema de gerenciamento de chamados de táxi','SGCT','75644359000109','São Paulo','SP','Ilha de Tatuoca','São Miguel','129','08042120','','2010-12-13 15:27:28','Cemitério','34386065','11','500.00','0');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `cod_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` char(2) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_endereco`),
  UNIQUE KEY `cep_UNIQUE` (`cep`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Ilha de Tatuoca',NULL,'São Miguel','São Paulo','SP',NULL,'08042120'),(2,'Rua Vicente Xavier',NULL,'Vila Regina','São Paulo','SP',NULL,'08225240'),(3,'Rua Serra de Jairé',NULL,'Quarta Parada','São Paulo','SP',NULL,'03175010');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `telefone` char(9) DEFAULT NULL,
  `ddd` char(3) DEFAULT NULL,
  PRIMARY KEY (`cod_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (79,'Bruno','00410076899',NULL,'32324565','11'),(80,'Vinicius Basculante','36983386884','','77507200','11'),(81,'Bruno Lima','35728068871','','80945167','11'),(82,'fernando','00690688873',NULL,'0','11'),(83,'Fernando Luchiari Duarte da Silva','35207774875','','',''),(84,'User','33388458553','','',''),(85,'Rita de Cassia Moraes','35851089890','421198655','34386065','11'),(86,'everton','34630644806','','',''),(87,'Senhorinha Branquinha','22945711508','','','');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `cod_log` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_alteracao` varchar(100) NOT NULL,
  `id_usuario` varchar(15) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `tipo_usuario` char(1) NOT NULL,
  PRIMARY KEY (`cod_log`),
  UNIQUE KEY `cod_log_UNIQUE` (`cod_log`),
  KEY `cod_alteracao` (`tipo_alteracao`),
  KEY `cod_funcionario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1494,'Acesso ao sistema','brunin','2010-12-09 23:21:09','Login brunin acessou o sistema','U'),(1495,'Inclusao de motorista','brunin','2010-12-09 23:22:57','Inclusao do motorista com o id_dispositivo 1','U'),(1496,'Consulta de motorista','brunin','2010-12-09 23:23:14','Consulta através do parâmetro  como ','U'),(1497,'Acesso ao sistema movel','1','2010-12-09 23:23:37','Motorista com id 1conectando ao sistema movel ','M'),(1498,'Inclusao de passageiro','brunin','2010-12-09 23:26:14','Inclusao do passageiro com o cpf 23022708866','U'),(1499,'Inclusao de convenio','brunin','2010-12-09 23:27:37','Inclusão do convênio com o cnpj 66730247000171','U'),(1500,'Consulta de passageiro','brunin','2010-12-09 23:28:37','Consulta através do parâmetro denis como Nome','U'),(1501,'Consulta de convenio','brunin','2010-12-09 23:28:49','Consulta através do parâmetro  como ','U'),(1502,'Consulta de passageiro','brunin','2010-12-09 23:29:01','Consulta através do parâmetro denis como Nome','U'),(1503,'Alteracao de passageiro','brunin','2010-12-09 23:29:11','Alteração do passageiro com o cpf null','U'),(1504,'Consulta de convenio','brunin','2010-12-09 23:29:27','Consulta através do parâmetro  como ','U'),(1505,'Consulta de passageiro por convenio','brunin','2010-12-09 23:29:35','Consulta através da tela de alteração do convênio código 8','U'),(1506,'Inclusao de passageiro','brunin','2010-12-09 23:33:37','Inclusao do passageiro com o cpf 51365556450','U'),(1507,'Consulta de convenio','brunin','2010-12-09 23:33:43','Consulta através do parâmetro  como ','U'),(1508,'Consulta de convenio','brunin','2010-12-09 23:33:43','Consulta através do parâmetro  como ','U'),(1509,'Consulta de passageiro por convenio','brunin','2010-12-09 23:33:47','Consulta através da tela de alteração do convênio código 8','U'),(1510,'Consulta de passageiro','brunin','2010-12-09 23:35:32','Consulta através do parâmetro  como Nome','U'),(1511,'Acesso ao sistema movel web','1','2010-12-09 23:36:21','Motorista de id 1 acessou o sistema móvel web','U'),(1512,'Inclusao de motorista','brunin','2010-12-09 23:36:35','Inclusao do motorista com o id_dispositivo 2','U'),(1513,'Acesso ao sistema movel','2','2010-12-09 23:37:03','Motorista com id 2conectando ao sistema movel ','M'),(1514,'Consulta de motorista','brunin','2010-12-09 23:37:10','Consulta através do parâmetro Bruno como Nome funcionário','U'),(1515,'Alteracao de motorista','brunin','2010-12-09 23:37:19','Alteração do motorista com o id_dispositivo 2','U'),(1516,'Insercao de coordenadas','2','2010-12-09 23:38:17','Motorista com id 2gravando coordenadas no sistema ','M'),(1517,'Insercao de coordenadas','1','2010-12-09 23:38:38','Motorista com id 1gravando coordenadas no sistema ','M'),(1518,'Encerrar sessao no sistema móvel','1','2010-12-09 23:40:25','Motorista com id 1desconectando do sistema movel ','M'),(1519,'Acesso ao sistema movel web','2','2010-12-09 23:40:55','Motorista de id 2 acessou o sistema móvel web','U'),(1520,'Consulta de passageiro','brunin','2010-12-09 23:41:16','Consulta através do parâmetro a como Nome','U'),(1521,'Inclusao de chamado','brunin','2010-12-09 23:42:18','Inclusao do chamdo com o código 36','U'),(1522,'Consulta de chamado','brunin','2010-12-09 23:42:32','Consulta de todos os chamados','U'),(1523,'Acesso ao sistema movel','1','2010-12-09 23:46:01','Motorista com id 1conectando ao sistema movel ','M'),(1524,'Acesso ao sistema movel','1','2010-12-09 23:46:26','Motorista com id 1conectando ao sistema movel ','M'),(1525,'Acesso ao sistema movel','1','2010-12-09 23:46:26','Motorista com id 1conectando ao sistema movel ','M'),(1526,'Acesso ao sistema movel','1','2010-12-09 23:49:59','Motorista com id 1conectando ao sistema movel ','M'),(1527,'Consulta de passageiro','brunin','2010-12-09 23:50:39','Consulta através do parâmetro a como Nome','U'),(1528,'Inclusao de chamado','brunin','2010-12-09 23:51:28','Inclusao do chamdo com o código 37','U'),(1529,'Consulta de chamado','brunin','2010-12-09 23:51:36','Consulta de todos os chamados','U'),(1530,'Consulta de chamado','brunin','2010-12-09 23:51:58','Consulta de todos os chamados','U'),(1531,'Expirou sessão','1','2010-12-09 23:52:10','Login null expirou a sessão','U'),(1532,'Recusar Chamado','2','2010-12-09 23:52:24','Login 2 Recusou o chamado','U'),(1533,'Chamado nao aceito','2','2010-12-09 23:52:49','Login 2não aceitou o chamado','U'),(1534,'Consulta de chamado','brunin','2010-12-09 23:53:28','Consulta de todos os chamados','U'),(1535,'Acesso ao sistema movel web','1','2010-12-09 23:57:04','Motorista de id 1 acessou o sistema móvel web','U'),(1536,'Recusar Chamado','1','2010-12-09 23:57:15','Login 1 Recusou o chamado','U'),(1537,'Chamado nao aceito','1','2010-12-09 23:57:27','Login 1não aceitou o chamado','U'),(1538,'Consulta de chamado','brunin','2010-12-09 23:58:08','Consulta de todos os chamados','U'),(1539,'Aceitar Chamado','2','2010-12-09 23:58:56','Login 2 Aceitou o chamado','U'),(1540,'Consulta de chamado','brunin','2010-12-09 23:59:16','Consulta de todos os chamados','U'),(1541,'Aceitar Chamado','2','2010-12-09 23:59:36','Login 2 Aceitou o chamado','U'),(1542,'Consulta de chamado','brunin','2010-12-09 23:59:42','Consulta de todos os chamados','U'),(1543,'Cancelamento de chamado','brunin','2010-12-10 00:00:53','Cancelamento do chamado com o código 37','U'),(1544,'Consulta de chamado','brunin','2010-12-10 00:01:02','Consulta de todos os chamados','U'),(1545,'Cancelamento de chamado','brunin','2010-12-10 00:01:18','Cancelamento do chamado com o código 36','U'),(1546,'Encerrar sessao','2','2010-12-10 00:01:27','Login 2 encerrou a sessão','U'),(1547,'Encerrar sessao','1','2010-12-10 00:01:32','Login 1 encerrou a sessão','U'),(1548,'Acesso ao sistema movel web','2','2010-12-10 00:03:02','Motorista de id 2 acessou o sistema móvel web','U'),(1549,'Consulta de chamado','brunin','2010-12-10 00:05:02','Consulta de todos os chamados','U'),(1550,'Consulta de convenio','brunin','2010-12-10 00:05:30','Consulta através do parâmetro  como ','U'),(1551,'Encerrar sessao','2','2010-12-10 00:08:35','Login 2 encerrou a sessão','U'),(1552,'Acesso ao sistema movel web','2','2010-12-10 00:08:58','Motorista de id 2 acessou o sistema móvel web','U'),(1553,'Aceitar Chamado','2','2010-12-10 00:10:34','Login 2 Aceitou o chamado','U'),(1554,'Expirou sessão','1','2010-12-10 00:11:33','Login null expirou a sessão','U'),(1555,'Expirou sessão','2','2010-12-10 00:11:33','Login null expirou a sessão','U'),(1556,'Encerrar sessao','2','2010-12-10 00:12:47','Login 2 encerrou a sessão','U'),(1557,'Acesso ao sistema movel web','2','2010-12-10 00:12:57','Motorista de id 2 acessou o sistema móvel web','U'),(1558,'Aceitar Chamado','2','2010-12-10 00:13:00','Login 2 Aceitou o chamado','U'),(1559,'Acesso ao sistema movel web','2','2010-12-10 00:13:46','Motorista de id 2 acessou o sistema móvel web','U'),(1560,'Aceitar Chamado','2','2010-12-10 00:13:47','Login 2 Aceitou o chamado','U'),(1561,'Expirou sessão','brunin','2010-12-10 00:16:34','Login null expirou a sessão','U'),(1562,'Acesso ao sistema movel web','2','2010-12-10 00:18:23','Motorista de id 2 acessou o sistema móvel web','U'),(1563,'Acesso ao sistema movel web','2','2010-12-10 00:20:05','Motorista de id 2 acessou o sistema móvel web','U'),(1564,'Expirou sessão','2','2010-12-10 00:23:11','Login null expirou a sessão','U'),(1565,'Acesso ao sistema movel web','2','2010-12-10 00:26:34','Motorista de id 2 acessou o sistema móvel web','U'),(1566,'Acesso ao sistema movel web','2','2010-12-10 00:29:23','Motorista de id 2 acessou o sistema móvel web','U'),(1567,'Acesso ao sistema','brunin','2010-12-10 00:36:12','Login brunin acessou o sistema','U'),(1568,'Acesso ao sistema movel web','2','2010-12-10 00:36:37','Motorista de id 2 acessou o sistema móvel web','U'),(1569,'Chamado finalizado','2','2010-12-10 00:37:14','Login 2finalizou o chamado','U'),(1570,'Consulta de convenio','brunin','2010-12-10 00:37:23','Consulta através do parâmetro  como ','U'),(1571,'Consulta de chamado','brunin','2010-12-10 00:37:35','Consulta de todos os chamados','U'),(1572,'Consulta de convenio','brunin','2010-12-10 00:37:50','Consulta através do parâmetro  como ','U'),(1573,'Consulta de passageiro por convenio','brunin','2010-12-10 00:37:55','Consulta através da tela de alteração do convênio código 8','U'),(1574,'Consulta de passageiro','brunin','2010-12-10 00:38:07','Consulta através do parâmetro  como Nome','U'),(1575,'Inclusao de chamado','brunin','2010-12-10 00:38:47','Inclusao do chamdo com o código 38','U'),(1576,'Consulta de chamado','brunin','2010-12-10 00:38:52','Consulta de todos os chamados','U'),(1577,'Expirou sessão','2','2010-12-10 00:40:27','Login null expirou a sessão','U'),(1578,'Encerrar sessao','2','2010-12-10 00:40:32','Login 2 encerrou a sessão','U'),(1579,'Consulta de chamado','brunin','2010-12-10 00:40:37','Consulta de todos os chamados','U'),(1580,'Acesso ao sistema movel web','2','2010-12-10 00:40:51','Motorista de id 2 acessou o sistema móvel web','U'),(1581,'Acesso ao sistema','fe','2010-12-10 00:41:02','Login fe acessou o sistema','U'),(1582,'Acesso ao sistema movel','2','2010-12-10 00:42:28','Motorista com id 2conectando ao sistema movel ','M'),(1583,'Acesso ao sistema','brunin','2010-12-10 00:42:57','Login brunin acessou o sistema','U'),(1584,'Consulta de chamado','brunin','2010-12-10 00:43:01','Consulta de todos os chamados','U'),(1585,'Acesso ao sistema movel','1','2010-12-10 00:44:08','Motorista com id 1conectando ao sistema movel ','M'),(1586,'Acesso ao sistema movel web','1','2010-12-10 00:44:21','Motorista de id 1 acessou o sistema móvel web','U'),(1587,'Insercao de coordenadas','1','2010-12-10 00:47:42','Motorista com id 1gravando coordenadas no sistema ','M'),(1588,'Insercao de coordenadas','2','2010-12-10 00:47:59','Motorista com id 2gravando coordenadas no sistema ','M'),(1589,'Consulta de chamado','brunin','2010-12-10 00:49:02','Consulta de todos os chamados','U'),(1590,'Consulta de chamado','brunin','2010-12-10 00:49:04','Consulta de todos os chamados','U'),(1591,'Consulta de chamado','brunin','2010-12-10 00:49:06','Consulta de todos os chamados','U'),(1592,'Consulta de chamado','brunin','2010-12-10 00:49:06','Consulta de todos os chamados','U'),(1593,'Consulta de chamado','brunin','2010-12-10 00:49:07','Consulta de todos os chamados','U'),(1594,'Consulta de chamado','brunin','2010-12-10 00:49:07','Consulta de todos os chamados','U'),(1595,'Consulta de chamado','brunin','2010-12-10 00:49:08','Consulta de todos os chamados','U'),(1596,'Consulta de chamado','brunin','2010-12-10 00:49:08','Consulta de todos os chamados','U'),(1597,'Consulta de chamado','brunin','2010-12-10 00:49:08','Consulta de todos os chamados','U'),(1598,'Consulta de chamado','brunin','2010-12-10 00:49:09','Consulta de todos os chamados','U'),(1599,'Consulta de chamado','brunin','2010-12-10 00:49:53','Consulta de todos os chamados','U'),(1600,'Consulta de chamado','brunin','2010-12-10 00:50:09','Consulta de todos os chamados','U'),(1601,'Consulta de passageiro','brunin','2010-12-10 00:51:14','Consulta através do parâmetro denis como Nome','U'),(1602,'Expirou sessão','fe','2010-12-10 00:51:30','Login null expirou a sessão','U'),(1603,'Expirou sessão','brunin','2010-12-10 00:51:30','Login null expirou a sessão','U'),(1604,'Inclusao de chamado','brunin','2010-12-10 00:52:13','Inclusao do chamdo com o código 39','U'),(1605,'Consulta de chamado','brunin','2010-12-10 00:52:39','Consulta de todos os chamados','U'),(1606,'Aceitar Chamado','2','2010-12-10 00:52:54','Login 2 Aceitou o chamado','U'),(1607,'Aceitar Chamado','2','2010-12-10 00:53:08','Login 2 Aceitou o chamado','U'),(1608,'Chamado finalizado','2','2010-12-10 00:53:50','Login 2finalizou o chamado','U'),(1609,'Consulta de convenio','brunin','2010-12-10 00:54:04','Consulta através do parâmetro  como ','U'),(1610,'Consulta de chamado','brunin','2010-12-10 00:55:11','Consulta de todos os chamados','U'),(1611,'Encerrar sessao','1','2010-12-10 00:55:18','Login 1 encerrou a sessão','U'),(1612,'Acesso ao sistema movel web','1','2010-12-10 00:55:30','Motorista de id 1 acessou o sistema móvel web','U'),(1613,'Aceitar Chamado','1','2010-12-10 00:55:41','Login 1 Aceitou o chamado','U'),(1614,'Chamado finalizado','1','2010-12-10 00:56:15','Login 1finalizou o chamado','U'),(1615,'Consulta de chamado','brunin','2010-12-10 00:56:22','Consulta de todos os chamados','U'),(1616,'Consulta de convenio','brunin','2010-12-10 00:56:30','Consulta através do parâmetro  como ','U'),(1617,'Consulta de passageiro','brunin','2010-12-10 00:57:38','Consulta através do parâmetro Brandon como Nome','U'),(1618,'Encerrar sessao','1','2010-12-10 00:57:52','Login 1 encerrou a sessão','U'),(1619,'Consulta de motorista','brunin','2010-12-10 00:58:00','Consulta através do parâmetro  como ','U'),(1620,'Desativacao de motorista','brunin','2010-12-10 00:58:05','Desativação de motorista com o id_dispositivo 1','U'),(1621,'Acesso ao sistema movel web','1','2010-12-10 00:58:14','Motorista de id 1 acessou o sistema móvel web','U'),(1622,'Consulta de passageiro','brunin','2010-12-10 00:58:39','Consulta através do parâmetro bran como Nome','U'),(1623,'Inclusao de chamado','brunin','2010-12-10 00:59:34','Inclusao do chamdo com o código 40','U'),(1624,'Consulta de chamado','brunin','2010-12-10 00:59:40','Consulta de todos os chamados','U'),(1625,'Encerrar sessao','1','2010-12-10 01:00:11','Login 1 encerrou a sessão','U'),(1626,'Acesso ao sistema movel web','1','2010-12-10 01:00:25','Motorista de id 1 acessou o sistema móvel web','U'),(1627,'Aceitar Chamado','1','2010-12-10 01:00:34','Login 1 Aceitou o chamado','U'),(1628,'Chamado finalizado','1','2010-12-10 01:00:55','Login 1finalizou o chamado','U'),(1629,'Consulta de convenio','brunin','2010-12-10 01:01:14','Consulta através do parâmetro  como ','U'),(1630,'Consulta de passageiro','brunin','2010-12-10 01:01:42','Consulta através do parâmetro bran como Nome','U'),(1631,'Consulta de chamado','brunin','2010-12-10 01:02:27','Consulta de todos os chamados','U'),(1632,'Encerrar sessao','1','2010-12-10 01:02:42','Login 1 encerrou a sessão','U'),(1633,'Encerrar sessao','2','2010-12-10 01:02:42','Login 2 encerrou a sessão','U'),(1634,'Acesso ao sistema movel','2','2010-12-10 01:03:39','Motorista com id 2conectando ao sistema movel ','M'),(1635,'Encerrar sessao no sistema móvel','2','2010-12-10 01:03:52','Motorista com id 2desconectando do sistema movel ','M'),(1636,'Acesso ao sistema movel','2','2010-12-10 01:05:02','Motorista com id 2conectando ao sistema movel ','M'),(1637,'Acesso ao sistema movel web','2','2010-12-10 01:05:19','Motorista de id 2 acessou o sistema móvel web','U'),(1638,'Acesso ao sistema movel web','1','2010-12-10 01:05:25','Motorista de id 1 acessou o sistema móvel web','U'),(1639,'Encerrar sessao','1','2010-12-10 01:05:35','Login 1 encerrou a sessão','U'),(1640,'Acesso ao sistema movel','1','2010-12-10 01:06:04','Motorista com id 1conectando ao sistema movel ','M'),(1641,'Acesso ao sistema movel','1','2010-12-10 01:06:10','Motorista com id 1conectando ao sistema movel ','M'),(1642,'Acesso ao sistema movel','1','2010-12-10 01:06:12','Motorista com id 1conectando ao sistema movel ','M'),(1643,'Expirou sessão','brunin','2010-12-10 01:14:10','Login null expirou a sessão','U'),(1644,'Acesso ao sistema movel web','1','2010-12-10 01:16:15','Motorista de id 1 acessou o sistema móvel web','U'),(1645,'Encerrar sessao','1','2010-12-10 01:16:49','Login 1 encerrou a sessão','U'),(1646,'Expirou sessão','2','2010-12-10 01:16:59','Login null expirou a sessão','U'),(1647,'Acesso ao sistema','brunin','2010-12-10 01:17:36','Login brunin acessou o sistema','U'),(1648,'Consulta de passageiro','brunin','2010-12-10 01:17:46','Consulta através do parâmetro denis como Nome','U'),(1649,'Inclusao de chamado','brunin','2010-12-10 01:18:17','Inclusao do chamdo com o código 41','U'),(1650,'Consulta de chamado','brunin','2010-12-10 01:18:22','Consulta de todos os chamados','U'),(1651,'Cancelamento de chamado','brunin','2010-12-10 01:18:51','Cancelamento do chamado com o código 41','U'),(1652,'Acesso ao sistema movel web','2','2010-12-10 01:19:34','Motorista de id 2 acessou o sistema móvel web','U'),(1653,'Consulta de passageiro','brunin','2010-12-10 01:19:41','Consulta através do parâmetro Brandon como Nome','U'),(1654,'Inclusao de chamado','brunin','2010-12-10 01:20:28','Inclusao do chamdo com o código 42','U'),(1655,'Consulta de chamado','brunin','2010-12-10 01:20:37','Consulta de todos os chamados','U'),(1656,'Expirou sessão','1','2010-12-10 01:27:02','Login null expirou a sessão','U'),(1657,'Expirou sessão','brunin','2010-12-10 01:32:04','Login null expirou a sessão','U'),(1658,'Chamado nao aceito','2','2010-12-10 01:39:20','Login 2não aceitou o chamado','U'),(1659,'Acesso ao sistema','brunin','2010-12-10 01:39:40','Login brunin acessou o sistema','U'),(1660,'Consulta de chamado','brunin','2010-12-10 01:39:44','Consulta de todos os chamados','U'),(1661,'Encerrar sessao','2','2010-12-10 01:41:57','Login 2 encerrou a sessão','U'),(1662,'Cancelamento de chamado','brunin','2010-12-10 01:42:31','Cancelamento do chamado com o código 42','U'),(1663,'Acesso ao sistema movel web','2','2010-12-10 01:43:07','Motorista de id 2 acessou o sistema móvel web','U'),(1664,'Encerrar sessao','2','2010-12-10 01:43:12','Login 2 encerrou a sessão','U'),(1665,'Acesso ao sistema','fe','2010-12-10 15:20:19','Login fe acessou o sistema','U'),(1666,'Consulta de chamado','fe','2010-12-10 15:21:21','Consulta de todos os chamados','U'),(1667,'Expirou sessão','fe','2010-12-10 15:32:38','Login null expirou a sessão','U'),(1668,'Acesso ao sistema movel','1','2010-12-10 21:25:05','Motorista com id 1conectando ao sistema movel ','M'),(1669,'Alteracao de coordenadas','1','2010-12-10 21:25:09','Motorista com id 1alterando coordenadas no sistema ','M'),(1670,'Acesso ao sistema','fe','2010-12-10 21:27:38','Login fe acessou o sistema','U'),(1671,'Consulta de passageiro','fe','2010-12-10 21:32:51','Consulta através do parâmetro  como Nome','U'),(1672,'Desativacao de passageiro','fe','2010-12-10 21:33:21','Desativação de passageiro com o cpf null','U'),(1673,'Consulta de passageiro','fe','2010-12-10 21:33:33','Consulta através do parâmetro  como Nome','U'),(1674,'Consulta de passageiro','fe','2010-12-10 21:33:53','Consulta através do parâmetro  como Nome','U'),(1675,'Ativacao de passageiro','fe','2010-12-10 21:33:59','Ativação de passageiro com o cpf null','U'),(1676,'Consulta de passageiro','fe','2010-12-10 21:34:04','Consulta através do parâmetro  como Nome','U'),(1677,'Inclusao de chamado','fe','2010-12-10 21:35:25','Inclusao do chamdo com o código 43','U'),(1678,'Consulta de chamado','fe','2010-12-10 21:35:35','Consulta de todos os chamados','U'),(1679,'Acesso ao sistema movel','1','2010-12-10 21:38:21','Motorista com id 1conectando ao sistema movel ','M'),(1680,'Alteracao de coordenadas','1','2010-12-10 21:38:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1681,'Acesso ao sistema movel web','2','2010-12-10 21:39:16','Motorista de id 2 acessou o sistema móvel web','U'),(1682,'Recusar Chamado','2','2010-12-10 21:39:23','Login 2 Recusou o chamado','U'),(1683,'Chamado nao aceito','2','2010-12-10 21:40:01','Login 2não aceitou o chamado','U'),(1684,'Encerrar sessao','2','2010-12-10 21:40:06','Login 2 encerrou a sessão','U'),(1685,'Consulta de motorista','2','2010-12-10 21:41:45','Consulta através do parâmetro  como ','U'),(1686,'Consulta de chamado','2','2010-12-10 21:42:20','Consulta de todos os chamados','U'),(1687,'Alteracao de coordenadas','1','2010-12-10 21:43:26','Motorista com id 1alterando coordenadas no sistema ','M'),(1688,'Consulta de chamado','2','2010-12-10 21:44:47','Consulta de todos os chamados','U'),(1689,'Alteracao de coordenadas','1','2010-12-10 21:48:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1690,'Alteracao de coordenadas','1','2010-12-10 21:53:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1691,'Expirou sessão','2','2010-12-10 21:54:53','Login null expirou a sessão','U'),(1692,'Alteracao de coordenadas','1','2010-12-10 21:58:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1693,'Alteracao de coordenadas','1','2010-12-10 22:03:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1694,'Acesso ao sistema','fe','2010-12-10 22:05:34','Login fe acessou o sistema','U'),(1695,'Consulta de chamado','fe','2010-12-10 22:05:44','Consulta de todos os chamados','U'),(1696,'Consulta de chamado','fe','2010-12-10 22:06:24','Consulta de todos os chamados','U'),(1697,'Acesso ao sistema','fe','2010-12-10 22:28:26','Login fe acessou o sistema','U'),(1698,'Consulta de chamado','fe','2010-12-10 22:28:35','Consulta de todos os chamados','U'),(1699,'Consulta de chamado','fe','2010-12-10 22:29:07','Consulta de todos os chamados','U'),(1700,'Consulta de chamado','fe','2010-12-10 22:31:40','Consulta de todos os chamados','U'),(1701,'Consulta de chamado','fe','2010-12-10 22:33:56','Consulta de todos os chamados','U'),(1702,'Consulta de chamado','fe','2010-12-10 22:36:28','Consulta de todos os chamados','U'),(1703,'Cancelamento de chamado','fe','2010-12-10 22:37:15','Cancelamento do chamado com o código 43','U'),(1704,'Acesso ao sistema movel web','2','2010-12-10 22:38:26','Motorista de id 2 acessou o sistema móvel web','U'),(1705,'Consulta de passageiro','2','2010-12-10 22:41:26','Consulta através do parâmetro  como Nome','U'),(1706,'Inclusao de chamado','2','2010-12-10 22:42:00','Inclusao do chamdo com o código 44','U'),(1707,'Consulta de chamado','2','2010-12-10 22:42:10','Consulta de todos os chamados','U'),(1708,'Recusar Chamado','2','2010-12-10 22:42:33','Login 2 Recusou o chamado','U'),(1709,'Chamado nao aceito','2','2010-12-10 22:43:06','Login 2não aceitou o chamado','U'),(1710,'Consulta de chamado','2','2010-12-10 22:43:26','Consulta de todos os chamados','U'),(1711,'Encerrar sessao','2','2010-12-10 22:43:42','Login 2 encerrou a sessão','U'),(1712,'Acesso ao sistema movel web','1','2010-12-10 22:44:00','Motorista de id 1 acessou o sistema móvel web','U'),(1713,'Aceitar Chamado','1','2010-12-10 22:44:07','Login 1 Aceitou o chamado','U'),(1714,'Chamado finalizado','1','2010-12-10 22:44:24','Login 1finalizou o chamado','U'),(1715,'Consulta de convenio','1','2010-12-10 22:44:35','Consulta através do parâmetro  como ','U'),(1716,'Consulta de chamado','1','2010-12-10 22:44:47','Consulta de todos os chamados','U'),(1717,'Insercao de coordenadas','2','2010-12-11 09:44:32','Motorista com id 2gravando coordenadas no sistema ','M'),(1718,'Alteracao de coordenadas','2','2010-12-11 09:44:32','Motorista com id 2alterando coordenadas no sistema ','M'),(1719,'Insercao de coordenadas','1','2010-12-11 09:45:26','Motorista com id 1gravando coordenadas no sistema ','M'),(1720,'Acesso ao sistema','fe','2010-12-11 09:46:26','Login fe acessou o sistema','U'),(1721,'Consulta de chamado','fe','2010-12-11 09:46:36','Consulta de todos os chamados','U'),(1722,'Alteracao de coordenadas','2','2010-12-11 09:49:38','Motorista com id 2alterando coordenadas no sistema ','M'),(1723,'Alteracao de coordenadas','2','2010-12-11 09:49:38','Motorista com id 2alterando coordenadas no sistema ','M'),(1724,'Alteracao de coordenadas','1','2010-12-11 09:51:24','Motorista com id 1alterando coordenadas no sistema ','M'),(1725,'Alteracao de coordenadas','2','2010-12-11 09:54:41','Motorista com id 2alterando coordenadas no sistema ','M'),(1726,'Acesso ao sistema movel web','1','2010-12-11 09:55:16','Motorista de id 1 acessou o sistema móvel web','U'),(1727,'Encerrar sessao','1','2010-12-11 09:55:34','Login 1 encerrou a sessão','U'),(1728,'Acesso ao sistema movel web','2','2010-12-11 09:57:00','Motorista de id 2 acessou o sistema móvel web','U'),(1729,'Expirou sessão','fe','2010-12-11 09:57:05','Login null expirou a sessão','U'),(1730,'Encerrar sessao','2','2010-12-11 09:57:10','Login 2 encerrou a sessão','U'),(1731,'Alteracao de coordenadas','1','2010-12-11 09:57:17','Motorista com id 1alterando coordenadas no sistema ','M'),(1732,'Acesso ao sistema movel web','1','2010-12-11 09:59:30','Motorista de id 1 acessou o sistema móvel web','U'),(1733,'Encerrar sessao','1','2010-12-11 09:59:39','Login 1 encerrou a sessão','U'),(1734,'Alteracao de coordenadas','2','2010-12-11 09:59:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1735,'Alteracao de coordenadas','2','2010-12-11 09:59:46','Motorista com id 2alterando coordenadas no sistema ','M'),(1736,'Acesso ao sistema','fe','2010-12-11 10:00:47','Login fe acessou o sistema','U'),(1737,'Acesso ao sistema movel web','2','2010-12-11 10:00:57','Motorista de id 2 acessou o sistema móvel web','U'),(1738,'Encerrar sessao','2','2010-12-11 10:01:13','Login 2 encerrou a sessão','U'),(1739,'Alteracao de coordenadas','1','2010-12-11 10:03:14','Motorista com id 1alterando coordenadas no sistema ','M'),(1740,'Acesso ao sistema movel web','2','2010-12-11 10:03:42','Motorista de id 2 acessou o sistema móvel web','U'),(1741,'Encerrar sessao','2','2010-12-11 10:03:49','Login 2 encerrou a sessão','U'),(1742,'Alteracao de coordenadas','2','2010-12-11 10:04:54','Motorista com id 2alterando coordenadas no sistema ','M'),(1743,'Alteracao de coordenadas','2','2010-12-11 10:04:56','Motorista com id 2alterando coordenadas no sistema ','M'),(1744,'Acesso ao sistema movel web','2','2010-12-11 10:05:50','Motorista de id 2 acessou o sistema móvel web','U'),(1745,'Encerrar sessao','2','2010-12-11 10:06:39','Login 2 encerrou a sessão','U'),(1746,'Alteracao de coordenadas','2','2010-12-11 10:10:01','Motorista com id 2alterando coordenadas no sistema ','M'),(1747,'Alteracao de coordenadas','2','2010-12-11 10:10:08','Motorista com id 2alterando coordenadas no sistema ','M'),(1748,'Expirou sessão','fe','2010-12-11 10:11:34','Login null expirou a sessão','U'),(1749,'Alteracao de coordenadas','2','2010-12-11 10:15:07','Motorista com id 2alterando coordenadas no sistema ','M'),(1750,'Alteracao de coordenadas','2','2010-12-11 10:15:13','Motorista com id 2alterando coordenadas no sistema ','M'),(1751,'Expirou sessão','2','2010-12-11 10:18:36','Login null expirou a sessão','U'),(1752,'Alteracao de coordenadas','2','2010-12-11 10:20:21','Motorista com id 2alterando coordenadas no sistema ','M'),(1753,'Alteracao de coordenadas','2','2010-12-11 10:20:22','Motorista com id 2alterando coordenadas no sistema ','M'),(1754,'Alteracao de coordenadas','2','2010-12-11 10:25:28','Motorista com id 2alterando coordenadas no sistema ','M'),(1755,'Alteracao de coordenadas','2','2010-12-11 10:25:31','Motorista com id 2alterando coordenadas no sistema ','M'),(1756,'Alteracao de coordenadas','2','2010-12-11 10:30:31','Motorista com id 2alterando coordenadas no sistema ','M'),(1757,'Alteracao de coordenadas','2','2010-12-11 10:30:33','Motorista com id 2alterando coordenadas no sistema ','M'),(1758,'Acesso ao sistema','fe','2010-12-11 10:31:48','Login fe acessou o sistema','U'),(1759,'Acesso ao sistema movel web','1','2010-12-11 10:32:01','Motorista de id 1 acessou o sistema móvel web','U'),(1760,'Alteracao de coordenadas','2','2010-12-11 10:35:50','Motorista com id 2alterando coordenadas no sistema ','M'),(1761,'Alteracao de coordenadas','2','2010-12-11 10:35:52','Motorista com id 2alterando coordenadas no sistema ','M'),(1762,'Acesso ao sistema movel web','1','2010-12-11 10:36:01','Motorista de id 1 acessou o sistema móvel web','U'),(1763,'Alteracao de coordenadas','2','2010-12-11 10:40:58','Motorista com id 2alterando coordenadas no sistema ','M'),(1764,'Alteracao de coordenadas','2','2010-12-11 10:41:00','Motorista com id 2alterando coordenadas no sistema ','M'),(1765,'Expirou sessão','fe','2010-12-11 10:42:40','Login null expirou a sessão','U'),(1766,'Alteracao de coordenadas','2','2010-12-11 10:46:04','Motorista com id 2alterando coordenadas no sistema ','M'),(1767,'Alteracao de coordenadas','2','2010-12-11 10:46:06','Motorista com id 2alterando coordenadas no sistema ','M'),(1768,'Acesso ao sistema movel web','1','2010-12-11 10:46:26','Motorista de id 1 acessou o sistema móvel web','U'),(1769,'Acesso ao sistema movel web','1','2010-12-11 10:50:35','Motorista de id 1 acessou o sistema móvel web','U'),(1770,'Alteracao de coordenadas','2','2010-12-11 10:51:15','Motorista com id 2alterando coordenadas no sistema ','M'),(1771,'Alteracao de coordenadas','2','2010-12-11 10:51:16','Motorista com id 2alterando coordenadas no sistema ','M'),(1772,'Encerrar sessao','1','2010-12-11 10:54:34','Login 1 encerrou a sessão','U'),(1773,'Alteracao de coordenadas','1','2010-12-11 11:46:21','Motorista com id 1alterando coordenadas no sistema ','M'),(1774,'Alteracao de coordenadas','2','2010-12-11 11:48:36','Motorista com id 2alterando coordenadas no sistema ','M'),(1775,'Alteracao de coordenadas','2','2010-12-11 11:48:38','Motorista com id 2alterando coordenadas no sistema ','M'),(1776,'Alteracao de coordenadas','1','2010-12-11 11:51:35','Motorista com id 1alterando coordenadas no sistema ','M'),(1777,'Alteracao de coordenadas','2','2010-12-11 11:53:49','Motorista com id 2alterando coordenadas no sistema ','M'),(1778,'Alteracao de coordenadas','2','2010-12-11 11:53:50','Motorista com id 2alterando coordenadas no sistema ','M'),(1779,'Alteracao de coordenadas','1','2010-12-11 11:56:51','Motorista com id 1alterando coordenadas no sistema ','M'),(1780,'Alteracao de coordenadas','2','2010-12-11 11:58:57','Motorista com id 2alterando coordenadas no sistema ','M'),(1781,'Alteracao de coordenadas','2','2010-12-11 11:58:58','Motorista com id 2alterando coordenadas no sistema ','M'),(1782,'Alteracao de coordenadas','1','2010-12-11 12:02:07','Motorista com id 1alterando coordenadas no sistema ','M'),(1783,'Alteracao de coordenadas','2','2010-12-11 12:04:45','Motorista com id 2alterando coordenadas no sistema ','M'),(1784,'Alteracao de coordenadas','2','2010-12-11 12:04:48','Motorista com id 2alterando coordenadas no sistema ','M'),(1785,'Alteracao de coordenadas','1','2010-12-11 12:07:24','Motorista com id 1alterando coordenadas no sistema ','M'),(1786,'Alteracao de coordenadas','2','2010-12-11 12:09:27','Motorista com id 2alterando coordenadas no sistema ','M'),(1787,'Alteracao de coordenadas','2','2010-12-11 12:09:29','Motorista com id 2alterando coordenadas no sistema ','M'),(1788,'Alteracao de coordenadas','1','2010-12-11 12:12:43','Motorista com id 1alterando coordenadas no sistema ','M'),(1789,'Alteracao de coordenadas','2','2010-12-11 12:14:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1790,'Alteracao de coordenadas','2','2010-12-11 12:14:54','Motorista com id 2alterando coordenadas no sistema ','M'),(1791,'Alteracao de coordenadas','1','2010-12-11 12:17:57','Motorista com id 1alterando coordenadas no sistema ','M'),(1792,'Alteracao de coordenadas','1','2010-12-11 12:23:14','Motorista com id 1alterando coordenadas no sistema ','M'),(1793,'Alteracao de coordenadas','2','2010-12-11 12:23:19','Motorista com id 2alterando coordenadas no sistema ','M'),(1794,'Alteracao de coordenadas','2','2010-12-11 12:23:32','Motorista com id 2alterando coordenadas no sistema ','M'),(1795,'Alteracao de coordenadas','2','2010-12-11 12:25:16','Motorista com id 2alterando coordenadas no sistema ','M'),(1796,'Alteracao de coordenadas','2','2010-12-11 12:25:23','Motorista com id 2alterando coordenadas no sistema ','M'),(1797,'Alteracao de coordenadas','1','2010-12-11 12:28:21','Motorista com id 1alterando coordenadas no sistema ','M'),(1798,'Alteracao de coordenadas','2','2010-12-11 12:30:29','Motorista com id 2alterando coordenadas no sistema ','M'),(1799,'Alteracao de coordenadas','2','2010-12-11 12:30:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1800,'Alteracao de coordenadas','1','2010-12-11 12:33:44','Motorista com id 1alterando coordenadas no sistema ','M'),(1801,'Alteracao de coordenadas','2','2010-12-11 12:35:36','Motorista com id 2alterando coordenadas no sistema ','M'),(1802,'Alteracao de coordenadas','2','2010-12-11 12:35:38','Motorista com id 2alterando coordenadas no sistema ','M'),(1803,'Alteracao de coordenadas','1','2010-12-11 12:38:55','Motorista com id 1alterando coordenadas no sistema ','M'),(1804,'Alteracao de coordenadas','2','2010-12-11 12:40:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1805,'Alteracao de coordenadas','2','2010-12-11 12:40:47','Motorista com id 2alterando coordenadas no sistema ','M'),(1806,'Alteracao de coordenadas','1','2010-12-11 12:44:17','Motorista com id 1alterando coordenadas no sistema ','M'),(1807,'Alteracao de coordenadas','2','2010-12-11 12:45:51','Motorista com id 2alterando coordenadas no sistema ','M'),(1808,'Alteracao de coordenadas','2','2010-12-11 12:45:54','Motorista com id 2alterando coordenadas no sistema ','M'),(1809,'Alteracao de coordenadas','2','2010-12-11 12:50:56','Motorista com id 2alterando coordenadas no sistema ','M'),(1810,'Alteracao de coordenadas','2','2010-12-11 12:51:02','Motorista com id 2alterando coordenadas no sistema ','M'),(1811,'Alteracao de coordenadas','1','2010-12-11 12:55:06','Motorista com id 1alterando coordenadas no sistema ','M'),(1812,'Alteracao de coordenadas','2','2010-12-11 12:56:10','Motorista com id 2alterando coordenadas no sistema ','M'),(1813,'Alteracao de coordenadas','2','2010-12-11 12:56:11','Motorista com id 2alterando coordenadas no sistema ','M'),(1814,'Alteracao de coordenadas','1','2010-12-11 13:00:26','Motorista com id 1alterando coordenadas no sistema ','M'),(1815,'Alteracao de coordenadas','2','2010-12-11 13:01:16','Motorista com id 2alterando coordenadas no sistema ','M'),(1816,'Alteracao de coordenadas','2','2010-12-11 13:01:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1817,'Alteracao de coordenadas','1','2010-12-11 13:07:06','Motorista com id 1alterando coordenadas no sistema ','M'),(1818,'Alteracao de coordenadas','1','2010-12-11 13:12:21','Motorista com id 1alterando coordenadas no sistema ','M'),(1819,'Alteracao de coordenadas','1','2010-12-11 13:17:39','Motorista com id 1alterando coordenadas no sistema ','M'),(1820,'Alteracao de coordenadas','1','2010-12-11 13:22:58','Motorista com id 1alterando coordenadas no sistema ','M'),(1821,'Alteracao de coordenadas','1','2010-12-11 13:28:14','Motorista com id 1alterando coordenadas no sistema ','M'),(1822,'Alteracao de coordenadas','1','2010-12-11 13:33:28','Motorista com id 1alterando coordenadas no sistema ','M'),(1823,'Alteracao de coordenadas','1','2010-12-11 13:42:10','Motorista com id 1alterando coordenadas no sistema ','M'),(1824,'Alteracao de coordenadas','1','2010-12-11 13:47:27','Motorista com id 1alterando coordenadas no sistema ','M'),(1825,'Alteracao de coordenadas','1','2010-12-11 13:52:59','Motorista com id 1alterando coordenadas no sistema ','M'),(1826,'Alteracao de coordenadas','1','2010-12-11 13:57:58','Motorista com id 1alterando coordenadas no sistema ','M'),(1827,'Alteracao de coordenadas','1','2010-12-11 14:03:09','Motorista com id 1alterando coordenadas no sistema ','M'),(1828,'Alteracao de coordenadas','1','2010-12-11 14:08:22','Motorista com id 1alterando coordenadas no sistema ','M'),(1829,'Alteracao de coordenadas','1','2010-12-11 14:13:39','Motorista com id 1alterando coordenadas no sistema ','M'),(1830,'Alteracao de coordenadas','1','2010-12-11 14:18:53','Motorista com id 1alterando coordenadas no sistema ','M'),(1831,'Alteracao de coordenadas','1','2010-12-11 14:24:19','Motorista com id 1alterando coordenadas no sistema ','M'),(1832,'Alteracao de coordenadas','1','2010-12-11 14:29:36','Motorista com id 1alterando coordenadas no sistema ','M'),(1833,'Alteracao de coordenadas','1','2010-12-11 14:35:14','Motorista com id 1alterando coordenadas no sistema ','M'),(1834,'Alteracao de coordenadas','1','2010-12-11 14:41:08','Motorista com id 1alterando coordenadas no sistema ','M'),(1835,'Alteracao de coordenadas','1','2010-12-11 14:47:00','Motorista com id 1alterando coordenadas no sistema ','M'),(1836,'Alteracao de coordenadas','1','2010-12-11 14:52:15','Motorista com id 1alterando coordenadas no sistema ','M'),(1837,'Alteracao de coordenadas','1','2010-12-11 14:57:38','Motorista com id 1alterando coordenadas no sistema ','M'),(1838,'Alteracao de coordenadas','1','2010-12-11 15:03:06','Motorista com id 1alterando coordenadas no sistema ','M'),(1839,'Alteracao de coordenadas','1','2010-12-11 15:16:42','Motorista com id 1alterando coordenadas no sistema ','M'),(1840,'Alteracao de coordenadas','1','2010-12-11 15:21:53','Motorista com id 1alterando coordenadas no sistema ','M'),(1841,'Alteracao de coordenadas','1','2010-12-11 16:46:27','Motorista com id 1alterando coordenadas no sistema ','M'),(1842,'Alteracao de coordenadas','2','2010-12-11 16:55:08','Motorista com id 2alterando coordenadas no sistema ','M'),(1843,'Alteracao de coordenadas','2','2010-12-11 16:55:12','Motorista com id 2alterando coordenadas no sistema ','M'),(1844,'Alteracao de coordenadas','2','2010-12-11 16:55:15','Motorista com id 2alterando coordenadas no sistema ','M'),(1845,'Alteracao de coordenadas','2','2010-12-11 16:55:16','Motorista com id 2alterando coordenadas no sistema ','M'),(1846,'Alteracao de coordenadas','2','2010-12-11 16:55:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1847,'Alteracao de coordenadas','2','2010-12-11 16:55:22','Motorista com id 2alterando coordenadas no sistema ','M'),(1848,'Alteracao de coordenadas','2','2010-12-11 16:55:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1849,'Alteracao de coordenadas','2','2010-12-11 16:55:31','Motorista com id 2alterando coordenadas no sistema ','M'),(1850,'Alteracao de coordenadas','2','2010-12-11 16:55:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1851,'Alteracao de coordenadas','2','2010-12-11 16:55:39','Motorista com id 2alterando coordenadas no sistema ','M'),(1852,'Alteracao de coordenadas','2','2010-12-11 16:55:46','Motorista com id 2alterando coordenadas no sistema ','M'),(1853,'Alteracao de coordenadas','2','2010-12-11 16:55:54','Motorista com id 2alterando coordenadas no sistema ','M'),(1854,'Alteracao de coordenadas','2','2010-12-11 16:55:54','Motorista com id 2alterando coordenadas no sistema ','M'),(1855,'Alteracao de coordenadas','2','2010-12-11 16:55:56','Motorista com id 2alterando coordenadas no sistema ','M'),(1856,'Alteracao de coordenadas','2','2010-12-11 16:56:01','Motorista com id 2alterando coordenadas no sistema ','M'),(1857,'Alteracao de coordenadas','2','2010-12-11 16:56:04','Motorista com id 2alterando coordenadas no sistema ','M'),(1858,'Alteracao de coordenadas','2','2010-12-11 16:56:06','Motorista com id 2alterando coordenadas no sistema ','M'),(1859,'Alteracao de coordenadas','2','2010-12-11 16:56:10','Motorista com id 2alterando coordenadas no sistema ','M'),(1860,'Alteracao de coordenadas','2','2010-12-11 16:56:11','Motorista com id 2alterando coordenadas no sistema ','M'),(1861,'Alteracao de coordenadas','2','2010-12-11 16:56:17','Motorista com id 2alterando coordenadas no sistema ','M'),(1862,'Alteracao de coordenadas','2','2010-12-11 16:56:20','Motorista com id 2alterando coordenadas no sistema ','M'),(1863,'Alteracao de coordenadas','2','2010-12-11 16:56:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1864,'Alteracao de coordenadas','2','2010-12-11 16:56:31','Motorista com id 2alterando coordenadas no sistema ','M'),(1865,'Alteracao de coordenadas','2','2010-12-11 16:56:34','Motorista com id 2alterando coordenadas no sistema ','M'),(1866,'Alteracao de coordenadas','2','2010-12-11 16:56:39','Motorista com id 2alterando coordenadas no sistema ','M'),(1867,'Alteracao de coordenadas','2','2010-12-11 16:56:43','Motorista com id 2alterando coordenadas no sistema ','M'),(1868,'Alteracao de coordenadas','2','2010-12-11 16:56:48','Motorista com id 2alterando coordenadas no sistema ','M'),(1869,'Alteracao de coordenadas','2','2010-12-11 16:56:56','Motorista com id 2alterando coordenadas no sistema ','M'),(1870,'Alteracao de coordenadas','2','2010-12-11 16:56:59','Motorista com id 2alterando coordenadas no sistema ','M'),(1871,'Alteracao de coordenadas','2','2010-12-11 16:57:04','Motorista com id 2alterando coordenadas no sistema ','M'),(1872,'Alteracao de coordenadas','2','2010-12-11 16:57:09','Motorista com id 2alterando coordenadas no sistema ','M'),(1873,'Alteracao de coordenadas','2','2010-12-11 16:57:12','Motorista com id 2alterando coordenadas no sistema ','M'),(1874,'Alteracao de coordenadas','2','2010-12-11 16:57:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1875,'Alteracao de coordenadas','2','2010-12-11 16:57:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1876,'Alteracao de coordenadas','2','2010-12-11 16:57:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1877,'Alteracao de coordenadas','2','2010-12-11 16:57:29','Motorista com id 2alterando coordenadas no sistema ','M'),(1878,'Alteracao de coordenadas','2','2010-12-11 16:57:33','Motorista com id 2alterando coordenadas no sistema ','M'),(1879,'Alteracao de coordenadas','2','2010-12-11 16:57:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1880,'Alteracao de coordenadas','2','2010-12-11 16:57:37','Motorista com id 2alterando coordenadas no sistema ','M'),(1881,'Alteracao de coordenadas','2','2010-12-11 16:57:42','Motorista com id 2alterando coordenadas no sistema ','M'),(1882,'Alteracao de coordenadas','2','2010-12-11 16:57:45','Motorista com id 2alterando coordenadas no sistema ','M'),(1883,'Alteracao de coordenadas','2','2010-12-11 16:57:48','Motorista com id 2alterando coordenadas no sistema ','M'),(1884,'Alteracao de coordenadas','2','2010-12-11 16:57:51','Motorista com id 2alterando coordenadas no sistema ','M'),(1885,'Alteracao de coordenadas','2','2010-12-11 16:57:52','Motorista com id 2alterando coordenadas no sistema ','M'),(1886,'Alteracao de coordenadas','2','2010-12-11 16:57:57','Motorista com id 2alterando coordenadas no sistema ','M'),(1887,'Alteracao de coordenadas','2','2010-12-11 16:57:58','Motorista com id 2alterando coordenadas no sistema ','M'),(1888,'Alteracao de coordenadas','2','2010-12-11 16:58:09','Motorista com id 2alterando coordenadas no sistema ','M'),(1889,'Alteracao de coordenadas','2','2010-12-11 16:58:11','Motorista com id 2alterando coordenadas no sistema ','M'),(1890,'Alteracao de coordenadas','2','2010-12-11 16:58:15','Motorista com id 2alterando coordenadas no sistema ','M'),(1891,'Alteracao de coordenadas','2','2010-12-11 16:58:17','Motorista com id 2alterando coordenadas no sistema ','M'),(1892,'Alteracao de coordenadas','2','2010-12-11 16:58:20','Motorista com id 2alterando coordenadas no sistema ','M'),(1893,'Alteracao de coordenadas','2','2010-12-11 16:58:23','Motorista com id 2alterando coordenadas no sistema ','M'),(1894,'Alteracao de coordenadas','2','2010-12-11 16:58:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1895,'Alteracao de coordenadas','2','2010-12-11 16:58:29','Motorista com id 2alterando coordenadas no sistema ','M'),(1896,'Alteracao de coordenadas','2','2010-12-11 16:58:32','Motorista com id 2alterando coordenadas no sistema ','M'),(1897,'Alteracao de coordenadas','2','2010-12-11 16:58:36','Motorista com id 2alterando coordenadas no sistema ','M'),(1898,'Alteracao de coordenadas','2','2010-12-11 16:58:39','Motorista com id 2alterando coordenadas no sistema ','M'),(1899,'Alteracao de coordenadas','2','2010-12-11 16:58:41','Motorista com id 2alterando coordenadas no sistema ','M'),(1900,'Alteracao de coordenadas','2','2010-12-11 16:58:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1901,'Alteracao de coordenadas','2','2010-12-11 16:58:46','Motorista com id 2alterando coordenadas no sistema ','M'),(1902,'Alteracao de coordenadas','1','2010-12-11 17:43:55','Motorista com id 1alterando coordenadas no sistema ','M'),(1903,'Alteracao de coordenadas','2','2010-12-11 17:49:17','Motorista com id 2alterando coordenadas no sistema ','M'),(1904,'Alteracao de coordenadas','2','2010-12-11 17:49:20','Motorista com id 2alterando coordenadas no sistema ','M'),(1905,'Alteracao de coordenadas','2','2010-12-11 17:49:34','Motorista com id 2alterando coordenadas no sistema ','M'),(1906,'Alteracao de coordenadas','2','2010-12-11 17:49:36','Motorista com id 2alterando coordenadas no sistema ','M'),(1907,'Alteracao de coordenadas','2','2010-12-11 17:49:43','Motorista com id 2alterando coordenadas no sistema ','M'),(1908,'Alteracao de coordenadas','2','2010-12-11 17:49:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1909,'Alteracao de coordenadas','2','2010-12-11 17:50:00','Motorista com id 2alterando coordenadas no sistema ','M'),(1910,'Alteracao de coordenadas','2','2010-12-11 17:50:02','Motorista com id 2alterando coordenadas no sistema ','M'),(1911,'Alteracao de coordenadas','2','2010-12-11 17:50:09','Motorista com id 2alterando coordenadas no sistema ','M'),(1912,'Alteracao de coordenadas','2','2010-12-11 17:50:12','Motorista com id 2alterando coordenadas no sistema ','M'),(1913,'Alteracao de coordenadas','2','2010-12-11 17:50:17','Motorista com id 2alterando coordenadas no sistema ','M'),(1914,'Alteracao de coordenadas','2','2010-12-11 17:50:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1915,'Alteracao de coordenadas','2','2010-12-11 17:50:25','Motorista com id 2alterando coordenadas no sistema ','M'),(1916,'Alteracao de coordenadas','2','2010-12-11 17:50:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1917,'Alteracao de coordenadas','2','2010-12-11 17:54:42','Motorista com id 2alterando coordenadas no sistema ','M'),(1918,'Alteracao de coordenadas','2','2010-12-11 17:54:45','Motorista com id 2alterando coordenadas no sistema ','M'),(1919,'Alteracao de coordenadas','1','2010-12-11 17:55:40','Motorista com id 1alterando coordenadas no sistema ','M'),(1920,'Alteracao de coordenadas','2','2010-12-11 17:59:49','Motorista com id 2alterando coordenadas no sistema ','M'),(1921,'Alteracao de coordenadas','2','2010-12-11 17:59:55','Motorista com id 2alterando coordenadas no sistema ','M'),(1922,'Alteracao de coordenadas','1','2010-12-11 18:03:13','Motorista com id 1alterando coordenadas no sistema ','M'),(1923,'Alteracao de coordenadas','2','2010-12-11 18:04:52','Motorista com id 2alterando coordenadas no sistema ','M'),(1924,'Alteracao de coordenadas','2','2010-12-11 18:05:00','Motorista com id 2alterando coordenadas no sistema ','M'),(1925,'Alteracao de coordenadas','1','2010-12-11 18:08:28','Motorista com id 1alterando coordenadas no sistema ','M'),(1926,'Alteracao de coordenadas','2','2010-12-11 18:09:58','Motorista com id 2alterando coordenadas no sistema ','M'),(1927,'Alteracao de coordenadas','2','2010-12-11 18:10:01','Motorista com id 2alterando coordenadas no sistema ','M'),(1928,'Alteracao de coordenadas','1','2010-12-11 18:13:44','Motorista com id 1alterando coordenadas no sistema ','M'),(1929,'Alteracao de coordenadas','2','2010-12-11 18:15:08','Motorista com id 2alterando coordenadas no sistema ','M'),(1930,'Alteracao de coordenadas','2','2010-12-11 18:15:14','Motorista com id 2alterando coordenadas no sistema ','M'),(1931,'Alteracao de coordenadas','1','2010-12-11 18:19:34','Motorista com id 1alterando coordenadas no sistema ','M'),(1932,'Alteracao de coordenadas','2','2010-12-11 18:20:30','Motorista com id 2alterando coordenadas no sistema ','M'),(1933,'Alteracao de coordenadas','2','2010-12-11 18:20:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1934,'Alteracao de coordenadas','1','2010-12-11 18:24:53','Motorista com id 1alterando coordenadas no sistema ','M'),(1935,'Alteracao de coordenadas','1','2010-12-11 18:30:32','Motorista com id 1alterando coordenadas no sistema ','M'),(1936,'Alteracao de coordenadas','1','2010-12-11 18:36:05','Motorista com id 1alterando coordenadas no sistema ','M'),(1937,'Alteracao de coordenadas','1','2010-12-11 18:41:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1938,'Alteracao de coordenadas','1','2010-12-11 18:46:48','Motorista com id 1alterando coordenadas no sistema ','M'),(1939,'Alteracao de coordenadas','1','2010-12-11 18:52:12','Motorista com id 1alterando coordenadas no sistema ','M'),(1940,'Alteracao de coordenadas','1','2010-12-11 18:58:43','Motorista com id 1alterando coordenadas no sistema ','M'),(1941,'Alteracao de coordenadas','1','2010-12-11 19:04:09','Motorista com id 1alterando coordenadas no sistema ','M'),(1942,'Alteracao de coordenadas','1','2010-12-11 19:10:02','Motorista com id 1alterando coordenadas no sistema ','M'),(1943,'Alteracao de coordenadas','1','2010-12-11 19:15:16','Motorista com id 1alterando coordenadas no sistema ','M'),(1944,'Alteracao de coordenadas','2','2010-12-11 19:18:26','Motorista com id 2alterando coordenadas no sistema ','M'),(1945,'Alteracao de coordenadas','2','2010-12-11 19:18:32','Motorista com id 2alterando coordenadas no sistema ','M'),(1946,'Alteracao de coordenadas','1','2010-12-11 19:20:32','Motorista com id 1alterando coordenadas no sistema ','M'),(1947,'Alteracao de coordenadas','2','2010-12-11 19:23:32','Motorista com id 2alterando coordenadas no sistema ','M'),(1948,'Alteracao de coordenadas','2','2010-12-11 19:23:39','Motorista com id 2alterando coordenadas no sistema ','M'),(1949,'Alteracao de coordenadas','1','2010-12-11 19:26:03','Motorista com id 1alterando coordenadas no sistema ','M'),(1950,'Alteracao de coordenadas','2','2010-12-11 19:28:52','Motorista com id 2alterando coordenadas no sistema ','M'),(1951,'Alteracao de coordenadas','2','2010-12-11 19:29:00','Motorista com id 2alterando coordenadas no sistema ','M'),(1952,'Alteracao de coordenadas','1','2010-12-11 19:31:22','Motorista com id 1alterando coordenadas no sistema ','M'),(1953,'Alteracao de coordenadas','2','2010-12-11 19:34:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1954,'Alteracao de coordenadas','2','2010-12-11 19:34:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1955,'Alteracao de coordenadas','1','2010-12-11 19:36:58','Motorista com id 1alterando coordenadas no sistema ','M'),(1956,'Alteracao de coordenadas','2','2010-12-11 19:40:08','Motorista com id 2alterando coordenadas no sistema ','M'),(1957,'Alteracao de coordenadas','2','2010-12-11 19:40:18','Motorista com id 2alterando coordenadas no sistema ','M'),(1958,'Alteracao de coordenadas','1','2010-12-11 19:42:22','Motorista com id 1alterando coordenadas no sistema ','M'),(1959,'Alteracao de coordenadas','2','2010-12-11 19:45:30','Motorista com id 2alterando coordenadas no sistema ','M'),(1960,'Alteracao de coordenadas','2','2010-12-11 19:45:37','Motorista com id 2alterando coordenadas no sistema ','M'),(1961,'Alteracao de coordenadas','1','2010-12-11 19:47:33','Motorista com id 1alterando coordenadas no sistema ','M'),(1962,'Alteracao de coordenadas','1','2010-12-11 19:52:55','Motorista com id 1alterando coordenadas no sistema ','M'),(1963,'Alteracao de coordenadas','1','2010-12-11 19:58:06','Motorista com id 1alterando coordenadas no sistema ','M'),(1964,'Alteracao de coordenadas','1','2010-12-11 20:03:25','Motorista com id 1alterando coordenadas no sistema ','M'),(1965,'Alteracao de coordenadas','2','2010-12-11 20:05:09','Motorista com id 2alterando coordenadas no sistema ','M'),(1966,'Alteracao de coordenadas','2','2010-12-11 20:05:14','Motorista com id 2alterando coordenadas no sistema ','M'),(1967,'Alteracao de coordenadas','1','2010-12-11 20:09:36','Motorista com id 1alterando coordenadas no sistema ','M'),(1968,'Alteracao de coordenadas','2','2010-12-11 20:10:48','Motorista com id 2alterando coordenadas no sistema ','M'),(1969,'Alteracao de coordenadas','2','2010-12-11 20:10:58','Motorista com id 2alterando coordenadas no sistema ','M'),(1970,'Alteracao de coordenadas','2','2010-12-11 20:22:05','Motorista com id 2alterando coordenadas no sistema ','M'),(1971,'Alteracao de coordenadas','2','2010-12-11 20:22:14','Motorista com id 2alterando coordenadas no sistema ','M'),(1972,'Alteracao de coordenadas','1','2010-12-11 20:25:32','Motorista com id 1alterando coordenadas no sistema ','M'),(1973,'Alteracao de coordenadas','1','2010-12-11 20:30:57','Motorista com id 1alterando coordenadas no sistema ','M'),(1974,'Alteracao de coordenadas','2','2010-12-11 20:34:13','Motorista com id 2alterando coordenadas no sistema ','M'),(1975,'Alteracao de coordenadas','2','2010-12-11 20:34:19','Motorista com id 2alterando coordenadas no sistema ','M'),(1976,'Alteracao de coordenadas','1','2010-12-11 20:36:21','Motorista com id 1alterando coordenadas no sistema ','M'),(1977,'Alteracao de coordenadas','2','2010-12-11 20:39:23','Motorista com id 2alterando coordenadas no sistema ','M'),(1978,'Alteracao de coordenadas','2','2010-12-11 20:39:30','Motorista com id 2alterando coordenadas no sistema ','M'),(1979,'Alteracao de coordenadas','1','2010-12-11 20:41:40','Motorista com id 1alterando coordenadas no sistema ','M'),(1980,'Alteracao de coordenadas','2','2010-12-11 20:44:29','Motorista com id 2alterando coordenadas no sistema ','M'),(1981,'Alteracao de coordenadas','2','2010-12-11 20:44:35','Motorista com id 2alterando coordenadas no sistema ','M'),(1982,'Alteracao de coordenadas','1','2010-12-11 20:47:04','Motorista com id 1alterando coordenadas no sistema ','M'),(1983,'Alteracao de coordenadas','2','2010-12-11 20:49:38','Motorista com id 2alterando coordenadas no sistema ','M'),(1984,'Alteracao de coordenadas','2','2010-12-11 20:49:44','Motorista com id 2alterando coordenadas no sistema ','M'),(1985,'Alteracao de coordenadas','1','2010-12-11 20:52:18','Motorista com id 1alterando coordenadas no sistema ','M'),(1986,'Alteracao de coordenadas','2','2010-12-11 20:54:55','Motorista com id 2alterando coordenadas no sistema ','M'),(1987,'Alteracao de coordenadas','2','2010-12-11 20:55:01','Motorista com id 2alterando coordenadas no sistema ','M'),(1988,'Alteracao de coordenadas','1','2010-12-11 20:57:35','Motorista com id 1alterando coordenadas no sistema ','M'),(1989,'Alteracao de coordenadas','2','2010-12-11 21:00:01','Motorista com id 2alterando coordenadas no sistema ','M'),(1990,'Alteracao de coordenadas','2','2010-12-11 21:00:16','Motorista com id 2alterando coordenadas no sistema ','M'),(1991,'Alteracao de coordenadas','1','2010-12-11 21:03:02','Motorista com id 1alterando coordenadas no sistema ','M'),(1992,'Alteracao de coordenadas','2','2010-12-11 21:05:23','Motorista com id 2alterando coordenadas no sistema ','M'),(1993,'Alteracao de coordenadas','2','2010-12-11 21:05:28','Motorista com id 2alterando coordenadas no sistema ','M'),(1994,'Alteracao de coordenadas','1','2010-12-11 21:08:13','Motorista com id 1alterando coordenadas no sistema ','M'),(1995,'Alteracao de coordenadas','2','2010-12-11 21:10:34','Motorista com id 2alterando coordenadas no sistema ','M'),(1996,'Alteracao de coordenadas','2','2010-12-11 21:10:42','Motorista com id 2alterando coordenadas no sistema ','M'),(1997,'Alteracao de coordenadas','1','2010-12-11 21:13:38','Motorista com id 1alterando coordenadas no sistema ','M'),(1998,'Alteracao de coordenadas','2','2010-12-11 21:15:39','Motorista com id 2alterando coordenadas no sistema ','M'),(1999,'Alteracao de coordenadas','2','2010-12-11 21:15:44','Motorista com id 2alterando coordenadas no sistema ','M'),(2000,'Alteracao de coordenadas','1','2010-12-11 21:18:52','Motorista com id 1alterando coordenadas no sistema ','M'),(2001,'Alteracao de coordenadas','2','2010-12-11 21:20:59','Motorista com id 2alterando coordenadas no sistema ','M'),(2002,'Alteracao de coordenadas','2','2010-12-11 21:21:01','Motorista com id 2alterando coordenadas no sistema ','M'),(2003,'Alteracao de coordenadas','1','2010-12-11 21:24:12','Motorista com id 1alterando coordenadas no sistema ','M'),(2004,'Alteracao de coordenadas','2','2010-12-11 21:28:08','Motorista com id 2alterando coordenadas no sistema ','M'),(2005,'Alteracao de coordenadas','1','2010-12-11 21:30:17','Motorista com id 1alterando coordenadas no sistema ','M'),(2006,'Alteracao de coordenadas','2','2010-12-11 21:33:12','Motorista com id 2alterando coordenadas no sistema ','M'),(2007,'Alteracao de coordenadas','2','2010-12-11 21:33:13','Motorista com id 2alterando coordenadas no sistema ','M'),(2008,'Alteracao de coordenadas','1','2010-12-11 21:35:55','Motorista com id 1alterando coordenadas no sistema ','M'),(2009,'Alteracao de coordenadas','1','2010-12-11 21:41:20','Motorista com id 1alterando coordenadas no sistema ','M'),(2010,'Alteracao de coordenadas','2','2010-12-11 21:43:47','Motorista com id 2alterando coordenadas no sistema ','M'),(2011,'Alteracao de coordenadas','2','2010-12-11 21:43:48','Motorista com id 2alterando coordenadas no sistema ','M'),(2012,'Alteracao de coordenadas','1','2010-12-11 21:46:49','Motorista com id 1alterando coordenadas no sistema ','M'),(2013,'Alteracao de coordenadas','2','2010-12-11 21:49:10','Motorista com id 2alterando coordenadas no sistema ','M'),(2014,'Alteracao de coordenadas','2','2010-12-11 21:49:14','Motorista com id 2alterando coordenadas no sistema ','M'),(2015,'Alteracao de coordenadas','1','2010-12-11 21:52:15','Motorista com id 1alterando coordenadas no sistema ','M'),(2016,'Alteracao de coordenadas','1','2010-12-11 21:57:44','Motorista com id 1alterando coordenadas no sistema ','M'),(2017,'Alteracao de coordenadas','2','2010-12-11 21:59:57','Motorista com id 2alterando coordenadas no sistema ','M'),(2018,'Alteracao de coordenadas','2','2010-12-11 22:00:01','Motorista com id 2alterando coordenadas no sistema ','M'),(2019,'Alteracao de coordenadas','1','2010-12-11 22:03:16','Motorista com id 1alterando coordenadas no sistema ','M'),(2020,'Alteracao de coordenadas','2','2010-12-11 22:06:38','Motorista com id 2alterando coordenadas no sistema ','M'),(2021,'Alteracao de coordenadas','1','2010-12-11 22:08:35','Motorista com id 1alterando coordenadas no sistema ','M'),(2022,'Alteracao de coordenadas','2','2010-12-11 22:11:49','Motorista com id 2alterando coordenadas no sistema ','M'),(2023,'Alteracao de coordenadas','2','2010-12-11 22:11:51','Motorista com id 2alterando coordenadas no sistema ','M'),(2024,'Alteracao de coordenadas','1','2010-12-11 22:14:09','Motorista com id 1alterando coordenadas no sistema ','M'),(2025,'Alteracao de coordenadas','2','2010-12-11 22:17:11','Motorista com id 2alterando coordenadas no sistema ','M'),(2026,'Alteracao de coordenadas','2','2010-12-11 22:22:23','Motorista com id 2alterando coordenadas no sistema ','M'),(2027,'Alteracao de coordenadas','2','2010-12-11 22:22:28','Motorista com id 2alterando coordenadas no sistema ','M'),(2028,'Alteracao de coordenadas','2','2010-12-11 22:27:41','Motorista com id 2alterando coordenadas no sistema ','M'),(2029,'Alteracao de coordenadas','2','2010-12-11 22:27:47','Motorista com id 2alterando coordenadas no sistema ','M'),(2030,'Alteracao de coordenadas','2','2010-12-11 22:33:10','Motorista com id 2alterando coordenadas no sistema ','M'),(2031,'Alteracao de coordenadas','2','2010-12-11 22:33:11','Motorista com id 2alterando coordenadas no sistema ','M'),(2032,'Alteracao de coordenadas','2','2010-12-11 22:38:52','Motorista com id 2alterando coordenadas no sistema ','M'),(2033,'Alteracao de coordenadas','2','2010-12-11 22:38:53','Motorista com id 2alterando coordenadas no sistema ','M'),(2034,'Alteracao de coordenadas','2','2010-12-11 22:49:39','Motorista com id 2alterando coordenadas no sistema ','M'),(2035,'Alteracao de coordenadas','1','2010-12-11 22:49:40','Motorista com id 1alterando coordenadas no sistema ','M'),(2036,'Alteracao de coordenadas','2','2010-12-11 22:49:41','Motorista com id 2alterando coordenadas no sistema ','M'),(2037,'Alteracao de coordenadas','1','2010-12-11 22:56:12','Motorista com id 1alterando coordenadas no sistema ','M'),(2038,'Alteracao de coordenadas','2','2010-12-11 23:00:51','Motorista com id 2alterando coordenadas no sistema ','M'),(2039,'Alteracao de coordenadas','1','2010-12-11 23:02:01','Motorista com id 1alterando coordenadas no sistema ','M'),(2040,'Alteracao de coordenadas','2','2010-12-11 23:06:58','Motorista com id 2alterando coordenadas no sistema ','M'),(2041,'Alteracao de coordenadas','1','2010-12-11 23:07:24','Motorista com id 1alterando coordenadas no sistema ','M'),(2042,'Alteracao de coordenadas','2','2010-12-11 23:12:21','Motorista com id 2alterando coordenadas no sistema ','M'),(2043,'Alteracao de coordenadas','1','2010-12-11 23:12:21','Motorista com id 1alterando coordenadas no sistema ','M'),(2044,'Alteracao de coordenadas','2','2010-12-11 23:12:23','Motorista com id 2alterando coordenadas no sistema ','M'),(2045,'Insercao de coordenadas','1','2010-12-12 10:43:26','Motorista com id 1gravando coordenadas no sistema ','M'),(2046,'Alteracao de coordenadas','1','2010-12-12 10:49:06','Motorista com id 1alterando coordenadas no sistema ','M'),(2047,'Insercao de coordenadas','2','2010-12-12 10:53:19','Motorista com id 2gravando coordenadas no sistema ','M'),(2048,'Alteracao de coordenadas','2','2010-12-12 10:53:21','Motorista com id 2alterando coordenadas no sistema ','M'),(2049,'Alteracao de coordenadas','1','2010-12-12 10:54:22','Motorista com id 1alterando coordenadas no sistema ','M'),(2050,'Alteracao de coordenadas','1','2010-12-12 10:59:33','Motorista com id 1alterando coordenadas no sistema ','M'),(2051,'Alteracao de coordenadas','1','2010-12-12 11:04:51','Motorista com id 1alterando coordenadas no sistema ','M'),(2052,'Alteracao de coordenadas','1','2010-12-12 11:10:15','Motorista com id 1alterando coordenadas no sistema ','M'),(2053,'Alteracao de coordenadas','2','2010-12-12 11:12:05','Motorista com id 2alterando coordenadas no sistema ','M'),(2054,'Alteracao de coordenadas','2','2010-12-12 11:12:06','Motorista com id 2alterando coordenadas no sistema ','M'),(2055,'Alteracao de coordenadas','1','2010-12-12 11:15:34','Motorista com id 1alterando coordenadas no sistema ','M'),(2056,'Alteracao de coordenadas','1','2010-12-12 11:20:47','Motorista com id 1alterando coordenadas no sistema ','M'),(2057,'Alteracao de coordenadas','1','2010-12-12 11:26:04','Motorista com id 1alterando coordenadas no sistema ','M'),(2058,'Alteracao de coordenadas','1','2010-12-12 11:31:18','Motorista com id 1alterando coordenadas no sistema ','M'),(2059,'Alteracao de coordenadas','1','2010-12-12 11:36:38','Motorista com id 1alterando coordenadas no sistema ','M'),(2060,'Alteracao de coordenadas','1','2010-12-12 11:49:07','Motorista com id 1alterando coordenadas no sistema ','M'),(2061,'Alteracao de coordenadas','1','2010-12-12 11:55:02','Motorista com id 1alterando coordenadas no sistema ','M'),(2062,'Alteracao de coordenadas','1','2010-12-12 12:01:03','Motorista com id 1alterando coordenadas no sistema ','M'),(2063,'Alteracao de coordenadas','1','2010-12-12 12:06:11','Motorista com id 1alterando coordenadas no sistema ','M'),(2064,'Alteracao de coordenadas','1','2010-12-12 12:12:29','Motorista com id 1alterando coordenadas no sistema ','M'),(2065,'Alteracao de coordenadas','1','2010-12-12 12:17:57','Motorista com id 1alterando coordenadas no sistema ','M'),(2066,'Alteracao de coordenadas','1','2010-12-12 12:23:10','Motorista com id 1alterando coordenadas no sistema ','M'),(2067,'Alteracao de coordenadas','1','2010-12-12 12:28:21','Motorista com id 1alterando coordenadas no sistema ','M'),(2068,'Alteracao de coordenadas','1','2010-12-12 12:33:40','Motorista com id 1alterando coordenadas no sistema ','M'),(2069,'Alteracao de coordenadas','1','2010-12-12 12:39:05','Motorista com id 1alterando coordenadas no sistema ','M'),(2070,'Alteracao de coordenadas','1','2010-12-12 12:44:05','Motorista com id 1alterando coordenadas no sistema ','M'),(2071,'Alteracao de coordenadas','1','2010-12-12 12:49:33','Motorista com id 1alterando coordenadas no sistema ','M'),(2072,'Alteracao de coordenadas','1','2010-12-12 12:55:15','Motorista com id 1alterando coordenadas no sistema ','M'),(2073,'Alteracao de coordenadas','1','2010-12-12 13:00:18','Motorista com id 1alterando coordenadas no sistema ','M'),(2074,'Acesso ao sistema','fe','2010-12-12 16:22:32','Login fe acessou o sistema','U'),(2075,'Acesso ao sistema movel web','1','2010-12-12 16:32:08','Motorista de id 1 acessou o sistema móvel web','U'),(2076,'Consulta de passageiro','1','2010-12-12 16:32:33','Consulta através do parâmetro d como Nome','U'),(2077,'Inclusao de chamado','1','2010-12-12 16:35:11','Inclusao do chamdo com o código 45','U'),(2078,'Consulta de chamado','1','2010-12-12 16:35:48','Consulta de todos os chamados','U'),(2079,'Encerrar sessao','1','2010-12-12 16:36:14','Login 1 encerrou a sessão','U'),(2080,'Acesso ao sistema movel web','2','2010-12-12 16:36:20','Motorista de id 2 acessou o sistema móvel web','U'),(2081,'Encerrar sessao','2','2010-12-12 16:36:40','Login 2 encerrou a sessão','U'),(2082,'Acesso ao sistema movel web','1','2010-12-12 16:36:43','Motorista de id 1 acessou o sistema móvel web','U'),(2083,'Aceitar Chamado','1','2010-12-12 16:37:01','Login 1 Aceitou o chamado','U'),(2084,'Expirou sessão','1','2010-12-12 16:54:19','Login null expirou a sessão','U'),(2085,'Acesso ao sistema movel web','1','2010-12-12 16:59:18','Motorista de id 1 acessou o sistema móvel web','U'),(2086,'Chamado finalizado','1','2010-12-12 16:59:38','Login 1finalizou o chamado','U'),(2087,'Acesso ao sistema','fe','2010-12-12 17:02:04','Login fe acessou o sistema','U'),(2088,'Consulta de chamado','fe','2010-12-12 17:02:38','Consulta de todos os chamados','U'),(2089,'Encerrar sessao','fe','2010-12-12 17:03:41','Login fe encerrou a sessão','U'),(2090,'Expirou sessão','1','2010-12-12 17:13:48','Login null expirou a sessão','U'),(2091,'Acesso ao sistema','fe','2010-12-12 18:08:36','Login fe acessou o sistema','U'),(2092,'Acesso ao sistema','fe','2010-12-12 18:14:53','Login fe acessou o sistema','U'),(2093,'Consulta de chamado','fe','2010-12-12 18:15:25','Consulta de todos os chamados','U'),(2094,'Expirou sessão','fe','2010-12-12 18:19:57','Login null expirou a sessão','U'),(2095,'Expirou sessão','fe','2010-12-12 18:25:58','Login null expirou a sessão','U'),(2096,'Acesso ao sistema','brunin','2010-12-12 18:38:27','Login brunin acessou o sistema','U'),(2097,'Acesso ao sistema movel web','2','2010-12-12 18:42:03','Motorista de id 2 acessou o sistema móvel web','U'),(2098,'Consulta de passageiro','2','2010-12-12 18:45:26','Consulta através do parâmetro a como Nome','U'),(2099,'Inclusao de chamado','2','2010-12-12 18:45:59','Inclusao do chamdo com o código 46','U'),(2100,'Consulta de chamado','2','2010-12-12 18:46:09','Consulta de todos os chamados','U'),(2101,'Acesso ao sistema movel web','1','2010-12-12 18:51:56','Motorista de id 1 acessou o sistema móvel web','U'),(2102,'Recusar Chamado','2','2010-12-12 18:52:26','Login 2 Recusou o chamado','U'),(2103,'Chamado nao aceito','2','2010-12-12 18:52:32','Login 2não aceitou o chamado','U'),(2104,'Consulta de chamado','2','2010-12-12 18:53:06','Consulta de todos os chamados','U'),(2105,'Aceitar Chamado','1','2010-12-12 18:53:13','Login 1 Aceitou o chamado','U'),(2106,'Consulta de passageiro','2','2010-12-12 18:53:30','Consulta através do parâmetro bran como Nome','U'),(2107,'Chamado finalizado','1','2010-12-12 18:53:34','Login 1finalizou o chamado','U'),(2108,'Encerrar sessao','1','2010-12-12 18:53:39','Login 1 encerrou a sessão','U'),(2109,'Consulta de passageiro','2','2010-12-12 18:55:32','Consulta através do parâmetro a como Nome','U'),(2110,'Consulta de passageiro','2','2010-12-12 18:55:44','Consulta através do parâmetro a como Nome','U'),(2111,'Inclusao de chamado','2','2010-12-12 18:56:36','Inclusao do chamdo com o código 47','U'),(2112,'Consulta de chamado','2','2010-12-12 18:56:51','Consulta de todos os chamados','U'),(2113,'Aceitar Chamado','2','2010-12-12 18:58:25','Login 2 Aceitou o chamado','U'),(2114,'Chamado finalizado','2','2010-12-12 18:59:51','Login 2finalizou o chamado','U'),(2115,'Acesso ao sistema','brunin','2010-12-12 19:04:19','Login brunin acessou o sistema','U'),(2116,'Expirou sessão','1','2010-12-12 19:04:19','Login null expirou a sessão','U'),(2117,'Consulta de passageiro','brunin','2010-12-12 19:05:46','Consulta através do parâmetro bran como Nome','U'),(2118,'Inclusao de chamado','brunin','2010-12-12 19:06:04','Inclusao do chamdo com o código 48','U'),(2119,'Consulta de chamado','brunin','2010-12-12 19:06:11','Consulta de todos os chamados','U'),(2120,'Recusar Chamado','2','2010-12-12 19:08:50','Login 2 Recusou o chamado','U'),(2121,'Expirou sessão','brunin','2010-12-12 19:19:44','Login null expirou a sessão','U'),(2122,'Acesso ao sistema','brunin','2010-12-12 19:22:22','Login brunin acessou o sistema','U'),(2123,'Consulta de chamado','brunin','2010-12-12 19:22:26','Consulta de todos os chamados','U'),(2124,'Cancelamento de chamado','brunin','2010-12-12 19:22:31','Cancelamento do chamado com o código 48','U'),(2125,'Consulta de passageiro','brunin','2010-12-12 19:22:46','Consulta através do parâmetro br como Nome','U'),(2126,'Inclusao de chamado','brunin','2010-12-12 19:22:58','Inclusao do chamdo com o código 49','U'),(2127,'Consulta de chamado','brunin','2010-12-12 19:23:04','Consulta de todos os chamados','U'),(2128,'Acesso ao sistema movel web','2','2010-12-12 19:23:39','Motorista de id 2 acessou o sistema móvel web','U'),(2129,'Recusar Chamado','2','2010-12-12 19:23:41','Login 2 Recusou o chamado','U'),(2130,'Recusar Chamado','2','2010-12-12 19:23:42','Login 2 Cancelou a recusa do chamado','U'),(2131,'Recusar Chamado','2','2010-12-12 19:23:46','Login 2 Recusou o chamado','U'),(2132,'Recusar Chamado','2','2010-12-12 19:23:47','Login 2 Cancelou a recusa do chamado','U'),(2133,'Aceitar Chamado','2','2010-12-12 19:23:49','Login 2 Aceitou o chamado','U'),(2134,'Chamado finalizado','2','2010-12-12 19:23:55','Login 2finalizou o chamado','U'),(2135,'Encerrar sessao','2','2010-12-12 19:23:57','Login 2 encerrou a sessão','U'),(2136,'Expirou sessão','2','2010-12-12 19:34:47','Login null expirou a sessão','U'),(2137,'Alteracao de coordenadas','1','2010-12-12 20:12:52','Motorista com id 1alterando coordenadas no sistema ','M'),(2138,'Alteracao de coordenadas','1','2010-12-12 20:19:58','Motorista com id 1alterando coordenadas no sistema ','M'),(2139,'Alteracao de coordenadas','1','2010-12-12 20:25:05','Motorista com id 1alterando coordenadas no sistema ','M'),(2140,'Alteracao de coordenadas','1','2010-12-12 20:29:58','Motorista com id 1alterando coordenadas no sistema ','M'),(2141,'Alteracao de coordenadas','1','2010-12-12 20:34:59','Motorista com id 1alterando coordenadas no sistema ','M'),(2142,'Alteracao de coordenadas','1','2010-12-12 20:39:59','Motorista com id 1alterando coordenadas no sistema ','M'),(2143,'Alteracao de coordenadas','1','2010-12-12 20:45:05','Motorista com id 1alterando coordenadas no sistema ','M'),(2144,'Alteracao de coordenadas','1','2010-12-12 20:50:26','Motorista com id 1alterando coordenadas no sistema ','M'),(2145,'Alteracao de coordenadas','1','2010-12-12 20:59:52','Motorista com id 1alterando coordenadas no sistema ','M'),(2146,'Acesso ao sistema','fe','2010-12-12 21:03:05','Login fe acessou o sistema','U'),(2147,'Alteracao de coordenadas','1','2010-12-12 21:05:18','Motorista com id 1alterando coordenadas no sistema ','M'),(2148,'Inclusao de motorista','fe','2010-12-12 21:05:56','Inclusao do motorista com o id_dispositivo 91293092','U'),(2149,'Acesso ao sistema movel','91293092','2010-12-12 21:06:07','Motorista com id 91293092conectando ao sistema movel ','M'),(2150,'Insercao de coordenadas','91293092','2010-12-12 21:06:10','Motorista com id 91293092gravando coordenadas no sistema ','M'),(2151,'Alteracao de coordenadas','1','2010-12-12 21:10:46','Motorista com id 1alterando coordenadas no sistema ','M'),(2152,'Alteracao de coordenadas','91293092','2010-12-12 21:11:10','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2153,'Encerrar sessao no sistema móvel','91293092','2010-12-12 21:13:18','Motorista com id 91293092desconectando do sistema movel ','M'),(2154,'Alteracao de coordenadas','1','2010-12-12 21:15:54','Motorista com id 1alterando coordenadas no sistema ','M'),(2155,'Expirou sessão','fe','2010-12-12 21:16:31','Login null expirou a sessão','U'),(2156,'Acesso ao sistema movel','91293092','2010-12-12 21:17:13','Motorista com id 91293092conectando ao sistema movel ','M'),(2157,'Alteracao de coordenadas','1','2010-12-12 21:21:11','Motorista com id 1alterando coordenadas no sistema ','M'),(2158,'Alteracao de coordenadas','1','2010-12-12 21:26:26','Motorista com id 1alterando coordenadas no sistema ','M'),(2159,'Alteracao de coordenadas','91293092','2010-12-12 21:26:47','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2160,'Alteracao de coordenadas','1','2010-12-12 21:31:47','Motorista com id 1alterando coordenadas no sistema ','M'),(2161,'Alteracao de coordenadas','91293092','2010-12-12 21:31:53','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2162,'Acesso ao sistema','fe','2010-12-12 21:34:03','Login fe acessou o sistema','U'),(2163,'Consulta de chamado','fe','2010-12-12 21:34:09','Consulta de todos os chamados','U'),(2164,'Alteracao de coordenadas','1','2010-12-12 21:36:56','Motorista com id 1alterando coordenadas no sistema ','M'),(2165,'Alteracao de coordenadas','91293092','2010-12-12 21:37:05','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2166,'Alteracao de coordenadas','1','2010-12-12 21:42:09','Motorista com id 1alterando coordenadas no sistema ','M'),(2167,'Alteracao de coordenadas','91293092','2010-12-12 21:42:11','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2168,'Expirou sessão','fe','2010-12-12 21:44:44','Login null expirou a sessão','U'),(2169,'Alteracao de coordenadas','91293092','2010-12-12 21:47:17','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2170,'Alteracao de coordenadas','1','2010-12-12 21:47:29','Motorista com id 1alterando coordenadas no sistema ','M'),(2171,'Alteracao de coordenadas','1','2010-12-12 21:52:42','Motorista com id 1alterando coordenadas no sistema ','M'),(2172,'Alteracao de coordenadas','91293092','2010-12-12 21:57:32','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2173,'Alteracao de coordenadas','1','2010-12-12 21:58:09','Motorista com id 1alterando coordenadas no sistema ','M'),(2174,'Alteracao de coordenadas','91293092','2010-12-12 22:02:37','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2175,'Alteracao de coordenadas','1','2010-12-12 22:03:54','Motorista com id 1alterando coordenadas no sistema ','M'),(2176,'Acesso ao sistema','brunin','2010-12-12 22:04:54','Login brunin acessou o sistema','U'),(2177,'Consulta de motorista','brunin','2010-12-12 22:05:02','Consulta através do parâmetro  como ','U'),(2178,'Consulta de convenio','brunin','2010-12-12 22:05:34','Consulta através do parâmetro  como ','U'),(2179,'Consulta de passageiro por convenio','brunin','2010-12-12 22:05:44','Consulta através da tela de alteração do convênio código 8','U'),(2180,'Consulta de passageiro','brunin','2010-12-12 22:05:50','Consulta através do parâmetro denis como Nome','U'),(2181,'Inclusao de chamado','brunin','2010-12-12 22:07:34','Inclusao do chamdo com o código 50','U'),(2182,'Alteracao de coordenadas','91293092','2010-12-12 22:07:49','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2183,'Consulta de chamado','brunin','2010-12-12 22:07:49','Consulta de todos os chamados','U'),(2184,'Consulta de chamado','brunin','2010-12-12 22:08:12','Consulta de todos os chamados','U'),(2185,'Alteracao de coordenadas','1','2010-12-12 22:08:48','Motorista com id 1alterando coordenadas no sistema ','M'),(2186,'Encerrar sessao','brunin','2010-12-12 22:09:22','Login brunin encerrou a sessão','U'),(2187,'Acesso ao sistema','brunin','2010-12-12 22:10:20','Login brunin acessou o sistema','U'),(2188,'Consulta de chamado','brunin','2010-12-12 22:10:25','Consulta de todos os chamados','U'),(2189,'Cancelamento de chamado','brunin','2010-12-12 22:10:33','Cancelamento do chamado com o código 50','U'),(2190,'Alteracao de coordenadas','91293092','2010-12-12 22:12:52','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2191,'Alteracao de coordenadas','1','2010-12-12 22:14:01','Motorista com id 1alterando coordenadas no sistema ','M'),(2192,'Encerrar sessao','brunin','2010-12-12 22:16:33','Login brunin encerrou a sessão','U'),(2193,'Acesso ao sistema','brunin','2010-12-12 22:16:57','Login brunin acessou o sistema','U'),(2194,'Inclusao de Usuario','brunin','2010-12-12 22:17:31','Inclusao do motorista com o login user','U'),(2195,'Consulta de usuario','brunin','2010-12-12 22:17:39','Consulta através do parâmetro Nulo como Todos','U'),(2196,'Alteracao de coordenadas','1','2010-12-12 22:19:19','Motorista com id 1alterando coordenadas no sistema ','M'),(2197,'Alteracao de coordenadas','1','2010-12-12 22:26:03','Motorista com id 1alterando coordenadas no sistema ','M'),(2198,'Alteracao de coordenadas','1','2010-12-12 22:33:53','Motorista com id 1alterando coordenadas no sistema ','M'),(2199,'Alteracao de coordenadas','91293092','2010-12-12 22:35:05','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2200,'Acesso ao sistema','fe','2010-12-12 22:35:49','Login fe acessou o sistema','U'),(2201,'Encerrar sessao','fe','2010-12-12 22:37:19','Login fe encerrou a sessão','U'),(2202,'Acesso ao sistema','fe','2010-12-12 22:37:47','Login fe acessou o sistema','U'),(2203,'Expirou sessão','brunin','2010-12-12 22:39:37','Login null expirou a sessão','U'),(2204,'Alteracao de coordenadas','1','2010-12-12 22:39:49','Motorista com id 1alterando coordenadas no sistema ','M'),(2205,'Alteracao de coordenadas','91293092','2010-12-12 22:40:20','Motorista com id 91293092alterando coordenadas no sistema ','M'),(2206,'Encerrar sessao no sistema móvel','91293092','2010-12-12 22:40:33','Motorista com id 91293092desconectando do sistema movel ','M'),(2207,'Acesso ao sistema','fe','2010-12-13 15:06:41','Login fe acessou o sistema','U'),(2208,'Consulta de usuario','fe','2010-12-13 15:08:11','Consulta através do parâmetro Nulo como Todos','U'),(2209,'Alteracao de Usuario','fe','2010-12-13 15:08:51','Alteração do Usuario com o login user','U'),(2210,'Acesso ao sistema','user','2010-12-13 15:11:25','Login user acessou o sistema','U'),(2211,'Consulta de usuario','user','2010-12-13 15:11:43','Consulta através do parâmetro Nulo como Todos','U'),(2212,'Inclusao de Usuario','user','2010-12-13 15:13:05','Inclusao do motorista com o login Rita','U'),(2213,'Consulta de convenio','user','2010-12-13 15:13:38','Consulta através do parâmetro  como ','U'),(2214,'Expirou sessão','fe','2010-12-13 15:19:21','Login null expirou a sessão','U'),(2215,'Encerrar sessao','user','2010-12-13 15:19:36','Login user encerrou a sessão','U'),(2216,'Acesso ao sistema','Rita','2010-12-13 15:19:40','Login Rita acessou o sistema','U'),(2217,'Encerrar sessao','Rita','2010-12-13 15:24:44','Login Rita encerrou a sessão','U'),(2218,'Acesso ao sistema','user','2010-12-13 15:24:50','Login user acessou o sistema','U'),(2219,'Consulta de usuario','user','2010-12-13 15:24:55','Consulta através do parâmetro Nulo como Todos','U'),(2220,'Alteracao de Usuario','user','2010-12-13 15:25:03','Alteração do Usuario com o login Rita','U'),(2221,'Encerrar sessao','user','2010-12-13 15:25:06','Login user encerrou a sessão','U'),(2222,'Acesso ao sistema','Rita','2010-12-13 15:25:10','Login Rita acessou o sistema','U'),(2223,'Inclusao de convenio','Rita','2010-12-13 15:27:28','Inclusão do convênio com o cnpj 75644359000109','U'),(2224,'Consulta de convenio','Rita','2010-12-13 15:27:33','Consulta através do parâmetro  como ','U'),(2225,'Inclusao de passageiro','Rita','2010-12-13 15:29:15','Inclusao do passageiro com o cpf 64934826580','U'),(2226,'Consulta de motorista','Rita','2010-12-13 15:29:26','Consulta através do parâmetro  como ','U'),(2227,'Acesso ao sistema','user','2010-12-13 15:35:34','Login user acessou o sistema','U'),(2228,'Acesso ao sistema','fe','2010-12-13 15:36:07','Login fe acessou o sistema','U'),(2229,'Inclusao de Usuario','fe','2010-12-13 15:36:49','Inclusao do motorista com o login ebellomo','U'),(2230,'Encerrar sessao','fe','2010-12-13 15:36:54','Login fe encerrou a sessão','U'),(2231,'Acesso ao sistema','ebellomo','2010-12-13 15:36:59','Login ebellomo acessou o sistema','U'),(2232,'Acesso ao sistema movel web','91293092','2010-12-13 15:37:43','Motorista de id 91293092 acessou o sistema móvel web','U'),(2233,'Encerrar sessao','91293092','2010-12-13 15:37:56','Login 91293092 encerrou a sessão','U'),(2234,'Consulta de passageiro','91293092','2010-12-13 15:38:20','Consulta através do parâmetro Reinaldo como Nome','U'),(2235,'Encerrar sessao','ebellomo','2010-12-13 15:38:50','Login ebellomo encerrou a sessão','U'),(2236,'Inclusao de chamado','91293092','2010-12-13 15:38:54','Inclusao do chamdo com o código 51','U'),(2237,'Consulta de chamado','91293092','2010-12-13 15:39:01','Consulta de todos os chamados','U'),(2238,'Encerrar sessao','91293092','2010-12-13 15:40:32','Login 91293092 encerrou a sessão','U'),(2239,'Acesso ao sistema','fe','2010-12-13 15:46:12','Login fe acessou o sistema','U'),(2240,'Expirou sessão','fe','2010-12-13 15:58:28','Login null expirou a sessão','U'),(2241,'Acesso ao sistema','Rita','2010-12-13 16:04:52','Login Rita acessou o sistema','U'),(2242,'Acesso ao sistema','fe','2010-12-13 16:05:46','Login fe acessou o sistema','U'),(2243,'Consulta de chamado','fe','2010-12-13 16:05:53','Consulta de todos os chamados','U'),(2244,'Expirou sessão','fe','2010-12-13 16:16:32','Login null expirou a sessão','U'),(2245,'Acesso ao sistema','Rita','2010-12-13 16:21:49','Login Rita acessou o sistema','U'),(2246,'Consulta de chamado','Rita','2010-12-13 16:21:59','Consulta de todos os chamados','U'),(2247,'Acesso ao sistema movel web','91293092','2010-12-13 16:25:20','Motorista de id 91293092 acessou o sistema móvel web','U'),(2248,'Recusar Chamado','91293092','2010-12-13 16:25:25','Login 91293092 Recusou o chamado','U'),(2249,'Chamado nao aceito','91293092','2010-12-13 16:25:48','Login 91293092não aceitou o chamado','U'),(2250,'Consulta de chamado','91293092','2010-12-13 16:26:01','Consulta de todos os chamados','U'),(2251,'Acesso ao sistema movel web','1','2010-12-13 16:27:16','Motorista de id 1 acessou o sistema móvel web','U'),(2252,'Acesso ao sistema movel web','2','2010-12-13 16:28:55','Motorista de id 2 acessou o sistema móvel web','U'),(2253,'Consulta de chamado','91293092','2010-12-13 16:29:35','Consulta de todos os chamados','U'),(2254,'Consulta de chamado','91293092','2010-12-13 16:29:51','Consulta de todos os chamados','U'),(2255,'Consulta de passageiro','91293092','2010-12-13 16:30:05','Consulta através do parâmetro denis como Nome','U'),(2256,'Inclusao de chamado','91293092','2010-12-13 16:31:58','Inclusao do chamdo com o código 52','U'),(2257,'Consulta de chamado','91293092','2010-12-13 16:32:06','Consulta de todos os chamados','U'),(2258,'Consulta de chamado','91293092','2010-12-13 16:34:32','Consulta de todos os chamados','U'),(2259,'Aceitar Chamado','91293092','2010-12-13 16:34:45','Login 91293092 Aceitou o chamado','U'),(2260,'Chamado finalizado','91293092','2010-12-13 16:35:40','Login 91293092finalizou o chamado','U'),(2261,'Consulta de chamado','91293092','2010-12-13 16:35:52','Consulta de todos os chamados','U'),(2262,'Encerrar sessao','91293092','2010-12-13 16:36:27','Login 91293092 encerrou a sessão','U'),(2263,'Acesso ao sistema','fe','2010-12-13 16:40:28','Login fe acessou o sistema','U'),(2264,'Consulta de passageiro','fe','2010-12-13 16:41:01','Consulta através do parâmetro denis como Nome','U'),(2265,'Inclusao de chamado','fe','2010-12-13 16:42:04','Inclusao do chamdo com o código 53','U'),(2266,'Consulta de chamado','fe','2010-12-13 16:42:11','Consulta de todos os chamados','U'),(2267,'Consulta de chamado','fe','2010-12-13 16:49:44','Consulta de todos os chamados','U'),(2268,'Chamado nao aceito','91293092','2010-12-13 16:51:34','Login 91293092não aceitou o chamado','U'),(2269,'Consulta de chamado','fe','2010-12-13 16:53:44','Consulta de todos os chamados','U'),(2270,'Inclusao de passageiro','fe','2010-12-13 17:00:49','Inclusao do passageiro com o cpf 27413158418','U'),(2271,'Consulta de chamado','fe','2010-12-13 17:00:57','Consulta de todos os chamados','U'),(2272,'Consulta de passageiro','fe','2010-12-13 17:02:28','Consulta através do parâmetro mano como Nome','U'),(2273,'Inclusao de chamado','fe','2010-12-13 17:03:06','Inclusao do chamdo com o código 54','U'),(2274,'Consulta de chamado','fe','2010-12-13 17:03:32','Consulta de todos os chamados','U'),(2275,'Aceitar Chamado','91293092','2010-12-13 17:03:50','Login 91293092 Aceitou o chamado','U'),(2276,'Chamado finalizado','91293092','2010-12-13 17:04:08','Login 91293092finalizou o chamado','U'),(2277,'Consulta de chamado','fe','2010-12-13 17:04:20','Consulta de todos os chamados','U'),(2278,'Encerrar sessao','fe','2010-12-13 17:04:40','Login fe encerrou a sessão','U'),(2279,'Acesso ao sistema','fe','2010-12-13 17:05:00','Login fe acessou o sistema','U'),(2280,'Encerrar sessao','fe','2010-12-13 17:06:09','Login fe encerrou a sessão','U'),(2281,'Acesso ao sistema','fe','2010-12-13 17:06:15','Login fe acessou o sistema','U'),(2282,'Encerrar sessao','fe','2010-12-13 17:06:18','Login fe encerrou a sessão','U'),(2283,'Acesso ao sistema','fe','2010-12-13 17:06:36','Login fe acessou o sistema','U'),(2284,'Encerrar sessao','fe','2010-12-13 17:07:07','Login fe encerrou a sessão','U'),(2285,'Acesso ao sistema','fe','2010-12-13 17:07:13','Login fe acessou o sistema','U'),(2286,'Encerrar sessao','fe','2010-12-13 17:07:15','Login fe encerrou a sessão','U'),(2287,'Encerrar sessao','91293092','2010-12-13 17:11:17','Login 91293092 encerrou a sessão','U'),(2288,'Encerrar sessao','1','2010-12-13 17:11:21','Login 1 encerrou a sessão','U'),(2289,'Encerrar sessao','2','2010-12-13 17:11:23','Login 2 encerrou a sessão','U'),(2290,'Acesso ao sistema movel web','2','2010-12-13 17:11:31','Motorista de id 2 acessou o sistema móvel web','U'),(2291,'Encerrar sessao','2','2010-12-13 17:14:09','Login 2 encerrou a sessão','U'),(2292,'Expirou sessão','1','2010-12-13 17:21:48','Login null expirou a sessão','U'),(2293,'Expirou sessão','2','2010-12-13 17:24:48','Login null expirou a sessão','U'),(2294,'Acesso ao sistema','Rita','2010-12-13 19:47:36','Login Rita acessou o sistema','U'),(2295,'Consulta de chamado','Rita','2010-12-13 19:47:44','Consulta de todos os chamados','U'),(2296,'Consulta de passageiro','Rita','2010-12-13 19:48:27','Consulta através do parâmetro Manocchio como Nome','U'),(2297,'Acesso ao sistema movel web','1','2010-12-13 19:49:08','Motorista de id 1 acessou o sistema móvel web','U'),(2298,'Inclusao de chamado','1','2010-12-13 19:50:18','Inclusao do chamdo com o código 55','U'),(2299,'Consulta de chamado','1','2010-12-13 19:50:25','Consulta de todos os chamados','U'),(2300,'Encerrar sessao','1','2010-12-13 19:54:11','Login 1 encerrou a sessão','U'),(2301,'Acesso ao sistema movel web','91293092','2010-12-13 19:54:20','Motorista de id 91293092 acessou o sistema móvel web','U'),(2302,'Consulta de chamado','91293092','2010-12-13 19:54:51','Consulta de todos os chamados','U'),(2303,'Consulta de passageiro','91293092','2010-12-13 19:55:14','Consulta através do parâmetro brandon como Nome','U'),(2304,'Inclusao de chamado','91293092','2010-12-13 19:56:19','Inclusao do chamdo com o código 56','U'),(2305,'Consulta de chamado','91293092','2010-12-13 19:56:26','Consulta de todos os chamados','U'),(2306,'Consulta de chamado','91293092','2010-12-13 19:56:56','Consulta de todos os chamados','U'),(2307,'Consulta de chamado','91293092','2010-12-13 19:57:01','Consulta de todos os chamados','U'),(2308,'Consulta de chamado','91293092','2010-12-13 19:57:18','Consulta de todos os chamados','U'),(2309,'Recusar Chamado','91293092','2010-12-13 19:59:25','Login 91293092 Recusou o chamado','U'),(2310,'Recusar Chamado','91293092','2010-12-13 20:00:12','Login 91293092 Recusou o chamado','U'),(2311,'Recusar Chamado','91293092','2010-12-13 20:00:15','Login 91293092 Cancelou a recusa do chamado','U'),(2312,'Recusar Chamado','91293092','2010-12-13 20:00:28','Login 91293092 Recusou o chamado','U'),(2313,'Recusar Chamado','91293092','2010-12-13 20:00:35','Login 91293092 Cancelou a recusa do chamado','U'),(2314,'Recusar Chamado','91293092','2010-12-13 20:00:37','Login 91293092 Recusou o chamado','U'),(2315,'Recusar Chamado','91293092','2010-12-13 20:00:38','Login 91293092 Cancelou a recusa do chamado','U'),(2316,'Consulta de chamado','91293092','2010-12-13 20:00:45','Consulta de todos os chamados','U'),(2317,'Aceitar Chamado','91293092','2010-12-13 20:01:12','Login 91293092 Aceitou o chamado','U'),(2318,'Chamado finalizado','91293092','2010-12-13 20:01:56','Login 91293092finalizou o chamado','U'),(2319,'Consulta de chamado','91293092','2010-12-13 20:02:05','Consulta de todos os chamados','U'),(2320,'Cancelamento de chamado','91293092','2010-12-13 20:04:41','Cancelamento do chamado com o código 56','U'),(2321,'Consulta de chamado','91293092','2010-12-13 20:04:47','Consulta de todos os chamados','U'),(2322,'Cancelamento de chamado','91293092','2010-12-13 20:05:07','Cancelamento do chamado com o código 53','U'),(2323,'Consulta de chamado','91293092','2010-12-13 20:05:13','Consulta de todos os chamados','U'),(2324,'Cancelamento de chamado','91293092','2010-12-13 20:05:31','Cancelamento do chamado com o código 51','U'),(2325,'Consulta de passageiro','91293092','2010-12-13 20:06:57','Consulta através do parâmetro r como Nome','U'),(2326,'Inclusao de chamado','91293092','2010-12-13 20:07:36','Inclusao do chamdo com o código 57','U'),(2327,'Chamado nao aceito','91293092','2010-12-13 20:17:12','Login 91293092não aceitou o chamado','U'),(2328,'Expirou sessão','91293092','2010-12-13 21:52:58','Login null expirou a sessão','U'),(2329,'Acesso ao sistema','fe','2010-12-14 09:19:51','Login fe acessou o sistema','U'),(2330,'Inclusao de motorista','fe','2010-12-14 09:23:12','Inclusao do motorista com o id_dispositivo 99304809','U'),(2331,'Expirou sessão','fe','2010-12-14 09:33:15','Login null expirou a sessão','U'),(2332,'Acesso ao sistema movel','99304809','2010-12-14 09:35:08','Motorista com id 99304809conectando ao sistema movel ','M'),(2333,'Acesso ao sistema movel','2','2010-12-14 11:12:50','Motorista com id 2conectando ao sistema movel ','M'),(2334,'Insercao de coordenadas','2','2010-12-14 13:22:20','Motorista com id 2gravando coordenadas no sistema ','M'),(2335,'Alteracao de coordenadas','2','2010-12-14 13:27:59','Motorista com id 2alterando coordenadas no sistema ','M'),(2336,'Alteracao de coordenadas','2','2010-12-14 13:33:22','Motorista com id 2alterando coordenadas no sistema ','M'),(2337,'Alteracao de coordenadas','2','2010-12-14 13:52:56','Motorista com id 2alterando coordenadas no sistema ','M'),(2338,'Alteracao de coordenadas','2','2010-12-14 13:58:15','Motorista com id 2alterando coordenadas no sistema ','M'),(2339,'Alteracao de coordenadas','2','2010-12-14 16:05:06','Motorista com id 2alterando coordenadas no sistema ','M'),(2340,'Alteracao de coordenadas','2','2010-12-14 16:10:58','Motorista com id 2alterando coordenadas no sistema ','M'),(2341,'Alteracao de coordenadas','2','2010-12-14 17:05:29','Motorista com id 2alterando coordenadas no sistema ','M'),(2342,'Alteracao de coordenadas','2','2010-12-14 17:11:28','Motorista com id 2alterando coordenadas no sistema ','M'),(2343,'Alteracao de coordenadas','2','2010-12-14 17:18:03','Motorista com id 2alterando coordenadas no sistema ','M'),(2344,'Alteracao de coordenadas','2','2010-12-14 17:56:56','Motorista com id 2alterando coordenadas no sistema ','M'),(2345,'Alteracao de coordenadas','2','2010-12-14 18:02:37','Motorista com id 2alterando coordenadas no sistema ','M');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `id_dispositivo` varchar(40) NOT NULL,
  `cod_funcionario` int(11) NOT NULL,
  `ano_veiculo` int(11) NOT NULL,
  `modelo_veiculo` varchar(45) NOT NULL,
  `placa_veiculo` varchar(10) NOT NULL,
  `proprietario` bit(1) NOT NULL,
  `senha` varchar(7) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  `statusWeb` int(1) DEFAULT '0',
  PRIMARY KEY (`id_dispositivo`),
  KEY `motorista_funcionario` (`cod_funcionario`),
  CONSTRAINT `motorista_funcionario` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` VALUES ('1',80,2010,'Camaro','CAM-2010','','1','','2010-12-09 23:22:57',0,0),('2',81,2011,'Fiat Stilo','XXX-2090','','2','','2010-12-09 23:36:35',1,0),('91293092',83,0,'','','\0','senha','','2010-12-12 21:05:56',0,1),('99304809',87,0,'','','\0','senha','','2010-12-14 09:23:11',0,0);
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista_localizacao`
--

DROP TABLE IF EXISTS `motorista_localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista_localizacao` (
  `id_dispositivo` varchar(40) NOT NULL,
  `longitude` decimal(8,6) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `dataAtualizacao` datetime NOT NULL,
  KEY `motorista_localizacao_motorista` (`id_dispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista_localizacao`
--

LOCK TABLES `motorista_localizacao` WRITE;
/*!40000 ALTER TABLE `motorista_localizacao` DISABLE KEYS */;
INSERT INTO `motorista_localizacao` VALUES ('91293092','-46.583241','-23.550091','2010-12-14 13:28:19'),('2','-46.600437','-23.551016','2010-12-14 18:02:37');
/*!40000 ALTER TABLE `motorista_localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passageiro`
--

DROP TABLE IF EXISTS `passageiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passageiro` (
  `cod_passageiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` char(2) NOT NULL,
  `conveniado` bit(1) NOT NULL,
  `cod_convenio` int(11) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `cep` char(10) NOT NULL,
  `telefone` char(10) NOT NULL,
  `ddd` char(3) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_passageiro`),
  UNIQUE KEY `cod_passageiro_UNIQUE` (`cod_passageiro`),
  KEY `cod_convenio` (`cod_convenio`),
  KEY `passageiro_convenio` (`cod_convenio`),
  CONSTRAINT `passageiro_convenio` FOREIGN KEY (`cod_convenio`) REFERENCES `convenio` (`cod_convenio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passageiro`
--

LOCK TABLES `passageiro` WRITE;
/*!40000 ALTER TABLE `passageiro` DISABLE KEYS */;
INSERT INTO `passageiro` VALUES (36,'Denis Cassiano','23022708866','Rua Amborés','106','Cidade Vargas','São Paulo','SP','',8,'','2010-12-09 23:26:14','','50213227','11',''),(37,'Brandon Jacobs','51365556450','Av. Jabaquara','1501','Saúde','São Paulo','SP','',8,'','2010-12-09 23:33:37','','20204343','11',''),(38,'Reinaldo','64934826580','Ilha de Tatuoca','159','São Miguel','São Paulo','SP','',9,'','2010-12-13 15:29:15','08042120','35492138','11','Cidade Nova'),(39,'Manocchio','27413158418','Ilha de Tatuoca','130','São Miguel','São Paulo','SP','',8,'','2010-12-13 17:00:49','08042120','35492138','11','');
/*!40000 ALTER TABLE `passageiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_status`),
  UNIQUE KEY `cod_status_UNIQUE` (`cod_status`),
  UNIQUE KEY `descricao_UNIQUE` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Aberto'),(3,'Aguardando Aceite'),(4,'Cancelado'),(2,'Em andamento'),(5,'Fechado'),(6,'Fila');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `login` varchar(15) NOT NULL,
  `cod_funcionario` int(11) NOT NULL,
  `senha` varchar(6) NOT NULL,
  `supervisor` bit(1) NOT NULL DEFAULT b'0',
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `logado` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`login`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `funcionario_usuario` (`cod_funcionario`),
  CONSTRAINT `funcionario_usuario` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('brunin',79,'brunin','','','2010-12-09 23:20:36','N'),('ebellomo',86,'123456','','','2010-12-13 15:36:49','N'),('fe',82,'fe','','','2010-12-10 00:40:56','N'),('Rita',85,'senha','','','2010-12-13 15:13:04','S'),('user',84,'senha','','','2010-12-12 22:17:31','S');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sgft'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONVENIO_INS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_CONVENIO_INS`(
vRazao_social     varchar(45),
vNome_Fantasia  varchar(45),
vCnpj                varchar(16),
vRua                 varchar(45),
vNumero            varchar(10),
vBairro              varchar(45), 
vCidade             varchar(45),
vEstado             varchar(2),
vCep                 varchar(10),
iCod_contrato     int(11)
)
begin

insert into convenio (
razao_social,
nome_fantasia,
cnpj,
rua,
numero,
bairro,
cidade,
estado,
cep,
cod_contrato) values (
vRazao_social,
vNome_Fantasia,
vCnpj,
vRua,
vNumero,
vBairro, 
vCidade,
vEstado,
vCep,
iCod_contrato
);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Limpa_banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_Limpa_banco`()
BEGIN

DELETE FROM `sgft`.`log`;
DELETE FROM `sgft`.`usuario`;
DELETE FROM `sgft`.`motorista_localizacao`;
DELETE FROM `sgft`.`motorista`;
DELETE FROM `sgft`.`funcionario`;
DELETE FROM `sgft`.`chamado_cliente`;
DELETE FROM `sgft`.`chamado_final`;
DELETE FROM `sgft`.`chamado_motorista_aceite`;
DELETE FROM `sgft`.`chamado_motorista_envio`;
DELETE FROM `sgft`.`passageiro`;
DELETE FROM `sgft`.`convenio`;
call sp_usuario_ins ('Adm','cpf','rg','tel','adm','S','senha');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MOTORISTA_INS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_MOTORISTA_INS`(
vNome              varchar(45),
vCpf                 varchar(12),
vRg                  varchar(15),
vTelefone          varchar(15),
vDdd                  varchar(3),

vId_dispositivo   varchar(40), 
vModelo_veiculo varchar(45),
vPlaca_veiculo   varchar(15),
iAno_veiculo      int (11),
bProprietario      bit(1),
bAtivo              bit(1),
vSenha             varchar(6)
)
begin

declare iCod_funcionario int;

if (select count(*) from sgft.motorista where id_dispositivo=vId_dispositivo )=0 then


insert into funcionario (nome,cpf,rg,ddd,telefone) values (vNome,vCpf,vRg,vDdd,vTelefone);


set iCod_funcionario= (select last_insert_id());


insert into motorista (
id_dispositivo,
cod_funcionario,
modelo_veiculo,
placa_veiculo,
ano_veiculo,
proprietario,
ativo,
senha,
dataInclusao)
values (
vId_dispositivo, 
iCod_funcionario,
vModelo_veiculo,
vPlaca_veiculo,
iAno_veiculo,
bProprietario,
bAtivo,
vSenha,
now());
select iCod_funcionario as cod_funcionario;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PASSAGEIRO_INS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_PASSAGEIRO_INS`(
vNome              varchar(45),
vCpf                 varchar(12),
vRua                 varchar(45),
vNumero            varchar(10),
vBairro              varchar(45), 
vCidade             varchar(45),
vEstado             varchar(2),
bConveniado       bit(1),
iCod_convenio     int(11)
)
begin

insert into passageiro (
nome,
cpf,
rua,
numero,
bairro,
cidade,
estado,
conveniado,
cod_convenio) values (
vNome,
vCpf,
vRua,
vNumero,
vBairro, 
vCidade,
vEstado,
bConveniado,
iCod_convenio   
);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RELATORIO_CHAMADO_SEL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_RELATORIO_CHAMADO_SEL`(

iTipo            int(11),
vParametro  varchar(45),
vDataDe       varchar(20),
vDataAte      varchar(20)

)
BEGIN

if iTipo=1 then

Select 
    CC.cod_chamado, 
    S.descricao as status,
    P.nome as passageiro,
    P.cpf,
    ifnull(C.cnpj,'') as cnpj,
    ifnull(C.razao_social,'') as convenio,
    CC.dataInclusao,
    ifnull(F.nome,' ') as motorista,
    ifnull(M.id_dispositivo,' ') as id_dispositivo ,
    ifnull (CME.data_envio,' ') as data_envio,
    ifnull(CMA.data_aceite,' ') as data_aceite,
    ifnull(CMA.Justificativa,' ') as justificativa_recusa,
    ifnull(CC.justificativa,' ') as justificativa_cancelamento,
    ifnull(CF.data_fechamento,' ') as data_fechamento,
    ifnull(CF.valor,0.0) as valor,
    convenio as convenioCheck
from chamado_cliente CC
    inner join passageiro P
        on P.cod_passageiro = CC.cod_passageiro
    left join convenio C
        on P.cod_convenio= C.cod_convenio
    inner join status s
        on S.cod_status=CC.cod_status
    left join (select *  from chamado_motorista_envio a order by data_envio desc limit 1) CME
        on CME.cod_chamado=CC.cod_chamado
    left join motorista M
        on M.id_dispositivo=CME.id_dispositivo
    left join funcionario F 
        on F.cod_funcionario=M.cod_funcionario
    left join chamado_motorista_aceite CMA
        on CMA.cod_chamado=CC.cod_chamado
    left join chamado_final CF
        on CF.cod_chamado=CC.cod_chamado
     where P.cpf=vParametro and CC.dataInclusao between vDataDe and vDataAte;
     
end if;

if iTipo=2 then

Select 
    CC.cod_chamado, 
    S.descricao as status,
    P.nome as passageiro,
    P.cpf,
    ifnull(C.cnpj,'') as cnpj,
    ifnull(C.razao_social,'') as convenio,
    CC.dataInclusao,
    ifnull(F.nome,' ') as motorista,
    ifnull(M.id_dispositivo,' ') as id_dispositivo ,
    ifnull (CME.data_envio,' ') as data_envio,
    ifnull(CMA.data_aceite,' ') as data_aceite,
    ifnull(CMA.Justificativa,' ') as justificativa_recusa,
    ifnull(CC.justificativa,' ') as justificativa_cancelamento,
    ifnull(CF.data_fechamento,' ') as data_fechamento,
    ifnull(CF.valor,0.0) as valor,
    CC.convenio as convenioCheck
from chamado_cliente CC
    inner join passageiro P
        on P.cod_passageiro = CC.cod_passageiro
    left join convenio C
        on P.cod_convenio= C.cod_convenio
    inner join status S
        on S.cod_status=CC.cod_status
    left join (select *  from chamado_motorista_envio a order by data_envio desc limit 1) CME
        on CME.cod_chamado=CC.cod_chamado
    left join motorista M
        on M.id_dispositivo=CME.id_dispositivo
    left join funcionario F 
        on F.cod_funcionario=M.cod_funcionario
    left join chamado_motorista_aceite CMA
        on CMA.cod_chamado=CC.cod_chamado
    left join chamado_final CF
        on CF.cod_chamado=CC.cod_chamado
     where C.cnpj and CC.dataInclusao between vDataDe and vDataAte;
     
end if;

if iTipo=3 then

Select 
    CC.cod_chamado, 
    S.descricao as status,
    P.nome as passageiro,
    P.cpf,
    ifnull(C.cnpj,'') as cnpj,
    ifnull(C.razao_social,'') as convenio,
    CC.dataInclusao,
    ifnull(F.nome,' ') as motorista,
    ifnull(M.id_dispositivo,' ') as id_dispositivo ,
    ifnull (CME.data_envio,' ') as data_envio,
    ifnull(CMA.data_aceite,' ') as data_aceite,
    ifnull(CMA.Justificativa,' ') as justificativa_recusa,
    ifnull(CC.justificativa,' ') as justificativa_cancelamento,
    ifnull(CF.data_fechamento,' ') as data_fechamento,
    ifnull(CF.valor,0.0) as valor,
    CC.convenio as convenioCheck
from chamado_cliente CC
    inner join passageiro P
        on P.cod_passageiro = CC.cod_passageiro
    left join convenio C
        on P.cod_convenio= C.cod_convenio
    inner join status S
        on S.cod_status=CC.cod_status
    left join (select *  from chamado_motorista_envio a order by data_envio desc limit 1) CME
        on CME.cod_chamado=CC.cod_chamado
    left join motorista M
        on M.id_dispositivo=CME.id_dispositivo
    left join funcionario F 
        on F.cod_funcionario=M.cod_funcionario
    left join chamado_motorista_aceite CMA
        on CMA.cod_chamado=CC.cod_chamado
    left join chamado_final CF
        on CF.cod_chamado=CC.cod_chamado
     where M.id_dispositivo= vParametro and CC.dataInclusao between vDataDe and vDataAte;
     
end if;

if iTipo=4 then
    if vParametro='0' then
        Select 
            CC.cod_chamado, 
            S.descricao as status,
            P.nome as passageiro,
            P.cpf,
            ifnull(C.cnpj,'') as cnpj,
            ifnull(C.razao_social,'') as convenio,
            CC.dataInclusao,
            ifnull(F.nome,' ') as motorista,
            ifnull(M.id_dispositivo,' ') as id_dispositivo ,
            ifnull (CME.data_envio,' ') as data_envio,
            ifnull(CMA.data_aceite,' ') as data_aceite,
            ifnull(CMA.Justificativa,' ') as justificativa_recusa,
            ifnull(CC.justificativa,' ') as justificativa_cancelamento,
            ifnull(CF.data_fechamento,' ') as data_fechamento,
            ifnull(CF.valor,0.0) as valor,
            CC.convenio as convenioCheck
        from chamado_cliente CC
            inner join passageiro P
                on P.cod_passageiro = CC.cod_passageiro
            left join convenio C
                on P.cod_convenio= C.cod_convenio
            inner join status S
                on S.cod_status=CC.cod_status
            left join (select *  from chamado_motorista_envio a order by data_envio desc limit 1) CME
                on CME.cod_chamado=CC.cod_chamado
            left join motorista M
                on M.id_dispositivo=CME.id_dispositivo
            left join funcionario F 
                on F.cod_funcionario=M.cod_funcionario
            left join chamado_motorista_aceite CMA
                on CMA.cod_chamado=CC.cod_chamado
            left join chamado_final CF
                on CF.cod_chamado=CC.cod_chamado
            where CC.dataInclusao between vDataDe and vDataAte;
     else
         Select 
                CC.cod_chamado, 
                S.descricao as status,
                P.nome as passageiro,
                P.cpf,
                ifnull(C.cnpj,'') as cnpj,
                ifnull(C.razao_social,'') as convenio,
                CC.dataInclusao,
                ifnull(F.nome,' ') as motorista,
                ifnull(M.id_dispositivo,' ') as id_dispositivo ,
                ifnull (CME.data_envio,' ') as data_envio,
                ifnull(CMA.data_aceite,' ') as data_aceite,
                ifnull(CMA.Justificativa,' ') as justificativa_recusa,
                ifnull(CC.justificativa,' ') as justificativa_cancelamento,
                ifnull(CF.data_fechamento,' ') as data_fechamento,
                ifnull(CF.valor,0.0) as valor,
                CC.convenio as convenioCheck
            from chamado_cliente CC
                inner join passageiro P
                    on P.cod_passageiro = CC.cod_passageiro
                left join convenio C
                    on P.cod_convenio= C.cod_convenio
                inner join status S
                    on S.cod_status=CC.cod_status
                left join (select *  from chamado_motorista_envio a order by data_envio desc limit 1) CME
                    on CME.cod_chamado=CC.cod_chamado
                left join motorista M
                    on M.id_dispositivo=CME.id_dispositivo
                left join funcionario F 
                    on F.cod_funcionario=M.cod_funcionario
                left join chamado_motorista_aceite CMA
                    on CMA.cod_chamado=CC.cod_chamado
                left join chamado_final CF
                    on CF.cod_chamado=CC.cod_chamado
                where S.cod_status=vParametro and CC.dataInclusao between vDataDe and vDataAte;
        end if;     
end if;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RELATORIO_FUNCIONARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_RELATORIO_FUNCIONARIO`(

)
BEGIN

DECLARE  iAcessos            INT;
DECLARE  iCodFuncionario  INT;
DECLARE dDataInclusao     date;
DECLARE dDataUltimaAcao date;
DECLARE cTipoUsuario       char(1);
declare    vIdUsuario          varchar(45); 
declare    iContador            int default 0; 

 DECLARE curs CURSOR FOR (
 select cod_funcionario  from funcionario a where a.cod_funcionario in (select cod_funcionario from usuario)

);

DECLARE CONTINUE HANDLER FOR NOT FOUND SET iContador = 1;

Open curs;

repeat 

fetch curs into iCodFuncionario; 


if (select count(*) from usuario where cod_funcionario=iCodFuncionario) >0 then
    set cTipoUsuario='U';
    set vIdUsuario = (select login from usuario where cod_funcionario = iCodFuncionario);
    SET iAcessos = (SELECT COUNT(*) FROM LOG WHERE ID_USUARIO=vIdUsuario AND TIPO_ALTERACAO='Acesso ao sistema');
    SET dDataUltimaAcao = (SELECT data FROM LOG WHERE ID_USUARIO=vIdUsuario order by data desc limit 1);
    set  dDataInclusao = (select dataInclusao from usuario where cod_funcionario=iCodFuncionario);
else
    set cTipoUsuario='M';
    set vIdUsuario = (select id_dispositivo from motorista where cod_funcionario=iCodFuncionario);
    SET iAcessos = (SELECT COUNT(*) FROM LOG WHERE ID_USUARIO=vIdUsuario AND TIPO_ALTERACAO='Acesso ao sistema móvel');
    SET dDataUltimaAcao = (SELECT data FROM LOG WHERE ID_USUARIO=vIdUsuario order by data desc limit 1);
    set  dDataInclusao = (select dataInclusao from motorista where cod_funcionario=iCodFuncionario);
end if;    

select cod_funcionario,
nome,
vIdUsuario,
cTipoUsuario,
iAcessos,
dDataInclusao,
dDataUltimaAcao
from funcionario where cod_funcionario=iCodFuncionario;

UNTIL iContador END REPEAT;
close curs;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USUARIO_INS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `SP_USUARIO_INS`(
vNome              varchar(45),
vCpf                 varchar(12),
vRg                  varchar(15),
vTelefone          varchar(15),
vDdd                varchar(3),

vLogin              varchar(15), 
bSupervisor       bit(1),
vSenha             varchar(6)
)
begin

declare iCod_funcionario int;

if (select count(*) from sgft.usuario where login=vLogin )=0 then


insert into funcionario (nome,cpf,rg,telefone,ddd) values (vNome,vCpf,vRg,vTelefone,vDdd);


set iCod_funcionario= (select last_insert_id());


insert into usuario (
login,
cod_funcionario,
senha,
supervisor,
dataInclusao
) 
values (
vLogin, 
iCod_funcionario,
vSenha,
bSupervisor,
now());

select iCod_funcionario AS cod_funcionario;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:52
