-- Gestion diplomes
CREATE TABLE `diplome` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `LibelleCourt` varchar(10) NOT NULL,
  `Libelle` varchar(100) NOT NULL,
	CONSTRAINT UC_LibelleCourt UNIQUE (`LibelleCourt`),
	CONSTRAINT UC_Libelle UNIQUE (`Libelle`)
);

insert into diplome (LibelleCourt, Libelle) 
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

alter table eleve
	add diplomeId int(11) NULL,
	add constraint FK_DiplomePosseder foreign key (diplomeId) references posseder(diplomeId);

CREATE TABLE `posseder` (
  `diplomeId` INT NOT NULL,
  `eleveId` INT NOT NULL,
  PRIMARY KEY (`diplomeId`, `eleveId`),
  CONSTRAINT `FK_posseder_diplome`
    FOREIGN KEY (`diplomeId`) REFERENCES `diplome` (`Id`),
  CONSTRAINT `FK_posseder_eleve`
    FOREIGN KEY (`eleveId`) REFERENCES `eleve` (`Id`)
)

	update eleve set diplomeId=(select Id from diplome where libelleCourt=eleve.diplome);

	select * from eleve inner join diplome on eleve.diplomeId=diplome.Id;