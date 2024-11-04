-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 01:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppkd_jakartaselatan`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`cart`)),
  `data` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `username`, `cart`, `data`) VALUES
(108, 'Ryan', '\"[{\\\"id\\\":2,\\\"name\\\":\\\"PAKET 1\\\",\\\"image\\\":\\\"PAKET 1.jpg\\\",\\\"inStock\\\":\\\"{\\\\\\\"quantity\\\\\\\":20,\\\\\\\"stock\\\\\\\":true}\\\",\\\"items\\\":{\\\"category\\\":\\\"food\\\",\\\"title\\\":\\\"Nasi Liwet\\\",\\\"food\\\":[\\\"Nasi Liwet\\\",\\\"Tahu\\\",\\\"Tempe Goreng\\\",\\\"lalapan\\\"],\\\"dessert\\\":\\\"Mango Cheese Puding\\\"},\\\"datas\\\":\\\"[{}]\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"totalPrice\\\":1},{\\\"id\\\":8,\\\"name\\\":\\\"Cafe Latte (Hot/Ice)\\\",\\\"image\\\":\\\"cafelatte.jpg\\\",\\\"inStock\\\":\\\"{\\\\\\\"quantity\\\\\\\":986,\\\\\\\"stock\\\\\\\":true}\\\",\\\"items\\\":{\\\"category\\\":\\\"coffee\\\",\\\"title\\\":\\\"Cafe Latte\\\",\\\"description\\\":\\\"Kopi espresso asal italia yang kuat dicampur dengan susu\\\",\\\"food\\\":[],\\\"dessert\\\":\\\"\\\"},\\\"datas\\\":\\\"[{}]\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"totalPrice\\\":1}]\"', '{\"process\":false,\"table\":\"Meja 2\",\"timestamp\":\"2024-11-04T06:53:22.791Z\"}'),
(109, 'adnan', '\"[{\\\"id\\\":4,\\\"name\\\":\\\"PAKET 3\\\",\\\"image\\\":\\\"PAKET 3.jpg\\\",\\\"inStock\\\":\\\"{\\\\\\\"quantity\\\\\\\":16,\\\\\\\"stock\\\\\\\":true}\\\",\\\"items\\\":{\\\"category\\\":\\\"food\\\",\\\"title\\\":\\\"Ayam Katsu\\\",\\\"food\\\":[\\\"Nasi Putih\\\",\\\"Mix Vegetables\\\"],\\\"dessert\\\":\\\"Puding Coklat + Fla\\\"},\\\"datas\\\":\\\"[{}]\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"totalPrice\\\":1},{\\\"id\\\":8,\\\"name\\\":\\\"Cafe Latte (Hot/Ice)\\\",\\\"image\\\":\\\"cafelatte.jpg\\\",\\\"inStock\\\":\\\"{\\\\\\\"quantity\\\\\\\":985,\\\\\\\"stock\\\\\\\":true}\\\",\\\"items\\\":{\\\"category\\\":\\\"coffee\\\",\\\"title\\\":\\\"Cafe Latte\\\",\\\"description\\\":\\\"Kopi espresso asal italia yang kuat dicampur dengan susu\\\",\\\"food\\\":[],\\\"dessert\\\":\\\"\\\"},\\\"datas\\\":\\\"[{}]\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"totalPrice\\\":1}]\"', '{\"process\":false,\"table\":\"\",\"timestamp\":\"2024-11-04T09:05:54.306Z\"}');

-- --------------------------------------------------------

--
-- Table structure for table `products_ppkd`
--

CREATE TABLE `products_ppkd` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `inStock` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`inStock`)),
  `datas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datas`)),
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_ppkd`
--

