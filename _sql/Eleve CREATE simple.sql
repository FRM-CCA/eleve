-- CREATION SCHEMA ou DATABASE, ici c'est identique
-- CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
CREATE DATABASE IF NOT EXISTS `db_eleves` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
-- Mettre utf8 si vous voulez gagner en place HDD, mais pour gagner en rapidité de traitement préférer utf16/utf32

-- UTILISE LA BONNE BASE DE DONNEES, ici 'db_eleve'
use db_eleves;

-- Si la table exists on la supprime ATTENTION lE IF EXISTS propre au SGBD
DROP TABLE IF EXISTS eleveSimple;
-- CREATION TABLE ELEVE 
CREATE TABLE eleveSimple (
  `Id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK AUTO
  `Nom` VARCHAR(100) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `DateNaissance` DATE,
  `Email` VARCHAR(255) NOT NULL
  );
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf16;
-- La derniere ligne (en commentaire) est propre a MySQL
-- ENGINE=InnoDB : Sur les version antérieure à la 5.7, il faut la rajouter obligatoirement, mais plus dans notre cas.
-- DEFAULT CHARSET=utf16 : pour la partie encodage plus obligatoire car mise sur la base de données 

-- truncate table eleve; -- Efface les données brutalement pendant les tests

-- DONNEES D INITIALISATION
-- CREATION
INSERT INTO eleveSimple (`Nom`, `Prenom`, `DateNaissance`,  `Email`) 
VALUES ('CAPOLUNGO', 'Christophe', '1972-01-01',  'frm.cca@outlook.com');
INSERT INTO eleveSimple (`Nom`, `Prenom`, `DateNaissance`, `Email`) 
VALUES ('CAPOLUNGO', 'Christophe2', '1972-01-19', 'frm.cca2@outlook.com');

-- MAJ
UPDATE eleveSimple SET `DateNaissance`='1972-01-19' WHERE `Id`='1';
