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
  `phoneLibreria` VARCHAR(45) NULL,
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

INSERT INTO cliente (`idCliente`,`nameCliente`,`adressCliente`,`phoneCliente`,`emailCliente`) VALUES (1,'Felipe Garcia','Mz 14 Cs 13 Villa Nueva','4854563541','felipe.garcia@mail.com');
INSERT INTO cliente (`idCliente`,`nameCliente`,`adressCliente`,`phoneCliente`,`emailCliente`) VALUES (2,'Juan Jimenez','Apto 503 Sol Naciente','4685753245','juan.jimenez@mail.com');
INSERT INTO cliente (`idCliente`,`nameCliente`,`adressCliente`,`phoneCliente`,`emailCliente`) VALUES (3,'Maria Ruiz','Calle 104 CampoReal','2859235485','maria.ruiz@mail.com');
INSERT INTO cliente (`idCliente`,`nameCliente`,`adressCliente`,`phoneCliente`,`emailCliente`) VALUES (4,'Leonel Alvarez','Mz 09 Cs 18 Resplandor','8659453248','leonel.alvarez@mail.com');
INSERT INTO cliente (`idCliente`,`nameCliente`,`adressCliente`,`phoneCliente`,`emailCliente`) VALUES (5,'Pamela Arias','Calle 200 Corferias','6548302548','pamela.arias@mail.com');

INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (1,'Ciencia ficcion','La Mazmorra Del Androide','Calle 101 Centro MX','5054264589','maz.andoride@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (2,'Thriller y Novela Negra','Secret Library','Cs 05 Villa Real','5056245836','sec.lib@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (3,'Literatura Universal','Mundo Libros','Edificio Revolicion piso 4','5052486598','mund.lib@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (4,'Romance','Libreria Oblivion','Calle 54 Union Central','5051232457','lib.oblivion@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (5,'Filosofia','El Banquete De Libros','Via de la reforma N7','5050059784','filoso.lib@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (6,'Comics','Get Comics','CC MundoFantasma local 67','5051598467','comicon.lib@mail.com');
INSERT INTO libreria (`idLibreria`,`stockLibreria`,`nameLibreria`,`adressLibreria`,`phoneLibreria`,`emailLibreria`) VALUES (7,'Literatura Juvenil','Opio En Las Nubes','Avenida Caporales Cs 26','5053254876','juv.opnub@mail.com');

INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (1,'Dune','Frank Herbert','Ciencia ficcion',305,45,1,1965);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (2,'1984','George Orwell','Ciencia ficcion',950,87,1,1949);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (3,'Un mundo feliz','Aldous Huxley','Ciencia ficcion',456,65,1,1932);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (4,'El libro negro de las horas','Eva Garcia','Thriller y Novela Negra',614,12,2,2022);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (5,'La Bestia','Carmen Mola','Thriller y Novela Negra',562,9,2,2010);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (6,'El cuervo','Edgar Allan Poe','Thriller y Novela Negra',238,87,2,1845);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (7,'Orgullo Y prejuicio','Jane Austen','Literatura Universal',210,15,3,1813);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (8,'Cien anios de soledad','Gabriel Garcia Marquez','Literatura Universal',428,7,3,1982);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (9,'Moby-Dick','Herman Melville','Literatura Universal',140,48,3,1851);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (10,'Nosotros en la luna','Alice Kellen','Romance',368,32,4,2020);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (11,'Bajo la misma estrella','John Green','Romance',275,12,4,2012);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (12,'Critica de la razon pura','Immanuel Kant','Filosofia',237,5,5,1787);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (13,'Etica nicomaquea','Aristoteles','Filosofia',435,9,5,349);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (14,'Leviatan','Thomas Hobbes','Filosofia',700,7,5,1651);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (15,'La filosofia de Deadpool','Marvel','Comics',119,5,6,2020);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (16,'Watchmen: ED','Alan Moore','Comics',579,56,6,1985);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (17,'Batman: The Killing Joke','Alan Moore','Comics',1055,37,6,1988);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (18,'Los juegos del hambre','Suzanne Collins','Literatura Juvenil',350,6,7,2008);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (19,'Harry Potter y la camara secrete','J. K. Rowling','Literatura Juvenil',299,26,7,1998);
INSERT INTO libro (`idLibro`,`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES (20,'The Maze Runner','James Dasher','Literatura Juvenil',860,108,7,2009);

INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (1,NULL,7,7);
INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (2,NULL,3,17);
INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (3,NULL,14,3);
INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (4,NULL,2,14);
INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (5,NULL,20,20);
INSERT INTO venta (`idVenta`,`facturaAsociada`,`cantidad`,`librosAsociados`) VALUES (6,NULL,40,20);

INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (1,1,1);
INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (2,1,2);
INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (3,2,3);
INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (4,4,4);
INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (5,3,5);
INSERT INTO factura (`idFactura`,`clienteAsociado`,`ventaAsociada`) VALUES (6,5,6);

UPDATE venta
SET facturaAsociada = 1
WHERE idVenta = 1;

UPDATE venta
SET facturaAsociada = 2
WHERE idVenta = 2;

UPDATE venta
SET facturaAsociada = 3
WHERE idVenta = 3;

UPDATE venta
SET facturaAsociada = 4
WHERE idVenta = 4;

UPDATE venta
SET facturaAsociada = 5
WHERE idVenta = 5;

UPDATE venta
SET facturaAsociada = 6
WHERE idVenta = 6;

-- creacion de vistas

-- 1. esta vista permite observar la cantidad de libros diferentes presentes en la libreria
create view vista_variedad
as
select nameLibreria, (select count(libreriaAsociada) from libro 
where libreria.idLibreria = libro.libreriaAsociada
) as libros_Diferentes 
from libreria;

-- 2. esta vista permite observar el valor total de el stock dependiendo del libro 
create view valor_total
as
select nameLibro,stock,pricelibro, (stock*pricelibro) as valor_Total
from libro;

-- 3. esta vistapermite obtener el valor de vender todo el stock de los libro de la libreria
create view valor_libreria
as
select nameLibreria,(select sum(stock*pricelibro) from libro
where libro.libreriaAsociada = libreria.idLibreria) as valor_libreria
from libreria;

-- 4. esta vista permite ver la cantidad de compras realizadas por los clientes
create view numero_Compras
as
select idCliente,nameCliente,(select count(clienteAsociado) from factura
where cliente.idCliente = factura.clienteAsociado) as numero_Compras
from cliente;

-- 5. esta vista permite ver el valor de las ventas realizadas
create view valor_venta
as
select idVenta,cantidad,(select nameLibro from libro
where libro.idLibro = venta.librosAsociados) as libro_Vendido,
(select (venta.cantidad*priceLibro) from libro
where venta.librosAsociados = libro.idLibro) as precio_Venta
from venta;


-- CREACION DE FUNCIONES

-- 1. funciona para calcular el precio de venta dado un descuento el precio de venta es un valor cualquiera  y el descuento es 
-- un entero de 0 a 100 

USE `libreriadb`;
DROP function IF EXISTS `descuentoVenta`;

DELIMITER $$
USE `libreriadb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `descuentoVenta`(precioVenta float,descuento int) RETURNS float
    NO SQL
BEGIN
	DECLARE resultado FLOAT;
    SET resultado =(precioVenta-(precioVenta*descuento/100));
RETURN resultado;
END$$

-- 2. funcion para calcular el precio total de la venta, recibe como parametros el precio del libro y el numero de libros a comprar
DELIMITER ;

USE `libreriadb`;
DROP function IF EXISTS `precioVenta`;

DELIMITER $$
USE `libreriadb`$$
CREATE FUNCTION `precioVenta`(precioLibro float,numeroLibros int) RETURNS float
    NO SQL
BEGIN
	DECLARE resultado FLOAT;
    SET resultado =(precioLibro*numeroLibros);
RETURN resultado;
END$$

DELIMITER ;

SELECT descuentoVenta(100,20) as preciofinal;
SELECT precioVenta(1025.67,18) as precioTotal;

-- CREACION DE STORED PROCEDURES

-- 1. insertar registros en una tabla de el proyecto
USE `libreriadb`;
DROP procedure IF EXISTS `sp_crearLibro`;

DELIMITER $$
USE `libreriadb`$$
CREATE PROCEDURE `sp_crearLibro` (in argnameLib varchar(45), in argauthorlib varchar(45), in argcategory varchar(45), in argprice int, in argstock int, in argLibreriaAsociada int,in argyear int)
BEGIN
	INSERT INTO libro (`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) 
    VALUES (argnamelib,argauthorlib,argcategory,argprice,argstock,argLibreriaAsociada,argyear);
END$$
DELIMITER 

-- prueba de sp_crearLibro
call sp_crearLibro ('Asesinato para principiantes','Holly Jackson','Literatura Juvenil',574,25,7,2019);

-- 2.  indicar a través de un parámetro el campo de ordenamiento de una tabla y mediante un segundo parámetro, si el orden es descendente o ascendente.
-- tomaremos el (1) para orden asc y el (2) para dsc

USE `libreriadb`;
DROP procedure IF EXISTS `sp_ordenaLibros`;

DELIMITER $$
USE `libreriadb`$$
CREATE PROCEDURE `sp_ordenaLibros` (in argCat varchar(24),in opcion int)
BEGIN

IF opcion = 1 THEN
		set @orden = concat('order by ',argCat,' asc');
        
	ELSEIF opcion = 2 THEN
        set @orden = concat('order by ',argCat,' desc');
    
END IF;
set @clausula = concat('SELECT * FROM libro ',@orden);
prepare ejecutarSQL From @clausula;
EXECUTE ejecutarSQL;
DEALLOCATE PREPARE ejecutarSQL;
END$$

DELIMITER ;

-- prueba sp_ordenaLibro, (1) ASC (2) DESC , los argumentos por lo que peude ser ordenado son:
-- 'idLibro','nameLibro','auhorLibro','categoryLibro','priceLibro','stock','libreriaAsociada','yearLibro'
call sp_ordenaLibros ('yearLibro',1);
call sp_ordenaLibros ('priceLibro',2);
call sp_ordenaLibros ('authorLibro',1);

-- ----------------------------------------------------------------------------------
-- CREACION TRIGGERS
-- ----------------------------------------------------------------------------------

-- Como primera tabla escogi la tabla libro, para un primer trigger que represente el libro que se agrego
-- y la fecha de ser agregado cree la tabla acciones libro

CREATE TABLE `libreriadb`.`accioneslibro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idLibro` INT,
  `libNombre` varchar(45),
  `precio` INT,
  `usuario` varchar(45),
  `accion` VARCHAR(200),
  `fecha` DATETIME,
  PRIMARY KEY (`id`));
 
-- este triger muestra quien y cuando se agrego un libro y el nombre del libro 
CREATE TRIGGER log_tabla_libros AFTER INSERT ON libro
FOR EACH ROW 
INSERT INTO accioneslibro(fecha,usuario,accion) values (now(),user(),concat('Se agrego Libro: ',new.nameLibro));

-- este trigger muestra la fecha y los componentes del libro agregado
CREATE TRIGGER reg_tabla_libros BEFORE INSERT ON libro
FOR EACH ROW
INSERT INTO accioneslibro (fecha,idLibro,libNombre,precio) VALUES (now(), new.idLibro, new.nameLibro, new.priceLibro);

-- prueba triggers:

INSERT INTO libro (`nameLibro`,`authorLibro`,`categoryLibro`,`priceLibro`,`stock`,`libreriaAsociada`,`yearLibro`) VALUES ('Reina Roja','Juan Gómez Jurado','Thriller y Novela Negra',300,9,2,2018);
SELECT * FROM accioneslibro;

-- como segunda tabla escogi la tabla venta

CREATE TABLE `libreriadb`.`accionesventa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT,
  `librosAsociados` INT,
  `usuario` varchar(45),
  `accion` VARCHAR(200),
  `fecha` DATETIME,
  PRIMARY KEY (`id`));

-- este triger muestra quien y cuando agrego una venta y la representacion de esta venta con su respectivo id
 
CREATE TRIGGER log_tabla_venta AFTER INSERT ON venta
FOR EACH ROW 
INSERT INTO accionesventa(fecha,usuario,accion) values (now(),user(),concat('agrego una venta con id: ',new.idVenta));

-- este trigger muestra la fecha y los componentes de la venta agregada

CREATE TRIGGER reg_tabla_venta BEFORE INSERT ON venta
FOR EACH ROW
INSERT INTO accionesventa (fecha,librosAsociados,cantidad) VALUES (now(),new.librosAsociados, new.cantidad);

-- prueba triggers:

INSERT INTO venta (cantidad,librosAsociados) values (10,1);
INSERT INTO venta (cantidad,librosAsociados) values (20,20);
SELECT * FROM accionesVenta;

