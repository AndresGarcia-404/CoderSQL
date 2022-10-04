-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nameCliente` VARCHAR(24) NULL,
  `adressCliente` VARCHAR(24) NULL,
  `emailCliente` VARCHAR(24) NULL,
  `phoneCliente` INT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libreria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libreria` (
  `idLibreria` INT NOT NULL AUTO_INCREMENT,
  `nameLibreria` VARCHAR(24) NULL,
  `adressLibreria` VARCHAR(24) NULL,
  `phoneLibreria` INT NULL,
  `emailLibreria` VARCHAR(24) NULL,
  PRIMARY KEY (`idLibreria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `idLibro` INT NOT NULL AUTO_INCREMENT,
  `nameLibro` VARCHAR(24) NULL,
  `authorLibro` VARCHAR(24) NULL,
  `yearLibro` INT NULL,
  `categoryLibro` VARCHAR(24) NULL,
  `priceLibro` VARCHAR(24) NULL,
  `stock` INT NULL,
  `libreriaAsociada` INT NULL,
  PRIMARY KEY (`idLibro`),
  INDEX `idLibreria_idx` (`libreriaAsociada` ASC) VISIBLE,
  CONSTRAINT `idLibreria`
    FOREIGN KEY (`libreriaAsociada`)
    REFERENCES `mydb`.`Libreria` (`idLibreria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `facturaAsociada` INT NULL,
  `librosAsociados` INT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `idFactura_idx` (`facturaAsociada` ASC) VISIBLE,
  INDEX `idLibro_idx` (`librosAsociados` ASC) VISIBLE,
  CONSTRAINT `idFactura`
    FOREIGN KEY (`facturaAsociada`)
    REFERENCES `mydb`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLibro`
    FOREIGN KEY (`librosAsociados`)
    REFERENCES `mydb`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `clienteAsociado` INT NULL,
  `ventaAsociada` INT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `idCliente_idx` (`clienteAsociado` ASC) VISIBLE,
  INDEX `idVenta_idx` (`ventaAsociada` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`clienteAsociado`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVenta`
    FOREIGN KEY (`ventaAsociada`)
    REFERENCES `mydb`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
