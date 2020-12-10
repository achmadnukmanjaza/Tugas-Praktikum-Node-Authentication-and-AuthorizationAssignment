-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Nov 2020 pada 16.29
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent_car`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(100) NOT NULL,
  `nama_karyawan` varchar(300) NOT NULL,
  `alamat_karyawan` varchar(300) NOT NULL,
  `kontak` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `alamat_karyawan`, `kontak`, `username`, `password`) VALUES
('KA01', 'Imelda Zahwa ', 'Malang', '081445623007', 'imelda', 'f17219da7b6e918d91d97c7d6587ec98'),
('KA02', 'Bunga Zivana', 'Surabaya', '085667401123', 'Bunga', '508041e449f36b7f47448e4b3bbd74d7'),
('KA03', 'Dian Ayu', 'Malang', '085443123098', 'Ayu', '827ccb0eea8a706c4c34a16891f84e7b'),
('KA04', 'Nafarras Ayu', 'Madiun', '087109877654', 'Patrychia', '22986628a4b4ae68ad7a208738e84b33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` varchar(100) NOT NULL,
  `nomor_mobil` varchar(100) NOT NULL,
  `merk` varchar(200) NOT NULL,
  `jenis` varchar(200) NOT NULL,
  `warna` varchar(200) NOT NULL,
  `tahun_pembuatan` varchar(20) NOT NULL,
  `biaya_sewa_per_hari` double NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `nomor_mobil`, `merk`, `jenis`, `warna`, `tahun_pembuatan`, `biaya_sewa_per_hari`, `image`) VALUES
('M01', 'N 123 KI', 'Jazz', 'matic', 'merah', '2015', 350000, 'jazz.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(200) NOT NULL,
  `nama_pelanggan` varchar(300) NOT NULL,
  `alamat_pelanggan` varchar(400) NOT NULL,
  `kontak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `kontak`) VALUES
('PE01', 'Aracella', 'Malang', '081445609877');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` varchar(200) NOT NULL,
  `id_mobil` varchar(100) NOT NULL,
  `id_karyawan` varchar(100) NOT NULL,
  `id_pelanggan` varchar(100) NOT NULL,
  `tgl_sewa` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `total_bayar` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `id_mobil`, `id_karyawan`, `id_pelanggan`, `tgl_sewa`, `tgl_kembali`, `total_bayar`) VALUES
('S01', 'M01', 'KA02', 'PE01', '2020-11-20', '2020-11-21', 350000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`),
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `sewa_ibfk_3` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;