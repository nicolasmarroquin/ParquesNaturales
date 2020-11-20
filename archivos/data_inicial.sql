-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: parquesnaturalesdb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Dumping data for table `actividad_ecoturistica`
--

LOCK TABLES `actividad_ecoturistica` WRITE;
/*!40000 ALTER TABLE `actividad_ecoturistica` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_ecoturistica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `actividad_ilicita`
--

LOCK TABLES `actividad_ilicita` WRITE;
/*!40000 ALTER TABLE `actividad_ilicita` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_ilicita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (145764852,'CAR Cundinamarca','Avenida Calle 24 (Esperanza) # 60 - 50, Centro Empresarial',1,1),(874574145,'CAR de Risaralda','Avenida de las Américas # 46-40, ip centrex  Pereira, Risalda',1,2),(941573684,'CAR del Alto Magdalena','a 60-53, Cra. 1 #60-1, Neiva, Huila',1,3);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Auxiliar de Gestion'),(2,'Auxiliar de Reservas');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria_servicio`
--

LOCK TABLES `categoria_servicio` WRITE;
/*!40000 ALTER TABLE `categoria_servicio` DISABLE KEYS */;
INSERT INTO `categoria_servicio` VALUES (1,'Hotel',1),(2,'Camping',2);
/*!40000 ALTER TABLE `categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `decreto`
--

LOCK TABLES `decreto` WRITE;
/*!40000 ALTER TABLE `decreto` DISABLE KEYS */;
INSERT INTO `decreto` VALUES (1,'2020-11-19'),(2,'2020-11-19'),(3,'2020-11-19'),(4,'2020-11-19'),(5,'2020-11-19'),(6,'2020-11-19'),(7,'2020-11-19'),(8,'2020-11-19'),(9,'2020-11-19');
/*!40000 ALTER TABLE `decreto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,30,40),(2,40,30),(3,74,37),(4,20,19),(5,30,36),(6,14,10);
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'PENDIENTE DE AUTORIZACION'),(2,'PENDIENTE DE PAGO'),(3,'SOLICITUD CANCELADA'),(4,'RESERVA CANCELADA'),(5,'RESERVA CUMPLIDA');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingreso_visitantes`
--

LOCK TABLES `ingreso_visitantes` WRITE;
/*!40000 ALTER TABLE `ingreso_visitantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_visitantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(2,'App\\User',2),(2,'App\\User',3),(2,'App\\User',4),(4,'App\\User',5),(3,'App\\User',6),(4,'App\\User',7),(3,'App\\User',8),(3,'App\\User',9),(4,'App\\User',10),(3,'App\\User',11),(4,'App\\User',12),(3,'App\\User',13),(4,'App\\User',14),(3,'App\\User',15),(4,'App\\User',16);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parque_natural`
--

LOCK TABLES `parque_natural` WRITE;
/*!40000 ALTER TABLE `parque_natural` DISABLE KEYS */;
INSERT INTO `parque_natural` VALUES (1,'Chicaque',300,2000,16,1,0,'La Mesa - Mosquera',1,1,145764852,1,4,1),(2,'Chingaza',400,1000,18,1,0,'Municipios de Cundinamarca',0,1,145764852,2,5,2),(3,'Tayrona',200,1500,19,1,1,'Santa Marta',1,1,874574145,3,6,3),(4,'Sierra Nevada',100,600,21,1,1,'Santa Marta',0,1,874574145,4,7,4),(5,'Tatama',500,1400,26,1,0,'Pueblo Rico Risaralda',1,1,941573684,5,8,5),(6,'Ucumari',450,3000,24,1,1,'Pereira Risaralda',0,1,941573684,6,9,6);
/*!40000 ALTER TABLE `parque_natural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'gestionar CARs','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(2,'gestionar Parques','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(3,'registrar visitantes','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(4,'autorizar reservas','web','2020-11-20 06:23:25','2020-11-20 06:23:25');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (12312,'Gustavo Martinez','gustavo@email.com','NA',123234434,319000004,15),(23424,'Carlos Martinez','gustavo@email.com','NA',234234,319000004,14),(235345,'Camila Martinez','gustavo@email.com','NA',64654,313000004,6),(546546,'Alfredo Martinez','gustavo@email.com','NA',444434,319000004,13),(1024588,'Gustavo Perez','gustavo@email.com','NA',4564464,319004004,2),(2342342,'Gustavo Rodriguez','gustavo@email.com','NA',456423464,319000004,12),(2354656,'Gustavo Suarez','gustavo@email.com','NA',234234,319000004,8),(23424234,'Gustavo Meneses','gustavo@email.com','NA',456464,319000004,4),(34534546,'Gustavo Pinto','gustavo@email.com','NA',456234464,319000004,10),(45465465,'Gustavo Sanchez','gustavo@email.com','NA',4564564,319000004,5),(55454345,'Camilo Martinez','gustavo@email.com','NA',45654,319000004,7),(56546346,'Sandra Martinez','gustavo@email.com','NA',3423,319000667,11),(102458738,'Alfredo Martinez','gustavo@email.com','NA',456464,319000000,3),(234234235,'Rodrigo Martinez','gustavo@email.com','NA',554645,319000005,9),(1024583278,'Martin Martinez','gustavo@email.com','NA',456464,319000004,1),(14234234234,'Wilson Martinez','gustavo@email.com','NA',434,319000004,16);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_parque_natural`
--

LOCK TABLES `personal_parque_natural` WRITE;
/*!40000 ALTER TABLE `personal_parque_natural` DISABLE KEYS */;
INSERT INTO `personal_parque_natural` VALUES (1,2,900000,2,45465465),(1,1,900000,1,235345),(2,2,900000,2,55454345),(2,1,900000,1,2354656),(3,1,900000,1,234234235),(3,2,900000,2,34534546),(4,1,900000,1,56546346),(4,2,900000,2,2342342),(5,1,900000,1,546546),(5,2,900000,2,23424),(6,1,900000,1,12312),(6,2,900000,2,14234234234);
/*!40000 ALTER TABLE `personal_parque_natural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ministerio','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(2,'CAR','web','2020-11-20 06:23:24','2020-11-20 06:23:24'),(3,'PersonalGestion','web','2020-11-20 06:23:25','2020-11-20 06:23:25'),(4,'PersonalReserva','web','2020-11-20 06:23:25','2020-11-20 06:23:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio_hospedaje`
--

LOCK TABLES `servicio_hospedaje` WRITE;
/*!40000 ALTER TABLE `servicio_hospedaje` DISABLE KEYS */;
INSERT INTO `servicio_hospedaje` VALUES (1,'Hotel Resort','Servicio de hotel resort',1,30,80000,1,1),(2,'Hotel 5 Estrellas','Servicio de hotel 5 estrellas',1,50,100000,3,1),(3,'Hotel Ecológico','Servicio de hotel ecológico',1,40,70000,5,1),(4,'Camping Libre','Servicio de camping',1,30,20000,3,2),(5,'Camping','Servicio de camping',1,40,24000,3,2),(6,'Camping simple','Servicio de camping simple',1,10,10000,5,2);
/*!40000 ALTER TABLE `servicio_hospedaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
INSERT INTO `solicitante` VALUES (1023934606,'Juan Nicolás Marroquín Alfaro','jnicolas.marro@gmail.com','1994-07-20','Masculino',3192522839);
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `solicitud_reserva`
--

LOCK TABLES `solicitud_reserva` WRITE;
/*!40000 ALTER TABLE `solicitud_reserva` DISABLE KEYS */;
INSERT INTO `solicitud_reserva` VALUES (1,2,1023934606,4,'2020-11-19 22:12:00','2020-11-27 22:14:00',0,1);
/*!40000 ALTER TABLE `solicitud_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_personal`
--

LOCK TABLES `tipo_personal` WRITE;
/*!40000 ALTER TABLE `tipo_personal` DISABLE KEYS */;
INSERT INTO `tipo_personal` VALUES (1,'Gestión'),(2,'Reservas');
/*!40000 ALTER TABLE `tipo_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Hotel - Habitaciones'),(2,'Camping - Aire Libre');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin Ministerio Ambiente','adminministerio@minambiente.gov.co',NULL,'$2y$10$7J7uqzpxKelGrQmRA0p4AuHkU9S0jqewZmQEp6z696SW4Q/uJJYla',NULL,'2020-11-20 06:29:24','2020-11-20 06:29:24'),(2,'Admin CAR Cundinamarca','carcundinamarca@carcundinamarca.gov.co',NULL,'$2y$10$4Z99mL12ztmlHdRLwRqspeLTEm.yAzXslhSTJSMn6Jysrqot8CXGu',NULL,'2020-11-20 06:31:58','2020-11-20 06:31:58'),(3,'Admin CAR Alto Magdalena','carmagdalena@carmagdalena.gov.co',NULL,'$2y$10$xrc8E.w9.Mf/kDrxfjoMK.upttiE0pykdgLimxSiWE5ddHWh9XrL6',NULL,'2020-11-20 06:33:41','2020-11-20 06:33:41'),(4,'Admin CAR Risaralda','carrisaralda@carrisaralda.gov.co',NULL,'$2y$10$j2xoHJWMIhq.1sny08dAuuxHEPN65qxN4YOFVGna1ASZtggk0qCT.',NULL,'2020-11-20 06:35:05','2020-11-20 06:35:05'),(5,'Reservas Chicaque','reservaschicaque@reservaschicaque.gov.co',NULL,'$2y$10$DMKVVMkn9zk1V59ousDDvuSKhydI0LbTYB.MGvkQajYB8Lqfhvyt2',NULL,'2020-11-20 06:38:15','2020-11-20 06:38:15'),(6,'Gestion Chicaque','gestionchicaque@gestionchicaque.gov.co',NULL,'$2y$10$LlKn.D6OE5v18rwkcjruZeBdWejfOa5XBduzHXeRujw5PzopNL7yq',NULL,'2020-11-20 06:39:04','2020-11-20 06:39:04'),(7,'Reservas Chingaza','reservaschingaza@reservaschingaza.gov.co',NULL,'$2y$10$MWsfvJa5sE17c/uFSv0zu.g9rzMA5hNGaqVrq594lzq2QkZQQFnya',NULL,'2020-11-20 06:40:14','2020-11-20 06:40:14'),(8,'Gestion Chingaza','gestionchingaza@gestionchingaza.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(9,'Gestion Tayrona','gestiontayrona@gestiontayrona.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(10,'Reservas Tayrona','reservastayrona@reservastayrona.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(11,'Gestion Sierra Nevada','gestionsierranevada@gestionsierranevada.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(12,'Reservas Sierra Nevada','reservassierranevada@reservassierranevada.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(13,'Gestion Tatama','gestiontatama@gestiontatama.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(14,'Reservas Tatama','reservastatama@reservastatama.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(15,'Gestion Ucumari','gestionucumari@gestionucumari.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59'),(16,'Reservas Ucumari','reservasucumari@reservasucumari.gov.co',NULL,'$2y$10$8R4ZZvC95WhImmQVMxYuQuAaT6vp01If0y5TJXkwhIH6RaxdaaVEi',NULL,'2020-11-20 06:40:59','2020-11-20 06:40:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios_car`
--

LOCK TABLES `usuarios_car` WRITE;
/*!40000 ALTER TABLE `usuarios_car` DISABLE KEYS */;
INSERT INTO `usuarios_car` VALUES (1,1024588,145764852),(2,102458738,874574145),(3,23424234,941573684);
/*!40000 ALTER TABLE `usuarios_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `valor_ingreso`
--

LOCK TABLES `valor_ingreso` WRITE;
/*!40000 ALTER TABLE `valor_ingreso` DISABLE KEYS */;
INSERT INTO `valor_ingreso` VALUES (1,15000,10000),(2,20000,11000),(3,30000,5000),(4,30000,9000),(5,16000,14000),(6,18000,13000);
/*!40000 ALTER TABLE `valor_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2020-11-19 22:23:51
