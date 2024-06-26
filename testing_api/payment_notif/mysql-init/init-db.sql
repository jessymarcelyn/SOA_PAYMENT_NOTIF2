-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 07:07 PM
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
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notif` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `tipe_notif` varchar(20) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `timestamp_masuk` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp_announce` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `link` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notif`, `id_user`, `id_pesanan`, `tipe_notif`, `judul`, `deskripsi`, `timestamp_masuk`, `timestamp_announce`, `status`, `link`) VALUES
(135, 1, 3, 'pembayaran', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 3 dengan VA ini 122081211366', '2024-06-26 09:32:15', '2024-06-26 09:32:15', 1, '../../inputVA.php'),
(136, 1, 4, 'pembayaran', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 4 dengan VA ini 2147483647', '2024-06-24 05:51:19', '2024-06-24 10:51:19', 0, '../../inputVA.php'),
(137, 1, 7, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 789010', '2024-06-26 04:13:58', '2024-06-26 09:13:58', 0, NULL),
(138, 1, 7, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 7', '2024-06-26 09:15:12', '2024-06-26 09:15:12', 1, NULL),
(139, 1, 7, 'pembayaran', 'Pembayaran Berhasil', 'Pembayaran untuk pesanan 7 berhasil', '2024-06-26 09:15:12', '2024-06-26 09:15:12', 0, NULL),
(140, 1, 8, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 498473', '2024-06-26 04:16:48', '2024-06-26 09:16:48', 0, NULL),
(141, 1, 8, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 8', '2024-06-26 09:17:39', '2024-06-26 09:17:39', 1, NULL),
(142, 1, 8, 'pembayaran', 'Pembayaran Berhasil', 'Pembayaran untuk pesanan 8 berhasil', '2024-06-26 09:17:38', '2024-06-26 09:17:38', 0, NULL),
(143, 1, 11, 'keuangan', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 11 dengan VA ini 122081211366', '2024-06-26 04:28:40', '2024-06-26 09:28:40', 0, '../../inputVA.php'),
(144, 1, 12, 'keuangan', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 12 dengan VA ini 122081211366', '2024-06-26 04:29:03', '2024-06-26 09:29:03', 0, '../../inputVA.php'),
(145, 1, 13, 'keuangan', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 13 dengan VA ini 122081211366', '2024-06-26 04:33:45', '2024-06-26 09:33:45', 0, '../../inputVA.php'),
(146, 1, 14, 'keuangan', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 14 dengan VA ini 122081211366', '2024-06-26 04:35:11', '2024-06-26 09:35:12', 0, '../../inputVA.php'),
(147, 1, 15, 'pembayaran', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 15 dengan VA ini 122081211366', '2024-06-26 09:37:51', '2024-06-26 09:37:51', 1, '../../inputVA.php'),
(148, 1, 16, 'pembayaran', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 16 dengan VA ini 122081211366', '2024-06-26 04:43:17', '2024-06-26 09:43:17', 0, '../../inputVA.php'),
(149, 1, 17, 'keuangan', 'VA', 'Silahkan lakukan pembayaran untuk pesanan 17 dengan VA ini 122081211366', '2024-06-26 04:47:19', '2024-06-26 09:47:20', 0, '../../inputVA.php'),
(150, 1, 16, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 600275', '2024-06-26 04:51:09', '2024-06-26 09:51:09', 0, NULL),
(151, 1, 16, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 16', '2024-06-26 09:51:55', '2024-06-26 09:51:55', 1, NULL),
(152, 1, 16, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 539236', '2024-06-26 05:11:23', '2024-06-26 10:11:23', 0, NULL),
(153, 1, 16, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 16', '2024-06-26 10:14:04', '2024-06-26 10:14:04', 1, 'asdasda'),
(154, 1, 16, 'pembayaran', 'Pembayaran Berhasil', 'Pembayaran untuk pesanan 16 berhasil', '2024-06-26 10:12:33', '2024-06-26 10:12:33', 0, NULL),
(155, 1, 21, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 724188', '2024-06-26 11:02:47', '2024-06-26 11:02:47', 1, NULL),
(156, 1, 21, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 21', '2024-06-26 11:03:42', '2024-06-26 11:03:42', 1, NULL),
(157, 1, 22, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 476782', '2024-06-26 06:09:20', '2024-06-26 11:09:20', 0, NULL),
(158, 1, 22, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 22', '2024-06-26 11:10:16', '2024-06-26 11:10:16', 1, NULL),
(159, 1, 22, 'pembayaran', 'Pembayaran Berhasil', 'Pembayaran untuk pesanan 22 berhasil', '2024-06-26 11:12:34', '2024-06-26 11:12:34', 1, NULL),
(160, 1, 23, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 633443', '2024-06-26 06:10:55', '2024-06-26 11:10:55', 0, NULL),
(161, 1, 23, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 23', '2024-06-26 11:12:14', '2024-06-26 11:12:14', 1, NULL),
(162, 1, 24, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 204384', '2024-06-26 06:12:54', '2024-06-26 11:13:00', 0, NULL),
(163, 1, 24, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 24', '2024-06-26 11:15:16', '2024-06-26 11:15:16', 1, NULL),
(164, 1, 25, 'pembayaran', 'OTP', 'Silahkan lakukan pembayaran dengan OTP ini 858305', '2024-06-26 06:16:47', '2024-06-26 11:16:47', 0, NULL),
(165, 1, 25, 'pembayaran', 'Lakukan Pembayaran', 'Silahkan lakukan pembayaran untuk pesanan 25', '2024-06-26 11:18:49', '2024-06-26 11:18:49', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_pembayaran`
--

