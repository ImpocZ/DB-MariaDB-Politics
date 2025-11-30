-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Ned 30. lis 2025, 17:34
-- Verze serveru: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- Verze PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `politics`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `government`
--

CREATE TABLE `government` (
  `in_function` date NOT NULL,
  `prime_minister` varchar(50) NOT NULL,
  `id_government` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `government`
--

INSERT INTO `government` (`in_function`, `prime_minister`, `id_government`) VALUES
('2010-07-28', 'Petr Nečas', 1),
('2013-10-06', 'Jiří Rusnok', 2),
('2014-01-29', 'Bohuslav Sobotka', 3),
('2017-12-13', 'Andrej Babiš', 4),
('2018-06-27', 'Andrej Babiš', 5),
('2021-12-17', 'Petr Fiala', 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `government_official`
--

CREATE TABLE `government_official` (
  `id_government` int(11) NOT NULL,
  `id_politician` int(11) NOT NULL,
  `id_party` int(11) DEFAULT NULL,
  `id_office` int(11) NOT NULL,
  `role` enum('Minister','Speaker of the house','Deputy','Deputy speaker','Prime minister') DEFAULT NULL,
  `start_of_term` date NOT NULL,
  `end_of_term` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `government_official`
--

INSERT INTO `government_official` (`id_government`, `id_politician`, `id_party`, `id_office`, `role`, `start_of_term`, `end_of_term`) VALUES
(3, 1, 2, 5, 'Minister', '2014-01-29', '2017-12-13'),
(3, 1, 2, 15, 'Deputy', '2014-01-29', '2017-12-13'),
(4, 1, 2, 15, 'Prime minister', '2017-12-06', '2018-06-27'),
(5, 1, 2, 15, 'Prime minister', '2018-06-06', '2021-12-17'),
(1, 2, NULL, 11, 'Minister', '2012-06-02', '2013-07-10'),
(6, 2, 1, 15, 'Prime minister', '2021-11-28', NULL),
(4, 5, NULL, 5, 'Minister', '2017-12-13', '2018-06-27'),
(5, 5, 2, 5, 'Minister', '2018-06-27', '2021-12-17'),
(5, 6, 2, 1, 'Minister', '2018-06-27', '2021-12-17'),
(5, 6, 2, 9, 'Minister', '2019-04-30', '2021-12-17'),
(5, 6, 2, 10, 'Minister', '2020-01-24', '2021-12-17'),
(6, 7, 4, 1, 'Minister', '2021-12-17', NULL),
(6, 8, 5, 8, 'Minister', '2021-12-17', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `government_party`
--

CREATE TABLE `government_party` (
  `id_party` int(11) NOT NULL,
  `id_government` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `government_party`
--

INSERT INTO `government_party` (`id_party`, `id_government`) VALUES
(1, 1),
(6, 1),
(7, 2),
(2, 3),
(7, 3),
(10, 3),
(2, 4),
(2, 5),
(10, 5),
(1, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `office`
--

CREATE TABLE `office` (
  `id_office` int(11) NOT NULL,
  `name_of_office` varchar(200) NOT NULL,
  `description_of_office` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `office`
--

INSERT INTO `office` (`id_office`, `name_of_office`, `description_of_office`) VALUES
(1, 'Ministerstvo vnitra', NULL),
(2, 'Ministerstvo práce a sociálních věcí', NULL),
(3, 'Ministerstvo pro místní rozvoj', NULL),
(4, 'Ministerstvo zdravotnictví', NULL),
(5, 'Ministerstvo financí', NULL),
(6, 'Ministerstvo obrany', NULL),
(7, 'Ministerstvo spravedlnosti', NULL),
(8, 'Ministerstvo zahraničních věcí', NULL),
(9, 'Ministerstvo průmyslu a obchodu', NULL),
(10, 'Ministerstvo dopravy', NULL),
(11, 'Ministerstvo školství, mládeže a tělovýchovy', NULL),
(12, 'Ministerstvo zemědělství', NULL),
(13, 'Ministerstvo životního prostředí', NULL),
(14, 'Ministerstvo kultury', NULL),
(15, 'Vláda', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `party`
--

CREATE TABLE `party` (
  `id_party` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `founding` int(4) UNSIGNED NOT NULL,
  `leader` varchar(75) NOT NULL,
  `photo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `party`
--

INSERT INTO `party` (`id_party`, `name`, `founding`, `leader`, `photo`) VALUES
(1, 'Občasnká demokratická strana', 1991, 'Petr Fiala', NULL),
(2, 'ANO 2011', 2012, 'Andrej Babiš', NULL),
(3, 'Strana přímé demokracie', 2015, 'Tomio Okamura', NULL),
(4, 'STAROSTOVÉ A NEZÁVISLÍ', 2004, 'Vít Rakušan', NULL),
(5, 'Česká pirátská strana', 2009, 'Zdeněk Hřib', NULL),
(6, 'TOP-09', 2009, 'Matěj Ondřej Havel', NULL),
(7, 'KDU-ČSL', 1919, 'Marek Výborný', NULL),
(8, 'Motoristé sobě', 2017, 'Petr Macinka', NULL),
(9, 'Komunistická strana Čech a Moravy', 1990, 'Kateřina Konečná', NULL),
(10, 'SOC-DEM', 1893, 'Jana Maláčová', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `politician`
--

CREATE TABLE `politician` (
  `id_politician` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `title` set('MUDr.','JUDr.','Ing.','PhDr.','ThDr.','Mgr.','Bc.') DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `politician`
--

INSERT INTO `politician` (`id_politician`, `name`, `surname`, `title`, `photo`, `age`) VALUES
(1, 'Andrej', 'Babiš', 'Ing.', NULL, 71),
(2, 'Petr', 'Fiala', 'PhDr.', NULL, 61),
(3, 'Filip', 'Turek', 'Mgr.', NULL, 40),
(4, 'Tomio', 'Okamura', NULL, NULL, 53),
(5, 'Alena', 'Schillerová', 'JUDr.', NULL, 61),
(6, 'Karel', 'Havlíček', 'Ing.', NULL, 56),
(7, 'Vít', 'Rakušan', 'Mgr.', NULL, 47),
(8, 'Jan', 'Lipavský', 'Bc.', NULL, 40);

-- --------------------------------------------------------

--
-- Struktura tabulky `politics_party`
--

CREATE TABLE `politics_party` (
  `id_politician` int(11) NOT NULL,
  `id_party` int(11) NOT NULL,
  `start_of_membership` date NOT NULL,
  `end_of_membership` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `politics_party`
--

INSERT INTO `politics_party` (`id_politician`, `id_party`, `start_of_membership`, `end_of_membership`) VALUES
(1, 2, '2012-08-01', NULL),
(2, 1, '2011-07-31', NULL),
(3, 8, '2024-12-07', NULL),
(4, 3, '2015-08-04', NULL),
(5, 2, '2021-10-09', NULL),
(6, 2, '2021-10-09', NULL),
(7, 4, '2015-01-01', NULL),
(8, 1, '2025-01-01', NULL),
(8, 5, '2015-01-01', '2024-10-04');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `government`
--
ALTER TABLE `government`
  ADD PRIMARY KEY (`id_government`),
  ADD UNIQUE KEY `in_function` (`in_function`),
  ADD KEY `government_index_4` (`in_function`),
  ADD KEY `prime_minister` (`prime_minister`) USING BTREE;

--
-- Indexy pro tabulku `government_official`
--
ALTER TABLE `government_official`
  ADD PRIMARY KEY (`id_politician`,`id_government`,`id_office`),
  ADD KEY `government_official_index_8` (`id_party`),
  ADD KEY `government_official_index_9` (`start_of_term`),
  ADD KEY `government_official_index_10` (`end_of_term`),
  ADD KEY `government_official_index_11` (`role`),
  ADD KEY `id_government` (`id_government`),
  ADD KEY `id_office` (`id_office`);

--
-- Indexy pro tabulku `government_party`
--
ALTER TABLE `government_party`
  ADD PRIMARY KEY (`id_government`,`id_party`),
  ADD KEY `id_party` (`id_party`);

--
-- Indexy pro tabulku `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id_office`),
  ADD UNIQUE KEY `office_index_12` (`name_of_office`);

--
-- Indexy pro tabulku `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`id_party`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `party_index_5` (`name`),
  ADD KEY `party_index_6` (`leader`),
  ADD KEY `party_index_7` (`founding`);

--
-- Indexy pro tabulku `politician`
--
ALTER TABLE `politician`
  ADD PRIMARY KEY (`id_politician`),
  ADD KEY `politician_index_0` (`name`,`surname`),
  ADD KEY `politician_index_1` (`title`),
  ADD KEY `politician_index_2` (`age`);

--
-- Indexy pro tabulku `politics_party`
--
ALTER TABLE `politics_party`
  ADD PRIMARY KEY (`id_politician`,`id_party`),
  ADD KEY `politics_party_index_13` (`start_of_membership`),
  ADD KEY `politics_party_index_14` (`end_of_membership`),
  ADD KEY `id_party` (`id_party`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `government`
--
ALTER TABLE `government`
  MODIFY `id_government` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `office`
--
ALTER TABLE `office`
  MODIFY `id_office` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pro tabulku `party`
--
ALTER TABLE `party`
  MODIFY `id_party` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pro tabulku `politician`
--
ALTER TABLE `politician`
  MODIFY `id_politician` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `government_official`
--
ALTER TABLE `government_official`
  ADD CONSTRAINT `government_official_ibfk_1` FOREIGN KEY (`id_government`) REFERENCES `government` (`id_government`),
  ADD CONSTRAINT `government_official_ibfk_2` FOREIGN KEY (`id_politician`) REFERENCES `politician` (`id_politician`),
  ADD CONSTRAINT `government_official_ibfk_3` FOREIGN KEY (`id_party`) REFERENCES `party` (`id_party`),
  ADD CONSTRAINT `government_official_ibfk_4` FOREIGN KEY (`id_office`) REFERENCES `office` (`id_office`);

--
-- Omezení pro tabulku `government_party`
--
ALTER TABLE `government_party`
  ADD CONSTRAINT `government_party_ibfk_1` FOREIGN KEY (`id_party`) REFERENCES `party` (`id_party`),
  ADD CONSTRAINT `government_party_ibfk_2` FOREIGN KEY (`id_government`) REFERENCES `government` (`id_government`);

--
-- Omezení pro tabulku `politics_party`
--
ALTER TABLE `politics_party`
  ADD CONSTRAINT `politics_party_ibfk_1` FOREIGN KEY (`id_politician`) REFERENCES `politician` (`id_politician`),
  ADD CONSTRAINT `politics_party_ibfk_2` FOREIGN KEY (`id_party`) REFERENCES `party` (`id_party`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