INSERT INTO `products_ppkd` (`id`, `name`, `image`, `inStock`, `datas`, `items`) VALUES
(2, 'PAKET 1', 'PAKET 1.jpg', '\"{\\\"quantity\\\":19,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"food\",\"title\":\"Nasi Liwet\",\"food\":[\"Nasi Liwet\",\"Tahu\",\"Tempe Goreng\",\"lalapan\"],\"dessert\":\"Mango Cheese Puding\"}'),
(3, 'PAKET 2', 'PAKET 2.jpg', '\"{\\\"quantity\\\":10,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"food\",\"title\":\"Ayam Teriyaki\",\"food\":[\"Nasi Putih\",\"Coleslow\"],\"dessert\":\"Pudding Strawberry + Fla\"}'),
(4, 'PAKET 3', 'PAKET 3.jpg', '\"{\\\"quantity\\\":15,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"food\",\"title\":\"Ayam Katsu\",\"food\":[\"Nasi Putih\",\"Mix Vegetables\"],\"dessert\":\"Puding Coklat + Fla\"}'),
(5, 'PAKET 4', 'PAKET 4.jpg', '\"{\\\"quantity\\\":20,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"food\",\"title\":\"Ayam Rica-Rica\",\"food\":[\"Nasi Putih\",\"Tumis Wortel Buncis\",\"Wortel\"],\"dessert\":\"Puding Lapis Biskuit\"}'),
(6, 'PAKET 5', 'PAKET 5.jpg', '\"{\\\"quantity\\\":20,\\\"stock\\\":false}\"', '\"[{}]\"', '{\"category\":\"food\",\"title\":\"Ayam Geprek\",\"food\":[\"Nasi Putih\",\"Lalapan\"],\"dessert\":\"Oreo Puding\"}'),
(7, 'Americano (Hot/Ice)', 'americano.jpg', '\"{\\\"quantity\\\":999,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Americano\",\"description\":\"Kopi espresso dengan tambahan air panas\",\"food\":[],\"dessert\":\"\"}'),
(8, 'Cafe Latte (Hot/Ice)', 'cafelatte.jpg', '\"{\\\"quantity\\\":984,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Cafe Latte\",\"description\":\"Kopi espresso asal italia yang kuat dicampur dengan susu\",\"food\":[],\"dessert\":\"\"}'),
(9, 'Kopi Susu Gula Aren', 'kopisusugulaaren.jpg', '\"{\\\"quantity\\\":49,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Kopi Susu Gula Aren\",\"description\":\"Racikan kopi yang mengandung susu dan gula aren\",\"food\":[],\"dessert\":\"\"}'),
(10, 'Flavoured Latte', 'flavouredlatte.jpg', '\"{\\\"quantity\\\":50,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Flavoured Latte\",\"description\":\"Varian Caffe latte yang diberi tambahan sirup rasa\",\"food\":[],\"dessert\":\"\"}'),
(11, 'Iced Matcha Latte', 'icedmatchalatte.jpg', '\"{\\\"quantity\\\":35,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"non-coffee\",\"title\":\"Iced Matcha Latte\",\"description\":\"Dibuat dari matcha bubuk dicampur dengan susu cair\",\"food\":[],\"dessert\":\"\"}'),
(12, 'Iced Lychee Tea', 'icedlycheetea.jpg', '\"{\\\"quantity\\\":35,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"non-coffee\",\"title\":\"Iced Lychee Tea\",\"description\":\"Dibuat dari teh yang dicampur dengan ekstra buah leci\",\"food\":[],\"dessert\":\"\"}'),
(13, 'Iced Shaken Peach Tea', 'icedshakenpeachtea.jpg', '\"{\\\"quantity\\\":35,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"non-coffee\",\"title\":\"Iced Shaken Peach Tea\",\"description\":\"Minuman segar yang menggunakan buah leci sebagai bahan utama\",\"food\":[],\"dessert\":\"\"}'),
(14, 'Cappucino(Hot/Ice)', 'cappucino.jpg', '\"{\\\"quantity\\\":999,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Cappucino\",\"description\":\"Cappuccino minuman kopi yang terbuat dari campuran espresso dan susu panas.\",\"food\":[],\"dessert\":\"\"}'),
(15, 'Caramel Machiato', 'caramelmachiato.jpg', '\"{\\\"quantity\\\":999,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Caramel Machiato\",\"description\":\"Caramel Machiato memberikan pengalaman kopi yang lezat dan menyenangkan\",\"food\":[],\"dessert\":\"\"}'),
(16, 'Affogato', 'affogato.jpg', '\"{\\\"quantity\\\":999,\\\"stock\\\":true}\"', '\"[{}]\"', '{\"category\":\"coffee\",\"title\":\"Affogato\",\"description\":\"Kombinasi sempurna antara espresso yang panas dan es krim \",\"food\":[],\"dessert\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `validationorder`
--

CREATE TABLE `validationorder` (
  `id_qr` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `validationorder`
--

INSERT INTO `validationorder` (`id_qr`, `data`) VALUES
(3, '{}'),
(13, '{}'),
(24, '{}'),
(33, '{}'),
(34, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('67cc1f39-ebf8-415a-adf0-bc08c6f8d583', 'b7eddfad0c96840a26a2e7b02961db2e8f84b12742826b1787433d2deaccc9f4', '2024-10-31 13:23:31.763', '20241027044659_1', NULL, NULL, '2024-10-31 13:23:31.722', 1),
('6ff11c1e-9461-48b6-b83e-0f31844fe83d', 'cd116645cfd75b6f56c9f28e125bc64d96fb7333e8e3dad533e930afe715fe3e', '2024-11-03 13:01:58.464', '20241103130158_3', NULL, NULL, '2024-11-03 13:01:58.451', 1),
('99e244e0-f1b3-433d-a167-9593d3dd518a', 'fee2eef2a9e31ab3ba9f87b7f976f387502ff01afa923b48d7932e8ababbef09', '2024-10-31 13:23:31.792', '20241031021705_new_migration_31_10_2024', NULL, NULL, '2024-10-31 13:23:31.767', 1),
('f7bef03f-fcbf-4bfa-836e-04baf016d1e1', '35ba1c67eb318794fc5c3cefa3e83d1c94684ebf51668b63cfbb128fee1212c8', '2024-10-31 13:27:52.906', '20241031132752_update_table_products_ppkd', NULL, NULL, '2024-10-31 13:27:52.894', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_ppkd`
--
ALTER TABLE `products_ppkd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `validationorder`
--
ALTER TABLE `validationorder`
  ADD PRIMARY KEY (`id_qr`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `products_ppkd`
--
ALTER TABLE `products_ppkd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
