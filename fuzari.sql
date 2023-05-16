-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hogwartsF
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` bigint NOT NULL AUTO_INCREMENT,
  `name_evento` varchar(150) NOT NULL,
  `dateInit` datetime NOT NULL,
  `dateEnd` datetime NOT NULL,
  `dateCheckInit` datetime NOT NULL,
  `dateCheckEnd` datetime NOT NULL,
  `numPartMax` int NOT NULL,
  `numPartAtual` int NOT NULL,
  `responsavel_fk` bigint NOT NULL,
  `local_fk` bigint NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `local_fk` (`local_fk`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`local_fk`) REFERENCES `locais` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Palestra','2023-05-16 19:10:00','2023-05-16 20:10:00','2023-05-15 19:00:00','2023-05-16 19:00:00',20,0,7,1),(2,'Debate','2023-05-14 19:10:00','2023-05-14 20:10:00','2023-05-13 19:00:00','2023-05-13 23:00:00',20,0,7,2),(3,'Formatura','2023-05-15 19:10:00','2023-05-15 23:10:00','2023-05-14 19:00:00','2023-05-14 23:00:00',20,0,7,3),(4,'Premiação','2023-05-20 19:10:00','2023-05-20 20:10:00','2023-05-19 19:00:00','2023-05-20 19:00:00',20,0,7,4);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id_item` bigint NOT NULL AUTO_INCREMENT,
  `name_item` varchar(200) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,'pc'),(2,'projetor'),(3,'arCondicionado'),(4,'tv');
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_local`
--

DROP TABLE IF EXISTS `itens_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_local` (
  `id_il` bigint NOT NULL AUTO_INCREMENT,
  `id_item_fk` bigint NOT NULL,
  `id_local_fk` bigint NOT NULL,
  `removido` enum('0','1') NOT NULL DEFAULT (_utf8mb4'0'),
  PRIMARY KEY (`id_il`),
  KEY `id_item_fk` (`id_item_fk`),
  KEY `id_local_fk` (`id_local_fk`),
  CONSTRAINT `itens_local_ibfk_1` FOREIGN KEY (`id_item_fk`) REFERENCES `itens` (`id_item`),
  CONSTRAINT `itens_local_ibfk_2` FOREIGN KEY (`id_local_fk`) REFERENCES `locais` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_local`
--

