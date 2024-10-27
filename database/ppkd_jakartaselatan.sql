-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Okt 2024 pada 17.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`cart`)),
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `username`, `cart`, `data`) VALUES
(112, 'Muammar Rizal', '\"[{\\\"id\\\":1,\\\"name\\\":\\\"Es Teh Manis\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"category\\\":\\\"minuman\\\",\\\"totalPrice\\\":1},{\\\"id\\\":2,\\\"name\\\":\\\"Sate Ayam\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"category\\\":\\\"makanan\\\",\\\"totalPrice\\\":1}]\"', '[{\"id\":1,\"name\":\"Es Teh Manis\",\"quantity\":1,\"unitPrice\":1,\"category\":\"minuman\",\"totalPrice\":1},{\"id\":2,\"name\":\"Sate Ayam\",\"quantity\":1,\"unitPrice\":1,\"category\":\"makanan\",\"totalPrice\":1}]'),
(113, 'Wahyu', '\"[{\\\"id\\\":3,\\\"name\\\":\\\"pisang bakar\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"category\\\":\\\"makanan\\\",\\\"totalPrice\\\":1}]\"', '[{\"id\":3,\"name\":\"pisang bakar\",\"quantity\":1,\"unitPrice\":1,\"category\":\"makanan\",\"totalPrice\":1}]'),
(114, 'Ridla', '\"[{\\\"id\\\":4,\\\"name\\\":\\\"Kopi Hitam\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1,\\\"category\\\":\\\"minuman\\\",\\\"totalPrice\\\":1}]\"', '[{\"id\":4,\"name\":\"Kopi Hitam\",\"quantity\":1,\"unitPrice\":1,\"category\":\"minuman\",\"totalPrice\":1}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_ppkd`
--

CREATE TABLE `products_ppkd` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `inStock` tinyint(1) NOT NULL DEFAULT 0,
  `category` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products_ppkd`
--

INSERT INTO `products_ppkd` (`id`, `name`, `image`, `inStock`, `category`) VALUES
(1, 'Es Teh Manis', 'estehmanis.jpg', 0, 'minuman'),
(2, 'Sate Ayam', 'sateayam.jpg', 0, 'makanan'),
(3, 'pisang bakar', 'pisangbakar.jpg', 0, 'makanan'),
(4, 'Kopi Hitam', 'kopihitam.jpg', 0, 'minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
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
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('39bfba9d-ba9c-44a0-aec2-2aca702666a4', 'b7eddfad0c96840a26a2e7b02961db2e8f84b12742826b1787433d2deaccc9f4', '2024-10-27 04:46:59.472', '20241027044659_1', NULL, NULL, '2024-10-27 04:46:59.454', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products_ppkd`
--
ALTER TABLE `products_ppkd`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT untuk tabel `products_ppkd`
--
ALTER TABLE `products_ppkd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
