-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2018 at 07:57 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kuliahku`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order_number` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `name`, `address`, `description`, `order_number`, `active`, `created_at`, `updated_at`) VALUES
('BANK000001', 'bank', 'Bank Kuliah-Ku', NULL, NULL, 1, 1, '2018-11-30 22:49:34', '2018-11-30 22:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `unit`, `active`) VALUES
(1, 'Kerajinan', 'berbagai macam kerajinan', 'pcs', 1),
(2, 'Barang Bekas', 'berbagai barang bekas', 'pcs', 1),
(3, 'Merchandise', 'macam macam merchandise', 'pcs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('+','-') COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `batas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `name`, `description`, `type`, `active`, `batas`) VALUES
(1, 'Debit', 'menabung uang ke koperasi', '+', 1, 1000000),
(2, 'Kredit', 'menarik tunai dari koperasi', '-', 1, 1000000),
(3, 'Belanja', 'berbelanja di Usaha Ku', '-', 1, 500000),
(4, 'Sampah', 'Menjual sampah di Kuliah Ku', '+', 1, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_member` bigint(16) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `bank_id`, `family_member`, `active`, `created_at`, `updated_at`) VALUES
(1, 'nasabah', 'BANK000001', 1234567890, 1, '2018-11-30 23:43:29', '2018-11-30 23:43:29'),
(2, 'nasabah2', 'BANK000001', 1987654321, 1, '2018-12-01 03:45:44', '2018-12-01 03:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `detailreceipts`
--

CREATE TABLE `detailreceipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `receipt_id` int(10) UNSIGNED NOT NULL,
  `good_id` int(10) UNSIGNED NOT NULL,
  `damount` int(11) NOT NULL,
  `dprice` decimal(8,2) NOT NULL,
  `dtotal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detailreceipts`
--

INSERT INTO `detailreceipts` (`id`, `receipt_id`, `good_id`, `damount`, `dprice`, `dtotal`) VALUES
(3, 3, 1, 1, '5000.00', '5000.00'),
(4, 4, 3, 1, '2500.00', '2500.00'),
(5, 5, 3, 1, '2500.00', '2500.00'),
(6, 6, 1, 1, '5000.00', '5000.00'),
(7, 7, 1, 1, '5000.00', '5000.00');

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id` int(10) UNSIGNED NOT NULL,
  `koperasi_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `priority` enum('high','standard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
  `price` decimal(10,2) NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`id`, `koperasi_id`, `category_id`, `name`, `description`, `priority`, `price`, `picture`, `active`, `created_at`, `updated_at`) VALUES
(1, 'KOPR000001', 1, 'Buket Bunga', 'Buket Bunga Wisuda', 'standard', '5000.00', 'http://localhost:8000/img/KOPR000001-1.jpg', 1, '2018-11-30 23:20:23', '2018-12-27 07:05:53'),
(4, 'KOPR000001', 3, 'Boneka Beruang', 'Boneka Beruang Wisuda', 'high', '24987.00', 'http://localhost:8000/img/KOPR000001-4.jpg', 1, '2018-12-02 14:40:31', '2018-12-27 07:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `koperasis`
--

CREATE TABLE `koperasis` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order_number` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `koperasis`
--

INSERT INTO `koperasis` (`id`, `user_id`, `name`, `address`, `description`, `order_number`, `active`, `created_at`, `updated_at`) VALUES
('KOPR000001', 'usahaku', 'Usaha Sukses', NULL, NULL, 1, 1, '2018-11-30 22:49:21', '2018-11-30 22:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_05_29_130911_entrust_setup_tables', 1),
(4, '2017_05_29_130935_create_database', 1),
(5, '2018_12_14_204719_create_donates_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `koperasi_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `status` enum('processed','verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `koperasi_id`, `customer_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'KOPR000001', 1, 'verified', '2018-12-01 01:39:36', '2018-12-26 05:37:15'),
(4, 'KOPR000001', 1, 'verified', '2018-12-01 03:43:02', '2018-12-22 22:42:58'),
(5, 'KOPR000001', 1, 'verified', '2018-12-03 03:33:35', '2018-12-22 22:42:54'),
(6, 'KOPR000001', 1, 'verified', '2018-12-07 09:03:11', '2018-12-26 12:33:14'),
(7, 'KOPR000001', 1, 'processed', '2018-12-27 07:36:01', '2018-12-27 07:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin_sistem', 'Admin Sistem', 'mengelola sistem informasi secara keseluruhan (developer)', '2018-11-30 22:46:32', '2018-11-30 22:46:32'),
(2, 'admin_koperasi', 'Usaha Ku', 'mengelola barang dan transaksi belanja yang ada di sistem informasi', '2018-11-30 22:46:32', '2018-11-30 22:46:32'),
(3, 'admin_bank', 'Koperasi Ku', 'mengelola nasabah dan transaksi-transaksi perbankan yang ada di sistem informasi', '2018-11-30 22:46:32', '2018-11-30 22:46:32'),
(4, 'nasabah', 'Nasabah', 'melakukan transaksi belanja dan perbankan di sistem informasi', '2018-11-30 22:46:32', '2018-11-30 22:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
('adminsistem', 1),
('bank', 3),
('nasabah', 4),
('nasabah2', 4),
('usahaku', 2);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `good_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `good_id`, `user_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'usahaku', 10, '2018-11-30 23:29:54', '2018-11-30 23:29:54'),
(2, 3, 'usahaku', 10, '2018-12-01 03:42:25', '2018-12-01 03:42:25'),
(5, 3, 'nasabah', -1, '2018-12-01 03:43:02', '2018-12-01 03:43:02'),
(6, 3, 'nasabah', -1, '2018-12-03 03:33:36', '2018-12-03 03:33:36'),
(7, 1, 'nasabah', -1, '2018-12-07 09:03:12', '2018-12-07 09:03:12'),
(8, 4, 'usahaku', 10, '2018-12-27 07:10:31', '2018-12-27 07:10:31'),
(9, 1, 'nasabah', -1, '2018-12-27 07:36:01', '2018-12-27 07:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code_id`, `customer_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '-5000.00', '2018-12-01 00:12:07', '2018-12-01 00:12:07'),
(2, 1, 1, '10000.00', '2018-12-01 01:05:05', '2018-12-01 01:05:05'),
(3, 3, 1, '-5000.00', '2018-12-01 01:06:47', '2018-12-01 01:06:47'),
(4, 1, 1, '10000.00', '2018-12-01 01:39:07', '2018-12-01 01:39:07'),
(5, 3, 1, '-5000.00', '2018-12-01 01:39:36', '2018-12-01 01:39:36'),
(6, 1, 1, '5000.00', '2018-12-01 03:41:28', '2018-12-01 03:41:28'),
(7, 3, 1, '-2500.00', '2018-12-01 03:43:02', '2018-12-01 03:43:02'),
(8, 3, 1, '-2500.00', '2018-12-03 03:33:36', '2018-12-03 03:33:36'),
(9, 3, 1, '-5000.00', '2018-12-07 09:03:12', '2018-12-07 09:03:12'),
(10, 1, 1, '10000.00', '2018-12-26 11:52:33', '2018-12-26 11:52:33'),
(11, 2, 1, '-1000.00', '2018-12-26 14:48:03', '2018-12-26 14:48:03'),
(12, 3, 1, '-5000.00', '2018-12-27 07:36:01', '2018-12-27 07:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `address`, `phone_number`, `gender`, `birth_date`, `password`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
('adminsistem', 'kuliahku@gmail.com', 'Admin Kuliah-Ku', 'Surakarta', '', 'male', '1996-09-11', '$2y$10$2Zlbx.mVnaX5z9avi.HcXuEObp47AkLa59hohPh4a7zoXMazkHLwi', 1, 'CXpvChHiq8Z1ltebiLkST4PSnAoGtWiKgdu3m8YjSSdqzAlIbRn2SJDzYztf', '2018-11-30 22:46:32', '2018-11-30 22:46:32'),
('bank', 'bank@gmail.com', 'Admin Koperasi-Ku', NULL, '', NULL, NULL, '$2y$10$Hr8/GOV0OhS/6kNnT0YkHO4uGKALZnIVExuGQ1hoUMl/OB9gb6CWe', 1, 'qrBGHuLrDrlub3IaHFc4LZYWyOKf9Ts1YTfWzCo1tJHoA6e6y1eqSCwpeF2j', '2018-11-30 22:49:09', '2018-11-30 22:49:09'),
('nasabah', 'nasabah@gmail.com', 'Nasabah', NULL, '', NULL, NULL, '$2y$10$wXmPINUX6SkPWX.PG0WMIO7jGnWcH8UPU81vGmGq16hf9FraEM5/i', 1, 'JkubOu3PJmUK834R2TyTypcHeD3NHf613uJ006p9pbz8b09cXhXIOfmSXWrh', '2018-11-30 23:43:29', '2018-11-30 23:43:29'),
('nasabah2', 'nasabah2@gmail.com', 'Nasabah2', NULL, '', NULL, NULL, '$2y$10$fblboIjPJX00eYatjDa//.CMk8xau/rmvRtaeRrOVAXeoQ1TsoGbi', 1, 'x3vvF1BRQdGBJnZXbGLVvmtaPBkDoCkfi7gmROFWVtLzVBBmpowreXJzNLDI', '2018-12-01 03:45:44', '2018-12-01 03:45:44'),
('usahaku', 'usahaku@gmail.com', 'Admin Usaha-Ku', NULL, '', NULL, NULL, '$2y$10$Q8kumHi3WMw6tmP0mFakT.y/PA/RSMMwrHWn6xn5XVuWarZvJpj7C', 1, '4wXyjgSw3Udzm9ujD0a7BSfE7GgEFq5NHtSg708TJ41wvdOfcxZUgyXBgdut', '2018-11-30 22:48:14', '2018-11-30 22:48:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codes_name_unique` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detailreceipts`
--
ALTER TABLE `detailreceipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `koperasis`
--
ALTER TABLE `koperasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detailreceipts`
--
ALTER TABLE `detailreceipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
