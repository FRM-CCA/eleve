-- CREATE DATABASE db_eleves_tmp CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- CREATE DATABASE db_eleves_tmp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Classe
#------------------------------------------------------------

CREATE TABLE Classe(
        Id      Int  Auto_increment  NOT NULL ,
        Libelle Varchar (50) NOT NULL
	,CONSTRAINT AK_Classe UNIQUE (Libelle)
	,CONSTRAINT PK_Classe PRIMARY KEY (Id)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Eleve
#------------------------------------------------------------

CREATE TABLE Eleve(
        Id               Int  Auto_increment  NOT NULL ,
        Nom              Varchar (100) NOT NULL ,
        Prenom           Varchar (50) NOT NULL ,
        DateNaissance    Date NOT NULL ,
        Classe           Varchar (45) ,
        Groupe           Char (1) ,
        Diplome          Varchar (45) ,
        Genre            TinyINT ,
        Telephone        Varchar (20) ,
        Adresse          Varchar (200) ,
        Adresse2         Varchar (100) ,
        CodePostal       Numeric ,
        Ville            Varchar (100) ,
        DateCreation     Datetime NOT NULL ,
        DateModification Datetime NOT NULL ,
        Email            Varchar (255) NOT NULL ,
        Id_Classe        Int
	,CONSTRAINT AK_Eleve UNIQUE (Email)
	,CONSTRAINT PK_Eleve PRIMARY KEY (Id)

	,CONSTRAINT FK_Eleve_Classe FOREIGN KEY (Id_Classe) REFERENCES Classe(Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Diplome
#------------------------------------------------------------

CREATE TABLE Diplome(
        Id           Int  Auto_increment  NOT NULL ,
        LibelleCourt Varchar (10) NOT NULL ,
        Libelle      Varchar (100) NOT NULL
	,CONSTRAINT AK_Diplome UNIQUE (LibelleCourt,Libelle)
	,CONSTRAINT PK_Diplome PRIMARY KEY (Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Posseder
#------------------------------------------------------------

CREATE TABLE Posseder(
        Id            Int NOT NULL ,
        Id_Eleve      Int NOT NULL ,
        DateObtention Date
	,CONSTRAINT PK_Posseder PRIMARY KEY (Id,Id_Eleve)

	,CONSTRAINT FK_Posseder_Diplome FOREIGN KEY (Id) REFERENCES Diplome(Id)
	,CONSTRAINT FK_Posseder_Eleve0 FOREIGN KEY (Id_Eleve) REFERENCES Eleve(Id)
)ENGINE=InnoDB;