CREATE TABLE `trans_pembayaran` (
  `id_pembayaran` int(100) NOT NULL,
  `id_pesanan` int(100) NOT NULL,
  `id_pesanan2` int(100) DEFAULT NULL,
  `id_transaksi` int(100) DEFAULT NULL,
  `total_transaksi` double NOT NULL,
  `timestamp` datetime NOT NULL,
  `jenis_pembayaran` varchar(100) DEFAULT NULL,
  `nama_penyedia` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trans_pembayaran`
--

INSERT INTO `trans_pembayaran` (`id_pembayaran`, `id_pesanan`, `id_pesanan2`, `id_transaksi`, `total_transaksi`, `timestamp`, `jenis_pembayaran`, `nama_penyedia`, `status`) VALUES
(267, 1, NULL, 0, 100000, '2024-06-24 10:44:41', '', '', 'initial'),
(268, 2, NULL, 0, 100000, '2024-06-24 10:46:27', '', '', 'initial'),
(269, 3, NULL, 27, 100000, '2024-06-24 10:48:19', 'TransferBank', 'BCA', 'ongoing'),
(270, 4, NULL, 11, 100000, '2024-06-24 10:51:19', 'TransferBank', 'Mandiri', 'ongoing'),
(271, 1, NULL, 0, 269, '2024-06-24 21:31:11', '', '', 'initial'),
(272, 19, NULL, 0, 10000, '2024-06-25 17:44:39', '', '', 'initial'),
(273, 20, NULL, 0, 100000, '2024-06-26 00:38:37', '', '', 'initial'),
(274, 4, NULL, 0, 100000, '2024-06-26 00:40:55', '', '', 'initial'),
(275, 4, NULL, 0, 100000, '2024-06-26 00:41:38', '', '', 'initial'),
(276, 4, NULL, 0, 100000, '2024-06-26 00:46:16', '', '', 'initial'),
(277, 4, NULL, 0, 100000, '2024-06-26 00:46:40', '', '', 'initial'),
(278, 4, NULL, 0, 100000, '2024-06-26 00:54:02', '', '', 'initial'),
(279, 5, NULL, 0, 100000, '2024-06-26 09:03:15', '', '', 'initial'),
(280, 6, NULL, 0, 100000, '2024-06-26 09:11:40', '', '', 'initial'),
(281, 7, NULL, 128, 100000, '2024-06-26 09:13:58', 'kartukredit', 'mastercard', 'success'),
(283, 8, NULL, 129, 100000, '2024-06-26 09:16:48', 'kartukredit', 'mastercard', 'success'),
(284, 18, NULL, 0, 100000, '2024-06-26 09:21:16', '', '', 'initial'),
(285, 9, NULL, 0, 100000, '2024-06-26 09:21:31', 'Digital Payment', 'ovo', 'ongoing'),
(286, 10, NULL, 0, 100000, '2024-06-26 09:22:56', 'Digital Payment', 'ovo', 'ongoing'),
(287, 11, NULL, 28, 100000, '2024-06-26 09:28:40', 'TransferBank', 'BCA', 'ongoing'),
(288, 12, NULL, 29, 100000, '2024-06-26 09:29:03', 'TransferBank', 'BCA', 'ongoing'),
(289, 13, NULL, 30, 100000, '2024-06-26 09:33:45', 'TransferBank', 'BCA', 'ongoing'),
(290, 14, NULL, 31, 100000, '2024-06-26 09:35:11', 'TransferBank', 'BCA', 'ongoing'),
(291, 15, NULL, 32, 100000, '2024-06-26 09:37:41', 'TransferBank', 'BCA', 'ongoing'),
(292, 16, NULL, 131, 100000, '2024-06-26 10:11:23', 'kartukredit', 'mastercard', 'success'),
(293, 17, NULL, 34, 100000, '2024-06-26 09:47:19', 'TransferBank', 'BCA', 'ongoing'),
(294, 16, NULL, 131, 100000, '2024-06-26 10:11:23', 'kartukredit', 'mastercard', 'success'),
(296, 21, NULL, 132, 100000, '2024-06-26 11:02:32', 'kartukredit', 'mastercard', 'failed'),
(297, 22, NULL, 133, 100000, '2024-06-26 11:09:20', 'kartukredit', 'mastercard', 'success'),
(298, 23, NULL, 134, 100000, '2024-06-26 11:10:55', 'kartukredit', 'mastercard', 'failed'),
(299, 24, NULL, 135, 100000, '2024-06-26 11:12:54', 'kartukredit', 'mastercard', 'failed'),
(300, 25, NULL, 136, 100000, '2024-06-26 11:16:47', 'kartukredit', 'mastercard', 'failed'),
(301, 24, NULL, 0, 20000, '2024-06-26 11:54:30', '', '', 'initial'),
(302, 30, 1, 0, 10000, '2024-06-26 10:44:41', '', '', 'ongoing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notif`);

--
-- Indexes for table `trans_pembayaran`
--
ALTER TABLE `trans_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `trans_pembayaran`
--
ALTER TABLE `trans_pembayaran`
  MODIFY `id_pembayaran` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
