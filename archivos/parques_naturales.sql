-- MySQL Script generated by MySQL Workbench
-- Thu Nov 19 20:11:59 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parquesnaturalesdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parquesnaturalesdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parquesnaturalesdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `parquesnaturalesdb` ;

-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`decreto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`decreto` (
  `num_decreto` INT NOT NULL,
  `fecha_decreto` DATE NOT NULL,
  PRIMARY KEY (`num_decreto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`car` (
  `nit_CAR` BIGINT NOT NULL,
  `nombre_CAR` VARCHAR(45) NOT NULL,
  `ubicacion_CAR` VARCHAR(100) NOT NULL,
  `estado_CAR` TINYINT NOT NULL DEFAULT '1',
  `DECRETO_num_decreto` INT NOT NULL,
  PRIMARY KEY (`nit_CAR`),
  INDEX `fk_CAR_DECRETO1_idx` (`DECRETO_num_decreto` ASC) VISIBLE,
  CONSTRAINT `fk_CAR_DECRETO1`
    FOREIGN KEY (`DECRETO_num_decreto`)
    REFERENCES `parquesnaturalesdb`.`decreto` (`num_decreto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`especies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`especies` (
  `id_num_especies` INT NOT NULL,
  `num_especies_vegetales` INT NOT NULL DEFAULT '0',
  `num_especies_animales` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_num_especies`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`valor_ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`valor_ingreso` (
  `id_valor_ingreso` INT NOT NULL,
  `valor_adultos` INT NOT NULL,
  `valor_niños` INT NOT NULL,
  PRIMARY KEY (`id_valor_ingreso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`parque_natural`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`parque_natural` (
  `id_parque` INT NOT NULL AUTO_INCREMENT,
  `nombre_parque` VARCHAR(100) NOT NULL,
  `extension_parque` FLOAT NULL DEFAULT NULL,
  `altitud_parque` INT NULL DEFAULT NULL,
  `temperatura_parque` FLOAT NULL DEFAULT NULL,
  `estado_parque` TINYINT NOT NULL DEFAULT '1',
  `comunidades_indigenas` TINYINT NULL DEFAULT NULL,
  `ubicacion_parque` VARCHAR(100) NOT NULL,
  `abierto_publico` TINYINT NOT NULL DEFAULT '1',
  `servicio_auditorio` TINYINT NOT NULL DEFAULT '0',
  `CAR_id_CAR` BIGINT NOT NULL,
  `ESPECIES_id_num_especies` INT NOT NULL,
  `DECRETO_num_decreto` INT NOT NULL,
  `VALOR_INGRESO_id_valor_ingreso` INT NOT NULL,
  PRIMARY KEY (`id_parque`),
  INDEX `fk_PARQUE_NATURAL_CAR1_idx` (`CAR_id_CAR` ASC) VISIBLE,
  INDEX `fk_PARQUE_NATURAL_ESPECIES1_idx` (`ESPECIES_id_num_especies` ASC) VISIBLE,
  INDEX `fk_PARQUE_NATURAL_DECRETO1_idx` (`DECRETO_num_decreto` ASC) VISIBLE,
  INDEX `fk_PARQUE_NATURAL_VALOR_INGRESO1_idx` (`VALOR_INGRESO_id_valor_ingreso` ASC) VISIBLE,
  CONSTRAINT `fk_PARQUE_NATURAL_CAR1`
    FOREIGN KEY (`CAR_id_CAR`)
    REFERENCES `parquesnaturalesdb`.`car` (`nit_CAR`),
  CONSTRAINT `fk_PARQUE_NATURAL_DECRETO1`
    FOREIGN KEY (`DECRETO_num_decreto`)
    REFERENCES `parquesnaturalesdb`.`decreto` (`num_decreto`),
  CONSTRAINT `fk_PARQUE_NATURAL_ESPECIES1`
    FOREIGN KEY (`ESPECIES_id_num_especies`)
    REFERENCES `parquesnaturalesdb`.`especies` (`id_num_especies`),
  CONSTRAINT `fk_PARQUE_NATURAL_VALOR_INGRESO1`
    FOREIGN KEY (`VALOR_INGRESO_id_valor_ingreso`)
    REFERENCES `parquesnaturalesdb`.`valor_ingreso` (`id_valor_ingreso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`actividad_ecoturistica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`actividad_ecoturistica` (
  `id_actividad_ecoturistica` INT NOT NULL AUTO_INCREMENT,
  `nombre_actividad_ecoturistica` VARCHAR(45) NOT NULL,
  `estado_actividad_ecoturistica` TINYINT NOT NULL DEFAULT '1',
  `descripcion_actividad_ecoturistica` VARCHAR(256) NULL DEFAULT NULL,
  `PARQUE_NATURAL_id_parque` INT NOT NULL,
  PRIMARY KEY (`id_actividad_ecoturistica`),
  INDEX `fk_ACTIVIDAD_ECOTURISTICA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque` ASC) VISIBLE,
  CONSTRAINT `fk_ACTIVIDAD_ECOTURISTICA_PARQUE_NATURAL1`
    FOREIGN KEY (`PARQUE_NATURAL_id_parque`)
    REFERENCES `parquesnaturalesdb`.`parque_natural` (`id_parque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`actividad_ilicita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`actividad_ilicita` (
  `id_actividad_ilicita` INT NOT NULL,
  `asunto_actividad_ilicita` VARCHAR(45) NOT NULL,
  `descripcion_actividad_ilicita` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_actividad_ilicita` DATE NOT NULL,
  `PARQUE_NATURAL_id_parque` INT NOT NULL,
  PRIMARY KEY (`id_actividad_ilicita`),
  INDEX `fk_ACTIVIDAD_ILICITA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque` ASC) VISIBLE,
  CONSTRAINT `fk_ACTIVIDAD_ILICITA_PARQUE_NATURAL1`
    FOREIGN KEY (`PARQUE_NATURAL_id_parque`)
    REFERENCES `parquesnaturalesdb`.`parque_natural` (`id_parque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`cargo` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `nombre_cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`tipo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`tipo_servicio` (
  `id_tipo_servicio` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo_servicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`categoria_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`categoria_servicio` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(60) NOT NULL,
  `TIPO_SERVICIO_id_tipo_servicio` INT NOT NULL,
  PRIMARY KEY (`id_categoria`),
  INDEX `fk_CATEGORIA_SERVICIO_TIPO_SERVICIO1_idx` (`TIPO_SERVICIO_id_tipo_servicio` ASC) VISIBLE,
  CONSTRAINT `fk_CATEGORIA_SERVICIO_TIPO_SERVICIO1`
    FOREIGN KEY (`TIPO_SERVICIO_id_tipo_servicio`)
    REFERENCES `parquesnaturalesdb`.`tipo_servicio` (`id_tipo_servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `nombre_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`visitante` (
  `id_visitante` INT NOT NULL AUTO_INCREMENT,
  `fecha_nacimiento_visitante` DATE NOT NULL,
  `genero_visitante` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_visitante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`ingreso_visitantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`ingreso_visitantes` (
  `PARQUE_NATURAL_id_parque` INT NOT NULL,
  `VISITANTE_id_visitante` INT NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  PRIMARY KEY (`PARQUE_NATURAL_id_parque`, `VISITANTE_id_visitante`),
  INDEX `fk_PARQUE_NATURAL_has_VISITANTE_VISITANTE1_idx` (`VISITANTE_id_visitante` ASC) VISIBLE,
  INDEX `fk_PARQUE_NATURAL_has_VISITANTE_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque` ASC) VISIBLE,
  CONSTRAINT `fk_PARQUE_NATURAL_has_VISITANTE_PARQUE_NATURAL1`
    FOREIGN KEY (`PARQUE_NATURAL_id_parque`)
    REFERENCES `parquesnaturalesdb`.`parque_natural` (`id_parque`),
  CONSTRAINT `fk_PARQUE_NATURAL_has_VISITANTE_VISITANTE1`
    FOREIGN KEY (`VISITANTE_id_visitante`)
    REFERENCES `parquesnaturalesdb`.`visitante` (`id_visitante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`permissions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `guard_name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`model_has_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`model_has_permissions` (
  `permission_id` BIGINT UNSIGNED NOT NULL,
  `model_type` VARCHAR(255) NOT NULL,
  `model_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`),
  INDEX `model_has_permissions_model_id_model_type_index` (`model_id` ASC, `model_type` ASC) VISIBLE,
  CONSTRAINT `model_has_permissions_permission_id_foreign`
    FOREIGN KEY (`permission_id`)
    REFERENCES `parquesnaturalesdb`.`permissions` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`roles` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `guard_name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`model_has_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`model_has_roles` (
  `role_id` BIGINT UNSIGNED NOT NULL,
  `model_type` VARCHAR(255) NOT NULL,
  `model_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`),
  INDEX `model_has_roles_model_id_model_type_index` (`model_id` ASC, `model_type` ASC) VISIBLE,
  CONSTRAINT `model_has_roles_role_id_foreign`
    FOREIGN KEY (`role_id`)
    REFERENCES `parquesnaturalesdb`.`roles` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`persona` (
  `id_persona` BIGINT NOT NULL,
  `nombre_persona` VARCHAR(45) NOT NULL,
  `email_persona` VARCHAR(100) NULL DEFAULT NULL,
  `direccion_residencia` VARCHAR(60) NOT NULL,
  `telefono_fijo` INT NULL DEFAULT NULL,
  `telefono_movil` INT NOT NULL,
  `id_usuario` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_persona`),
  INDEX `fk_PERSONA_USUARIO_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_PERSONA_USUARIO`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `parquesnaturalesdb`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`tipo_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`tipo_personal` (
  `id_tipo_personal` INT NOT NULL AUTO_INCREMENT,
  `tipo_personal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_personal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`personal_parque_natural`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`personal_parque_natural` (
  `PARQUE_NATURAL_id_parque` INT NOT NULL,
  `TIPO_PERSONAL_id_tipo_personal` INT NOT NULL,
  `sueldo` INT NOT NULL,
  `CARGO_id_cargo` INT NOT NULL,
  `PERSONA_id_persona` BIGINT NOT NULL,
  PRIMARY KEY (`PARQUE_NATURAL_id_parque`),
  INDEX `fk_PARQUE_NATURAL_has_PERSONA_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque` ASC) VISIBLE,
  INDEX `fk_PERSONAL_PARQUE_NATURAL_TIPO_PERSONAL1_idx` (`TIPO_PERSONAL_id_tipo_personal` ASC) VISIBLE,
  INDEX `fk_PERSONAL_PARQUE_NATURAL_CARGO1_idx` (`CARGO_id_cargo` ASC) VISIBLE,
  INDEX `fk_PERSONAL_PARQUE_NATURAL_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_PARQUE_NATURAL_has_PERSONA_PARQUE_NATURAL1`
    FOREIGN KEY (`PARQUE_NATURAL_id_parque`)
    REFERENCES `parquesnaturalesdb`.`parque_natural` (`id_parque`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_CARGO1`
    FOREIGN KEY (`CARGO_id_cargo`)
    REFERENCES `parquesnaturalesdb`.`cargo` (`id_cargo`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `parquesnaturalesdb`.`persona` (`id_persona`),
  CONSTRAINT `fk_PERSONAL_PARQUE_NATURAL_TIPO_PERSONAL1`
    FOREIGN KEY (`TIPO_PERSONAL_id_tipo_personal`)
    REFERENCES `parquesnaturalesdb`.`tipo_personal` (`id_tipo_personal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`rol` (
  `id_rol` INT NOT NULL,
  `nombre_rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`role_has_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`role_has_permissions` (
  `permission_id` BIGINT UNSIGNED NOT NULL,
  `role_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`),
  INDEX `role_has_permissions_role_id_foreign` (`role_id` ASC) VISIBLE,
  CONSTRAINT `role_has_permissions_permission_id_foreign`
    FOREIGN KEY (`permission_id`)
    REFERENCES `parquesnaturalesdb`.`permissions` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign`
    FOREIGN KEY (`role_id`)
    REFERENCES `parquesnaturalesdb`.`roles` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`servicio_hospedaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`servicio_hospedaje` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(45) NOT NULL,
  `descripcion servicio` VARCHAR(45) NULL DEFAULT NULL,
  `estado_servicio` TINYINT NOT NULL DEFAULT '1',
  `capacidad` INT NOT NULL,
  `valor_servicio` INT NOT NULL,
  `PARQUE_NATURAL_id_parque` INT NOT NULL,
  `CATEGORIA_SERVICIO_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_servicio`),
  INDEX `fk_SERVICIO_ALOJAMIENTO_PARQUE_NATURAL1_idx` (`PARQUE_NATURAL_id_parque` ASC) VISIBLE,
  INDEX `fk_SERVICIO_ALOJAMIENTO_CATEGORIA_SERVICIO1_idx` (`CATEGORIA_SERVICIO_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_SERVICIO_ALOJAMIENTO_CATEGORIA_SERVICIO1`
    FOREIGN KEY (`CATEGORIA_SERVICIO_id_categoria`)
    REFERENCES `parquesnaturalesdb`.`categoria_servicio` (`id_categoria`),
  CONSTRAINT `fk_SERVICIO_ALOJAMIENTO_PARQUE_NATURAL1`
    FOREIGN KEY (`PARQUE_NATURAL_id_parque`)
    REFERENCES `parquesnaturalesdb`.`parque_natural` (`id_parque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`solicitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`solicitante` (
  `id_solicitante` BIGINT NOT NULL,
  `nombre solicitante` VARCHAR(100) NOT NULL,
  `email_solicitante` VARCHAR(100) NOT NULL,
  `fecha_nacimiento_solicitante` DATE NOT NULL,
  `genero_solicitante` VARCHAR(9) NOT NULL,
  `telefono_solicitante` BIGINT NOT NULL,
  PRIMARY KEY (`id_solicitante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`solicitud_reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`solicitud_reserva` (
  `id_solicitud` INT NOT NULL AUTO_INCREMENT,
  `SERVICIO_id_servicio` INT NOT NULL,
  `SOLICITANTE_id_solicitante` BIGINT NOT NULL,
  `numero_acompañantes` INT NULL DEFAULT NULL,
  `inicio_reserva` DATETIME NOT NULL,
  `fin_reserva` DATETIME NOT NULL,
  `adelanto_reserva` TINYINT NOT NULL DEFAULT '0',
  `ESTADO_id_estado` INT NOT NULL,
  INDEX `fk_SOLICITUD_RESERVA_SERVICIO1_idx` (`SERVICIO_id_servicio` ASC) VISIBLE,
  INDEX `fk_SOLICITUD_RESERVA_SOLICITANTE1_idx` (`SOLICITANTE_id_solicitante` ASC) VISIBLE,
  INDEX `fk_SOLICITUD_RESERVA_ESTADO1_idx` (`ESTADO_id_estado` ASC) VISIBLE,
  PRIMARY KEY (`id_solicitud`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_ESTADO1`
    FOREIGN KEY (`ESTADO_id_estado`)
    REFERENCES `parquesnaturalesdb`.`estado` (`id_estado`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_SERVICIO1`
    FOREIGN KEY (`SERVICIO_id_servicio`)
    REFERENCES `parquesnaturalesdb`.`servicio_hospedaje` (`id_servicio`),
  CONSTRAINT `fk_SOLICITUD_RESERVA_SOLICITANTE1`
    FOREIGN KEY (`SOLICITANTE_id_solicitante`)
    REFERENCES `parquesnaturalesdb`.`solicitante` (`id_solicitante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `parquesnaturalesdb`.`usuarios_car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parquesnaturalesdb`.`usuarios_car` (
  `id_usuario_car` INT NOT NULL AUTO_INCREMENT,
  `PERSONA_id_persona` BIGINT NOT NULL,
  `CAR_nit_CAR` BIGINT NOT NULL,
  PRIMARY KEY (`id_usuario_car`),
  INDEX `fk_USUARIOS_CAR_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  INDEX `fk_USUARIOS_CAR_CAR1_idx` (`CAR_nit_CAR` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIOS_CAR_CAR1`
    FOREIGN KEY (`CAR_nit_CAR`)
    REFERENCES `parquesnaturalesdb`.`car` (`nit_CAR`),
  CONSTRAINT `fk_USUARIOS_CAR_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `parquesnaturalesdb`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
