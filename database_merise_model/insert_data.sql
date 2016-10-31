-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 29 Octobre 2016 à 15:15
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tournoi_bd`
--


--
-- Contenu de la table `tbl_users`
--

INSERT INTO `tbl_users` (`numero`, `email`, `password`, `nom_user`) VALUES
(1, 'psi@gmail.ch', '', 'psi'),
(2, 'john.doe@gmail.ch', '', 'john doe');





--
-- Contenu de la table `tbl_configuration`
--

INSERT INTO `tbl_configuration` (`numero`, `points_victoire`, `sets_a_la_place_de_buts`, `duree_match`, `aller_retour`) VALUES
(1, 3, 0, 15, 0),
(2, 3, 1, 12, 0);



--
-- Contenu de la table `tbl_tournois`
--

INSERT INTO `tbl_tournois` (`numero`, `nom_tournoi`, `date_debut`, `date_fin`, `num_tbl_users`, `num_tbl_configuration`) VALUES
(1, 'Villageois 2017', '2017-03-11 08:30:00', NULL, 1, 1),
(2, 'Tournoi romand 2017', '2017-05-20 09:00:00', '2017-05-21 16:00:00', 1, 1),
(3, 'six Pack beer', '2016-09-24 08:45:00', NULL, 2, 2);


--
-- Contenu de la table `tbl_terrains`
--

INSERT INTO `tbl_terrains` (`numero`, `libelle`, `num_tbl_tournois`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'A', 2),
(4, 'B', 2),
(5, 'C', 2),
(6, 'A', 3),
(7, 'B', 3);

--
-- Contenu de la table `tbl_groupes`
--

INSERT INTO `tbl_groupes` (`numero`, `libelle`, `num_tbl_tournois`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'A', 2),
(4, 'B', 2),
(5, 'A', 3),
(6, 'B', 3),
(7, 'C', 3),
(8, 'D', 3);




--
-- Contenu de la table `tbl_equipes`
--

INSERT INTO `tbl_equipes` (`numero`, `nom_equipe`, `nom_resp`, `prenom_resp`, `tel`, `mobile`, `email_resp`, `num_tbl_groupes`) VALUES
(1, 'Les poulets au curry', 'Doe', 'John', NULL, NULL, 'j.d@gmail.com', 1),
(2, 'Barbe-à-poils', 'Dupont', 'John', NULL, NULL, 'dupont@gmail.com', 1),
(3, 'Salt and pepper', 'Donald', '', NULL, NULL, 'Donaldd@gmail.com', 1),
(4, 'invicibles', 'Didier', 'John', NULL, NULL, 'didier@gmail.com', 1),
(5, 'Les verres pleins', 'Barras', 'Antoie', NULL, NULL, 'barras@gmail.com', 2),
(6, 'Barnab\'s', 'Venuti', 'Adrier', NULL, NULL, 'adrie @gmail.com', 2),
(7, 'Les glorius..', 'Ben\'Saucisson', 'Mo', NULL, NULL, 'Saucisson@gmail.com', 2),
(8, 'Les glorius le retour', 'Doe', 'John', NULL, NULL, 'Saucisson@gmail.com', 3),
(9, 'Bol de caf', 'Mina', 'Bill', NULL, NULL, 'mina@gmail.com', 3),
(10, 'Barbe-à-poils', 'Dupont', 'John', NULL, NULL, 'dupont@gmail.com', 4),
(11, 'Salt and pepper', 'Donald', '', NULL, NULL, 'Donaldd@gmail.com', 4),
(12, 'invicibles', 'Didier', 'John', NULL, NULL, 'didier@gmail.com', 4),
(13, 'Les verres pleins', 'Barras', 'Antoie', NULL, NULL, 'barras@gmail.com', 5),
(14, 'Barnab\'s', 'Venuti', 'Adrier', NULL, NULL, 'adrie @gmail.com', 5),
(15, 'Les glorius..', 'Ben\'Saucisson', 'Mo', NULL, NULL, 'Saucisson@gmail.com', 5),
(16, 'Les glorius le retour', 'Doe', 'John', NULL, NULL, 'Saucisson@gmail.com', 5),
(17, 'Bol de caf', 'Mina', 'Bill', NULL, NULL, 'mina@gmail.com', 5),
(18, 'Barbe-à-poils', 'Dupont', 'John', NULL, NULL, 'dupont@gmail.com', 6),
(19, 'Salt and pepper', 'Donald', '', NULL, NULL, 'Donaldd@gmail.com', 6),
(20, 'invicibles', 'Didier', 'John', NULL, NULL, 'didier@gmail.com', 6),
(21, 'Les verres vide', 'Malherbe', 'Antoine', NULL, NULL, 'barras@gmail.com', 7),
(22, 'Vieux mais encore...', 'Valdette', 'Adrien', NULL, NULL, 'valdette@gmail.com', 7),
(23, 'Stress under control', 'Paludy', 'Mickey', NULL, NULL, 'mickey@gmail.com', 7),
(24, 'Rouge et sang', 'Dorothy', 'Mariquis', NULL, NULL, 'marquis@gmail.com', 7),
(25, 'Surtout pour le pire', 'Jaccard', 'Jacques', NULL, NULL, 'jacky@gmail.com', 6),
(26, 'Dream team', 'Guigne', 'Maurice', NULL, NULL, 'guigne.maurice@gmail.com', 8),
(27, 'Insupportables', 'Bertriac', 'Jean', NULL, NULL, 'Bertriac@gmail.com', 8),
(28, 'Fondue chez moi', 'Patricks', 'Paul', NULL, NULL, 'Patricks@gmail.com', 8);




--
-- Contenu de la table `tbl_set_but`
--

INSERT INTO `tbl_set_but` (`numero`, `nb_pts_du_set`, `num_tbl_matchs`, `num_tbl_equipes`) VALUES
(1, NULL, 1, 1),
(2, NULL, 1, 2),
(3, NULL, 1, 1),
(4, NULL, 1, 2),
(5, NULL, 1, 1),
(6, NULL, 1, 2),
(7, NULL, 2, 3),
(8, NULL, 1, 2),
(9, NULL, 2, 3),
(10, NULL, 7, 3),
(11, NULL, 2, 4),
(12, NULL, 7, 3),
(13, NULL, 5, 2),
(14, NULL, 7, 3),
(15, NULL, 5, 2),
(16, NULL, 8, 2),
(17, NULL, 5, 3),
(18, NULL, 8, 2),
(19, NULL, 5, 3),
(20, NULL, 8, 4),
(21, NULL, 5, 2),
(22, NULL, 9, 6),
(23, NULL, 6, 5),
(24, NULL, 9, 7),
(25, NULL, 7, 3),
(26, NULL, 9, 7),
(27, NULL, 7, 3),
(28, NULL, 9, 6);



--
-- Contenu de la table `tbl_matchs`
--

INSERT INTO `tbl_matchs` (`numero`, `date_heure`, `num_tbl_equipes_arbitre`, `num_tbl_equipes_home`, `num_tbl_equipes_visiteur`, `num_tbl_terrains`) VALUES
(1, '2017-03-11 09:00:00', NULL, 1, 2, 1),
(2, '2017-03-11 09:00:00', NULL, 3, 4, 2),
(3, '2017-03-11 09:15:00', NULL, 5, 6, 1),
(4, '2017-03-11 09:30:00', NULL, 1, 4, 2),
(5, '2017-03-11 09:45:00', NULL, 2, 3, 1),
(6, '2017-03-11 09:45:00', NULL, 5, 7, 2),
(7, '2017-03-11 10:00:00', NULL, 1, 3, 1),
(8, '2017-03-11 10:15:00', NULL, 4, 2, 1),
(9, '2017-03-11 10:15:00', NULL, 6, 7, 2);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
