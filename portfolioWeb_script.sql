-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolioWeb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolioWeb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolioWeb` DEFAULT CHARACTER SET utf8 ;
USE `portfolioWeb` ;

-- -----------------------------------------------------
-- Table `portfolioWeb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`usuario` (
  `idusuario` INT NOT NULL,
  `admin` TINYINT NULL,
  `password` VARCHAR(45) NULL,
  `login` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`persona` (
  `idpersona` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `url_foto` VARCHAR(100) NULL,
  `acerca_de` VARCHAR(200) NULL,
  `usuario_idusuario` INT NOT NULL,
  `url_banner` VARCHAR(100) NULL,
  PRIMARY KEY (`idpersona`, `usuario_idusuario`),
  INDEX `fk_persona_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_persona_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `portfolioWeb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`experiencia` (
  `idexperiencia` INT NOT NULL,
  `nombreEmpresa` VARCHAR(45) NULL,
  `trabajoActual` TINYINT NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_idpersona` INT NOT NULL,
  `url_logo` VARCHAR(45) NULL,
  PRIMARY KEY (`idexperiencia`, `persona_idpersona`),
  INDEX `fk_experiencia_persona_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolioWeb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`titulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`titulo` (
  `idtitulo` INT NOT NULL,
  `nom_titulo` VARCHAR(45) NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idtitulo`, `persona_idpersona`),
  INDEX `fk_titulo_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_titulo_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolioWeb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`estudio` (
  `idestudio` INT NOT NULL,
  `finalizado` TINYINT NULL,
  `institucion` VARCHAR(45) NULL,
  `anioInicio` DATE NULL,
  `anioFin` DATE NULL,
  `titulo` VARCHAR(45) NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idestudio`, `persona_idpersona`),
  INDEX `fk_estudios_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_estudios_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolioWeb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`tipo_aptitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`tipo_aptitud` (
  `idtipo_aptitud` INT NOT NULL,
  `nombre` VARCHAR(30) NULL,
  PRIMARY KEY (`idtipo_aptitud`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`aptitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`aptitud` (
  `idaptitud` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `persona_idpersona` INT NOT NULL,
  `tipo_aptitud_idtipo_aptitud` INT NOT NULL,
  PRIMARY KEY (`idaptitud`, `persona_idpersona`, `tipo_aptitud_idtipo_aptitud`),
  INDEX `fk_aptitudes_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  INDEX `fk_aptitud_tipo_aptitud1_idx` (`tipo_aptitud_idtipo_aptitud` ASC) VISIBLE,
  CONSTRAINT `fk_aptitudes_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolioWeb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aptitud_tipo_aptitud1`
    FOREIGN KEY (`tipo_aptitud_idtipo_aptitud`)
    REFERENCES `portfolioWeb`.`tipo_aptitud` (`idtipo_aptitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioWeb`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioWeb`.`proyecto` (
  `idproyecto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idproyecto`, `persona_idpersona`),
  INDEX `fk_proyecto_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolioWeb`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
