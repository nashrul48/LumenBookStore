-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2020 at 08:46 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumenbookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `baskets`
--

CREATE TABLE `baskets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_beli` int(20) NOT NULL,
  `id_buku` int(20) NOT NULL,
  `jumlahbeli` int(20) NOT NULL,
  `subtotal` int(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baskets`
--

INSERT INTO `baskets` (`id`, `id_beli`, `id_buku`, `jumlahbeli`, `subtotal`, `created_at`, `updated_at`) VALUES
(6, 1, 2, 1, 15000, '2020-01-25 06:13:14', '2020-01-25 06:13:14'),
(7, 2, 1, 1, 15000, '2020-01-25 06:33:04', '2020-01-25 06:33:04'),
(9, 2, 2, 2, 30000, '2020-01-25 11:35:41', '2020-01-25 11:35:41'),
(10, 2, 2, 2, 30000, '2020-01-27 11:59:45', '2020-01-27 11:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_buku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_terbit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(10) NOT NULL,
  `foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_distributor` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `judul_buku`, `penerbit`, `tahun_terbit`, `penulis`, `deskripsi`, `harga`, `foto`, `id_distributor`, `created_at`, `updated_at`) VALUES
(1, 'A Painting Of Pains', 'Gramedia', '2014', 'Hanna Natasha', 'Buku Novel', 15000, '_A_Painting_Of_Pains_', 1, '2020-01-25 06:03:32', '2020-01-25 06:03:32'),
(2, 'The Life and Adventures of Santa Claus', 'Gramedia', '2014', 'Hanna Natasha', 'Buku Novel', 15000, '_The_Life_and_Adventures_of_Santa_Claus_', 1, '2020-01-25 06:05:50', '2020-01-25 06:05:50'),
(8, 'Rust in Pieces', 'Ice cube', '2015', 'Nel Falisha', 'Buku Novel', 20000, '_Rust_in_Pieces_', 2, '2020-01-25 13:46:27', '2020-01-25 13:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_distributor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_distributor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notelfon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`id`, `nama_distributor`, `alamat_distributor`, `notelfon`, `email`, `created_at`, `updated_at`) VALUES
(1, 'PT Gramedia', 'Jl. Palmerah Barat 29', '08980953838', 'gramediautama@gmail.com', '2020-01-25 05:54:51', '2020-01-25 05:54:51'),
(2, 'PT Erlangga', 'Jl. Kompas No 2, Jakarta', '0987654321', 'erlanggakompas@gmail.com', '2020-01-25 05:55:31', '2020-01-25 05:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_01_15_081635_create_distributors_table', 1),
(4, '2020_01_21_111437_create_users_table', 2),
(5, '2020_01_21_140433_create_books_table', 3),
(6, '2020_01_22_145726_create_baskets_table', 4),
(7, '2020_01_22_152127_create_purchases_table', 5),
(8, '2020_01_25_035526_add_role_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(10) NOT NULL,
  `tglbeli` date NOT NULL,
  `total_beli` int(15) NOT NULL,
  `total_bayar` int(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `id_user`, `tglbeli`, `total_beli`, `total_bayar`, `created_at`, `updated_at`) VALUES
(1, 2, '2020-01-25', 1, 15000, '2020-01-25 06:11:29', '2020-01-25 06:11:29'),
(2, 3, '2020-01-25', 1, 45000, '2020-01-25 06:30:36', '2020-01-25 06:30:36'),
(9, 3, '2020-01-24', 3, 45000, '2020-01-27 10:15:35', '2020-01-27 10:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `role`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$10$wEwCcIy6rjPfZd4AeymqYejTjqBR3OMpUQlRJ2noZpQ8yP5ZiHe2K', '2020-01-25 05:48:08', '2020-01-25 05:48:08'),
(2, 'saya', 'customer', 'customer1', '$2y$10$V2/UDcpO5OIEzp8Jc2C2BeXTG3kVlSbOFlA6TXTfjZwaRBCYsUAZ2', '2020-01-25 05:49:34', '2020-01-25 05:49:34'),
(3, 'kamu siapa', 'customer', 'customer2', '$2y$10$1Uu/f6tBSCUf66wpE5Amfufe7sM4Jv60T/aXMqZa791m1.ai6AvGO', '2020-01-25 06:28:58', '2020-01-25 06:28:58'),
(10, 'saya admin', 'admin', 'admin123', '$2y$10$LI2FJbZmuqkDX5wTUD.pU.Y.r4ZwfS0OV/9j1bh3fp1gsTSeM3XPO', '2020-01-26 14:01:11', '2020-01-26 14:01:11'),
(11, 'saya customer', 'admin', 'customer123', '$2y$10$5WhbNZCgVyhlPAqSBttlMeKgX/QpHusYwmaoWzDo2VZvPRvb..EJ2', '2020-01-27 10:02:58', '2020-01-27 10:02:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_distributor_foreign` (`id_distributor`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
