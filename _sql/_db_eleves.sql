-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 25 mars 2024 à 21:46
-- Version du serveur : 10.6.5-MariaDB
-- Version de PHP : 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_eleves_tmp`
--
CREATE DATABASE IF NOT EXISTS `db_eleves` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;
USE `db_eleves`;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `Id` int(11) NOT NULL,
  `Libelle` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`Id`, `Libelle`) VALUES
(1, 'BTS SIO'),
(4, 'T. PRO'),
(3, 'T. STI2D'),
(2, 'T. STMG');

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

CREATE TABLE `diplome` (
  `Id` int(11),
  `LibelleCourt` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL UNIQUE,
  `Libelle` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL UNIQUE,
  `Niveau` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `diplome`
--

insert into diplome (Id,LibelleCourt, Libelle, Niveau) 
	values (1,'BAC GEN', 'BAC Général', 3), 
				(2,'BAC STI', 'BAC sciences et technologies industrielles (STI)',3), 
				(3,'BAC STMG', 'BAC sciences et technologies du management et de la gestion (STMG)',3), 
				(4,'BAC STL', 'BAC sciences et technologies de laboratoire (STL)',3), 
				(5,'BAC ST2S', 'BAC sciences et technologies de la santé et du social (ST2S)',3), 
				(6,'BAC ES', 'BAC économique et social (ES)',3), 
				(7,'BAC S', 'BAC scientifique (S)',3), 
				(8,'BAC PRO', 'BAC professionnel',3), 
				(9,'BTS', 'Brevet de technicien supérieur (BTS)',2), 
				(10,'BUT', 'Bachelors universitaires de technologie (BUT)',2), 
				(11,'LICENCE', 'Licence', 2);

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Prenom` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DateNaissance` date NOT NULL,
  `Genre` tinyint(4) NOT NULL DEFAULT 3,
  `Classe` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Groupe` char(1) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Diplome` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Telephone` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Adresse` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Adresse2` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `CodePostal` decimal(10,0) DEFAULT NULL,
  `Ville` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `DateCreation` datetime NOT NULL DEFAULT current_timestamp(),
  `DateModification` datetime NOT NULL DEFAULT current_timestamp(),
  `Email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ClasseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`Id`, `Nom`, `Prenom`, `DateNaissance`, `Genre`, `Classe`, `Groupe`, `Diplome`, `Telephone`, `Adresse`, `Adresse2`, `CodePostal`, `Ville`, `DateCreation`, `DateModification`, `Email`, `ClasseId`) VALUES
(1, 'CAPOLUNGO', 'Christophe', '1972-01-19', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 00:08:20', '2024-02-29 00:08:20', 'frm.cca@outlook.com', NULL),
(3, 'NOM', 'PRENOM', '1972-01-19', 3, 'BTS SIO', 'B', 'BAC PRO', '0102030405', 'add1', NULL, 75015, 'PARIS', '2024-02-29 00:08:20', '2024-03-25 22:43:08', 'monemail@email.fr', 3),
(4, 'NOM1', 'PRENOM', '1972-01-19', 1, 'BTS SIO', 'A', 'BAC GEN', '0102030405', 'add1', NULL, 75015, 'PARIS', '2024-02-29 00:08:20', '2024-02-29 00:08:20', 'monemail1@email.fr', 1),
(5, 'NOM2', 'PRENOM', '1972-01-19', 2, 'BTS SIO', 'A', 'BAC GEN', '0102030405', 'add1', NULL, 75015, 'PARIS', '2024-02-29 00:08:20', '2024-02-29 00:08:20', 'monemail2@email.fr', 1),
(6, 'NOM3', 'PRENOM', '1972-01-19', 2, 'BTS SIO', 'A', 'BAC STMG', '0102030405', 'add1', NULL, 75015, 'PARIS', '2024-02-29 00:08:20', '2024-02-29 00:08:20', 'monemail3@email.fr', 1),
(7, 'NOM4', 'PRENOM', '1972-01-19', 1, 'T. PRO', 'A', 'BUT', '0102030405', 'add1', NULL, 75015, 'PARIS', '2024-02-29 00:08:20', '2024-02-29 00:08:20', 'monemail4@email.fr', 4),
(8, 'test', 'PRENOM', '1972-01-19', 3, NULL, NULL, NULL, '0102030405', 'add1', NULL, 90000, 'PARIS', '2024-02-29 00:08:20', '2024-02-29 11:18:12', 'monemail5@email.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `elevesimple`
--

CREATE TABLE `elevesimple` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Nom` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Prenom` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DateNaissance` date DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `elevesimple`
--

INSERT INTO `elevesimple` (`Id`, `Nom`, `Prenom`, `DateNaissance`, `Email`) VALUES
(1, 'CAPOLUNGO', 'Christophe', '1972-01-19', 'frm.cca@outlook.com'),
(2, 'CAPOLUNGO', 'Christophe2', '1972-01-19', 'frm.cca2@outlook.com');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `DiplomeId` int(11) NOT NULL,
  `EleveId` int(11) NOT NULL,
  `DateObtention` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`DiplomeId`, `EleveId`, `DateObtention`) VALUES
(3, 3, NULL),
(9, 3, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UC_Libelle` (`Libelle`);

--
-- Index pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UC_LibelleCourt` (`LibelleCourt`),
  ADD UNIQUE KEY `UC_Libelle` (`Libelle`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UC_Email` (`Email`),
  ADD KEY `FK_Eleve_Classe` (`ClasseId`);

--
-- Index pour la table `elevesimple`
--
ALTER TABLE `elevesimple`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`DiplomeId`,`EleveId`),
  ADD KEY `FK_Posseder_Eleve` (`EleveId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `diplome`
--
ALTER TABLE `diplome`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `elevesimple`
--
ALTER TABLE `elevesimple`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `FK_Eleve_Classe` FOREIGN KEY (`ClasseId`) REFERENCES `classe` (`Id`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_Posseder_Diplome` FOREIGN KEY (`DiplomeId`) REFERENCES `diplome` (`Id`),
  ADD CONSTRAINT `FK_Posseder_Eleve` FOREIGN KEY (`EleveId`) REFERENCES `eleve` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
