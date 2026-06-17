CREATE DATABASE  IF NOT EXISTS "TP_FINAL" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `TP_FINAL`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: mysql-281e9a6b-proyectofinalbd.h.aivencloud.com    Database: TP_FINAL
-- ------------------------------------------------------
-- Server version	8.4.8

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1fb47f7b-5b96-11f1-b849-82288dc86717:1-572,
21bb9068-4fef-11f1-89d5-26e3963530db:1-27,
3703c193-55d6-11f1-b294-06839ac81c4c:1-52';

--
-- Table structure for table `Auditoria_Prestamos`
--

DROP TABLE IF EXISTS `Auditoria_Prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auditoria_Prestamos` (
  `IdAuditoria` int NOT NULL AUTO_INCREMENT,
  `IdPrestamo` int DEFAULT NULL,
  `Accion` varchar(20) NOT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UsuarioBD` varchar(100) NOT NULL,
  `IdEstadoAnterior` int DEFAULT NULL,
  `IdEstadoNuevo` int DEFAULT NULL,
  PRIMARY KEY (`IdAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auditoria_Prestamos`
--

LOCK TABLES `Auditoria_Prestamos` WRITE;
/*!40000 ALTER TABLE `Auditoria_Prestamos` DISABLE KEYS */;
INSERT INTO `Auditoria_Prestamos` VALUES (1,9,'INSERT','2026-06-08 22:01:13','admin_tp',NULL,1),(2,9,'UPDATE','2026-06-08 22:01:13','admin_tp',1,2);
/*!40000 ALTER TABLE `Auditoria_Prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autor`
--

DROP TABLE IF EXISTS `Autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `IdSexo` int NOT NULL,
  `IdNacionalidad` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdSexo` (`IdSexo`),
  KEY `IdNacionalidad` (`IdNacionalidad`),
  CONSTRAINT `Autor_ibfk_1` FOREIGN KEY (`IdSexo`) REFERENCES `Sexo` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Autor_ibfk_2` FOREIGN KEY (`IdNacionalidad`) REFERENCES `Nacionalidad` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autor`
--

LOCK TABLES `Autor` WRITE;
/*!40000 ALTER TABLE `Autor` DISABLE KEYS */;
INSERT INTO `Autor` VALUES (1,'George','Orwell',2,4),(2,'Isabel','Allende',1,5),(3,'Jorge Luis','Borges',2,1),(4,'J.K.','Rowling',1,4),(5,'Gabriel','García Márquez',2,6),(6,'J.R.R.','Tolkien',2,4),(7,'Stephen','King',2,7),(8,'Julio','Cortázar',2,1),(9,'Agatha','Christie',1,4),(10,'Isaac','Asimov',2,7),(11,'Ray','Bradbury',2,7),(12,'H.P.','Lovecraft',2,7),(13,'Arthur C.','Clarke',2,4),(14,'C.S.','Lewis',2,4),(15,'Dan','Brown',2,7),(16,'Brandon','Sanderson',2,7);
/*!40000 ALTER TABLE `Autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autor_Libro`
--

DROP TABLE IF EXISTS `Autor_Libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autor_Libro` (
  `IdAutor` int NOT NULL,
  `IsbnLibro` decimal(13,0) NOT NULL,
  PRIMARY KEY (`IdAutor`,`IsbnLibro`),
  KEY `IsbnLibro` (`IsbnLibro`),
  CONSTRAINT `Autor_Libro_ibfk_1` FOREIGN KEY (`IdAutor`) REFERENCES `Autor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Autor_Libro_ibfk_2` FOREIGN KEY (`IsbnLibro`) REFERENCES `Libro` (`Isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autor_Libro`
--

LOCK TABLES `Autor_Libro` WRITE;
/*!40000 ALTER TABLE `Autor_Libro` DISABLE KEYS */;
INSERT INTO `Autor_Libro` VALUES (1,9780451524935),(16,9780765326355),(16,9780765326362),(16,9781250166548),(16,9781250313188),(9,9788401017756),(7,9788401337205),(7,9788401352055),(8,9788420637081),(5,9788432207287),(11,9788433971468),(8,9788437603353),(2,9788437604947),(6,9788445073962),(6,9788445075317),(10,9788448018029),(10,9788448042413),(15,9788466335978),(5,9788497592208),(4,9788498387087),(4,9788498387179),(9,9788499890544),(14,9788499892425),(3,9789875666471);
/*!40000 ALTER TABLE `Autor_Libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejemplar`
--

DROP TABLE IF EXISTS `Ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ejemplar` (
  `Numero` int NOT NULL AUTO_INCREMENT,
  `FechaAlta` date NOT NULL,
  `IsbnLibro` decimal(13,0) NOT NULL,
  `IdEstadoEjemplar` int NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `IdEstadoEjemplar` (`IdEstadoEjemplar`),
  KEY `busqueda_isbn_ejemplar` (`IsbnLibro`),
  CONSTRAINT `Ejemplar_ibfk_1` FOREIGN KEY (`IsbnLibro`) REFERENCES `Libro` (`Isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Ejemplar_ibfk_2` FOREIGN KEY (`IdEstadoEjemplar`) REFERENCES `EstadoEjemplar` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejemplar`
--

LOCK TABLES `Ejemplar` WRITE;
/*!40000 ALTER TABLE `Ejemplar` DISABLE KEYS */;
INSERT INTO `Ejemplar` VALUES (1,'2025-01-20',9780451524935,1),(2,'2025-01-20',9780451524935,2),(3,'2025-02-10',9780451524935,1),(4,'2025-03-05',9780451524935,2),(5,'2025-04-15',9780451524935,3),(6,'2025-02-15',9788437604947,1),(7,'2025-05-12',9788437604947,2),(8,'2025-06-01',9788437604947,1),(9,'2025-03-20',9789875666471,2),(10,'2025-07-10',9789875666471,1),(11,'2025-01-01',9788498387087,1),(12,'2025-01-01',9788432207287,1),(13,'2025-01-01',9788445075317,1),(14,'2025-02-01',9788401337205,1),(15,'2025-02-01',9788437603353,1),(16,'2025-02-01',9788499890544,1),(17,'2025-02-01',9788448018029,1),(18,'2025-02-01',9788433971468,1),(19,'2025-02-01',9788498387179,1),(20,'2025-02-01',9788497592208,1),(21,'2025-02-01',9788445073962,1),(22,'2025-02-01',9788401352055,1),(23,'2025-02-01',9788420637081,1),(24,'2025-02-01',9788401017756,1),(25,'2025-02-01',9788448042413,1),(26,'2026-06-01',9788498387087,2),(27,'2026-06-01',9788498387179,2),(28,'2026-06-01',9788432207287,2),(29,'2026-06-01',9788497592208,2),(30,'2026-06-01',9788445075317,2),(31,'2026-06-01',9788445073962,2),(32,'2026-06-01',9788401337205,2),(33,'2026-06-01',9788401352055,2),(34,'2026-06-01',9788437603353,2),(35,'2026-06-01',9788420637081,2),(36,'2026-06-01',9788499890544,2),(37,'2026-06-01',9788401017756,2),(38,'2026-06-01',9788448018029,2),(39,'2026-06-01',9788448042413,2),(40,'2026-06-01',9788433971468,2),(41,'2026-05-01',9788498387087,2),(42,'2026-05-01',9788498387179,2),(43,'2026-05-01',9788432207287,2),(44,'2026-05-01',9788497592208,2),(45,'2026-05-01',9788445075317,2),(46,'2026-05-01',9788445073962,2),(47,'2026-05-01',9788401337205,2),(48,'2026-05-01',9788401352055,2),(49,'2026-05-01',9788437603353,2),(50,'2026-05-01',9788420637081,2),(51,'2026-05-01',9788499890544,2),(52,'2026-05-01',9788401017756,2),(53,'2026-01-01',9780765326355,2),(54,'2026-01-01',9780765326355,2),(55,'2026-01-01',9780765326355,1),(56,'2026-01-01',9780765326355,1),(57,'2026-01-01',9780765326362,1),(58,'2026-01-01',9780765326362,2),(59,'2026-01-01',9781250166548,1),(60,'2026-01-01',9781250166548,1),(61,'2026-01-01',9781250166548,1),(62,'2026-01-01',9788498387087,1),(63,'2026-01-01',9788432207287,1),(64,'2026-01-01',9788445075317,1),(65,'2026-01-01',9788401337205,1);
/*!40000 ALTER TABLE `Ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoEjemplar`
--

DROP TABLE IF EXISTS `EstadoEjemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstadoEjemplar` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoEjemplar`
--

LOCK TABLES `EstadoEjemplar` WRITE;
/*!40000 ALTER TABLE `EstadoEjemplar` DISABLE KEYS */;
INSERT INTO `EstadoEjemplar` VALUES (1,'Disponible'),(2,'Prestado'),(3,'Baja');
/*!40000 ALTER TABLE `EstadoEjemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoPrestamo`
--

DROP TABLE IF EXISTS `EstadoPrestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstadoPrestamo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoPrestamo`
--

LOCK TABLES `EstadoPrestamo` WRITE;
/*!40000 ALTER TABLE `EstadoPrestamo` DISABLE KEYS */;
INSERT INTO `EstadoPrestamo` VALUES (1,'Activo'),(2,'Devuelto'),(3,'Vencido');
/*!40000 ALTER TABLE `EstadoPrestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoSocio`
--

DROP TABLE IF EXISTS `EstadoSocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstadoSocio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoSocio`
--

LOCK TABLES `EstadoSocio` WRITE;
/*!40000 ALTER TABLE `EstadoSocio` DISABLE KEYS */;
INSERT INTO `EstadoSocio` VALUES (1,'Activo'),(2,'Suspendido'),(3,'Baja');
/*!40000 ALTER TABLE `EstadoSocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneroLibro`
--

DROP TABLE IF EXISTS `GeneroLibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GeneroLibro` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneroLibro`
--

LOCK TABLES `GeneroLibro` WRITE;
/*!40000 ALTER TABLE `GeneroLibro` DISABLE KEYS */;
INSERT INTO `GeneroLibro` VALUES (1,'Ficción','Obras literarias que narran hechos imaginarios.'),(2,'Realismo Mágico','Movimiento literario de mediados del siglo XX.'),(3,'Ciencia Ficción','Relatos especulativos sobre el futuro y la tecnología.'),(4,'Terror','Obras destinadas a provocar miedo o angustia.'),(5,'Policial','Narrativas centradas en la resolución de un crimen.');
/*!40000 ALTER TABLE `GeneroLibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneroLibro_Libro`
--

DROP TABLE IF EXISTS `GeneroLibro_Libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GeneroLibro_Libro` (
  `IdGeneroLibro` int NOT NULL,
  `IsbnLibro` decimal(13,0) NOT NULL,
  PRIMARY KEY (`IdGeneroLibro`,`IsbnLibro`),
  KEY `IsbnLibro` (`IsbnLibro`),
  CONSTRAINT `GeneroLibro_Libro_ibfk_1` FOREIGN KEY (`IdGeneroLibro`) REFERENCES `GeneroLibro` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GeneroLibro_Libro_ibfk_2` FOREIGN KEY (`IsbnLibro`) REFERENCES `Libro` (`Isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneroLibro_Libro`
--

LOCK TABLES `GeneroLibro_Libro` WRITE;
/*!40000 ALTER TABLE `GeneroLibro_Libro` DISABLE KEYS */;
INSERT INTO `GeneroLibro_Libro` VALUES (3,9780451524935),(3,9780765326355),(3,9780765326362),(3,9781250166548),(3,9781250313188),(5,9788401017756),(4,9788401337205),(4,9788401352055),(5,9788420637081),(2,9788432207287),(3,9788433971468),(1,9788437603353),(2,9788437604947),(1,9788445073962),(1,9788445075317),(3,9788448018029),(3,9788448042413),(5,9788466335978),(2,9788497592208),(1,9788498387087),(1,9788498387179),(5,9788499890544),(1,9788499892425),(1,9789875666471);
/*!40000 ALTER TABLE `GeneroLibro_Libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro`
--

DROP TABLE IF EXISTS `Libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro` (
  `Isbn` decimal(13,0) NOT NULL,
  `Titulo` varchar(60) NOT NULL,
  `Año` year NOT NULL,
  `StockTotal` int NOT NULL DEFAULT '0',
  `StockDisponible` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Isbn`),
  CONSTRAINT `Libro_chk_1` CHECK (((`StockDisponible` >= 0) and (`StockDisponible` <= `StockTotal`))),
  CONSTRAINT `Libro_chk_2` CHECK ((`Año` <= 2026))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro`
--

LOCK TABLES `Libro` WRITE;
/*!40000 ALTER TABLE `Libro` DISABLE KEYS */;
INSERT INTO `Libro` VALUES (9780451524935,'1984',1949,5,2),(9780765326355,'El camino de los reyes',2010,10,8),(9780765326362,'Palabras radiantes',2014,5,5),(9781250166548,'Juramentada',2017,3,3),(9781250313188,'El ritmo de la guerra',2020,5,5),(9788401017756,'Muerte en el Nilo',1937,5,5),(9788401337205,'It',1986,5,5),(9788401352055,'El resplandor',1977,5,5),(9788420637081,'Bestiario',1951,5,5),(9788432207287,'Cien años de soledad',1967,5,5),(9788433971468,'Fahrenheit 451',1953,5,5),(9788437603353,'Rayuela',1963,5,5),(9788437604947,'La casa de los espíritus',1982,3,2),(9788445073962,'La comunidad del anillo',1954,5,5),(9788445075317,'El hobbit',1937,5,5),(9788448018029,'Fundación',1951,5,5),(9788448042413,'Yo, robot',1950,5,5),(9788466335978,'El código Da Vinci',2003,5,5),(9788497592208,'Crónica de una muerte anunciada',1981,5,5),(9788498387087,'Harry Potter y la piedra filosofal',1997,5,5),(9788498387179,'Harry Potter y la cámara secreta',1998,5,5),(9788499890544,'Asesinato en el Orient Express',1934,5,5),(9788499892425,'Las crónicas de Narnia: El león',1950,5,5),(9789875666471,'Ficciones',1944,2,1);
/*!40000 ALTER TABLE `Libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nacionalidad`
--

DROP TABLE IF EXISTS `Nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nacionalidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(60) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nacionalidad`
--

LOCK TABLES `Nacionalidad` WRITE;
/*!40000 ALTER TABLE `Nacionalidad` DISABLE KEYS */;
INSERT INTO `Nacionalidad` VALUES (1,'Argentina'),(2,'Uruguay'),(3,'España'),(4,'Reino Unido'),(5,'Chile'),(6,'Colombia'),(7,'Estados Unidos'),(8,'Francia'),(9,'Japón'),(10,'Alemania');
/*!40000 ALTER TABLE `Nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prestamo`
--

DROP TABLE IF EXISTS `Prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prestamo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FechaPrestamo` date NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `FechaDevolucion` date DEFAULT NULL,
  `IdSocio` int NOT NULL,
  `IdEjemplar` int NOT NULL,
  `IdEstadoPrestamo` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdSocio` (`IdSocio`),
  KEY `IdEstadoPrestamo` (`IdEstadoPrestamo`),
  KEY `IdEjemplar` (`IdEjemplar`),
  CONSTRAINT `Prestamo_ibfk_1` FOREIGN KEY (`IdSocio`) REFERENCES `Socio` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Prestamo_ibfk_2` FOREIGN KEY (`IdEstadoPrestamo`) REFERENCES `EstadoPrestamo` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Prestamo_ibfk_3` FOREIGN KEY (`IdEjemplar`) REFERENCES `Ejemplar` (`Numero`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Prestamo_chk_1` CHECK (((`FechaVencimiento` >= `FechaPrestamo`) and ((`FechaDevolucion` is null) or (`FechaDevolucion` >= `FechaPrestamo`))))
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prestamo`
--

LOCK TABLES `Prestamo` WRITE;
/*!40000 ALTER TABLE `Prestamo` DISABLE KEYS */;
INSERT INTO `Prestamo` VALUES (1,'2025-03-01','2025-03-15','2025-03-10',1,1,2),(2,'2025-04-10','2025-04-24','2025-04-20',2,3,2),(3,'2025-05-05','2025-05-19','2025-05-18',4,6,2),(4,'2025-07-20','2025-08-03','2025-08-01',5,8,2),(5,'2025-09-01','2025-09-15',NULL,1,2,1),(6,'2025-09-05','2025-09-19',NULL,4,7,1),(7,'2025-08-01','2025-08-15',NULL,3,4,3),(8,'2025-08-10','2025-08-24',NULL,2,9,3),(9,'2025-05-10','2025-05-24','2025-06-10',3,10,2),(10,'2025-01-15','2025-01-22','2025-02-15',6,11,2),(11,'2025-01-15','2025-01-22','2025-02-15',7,12,2),(12,'2025-01-15','2025-01-22','2025-02-15',8,13,2),(13,'2025-02-10','2025-02-17','2025-02-15',9,14,2),(14,'2025-02-10','2025-02-17','2025-02-15',10,15,2),(15,'2025-02-10','2025-02-17','2025-02-15',11,16,2),(16,'2025-02-10','2025-02-17','2025-02-15',12,17,2),(17,'2025-02-10','2025-02-17','2025-02-15',13,18,2),(18,'2025-02-10','2025-02-17','2025-02-15',14,19,2),(19,'2025-02-10','2025-02-17','2025-02-15',15,20,2),(20,'2025-02-10','2025-02-17','2025-02-15',16,21,2),(21,'2025-02-10','2025-02-17','2025-02-15',17,22,2),(22,'2025-02-10','2025-02-17','2025-02-15',18,23,2),(23,'2025-02-10','2025-02-17','2025-02-15',19,24,2),(24,'2025-02-10','2025-02-17','2025-02-15',20,25,2),(25,'2026-06-17','2026-06-24',NULL,6,26,1),(26,'2026-06-17','2026-06-24',NULL,7,27,1),(27,'2026-06-17','2026-06-24',NULL,8,28,1),(28,'2026-06-17','2026-06-24',NULL,9,29,1),(29,'2026-06-17','2026-06-24',NULL,10,30,1),(30,'2026-06-17','2026-06-24',NULL,11,31,1),(31,'2026-06-17','2026-06-24',NULL,12,32,1),(32,'2026-06-17','2026-06-24',NULL,13,33,1),(33,'2026-06-17','2026-06-24',NULL,14,34,1),(34,'2026-06-17','2026-06-24',NULL,15,35,1),(35,'2026-06-17','2026-06-24',NULL,16,36,1),(36,'2026-06-17','2026-06-24',NULL,17,37,1),(37,'2026-06-17','2026-06-24',NULL,18,38,1),(38,'2026-06-17','2026-06-24',NULL,19,39,1),(39,'2026-06-17','2026-06-24',NULL,20,40,1),(40,'2026-05-10','2026-05-17',NULL,26,41,3),(41,'2026-05-01','2026-05-08',NULL,27,42,3),(42,'2026-06-01','2026-06-08',NULL,28,43,3),(43,'2026-05-10','2026-05-17',NULL,21,44,3),(44,'2026-05-10','2026-05-17',NULL,22,45,3),(45,'2026-05-10','2026-05-17',NULL,23,46,3),(46,'2026-05-10','2026-05-17',NULL,24,47,3),(47,'2026-05-10','2026-05-17',NULL,25,48,3),(48,'2026-05-10','2026-05-17',NULL,11,49,3),(49,'2026-05-10','2026-05-17',NULL,12,50,3),(50,'2026-05-10','2026-05-17',NULL,13,51,3),(51,'2026-05-10','2026-05-17',NULL,14,52,3),(52,'2026-05-20','2026-05-27',NULL,32,53,3),(53,'2026-05-22','2026-05-29',NULL,33,54,3),(54,'2026-01-10','2026-01-17','2026-01-16',31,55,2),(55,'2026-02-01','2026-02-08','2026-02-07',31,56,2),(56,'2026-03-01','2026-03-08','2026-03-15',31,57,2),(57,'2026-06-10','2026-06-17',NULL,31,58,1),(58,'2026-05-25','2026-06-01','2026-05-30',34,62,2),(59,'2026-06-02','2026-06-09','2026-06-08',34,62,2),(60,'2026-05-20','2026-05-27','2026-05-25',34,63,2),(61,'2026-06-05','2026-06-12','2026-06-11',34,63,2),(62,'2026-05-22','2026-05-29','2026-05-28',34,65,2);
/*!40000 ALTER TABLE `Prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_actualizar_stock_insert` AFTER INSERT ON `Prestamo` FOR EACH ROW BEGIN
     DECLARE isbn_libro DECIMAL(13,0);
 
     SELECT IsbnLibro INTO isbn_libro 
     FROM Ejemplar 
     WHERE Numero = NEW.IdEjemplar 
     LIMIT 1;
 
     IF isbn_libro IS NOT NULL THEN
         UPDATE Libro 
         SET StockDisponible = StockDisponible - 1
         WHERE Isbn = isbn_libro;
     END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_audit_prestamo_insert` AFTER INSERT ON `Prestamo` FOR EACH ROW BEGIN
    INSERT INTO Auditoria_Prestamos (IdPrestamo, Accion, UsuarioBD, IdEstadoAnterior, IdEstadoNuevo)
    VALUES (NEW.Id, 'INSERT', USER(), NULL, NEW.IdEstadoPrestamo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_actualizar_stock_update` AFTER UPDATE ON `Prestamo` FOR EACH ROW BEGIN
    DECLARE tipo_estado_nuevo VARCHAR(20);
    DECLARE isbn_libro DECIMAL(13,0);

    SELECT Tipo INTO tipo_estado_nuevo 
    FROM EstadoPrestamo 
    WHERE Id = NEW.IdEstadoPrestamo 
    LIMIT 1;

    SELECT IsbnLibro INTO isbn_libro 
    FROM Ejemplar 
    WHERE Numero = NEW.IdEjemplar 
    LIMIT 1;

    IF tipo_estado_nuevo = 'DEVUELTO' AND OLD.FechaDevolucion IS NULL AND NEW.FechaDevolucion IS NOT NULL THEN
        UPDATE Libro 
        SET StockDisponible = StockDisponible + 1
        WHERE Isbn = isbn_libro;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_audit_prestamo_update` AFTER UPDATE ON `Prestamo` FOR EACH ROW BEGIN
    -- Solo registramos si hubo un cambio real en el estado o fechas para no saturar la tabla
    INSERT INTO Auditoria_Prestamos (IdPrestamo, Accion, UsuarioBD, IdEstadoAnterior, IdEstadoNuevo)
    VALUES (NEW.Id, 'UPDATE', USER(), OLD.IdEstadoPrestamo, NEW.IdEstadoPrestamo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_audit_prestamo_delete` AFTER DELETE ON `Prestamo` FOR EACH ROW BEGIN
    INSERT INTO Auditoria_Prestamos (IdPrestamo, Accion, UsuarioBD, IdEstadoAnterior, IdEstadoNuevo)
    VALUES (OLD.Id, 'DELETE', USER(), OLD.IdEstadoPrestamo, NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Sancion`
--

DROP TABLE IF EXISTS `Sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sancion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Motivo` text NOT NULL,
  `IdTipoSancion` int NOT NULL,
  `IdPrestamo` int DEFAULT NULL,
  `IdSocio` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdTipoSancion` (`IdTipoSancion`),
  KEY `IdPrestamo` (`IdPrestamo`),
  KEY `IdSocio` (`IdSocio`),
  CONSTRAINT `Sancion_ibfk_1` FOREIGN KEY (`IdTipoSancion`) REFERENCES `TipoSancion` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Sancion_ibfk_2` FOREIGN KEY (`IdPrestamo`) REFERENCES `Prestamo` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Sancion_ibfk_3` FOREIGN KEY (`IdSocio`) REFERENCES `Socio` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sancion_chk_1` CHECK ((`FechaFin` >= `FechaInicio`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sancion`
--

LOCK TABLES `Sancion` WRITE;
/*!40000 ALTER TABLE `Sancion` DISABLE KEYS */;
INSERT INTO `Sancion` VALUES (1,'2025-06-10','2025-07-10','Devolución con más de 15 días de retraso.',2,9,3),(2,'2026-06-17','2026-07-07','Sanción automática por mora moderada de 10 días.',2,40,26),(3,'2026-06-17','2026-07-17','Sanción grave por mora crítica superior a 15 días.',3,41,27),(4,'2026-06-14','2026-06-19','Retraso leve de 3 días en la devolución.',1,42,28),(5,'2026-05-18','2026-05-25','Retraso en devolución de ejemplar de Ciencia Ficción.',1,56,31),(6,'2026-05-26','2026-06-02','Segunda infracción reiterada por mora.',2,56,31),(7,'2026-06-03','2026-06-10','Tercera infracción acumulada dentro del periodo.',2,56,31),(8,'2026-06-12','2026-07-12','Suspensión crítica por acumulación de faltas.',3,56,31);
/*!40000 ALTER TABLE `Sancion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `trg_estado_socio` AFTER INSERT ON `Sancion` FOR EACH ROW BEGIN
    -- 1. Declaración de variables para almacenar los IDs y el contador
    DECLARE v_id_estado_suspendido INT;
    DECLARE v_id_estado_baja INT;
    DECLARE v_id_tipo_grave INT;
    DECLARE v_cantidad_graves INT DEFAULT 0;
    DECLARE v_nuevo_estado_socio INT;

    -- 2. Buscamos los IDs correspondientes en las tablas paramétricas
    SELECT Id INTO v_id_estado_suspendido FROM EstadoSocio WHERE Tipo = 'SUSPENDIDO' LIMIT 1;
    SELECT Id INTO v_id_estado_baja FROM EstadoSocio WHERE Tipo = 'BAJA' LIMIT 1;
    SELECT Id INTO v_id_tipo_grave FROM TipoSancion WHERE Tipo = 'GRAVE' LIMIT 1;

    -- 3. Contamos el total de sanciones GRAVES de este socio en particular
    -- (Como es un trigger AFTER INSERT, esta cuenta ya incluye la sanción recién agregada)
    SELECT COUNT(*) INTO v_cantidad_graves
    FROM Sancion
    WHERE IdSocio = NEW.IdSocio AND IdTipoSancion = v_id_tipo_grave;

    -- 4. Lógica de decisión según la nueva regla de negocio
    IF v_cantidad_graves > 3 THEN
        -- Si acumula más de 3 graves, su destino es la baja definitiva
        SET v_nuevo_estado_socio = v_id_estado_baja;
    ELSE
        -- Si tiene 3 o menos (o de otro tipo), se suspende normalmente
        SET v_nuevo_estado_socio = v_id_estado_suspendido;
    END IF;

    -- 5. Actualizamos el estado del socio en su tabla
    IF v_nuevo_estado_socio IS NOT NULL THEN
        UPDATE Socio 
        SET IdEstadoSocio = v_nuevo_estado_socio 
        WHERE Id = NEW.IdSocio;
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Sexo`
--

DROP TABLE IF EXISTS `Sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sexo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sexo`
--

LOCK TABLES `Sexo` WRITE;
/*!40000 ALTER TABLE `Sexo` DISABLE KEYS */;
INSERT INTO `Sexo` VALUES (1,'Femenino'),(2,'Masculino'),(3,'Otro');
/*!40000 ALTER TABLE `Sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socio`
--

DROP TABLE IF EXISTS `Socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Dni` int NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Mail` varchar(250) NOT NULL,
  `FechaAlta` date NOT NULL,
  `IdSexo` int NOT NULL,
  `IdEstadoSocio` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Dni` (`Dni`),
  UNIQUE KEY `Mail` (`Mail`),
  KEY `IdSexo` (`IdSexo`),
  KEY `IdEstadoSocio` (`IdEstadoSocio`),
  KEY `busqueda_dni` (`Dni`),
  KEY `busqueda_email` (`Mail`),
  CONSTRAINT `Socio_ibfk_1` FOREIGN KEY (`IdSexo`) REFERENCES `Sexo` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Socio_ibfk_2` FOREIGN KEY (`IdEstadoSocio`) REFERENCES `EstadoSocio` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socio`
--

LOCK TABLES `Socio` WRITE;
/*!40000 ALTER TABLE `Socio` DISABLE KEYS */;
INSERT INTO `Socio` VALUES (1,30123456,'María','Gómez','maria.g@mail.com','2025-01-15',1,1),(2,28765432,'Juan','Pérez','juan.p@mail.com','2025-03-10',2,1),(3,35987654,'Alex','Ríos','alex.r@mail.com','2025-06-22',3,2),(4,40111222,'Laura','Díaz','laura.d@mail.com','2025-08-05',1,1),(5,32555666,'Carlos','Ruiz','carlos.r@mail.com','2025-09-12',2,1),(6,40123456,'Ana','Martinez','ana.m@mail.com','2025-01-10',1,1),(7,40234567,'Pedro','Sanchez','pedro.s@mail.com','2025-02-15',2,1),(8,40345678,'Lucia','Fernandez','lucia.f@mail.com','2025-03-01',1,1),(9,40456789,'Miguel','Lopez','miguel.l@mail.com','2025-03-20',2,1),(10,40567890,'Sofia','Diaz','sofia.d@mail.com','2025-04-05',1,1),(11,40678901,'Javier','Garcia','javier.g@mail.com','2025-04-12',2,1),(12,40789012,'Elena','Perez','elena.p@mail.com','2025-05-01',1,1),(13,40890123,'Raul','Romero','raul.r@mail.com','2025-05-15',2,1),(14,40901234,'Carmen','Alvarez','carmen.a@mail.com','2025-06-10',1,1),(15,41012345,'Luis','Torres','luis.t@mail.com','2025-06-22',2,1),(16,41123456,'Teresa','Ruiz','teresa.r@mail.com','2025-07-01',1,1),(17,41234567,'Fernando','Jimenez','fernando.j@mail.com','2025-07-20',2,1),(18,41345678,'Isabel','Moreno','isabel.m@mail.com','2025-08-05',1,1),(19,41456789,'David','Muñoz','david.m@mail.com','2025-08-15',2,1),(20,41567890,'Cristina','Rivas','cristina.r@mail.com','2025-09-01',1,1),(21,41678901,'Antonio','Navarro','antonio.n@mail.com','2025-09-10',2,1),(22,41789012,'Laura','Herrero','laura.h@mail.com','2025-09-20',1,1),(23,41890123,'Diego','Dominguez','diego.d@mail.com','2025-10-01',2,1),(24,41901234,'Patricia','Gil','patricia.g@mail.com','2025-10-05',1,1),(25,42012345,'Sergio','Vazquez','sergio.v@mail.com','2025-10-10',2,1),(26,42123456,'Roberto','Sanz','roberto.s@mail.com','2025-01-05',2,1),(27,42234567,'Clara','Castro','clara.c@mail.com','2025-02-10',1,1),(28,42345678,'Victor','Ortega','victor.o@mail.com','2025-03-15',2,1),(29,42456789,'Nuria','Serrano','nuria.s@mail.com','2025-04-20',1,1),(30,42567890,'Adrian','Cortes','adrian.c@mail.com','2025-05-25',2,1),(31,43000111,'Carlos','Tevez','carlitos.tevez@mail.com','2026-01-15',2,1),(32,43000222,'Juan','Roman','riquelme@mail.com','2026-02-10',2,1),(33,43000333,'Martin','Palermo','titan@mail.com','2026-02-20',2,1),(34,43000444,'Diego','Maradona','dieguito@mail.com','2026-03-05',2,1);
/*!40000 ALTER TABLE `Socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoSancion`
--

DROP TABLE IF EXISTS `TipoSancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoSancion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoSancion`
--

LOCK TABLES `TipoSancion` WRITE;
/*!40000 ALTER TABLE `TipoSancion` DISABLE KEYS */;
INSERT INTO `TipoSancion` VALUES (1,'Leve'),(2,'Medio'),(3,'Grave');
/*!40000 ALTER TABLE `TipoSancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'TP_FINAL'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_generate_sancion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_generate_sancion"(
    IN p_id_socio INT, 
    IN p_tipo_sancion_id INT,
    IN p_dias_mora INT,
    IN p_id_prestamo INT
)
BEGIN
    DECLARE v_fecha_inicio DATE;
    DECLARE v_fecha_fin DATE;
    
    SET v_fecha_inicio = CURDATE();
    SET v_fecha_fin = DATE_ADD(v_fecha_inicio, INTERVAL p_dias_mora DAY);
    
    -- Insertamos la sanción vinculando el préstamo
    INSERT INTO Sancion (
        FechaInicio, 
        FechaFin, 
        Motivo, 
        IdTipoSancion, 
        IdPrestamo, 
        IdSocio
    ) 
    VALUES (
        v_fecha_inicio, 
        v_fecha_fin, 
        CONCAT('Sanción generada por ', p_dias_mora, ' días de mora.'), 
        p_tipo_sancion_id, 
        p_id_prestamo, 
        p_id_socio
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_registrar_prestamo"(
    IN p_id_socio INT,
    IN p_isbn_libro DECIMAL(13,0)

)
BEGIN
    DECLARE sanciones_activas INT;
    DECLARE prestamos_activos INT;
    DECLARE ejemplares_disponibles INT;
    DECLARE estado_ejemplar INT;
    DECLARE numero_ejemplar INT;
	DECLARE fecha_vencimiento DATE;
    
    SET fecha_vencimiento=date_add(curdate(),INTERVAL 7 day);
    
    IF (SELECT id FROM Socio WHERE id=p_id_socio) IS NULL THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El socio no existe';
    END IF;
    
    
    SELECT COUNT(*) INTO sanciones_activas
    FROM Sancion
    WHERE IdSocio = p_id_socio 
      AND FechaFin >= CURDATE();

    IF sanciones_activas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El socio posee una sanción activa y no puede retirar libros.';
    END IF;

    SELECT COUNT(*) INTO prestamos_activos
    FROM Prestamo
    WHERE IdSocio = p_id_socio 
      AND FechaDevolucion IS NULL;

    IF prestamos_activos >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El socio supera el limite de préstamo activos (3) y no puede retirar más.';
    END IF;

    SELECT StockDisponible INTO ejemplares_disponibles
    FROM Libro
    WHERE Isbn = p_isbn_libro; 
    
    IF ejemplares_disponibles IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Este libro no existe en la base de datos.';
    ELSEIF ejemplares_disponibles <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Este libro no tiene stock disponible actualmente.';
    END IF;
	
    SELECT Numero INTO numero_ejemplar
    FROM Ejemplar
    WHERE IsbnLibro = p_isbn_libro AND IdEstadoEjemplar =1 LIMIT 1;
    
    IF numero_ejemplar IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error: Este libro no tiene stock disponible actualmente.';
	END IF;

       
  

    -- 5. Ejecutar la acción: Registrar el préstamo, bajar stock y cambiar estado del ejemplar
    INSERT INTO Prestamo (FechaPrestamo, FechaVencimiento, FechaDevolucion, IdSocio, idEjemplar, idEstadoPrestamo)
    VALUES ( curdate(), fecha_vencimiento, NULL, p_id_socio, numero_ejemplar, 1);
    
   # UPDATE Libro
    #SET StockDisponible = StockDisponible - 1
    #WHERE Isbn = p_isbn_libro;

    UPDATE Ejemplar
    SET IdEstadoEjemplar = 2 -- Asumimos que ID 2 es "Prestado"
    WHERE IsbnLibro = p_isbn_libro 
      AND Numero = numero_ejemplar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_renovar_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="avnadmin"@"%" PROCEDURE "sp_renovar_prestamo"(IN p_id_prestamo INT)
BEGIN
    DECLARE v_sanciones_activas INT DEFAULT 0;
    DECLARE v_id_socio INT;
    SELECT IdSocio INTO v_id_socio
    FROM Prestamo
    WHERE Id = p_id_prestamo;
    IF v_id_socio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El préstamo indicado no existe en la base de datos.';
    ELSE
        SELECT COUNT(*) INTO v_sanciones_activas
        FROM Sancion
        WHERE IdSocio = v_id_socio AND FechaFin >= CURDATE();
        IF v_sanciones_activas > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: El socio posee sanciones activas. No es posible renovar el préstamo.';
        ELSE
            UPDATE Prestamo
            SET FechaVencimiento = DATE_ADD(FechaVencimiento, INTERVAL 7 DAY)
            WHERE Id = p_id_prestamo;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 14:41:38
