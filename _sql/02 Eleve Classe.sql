-- Creation Classe pour la Eleve
use db_eleves;

CREATE TABLE classe (
	id int primary key auto_increment,
	libelle varchar(50) not null unique
);

insert into classe (Libelle) values 
	('BTS SIO'),
	('T. STMG'),
	('T. STI2D'),
	('T. PRO');

-- a modifier
-- alter table eleve
-- 	add classeId int,
-- 	add constraint FK_EleveClasse Foreign Key (...) REFERENCES ...(...);

-- select id, nom, classe, ClasseId from eleve;

update eleve set classe='BtS S.I.O' where id=4;

update eleve set classe ='BTS SIO' where classe='BTS SIO 1'; -- maj des données par rapport aux données dedla table classe
update eleve set classe ='BTS SIO' where classe='BtS S.I.O'; -- maj des données par rapport aux données dedla table classe

alter table eleve
	add classeId int,
	add constraint FK_EleveClasse Foreign Key (classeId) REFERENCES classe(id);

update eleve set classeId=(select id from classe where libelle=eleve.Classe);

UPDATE eleve SET classeId=1 WHERE `Id`='1';

alter table eleve
	modify column classeId int not null;

select * from eleve inner join classe on eleve.classeId = classe.Id;

select eleve.id as EleveId, nom, classe, classeId, classe.Id, classe.Libelle 
	from eleve inner join classe on eleve.classeId = classe.Id;

-- maintenant que les données sont a jour, on peut supprimer la colonne classe de la eleve
alter table eleve
drop column classe;