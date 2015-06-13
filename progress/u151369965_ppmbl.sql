
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2015 at 07:36 AM
-- Server version: 10.0.11-MariaDB
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u151369965_ppmbl`
--

-- --------------------------------------------------------

--
-- Table structure for table `dewa`
--

CREATE TABLE IF NOT EXISTS `dewa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level_user` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `level_user` (`level_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `dewa`
--

INSERT INTO `dewa` (`id`, `username`, `password`, `nama`, `level_user`) VALUES
(1, 'adminplnpln', 'd531c8c688d9c1ea2e62cd8a1de8137e', 'Administrator', 1),
(2, 'ednan', 'd531c8c688d9c1ea2e62cd8a1de8137e', 'Ednan Fajri', 1),
(3, 'naufal', '278dc4385c5b4cac592e3d4dd6628a46', 'Fathin Naufal', 2),
(4, 'yudha', '4741dc3b6a7722a36aa74cfa43ff558b', 'Agung Yudha Berliantara', 1),
(5, 'afif', '6df8cb243f842f234f51c3f28604a356', 'Afif Nandya', 2),
(6, 'arema', '10a3b8adc44e6c04b0e84aee3f774f94', 'arema indonesia', 3),
(7, 'diva', 'bfce337f223c55c0491434781c493aa5', 'Diva Kurnia', 3),
(9, 'septy', '32d3a20aeb6a95f2a06ddd8977268c54', 'Septy', 3),
(10, 'abcd', 'e3b82c156126e03859a420d7ba72c634', 'abcd', 1),
(11, 'datadummy', '17bd30c424e6b062d63c3a5a318cc3a1', 'data dummy', 1),
(12, 'scope', '9db8d6be8a7320b8740415df9e6e46ea', 'scope warning', 3),
(13, 'try', '51371ceea49acd1fcb19ead1188ebac4', 'try', 2),
(14, 'adminpost', '42c72e91a01f214e5a322630cf6a2364', 'admin posting', 1),
(15, 'postdata', '065cdcb27e010722c4ad1470063acf18', 'postdata', 2),
(16, 'gnsrs', 'd0e9418e3947e8ed14d67bb6e2336147', 'guns n roses', 3),
(17, 'tabs', '4e6091f6cae72e336cfa53c1f0b97e7a', 'Tabs', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `komentar` text NOT NULL,
  `tanggal_komentar` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE IF NOT EXISTS `level_user` (
  `id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `level_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id`, `level_user`) VALUES
(1, 'Admin'),
(2, 'Moderator'),
(3, 'User Frontend');

-- --------------------------------------------------------

--
-- Table structure for table `like_unlike`
--

CREATE TABLE IF NOT EXISTS `like_unlike` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_plinplan_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `status_like_unlike` char(1) DEFAULT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `like_unlike_FKIndex1` (`post_id`),
  KEY `like_unlike_FKIndex2` (`user_plinplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE IF NOT EXISTS `pesan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isi_pesan` text,
  `tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) unsigned NOT NULL,
  `user_plinplan_id` int(10) unsigned NOT NULL,
  `gambar_1` varchar(100) DEFAULT NULL,
  `lokasi_gambar_1` varchar(100) DEFAULT NULL,
  `gambar_2` varchar(100) DEFAULT NULL,
  `lokasi_gambar_2` varchar(100) DEFAULT NULL,
  `tanggal_post` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_FKIndex1` (`user_plinplan_id`),
  KEY `post_FKIndex2` (`kategori_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `tanggal_report` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_plinplan`
--

CREATE TABLE IF NOT EXISTS `user_plinplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_user_id` smallint(2) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nama_depan` varchar(30) NOT NULL,
  `nama_belakang` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `status_online` char(1) DEFAULT '0',
  `status_active` char(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_plinplan_unique_username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `user_plinplan_FKIndex1` (`level_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_plinplan_has_pesan`
--

CREATE TABLE IF NOT EXISTS `user_plinplan_has_pesan` (
  `user_plinplan_id` int(10) unsigned NOT NULL,
  `pesan_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_plinplan_id`,`pesan_id`),
  KEY `user_plinplan_has_pesan_FKIndex1` (`user_plinplan_id`),
  KEY `user_plinplan_has_pesan_FKIndex2` (`pesan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
