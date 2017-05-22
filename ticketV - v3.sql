-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2017 at 10:09 AM
-- Server version: 5.6.33
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `TicketV`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire_ticket`
--

CREATE TABLE `commentaire_ticket` (
  `id_commentaire_ticket` int(11) NOT NULL,
  `ticket_id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `commentaire_ticket`
--

INSERT INTO `commentaire_ticket` (`id_commentaire_ticket`, `ticket_id_ticket`, `id_utilisateur`, `type`, `date`, `remarque`) VALUES
(1, 2, 1, NULL, '2017-04-13 15:29:17', 'Ceci est un second commentaire'),
(2, 2, 1, NULL, '2017-04-13 14:15:54', 'Premier commentaire pour test'),
(9, 2, 1, NULL, '2017-04-13 14:08:14', 'Modification du ticket.'),
(10, 2, 1, NULL, '2017-04-24 07:26:36', '<p>Ceci est un troisième commentaire</p>'),
(11, 2, 1, NULL, '2017-04-24 07:36:16', '<p>ceci est un joli com</p>'),
(12, 2, 1, NULL, '2017-05-05 14:30:22', '<p>ceci est un PUTAIn de test</p>'),
(13, 2, 1, NULL, '2017-05-05 14:36:17', '<p>efzregrg</p>'),
(14, 2, 1, NULL, '2017-05-22 08:03:15', 'dernier test en date');

-- --------------------------------------------------------

--
-- Table structure for table `degre_importance`
--

