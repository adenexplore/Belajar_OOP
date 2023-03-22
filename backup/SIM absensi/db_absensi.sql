-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2006 at 06:44 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Create Database `db_absensi`
--

CREATE DATABASE `db_absensi` DEFAULT CHARACTER SET 
latin1 COLLATE latin1_swedish_ci;
USE `db_absensi`;

-- --------------------------------------------------------

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `query_absen`
-- (See below for the actual view)
--
CREATE TABLE `query_absen` (
`nis` varchar(8)
,`nama` varchar(100)
,`jk` varchar(1)
,`id_rayon` int(2)
,`id_rombel` int(2)
,`foto` varchar(100)
,`tgl_lahir` varchar(10)
,`rayon` varchar(15)
,`rombel` varchar(10)
,`hadir` int(1)
,`sakit` int(1)
,`ijin` int(1)
,`alpa` int(1)
,`tgl_absen` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `query_siswa`
-- (See below for the actual view)
--
CREATE TABLE `query_siswa` (
`nis` varchar(8)
,`nama` varchar(100)
,`jk` varchar(1)
,`id_rayon` int(2)
,`id_rombel` int(2)
,`foto` varchar(100)
,`tgl_lahir` varchar(10)
,`rayon` varchar(15)
,`rombel` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absen`
--

CREATE TABLE `tbl_absen` (
  `nis` varchar(8) NOT NULL,
  `hadir` int(1) NOT NULL,
  `sakit` int(1) NOT NULL,
  `ijin` int(1) NOT NULL,
  `alpa` int(1) NOT NULL,
  `tgl_absen` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rayon`
--

CREATE TABLE `tbl_rayon` (
  `id_rayon` int(2) NOT NULL,
  `rayon` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rayon`
--

INSERT INTO `tbl_rayon` (`id_rayon`, `rayon`) VALUES
(1, 'Ciawi'),
(2, 'Cibedug'),
(3, 'Cicurug'),
(4, 'Cisarua'),
(5, 'Tajur'),
(6, 'Sukasari'),
(7, 'Wikrama');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rombel`
--

CREATE TABLE `tbl_rombel` (
  `id_rombel` int(2) NOT NULL,
  `rombel` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rombel`
--

INSERT INTO `tbl_rombel` (`id_rombel`, `rombel`) VALUES
(1, 'RPL'),
(2, 'TKJ'),
(3, 'MMD'),
(4, 'HTL'),
(5, 'TBG'),
(6, 'OTKP'),
(7, 'BDP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nis` varchar(8) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `id_rayon` int(2) NOT NULL,
  `id_rombel` int(2) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tgl_lahir` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama`, `jk`, `id_rayon`, `id_rombel`, `foto`, `tgl_lahir`) VALUES
('12007888', 'Zalfa', 'P', 5, 3, '922aca69-c3ba-4140-ad72-9bb4e3e1a308.jpg', '2004-9-10'),
('12007880', 'Marsha Kordhawerti', 'P', 2, 1, 'e826b8e1-3232-4f9b-8d41-d3908db89af3.jpg', '2006-1-10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`username`, `password`) VALUES
('marsha', '1001');

-- --------------------------------------------------------

--
-- Structure for view `query_absen`
--
DROP TABLE IF EXISTS `query_absen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_absen`  AS  select `query_siswa`.`nis` AS `nis`,`query_siswa`.`nama` AS `nama`,`query_siswa`.`jk` AS `jk`,`query_siswa`.`id_rayon` AS `id_rayon`,`query_siswa`.`id_rombel` AS `id_rombel`,`query_siswa`.`foto` AS `foto`,`query_siswa`.`tgl_lahir` AS `tgl_lahir`,`query_siswa`.`rayon` AS `rayon`,`query_siswa`.`rombel` AS `rombel`,`tbl_absen`.`hadir` AS `hadir`,`tbl_absen`.`sakit` AS `sakit`,`tbl_absen`.`ijin` AS `ijin`,`tbl_absen`.`alpa` AS `alpa`,`tbl_absen`.`tgl_absen` AS `tgl_absen` from (`query_siswa` join `tbl_absen` on((`query_siswa`.`nis` = `tbl_absen`.`nis`))) ;

-- --------------------------------------------------------

--
-- Structure for view `query_siswa`
--
DROP TABLE IF EXISTS `query_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_siswa`  AS  select `tbl_siswa`.`nis` AS `nis`,`tbl_siswa`.`nama` AS `nama`,`tbl_siswa`.`jk` AS `jk`,`tbl_siswa`.`id_rayon` AS `id_rayon`,`tbl_siswa`.`id_rombel` AS `id_rombel`,`tbl_siswa`.`foto` AS `foto`,`tbl_siswa`.`tgl_lahir` AS `tgl_lahir`,`tbl_rayon`.`rayon` AS `rayon`,`tbl_rombel`.`rombel` AS `rombel` from ((`tbl_siswa` join `tbl_rayon` on((`tbl_siswa`.`id_rayon` = `tbl_rayon`.`id_rayon`))) join `tbl_rombel` on((`tbl_siswa`.`id_rombel` = `tbl_rombel`.`id_rombel`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_rayon`
--
ALTER TABLE `tbl_rayon`
  ADD PRIMARY KEY (`id_rayon`);

--
-- Indexes for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_rayon`
--
ALTER TABLE `tbl_rayon`
  MODIFY `id_rayon` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  MODIFY `id_rombel` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
