-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 26 Novembre 2018 à 23:03
-- Version du serveur :  10.1.26-MariaDB-0+deb9u1
-- Version de PHP :  7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `PlateformeSDE`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_lien` varchar(255) NOT NULL,
  `article_dateparution` date NOT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Cesure`
--

CREATE TABLE `Cesure` (
  `Cesure_id` int(11) NOT NULL,
  `Cesure_annee` int(11) DEFAULT NULL,
  `Eleve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Clubs`
--

CREATE TABLE `Clubs` (
  `Club_id` int(11) NOT NULL,
  `Club_nom` varchar(100) NOT NULL,
  `Club_Confidentialite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `Clubs`
--

INSERT INTO `Clubs` (`Club_id`, `Club_nom`, `Club_Confidentialite`) VALUES
(1, 'Team Voile Centrale Nantes', 0),
(2, 'Centrale Nantes Etudes', 0);

-- --------------------------------------------------------

--
-- Structure de la table `DoubleDiplmes`
--

CREATE TABLE `DoubleDiplmes` (
  `DD_id` int(11) NOT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Master_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Eleves`
--

CREATE TABLE `Eleves` (
  `Eleve_id` int(11) NOT NULL,
  `Eleve_nom` varchar(255) NOT NULL,
  `Eleve_prenom` varchar(255) NOT NULL,
  `Eleve_mail` varchar(100) NOT NULL,
  `Eleve_annee` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `Eleves`
--

INSERT INTO `Eleves` (`Eleve_id`, `Eleve_nom`, `Eleve_prenom`, `Eleve_mail`, `Eleve_annee`) VALUES
(1, 'TROESCH', 'Robin', 'robin.troesch@eleves.ec-nantes.fr', 2020),
(2, 'LEBAIL', 'Alban', 'alban.lebail@eleves.ec-nantes.fr', 2020);

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE `Entreprise` (
  `Entreprise_id` int(11) NOT NULL,
  `Entreprise_nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `EventBde`
--

CREATE TABLE `EventBde` (
  `EventBde_id` int(11) NOT NULL,
  `EventClub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `EventClub`
--

CREATE TABLE `EventClub` (
  `EventClub_id` int(11) NOT NULL,
  `EventClub_titre` varchar(100) NOT NULL,
  `EventClub_Description` varchar(255) DEFAULT NULL,
  `EventClub_Date` date NOT NULL,
  `EventClub_Recurrence` binary(1) NOT NULL,
  `EventClub_HeureDebut` time NOT NULL,
  `EventClub_HeureFin` time NOT NULL,
  `Club_id` int(11) NOT NULL,
  `EventClub_lieu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `EventRecur`
--

CREATE TABLE `EventRecur` (
  `EventRecur_id` int(11) NOT NULL,
  `EventRecur_typeRecur` varchar(100) NOT NULL,
  `EventClub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Image`
--

CREATE TABLE `Image` (
  `Image_id` int(11) NOT NULL,
  `Image_nom` varchar(255) NOT NULL,
  `Image_lien` varchar(255) NOT NULL,
  `Image_alt` varchar(255) DEFAULT NULL,
  `Image_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `imagearticle`
--

CREATE TABLE `imagearticle` (
  `imart_id` int(11) NOT NULL,
  `Image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `imart_ordre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ImageJournal`
--

CREATE TABLE `ImageJournal` (
  `ImageJournal_id` int(11) NOT NULL,
  `ImageJournal_Description` varchar(255) DEFAULT NULL,
  `Image_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `LogoClub`
--

CREATE TABLE `LogoClub` (
  `LogoClub_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL,
  `Image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `LogosEnt`
--

CREATE TABLE `LogosEnt` (
  `LogoEnt_id` int(11) NOT NULL,
  `Entreprise_id` int(11) NOT NULL,
  `Image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Master`
--

CREATE TABLE `Master` (
  `Master_id` int(11) NOT NULL,
  `Universite_id` int(11) NOT NULL,
  `Master_Nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `MembreDe`
--

CREATE TABLE `MembreDe` (
  `MembreDe_id` int(11) NOT NULL,
  `MembreDe_DateDebut` date DEFAULT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `MembreDe`
--

INSERT INTO `MembreDe` (`MembreDe_id`, `MembreDe_DateDebut`, `Eleve_id`, `Club_id`) VALUES
(1, NULL, 1, 1),
(2, NULL, 2, 1),
(3, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Motclef`
--

CREATE TABLE `Motclef` (
  `Motclef_id` int(11) NOT NULL,
  `Motclef_mot` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `OptionEI3`
--

CREATE TABLE `OptionEI3` (
  `OptionEI3_id` int(11) NOT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Option_1`
--

CREATE TABLE `Option_1` (
  `Option_id` int(11) NOT NULL,
  `Option_nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `otpionEI2`
--

CREATE TABLE `otpionEI2` (
  `OptionEI2_id` int(11) NOT NULL,
  `Option_id` int(11) NOT NULL,
  `Eleve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Pays`
--

CREATE TABLE `Pays` (
  `Pays_id` int(11) NOT NULL,
  `Pays_nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PhotoDP`
--

CREATE TABLE `PhotoDP` (
  `PhotoDP_id` int(11) NOT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PhotoEvent`
--

CREATE TABLE `PhotoEvent` (
  `PhotoEvent_id` int(11) NOT NULL,
  `EventClub_id` int(11) NOT NULL,
  `Image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Sponsors`
--

CREATE TABLE `Sponsors` (
  `Sponsor_id` int(11) NOT NULL,
  `Entreprise_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Stage`
--

CREATE TABLE `Stage` (
  `Stage_id` int(11) NOT NULL,
  `Stage_type` varchar(20) NOT NULL,
  `Stage_date` date DEFAULT NULL,
  `Eleve_id` int(11) NOT NULL,
  `Entreprise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `StageCesure`
--

CREATE TABLE `StageCesure` (
  `StageCesure_id` int(11) NOT NULL,
  `Cesure_id` int(11) NOT NULL,
  `Entreprise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Travail`
--

CREATE TABLE `Travail` (
  `Travail_id` int(11) NOT NULL,
  `Travail_poste` varchar(100) DEFAULT NULL,
  `Entreprise_id` int(11) NOT NULL,
  `Travail_anneeDebut` date NOT NULL,
  `Travail_anneeFin` date DEFAULT NULL,
  `Eleve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Universites`
--

CREATE TABLE `Universites` (
  `Universite_id` int(11) NOT NULL,
  `Universite_nom` varchar(100) NOT NULL,
  `Pays_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `clubs_article_fk` (`Club_id`),
  ADD KEY `eleves_article_fk` (`Eleve_id`);

--
-- Index pour la table `Cesure`
--
ALTER TABLE `Cesure`
  ADD PRIMARY KEY (`Cesure_id`),
  ADD KEY `eleves_cesure_fk` (`Eleve_id`);

--
-- Index pour la table `Clubs`
--
ALTER TABLE `Clubs`
  ADD PRIMARY KEY (`Club_id`);

--
-- Index pour la table `DoubleDiplmes`
--
ALTER TABLE `DoubleDiplmes`
  ADD PRIMARY KEY (`DD_id`),
  ADD KEY `master_doublediplômes_fk` (`Master_id`),
  ADD KEY `eleves_doublediplômes_fk` (`Eleve_id`);

--
-- Index pour la table `Eleves`
--
ALTER TABLE `Eleves`
  ADD PRIMARY KEY (`Eleve_id`);

--
-- Index pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  ADD PRIMARY KEY (`Entreprise_id`);

--
-- Index pour la table `EventBde`
--
ALTER TABLE `EventBde`
  ADD PRIMARY KEY (`EventBde_id`),
  ADD KEY `eventclub_eventbde_fk` (`EventClub_id`);

--
-- Index pour la table `EventClub`
--
ALTER TABLE `EventClub`
  ADD PRIMARY KEY (`EventClub_id`),
  ADD KEY `clubs_eventclub_fk` (`Club_id`);

--
-- Index pour la table `EventRecur`
--
ALTER TABLE `EventRecur`
  ADD PRIMARY KEY (`EventRecur_id`),
  ADD KEY `eventclub_eventrecur_fk` (`EventClub_id`);

--
-- Index pour la table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`Image_id`);

--
-- Index pour la table `imagearticle`
--
ALTER TABLE `imagearticle`
  ADD PRIMARY KEY (`imart_id`),
  ADD KEY `image_imagearticle_fk` (`Image_id`),
  ADD KEY `article_imagearticle_fk` (`article_id`);

--
-- Index pour la table `ImageJournal`
--
ALTER TABLE `ImageJournal`
  ADD PRIMARY KEY (`ImageJournal_id`),
  ADD KEY `image_imagejournal_fk` (`Image_id`),
  ADD KEY `clubs_imagejournal_fk` (`Club_id`);

--
-- Index pour la table `LogoClub`
--
ALTER TABLE `LogoClub`
  ADD PRIMARY KEY (`LogoClub_id`),
  ADD KEY `image_logoclub_fk` (`Image_id`),
  ADD KEY `clubs_logoclub_fk` (`Club_id`);

--
-- Index pour la table `LogosEnt`
--
ALTER TABLE `LogosEnt`
  ADD PRIMARY KEY (`LogoEnt_id`),
  ADD KEY `image_logosent_fk` (`Image_id`),
  ADD KEY `entreprise_logosent_fk` (`Entreprise_id`);

--
-- Index pour la table `Master`
--
ALTER TABLE `Master`
  ADD PRIMARY KEY (`Master_id`),
  ADD KEY `universites_master_fk` (`Universite_id`);

--
-- Index pour la table `MembreDe`
--
ALTER TABLE `MembreDe`
  ADD PRIMARY KEY (`MembreDe_id`),
  ADD KEY `clubs_membrede_fk` (`Club_id`),
  ADD KEY `eleves_membrede_fk` (`Eleve_id`);

--
-- Index pour la table `Motclef`
--
ALTER TABLE `Motclef`
  ADD PRIMARY KEY (`Motclef_id`);

--
-- Index pour la table `OptionEI3`
--
ALTER TABLE `OptionEI3`
  ADD PRIMARY KEY (`OptionEI3_id`),
  ADD KEY `option_optionei3_fk` (`Option_id`),
  ADD KEY `eleves_optionei3_fk` (`Eleve_id`);

--
-- Index pour la table `Option_1`
--
ALTER TABLE `Option_1`
  ADD PRIMARY KEY (`Option_id`);

--
-- Index pour la table `otpionEI2`
--
ALTER TABLE `otpionEI2`
  ADD PRIMARY KEY (`OptionEI2_id`),
  ADD KEY `option_otpionei2_fk` (`Option_id`),
  ADD KEY `eleves_otpionei2_fk` (`Eleve_id`);

--
-- Index pour la table `Pays`
--
ALTER TABLE `Pays`
  ADD PRIMARY KEY (`Pays_id`);

--
-- Index pour la table `PhotoDP`
--
ALTER TABLE `PhotoDP`
  ADD PRIMARY KEY (`PhotoDP_id`),
  ADD KEY `image_photodp_fk` (`Image_id`),
  ADD KEY `eleves_photodp_fk` (`Eleve_id`);

--
-- Index pour la table `PhotoEvent`
--
ALTER TABLE `PhotoEvent`
  ADD PRIMARY KEY (`PhotoEvent_id`),
  ADD KEY `image_photoevent_fk` (`Image_id`),
  ADD KEY `eventclub_photoevent_fk` (`EventClub_id`);

--
-- Index pour la table `Sponsors`
--
ALTER TABLE `Sponsors`
  ADD PRIMARY KEY (`Sponsor_id`),
  ADD KEY `clubs_sponsors_fk` (`Club_id`),
  ADD KEY `entreprise_sponsors_fk` (`Entreprise_id`);

--
-- Index pour la table `Stage`
--
ALTER TABLE `Stage`
  ADD PRIMARY KEY (`Stage_id`),
  ADD KEY `entreprise_stage_fk` (`Entreprise_id`),
  ADD KEY `eleves_stage_fk` (`Eleve_id`);

--
-- Index pour la table `StageCesure`
--
ALTER TABLE `StageCesure`
  ADD PRIMARY KEY (`StageCesure_id`),
  ADD KEY `entreprise_stagecesure_fk` (`Entreprise_id`),
  ADD KEY `cesure_stagecesure_fk` (`Cesure_id`);

--
-- Index pour la table `Travail`
--
ALTER TABLE `Travail`
  ADD PRIMARY KEY (`Travail_id`),
  ADD KEY `entreprise_travail_fk` (`Entreprise_id`),
  ADD KEY `eleves_travail_fk` (`Eleve_id`);

--
-- Index pour la table `Universites`
--
ALTER TABLE `Universites`
  ADD PRIMARY KEY (`Universite_id`),
  ADD KEY `pays_universites_fk` (`Pays_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Cesure`
--
ALTER TABLE `Cesure`
  MODIFY `Cesure_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Clubs`
--
ALTER TABLE `Clubs`
  MODIFY `Club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Eleves`
--
ALTER TABLE `Eleves`
  MODIFY `Eleve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  MODIFY `Entreprise_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `EventBde`
--
ALTER TABLE `EventBde`
  MODIFY `EventBde_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `EventClub`
--
ALTER TABLE `EventClub`
  MODIFY `EventClub_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `EventRecur`
--
ALTER TABLE `EventRecur`
  MODIFY `EventRecur_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `Image_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `imagearticle`
--
ALTER TABLE `imagearticle`
  MODIFY `imart_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ImageJournal`
--
ALTER TABLE `ImageJournal`
  MODIFY `ImageJournal_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `LogoClub`
--
ALTER TABLE `LogoClub`
  MODIFY `LogoClub_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `LogosEnt`
--
ALTER TABLE `LogosEnt`
  MODIFY `LogoEnt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Master`
--
ALTER TABLE `Master`
  MODIFY `Master_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `MembreDe`
--
ALTER TABLE `MembreDe`
  MODIFY `MembreDe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Motclef`
--
ALTER TABLE `Motclef`
  MODIFY `Motclef_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `OptionEI3`
--
ALTER TABLE `OptionEI3`
  MODIFY `OptionEI3_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Option_1`
--
ALTER TABLE `Option_1`
  MODIFY `Option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `otpionEI2`
--
ALTER TABLE `otpionEI2`
  MODIFY `OptionEI2_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Pays`
--
ALTER TABLE `Pays`
  MODIFY `Pays_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `PhotoDP`
--
ALTER TABLE `PhotoDP`
  MODIFY `PhotoDP_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `PhotoEvent`
--
ALTER TABLE `PhotoEvent`
  MODIFY `PhotoEvent_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Sponsors`
--
ALTER TABLE `Sponsors`
  MODIFY `Sponsor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Stage`
--
ALTER TABLE `Stage`
  MODIFY `Stage_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Travail`
--
ALTER TABLE `Travail`
  MODIFY `Travail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Universites`
--
ALTER TABLE `Universites`
  MODIFY `Universite_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `clubs_article_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `eleves_article_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Cesure`
--
ALTER TABLE `Cesure`
  ADD CONSTRAINT `eleves_cesure_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `DoubleDiplmes`
--
ALTER TABLE `DoubleDiplmes`
  ADD CONSTRAINT `eleves_doublediplômes_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `master_doublediplômes_fk` FOREIGN KEY (`Master_id`) REFERENCES `Master` (`Master_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `EventBde`
--
ALTER TABLE `EventBde`
  ADD CONSTRAINT `eventclub_eventbde_fk` FOREIGN KEY (`EventClub_id`) REFERENCES `EventClub` (`EventClub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `EventClub`
--
ALTER TABLE `EventClub`
  ADD CONSTRAINT `clubs_eventclub_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `EventRecur`
--
ALTER TABLE `EventRecur`
  ADD CONSTRAINT `eventclub_eventrecur_fk` FOREIGN KEY (`EventClub_id`) REFERENCES `EventClub` (`EventClub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `imagearticle`
--
ALTER TABLE `imagearticle`
  ADD CONSTRAINT `article_imagearticle_fk` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_imagearticle_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ImageJournal`
--
ALTER TABLE `ImageJournal`
  ADD CONSTRAINT `clubs_imagejournal_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_imagejournal_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `LogoClub`
--
ALTER TABLE `LogoClub`
  ADD CONSTRAINT `clubs_logoclub_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_logoclub_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `LogosEnt`
--
ALTER TABLE `LogosEnt`
  ADD CONSTRAINT `entreprise_logosent_fk` FOREIGN KEY (`Entreprise_id`) REFERENCES `Entreprise` (`Entreprise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_logosent_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Master`
--
ALTER TABLE `Master`
  ADD CONSTRAINT `universites_master_fk` FOREIGN KEY (`Universite_id`) REFERENCES `Universites` (`Universite_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `MembreDe`
--
ALTER TABLE `MembreDe`
  ADD CONSTRAINT `clubs_membrede_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `eleves_membrede_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `OptionEI3`
--
ALTER TABLE `OptionEI3`
  ADD CONSTRAINT `eleves_optionei3_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `option_optionei3_fk` FOREIGN KEY (`Option_id`) REFERENCES `Option_1` (`Option_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `otpionEI2`
--
ALTER TABLE `otpionEI2`
  ADD CONSTRAINT `eleves_otpionei2_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `option_otpionei2_fk` FOREIGN KEY (`Option_id`) REFERENCES `Option_1` (`Option_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `PhotoDP`
--
ALTER TABLE `PhotoDP`
  ADD CONSTRAINT `eleves_photodp_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_photodp_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `PhotoEvent`
--
ALTER TABLE `PhotoEvent`
  ADD CONSTRAINT `eventclub_photoevent_fk` FOREIGN KEY (`EventClub_id`) REFERENCES `EventClub` (`EventClub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `image_photoevent_fk` FOREIGN KEY (`Image_id`) REFERENCES `Image` (`Image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Sponsors`
--
ALTER TABLE `Sponsors`
  ADD CONSTRAINT `clubs_sponsors_fk` FOREIGN KEY (`Club_id`) REFERENCES `Clubs` (`Club_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entreprise_sponsors_fk` FOREIGN KEY (`Entreprise_id`) REFERENCES `Entreprise` (`Entreprise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Stage`
--
ALTER TABLE `Stage`
  ADD CONSTRAINT `eleves_stage_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entreprise_stage_fk` FOREIGN KEY (`Entreprise_id`) REFERENCES `Entreprise` (`Entreprise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `StageCesure`
--
ALTER TABLE `StageCesure`
  ADD CONSTRAINT `cesure_stagecesure_fk` FOREIGN KEY (`Cesure_id`) REFERENCES `Cesure` (`Cesure_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entreprise_stagecesure_fk` FOREIGN KEY (`Entreprise_id`) REFERENCES `Entreprise` (`Entreprise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Travail`
--
ALTER TABLE `Travail`
  ADD CONSTRAINT `eleves_travail_fk` FOREIGN KEY (`Eleve_id`) REFERENCES `Eleves` (`Eleve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entreprise_travail_fk` FOREIGN KEY (`Entreprise_id`) REFERENCES `Entreprise` (`Entreprise_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Universites`
--
ALTER TABLE `Universites`
  ADD CONSTRAINT `pays_universites_fk` FOREIGN KEY (`Pays_id`) REFERENCES `Pays` (`Pays_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