CREATE TABLE `degre_importance` (
  `id_degre_importance` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `degre_importance`
--

INSERT INTO `degre_importance` (`id_degre_importance`, `libelle`, `actif`) VALUES
(1, 'Important', 1),
(2, 'Urgent', 1),
(3, 'Mineur', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(0, 'Mathieu', 'mathieu', 'mathieu.koenig@centralfinances.fr', 'mathieu.koenig@centralfinances.fr', 1, NULL, '$2y$13$uIxI3YtRbVtRqTdxG7Ufk.oAHwWQ6pZ5hnmGkN4KL2dW8qOQykw8y', '2017-04-21 12:35:03', NULL, NULL, 'a:0:{}'),
(1, 'Adrien', 'adrien', 'adriball.dev@gmail.com', 'adriball.dev@gmail.com', 1, NULL, '$2y$13$Xyy/syOkSeNJiW39sg1WNuiY4FKDAT3jASMVEWC6riRoS51DyAqFG', '2017-05-22 07:41:46', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `mise_a_jour`
--

CREATE TABLE `mise_a_jour` (
  `id_mise_a_jour` int(11) NOT NULL,
  `remarque` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effectue` tinyint(4) DEFAULT '0',
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mise_a_jour`
--

INSERT INTO `mise_a_jour` (`id_mise_a_jour`, `remarque`, `date`, `version`, `effectue`, `id_projet`) VALUES
(2, 'Test', '2017-04-10 06:02:00', 'Maverick', 0, 7),
(3, 'Test testvzevze', '2012-01-01 00:00:00', 'Snow Leopard', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `plage_travail`
--

CREATE TABLE `plage_travail` (
  `id_plage` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `remarque` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plage_travail`
--

INSERT INTO `plage_travail` (`id_plage`, `id_ticket`, `id_utilisateur`, `date_debut`, `date_fin`, `remarque`) VALUES
(11, 2, 1, '2017-04-25 16:53:00', '2017-04-25 16:53:00', NULL),
(12, 2, 1, '2017-04-25 17:05:00', '2017-04-25 17:05:00', 'efrzbrgfz');

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id_projet`, `libelle`, `actif`) VALUES
(7, 'Projet TicketV', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projet_utilisateur`
--

CREATE TABLE `projet_utilisateur` (
  `id_projet` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projet_utilisateur`
--

INSERT INTO `projet_utilisateur` (`id_projet`, `id_utilisateur`) VALUES
(7, 0),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0',
  `clos` tinyint(4) DEFAULT '0',
  `couleur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle`, `actif`, `clos`, `couleur`) VALUES
(1, 'En cours', 1, 0, '#3bd731'),
(2, 'En Test', 1, 0, '#2963ba'),
(3, 'Planifié', 1, 0, '#ba55ad'),
(4, 'Sans suite', 1, 0, '#a29a09'),
(5, 'Non revu', 1, 0, '#ffffff'),
(6, 'Clos', 1, 1, '#cc1915');

-- --------------------------------------------------------

--
-- Table structure for table `suivi_ticket`
--

CREATE TABLE `suivi_ticket` (
  `id_suivi_ticket` int(11) NOT NULL,
  `id_statut` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suivi_ticket`
--

INSERT INTO `suivi_ticket` (`id_suivi_ticket`, `id_statut`, `id_ticket`, `id_utilisateur`, `date`, `remarque`) VALUES
(2, 1, 2, 1, '2017-04-04 13:05:36', 'Création du ticket du ticket.'),
(3, 2, 3, 1, '2017-04-04 14:32:50', 'Création du ticket du ticket.'),
(4, 3, 4, 1, '2017-04-04 14:33:13', 'Création du ticket du ticket.'),
(5, 1, 5, 1, '2017-04-04 14:33:36', 'Création du ticket du ticket.'),
(6, 1, 6, 1, '2017-04-04 14:33:50', 'Création du ticket du ticket.'),
(7, 3, 7, 1, '2017-04-04 14:34:03', 'Création du ticket du ticket.'),
(8, 4, 8, 1, '2017-04-04 14:35:00', 'Création du ticket du ticket.'),
(9, 4, 9, 1, '2017-04-05 16:19:31', 'Création du ticket du ticket.'),
(10, 5, 10, 1, '2017-04-05 16:19:47', 'Création du ticket du ticket.'),
(11, 6, 2, 1, '2017-04-07 17:42:31', 'Modification du ticket.'),
(12, 6, 2, 1, '2017-04-11 07:37:39', 'Modification du ticket.'),
(13, 6, 2, 1, '2017-04-11 11:58:21', 'Modification du ticket.'),
(14, 6, 2, 1, '2017-04-11 12:21:16', 'Modification du ticket.'),
(15, 6, 2, 1, '2017-04-11 12:21:24', 'Modification du ticket.'),
(16, 6, 2, 1, '2017-04-12 14:51:09', 'Modification du ticket.'),
(17, 6, 2, 1, '2017-04-13 13:46:57', 'Modification du ticket.'),
(18, 1, 11, 1, '2017-04-14 12:16:57', 'Création du ticket du ticket.'),
(20, 1, 13, 1, '2017-04-14 12:17:23', 'Création du ticket du ticket.'),
(21, 6, 2, 1, '2017-04-21 12:27:18', 'Modification du ticket.'),
(22, 6, 2, 1, '2017-04-21 12:42:17', 'Modification du ticket.'),
(23, 6, 2, 1, '2017-04-21 12:46:04', 'Modification du ticket.'),
(24, 6, 2, 1, '2017-04-21 12:56:41', 'Modification du ticket.'),
(25, 6, 2, 1, '2017-04-21 13:00:46', 'Modification du ticket.'),
(26, 6, 2, 1, '2017-04-21 13:06:55', 'Modification du ticket.'),
(27, 6, 2, 1, '2017-04-21 13:08:47', 'Modification du ticket.'),
(28, 6, 2, 1, '2017-04-24 07:21:05', 'Modification du ticket.'),
(29, 6, 2, 1, '2017-04-24 07:26:43', 'Modification du ticket.'),
(30, 6, 2, 1, '2017-04-24 07:35:59', 'Modification du ticket.'),
(31, 3, 4, 1, '2017-04-27 12:14:13', 'Modification du ticket.'),
(32, 2, 3, 1, '2017-05-04 09:57:13', 'Modification du ticket.'),
(33, 2, 3, 1, '2017-05-04 09:57:36', 'Modification du ticket.'),
(34, 2, 3, 1, '2017-05-04 09:58:18', 'Modification du ticket.'),
(35, 2, 3, 1, '2017-05-05 14:08:17', 'Modification du ticket.');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id_tag`, `libelle`, `actif`) VALUES
(1, 'Développement', 1),
(2, 'Test', 1),
(3, 'Support', 1),
(4, 'Maintenance', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_degre_importance` int(11) DEFAULT NULL,
  `id_projet` int(11) DEFAULT NULL,
  `id_statut` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `id_mise_a_jour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_degre_importance`, `id_projet`, `id_statut`, `libelle`, `description`, `id_mise_a_jour`) VALUES
(2, 2, 7, 6, 'Ticket 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 2),
(3, 1, 7, 2, 'Ticket 2', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', 2),
(4, 1, 7, 3, 'Ticket 3', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', NULL),
(5, 2, 7, 1, 'Ticket 4', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', NULL),
(6, 1, 7, 1, 'Ticket 5', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', NULL),
(7, 1, 7, 3, 'Ticket 6', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', NULL),
(8, 1, 7, 4, 'Ticket 7', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L\'avantage du Lorem Ipsum sur un texte générique comme \'Du texte. Du texte. Du texte.\' est qu\'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour \'Lorem Ipsum\' vous conduira vers de nombreux sites qui n\'en sont encore qu\'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d\'y rajouter de petits clins d\'oeil, voire des phrases embarassantes).', NULL),
(9, 1, 7, 4, 'Ticket 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(10, 1, 7, 5, 'Ticket 8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(11, 1, 7, 1, 'Ticket 10', 'dazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafaf\r\ndazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafaf\r\ndazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafaf\r\ndazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafaf\r\ndazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdaazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafafdazazdfafaf', NULL),
(13, 1, 7, 1, 'Ticket 12', 'Test 12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_has_mise_a_jour`
--

CREATE TABLE `ticket_has_mise_a_jour` (
  `id_ticket` int(11) NOT NULL,
  `id_mise_a_jour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `ticket_id_ticket` int(11) NOT NULL,
  `tags_id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_tags`
--

INSERT INTO `ticket_tags` (`ticket_id_ticket`, `tags_id_tag`) VALUES
(2, 1),
(4, 1),
(5, 1),
(7, 1),
(10, 1),
(13, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(8, 2),
(9, 2),
(11, 2),
(3, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(13, 3),
(6, 4),
(11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_utilisateur`
--

CREATE TABLE `ticket_utilisateur` (
  `id_ticket` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_utilisateur`
--

INSERT INTO `ticket_utilisateur` (`id_ticket`, `id_utilisateur`) VALUES
(3, 0),
(4, 0),
(3, 1),
(4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD PRIMARY KEY (`id_commentaire_ticket`),
  ADD KEY `ticket_id_ticket` (`ticket_id_ticket`);

--
-- Indexes for table `degre_importance`
--
ALTER TABLE `degre_importance`
  ADD PRIMARY KEY (`id_degre_importance`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD PRIMARY KEY (`id_mise_a_jour`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD PRIMARY KEY (`id_plage`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`);

--
-- Indexes for table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD PRIMARY KEY (`id_projet`,`id_utilisateur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Indexes for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  ADD PRIMARY KEY (`id_suivi_ticket`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_degre_importance` (`id_degre_importance`),
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_mise_a_jour` (`id_mise_a_jour`);

--
-- Indexes for table `ticket_has_mise_a_jour`
--
ALTER TABLE `ticket_has_mise_a_jour`
  ADD PRIMARY KEY (`id_ticket`,`id_mise_a_jour`),
  ADD KEY `id_mise_a_jour` (`id_mise_a_jour`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`ticket_id_ticket`,`tags_id_tag`),
  ADD KEY `tags_id_tag` (`tags_id_tag`);

--
-- Indexes for table `ticket_utilisateur`
--
ALTER TABLE `ticket_utilisateur`
  ADD PRIMARY KEY (`id_ticket`,`id_utilisateur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  MODIFY `id_commentaire_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `degre_importance`
--
ALTER TABLE `degre_importance`
  MODIFY `id_degre_importance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  MODIFY `id_mise_a_jour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `plage_travail`
--
ALTER TABLE `plage_travail`
  MODIFY `id_plage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  MODIFY `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD CONSTRAINT `commentaire_ticket_ibfk_1` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Constraints for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD CONSTRAINT `mise_a_jour_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`);

--
-- Constraints for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD CONSTRAINT `plage_travail_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `plage_travail_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD CONSTRAINT `projet_utilisateur_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `projet_utilisateur_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  ADD CONSTRAINT `suivi_ticket_ibfk_1` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`),
  ADD CONSTRAINT `suivi_ticket_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `suivi_ticket_ibfk_3` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_degre_importance`) REFERENCES `degre_importance` (`id_degre_importance`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_mise_a_jour`) REFERENCES `mise_a_jour` (`id_mise_a_jour`);

--
-- Constraints for table `ticket_has_mise_a_jour`
--
ALTER TABLE `ticket_has_mise_a_jour`
  ADD CONSTRAINT `ticket_has_mise_a_jour_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `ticket_has_mise_a_jour_ibfk_2` FOREIGN KEY (`id_mise_a_jour`) REFERENCES `mise_a_jour` (`id_mise_a_jour`);

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `ticket_tags_ibfk_1` FOREIGN KEY (`tags_id_tag`) REFERENCES `tags` (`id_tag`),
  ADD CONSTRAINT `ticket_tags_ibfk_2` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Constraints for table `ticket_utilisateur`
--
ALTER TABLE `ticket_utilisateur`
  ADD CONSTRAINT `ticket_utilisateur_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `ticket_utilisateur_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);
