-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2024 pada 10.01
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_smknoneciomas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`id`, `username`, `fullname`, `email`, `password`) VALUES
(18, 'admin', 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(19, 'noval', 'Muhammad Noval Supriyadi', 'muhammadnovalsupriyadi1@gmail.com', '3334bd2d15055f558c84b08bfa3c42bb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `photo_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `publisher`, `amount`, `photo_filename`) VALUES
(1, 'Humor Informatika', 'Ariwibowo', 'Republika', 5, 'Humor Informatika_20231226_084031.jpg'),
(2, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 15, 'Laskar Pelangi_20231226_083807.png'),
(3, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', 15, 'Ayat-Ayat Cinta_20231226_083821.jpg'),
(4, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', 12, 'Bumi Manusia_20231226_083907.jpg'),
(5, 'Cinta di Dalam Gelas', 'Andrea Hirata', 'Bentang Pustaka', 20, 'Cinta di Dalam Gelas_20231226_083950.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `borrowing`
--

CREATE TABLE `borrowing` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `borrowing`
--

INSERT INTO `borrowing` (`id`, `borrower_id`, `book_id`, `loan_date`, `return_date`, `status`) VALUES
(15, 2, 2, '2023-12-01', '2023-12-06', 'Sudah Kembali'),
(17, 1, 5, '2023-12-22', '2023-12-29', 'Sudah Kembali'),
(18, 7, 1, '2023-12-22', '2023-12-29', 'Sudah Kembali'),
(19, 3, 5, '2023-12-22', '2023-12-29', 'Sudah Kembali'),
(20, 5, 3, '2023-12-26', '2024-01-02', 'Sudah Kembali'),
(21, 4, 3, '2023-12-27', '2024-01-03', 'Sudah Kembali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `photo_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id`, `fullname`, `address`, `phone_number`, `gender`, `photo_filename`) VALUES
(1, 'Muhammad Noval Supriyadi', 'Jalan pintu ledeng , gang damai 1 rt 002 rw 007', '+6285819041101', 'laki-laki', 'Muhammad Noval Supriyadi_20240103_083458.jpg'),
(2, 'Rahadian', 'JL. BUKIT ASRI DEKET MESJID ', '+6287353987232', 'laki laki', 'rahadian20231226_063133.jpg'),
(3, 'Rofi Nugraha', 'Dramaga ', '+628123456789', 'laki-laki', 'Rofi_Nugraha_20231226_063141.jpg'),
(4, 'Sri Ayu Aprilliani', 'Laladon ', '+628212345678', 'perempuan', 'Sri_Ayu_Aprilliani_20231226_062232.jpg'),
(5, 'Farhan Syahputra ', 'Alam tirta', '+628345367362', 'laki-laki', 'Farhan_Syahputra_20231226_063239.jpg'),
(6, 'Milki ', 'JL. Pintu ledeng , Kampung Duren ', '+62862412467883', 'laki-laki', 'Milki_20231226_063912.jpg'),
(7, 'Alpa', 'Dramaga', '+6293837373737', 'laki-laki', 'Alpa_20231226_063220.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `borrower_id` (`borrower_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `borrowing`
--
ALTER TABLE `borrowing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
