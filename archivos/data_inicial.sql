-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: parquesnaturalesdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `actividad_ecoturistica`
--

DROP TABLE IF EXISTS `actividad_ecoturistica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_ecoturistica` (
  `id_actividad_ecoturistica` int NOT NULL AUTO_INCREMENT,
  `nombre_actividad_ecoturistica` varchar(45) NOT NULL,
  `estado_actividad_ecoturistica` tinyint NOT NULL DEFAULT '1',
  `descripcion_actividad_ecoturistica` varchar(256) DEFAULT NULL,
  `PARQUE_NATURAL_id_parque` int NOT NULL,
  PRIMARY KEY (`id_actividad_ecoturistica`),
  KEY `fk_ACTIVIDAD_ECOTURISTICA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque`),
  CONSTRAINT `fk_ACTIVIDAD_ECOTURISTICA_PARQUE_NATURAL1` FOREIGN KEY (`PARQUE_NATURAL_id_parque`) REFERENCES `parque_natural` (`id_parque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_ecoturistica`
--

LOCK TABLES `actividad_ecoturistica` WRITE;
/*!40000 ALTER TABLE `actividad_ecoturistica` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_ecoturistica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_ilicita`
--

DROP TABLE IF EXISTS `actividad_ilicita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_ilicita` (
  `id_actividad_ilicita` int NOT NULL AUTO_INCREMENT,
  `asunto_actividad_ilicita` varchar(45) NOT NULL,
  `descripcion_actividad_ilicita` varchar(45) DEFAULT NULL,
  `fecha_actividad_ilicita` date NOT NULL,
  `PARQUE_NATURAL_id_parque` int NOT NULL,
  PRIMARY KEY (`id_actividad_ilicita`),
  KEY `fk_ACTIVIDAD_ILICITA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque`),
  CONSTRAINT `fk_ACTIVIDAD_ILICITA_PARQUE_NATURAL1` FOREIGN KEY (`PARQUE_NATURAL_id_parque`) REFERENCES `parque_natural` (`id_parque`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_ilicita`
--

LOCK TABLES `actividad_ilicita` WRITE;
/*!40000 ALTER TABLE `actividad_ilicita` DISABLE KEYS */;
INSERT INTO `actividad_ilicita` VALUES (1,'prueba','prueba','2020-11-30',1);
/*!40000 ALTER TABLE `actividad_ilicita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `nit_CAR` bigint NOT NULL,
  `nombre_CAR` varchar(45) NOT NULL,
  `ubicacion_CAR` varchar(100) NOT NULL,
  `estado_CAR` tinyint NOT NULL DEFAULT '1',
  `DECRETO_num_decreto` int NOT NULL,
  PRIMARY KEY (`nit_CAR`),
  KEY `fk_CAR_DECRETO1_idx` (`DECRETO_num_decreto`),
  CONSTRAINT `fk_CAR_DECRETO1` FOREIGN KEY (`DECRETO_num_decreto`) REFERENCES `decreto` (`num_decreto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (145764852,'CAR Cundinamarca','Avenida Calle 24 (Esperanza) # 60 - 50, Centro Empresarial',1,1),(874574145,'CAR de Risaralda','Avenida de las Américas # 46-40, ip centrex  Pereira, Risalda',1,2),(941573684,'CAR del Alto Magdalena','a 60-53, Cra. 1 #60-1, Neiva, Huila',1,3);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Auxiliar de Gestion'),(2,'Auxiliar de Reservas'),(3,'Auxiliar de vigilancia');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_servicio`
--

DROP TABLE IF EXISTS `categoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicio` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(60) NOT NULL,
  `TIPO_SERVICIO_id_tipo_servicio` int NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_CATEGORIA_SERVICIO_TIPO_SERVICIO1_idx` (`TIPO_SERVICIO_id_tipo_servicio`),
  CONSTRAINT `fk_CATEGORIA_SERVICIO_TIPO_SERVICIO1` FOREIGN KEY (`TIPO_SERVICIO_id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicio`
--

LOCK TABLES `categoria_servicio` WRITE;
/*!40000 ALTER TABLE `categoria_servicio` DISABLE KEYS */;
INSERT INTO `categoria_servicio` VALUES (1,'Hotel',1),(2,'Camping',2);
/*!40000 ALTER TABLE `categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decreto`
--

DROP TABLE IF EXISTS `decreto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decreto` (
  `num_decreto` int NOT NULL,
  `fecha_decreto` date NOT NULL,
  PRIMARY KEY (`num_decreto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decreto`
--

LOCK TABLES `decreto` WRITE;
/*!40000 ALTER TABLE `decreto` DISABLE KEYS */;
INSERT INTO `decreto` VALUES (1,'2020-11-19'),(2,'2020-11-19'),(3,'2020-11-19'),(4,'2020-11-19'),(5,'2020-11-19'),(6,'2020-11-19'),(7,'2020-11-19'),(8,'2020-11-19'),(9,'2020-11-19');
/*!40000 ALTER TABLE `decreto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `id_num_especies` int NOT NULL,
  `num_especies_vegetales` int NOT NULL DEFAULT '0',
  `num_especies_animales` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_num_especies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,30,40),(2,40,30),(3,74,37),(4,20,19),(5,30,36),(6,14,10);
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'PENDIENTE DE AUTORIZACION'),(2,'PENDIENTE DE PAGO'),(3,'SOLICITUD CANCELADA'),(4,'RESERVA CANCELADA'),(5,'RESERVA CUMPLIDA');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_visitantes`
--

DROP TABLE IF EXISTS `ingreso_visitantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso_visitantes` (
  `PARQUE_NATURAL_id_parque` int NOT NULL,
  `VISITANTE_id_visitante` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`PARQUE_NATURAL_id_parque`,`VISITANTE_id_visitante`),
  KEY `fk_PARQUE_NATURAL_has_VISITANTE_VISITANTE1_idx` (`VISITANTE_id_visitante`),
  KEY `fk_PARQUE_NATURAL_has_VISITANTE_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque`),
  CONSTRAINT `fk_PARQUE_NATURAL_has_VISITANTE_PARQUE_NATURAL1` FOREIGN KEY (`PARQUE_NATURAL_id_parque`) REFERENCES `parque_natural` (`id_parque`),
  CONSTRAINT `fk_PARQUE_NATURAL_has_VISITANTE_VISITANTE1` FOREIGN KEY (`VISITANTE_id_visitante`) REFERENCES `visitante` (`id_visitante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_visitantes`
--

LOCK TABLES `ingreso_visitantes` WRITE;
/*!40000 ALTER TABLE `ingreso_visitantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_visitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(2,'App\\User',2),(2,'App\\User',3),(2,'App\\User',4),(4,'App\\User',5),(3,'App\\User',6),(4,'App\\User',7),(3,'App\\User',8),(3,'App\\User',9),(4,'App\\User',10),(3,'App\\User',11),(4,'App\\User',12),(3,'App\\User',13),(4,'App\\User',14),(3,'App\\User',15),(4,'App\\User',16),(5,'App\\User',17),(5,'App\\User',18),(5,'App\\User',19),(5,'App\\User',20),(5,'App\\User',21),(5,'App\\User',22);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parque_natural`
--

DROP TABLE IF EXISTS `parque_natural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parque_natural` (
  `id_parque` int NOT NULL AUTO_INCREMENT,
  `nombre_parque` varchar(100) NOT NULL,
  `extension_parque` float DEFAULT NULL,
  `altitud_parque` int DEFAULT NULL,
  `temperatura_parque` float DEFAULT NULL,
  `estado_parque` tinyint NOT NULL DEFAULT '1',
  `comunidades_indigenas` tinyint DEFAULT NULL,
  `ubicacion_parque` varchar(100) NOT NULL,
  `abierto_publico` tinyint NOT NULL DEFAULT '1',
  `servicio_auditorio` tinyint NOT NULL DEFAULT '0',
  `CAR_id_CAR` bigint NOT NULL,
  `ESPECIES_id_num_especies` int NOT NULL,
  `DECRETO_num_decreto` int NOT NULL,
  `VALOR_INGRESO_id_valor_ingreso` int NOT NULL,
  PRIMARY KEY (`id_parque`),
  KEY `fk_PARQUE_NATURAL_CAR1_idx` (`CAR_id_CAR`),
  KEY `fk_PARQUE_NATURAL_ESPECIES1_idx` (`ESPECIES_id_num_especies`),
  KEY `fk_PARQUE_NATURAL_DECRETO1_idx` (`DECRETO_num_decreto`),
  KEY `fk_PARQUE_NATURAL_VALOR_INGRESO1_idx` (`VALOR_INGRESO_id_valor_ingreso`),
  CONSTRAINT `fk_PARQUE_NATURAL_CAR1` FOREIGN KEY (`CAR_id_CAR`) REFERENCES `car` (`nit_CAR`),
  CONSTRAINT `fk_PARQUE_NATURAL_DECRETO1` FOREIGN KEY (`DECRETO_num_decreto`) REFERENCES `decreto` (`num_decreto`),
  CONSTRAINT `fk_PARQUE_NATURAL_ESPECIES1` FOREIGN KEY (`ESPECIES_id_num_especies`) REFERENCES `especies` (`id_num_especies`),
  CONSTRAINT `fk_PARQUE_NATURAL_VALOR_INGRESO1` FOREIGN KEY (`VALOR_INGRESO_id_valor_ingreso`) REFERENCES `valor_ingreso` (`id_valor_ingreso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parque_natural`
--

LOCK TABLES `parque_natural` WRITE;
/*!40000 ALTER TABLE `parque_natural` DISABLE KEYS */;
INSERT INTO `parque_natural` VALUES (1,'Chicaque',300,2000,16,1,0,'La Mesa - Mosquera',1,1,145764852,1,4,1),(2,'Chingaza',400,1000,18,1,0,'Municipios de Cundinamarca',0,1,145764852,2,5,2),(3,'Tayrona',200,1500,19,1,1,'Santa Marta',1,1,874574145,3,6,3),(4,'Sierra Nevada',100,600,21,1,1,'Santa Marta',0,1,874574145,4,7,4),(5,'Tatama',500,1400,26,1,0,'Pueblo Rico Risaralda',1,1,941573684,5,8,5),(6,'Ucumari',450,3000,24,1,1,'Pereira Risaralda',0,1,941573684,6,9,6);
/*!40000 ALTER TABLE `parque_natural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'gestionar CARs','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(2,'gestionar Parques','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(3,'registrar visitantes','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(4,'autorizar reservas','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(5,'registrar actividad','web','2020-11-20 06:23:25','2020-11-20 06:23:25');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` bigint NOT NULL,
  `nombre_persona` varchar(45) NOT NULL,
  `email_persona` varchar(100) DEFAULT NULL,
  `direccion_residencia` varchar(60) NOT NULL,
  `telefono_fijo` int DEFAULT NULL,
  `telefono_movil` int NOT NULL,
  `id_usuario` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_PERSONA_USUARIO_idx` (`id_usuario`),
  CONSTRAINT `fk_PERSONA_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (12312,'Gustavo Martinez','gustavo@email.com','NA',123234434,319000004,15),(23424,'Carlos Martinez','gustavo@email.com','NA',234234,319000004,14),(235345,'Camila Martinez','gustavo@email.com','NA',64654,313000004,6),(546546,'Alfredo Martinez','gustavo@email.com','NA',444434,319000004,13),(1024588,'Gustavo Perez','gustavo@email.com','NA',4564464,319004004,2),(2342342,'Gustavo Rodriguez','gustavo@email.com','NA',456423464,319000004,12),(2354656,'Gustavo Suarez','gustavo@email.com','NA',234234,319000004,8),(4567976,'Pablo GUzman','gustavo@email.com','NA',0,319000004,18),(6575767,'Carlos Guzman','gustavo@email.com','NA',0,319000004,17),(6775555,'Sonia Castro','gustavo@email.com','NA',0,319000004,19),(23424234,'Gustavo Meneses','gustavo@email.com','NA',456464,319000004,4),(34534546,'Gustavo Pinto','gustavo@email.com','NA',456234464,319000004,10),(44567987,'Pablo Cstro','gustavo@email.com','NA',0,319000004,21),(45465465,'Gustavo Sanchez','gustavo@email.com','NA',4564564,319000004,5),(45667867,'Camila Sanchez','gustavo@email.com','NA',0,319000004,22),(55454345,'Camilo Martinez','gustavo@email.com','NA',45654,319000004,7),(56546346,'Sandra Martinez','gustavo@email.com','NA',3423,319000667,11),(98975656,'Fidel Bermudes','gustavo@email.com','NA',0,319000004,20),(102458738,'Alfredo Martinez','gustavo@email.com','NA',456464,319000000,3),(234234235,'Rodrigo Martinez','gustavo@email.com','NA',554645,319000005,9),(1024583278,'Martin Martinez','gustavo@email.com','NA',456464,319000004,1),(14234234234,'Wilson Martinez','gustavo@email.com','NA',434,319000004,16);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_parque_natural`
--

DROP TABLE IF EXISTS `personal_parque_natural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_parque_natural` (
  `PARQUE_NATURAL_id_parque` int NOT NULL,
  `TIPO_PERSONAL_id_tipo_personal` int NOT NULL,
  `sueldo` int NOT NULL,
  `CARGO_id_cargo` int NOT NULL,
  `PERSONA_id_persona` bigint NOT NULL,
  PRIMARY KEY (`PARQUE_NATURAL_id_parque`,`PERSONA_id_persona`,`TIPO_PERSONAL_id_tipo_personal`,`CARGO_id_cargo`),
  KEY `fk_PARQUE_NATURAL_has_PERSONA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque`),
  KEY `fk_PERSONAL_PARQUE_NATURAL_TIPO_PERSONAL1_idx` (`TIPO_PERSONAL_id_tipo_personal`),
  KEY `fk_PERSONAL_PARQUE_NATURAL_CARGO1_idx` (`CARGO_id_cargo`),
  KEY `fk_PERSONAL_PARQUE_NATURAL_PERSONA1_idx` (`PERSONA_id_persona`),
  CONSTRAINT `fk_PARQUE_NATURAL_has_PERSONA_PARQUE_NATURAL1` FOREIGN KEY (`PARQUE_NATURAL_id_parque`) REFERENCES `parque_natural` (`id_parque`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_CARGO1` FOREIGN KEY (`CARGO_id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_PERSONA1` FOREIGN KEY (`PERSONA_id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_TIPO_PERSONAL1` FOREIGN KEY (`TIPO_PERSONAL_id_tipo_personal`) REFERENCES `tipo_personal` (`id_tipo_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_parque_natural`
--

LOCK TABLES `personal_parque_natural` WRITE;
/*!40000 ALTER TABLE `personal_parque_natural` DISABLE KEYS */;
INSERT INTO `personal_parque_natural` VALUES (1,1,900000,1,235345),(1,3,900000,3,6575767),(1,2,900000,2,45465465),(2,1,900000,1,2354656),(2,3,900000,3,4567976),(2,2,900000,2,55454345),(3,3,900000,3,6775555),(3,2,900000,2,34534546),(3,1,900000,1,234234235),(4,2,900000,2,2342342),(4,1,900000,1,56546346),(4,3,900000,3,98975656),(5,2,900000,2,23424),(5,1,900000,1,546546),(5,3,900000,3,44567987),(6,1,900000,1,12312),(6,3,900000,3,45667867),(6,2,900000,2,14234234234);
/*!40000 ALTER TABLE `personal_parque_natural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ministerio','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(2,'CAR','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(3,'PersonalGestion','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(4,'PersonalReserva','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(5,'Vigilancia','web','2020-11-20 06:23:25','2020-11-20 06:23:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_hospedaje`
--

DROP TABLE IF EXISTS `servicio_hospedaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_hospedaje` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(45) NOT NULL,
  `descripcion servicio` varchar(45) DEFAULT NULL,
  `estado_servicio` tinyint NOT NULL DEFAULT '1',
  `capacidad` int NOT NULL,
  `valor_servicio` int NOT NULL,
  `PARQUE_NATURAL_id_parque` int NOT NULL,
  `CATEGORIA_SERVICIO_id_categoria` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_SERVICIO_ALOJAMIENTO_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque`),
  KEY `fk_SERVICIO_ALOJAMIENTO_CATEGORIA_SERVICIO1_idx` (`CATEGORIA_SERVICIO_id_categoria`),
  CONSTRAINT `fk_SERVICIO_ALOJAMIENTO_CATEGORIA_SERVICIO1` FOREIGN KEY (`CATEGORIA_SERVICIO_id_categoria`) REFERENCES `categoria_servicio` (`id_categoria`),
  CONSTRAINT `fk_SERVICIO_ALOJAMIENTO_PARQUE_NATURAL1` FOREIGN KEY (`PARQUE_NATURAL_id_parque`) REFERENCES `parque_natural` (`id_parque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_hospedaje`
--

LOCK TABLES `servicio_hospedaje` WRITE;
/*!40000 ALTER TABLE `servicio_hospedaje` DISABLE KEYS */;
INSERT INTO `servicio_hospedaje` VALUES (1,'Hotel Resort','Servicio de hotel resort',1,30,80000,1,1),(2,'Hotel 5 Estrellas','Servicio de hotel 5 estrellas',1,50,100000,3,1),(3,'Hotel Ecológico','Servicio de hotel ecológico',1,40,70000,5,1),(4,'Camping Libre','Servicio de camping',1,30,20000,3,2),(5,'Camping','Servicio de camping',1,40,24000,3,2),(6,'Camping simple','Servicio de camping simple',1,10,10000,5,2);
/*!40000 ALTER TABLE `servicio_hospedaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitante` (
  `id_solicitante` bigint NOT NULL,
  `nombre_solicitante` varchar(100) NOT NULL,
  `email_solicitante` varchar(100) NOT NULL,
  `fecha_nacimiento_solicitante` date NOT NULL,
  `genero_solicitante` varchar(9) NOT NULL,
  `telefono_solicitante` bigint NOT NULL,
  PRIMARY KEY (`id_solicitante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
INSERT INTO `solicitante` VALUES (1023934606,'Juan Nicolás Marroquín Alfaro','jnicolas.marro@gmail.com','1994-07-20','Masculino',3192522839);
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_reserva`
--

DROP TABLE IF EXISTS `solicitud_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_reserva` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `SERVICIO_id_servicio` int NOT NULL,
  `SOLICITANTE_id_solicitante` bigint NOT NULL,
  `numero_acompañantes` int DEFAULT NULL,
  `inicio_reserva` datetime NOT NULL,
  `fin_reserva` datetime NOT NULL,
  `adelanto_reserva` tinyint NOT NULL DEFAULT '0',
  `ESTADO_id_estado` int NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_SOLICITUD_RESERVA_SERVICIO1_idx` (`SERVICIO_id_servicio`),
  KEY `fk_SOLICITUD_RESERVA_SOLICITANTE1_idx` (`SOLICITANTE_id_solicitante`),
  KEY `fk_SOLICITUD_RESERVA_ESTADO1_idx` (`ESTADO_id_estado`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_ESTADO1` FOREIGN KEY (`ESTADO_id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_SERVICIO1` FOREIGN KEY (`SERVICIO_id_servicio`) REFERENCES `servicio_hospedaje` (`id_servicio`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_SOLICITANTE1` FOREIGN KEY (`SOLICITANTE_id_solicitante`) REFERENCES `solicitante` (`id_solicitante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_reserva`
--

LOCK TABLES `solicitud_reserva` WRITE;
/*!40000 ALTER TABLE `solicitud_reserva` DISABLE KEYS */;
INSERT INTO `solicitud_reserva` VALUES (10,2,1023934606,4,'2020-11-19 22:12:00','2020-11-27 22:14:00',0,1);
/*!40000 ALTER TABLE `solicitud_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_personal`
--

DROP TABLE IF EXISTS `tipo_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_personal` (
  `id_tipo_personal` int NOT NULL AUTO_INCREMENT,
  `tipo_personal` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_personal`
--

LOCK TABLES `tipo_personal` WRITE;
/*!40000 ALTER TABLE `tipo_personal` DISABLE KEYS */;
INSERT INTO `tipo_personal` VALUES (1,'Gestión'),(2,'Reservas'),(3,'Vigilancia');
/*!40000 ALTER TABLE `tipo_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_servicio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Hotel - Habitaciones'),(2,'Camping - Aire Libre');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin Ministerio Ambiente','adminministerio@minambiente.gov.co',NULL,'$2y$10$7J7uqzpxKelGrQmRA0p4AuHkU9S0jqewZmQEp6z696SW4Q/uJJYla',NULL,'2020-11-20 06:29:24','2020-11-20 06:29:24'),(2,'Admin CAR Cundinamarca','carcundinamarca@carcundinamarca.gov.co',NULL,'$2y$10$4Z99mL12ztmlHdRLwRqspeLTEm.yAzXslhSTJSMn6Jysrqot8CXGu',NULL,'2020-11-20 06:31:58','2020-11-20 06:31:58'),(3,'Admin CAR Alto Magdalena','carmagdalena@carmagdalena.gov.co',NULL,'$2y$10$xrc8E.w9.Mf/kDrxfjoMK.upttiE0pykdgLimxSiWE5ddHWh9XrL6',NULL,'2020-11-20 06:33:41','2020-11-20 06:33:41'),(4,'Admin CAR Risaralda','carrisaralda@carrisaralda.gov.co',NULL,'$2y$10$j2xoHJWMIhq.1sny08dAuuxHEPN65qxN4YOFVGna1ASZtggk0qCT.',NULL,'2020-11-20 06:35:05','2020-11-20 06:35:05'),(5,'Reservas Chicaque','reservaschicaque@reservaschicaque.gov.co',NULL,'$2y$10$DMKVVMkn9zk1V59ousDDvuSKhydI0LbTYB.MGvkQajYB8Lqfhvyt2',NULL,'2020-11-20 06:38:15','2020-11-20 06:38:15'),(6,'Gestion Chicaque','gestionchicaque@gestionchicaque.gov.co',NULL,'$2y$10$LlKn.D6OE5v18rwkcjruZeBdWejfOa5XBduzHXeRujw5PzopNL7yq',NULL,'2020-11-20 06:39:04','2020-11-20 06:39:04'),(7,'Reservas Chingaza','reservaschingaza@reservaschingaza.gov.co',NULL,'$2y$10$MWsfvJa5sE17c/uFSv0zu.g9rzMA5hNGaqVrq594lzq2QkZQQFnya',NULL,'2020-11-20 06:40:14','2020-11-20 06:40:14'),(8,'Gestion Chingaza','gestionchingaza@gestionchingaza.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(9,'Gestion Tayrona','gestiontayrona@gestiontayrona.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(10,'Reservas Tayrona','reservastayrona@reservastayrona.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(11,'Gestion Sierra Nevada','gestionsierranevada@gestionsierranevada.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(12,'Reservas Sierra Nevada','reservassierranevada@reservassierranevada.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(13,'Gestion Tatama','gestiontatama@gestiontatama.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(14,'Reservas Tatama','reservastatama@reservastatama.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(15,'Gestion Ucumari','gestionucumari@gestionucumari.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(16,'Reservas Ucumari','reservasucumari@reservasucumari.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(17,'Vigilancia Chicaque','vigilanciachicaque@vigilanciachicaque.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(18,'Vigilancia Chingaza','vigilanciachingaza@vigilanciachingaza.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(19,'Vigilancia Tayrona','vigilanciatayrona@vigilanciatayrona.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(20,'Vigilancia Sierra Nevada','vigilanciasierranevada@vigilanciasierranevada.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(21,'Vigilancia Tatama','vigilanciatatama@vigilanciatatama.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(22,'Vigilancia Ucumari','vigilanciaucumari@vigilanciaucumari.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_car`
--

DROP TABLE IF EXISTS `usuarios_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_car` (
  `id_usuario_car` int NOT NULL AUTO_INCREMENT,
  `PERSONA_id_persona` bigint NOT NULL,
  `CAR_nit_CAR` bigint NOT NULL,
  PRIMARY KEY (`id_usuario_car`),
  KEY `fk_USUARIOS_CAR_PERSONA1_idx` (`PERSONA_id_persona`),
  KEY `fk_USUARIOS_CAR_CAR1_idx` (`CAR_nit_CAR`),
  CONSTRAINT `fk_USUARIOS_CAR_CAR1` FOREIGN KEY (`CAR_nit_CAR`) REFERENCES `car` (`nit_CAR`),
  CONSTRAINT `fk_USUARIOS_CAR_PERSONA1` FOREIGN KEY (`PERSONA_id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_car`
--

LOCK TABLES `usuarios_car` WRITE;
/*!40000 ALTER TABLE `usuarios_car` DISABLE KEYS */;
INSERT INTO `usuarios_car` VALUES (1,1024588,145764852),(2,102458738,874574145),(3,23424234,941573684);
/*!40000 ALTER TABLE `usuarios_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor_ingreso`
--

DROP TABLE IF EXISTS `valor_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor_ingreso` (
  `id_valor_ingreso` int NOT NULL,
  `valor_adultos` int NOT NULL,
  `valor_niños` int NOT NULL,
  PRIMARY KEY (`id_valor_ingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor_ingreso`
--

LOCK TABLES `valor_ingreso` WRITE;
/*!40000 ALTER TABLE `valor_ingreso` DISABLE KEYS */;
INSERT INTO `valor_ingreso` VALUES (1,15000,10000),(2,20000,11000),(3,30000,5000),(4,30000,9000),(5,16000,14000),(6,18000,13000);
/*!40000 ALTER TABLE `valor_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitante`
--

DROP TABLE IF EXISTS `visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitante` (
  `id_visitante` int NOT NULL AUTO_INCREMENT,
  `fecha_nacimiento_visitante` date NOT NULL,
  `genero_visitante` varchar(9) NOT NULL,
  PRIMARY KEY (`id_visitante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitante`
--

LOCK TABLES `visitante` WRITE;
/*!40000 ALTER TABLE `visitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-30 16:13:09
