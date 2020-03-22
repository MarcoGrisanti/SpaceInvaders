-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Feb 23, 2017 alle 12:53
-- Versione del Server: 10.1.16-MariaDB
-- Versione PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Progetto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Continente`
--

CREATE TABLE `Continente` (
  `IDContinente` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Continente`
--

INSERT INTO `Continente` (`IDContinente`, `Nome`) VALUES
(1, 'Europa');

-- --------------------------------------------------------

--
-- Struttura della tabella `Nazione`
--

CREATE TABLE `Nazione` (
  `IDNazione` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `KSContinente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Nazione`
--

INSERT INTO `Nazione` (`IDNazione`, `Nome`, `KSContinente`) VALUES
(1, 'Italia', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Partita`
--

CREATE TABLE `Partita` (
  `IDPartita` int(11) NOT NULL,
  `IDUtente` varchar(45) NOT NULL,
  `Punteggio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `Provincia`
--

CREATE TABLE `Provincia` (
  `IDProvincia` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `KSRegione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Provincia`
--

INSERT INTO `Provincia` (`IDProvincia`, `Nome`, `KSRegione`) VALUES
(1, 'Agrigento', 15),
(2, 'Alessandria', 2),
(3, 'Ancona', 8),
(4, 'Arezzo', 9),
(5, 'Ascoli Piceno', 8),
(6, 'Asti', 2),
(7, 'Avellino', 11),
(8, 'Bari', 13),
(9, 'Barletta-Andria-Trani', 13),
(10, 'Belluno', 6),
(11, 'Benevento', 11),
(12, 'Bergamo', 3),
(13, 'Biella', 2),
(14, 'Bologna', 5),
(15, 'Bolzano', 18),
(16, 'Brescia', 3),
(17, 'Brindisi', 13),
(18, 'Cagliari', 16),
(19, 'Caltanissetta', 15),
(20, 'Campobasso', 12),
(21, 'Carbonia-Iglesias', 16),
(22, 'Caserta', 11),
(23, 'Catania', 15),
(24, 'Catanzaro', 14),
(25, 'Chieti', 17),
(26, 'Como', 3),
(27, 'Cosenza', 14),
(28, 'Cremona', 3),
(29, 'Crotone', 14),
(30, 'Cuneo', 2),
(31, 'Enna', 15),
(32, 'Fermo', 8),
(33, 'Ferrara', 5),
(34, 'Firenze', 9),
(35, 'Foggia', 13),
(36, 'Forlì-Cesena', 5),
(37, 'Frosinone', 10),
(38, 'Genova', 4),
(39, 'Gorizia', 7),
(40, 'Grosseto', 9),
(41, 'Imperia', 4),
(42, 'Isernia', 12),
(43, 'L''Aquila', 17),
(44, 'La Spezia', 4),
(45, 'Latina', 10),
(46, 'Lecce', 13),
(47, 'Lecco', 3),
(48, 'Livorno', 9),
(49, 'Lodi', 3),
(50, 'Lucca', 9),
(51, 'Macerata', 8),
(52, 'Mantova', 3),
(53, 'Massa e Carrara', 9),
(54, 'Matera', 19),
(55, 'Medio Campidano', 16),
(56, 'Messina', 15),
(57, 'Milano', 3),
(58, 'Modena', 5),
(59, 'Monza e Brianza', 3),
(60, 'Napoli', 11),
(61, 'Novara', 2),
(62, 'Nuoro', 16),
(63, 'Ogliastra', 16),
(64, 'Olbia-Tempio', 16),
(65, 'Oristano', 16),
(66, 'Padova', 6),
(67, 'Palermo', 15),
(68, 'Parma', 5),
(69, 'Pavia', 3),
(70, 'Perugia', 20),
(71, 'Pesaro e Urbino', 8),
(72, 'Pescara', 17),
(73, 'Piacenza', 5),
(74, 'Pisa', 9),
(75, 'Pistoia', 9),
(76, 'Pordenone', 7),
(77, 'Potenza', 19),
(78, 'Prato', 9),
(79, 'Ragusa', 15),
(80, 'Ravenna', 5),
(81, 'Reggio Calabria (Metropolitana)', 14),
(82, 'Reggio Emilia', 5),
(83, 'Rieti', 10),
(84, 'Rimini', 5),
(85, 'Roma', 10),
(86, 'Rovigo', 6),
(87, 'Salerno', 11),
(88, 'Sassari', 16),
(89, 'Savona', 4),
(90, 'Siena', 9),
(91, 'Siracusa', 15),
(92, 'Sondrio', 3),
(93, 'Taranto', 13),
(94, 'Teramo', 17),
(95, 'Terni', 20),
(96, 'Torino', 2),
(97, 'Trapani', 15),
(98, 'Trento', 18),
(99, 'Treviso', 6),
(100, 'Trieste', 7),
(101, 'Udine', 7),
(102, 'Aosta', 1),
(103, 'Varese', 3),
(104, 'Venezia', 6),
(105, 'Verbano-Cusio-Ossola', 2),
(106, 'Vercelli', 2),
(107, 'Verona', 6),
(108, 'Vibo Valentia', 14),
(109, 'Vicenza', 6),
(110, 'Viterbo', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `Regione`
--

CREATE TABLE `Regione` (
  `IDRegione` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `KSNazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Regione`
--

INSERT INTO `Regione` (`IDRegione`, `Nome`, `KSNazione`) VALUES
(1, 'Valle Aosta', 1),
(2, 'Piemonte', 1),
(3, 'Lombardia', 1),
(4, 'Liguria', 1),
(5, 'Emilia Romagna', 1),
(6, 'Veneto', 1),
(7, 'Friuli Venezia Giulia', 1),
(8, 'Marche', 1),
(9, 'Toscana', 1),
(10, 'Lazio', 1),
(11, 'Campania', 1),
(12, 'Molise', 1),
(13, 'Puglia', 1),
(14, 'Calabria', 1),
(15, 'Sicilia', 1),
(16, 'Sardegna', 1),
(17, 'Abruzzo', 1),
(18, 'Trentino Alto Adige', 1),
(19, 'Basilicata', 1),
(20, 'Umbria', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `IDUtente` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `KSProvincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Utente`
--

INSERT INTO `Utente` (`IDUtente`, `Nome`, `Cognome`, `Email`, `Password`, `KSProvincia`) VALUES
('Marco', 'Marco', 'Grisanti', 'Marco1997Grisanti@Gmail.Com', '81dc9bdb52d04dc20036dbd8313ed055', 23),
('Marco0', 'Marco', 'Grisanti', 'Temp', '81dc9bdb52d04dc20036dbd8313ed055', 23);

-- --------------------------------------------------------

--
-- Struttura della tabella `UtentiAmici`
--

CREATE TABLE `UtentiAmici` (
  `IDAmicizia` int(11) NOT NULL,
  `KSUtente1` varchar(45) NOT NULL,
  `KSUtente2` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Continente`
--
ALTER TABLE `Continente`
  ADD PRIMARY KEY (`IDContinente`);

--
-- Indici per le tabelle `Nazione`
--
ALTER TABLE `Nazione`
  ADD PRIMARY KEY (`IDNazione`);

--
-- Indici per le tabelle `Partita`
--
ALTER TABLE `Partita`
  ADD PRIMARY KEY (`IDPartita`);

--
-- Indici per le tabelle `Provincia`
--
ALTER TABLE `Provincia`
  ADD PRIMARY KEY (`IDProvincia`);

--
-- Indici per le tabelle `Regione`
--
ALTER TABLE `Regione`
  ADD PRIMARY KEY (`IDRegione`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`IDUtente`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`),
  ADD UNIQUE KEY `IDUtente_UNIQUE` (`IDUtente`);

--
-- Indici per le tabelle `UtentiAmici`
--
ALTER TABLE `UtentiAmici`
  ADD PRIMARY KEY (`IDAmicizia`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Continente`
--
ALTER TABLE `Continente`
  MODIFY `IDContinente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `Nazione`
--
ALTER TABLE `Nazione`
  MODIFY `IDNazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `Partita`
--
ALTER TABLE `Partita`
  MODIFY `IDPartita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `Provincia`
--
ALTER TABLE `Provincia`
  MODIFY `IDProvincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT per la tabella `Regione`
--
ALTER TABLE `Regione`
  MODIFY `IDRegione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `UtentiAmici`
--
ALTER TABLE `UtentiAmici`
  MODIFY `IDAmicizia` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;