-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 07:06 PM
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
-- Table structure for table `kartu`
--

CREATE TABLE `kartu` (
  `id_kartu` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nomer_kartu` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  `expired_year` int(4) NOT NULL,
  `expired_month` int(2) NOT NULL,
  `limit_maks` decimal(10,0) NOT NULL,
  `limit_terpakai` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kartu`
--

INSERT INTO `kartu` (`id_kartu`, `nama`, `nomer_kartu`, `cvv`, `expired_year`, `expired_month`, `limit_maks`, `limit_terpakai`, `status`) VALUES
(25, 'Jessy', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '114bd151f8fb0c58642d2170da4ae7d7c57977260ac2cc8905306cab6b2acabc', 2029, 6, '5000000', '200000', 1),
(26, 'Rina', 'e85acad0a469f9166744a79a1c9d33a11f735abca10f328b48ebbce3c10e75a8', 'f747870ae666c39b589f577856a0f7198b3b81269cb0326de86d8046f2cf72db', 2026, 5, '2000000', '0', 1),
(28, 'Hendra', '6993cf0cc46026086a561a3feba3dc8a6a593d32ab31d1e8b802ca51b4f3de19', '8ede6b26343305e05c3c0029f4e830d4e8c2016869a9d1cd97b100b2a16dfd1c', 2022, 3, '2000000', '0', 0),
(29, 'Santi', '855229ffcc832335b086c46feb926e6f4e013759a199c9d777ac51bb38a2533a', '793733573a1dfd14a2e889a11b2ad7b6981de29df813863b528dc1ae99416eeb', 2025, 2, '1000000', '0', 0),
(30, 'Andi', 'd688838fa7ab493a5e310dc529cdb4206da5edf97dafed3d297c8ff86ba64164', '30e26cef13a6dbbf0e3035f8c16f55670f4e468e97ac7dad43798621da636abf', 2025, 2, '1000000', '1000000', 1),
(31, 'Ariel', 'cd269b73fc92a164d9ae60ff2678db03c0eb21b597f3ebd20ecb4266ef720556', '182dc6b90f1c9cd913c39a6b5506f582caba9ddeadafe32f5bdbac25efd705ac', 2027, 1, '1000000', '800000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_kartu`
--

CREATE TABLE `transaksi_kartu` (
  `id_transaksi` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `nomer_kartu` varchar(255) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  `status` varchar(10) NOT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_timestamp` datetime DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_kartu`
--

INSERT INTO `transaksi_kartu` (`id_transaksi`, `timestamp`, `nomer_kartu`, `nominal`, `status`, `otp`, `otp_timestamp`, `attempt`) VALUES
(123, '2024-06-25 17:06:18', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '100000', 'ongoing', '7osux7ZGEvc+oF8o5gfpyEZiREvZ/w==', '2024-06-25 17:06:18', 0),
(124, '2024-06-25 17:10:44', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '100000', 'ongoing', 'YHb4cR7y2eRgQWXBysTyzDkVeb11hw==', '2024-06-25 17:10:44', 0),
(125, '2024-06-26 09:04:15', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', '5mpc7OTQhiUOvedCavHvzQ7C93xsYg==', '2024-06-26 09:04:15', 0),
(126, '2024-06-26 09:04:37', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', 'sN7fYou+uVilXZpEEThSem0xOkpcLQ==', '2024-06-26 09:04:37', 0),
(127, '2024-06-26 09:11:59', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', 'ETV8kku0uAmiLglJrRmh1Os6/mvh7Q==', '2024-06-26 09:11:59', 0),
(128, '2024-06-26 09:13:58', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'success', 'lttV358Mj7Ut+Fl01PFJud1AAEGR9w==', '2024-06-26 09:13:58', 1),
(129, '2024-06-26 09:16:47', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'success', 'guz/Y+qUTjSMWwgMct+wnRN5dkW93g==', '2024-06-26 09:16:47', 2),
(130, '2024-06-26 09:51:09', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', 'ahxZ8SzN9NnZzajLYOijuDQ2VOLgAA==', '2024-06-26 09:51:09', 3),
(131, '2024-06-26 10:11:23', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'success', 'w1XtXF/pp5tpyZeTpRD6IGfWWmQ6uQ==', '2024-06-26 10:11:23', 1),
(132, '2024-06-26 11:02:32', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', 'QTbvPjsBYcQt08W1hRFqMCxb24R1QQ==', '2024-06-26 11:02:32', 3),
(133, '2024-06-26 11:09:20', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'success', 'PCcKPVXdMAo2hJYFJikfFYb3mB1v0w==', '2024-06-26 11:09:20', 1),
(134, '2024-06-26 11:10:55', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'failed', 'ac0cUj8w2nyhXR7aUd6p3fBr364ORw==', '2024-06-26 11:10:55', 3),
(135, '2024-06-26 11:12:53', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'ongoing', 'VJSFa7a+qT60V08VMlCcI6+gU+iYqw==', '2024-06-26 11:12:53', 0),
(136, '2024-06-26 11:16:47', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '200000', 'failed', 'ZLDFkgpRS/FfbuxApWn7A6MeVXmmcA==', '2024-06-26 11:16:47', 0),
(137, '2024-06-26 14:28:33', '85df00411f072d601b21fc2e6db9e83e01d04d11169bc7f306e13d6b4c57e99b', '100000', 'ongoing', 'p55FaFf7D5FFFGgjm9TrXbn/kCMz6Q==', '2024-06-26 14:28:33', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id_kartu`);

--
-- Indexes for table `transaksi_kartu`
--
ALTER TABLE `transaksi_kartu`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id_kartu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `transaksi_kartu`
--
ALTER TABLE `transaksi_kartu`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
