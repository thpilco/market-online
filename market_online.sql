drop database market_online;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema market_online
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema market_online
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `market_online` DEFAULT CHARACTER SET utf8 ;
USE `market_online` ;

-- -----------------------------------------------------
-- Table `market_online`.`juegos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `market_online`.`juegos` (
  `idjuego` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `clavejuego` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idjuego`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `market_online`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `market_online`.`usuarios` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `administrador` TINYINT(4) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `market_online`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `market_online`.`pedidos` (
  `idpedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idusuario` INT(11) NOT NULL,
  `preciototal` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idpedido`, `idusuario`),
  INDEX `fk_PEDIDOS_USUARIOS1_idx` (`idusuario` ASC),
  CONSTRAINT `fk_PEDIDOS_USUARIOS1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `market_online`.`usuarios` (`idusuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `market_online`.`registros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `market_online`.`registros` (
  `idjuego` INT(11) NOT NULL,
  `idpedido` INT(11) NOT NULL,
  `idusuario` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`idjuego`, `idpedido`, `idusuario`),
  INDEX `fk_juegos_has_pedidos_pedidos1_idx` (`idpedido` ASC, `idusuario` ASC),
  INDEX `fk_juegos_has_pedidos_juegos1_idx` (`idjuego` ASC),
  CONSTRAINT `fk_juegos_has_pedidos_juegos1`
    FOREIGN KEY (`idjuego`)
    REFERENCES `market_online`.`juegos` (`idjuego`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_juegos_has_pedidos_pedidos1`
    FOREIGN KEY (`idpedido` , `idusuario`)
    REFERENCES `market_online`.`pedidos` (`idpedido` , `idusuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
