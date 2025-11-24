-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2025 at 05:56 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngetes1`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jumlah_tersedia` int(11) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `deskripsi`, `jumlah`, `jumlah_tersedia`, `lokasi`, `kode`, `created_at`) VALUES
(2, 'PC', 'Barang Bagus', 120, 120, 'Gedung 1', '21', '2025-11-21 14:09:45'),
(3, 'Ram 128GB ', 'Ram', 20, 20, 'Lab RPL', '30', '2025-11-24 03:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kategori` enum('pinjam','kembali') NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `peminjam`, `jumlah`, `kategori`, `tanggal`, `catatan`) VALUES
(2, 2, 'Rafi', 20, 'pinjam', '2025-11-24 10:31:26', 'Minjem Ya Mas👌😘'),
(3, 2, 'Rafi', 20, 'kembali', '2025-11-24 10:48:55', 'Makasih Sudah Meminjamkan Mas❤️👌'),
(4, 3, 'Rafi', 5, 'pinjam', '2025-11-24 10:54:43', 'Minjem Lagi Maz💕'),
(5, 3, 'Rafi', 5, 'kembali', '2025-11-24 10:55:39', 'Makasih');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','superadmin') DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `created_at`, `role`) VALUES
(8, 'admin', 'admin', '$2y$10$z2dzzRuMXwekiD3Za1h/lu0RJc8UrjKSeHJwhofcVOtNWYbg6T03G', '2025-11-23 19:14:43', 'admin'),
(9, 'superadmin', 'superadmin', '$2y$10$JbZ.ysZiLnBOMgLFaT8JfOl0PbIxNncauIGaobIo3kyNubSRWBMGW', '2025-11-23 19:16:49', 'superadmin'),
(10, 'admin2', 'admin2', '$2y$10$Ff3kju0st5G4hQmZsoq7e.DhBMB52UCiiCbXiwgt2FcQ91hfu1PRK', '2025-11-24 04:21:06', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
