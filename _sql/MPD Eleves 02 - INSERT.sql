 use db_eleves_tmp;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

-- Table diplome
insert into Diplome (LibelleCourt, Libelle) 
	values ('BAC GEN', 'BAC Général'), 
				('BAC STI', 'BAC sciences et technologies industrielles (STI)'), 
				('BAC STMG', 'BAC sciences et technologies du management et de la gestion (STMG)'), 
				('BAC STL', 'BAC sciences et technologies de laboratoire (STL)'), 
				('BAC ST2S', 'BAC sciences et technologies de la santé et du social (ST2S)'), 
				('BAC ES', 'BAC économique et social (ES)'), 
				('BAC S', 'BAC scientifique (S)'), 
				('BAC PRO', 'BAC professionnel'), 
				('BTS', 'Brevet de technicien supérieur (BTS)'), 
				('BUT', 'Bachelors universitaires de technologie (BUT)'), 
				('LICENCE', 'Licence');

-- Table Classe
insert into Classe (Libelle) values 
	('BTS SIO'),
	('T. STMG'),
	('T. STI2D'),
	('T. PRO');

-- Table Eleve
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

-- Update Eleve with Classe table datas
update eleve set classe='BtS S.I.O' where id=4;
update Eleve set classe ='BTS SIO' where classe='BTS SIO 1';	-- maj des données par rapport aux données dedla table classe
update Eleve set classe ='BTS SIO' where classe='BtS S.I.O'; 
update Eleve set classeId=(select Id from Classe where Libelle=Eleve.Classe);

-- alter table eleve
--	drop column classe;