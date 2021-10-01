-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2017 at 11:09 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deknappe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_admin` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `id_admin`, `nama`) VALUES
('admin1', 'admin1', 1, 'Muhammad Faisal Amir'),
('admin2', 'admin2', 2, 'Saiful Apriyanto'),
('admin3', 'admin3', 3, 'Krisna Setiawan');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nip` int(20) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `ttl` varchar(45) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `agama` varchar(45) NOT NULL,
  `no_telp` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `jenis_kelamin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`username`, `password`, `nip`, `nama`, `ttl`, `alamat`, `agama`, `no_telp`, `email`, `jenis_kelamin`) VALUES
('goby', 'goby', 1, 'goby santoso', 'Probolinggo', 'probolinggo', 'Islam', '081357', 'akjdslaskjd', 'probolinggo'),
('goby', 'goby', 2, 'goby santoso', 'Probolinggo', 'probolinggo', 'Islam', '081357', 'akjdslaskjd', 'probolinggo');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_induk` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `ttl` varchar(40) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `no_telp` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`username`, `password`, `no_induk`, `nama`, `kelas`, `ttl`, `alamat`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `foto`) VALUES
('amir', 'amir', 14, 'Muhammad Faisal Amir', '02', 'probolinggo', 'probolinggo', 'probolinggo', 'islam', '081', 'amir', ''),
('rivkal', '6706160113', 670616011, 'rivkal sanjaya', 'ipa 5', 'karawang,25 agustus 1998', 'karawang', 'karawang', 'islam', '085718444618', 'sanjayarivkal@gmail.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`no_induk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `nip` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `no_induk` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=670616012;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
