-- MySQL Script generated by MySQL Workbench
-- Mon Jan  8 13:37:44 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `idproveidor` INT NOT NULL AUTO_INCREMENT,
  `NIF` VARCHAR(15) NULL,
  `nom` VARCHAR(45) NULL,
  `adreca` VARCHAR(105) NULL,
  `telefon` VARCHAR(15) NULL,
  `fax` VARCHAR(15) NULL,
  PRIMARY KEY (`idproveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `idmarca` INT NOT NULL AUTO_INCREMENT,
  `idproveidor` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idmarca`),
  CONSTRAINT `fk_marca_proveidor1`
    FOREIGN KEY (`idproveidor`)
    REFERENCES `optica`.`proveidor` (`idproveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_marca_proveidor1_idx` ON `optica`.`marca` (`idproveidor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `adreca` VARCHAR(105) NULL,
  `telefon` VARCHAR(15) NULL,
  `correu` VARCHAR(45) NULL,
  `registre` DATE NULL,
  `referral` INT NULL,
  PRIMARY KEY (`idclient`),
  CONSTRAINT `fk_referral`
    FOREIGN KEY (`referral`)
    REFERENCES `optica`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_referral_idx` ON `optica`.`client` (`referral` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`venda` (
  `idvenda` INT NOT NULL AUTO_INCREMENT,
  `idclient` INT NOT NULL,
  `idulleres` INT NULL,
  `data` DATE NULL,
  `idempleat` INT NULL,
  PRIMARY KEY (`idvenda`, `idclient`),
  CONSTRAINT `fk_venda_client1`
    FOREIGN KEY (`idclient`)
    REFERENCES `optica`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idulleres_UNIQUE` ON `optica`.`venda` (`idulleres` ASC) VISIBLE;

CREATE INDEX `fk_venda_client1_idx` ON `optica`.`venda` (`idclient` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `idulleres` INT NOT NULL AUTO_INCREMENT,
  `idmarca` INT NOT NULL,
  `gradE` FLOAT NULL,
  `gradD` FLOAT NULL,
  `muntura` VARCHAR(15) NULL,
  `colorE` VARCHAR(25) NULL,
  `colorD` VARCHAR(25) NULL,
  `preu` FLOAT NULL,
  PRIMARY KEY (`idulleres`),
  CONSTRAINT `fk_ulleres_venda`
    FOREIGN KEY (`idulleres`)
    REFERENCES `optica`.`venda` (`idulleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`idmarca`)
    REFERENCES `optica`.`marca` (`idmarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ulleres_marca1_idx` ON `optica`.`ulleres` (`idmarca` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `optica`.`proveidor`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`proveidor` (`idproveidor`, `NIF`, `nom`, `adreca`, `telefon`, `fax`) VALUES (DEFAULT, '16845268G', 'prov1', 'adreça_prov1', '6541658756', '41684152657');
INSERT INTO `optica`.`proveidor` (`idproveidor`, `NIF`, `nom`, `adreca`, `telefon`, `fax`) VALUES (DEFAULT, '123456789A', 'prov2', 'adreça_prov2', '123456789', '123456789');
INSERT INTO `optica`.`proveidor` (`idproveidor`, `NIF`, `nom`, `adreca`, `telefon`, `fax`) VALUES (DEFAULT, '987654321B', 'prov3', 'adreça_prov3', '987654321', '987654321');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES (DEFAULT, 1, 'Hugo Boss');
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES (DEFAULT, 1, 'Ray-Ban');
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES (DEFAULT, 2, 'Emporio Armani');
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES (DEFAULT, 3, 'Gucci');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`client`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`client` (`idclient`, `nom`, `adreca`, `telefon`, `correu`, `registre`, `referral`) VALUES (DEFAULT, 'Joan', 'adrecaJoan', '123456789', 'correu1', '2023-01-01', NULL);
INSERT INTO `optica`.`client` (`idclient`, `nom`, `adreca`, `telefon`, `correu`, `registre`, `referral`) VALUES (DEFAULT, 'Manel', 'adrecaManel', '987654312', 'correu2', '2023-02-02', 1);
INSERT INTO `optica`.`client` (`idclient`, `nom`, `adreca`, `telefon`, `correu`, `registre`, `referral`) VALUES (DEFAULT, 'Judit', 'adrecaJudit', '321654987', 'correu3', '2023-03-03', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`venda`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 1, 1, '2023-06-15', 1);
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 2, 2, '2023-11-15', 1);
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 3, 3, '2023-12-22', 2);
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 3, 4, '2023-12-22', 2);
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 2, 5, '2023-05-07', 1);
INSERT INTO `optica`.`venda` (`idvenda`, `idclient`, `idulleres`, `data`, `idempleat`) VALUES (DEFAULT, 3, 6, '2023-02-15', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`ulleres`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 1, 2.1, 2.5, 'flotant', 'negre', 'negre', 199.99);
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 2, 3.7, 2.2, 'pasta', 'verd', 'verd', 255.55);
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 3, 1.6, 2.7, 'metàl·lica', 'transparent', 'transparent', 494.65);
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 4, 1.6, 1.6, 'metàl·lica', 'groc', 'blau', 156.4);
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 2, 2.6, 4.2, 'flotant', 'rosa', 'vermell', 99.99);
INSERT INTO `optica`.`ulleres` (`idulleres`, `idmarca`, `gradE`, `gradD`, `muntura`, `colorE`, `colorD`, `preu`) VALUES (DEFAULT, 3, 6.1, 4.4, 'pasta', 'negre', 'negre', 889.99);

COMMIT;
