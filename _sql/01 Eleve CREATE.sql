-- CREATION SCHEMA ou DATABASE, ici c'est identique
-- CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
CREATE DATABASE IF NOT EXISTS `db_eleves` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
-- Mettre utf8 si vous voulez gagner en place HDD, mais pour gagner en rapidité de traitement préférer utf16/utf32

-- UTILISE LA BONNE BASE DE DONNEES, ici 'db_eleve'
use db_eleves;

-- Si la table exists on la supprime ATTENTION lE IF EXISTS propre au SGBD
DROP TABLE IF EXISTS eleve;
-- CREATION TABLE ELEVE 
CREATE TABLE eleve (
  `Id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK AUTO
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE NOT NULL,
  `Classe` VARCHAR(45) NULL,
  `Groupe` CHAR(1) NULL,	-- Null = None in web, group = A to K char
  `Diplome` VARCHAR(45) NULL,
  `Genre` TINYINT NOT NULL DEFAULT 3,	-- 1 Homme 2 Femme 3 Other
  `Email` VARCHAR(255) NOT NULL,
  `Telephone` VARCHAR(20) NULL,
  `Adresse` VARCHAR(200) NULL,
  `Adresse2` VARCHAR(100) NULL,
  `CodePostal` NUMERIC(5,0) UNSIGNED NULL,
  `Ville` VARCHAR(100) NULL,
  `DateCreation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 		-- creation date du jour
  `DateModification` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- creation date du jour
  CONSTRAINT UC_EMAIL UNIQUE (`Email`)
  );
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
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Genre`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC PRO', 1, 'monemail@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS'); 
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Genre`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM1', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC GEN', 1, 'monemail1@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Genre`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM2', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC GEN', 2, 'monemail2@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS');

-- EXEMPLE INSERT MULTIPLE
INSERT INTO eleve
		(`Nom`, `Prenom`, `DateNaissance`, `Classe`, `Groupe`, `Diplome`, `Genre`, `Email`, `Telephone`,
			`Adresse`, `Adresse2`, `CodePostal`, `Ville`)
VALUES
		('NOM3', 'PRENOM', '1972-01-19', 'BTS SIO 1', 'A', 'BAC STMG', 2, 'monemail3@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS'),
		('NOM4', 'PRENOM', '1972-01-19', 'T. PRO', 'A', 'BUT', 1, 'monemail4@email.fr', '0102030405',
			'add1', NULL, 75015, 'PARIS'),
		('NOM5', 'PRENOM', '1972-01-19', 'BTS SIO', 'A', 'BAC STMG', 3, 'monemail5@email.fr', '0102030405',
			'add1', NULL, 90000, 'PARIS');

