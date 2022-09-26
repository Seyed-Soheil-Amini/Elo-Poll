-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2022 at 12:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `company` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  `rate` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`ID`, `name`, `company`, `stock`, `rate`) VALUES
(3, 'Watch', 'Laros', 75, -11),
(4, 'Camera', 'Amazon', 120, -26.52),
(5, 'Spiner', 'Sololearn', 25, 17.09),
(6, 'Phone', 'GLX', 58, 10.71),
(7, 'Shoes', 'Irra', 125, 13.08),
(8, 'Laptop', 'Lenovo', 100, -11.33),
(9, 'Lan Cable', 'Internat', 80, -14.91),
(10, 'Microphone', 'Yamaha', 115, 9.72),
(11, 'T-Shirt', 'Quera', 200, 18.11),
(12, 'Power bank', 'LG', 120, 11.84),
(13, 'Pixel', 'Microsoft', 235, 26.73),
(14, 'IPone', 'Apple', 45, 20.55),
(15, 'Ball', 'Mikasa', 40, 24.41),
(16, 'Alexa', 'Amazon', 120, 2.97),
(17, 'Ambrella', 'Dino', 10, -5.91),
(18, 'Package', 'Sport', 125, -9.97),
(19, 'Kit', 'Nike', 36, -14.91),
(20, 'T_Shirt', 'Puma', 285, 10.65),
(21, 'Socks', 'FBI', 100, -9.97),
(22, 'Glass', 'Tomarrow', 50, -8.65),
(23, 'Car', 'Ferari', 250, -5.59),
(24, 'Belt', 'Sony', 320, 53.23),
(25, 'Apple Watch', 'Apple', 220, 40.25),
(26, 'Shoes', 'Majid', 130, -19.6),
(27, 'Hat', 'Simble', 85, 14.03),
(28, 'Note Book', 'Note', 410, 53.2303);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
