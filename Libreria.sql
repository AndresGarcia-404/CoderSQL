-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LibreriaDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LibreriaDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LibreriaDB` DEFAULT CHARACTER SET utf8 ;
USE `LibreriaDB` ;

-- -----------------------------------------------------
-- Table `LibreriaDB`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaDB`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nameCliente` VARCHAR(45) NULL,
  `adressCliente` VARCHAR(45) NULL,
  `phoneCliente` VARCHAR(45) NULL,
  `emailCliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaDB`.`Libreria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaDB`.`Libreria` (
  `idLibreria` INT NOT NULL AUTO_INCREMENT,
  `stockLibreria` VARCHAR(45) NULL,
  `nameLibreria` VARCHAR(45) NULL,
  `adressLibreria` VARCHAR(45) NULL,
  `phoneLibreria` INT NULL,
  `emailLibreria` VARCHAR(45) NULL,
  PRIMARY KEY (`idLibreria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaDB`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaDB`.`Libro` (
  `idLibro` INT NOT NULL AUTO_INCREMENT,
  `nameLibro` VARCHAR(45) NULL,
  `authorLibro` VARCHAR(45) NULL,
  `categoryLibro` VARCHAR(45) NULL,
  `priceLibro` INT NULL,
  `stock` INT NULL,
  `libreriaAsociada` INT NULL,
  `yearLibro` INT NULL,
  PRIMARY KEY (`idLibro`),
  UNIQUE INDEX `nameLibro_UNIQUE` (`nameLibro` ASC) VISIBLE,
  INDEX `idLibreria_idx` (`libreriaAsociada` ASC) VISIBLE,
  CONSTRAINT `idLibreria`
    FOREIGN KEY (`libreriaAsociada`)
    REFERENCES `LibreriaDB`.`Libreria` (`idLibreria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaDB`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaDB`.`Venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `facturaAsociada` INT NULL,
  `cantidad` INT NULL,
  `librosAsociados` INT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `idFactura_idx` (`facturaAsociada` ASC) VISIBLE,
  INDEX `idLibro_idx` (`librosAsociados` ASC) VISIBLE,
  CONSTRAINT `idFactura`
    FOREIGN KEY (`facturaAsociada`)
    REFERENCES `LibreriaDB`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLibro`
    FOREIGN KEY (`librosAsociados`)
    REFERENCES `LibreriaDB`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaDB`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaDB`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `clienteAsociado` INT NULL,
  `ventaAsociada` INT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `idCliente_idx` (`clienteAsociado` ASC) VISIBLE,
  INDEX `idVenta_idx` (`ventaAsociada` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`clienteAsociado`)
    REFERENCES `LibreriaDB`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVenta`
    FOREIGN KEY (`ventaAsociada`)
    REFERENCES `LibreriaDB`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

