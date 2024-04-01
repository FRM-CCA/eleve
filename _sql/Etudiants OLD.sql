CREATE DATABASE IF NOT EXISTS `db_etudiants` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
use db_etudiants;
DROP TABLE IF EXISTS etudiantSIO1;
CREATE TABLE etudiantSIO1 (
  `Id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK AUTO
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE NOT NULL,
  `Classe` VARCHAR(45) NULL,
  `Groupe` NCHAR(1) NULL,
  `Diplome` VARCHAR(45) NULL,
  `Sexe` TINYINT NOT NULL DEFAULT 0,	-- 0 Homme 1 Femme
  `Email` VARCHAR(255) NOT NULL,
  `Telephone` VARCHAR(20) NULL,
  `Adresse` VARCHAR(200) NULL,
  `Adresse2` VARCHAR(100) NULL,
  `CodePostal` NUMERIC(5,0) UNSIGNED NULL,
  `Ville` VARCHAR(100) NULL,
  `DateCreation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 		-- creation date du jour
  `DateModification` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- creation date du jour
  UNIQUE INDEX `UC_EMAIL` (`Email` ASC),
  UNIQUE INDEX `UC_NOMPRENOM` (`Nom` ASC, `Prenom` ASC));
  
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (1,'ANDREZEJEWSKI','Alexandre','1999-12-03','BTS SIO 1','A','BAC',0,'alexg-gen@hotmail.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:43:15','2017-11-08 21:43:15');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (2,'ASCI','Serinkan','1999-08-23','BTS SIO 1','A','BAC',0,'serinkan.asci7@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:48:37','2017-11-08 21:48:37');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (3,'BELHADJ','Saïd','1999-03-12','BTS SIO 1','A','BAC',0,'aidbelhadj75019@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:52:42','2017-11-08 21:52:42');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (4,'BRAGIEL','Barthélemy','1998-02-14','BTS SIO 1','A','BAC',0,'bartek140298@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:53:44','2017-11-08 21:53:44');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (5,'CHAHED','Sabri','1999-07-23','BTS SIO 1','A','BAC',0,'sabri.chahed23@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:56:30','2017-11-08 21:56:30');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (6,'CHEBAK','Brahim-Anis','1996-09-19','BTS SIO 1','A','BAC',0,'chebakbrahim@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:56:30','2017-11-08 21:56:30');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (7,'DRUART','Romain','1999-11-10','BTS SIO 1','A','BAC',0,'druart.romainpro@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (8,'EL  GUABDAOUI','Anis','1998-04-23','BTS SIO 1','A','BAC',0,'UNKNOW EMAIL',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (9,'ESTEVES','Mickael','1998-11-09','BTS SIO 1','A','BAC',0,'mickaelesteves98@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (10,'ETIENNE','Olivier','1999-05-28','BTS SIO 1','A','BAC',0,'olivietienne30@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (11,'GUERET','Maëlys','1999-05-04','BTS SIO 1','A','BAC',1,'maelysgueret@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (12,'HERMELIN','Maxime','1999-05-13','BTS SIO 1','A','BAC',0,'maxime.hermelin@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (13,'ISKRANE','Othman','1999-12-28','BTS SIO 1','A','BAC',0,'othman.iskrane@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (14,'JACQUEMIN','Tristan','1999-12-28','BTS SIO 1','A','BAC',0,'tristan.jacquemin@yahoo.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (15,'LE NORMAND','Alexis','1998-08-14','BTS SIO 1','B','BAC',0,'a.lenormand.larmand@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (16,'LEBLOND','Morgan','2000-04-21','BTS SIO 1','B','BAC',0,'kevam92@bbox.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (17,'LEJEUNE','Sebastien','1998-07-22','BTS SIO 1','B','BAC',0,'sebastien.lejeune6@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (18,'LHOMME','Yoann','1999-04-08','BTS SIO 1','B','BAC',0,'yoann.lh@hotmail.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (19,'MARTIN','Jimmy','2000-04-13','BTS SIO 1','B','BAC',0,'jiiclaps@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (20,'MOHAMED','Ertan','1999-11-08','BTS SIO 1','B','BAC',0,'ertan.mohamed@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (21,'M\'ZAH','Abdel-Karim','1998-10-05','BTS SIO 1','B','BAC',0,'abdelkarim.mzah@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (22,'PETRICIEN','Jérôme','1999-06-12','BTS SIO 1','B','BAC',0,'jeromepetricien@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (23,'QU','Anthony','1998-05-19','BTS SIO 1','B','BAC',0,'quanthony3e1@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (24,'RIBAU','Quentin','1999-05-16','BTS SIO 1','B','BAC',0,'quentin.ribau@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (25,'SIEYE','Armand','1999-02-17','BTS SIO 1','B','BAC',0,'armand.sieye@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (26,'TEIXEIRA','Hugo','1999-01-26','BTS SIO 1','B','BAC',0,'hugo.2601@outlook.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (27,'VILAIN','Thomas','1998-02-09','BTS SIO 1','B','BAC',0,'vilainthomas.etudiant@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:27:29','2017-11-08 22:27:29');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (28,'WINTZ','Enzo','1999-11-20','BTS SIO 1','B','BAC',0,'enzo.wintz1@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:27:29','2017-11-08 22:27:29');

-- CREATION SCHEMA ou DATABASE, ici c'est identique
-- CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
CREATE DATABASE IF NOT EXISTS `db_eleve` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
-- Mettre utf8 si vous voulez gagner en place HDD, mais pour gagner en rapidité de traitement préférer utf16/utf32

-- UTILISE LA BONNE BASE DE DONNEES, ici 'db_eleve'
use db_eleve;

-- Si la table exists on la supprime ATTENTION lE IF EXISTS propre au SGBD
DROP TABLE IF EXISTS eleve;
-- CREATION TABLE ELEVE 
CREATE TABLE eleve (
  `Id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK AUTO
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE NOT NULL,
  `Classe` VARCHAR(45) NULL,
  `Groupe` NCHAR(1) NULL,
  `Diplome` VARCHAR(45) NULL,
  `Sexe` TINYINT NOT NULL DEFAULT 0,	-- 0 Homme 1 Femme
  `Email` VARCHAR(255) NOT NULL,
  `Telephone` VARCHAR(20) NULL,
  `Adresse` VARCHAR(200) NULL,
  `Adresse2` VARCHAR(100) NULL,
  `CodePostal` NUMERIC(5,0) UNSIGNED NULL,
  `Ville` VARCHAR(100) NULL,
  `DateCreation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 		-- creation date du jour
  `DateModification` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- creation date du jour
  UNIQUE INDEX `UC_EMAIL` (`Email` ASC),
  UNIQUE INDEX `UC_NOMPRENOM` (`Nom` ASC, `Prenom` ASC));
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf16;
-- La derniere ligne (en commentaire) est propre a MySQL
-- ENGINE=InnoDB : Sur les version antérieure à la 5.7, il faut la rajouter obligatoirement, mais plus dans notre cas.
-- DEFAULT CHARSET=utf16 : pour la partie encodage plus obligatoire car mise sur la base de données 

-- truncate table eleve; -- Efface les données brutalement pendant les tests

-- DONNEES D INITIALISATION
-- CREATION
INSERT INTO eleve (`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Email`) 
VALUES ('CAPOLUNGO', 'Christophe', '1972-01-01', NULL, 'frm.cca@outlook.com');
INSERT INTO eleve (`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Email`) 
VALUES ('CAPOLUNGO', 'Christophe2', '1972-01-19', NULL, 'frm.cca2@outlook.com');

-- MAJ
UPDATE eleve SET `DateNaissance`='1972-01-19', DateModification=CURRENT_TIMESTAMP WHERE `Id`='1';

-- EFFACEMENT
DELETE FROM eleve WHERE id=2;

-- EXEMPLE INSERT COMPLET 
-- sans id car AUTO-INCREMENT, est sans DATECREATION/DATECREATION pour montrer qu ils ont UNE VALEUR DEFAULT
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC', 1, 'monemail@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS'); 
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM1', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC1', 1, 'monemail1@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM2', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC1', 1, 'monemail2@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM3', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC2', 1, 'monemail3@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');      
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM4', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC2', 1, 'monemail4@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Sexe`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM5', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC3', 1, 'monemail5@email.fr', '0102030405',
			'add1', NULL, 90000, 'PARIS');

DROP TABLE IF EXISTS etudiantSIO1;
CREATE TABLE etudiantSIO1 (
  `Id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK AUTO
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE NOT NULL,
  `Classe` VARCHAR(45) NULL,
  `Groupe` NCHAR(1) NULL,
  `Diplome` VARCHAR(45) NULL,
  `Sexe` TINYINT NOT NULL DEFAULT 0,	-- 0 Homme 1 Femme
  `Email` VARCHAR(255) NOT NULL,
  `Telephone` VARCHAR(20) NULL,
  `Adresse` VARCHAR(200) NULL,
  `Adresse2` VARCHAR(100) NULL,
  `CodePostal` NUMERIC(5,0) UNSIGNED NULL,
  `Ville` VARCHAR(100) NULL,
  `DateCreation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 		-- creation date du jour
  `DateModification` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- creation date du jour
  UNIQUE INDEX `UC_EMAIL` (`Email` ASC),
  UNIQUE INDEX `UC_NOMPRENOM` (`Nom` ASC, `Prenom` ASC));
  
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (1,'ANDREZEJEWSKI','Alexandre','1999-12-03','BTS SIO 1','A','BAC',0,'alexg-gen@hotmail.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:43:15','2017-11-08 21:43:15');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (2,'ASCI','Serinkan','1999-08-23','BTS SIO 1','A','BAC',0,'serinkan.asci7@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:48:37','2017-11-08 21:48:37');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (3,'BELHADJ','Saïd','1999-03-12','BTS SIO 1','A','BAC',0,'aidbelhadj75019@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:52:42','2017-11-08 21:52:42');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (4,'BRAGIEL','Barthélemy','1998-02-14','BTS SIO 1','A','BAC',0,'bartek140298@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:53:44','2017-11-08 21:53:44');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (5,'CHAHED','Sabri','1999-07-23','BTS SIO 1','A','BAC',0,'sabri.chahed23@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:56:30','2017-11-08 21:56:30');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (6,'CHEBAK','Brahim-Anis','1996-09-19','BTS SIO 1','A','BAC',0,'chebakbrahim@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 21:56:30','2017-11-08 21:56:30');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (7,'DRUART','Romain','1999-11-10','BTS SIO 1','A','BAC',0,'druart.romainpro@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (8,'EL  GUABDAOUI','Anis','1998-04-23','BTS SIO 1','A','BAC',0,'UNKNOW EMAIL',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (9,'ESTEVES','Mickael','1998-11-09','BTS SIO 1','A','BAC',0,'mickaelesteves98@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (10,'ETIENNE','Olivier','1999-05-28','BTS SIO 1','A','BAC',0,'olivietienne30@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (11,'GUERET','Maëlys','1999-05-04','BTS SIO 1','A','BAC',1,'maelysgueret@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (12,'HERMELIN','Maxime','1999-05-13','BTS SIO 1','A','BAC',0,'maxime.hermelin@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (13,'ISKRANE','Othman','1999-12-28','BTS SIO 1','A','BAC',0,'othman.iskrane@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (14,'JACQUEMIN','Tristan','1999-12-28','BTS SIO 1','A','BAC',0,'tristan.jacquemin@yahoo.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:11:05','2017-11-08 22:11:05');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (15,'LE NORMAND','Alexis','1998-08-14','BTS SIO 1','B','BAC',0,'a.lenormand.larmand@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (16,'LEBLOND','Morgan','2000-04-21','BTS SIO 1','B','BAC',0,'kevam92@bbox.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (17,'LEJEUNE','Sebastien','1998-07-22','BTS SIO 1','B','BAC',0,'sebastien.lejeune6@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (18,'LHOMME','Yoann','1999-04-08','BTS SIO 1','B','BAC',0,'yoann.lh@hotmail.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:17:16','2017-11-08 22:17:16');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (19,'MARTIN','Jimmy','2000-04-13','BTS SIO 1','B','BAC',0,'jiiclaps@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (20,'MOHAMED','Ertan','1999-11-08','BTS SIO 1','B','BAC',0,'ertan.mohamed@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (21,'M\'ZAH','Abdel-Karim','1998-10-05','BTS SIO 1','B','BAC',0,'abdelkarim.mzah@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:20:23','2017-11-08 22:20:23');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (22,'PETRICIEN','Jérôme','1999-06-12','BTS SIO 1','B','BAC',0,'jeromepetricien@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (23,'QU','Anthony','1998-05-19','BTS SIO 1','B','BAC',0,'quanthony3e1@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (24,'RIBAU','Quentin','1999-05-16','BTS SIO 1','B','BAC',0,'quentin.ribau@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (25,'SIEYE','Armand','1999-02-17','BTS SIO 1','B','BAC',0,'armand.sieye@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (26,'TEIXEIRA','Hugo','1999-01-26','BTS SIO 1','B','BAC',0,'hugo.2601@outlook.fr',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:24:47','2017-11-08 22:24:47');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (27,'VILAIN','Thomas','1998-02-09','BTS SIO 1','B','BAC',0,'vilainthomas.etudiant@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:27:29','2017-11-08 22:27:29');
INSERT INTO `etudiantSIO1` (`Id`,`Nom`,`Prenom`,`DateNaissance`,`Classe`,`Groupe`,`Diplome`,`Sexe`,`Email`,`Telephone`,`Adresse`,`Adresse2`,`CodePostal`,`Ville`,`DateCreation`,`DateModification`) 
  VALUES (28,'WINTZ','Enzo','1999-11-20','BTS SIO 1','B','BAC',0,'enzo.wintz1@gmail.com',NULL,NULL,NULL,NULL,NULL,'2017-11-08 22:27:29','2017-11-08 22:27:29');
  