 use db_eleves_tmp;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Classe
#------------------------------------------------------------

alter table Classe
	drop constraint AK_Classe,
	add constraint UC_Libelle UNIQUE (Libelle);

#------------------------------------------------------------
# Table: Eleve
#------------------------------------------------------------

alter table Eleve
	drop constraint AK_Eleve;
alter table Eleve
	add constraint UC_Email UNIQUE (Email);
alter table Eleve
	modify column Genre TinyINT NOT NULL DEFAULT 3;
alter table Eleve
	modify column DateCreation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modify column DateModification DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table Eleve
	drop constraint FK_Eleve_Classe,
	drop column Id_Classe;
alter table Eleve
	add column ClasseId int,
	add constraint FK_Eleve_Classe FOREIGN KEY (ClasseId) REFERENCES Classe(Id);

#------------------------------------------------------------
# Table: Diplome
#------------------------------------------------------------

alter table Diplome
	drop constraint AK_Diplome,
	add constraint UC_LibelleCourt UNIQUE (LibelleCourt),
	add constraint UC_Libelle UNIQUE (Libelle);

#------------------------------------------------------------
# Table: Posseder
#------------------------------------------------------------

alter table Posseder
	drop constraint FK_Posseder_Diplome,
	drop constraint FK_Posseder_Eleve0;
alter table Posseder
	-- rename column Id to DiplomeId,	-- normaly MYSQL/MARIADB
	-- rename column Id_Eleve to EleveId,	-- normaly MYSQL/MARIADB
	change column Id DiplomeId int,
	change column Id_Eleve EleveId int;
alter table Posseder
	add constraint FK_Posseder_Diplome FOREIGN KEY (DiplomeId) REFERENCES Diplome(Id),
	add constraint FK_Posseder_Eleve FOREIGN KEY (EleveId) REFERENCES Eleve(Id);

