-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 08:31 PM
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
-- Table structure for table `bankbca`
--

CREATE TABLE `bankbca` (
  `id` int(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_rek` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankbca`
--

INSERT INTO `bankbca` (`id`, `nama`, `no_rek`, `pin`, `no_telp`, `saldo`) VALUES
(1, 'Nathalia Devita', '8630320624', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2147483647', 5680009),
(2, 'Jessys Marcelyn', '127566092', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2147483647', 7654100),
(4, 'Nathalia', '8630320333', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '081211366021', 5680009),
(5, 'Rina', '5379412348874917', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '08123123', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `bankmandiri`
--

CREATE TABLE `bankmandiri` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_rek` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankmandiri`
--

INSERT INTO `bankmandiri` (`id`, `nama`, `no_rek`, `pin`, `no_telp`, `saldo`) VALUES
(1, 'Neni', '1231231', '123', '88888', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `transbca`
--

CREATE TABLE `transbca` (
  `id` int(11) NOT NULL,
  `timestamp_trans` datetime NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `nominal` double NOT NULL,
  `status` varchar(25) NOT NULL,
  `va` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transbca`
--

INSERT INTO `transbca` (`id`, `timestamp_trans`, `no_telp`, `nominal`, `status`, `va`) VALUES
(27, '2024-06-26 12:28:25', '081211366021', 500000, 'success', '122081211366'),
(28, '2024-06-26 09:28:40', '081211366021', 500000, 'ongoing', '122081211366'),
(29, '2024-06-26 09:28:56', '081211366021', 500000, 'ongoing', '122081211366'),
(30, '2024-06-26 09:33:45', '081211366021', 500000, 'ongoing', '122081211366'),
(31, '2024-06-26 09:35:11', '081211366021', 500000, 'ongoing', '122081211366'),
(32, '2024-06-26 09:37:40', '081211366021', 500000, 'ongoing', '122081211366'),
(33, '2024-06-26 09:43:16', '081211366021', 500000, 'ongoing', '122081211366'),
(34, '2024-06-26 09:47:11', '081211366021', 500000, 'ongoing', '122081211366');

-- --------------------------------------------------------

--
-- Table structure for table `transmandiri`
--

CREATE TABLE `transmandiri` (
  `id_trans` int(11) NOT NULL,
  `timestamp_trans` datetime NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `nominal` double NOT NULL,
  `status` varchar(25) NOT NULL,
  `va` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transmandiri`
--

INSERT INTO `transmandiri` (`id_trans`, `timestamp_trans`, `no_telp`, `nominal`, `status`, `va`) VALUES
(11, '2024-06-24 10:51:19', '081211366021', 500000, 'ongoing', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankbca`
--
ALTER TABLE `bankbca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rek` (`no_rek`);

--
-- Indexes for table `bankmandiri`
--
ALTER TABLE `bankmandiri`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rek` (`no_rek`);

--
-- Indexes for table `transbca`
--
ALTER TABLE `transbca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmandiri`
--
ALTER TABLE `transmandiri`
  ADD PRIMARY KEY (`id_trans`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bankbca`
--
ALTER TABLE `bankbca`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bankmandiri`
--
ALTER TABLE `bankmandiri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transbca`
--
ALTER TABLE `transbca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `transmandiri`
--
ALTER TABLE `transmandiri`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
