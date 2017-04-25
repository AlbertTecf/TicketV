-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2017 at 05:10 PM
-- Server version: 5.6.33
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `TicketV`
--

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
(11, 2, NULL, '2017-04-25 16:53:00', '2017-04-25 16:53:00', NULL),
(12, 2, 1, '2017-04-25 17:05:00', '2017-04-25 17:05:00', 'efrzbrgfz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD PRIMARY KEY (`id_plage`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plage_travail`
--
ALTER TABLE `plage_travail`
  MODIFY `id_plage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD CONSTRAINT `plage_travail_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `plage_travail_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);