LOCK TABLES `itens_local` WRITE;
/*!40000 ALTER TABLE `itens_local` DISABLE KEYS */;
INSERT INTO `itens_local` VALUES (1,1,1,'0'),(2,3,1,'0'),(3,2,2,'0'),(4,4,2,'0'),(5,3,3,'0'),(6,2,3,'0'),(7,1,4,'0'),(8,4,4,'0');
/*!40000 ALTER TABLE `itens_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id_local` bigint NOT NULL AUTO_INCREMENT,
  `name_local` varchar(200) NOT NULL,
  `bloco` enum('A','B','C','D') NOT NULL,
  `capacidade` int NOT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'sala1','A',20),(2,'sala2','B',20),(3,'sala3','C',20),(4,'sala4','D',20),(5,'teste','A',34);
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelAcesso`
--

DROP TABLE IF EXISTS `nivelAcesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelAcesso` (
  `id_nivel` bigint NOT NULL AUTO_INCREMENT,
  `nivel_nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelAcesso`
--

LOCK TABLES `nivelAcesso` WRITE;
/*!40000 ALTER TABLE `nivelAcesso` DISABLE KEYS */;
INSERT INTO `nivelAcesso` VALUES (1,'Admin'),(2,'Gestor'),(3,'Usuário'),(4,'Visitante');
/*!40000 ALTER TABLE `nivelAcesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocup_user`
--

DROP TABLE IF EXISTS `ocup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocup_user` (
  `id_una` bigint NOT NULL AUTO_INCREMENT,
  `id_ocup_fk` bigint NOT NULL,
  `id_user_fk` bigint NOT NULL,
  `dateEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_una`),
  KEY `id_ocup_fk` (`id_ocup_fk`),
  KEY `id_user_fk` (`id_user_fk`),
  CONSTRAINT `ocup_user_ibfk_1` FOREIGN KEY (`id_ocup_fk`) REFERENCES `ocupacoes` (`id_ocup`),
  CONSTRAINT `ocup_user_ibfk_2` FOREIGN KEY (`id_user_fk`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocup_user`
--

LOCK TABLES `ocup_user` WRITE;
/*!40000 ALTER TABLE `ocup_user` DISABLE KEYS */;
INSERT INTO `ocup_user` VALUES (1,1,7,NULL),(2,2,5,NULL),(3,3,6,NULL),(4,4,1,NULL);
/*!40000 ALTER TABLE `ocup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacoes`
--

DROP TABLE IF EXISTS `ocupacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacoes` (
  `id_ocup` bigint NOT NULL AUTO_INCREMENT,
  `ocup_nome` varchar(150) NOT NULL,
  `ocup_nivel_fk` bigint NOT NULL,
  PRIMARY KEY (`id_ocup`),
  KEY `ocup_nivel_fk` (`ocup_nivel_fk`),
  CONSTRAINT `ocupacoes_ibfk_1` FOREIGN KEY (`ocup_nivel_fk`) REFERENCES `nivelAcesso` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacoes`
--

LOCK TABLES `ocupacoes` WRITE;
/*!40000 ALTER TABLE `ocupacoes` DISABLE KEYS */;
INSERT INTO `ocupacoes` VALUES (1,'Diretor',1),(2,'Cordenador',2),(3,'Professor',3),(4,'Faxineiro',4);
/*!40000 ALTER TABLE `ocupacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_evento`
--

DROP TABLE IF EXISTS `user_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_evento` (
  `id_ue` bigint NOT NULL AUTO_INCREMENT,
  `id_evento_fk` bigint NOT NULL,
  `id_user_fk` bigint NOT NULL,
  `dateCheck` datetime NOT NULL,
  PRIMARY KEY (`id_ue`),
  KEY `id_evento_fk` (`id_evento_fk`),
  KEY `id_user_fk` (`id_user_fk`),
  CONSTRAINT `user_evento_ibfk_1` FOREIGN KEY (`id_evento_fk`) REFERENCES `eventos` (`id_evento`),
  CONSTRAINT `user_evento_ibfk_2` FOREIGN KEY (`id_user_fk`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_evento`
--

LOCK TABLES `user_evento` WRITE;
/*!40000 ALTER TABLE `user_evento` DISABLE KEYS */;
INSERT INTO `user_evento` VALUES (1,1,1,'2023-05-15 23:32:15'),(2,1,5,'2023-05-16 05:13:54'),(3,2,5,'2023-05-13 19:23:14'),(4,2,6,'2023-05-13 22:59:59'),(5,3,6,'2023-05-14 19:01:23'),(6,3,1,'2023-05-14 22:32:56'),(7,4,5,'2023-05-19 23:03:21'),(8,4,1,'2023-05-20 14:27:39');
/*!40000 ALTER TABLE `user_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dtNasc` date NOT NULL,
  `senha` varchar(150) NOT NULL,
  `dtCadastro` date NOT NULL DEFAULT (now()),
  `userDeleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Fuzari','matheus.fuzari@gmail.com','2004-11-08','202cb962ac59075b964b07152d234b70','2023-05-16','0'),(5,'Henrique','henrique.pessoa@gmail.com','2004-07-11','202cb962ac59075b964b07152d234b70','2023-05-16','0'),(6,'Kauan','kauan.estoque@gmail.com','2004-10-21','202cb962ac59075b964b07152d234b70','2023-05-16','0'),(7,'André','andre.savedra@gmail.com','1990-03-15','202cb962ac59075b964b07152d234b70','2023-05-16','0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 22:51:49
