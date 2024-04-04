-- Gestion diplomes
CREATE TABLE diplome (
  Id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  LibelleCourt varchar(10) NOT NULL,
  Libelle varchar(100) NOT NULL,
	Niveau int,
	CONSTRAINT UC_LibelleCourt UNIQUE (`LibelleCourt`),
	CONSTRAINT UC_Libelle UNIQUE (`Libelle`)
	-- CONSTRAINT UC_LibelleCourtLibelle UNIQUE (`LibelleCourt`, `Libelle`),
);

insert into diplome (LibelleCourt, Libelle, Niveau) 
	values ('BAC GEN', 'BAC Général', 3), 
				('BAC STI', 'BAC sciences et technologies industrielles (STI)',3), 
				('BAC STMG', 'BAC sciences et technologies du management et de la gestion (STMG)',3), 
				('BAC STL', 'BAC sciences et technologies de laboratoire (STL)',3), 
				('BAC ST2S', 'BAC sciences et technologies de la santé et du social (ST2S)',3), 
				('BAC ES', 'BAC économique et social (ES)',3), 
				('BAC S', 'BAC scientifique (S)',3), 
				('BAC PRO', 'BAC professionnel',3), 
				('BTS', 'Brevet de technicien supérieur (BTS)',2), 
				('BUT', 'Bachelors universitaires de technologie (BUT)',2), 
				('LICENCE', 'Licence', 2);

CREATE TABLE posseder (
	-- `eleveId` INT PRIMARY KEY,
  -- `diplomeId` INT PRIMARY KEY
  eleveId INT,
	diplomeId INT,
  CONSTRAINT FK_posseder_diplome
    FOREIGN KEY (diplomeId) REFERENCES diplome (Id),
  CONSTRAINT FK_posseder_eleve
    FOREIGN KEY (eleveId) REFERENCES eleve (Id),
	PRIMARY KEY (eleveId, diplomeId)
)

	-- update eleve set diplomeId=(select Id from diplome where libelleCourt=eleve.diplome);

	-- select * from eleve inner join diplome on eleve.diplomeId=diplome.Id;

	-- Diplome 3 et 8 et eleve 1
	insert into posseder (eleveId, diplomeId) VALUES (1, 3);
	insert into posseder (eleveId, diplomeId) VALUES (1, 8);

	select e.id, e.nom FROM eleve as e; -- ici eleve

-- jointure avec diplome
	select e.id, e.nom, p.EleveId, p.DiplomeId, d.Id, d.LibelleCourt, d.Libelle, d.Niveau
		FROM eleve as e 
			left join posseder as p on e.id = p.EleveId
			left join Diplome as d on p.DiplomeId = d.Id

-- idem avec la classe en plus
select e.id, e.nom, p.EleveId, p.DiplomeId, d.Id, d.LibelleCourt, d.Libelle as libDiplome, d.Niveau,
	c.Libelle as libClasse
	FROM eleve as e 
		left join posseder as p on e.id = p.EleveId
		left join Diplome as d on p.DiplomeId = d.Id
		left join Classe as c on e.ClasseId = c.Id
	order by e.id

-- idem avec la classe en plus mais pas d'alias sur les tables
-- idem avec la classe en plus
select eleve.id, nom, EleveId, DiplomeId, Diplome.Id, LibelleCourt, Diplome.Libelle as libDiplome, Niveau,
	Classe.Libelle as libClasse
	FROM eleve
		left join posseder on eleve.id = posseder.EleveId
		left join Diplome on posseder.DiplomeId = Diplome.Id
		left join Classe on eleve.ClasseId = Classe.Id
	order by e.id
