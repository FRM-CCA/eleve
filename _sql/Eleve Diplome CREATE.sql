-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_eleve
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `db_eleve_diplome` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `db_eleve_diplome` ;

-- -----------------------------------------------------
-- DROP Tables
-- -----------------------------------------------------
DROP TABLE IF EXISTS diplomeParEleve ;
DROP TABLE IF EXISTS eleve ;
DROP TABLE IF EXISTS diplome;

-- -----------------------------------------------------
-- Table `diplome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diplome` (
  `Id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Libelle` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `IDX_Libelle_UNIQUE` (`Libelle` ASC));
-- ENGINE = InnoDB 
-- DEFAULT CHARACTER SET = utf16;

-- -----------------------------------------------------
-- Table `eleve`
-- -----------------------------------------------------
CREATE TABLE `eleve` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `DateNaissance` date NOT NULL,
  `Classe` varchar(45) DEFAULT NULL,
  `Groupe` char(1) DEFAULT NULL,
  `Diplome` VARCHAR(45),
  `Sexe` tinyint(4) NOT NULL DEFAULT '0',
  `Email` varchar(255) NOT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `Adresse` varchar(200) DEFAULT NULL,
  `Adresse2` varchar(100) DEFAULT NULL,
  `CodePostal` decimal(5,0) unsigned DEFAULT NULL,
  `Ville` varchar(100) DEFAULT NULL,
  `DateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModification` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diplome_Id` int(10) unsigned,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UC_EMAIL` (`Email`),
  UNIQUE KEY `UC_NOMPRENOM` (`Nom`,`Prenom`),
  KEY `fk_eleve_diplome` (`diplome_Id`),
  CONSTRAINT `fk_eleve_diplome` FOREIGN KEY (`diplome_Id`) REFERENCES `diplome` (`Id`)
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf16;

-- -----------------------------------------------------
-- Table `diplomepareleve`
-- -----------------------------------------------------
CREATE TABLE `diplomepareleve` (
  `diplome_Id` INT(10) UNSIGNED NOT NULL,
  `eleve_Id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`diplome_Id`, `eleve_Id`),
  CONSTRAINT `fk_diplomepareleve_diplome`
    FOREIGN KEY (`diplome_Id`)
    REFERENCES `diplome` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diplomepareleve_eleve`
    FOREIGN KEY (`eleve_Id`)
    REFERENCES `eleve` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*
CREATE TABLE IF NOT EXISTS `eleve` (
  `Id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE NOT NULL,
  `Classe` VARCHAR(45) NULL DEFAULT NULL,
  `Groupe` CHAR(1) NULL DEFAULT NULL,
  `Sexe` TINYINT(4) NOT NULL DEFAULT '0',
  `Email` VARCHAR(255) NOT NULL,
  `Telephone` VARCHAR(20) NULL DEFAULT NULL,
  `Adresse` VARCHAR(200) NULL DEFAULT NULL,
  `Adresse2` VARCHAR(100) NULL DEFAULT NULL,
  `CodePostal` DECIMAL(5,0) UNSIGNED NULL DEFAULT NULL,
  `Ville` VARCHAR(100) NULL DEFAULT NULL,
  `DateCreation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModification` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diplome_Id` INT(10) UNSIGNED,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `UC_EMAIL` (`Email` ASC),
  UNIQUE INDEX `UC_NOMPRENOM` (`Nom` ASC, `Prenom` ASC),
  INDEX `fk_eleve_diplome_idx` (`diplome_Id` ASC),
  CONSTRAINT `fk_eleve_diplome`
    FOREIGN KEY (`diplome_Id`)
    REFERENCES `diplome` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;

CREATE TABLE IF NOT EXISTS `diplomepareleve` (
  `diplome_Id` INT(10) UNSIGNED NOT NULL,
  `eleve_Id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`diplome_Id`, `eleve_Id`),
  INDEX `fk_diplome_has_eleve_eleve1_idx` (`eleve_Id` ASC),
  INDEX `fk_diplome_has_eleve_diplome1_idx` (`diplome_Id` ASC),
  CONSTRAINT `fk_diplomepareleve_diplome`
    FOREIGN KEY (`diplome_Id`)
    REFERENCES `diplome` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diplomepareleve_eleve`
    FOREIGN KEY (`eleve_Id`)
    REFERENCES `eleve` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;
*/

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
