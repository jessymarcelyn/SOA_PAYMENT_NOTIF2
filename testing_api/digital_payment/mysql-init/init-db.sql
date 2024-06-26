-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 07:56 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soa_payment_notif`
--

-- --------------------------------------------------------

--
-- Table structure for table `gopay`
--

CREATE TABLE `gopay` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `saldo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gopay`
--

INSERT INTO `gopay` (`id`, `nama`, `nomor_telepon`, `email`, `pin`, `saldo`) VALUES
(1, 'ninu', '08123456789', 'n@gmail.com', '714327DF6D36BCC6DA5431A0B797594805FFB3277ACC1DEFD36C5E88626C4428', '50000'),
(2, 'beno', '08112233445', 'be@gmail.com', '96CAE35CE8A9B0244178BF28E4966C2CE1B8385723A96A6B838858CDD6CA0A1E', '20000'),
(5, 'sasa', '08585858585', 'sa@gmail.com', '96CAE35CE8A9B0244178BF28E4966C2CE1B8385723A96A6B838858CDD6CA0A1E', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `ovo`
--

CREATE TABLE `ovo` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `saldo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ovo`
--

INSERT INTO `ovo` (`id`, `nama`, `nomor_telepon`, `email`, `pin`, `saldo`) VALUES
(1, 'ninu', '08123456789', 'n@gmail.com', '714327DF6D36BCC6DA5431A0B797594805FFB3277ACC1DEFD36C5E88626C4428', '50000'),
(2, 'beno', '08112233445', 'be@gmail.com', '96CAE35CE8A9B0244178BF28E4966C2CE1B8385723A96A6B838858CDD6CA0A1E', '20000'),
(5, 'sasa', '08585858585', 'sa@gmail.com', '96CAE35CE8A9B0244178BF28E4966C2CE1B8385723A96A6B838858CDD6CA0A1E', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `transaksigopay`
--

CREATE TABLE `transaksigopay` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `nomor_telepon` varchar(15) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksiovo`
--

CREATE TABLE `transaksiovo` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `nomor_telepon` varchar(15) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksiovo`
--

INSERT INTO `transaksiovo` (`id`, `timestamp`, `nomor_telepon`, `nominal`, `status`) VALUES
(18, '2024-06-25 17:36:32', '08123456789', '10000', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gopay`
--
ALTER TABLE `gopay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ovo`
--
ALTER TABLE `ovo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksigopay`
--
ALTER TABLE `transaksigopay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksiovo`
--
ALTER TABLE `transaksiovo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gopay`
--
ALTER TABLE `gopay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ovo`
--
ALTER TABLE `ovo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksigopay`
--
ALTER TABLE `transaksigopay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksiovo`
--
ALTER TABLE `transaksiovo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
