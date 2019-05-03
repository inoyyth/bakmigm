-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 03, 2019 at 06:55 AM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_edocument`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_picture`
--

CREATE TABLE `employee_picture` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `image_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_picture`
--

INSERT INTO `employee_picture` (`id`, `employee_id`, `image_path`) VALUES
(1, '140491', 'assets/user-picture/1555747681939.jpg'),
(2, '170406', 'assets/user-picture/1555900428243.png'),
(3, '170236', 'assets/user-picture/1556073600230.jpg'),
(4, '171314', 'assets/user-picture/1556608840834.jpg'),
(5, '210569', 'assets/user-picture/1556611372107.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `m_format`
--

CREATE TABLE `m_format` (
  `nama` varchar(255) NOT NULL,
  `variable` varchar(255) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_format`
--

INSERT INTO `m_format` (`nama`, `variable`, `nomor`, `tipe`, `subject`, `isi`) VALUES
('Archived', '{AdminNo},{AdminName},{EmpNo},{EmpName},{Url},{NomorDok},{NamaDok},{Tanggal},{Jam}', 'ARCHV', 'A4', '{NomorDok} - {Tanggal}, {Jam}', '<p>Dokumen {NomorDok} {NamaDok} Diarsipkan.</p>'),
('News', '{AdminNo},{AdminName},{EmpNo},{EmpName},{Url},{NomorDok},{NamaDok},{Tanggal},{Jam}', 'RCPT', 'A4', '{NomorDok} - {Tanggal}, {Jam}', '<p>Dokumen {NomorDok} - {NamaDok} dipublikasi. Bisa diakses dengan URL : {Url}</p>'),
('Notification', '{AdminNo},{AdminName},{EmpNo},{EmpName},{Url},{NomorDok},{NamaDok},{Tanggal},{Jam}', 'RCPT', 'A4', '{NomorDok} - {Tanggal}, {Jam}', '<p>Dokumen {NomorDok} {NamaDok} perlu persetujuan anda. Silahkan login dengan url : {Url}</p>'),
('Obselete', '{AdminNo},{AdminName},{EmpNo},{EmpName},{Url},{NomorDok},{NamaDok},{Tanggal},{Jam}', 'RCPT', 'A4', '{NomorDok} - {Tanggal}, {Jam}', '<p>Dokumen {NomorDok} {NamaDokumen} telah Kadaluarsa!</p>'),
('Receipt', '{AdminNo},{AdminName},{EmpNo},{EmpName},{Url},{NomorDok},{NamaDok},{Tanggal},{Jam}', 'RCPT', 'A4', '{NomorDok} - {Tanggal}, {Jam}', '<p>Terimakasih sudah mendaftarkan dokumen anda lewat aplikasi e-Document. Dokumen Anda diterima oleh : {AdminNo} - {AdminName}<br />Pada : {Hari}/{Tanggal} - {Jam}<br />Nomor Dokumen : {NomorDok}<br />Nama Dokumen : {NamaDok}<br />Diciptakan Oleh : {EmpNo} {EmpName}</p>');

-- --------------------------------------------------------

--
-- Table structure for table `m_group`
--

CREATE TABLE `m_group` (
  `GROUP_ID` varchar(255) NOT NULL,
  `GROUP_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_group`
--

INSERT INTO `m_group` (`GROUP_ID`, `GROUP_NAME`) VALUES
('GP5M', 'GROUP PROSES');

-- --------------------------------------------------------

--
-- Table structure for table `m_icon`
--

CREATE TABLE `m_icon` (
  `id` int(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_icon`
--

INSERT INTO `m_icon` (`id`, `logo`, `text`) VALUES
(1, 'logo1.png', '<p><strong>PT GRIYA MIESEJATI</strong>&nbsp;adalah induk perusahaan restoran cepat saji BAKMI GM, yang merupakan ikon restoran bakmi di Jakarta. Restoran yang dulunya bernama BAKMI GAJAH MADA, didirikan pada tahun 1959 oleh sepasang suami istri Bapak Tjhai Sioe dan Ibu Loei Kwai Fong. Store cabang pertama hadiri di Melawai pada tahun 1971.</p><p>Kini Bakmi GM memiliki outlet-outlet yang tersebar di Jabodetabek, Bandung dan Surabaya. Dengan pengalaman lebih dari 50 tahun di industri restoran, BAKMI GM saat ini melayani lebih dari 30.000 pelanggan per hari.<br /><br />Para pelanggan yang datang menikmati kelezatan menu BAKMI GM setiap harinya berasal dari beragam lapisan umur (tua-muda), dan profesi (pelajar, mahasiswa, eksekutif muda). Sebagai komitmen untuk memberikan yang terbaik kepada para pelanggannya, BAKMI GM senantiasa meningkatkan kualitas dan kuantitas layanannya.<br /><br /><strong>Menu-menu yang terdapat di BAKMI GM dirancang khusus untuk memberikan rasa yang lezat, yang dibuat dari bahan baku pilihan, dan disajikan dengan harga yang ekonomis. Tersedia lebih dari 50 menu yang dapat dipilih oleh pelanggan. Produk-produk baru diluncurkan secara berkala.</strong><br /><br />Merespon kebutuhan pelanggan, BAKMI GM saat ini juga melayani paket ulang tahun anak-anak. Pesta ulang tahun anak Anda akan semakin meriah, jika Anda merayakannya di BAKMI GM. Terdapat 3 pilihan paket ulang tahun di BAKMI GM dalam merayakan ulang tahun yang meriah disertai dengan menikmati menu lezat dan menyehatkan.<br /><br />Restoran-restoran BAKMI GM dapat Anda temukan di berbagai lokasi, mulai dari lokasi perumahan, perkantoran, hingga pusat perbelanjaan, dan setiap restoran BAKMI GM didisain untuk memberikan suasana yang hangat dan menyenangkan.<br /><br />Enerjik dan berdedikasi merupakan dua sifat yang membangun dari kurang lebih 1.200 staff yang tergabung dalam tim pelayanan BAKMI GM, karena memberikan pelayanan yang terbaik bagi setiap pelanggan adalah tujuan utama BAKMI GM.</p><p>&nbsp;</p><p>Klik link ini untuk melihat video &quot;Cerita Kami&quot; :&nbsp;https://www.youtube.com/watch?v=i7yf3Wk5sgk&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `m_log`
--

CREATE TABLE `m_log` (
  `LogID` int(255) NOT NULL,
  `LogDoc` varchar(255) NOT NULL,
  `LogAct` varchar(255) NOT NULL,
  `LogUserName` varchar(255) NOT NULL,
  `Shareto` varchar(255) DEFAULT NULL,
  `LogDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_log`
--

INSERT INTO `m_log` (`LogID`, `LogDoc`, `LogAct`, `LogUserName`, `Shareto`, `LogDate`) VALUES
(1, '1903031420197239685', 'Lihat', '171314', NULL, '2019-03-04 19:12:20'),
(2, '1903050906241783554', 'Lihat', '171314', NULL, '2019-03-04 19:12:37'),
(3, '1903050922414427383', 'Lihat', '170236', NULL, '2019-03-04 19:13:13'),
(4, '1903050922414427383', 'Lihat', '170236', NULL, '2019-03-04 19:14:22'),
(5, '1903050906241783554', 'Lihat', '171314', NULL, '2019-03-04 19:17:42'),
(6, '1903050922414427383', 'Lihat', '210569', NULL, '2019-03-05 00:42:30'),
(7, '1903050906241783554', 'Komentar', '171314', NULL, '2019-03-14 06:15:44'),
(8, '1903050906241783554', 'Bookmark', '171314', NULL, '2019-03-14 06:17:58'),
(9, '1903050906241783554', 'Komentar', '171251', NULL, '2019-03-14 06:27:07'),
(10, '1903050906241783554', 'Bookmark', '171251', NULL, '2019-03-14 06:27:15'),
(11, '1903050906241783554', 'Komentar', '171251', NULL, '2019-03-14 06:36:11'),
(12, '1903050906241783554', 'Download', '171251', NULL, '2019-03-17 18:26:56'),
(13, '1903180946059317835', 'Bookmark', '171251', NULL, '2019-03-17 20:00:38'),
(14, '1903180946059317835', 'Sharelink', '171251', NULL, '2019-03-17 20:06:18'),
(15, '1903050906241783554', 'Download', '210569', NULL, '2019-03-17 21:08:31'),
(16, '1903181146524339961', 'Bookmark', '140491', NULL, '2019-03-17 22:25:15'),
(17, '1903181146524339961', 'Lihat', '140491', NULL, '2019-03-17 22:27:08'),
(18, '1903181146524339961', 'Komentar', '12345', NULL, '2019-03-17 22:45:40'),
(19, '1903181146524339961', 'Komentar', '170406', NULL, '2019-03-17 22:46:47'),
(20, '1903142054476982363', 'Bookmark', '140491', NULL, '2019-03-18 03:31:00'),
(21, '1903181146524339961', 'Bookmark', '171251', NULL, '2019-03-18 03:37:26'),
(22, '1903181716488822119', 'Download', '140491', NULL, '2019-03-19 01:36:42'),
(23, '1903181716488822119', 'Archived', '140491', NULL, '2019-03-19 02:49:52'),
(24, '1903050922414427383', 'Sharelink', '170236', NULL, '2019-03-19 19:00:04'),
(25, '1903181716488822119', 'Komentar', '171314', NULL, '2019-03-19 19:13:53'),
(26, '1903201404014149976', 'Bookmark', '140491', NULL, '2019-03-20 00:21:59'),
(27, '1903201404014149976', 'Sharelink', '140491', NULL, '2019-03-20 00:23:32'),
(28, '1903201404014149976', 'Archived', '140491', NULL, '2019-03-20 00:24:18'),
(29, '1903050922414427383', 'Bookmark', '170236', NULL, '2019-03-20 04:09:37'),
(30, '1903050922414427383', 'Download', '170236', NULL, '2019-03-20 04:11:52'),
(31, '1903050906241783554', 'Sharelink', '210569', NULL, '2019-03-20 04:17:12'),
(32, '1903050906241783554', 'Sharelink', '210569', NULL, '2019-03-20 04:17:12'),
(33, '1903201627054922395', 'Download', '170406', NULL, '2019-03-22 01:57:45'),
(34, '1903221637511979170', 'Bookmark', '150381', NULL, '2019-03-22 03:26:02'),
(35, '1903180946059317835', 'Bookmark', '210546', NULL, '2019-03-22 03:26:04'),
(36, '1903201623487739413', 'Bookmark', '170236', NULL, '2019-03-22 03:35:36'),
(37, '1903050922414427383', 'Archived', '170236', NULL, '2019-03-22 03:38:54'),
(38, '1903050922414427383', 'Archived', '170236', NULL, '2019-03-22 03:38:57'),
(39, '1903050922414427383', 'Sharelink', '170236', NULL, '2019-03-22 03:49:26'),
(40, '1903050922414427383', 'Sharelink', '170236', NULL, '2019-03-22 03:49:26'),
(41, '1903050922414427383', 'Sharelink', '170236', NULL, '2019-03-22 03:49:26'),
(42, '1903050922414427383', 'Sharelink', '170236', NULL, '2019-03-22 03:49:26'),
(43, '1903221705362472794', 'Sharelink', '207316', NULL, '2019-03-22 03:58:23'),
(44, '1903171711301885316', 'Komentar', '206005', NULL, '2019-03-30 06:17:37'),
(45, '1903181330113183895', 'Bookmark', '140491', NULL, '2019-04-03 11:31:13'),
(46, '1903181330113183895', 'Komentar', '140491', NULL, '2019-04-03 11:34:04'),
(47, '1904040057435504413', 'Bookmark', '140491', NULL, '2019-04-03 11:35:32'),
(48, '1904040057435504413', 'Download', '140491', NULL, '2019-04-03 11:36:32'),
(49, '1903162038142399837', 'Archived', '140491', NULL, '2019-04-03 11:43:24'),
(50, '1903170940409388080', 'Archived', '140491', NULL, '2019-04-03 11:44:47'),
(51, '1903162038142399837', 'Download', '171270', NULL, '2019-04-03 11:47:29'),
(52, '1904040057435504413', 'Download', '140491', NULL, '2019-04-03 12:26:45'),
(53, '1903162038142399837', 'Bookmark', '140491', NULL, '2019-04-08 02:34:41'),
(54, '1903162038142399837', 'Download', '140491', NULL, '2019-04-08 03:02:13'),
(55, '1903162038142399837', 'Download', '140491', NULL, '2019-04-08 03:02:17'),
(56, '1903162038142399837', 'Sharelink', '140491', NULL, '2019-04-08 16:14:29'),
(57, '1903162038142399837', 'Sharelink', '140491', NULL, '2019-04-08 16:14:29'),
(58, '1903162038142399837', 'Sharelink', '140491', NULL, '2019-04-08 16:15:29'),
(59, '1903162038142399837', 'Sharelink', '140491', NULL, '2019-04-08 16:15:29'),
(60, '1904161020164804913', 'Lihat', '210569', NULL, '2019-04-15 21:01:11'),
(61, '1904161020164804913', 'Lihat', '210569', NULL, '2019-04-15 21:01:22'),
(62, '1904161020164804913', 'Lihat', '210569', NULL, '2019-04-15 21:01:27'),
(63, '1904161026136248169', 'Download', '170236', NULL, '2019-04-15 22:00:01'),
(64, '1904150903281955566', 'Download', '171314', NULL, '2019-04-16 01:21:36'),
(65, '1903162038142399837', 'Komentar', '150063', NULL, '2019-04-17 22:34:27'),
(66, '1903201623487739413', 'Komentar', '171404', NULL, '2019-04-20 01:12:51'),
(67, '1903050922414427383', 'Download', '212383', NULL, '2019-04-21 20:09:23'),
(68, '1903171711301885316', 'Download', '170406', NULL, '2019-04-21 21:04:47'),
(69, '1904150903281955566', 'Download', '151009', NULL, '2019-04-22 01:50:27'),
(70, '1903162038142399837', 'Download', '140491', NULL, '2019-04-22 19:44:59'),
(71, '1904121454279989841', 'Komentar', '170236', NULL, '2019-04-23 19:34:16'),
(72, '1903180911113091034', 'Download', '211752', NULL, '2019-04-23 20:25:22'),
(73, '1903050906241783554', 'Lihat', '170236', NULL, '2019-04-23 20:25:41'),
(74, '1903180911113091034', 'Download', '204017', NULL, '2019-04-23 20:25:55'),
(75, '1903050906241783554', 'Lihat', '170236', NULL, '2019-04-23 20:26:13'),
(76, '1904161026136248169', 'Lihat', '210569', NULL, '2019-04-23 20:38:27'),
(77, '1904161026136248169', 'Lihat', '210569', NULL, '2019-04-23 20:38:53'),
(78, '1904161026136248169', 'Lihat', '210569', NULL, '2019-04-23 20:38:58'),
(79, '1904161026136248169', 'Lihat', '210569', NULL, '2019-04-23 20:39:24'),
(80, '1903050906241783554', 'Komentar', '171404', NULL, '2019-04-30 00:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `m_maks_comment`
--

CREATE TABLE `m_maks_comment` (
  `id` int(11) NOT NULL,
  `maks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_maks_comment`
--

INSERT INTO `m_maks_comment` (`id`, `maks`) VALUES
(1, 140);

-- --------------------------------------------------------

--
-- Table structure for table `m_no`
--

CREATE TABLE `m_no` (
  `id` int(255) NOT NULL,
  `nomor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_no`
--

INSERT INTO `m_no` (`id`, `nomor`) VALUES
(1, 'TMP6201902/001');

-- --------------------------------------------------------

--
-- Table structure for table `m_nomor`
--

CREATE TABLE `m_nomor` (
  `id` int(255) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `field_1` varchar(255) NOT NULL,
  `field_2` varchar(255) NOT NULL,
  `field_3` varchar(255) NOT NULL,
  `field_4` varchar(255) NOT NULL,
  `field_5` varchar(255) NOT NULL,
  `untuk` varchar(255) NOT NULL,
  `m_nomor` varchar(255) NOT NULL DEFAULT '000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_nomor`
--

INSERT INTO `m_nomor` (`id`, `Code`, `Nama`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `untuk`, `m_nomor`) VALUES
(4, 'DOCNO', 'Nomor Dokumen', 'Table', 'Year', 'Month', 'Delimeter', 'Free Text', 'form', 'STO201905/006'),
(5, 'RCPT', 'Receipt', 'Table', 'Year', 'Month', 'Delimeter', 'Free Text', 'email', '000'),
(6, 'ARCHV', 'Archived', 'Table', 'Month', 'Year', 'Delimeter', 'Free Text', 'email', '000');

-- --------------------------------------------------------

--
-- Table structure for table `m_proses`
--

CREATE TABLE `m_proses` (
  `PROSES_ID` varchar(255) NOT NULL,
  `PROSES_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_proses`
--

INSERT INTO `m_proses` (`PROSES_ID`, `PROSES_NAME`) VALUES
('PROSES', 'PROSES');

-- --------------------------------------------------------

--
-- Table structure for table `m_sharelink`
--

CREATE TABLE `m_sharelink` (
  `id` int(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_sharelink`
--

INSERT INTO `m_sharelink` (`id`, `time`) VALUES
(1, '1440');

-- --------------------------------------------------------

--
-- Table structure for table `m_watermark`
--

CREATE TABLE `m_watermark` (
  `id` int(255) NOT NULL,
  `field_1` varchar(255) NOT NULL,
  `field_2` varchar(255) NOT NULL,
  `field_3` varchar(255) NOT NULL,
  `field_4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_watermark`
--

INSERT INTO `m_watermark` (`id`, `field_1`, `field_2`, `field_3`, `field_4`) VALUES
(1, 'Absolute', 'NIP', 'Tanggal/Bulan/Tahun', 'Nama');

-- --------------------------------------------------------

--
-- Table structure for table `tb_business_rule`
--

CREATE TABLE `tb_business_rule` (
  `BSRE_ID` varchar(150) NOT NULL DEFAULT '-',
  `BSRE_HOBRC_TYPE_OF_ACTIVITY` varchar(150) NOT NULL DEFAULT '-' COMMENT 'NOTIFICATION,UPLOAD,DOWNLOAD,PUBLISH,ARCHIVED',
  `BSRE_HOBRC_MESSAGE_TEMPLATE` varchar(150) NOT NULL DEFAULT '-',
  `BSRE_BR_CONDITION` varchar(150) NOT NULL DEFAULT '-',
  `BSRE_OOA_MEDIA` varchar(150) NOT NULL DEFAULT '-' COMMENT 'PUSH NOTIFICATION,EMAIL NOTIFICATION',
  `BSRE_OOA_REPEAT` varchar(150) NOT NULL DEFAULT '-' COMMENT '15,30,45,60 DAYS',
  `BSRE_EOA_CONDITION` varchar(150) NOT NULL DEFAULT '-',
  `BSRE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_confidential`
--

CREATE TABLE `tb_confidential` (
  `CL_ID` varchar(255) NOT NULL DEFAULT '-',
  `CL_NAME` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_confidential`
--

INSERT INTO `tb_confidential` (`CL_ID`, `CL_NAME`) VALUES
('CONF', 'CONFIDENTIAL'),
('NCNF', 'NON CONFIDENTIAL'),
('REST', 'RESTRICTED');

-- --------------------------------------------------------

--
-- Table structure for table `tb_departemen`
--

CREATE TABLE `tb_departemen` (
  `DN_ID` varchar(255) NOT NULL,
  `DN_CODE` varchar(255) NOT NULL,
  `DN_NAME` varchar(255) NOT NULL,
  `DI_ID` varchar(255) NOT NULL,
  `SYNC_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_departemen`
--

INSERT INTO `tb_departemen` (`DN_ID`, `DN_CODE`, `DN_NAME`, `DI_ID`, `SYNC_DATE`) VALUES
('1844', 'GMABMG', 'Building Management GEMA', '1843', '2019-05-03 05:00:02'),
('5882', 'MKT', 'Marketing', '5880', '2019-05-03 05:00:02'),
('5893', 'BPJ', 'Building Project', '5880', '2019-05-03 05:00:02'),
('5898', 'BDV', 'Business Development', '5880', '2019-05-03 05:00:02'),
('5904', 'IRL', 'Industrial Relation, Cooperatives & Personnel Admin ', '5901', '2019-05-03 05:00:02'),
('5922', 'CnB', 'COMPENSATION & BENEFIT DEPARTMENT', '5901', '2019-05-03 05:00:02'),
('5926', 'LnD', 'LEARNING & DEVELOPMENT DEPARTMENT', '5901', '2019-05-03 05:00:02'),
('5942', 'REC', 'Recruitment Department', '5901', '2019-05-03 05:00:02'),
('6467', 'PPIC', 'PPIC', '6465', '2019-05-03 05:00:02'),
('6473', 'WHS', 'Warehouse', '6465', '2019-05-03 05:00:02'),
('6494', 'PLANT', 'Plant Department', '7840', '2019-05-03 05:00:02'),
('6526', 'PRCH', 'Purchasing', '6465', '2019-05-03 05:00:02'),
('6534', 'AMG', 'Asset Management Department', '6571', '2019-05-03 05:00:02'),
('6540', 'ACC', 'Accounting & Tax Department', '6538', '2019-05-03 05:00:02'),
('6551', 'FIN', 'Finance Department', '6538', '2019-05-03 05:00:02'),
('6559', 'SYS', 'System Development', '5877', '2019-05-03 05:00:02'),
('6563', 'ITY', 'Information Technology Department', '6538', '2019-05-03 05:00:02'),
('6573', 'OSV', 'Office Service Department', '6571', '2019-05-03 05:00:02'),
('6588', 'EKP', 'Engineering KP Department', '6571', '2019-05-03 05:00:02'),
('6678', 'PPM', 'Property Management Department', '6571', '2019-05-03 05:00:02'),
('6684', 'GMSOPS100H', 'Operation HO Office', '5977', '2019-05-03 05:00:02'),
('6685', 'LOG', 'Logistic', '6465', '2019-05-03 05:00:02'),
('6837', 'CST', 'Costing Department', '6538', '2019-05-03 05:00:02'),
('7013', 'BDT', 'Plan & Budget Department', '6538', '2019-05-03 05:00:02'),
('7016', 'CHS.FT1', 'Food Truck', '5977', '2019-05-03 05:00:02'),
('7080', 'CPP.ES', 'CPP ENGINEERING', '7818', '2019-05-03 05:00:02'),
('7081', 'CPP.QAQC', 'CPP QA-QC', '7176', '2019-05-03 05:00:02'),
('7083', 'CPP.PPIC', 'CPP PPIC & WAREHOUSE', '7818', '2019-05-03 05:00:02'),
('7091', 'CSY', 'Corporate Secretary', '7841', '2019-05-03 05:00:02'),
('7150', 'SPE', 'Store Process Engineering', '6571', '2019-05-03 05:00:02'),
('7151', 'EST', 'Engineering Store Department', '6571', '2019-05-03 05:00:02'),
('7152', 'CHS', 'CHANNEL SALES', '5977', '2019-05-03 05:00:02'),
('7153', 'PMO', 'PMO DEPARTMENT', '5977', '2019-05-03 05:00:02'),
('7175', 'QCL', 'Quality Control Department', '6682', '2019-05-03 05:00:02'),
('7176', 'QUA', 'RnD QA-QC Department', '6682', '2019-05-03 05:00:02'),
('7239', 'PMPD', 'Performance Management & People Development', '5901', '2019-05-03 05:00:02'),
('7371', 'PROC', 'PROCUREMENT', '6465', '2019-05-03 05:00:02'),
('7407', 'CPP.FRM', 'CPP FORMULATION', '7818', '2019-05-03 05:00:02'),
('7488', 'CPG', 'Corporate Planning Department', '5877', '2019-05-03 05:00:02'),
('7494', 'IAD', 'Internal Audit Department', '5877', '2019-05-03 05:00:02'),
('7527', 'HSP', 'Human Resources Support', '5901', '2019-05-03 05:00:02'),
('7550', 'BPI', 'BUSINESS PROCESS IMPROVEMENT', '7549', '2019-05-03 05:00:02'),
('7555', 'RnD', 'R&D', '6682', '2019-05-03 05:00:02'),
('7562', 'SPA', 'STORE PERFORMANCE ANALYST DEPARTMENT', '5977', '2019-05-03 05:00:02'),
('7564', 'SDP', 'STORE DEMAND PLANNING DEPARTMENT', '5977', '2019-05-03 05:00:02'),
('7591', 'CPP.FLOUR', 'CPP - FLOUR PROCESSING', '7818', '2019-05-03 05:00:02'),
('7596', 'CPP.FOOD', 'CPP - FOOD PROCESSING', '7818', '2019-05-03 05:00:02'),
('7603', 'DAE', 'Design & Architecture Department', '5880', '2019-05-03 05:00:02'),
('7761', 'FIN.AR.0001', 'Finance Account Receivable', '6551', '2019-05-03 05:00:02'),
('7762', 'FIN.AP.0002', 'Finance Account Payable & Expenses', '6551', '2019-05-03 05:00:02'),
('7769', 'QAQC', 'QA QC SUPPLY DEPARTMENT', '6682', '2019-05-03 05:00:02'),
('7924', 'MAT', 'Management Audit Department', '7841', '2019-05-03 05:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_direktorat`
--

CREATE TABLE `tb_direktorat` (
  `DT_ID` varchar(255) NOT NULL DEFAULT '-',
  `DT_NAME` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_direktorat`
--

INSERT INTO `tb_direktorat` (`DT_ID`, `DT_NAME`) VALUES
('DIR.001', 'DIREKTORAT SUPPLY & OPERATION'),
('DIR.002', 'DIREKTORAT STRATEGIC CORPORATE, HR & FAST'),
('DIR.003', 'DIREKTORAT BUSINESS DEVELOPMENT'),
('DIR.004', 'DIREKTORAT ENGINEERING SERVICES & PROCESS DEVELOPMENT');

-- --------------------------------------------------------

--
-- Table structure for table `tb_distribution_method`
--

CREATE TABLE `tb_distribution_method` (
  `DNMD_ID` varchar(255) NOT NULL DEFAULT '-',
  `DNMD_NAME` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_distribution_method`
--

INSERT INTO `tb_distribution_method` (`DNMD_ID`, `DNMD_NAME`) VALUES
('EDOC', 'e-Document'),
('EMAIL', 'EMAIL'),
('OTH', 'LAINNYA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_divisi`
--

CREATE TABLE `tb_divisi` (
  `DI_ID` varchar(255) NOT NULL DEFAULT '-',
  `DI_CODE` varchar(255) NOT NULL DEFAULT '-',
  `DI_NAME` varchar(255) NOT NULL DEFAULT '-',
  `DT_ID` varchar(255) NOT NULL DEFAULT '-',
  `SYNC_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_divisi`
--

INSERT INTO `tb_divisi` (`DI_ID`, `DI_CODE`, `DI_NAME`, `DT_ID`, `SYNC_DATE`) VALUES
('5880', 'BDD', 'Business Development Division', 'DIR.003', '2019-05-03 05:00:02'),
('5901', 'HRS', 'Human Resource Division', 'DIR.002', '2019-05-03 05:00:02'),
('5977', 'OPT', 'Operations Division', 'DIR.001', '2019-05-03 05:00:02'),
('6465', 'SUPL', 'SUPPLY KP DIVISION', 'DIR.001', '2019-05-03 05:00:02'),
('6538', 'FAST', 'Finance, Acct, Costing, Budget, IT Division', 'DIR.002', '2019-05-03 05:00:02'),
('6571', 'EnS', 'ENGINEERING & SERVICES DIVISION', 'DIR.004', '2019-05-03 05:00:02'),
('6682', 'QRD', 'RnD QAQC Corporate', 'DIR.004', '2019-05-03 05:00:02'),
('7549', 'PDD', 'PROCESS DEVELOPMENT DIVISION', 'DIR.004', '2019-05-03 05:00:02'),
('7818', 'CPP', 'CPP-Supply Division', 'DIR.001', '2019-05-03 05:00:02'),
('7841', 'OTH', 'Other Strategic Division', 'DIR.001', '2019-05-03 05:00:02'),
('7911', 'KDP', 'DC - KANTOR DENPASAR BALI', '', '2019-05-03 05:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document`
--

CREATE TABLE `tb_document` (
  `DOC_ID` varchar(150) NOT NULL DEFAULT '-',
  `DOC_DATE` datetime NOT NULL,
  `DOC_KATEGORI` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DTSEKI_ID',
  `DOC_JENIS` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DTSEJS_ID',
  `DOC_TIPE` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DTSETE_ID',
  `DOC_GROUP_PROSES` varchar(150) NOT NULL DEFAULT '-',
  `DOC_PROSES` varchar(150) NOT NULL DEFAULT '-',
  `DOC_NOMOR` varchar(150) NOT NULL DEFAULT '-',
  `DOC_NAMA` varchar(150) NOT NULL DEFAULT '-',
  `DOC_WUJUD` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DTFM_ID',
  `DOC_DISTRIBUSI` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DNMD_ID',
  `DOC_KERAHASIAAN` varchar(255) NOT NULL DEFAULT '-' COMMENT 'CL_ID',
  `DOC_AKSES_LEVEL` text NOT NULL COMMENT 'ARRAY JBLL_ID',
  `DOC_PENGGUNA` text NOT NULL COMMENT 'ARRAY DT_ID',
  `DOC_PEMILIK_PROSES` text NOT NULL,
  `DOC_PENYIMPAN` text NOT NULL,
  `DOC_PENDISTRIBUSI` text NOT NULL,
  `DOC_VERSI` varchar(255) NOT NULL DEFAULT '-',
  `DOC_TGL_EFEKTIF` date NOT NULL,
  `DOC_PERIODE_PREVIEW` varchar(255) NOT NULL DEFAULT '-',
  `DOC_TGL_EXPIRED` date NOT NULL,
  `DOC_KATA_KUNCI` varchar(255) NOT NULL DEFAULT '-',
  `DOC_ABSTRAK` text NOT NULL,
  `DOC_TERKAIT` text NOT NULL COMMENT 'ARRAY DOC_ID',
  `DOC_MAKER` varchar(150) NOT NULL DEFAULT '-',
  `DOC_LEVEL` varchar(255) NOT NULL,
  `DOC_APPROVE` varchar(150) NOT NULL DEFAULT '-',
  `DOC_STATUS` varchar(150) NOT NULL DEFAULT '-',
  `DOC_STATUS_ACTIVITY` text NOT NULL,
  `DOC_NOTE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document`
--

INSERT INTO `tb_document` (`DOC_ID`, `DOC_DATE`, `DOC_KATEGORI`, `DOC_JENIS`, `DOC_TIPE`, `DOC_GROUP_PROSES`, `DOC_PROSES`, `DOC_NOMOR`, `DOC_NAMA`, `DOC_WUJUD`, `DOC_DISTRIBUSI`, `DOC_KERAHASIAAN`, `DOC_AKSES_LEVEL`, `DOC_PENGGUNA`, `DOC_PEMILIK_PROSES`, `DOC_PENYIMPAN`, `DOC_PENDISTRIBUSI`, `DOC_VERSI`, `DOC_TGL_EFEKTIF`, `DOC_PERIODE_PREVIEW`, `DOC_TGL_EXPIRED`, `DOC_KATA_KUNCI`, `DOC_ABSTRAK`, `DOC_TERKAIT`, `DOC_MAKER`, `DOC_LEVEL`, `DOC_APPROVE`, `DOC_STATUS`, `DOC_STATUS_ACTIVITY`, `DOC_NOTE`) VALUES
('1903031420197239685', '2019-03-03 14:33:14', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', '', 'SOP201903/001', 'SOP PPMH', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '5904|7550|6563', '5904', '5904', '7550', '1.1', '2016-04-30', '24', '2016-11-30', 'manhour, portion, ppmh, galau, tambah', 'Adapun kaidah-kaidah standar yang sudah disepakati adalah sebagai berikut :\r\n1.	Pengakuan data yang dihitung di store tujuan mutasi adalah apabila tanggal mutasi pekerja terjadi antara tanggal 1 sd 14. Apabila tanggal mutasi terjadi diantara tanggal 15 sd akhir bulan , maka akan menjadi beban man hour store asal mutasi.\r\n2.	Perhitungan  man hour hanya bagi pekerja dengan status Diklat Tetap, PKWT, T', '', '171251', 'DEPARTEMEN', '200054', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903050906241783554', '2019-03-05 09:20:39', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-HRS-KMS-01', 'Aplikasi Service Desk (Requester Login)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR', '5904|5922|5926|5942|7239|7527|7550', '7527', '7550', '7550', '1.0', '2018-04-01', '12', '2019-03-31', 'Service Desk, requester, login, manual', 'Manual penggunaan service desk dari sisi requester', '', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903050922414427383', '2019-03-14 14:45:55', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-HRS-KMS-02', 'Aplikasi Service Desk (Technician Login)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|5922|5926|5942|7239|7527|7550', '7527', '7550', '7527', '1.0', '2018-04-01', '12', '2019-03-22', 'Service Desk, Technician, manual', 'Manual penggunaan Service Desk terkait dari technician', '', '170236', 'DEPARTEMEN', 'JOHAN MOHAMMAD', 'DIARSIPKAN', 'Diarsipkan oleh JOHAN MOHAMMAD', 'Dana dinyatakan sebagai perusahaan fiktip. dan Sudah pailid. tehiotung besok'),
('1903141353374319124', '2019-03-14 14:14:44', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM201903/0-1', 'Formulir Pengetahuan Strategis', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '7527|7550', '7527', '7550', '7550', '1.0', '2019-02-01', '12', '2020-01-31', 'Formulir, FRM, knowledge management, KM, pengetahuan strategis, strategic knowledge, critical knowledge, form, daftar, pengetahuan, strategis, tabel, bagan, management, knowledge, SME, subject matter expert, subject, matter, expert, test, latihan, contoh,', 'Formulir untuk mendaftarkan pengetahuan strategis bakmi GM beserta SMEnya', '1903050922414427383', '210569', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903141542331934082', '2019-03-14 15:54:36', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/014', 'Dokumen Testing 15.44', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH', '5904|6563|7550', '5904', '7550', '7550', '1.0', '2018-01-31', '12', '2019-01-30', 'dok, eksternal', 'abstarak dokumen bisa dilihat ITY,IRL,BPI', '1903031420197239685', '171251', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903141910315360253', '2019-03-14 19:14:41', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/015', 'BPM ITY 01', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5926|6563|7550', '6563', '7550', '7550', '1.0', '2018-02-28', '12', '2019-02-27', 'ity, information, technology', 'abstrak ITY 01', '', '140491', 'DEPARTEMEN', 'ANTHONY PAMUNGKAS', 'DITOLAK 6538', 'Ditolak FAST ( Finance, Acct, Costing, Budget, IT Division )', '-'),
('1903142054476982363', '2019-03-14 20:56:42', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/016', 'SKENARIO 02', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH', '6563|7550|5882|5904', '6563', '7550', '6563', '1.1', '2018-03-12', '12', '2019-03-11', 'testing', 'abstarak aja', '', '140491', 'DEPARTEMEN', 'ANTHONY PAMUNGKAS', 'DITOLAK 6538', 'Ditolak FAST ( Finance, Acct, Costing, Budget, IT Division )', '-'),
('1903150841576896678', '2019-03-15 08:46:10', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0020', 'GROUP PROSES', 'PROSES', 'OPC201903/017', 'dd', 'HCD', 'EMAIL', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|7550|5882|5893|5898|5922', '5904', '5904', '5904', '1.1', '2019-03-10', '6', '2019-09-15', 'r', 'r', '', '171251', 'DEPARTEMEN', '200054', 'MENUNGGU ATASAN PENCIPTA', 'Menunggu Persetujuan dari HRS (Human Resource Division)', '-'),
('1903162038142399837', '2019-04-08 16:52:53', 'DTSEKI0001', 'DTSEJS0001', 'DTSETE0001', 'GROUP PROSES', 'PROSES', 'VIS201903/019', 'TES DOK', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924|5898', '6563', '6563', '7550', '2.0', '2018-08-26', '6', '2019-02-25', 'jhkjh', 'sfsdklfsdf sflksdf jskdlfjsdlf', '1903142054476982363', '140491', 'DEPARTEMEN', '171270', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903170940409388080', '2019-03-17 09:47:07', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201903/020', 'Test Minggu', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '6563|7550|7924', '6563', '7550', '6538', '1.0', '2019-03-16', '12', '2019-04-04', 'masih error', 'di pendistribusi', '1903142054476982363', '140491', 'DEPARTEMEN', 'HENDRI WIJAYA', 'DIARSIPKAN', 'Diarsipkan oleh HENDRI WIJAYA', 'tes lagi ah di arsip mauu gak yah'),
('1903171711301885316', '2019-03-18 10:52:04', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201903/021', 'SETUP PUBLIC HOLIDAY', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6678|5898|5882|5893|5898|6563|7550|7924|5904', '6563', '7550', '7550', '1.0', '2018-03-01', '12', '2019-02-28', 'PUBLIC HOLIDAY, HRIS, ADMINISTRASI', 'PROSEDUR ADMINISTRASI PUBLIC HOLIDAY PADA APLIKASI HRIS', '', '140491', 'DEPARTEMEN', '170406', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903171719262822556', '2019-03-17 17:22:40', 'DTSEKI0002', 'DTSEJS0011', 'DTSETE0011', 'GROUP PROSES', 'PROSES', 'STO201903/022', 'tes dok', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7550|7924', '7550', '7550', '7550', '1.0', '2019-02-24', '12', '2020-02-23', 'trtrt', 'dgdfgdfg', '1903050906241783554|1903142054476982363', '171314', 'DEPARTEMEN', '212383', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1903171744259661130', '2019-03-17 17:47:49', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/023', 'SETUP NEW STORE', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '7550', '1.0', '2018-03-06', '12', '2019-03-05', 'new store, setup new store, store, opening store', 'ini adalah prosedur untuk pembukaan store baru', '', '140491', 'DEPARTEMEN', 'NIDIA', 'DITOLAK 7550', 'Ditolak BPI ( BUSINESS PROCESS IMPROVEMENT )', '-'),
('1903180911113091034', '2019-03-18 09:17:26', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-SCH-1.3', 'Pengajuan Cuti Mendadak', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|7550|7924', '5904', '7550', '7550', '1.0', '2019-03-18', '12', '2020-03-17', 'Cuti tidak terencana', 'Mengendalikan dan memonitor aktivitas permohonan cuti mendadak yang diajukan oleh pekerja Bakmi GM', '1903050906241783554', '171251', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903180914206053569', '2019-03-18 11:10:55', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', 'GROUP PROSES', 'PROSES', 'JBS201903/024', 'Job Summary KM Staff', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7550', '7550', '2.0', '2020-03-13', '24', '2021-02-28', 'Job, summary, job summary, KM, staff, knowledge, management, knowledge management, km staff, hr support, HRD, human resources support, human resource division, tambah', 'Job Summary mengenai KM Staff', '1903050906241783554', '170236', 'DEPARTEMEN', '200054', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903180919514736897', '2019-03-18 09:43:54', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-SCH-1.1', 'Pengajuan Cuti dan Libur', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '5904', '7550', '7550', '1.0', '2019-03-18', '12', '2020-03-17', 'C1, c2, c3, c4, c5, c6, l1, cuti, cuti tahunan, libur mingguan', 'Prosedur untuk mengendalikan dan memonitor aktivitas permohonan cuti dan libur yang diajukan oleh pekerja Bakmi GM.', '1903050906241783554', '171251', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903180946059317835', '2019-03-18 09:53:51', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-SCH-1.5', 'Administrasi Absensi', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '5904', '7550', '7550', '1.0', '2019-03-18', '6', '2019-09-17', 'administrasi', 'Mengatur pengerjaan administrasi absensi oleh PIC Absensi di Store, sehingga Laporan Absensi Store dikirimkan tepat waktu ke Departemen Personalia.', '', '171251', 'DEPARTEMEN', '212383', '5901', 'Menunggu Persetujuan dari HRS (Human Resource Division)', '-'),
('1903181002417186873', '2019-03-18 10:05:24', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-SCH-1.2', 'Pengajuan Cuti dan Libur', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '5904', '7550', '7550', '1.0', '2019-03-18', '12', '2020-03-17', 'c1, c2, c3, c4, c5, c6, l1, Cuti tahunan, libur mingguan', 'Untuk mengendalikan dan memonitor aktivitas permohonan cuti dan libur yang diajukan oleh pekerja Bakmi GM.', '1903180946059317835', '171251', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903181114109063798', '2019-03-18 13:37:54', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201903/002', 'Skenario 02', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|7550|7924', '5904', '7550', '7550', '1.0', '2019-01-01', '6', '2019-06-30', 'cuti, administrasi', 'administrasi cuti\r\n', '', '171251', 'DEPARTEMEN', 'HARRY NUGROHO POERNOMO', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903181146524339961', '2019-03-18 12:15:41', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP-ITY-S&S-1.5', 'Penanganan Masalah CCTV', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|6551|6563|7550|7924', '6563', '7550', '7550', '1.1', '2019-03-18', '12', '2020-03-17', 'CCTV, kamera', 'Memberikan acuan terkait proses dukungan dan layanan teknologi informasi, baik untuk perangkat lunak maupun keras di Store.', '', '140491', 'DEPARTEMEN', '171270', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903181330113183895', '2019-04-08 16:32:45', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201903/003', 'PERATURAN PERUSAHAAN', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5882|5893|5898|5904|5922|5926|5942|6467|6473|6526|6534|6540|6551|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '6563', '7550', '7550', '2.0', '2018-10-31', '6', '2019-04-29', 'peraturan bahasa', 'abstrak bahasa', '1903171711301885316', '140491', 'DEPARTEMEN', '212383', '6538', 'Menunggu Persetujuan dari FAST (Finance, Acct, Costing, Budget, IT Division)', '-'),
('1903181519084810445', '2019-03-18 15:20:55', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', '', '', 'MNL201903/004', 'MANUAL DOKUMEN ITY', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '7550', '1.0', '2018-08-25', '6', '2019-02-24', 'manual', 'apapun jadilah , yang penting jangan pucianng', '', '170406', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903181716488822119', '2019-03-19 10:31:36', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP-ITY-S&S-1.6', 'Penanganan Masalah UPS', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|6563|7550|7924', '6563', '7550', '7550', '1.1', '2019-03-18', '12', '2019-03-19', 'UPS, Daya Mati, Mati Listrik, Backup Listrik, Baterai Mati, Batre Mati, Ganti Baterai, Ganti Batre', 'Memberikan acuan terkait proses dukungan dan layanan teknologi informasi, baik untuk perangkat lunak maupun keras di Store.', '', '140491', 'DEPARTEMEN', 'HENDRI WIJAYA', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', 'contoh dilakukan pengarsipan dokumen (obsolete dokumen)'),
('1903191332319102698', '2019-03-19 14:15:42', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/002', 'BPM ITY SKENARIO 2', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5882|6563|7550|7924|5904', '6563', '7550', '7550', '1.0', '2019-01-09', '6', '2019-07-08', 'bpm, ity, kunci aja', 'abstrak bpm ity 02', '', '140491', 'DEPARTEMEN', 'ANTHONY PAMUNGKAS', 'DITOLAK 6538', 'Ditolak FAST ( Finance, Acct, Costing, Budget, IT Division )', '-'),
('1903201006299867884', '2019-03-20 10:25:57', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/003', 'Dokumen ITY Punya nomor 003', 'HCD', 'EDOC', 'CONF', 'CRW|DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5882|5922|5942|6563|7550|7924|5904', '6563', '7550', '7550', '1.1', '2018-10-01', '6', '2019-03-31', 'ITY, nomor 03, dokumen ity', 'Abstrak dokumen oktober 2018', '', '140491', 'DEPARTEMEN', '170406', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903201207573824411', '2019-03-20 12:11:23', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/004', 'tets rabu', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '7550', '1.0', '2019-03-19', '6', '2019-09-18', 'test', 'rabu', '1903180946059317835', '140491', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903201404014149976', '2019-03-20 15:40:04', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201903/005', 'Hari Rabu - versioning 20190320', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '6563|7550|7924|5882|5904|5922|5926|5942', '6563', '7550', '7550', '2.0', '2019-03-20', '12', '2019-03-20', 'Republika, rabu aja', 'Kompas', '', '140491', 'DEPARTEMEN', '-', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903201623487739413', '2019-03-20 17:33:52', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'MNL-PFM-PMPD-1.3.2', 'Sistem Penilaian Kinerja Berbasis Kompetensi KP-CPP', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5893|1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '6563', '7550', '7550', '1.3', '2017-11-01', '12', '2018-10-31', 'Penilaian Kinerja, Kompetensi, PA, BSC', 'Prosedur penilaian prestasi kerja berbasis kompetensi yang merupakan gabungan dari keterampilan, pengetahuan, dan sikap yang ditunjukkan pekerja dalam melaksanakan pekerjaannya', '', '170406', 'DEPARTEMEN', '171270', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903201626163202050', '2019-03-20 17:29:58', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'FRM-ERP-SPL-01', 'FORM PENGAJUAN KODE BARANG ( PKB )', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7550|6540|7550|7924', '6540', '7550', '7550', '1.0', '2014-03-25', '24', '2016-03-24', 'ITEM, NUMBER, CODE, REQUEST', 'asdsadhaskjdhasjkdkasdkaj', '', '160997', 'DEPARTEMEN', '171314', '6538', 'Menunggu Persetujuan dari FAST (Finance, Acct, Costing, Budget, IT Division)', '-'),
('1903201627053424414', '2019-03-20 17:40:30', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', '', '', 'PKP-P&B-PKA-1', 'Perencanaan Anggaran', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '6685|1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '7013', '7550', '7550', '1.0', '2019-03-20', '12', '2020-03-19', 'budget, anggaran, planning', 'tentang budget', '', '180887', 'DEPARTEMEN', 'THOMAS ADITYA PANDU WIRAWAN', 'DITOLAK 7550', 'Ditolak BPI ( BUSINESS PROCESS IMPROVEMENT )', '-'),
('1903201627054922395', '2019-03-20 17:53:31', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-HRS-KMS-001', 'Pelaksanaan Sharing Knowledge Bakmi GM', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|5922|5942|6540|6551|6563|6837|7239|7527|7550|7924', '7527', '7550', '7550', '1.1', '2018-11-01', '12', '2019-10-31', 'Sharing Knowledge, Manual, MNL, General, Internal, Knowledge Management, KM', 'Dokumen Manual pelaksanaan Sharing Knowledge di lingkungan Bakmi GM', '', '170236', 'DEPARTEMEN', '210569', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903201641246109276', '2019-03-20 17:33:55', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'FRM-TRN-DEA-012', 'PKRP Seksi Mie-Intermediate & Advance', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '5926|6684|7550|7924', '5926', '7550', '7550', '1.0', '2019-04-01', '12', '2020-03-31', 'advan, pk, kom, crew, petugas', 'Dokumen PKRP mencantumkan level kompetensi karyawan operasional. form ini harus di isi dan di up date setiap bulan.', '', '206366', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903201656376038452', '2019-03-20 17:35:03', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-OPT-FPC-01', 'LSM', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6837|7550|7924', '6837', '7550', '7550', '1.0', '2019-03-20', '12', '2020-03-19', 'STOCK, STOK, LSM, MIE', 'dokumen yang berisi laporan barang barang sisa semalam', '', '99305', 'DEPARTEMEN', 'THOMAS ADITYA PANDU WIRAWAN', 'DITOLAK 7550', 'Ditolak BPI ( BUSINESS PROCESS IMPROVEMENT )', '-'),
('1903201735347302757', '2019-03-20 17:43:02', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-ITY-2019-03', 'ITY 2019 03', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '6563', '7550', '7550', '1.0', '2019-03-19', '6', '2019-09-18', 'ity, nilai budaya', 'abstrak registrasi dokumen\r\n', '1903201006299867884', '140491', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903211356343481427', '2019-03-21 13:57:54', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201903/0-2', 'Test 2', 'HCD', 'EMAIL', 'REST', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '7550', '6563', '6563', '7550', '1.0', '2019-03-21', '6', '2019-09-20', 'test', 'Test', '1903141910315360253', '140491', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903221637432531222', '2019-03-22 17:04:53', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-OPT-FPC-01 Ver. 3.12', 'LSM Harian Sie Mie', 'HCD', 'EDOC', 'CONF', 'JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '6837|6837|7550|7564|7924', '6837', '7550', '7550', '1', '2019-03-22', '24', '2021-03-21', 'STOCK, LSM STORE', 'LAPORAN SISA MALAM', '1903201656376038452', '210546', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903221637442174595', '2019-03-22 17:07:33', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-FIN-FIN-1.3', 'PENGELUARAN KAS KECIL', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '7550|7762|7924', '7762', '7550', '7550', '1.0', '2019-03-25', '6', '2019-09-24', 'PETTY CASH, PETTY KAS, PC, PETY CASH, PETY KAS, PETTI CASH, PETTI KAS', 'PENGELUARAN KAS KECIL', '', '211363', 'DEPARTEMEN', '211363', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903221637511979170', '2019-03-22 17:04:18', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', '', '', 'PKP-FIN-FIN-2', 'Pengeluaran Dana Kas Kecil', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV', '7550|6540|6563|7013|7550|7924', '6538', '7550', '7550', '1.2', '2019-03-01', '24', '2021-02-28', 'PETTY CASH, TRANSAKSI, UANG, KAS KECIL, PENGELUARAN', 'PENGELUARAN KAS KECIL', '', '150381', 'DEPARTEMEN', '171270', 'MENUNGGU PENDISTRIBUSI', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903221643485217289', '2019-03-22 17:04:36', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-ERP-SPL-02', 'Formulir Pengajuan Kode Barang (PKB)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH', '5922|6540|7550|7924', '6540', '7550', '7550', '1.0', '2019-01-01', '24', '2020-12-31', 'kode barang', 'Tata cara pengajuan kode item barang', '1903201626163202050', '207316', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903221645108347192', '2019-03-22 16:59:19', 'DTSEKI0004', 'DTSEJS0021', 'DTSETE0032', '', '', '004 / MMO-PEM / HR-IRL / I / 2014', 'Pengisian Formulir Daftar Isian Peserta (Formulir 1) - BPJS Kesehatan', 'HCD', 'EMAIL', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV', '5922|6540|7550|7924', '5922', '5901', '5901', '1.0', '2019-03-22', '12', '2020-03-21', 'BPJS', 'PENGISIAN DATA BPJS KESEHATAN\r\n\r\n', '', '150521', 'DEPARTEMEN', '-', '5901', 'Menunggu Persetujuan dari HRS (Human Resource Division)', '-'),
('1903221705362472794', '2019-03-22 17:10:08', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-ERP-SPL-02', 'Formulir Pengajuan Kode Barang (PKB)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6540|7550|7924', '6540', '7550', '7550', '1.0', '2019-01-01', '24', '2020-12-31', 'kode barang, kode brg', 'Tata Cara pengajuan kode dokumen', '', '207316', 'DEPARTEMEN', '171270', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903221708013233733', '2019-03-22 17:12:52', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/004', 'Administrasi penggantian biaya olahraga dan musik', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5922|6551|7527|7550|7761|7762|7924', '7527', '7550', '7550', '1.0', '2019-03-01', '24', '2021-02-28', 'Reimbursement, rembes, reimbus, reimbes, futsal, ganti uang futsal, band, uang musik', 'Menjelaskan proses administrasi reimbursement biaya oelahraga dan musik', '1903181330113183895', '210569', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903271005521122252', '2019-03-27 10:29:49', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS-HSP-ERM-01', 'Employee Relation Specialist', 'HCD', 'EDOC', 'CONF', 'STAF|DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5926|5942|7013|7239|7527|7550|7924', '7527', '7550', '7550', '1.0', '2019-03-27', '12', '2020-03-26', 'job, summary, employee, relation, specialist', 'Dokumen yang menjelaskan peran, tanggung jawab dan wewenang dari posisi employee relation specialist', '', '210569', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1903271100144059466', '2019-03-27 11:01:42', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/000', 'Test', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '7550', '1.0', '2019-03-27', '6', '2019-09-26', 'test', 'test', '1903171711301885316|1903180946059317835', '140491', 'DEPARTEMEN', '212383', '6538', 'Menunggu Persetujuan dari FAST (Finance, Acct, Costing, Budget, IT Division)', '-'),
('1904040057435504413', '2019-04-08 15:37:31', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201904/001', 'Rekapitulasi Biaya Perjalanan Dinas', 'SCD', 'EDOC', 'CONF', 'GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '5893|6563|7550|7924|5882|5904', '6563', '6563', '7550', '4.0', '2019-04-05', '6', '2019-10-04', 'Anggaran yang berjalan', 'Perjalanan udara', '1903171711301885316', '140491', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1904040108102680536', '2019-04-04 01:41:24', 'DTSEKI0001', 'DTSEJS0002', 'DTSETE0002', 'GROUP PROSES', 'PROSES', 'MIS201904/002', 'Rekapitulasi Biaya training', 'HCD', 'EDOC', 'CONF', 'GMMGR|SNMGR|JNMGR|SNSPV|SCH|STAF', '5898|6563|7550|7924|5922', '6563', '6563', '6563', '1.1', '2019-04-06', '6', '2019-10-05', 'Biaya trainng', 'Biaya training', '1903181330113183895', '140491', 'DEPARTEMEN', '171270', '6563', 'Menunggu Persetujuan dari FAST (Finance, Acct, Costing, Budget, IT Division)', '-'),
('1904121454279989841', '2019-04-12 16:23:52', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/003-ITY', 'PENGGUNAAN ALAT ITY PORTABEL', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5882|5893|5898|5904|5922|5926|5942|6467|6473|6526|6534|6540|6551|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924|6494|6559|7081|7488|7494|7761|7762', '6563', '7550', '7550', '1.0', '2019-01-01', '6', '2019-06-30', 'protabel, portabel, alat kerja, information technology, aturan penggunaan', 'abstrak portabel\r\n', '', '170406', 'DEPARTEMEN', '171270', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1904150903281955566', '2019-04-16 08:54:35', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP-REC-REC-7.1', 'SOP Penambahan Posisi Baru', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7555|7562|7564|7591|7596|7603|7761|7762|7769', '7527', '7550', '7550', '1.1', '2019-04-01', '24', '2021-03-31', 'SOP, Penambahan, Posisi, Baru, Recruitment', 'SOP Penambahan Posisi Baru Dept. Recruitment', '1903201623487739413|1903050906241783554', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1904150938051405212', '2019-04-15 10:11:22', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS-MGM-MAT-11', 'Auditor', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '5922|5942|7239|7550|7924', '7924', '7550', '7550', '1.0', '2019-04-15', '12', '2020-04-14', 'job description, tugas, tanggung jawab', 'menjelaskan tugas dan tanggung jawab auditor', '1903201623487739413', '206329', 'DEPARTEMEN', '171314', '7841', 'Menunggu Persetujuan dari OTH (Other Strategic Division)', '-'),
('1904161020164804913', '2019-04-16 10:25:51', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS201904/-10', 'Coba Upload PPT Png MP4', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7550', '7550', '1.1', '2019-04-20', '12', '2020-04-19', 'Coba, Upload, MP4, PPT, Powerpoint, Png', 'Coba Upload PPT, Powerpoint, png dan MP4', '1904150903281955566', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1904161026136248169', '2019-04-16 12:06:08', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/0-9', 'Coba Upload Excel dan JPG', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7550', '7550', '2.0', '2019-04-30', '12', '2020-04-29', 'Coba Upload, Excel, jpg', 'coba upload excel dan jpg', '1904150903281955566', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1904221025083646425', '2019-04-22 14:49:18', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0024', 'GROUP PROSES', 'PROSES', 'FRM-BPI-GDM-1.1.10', 'Format Work Instruction', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7550|7924', '7550', '7550', '7550', '2.0', '2019-04-30', '12', '2020-04-29', 'Instruksi Kerja, work instruksi', 'Menjelaskan cara penulisan Work Instruction.', '', '212383', 'DEPARTEMEN', '212383', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1904241016215937786', '2019-04-24 10:18:21', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201904/001', 'sasasasa', 'SCD', 'EMAIL', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7527', '7527', '1.0', '2019-04-24', '12', '2020-04-23', 'sop, prosedur', 'sasasasasasasasasasasassa', '1903050906241783554|1904121454279989841', '210569', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1904250722344439233', '2019-04-25 07:25:22', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/002', 'TEs DOK REKA', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '7550', '1.0', '2019-04-25', '6', '2019-10-24', 'reka', 'ttes', '1903162038142399837|1903171711301885316|1903180919514736897|1903201006299867884|1903201623487739413|1904121454279989841|1904150903281955566', '140491', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1904250726174649213', '2019-04-25 07:28:52', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/003', 'GROPU PORCES', 'HCD', 'EDOC', 'CONF', 'SNMGR|JNMGR', '5882|5904|7550|7924', '5904', '7550', '7550', '1.0', '2019-04-25', '6', '2019-10-24', 'rfdsdf', 'sdfsdfsdf', '1903050906241783554|1903180911113091034', '171251', 'DEPARTEMEN', '-', '7550', 'Menunggu Persetujuan dari BPI (BUSINESS PROCESS IMPROVEMENT)', '-'),
('1904250838472519918', '2019-04-25 08:41:42', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/004', 'Test Record', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|7550|7924', '5904', '7550', '7550', '1.0', '2019-04-25', '6', '2019-10-24', 'tes re', 'tes', '1903050906241783554|1903171711301885316|1903180911113091034|1903201006299867884', '171251', 'DEPARTEMEN', '212383', '5901', 'Menunggu Persetujuan dari HRS (Human Resource Division)', '-'),
('1904262247456400812', '2019-04-26 22:49:22', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201904/005', 'Reka Test Again', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6563|7550|7924', '6563', '7550', '6538', '1.0', '2019-03-31', '6', '2019-09-29', 'fsdf', 'sdfsdfsdf', '1903162038142399837|1903171711301885316|1903201623487739413|1904121454279989841', '140491', 'DEPARTEMEN', '-', '6538', 'Menunggu Persetujuan dari FAST (Finance, Acct, Costing, Budget, IT Division)', '-'),
('1905020817431312386', '2019-05-02 08:20:38', 'DTSEKI0002', 'DTSEJS0011', 'DTSETE0011', '', '', 'STO201905/006', 'STO Dept. Transportasi', 'HCD', 'EMAIL', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7527', '7527', '1.0', '2017-01-01', '12', '2017-12-31', 'STO, Struktur, Organisasi', 'STO Struktur Organisasi', '1903180919514736897|1904161020164804913', '170236', 'DEPARTEMEN', '-', '5901', 'Menunggu Persetujuan dari HRS (Human Resource Division)', '-');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_bookmark`
--

CREATE TABLE `tb_document_bookmark` (
  `DOCB_ID` varchar(255) NOT NULL,
  `UR_ID` varchar(150) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_bookmark`
--

INSERT INTO `tb_document_bookmark` (`DOCB_ID`, `UR_ID`, `DOC_ID`) VALUES
('1903142017581845775', '171314', '1903050906241783554'),
('1903142027159624471', '171251', '1903050906241783554'),
('1903181000383143795', '171251', '1903180946059317835'),
('1903181225152059238', '140491', '1903181146524339961'),
('1903181731005882337', '140491', '1903142054476982363'),
('1903181737264543164', '171251', '1903181146524339961'),
('1903201421591752388', '140491', '1903201404014149976'),
('1903201809374444649', '170236', '1903050922414427383'),
('1903221726027797094', '150381', '1903221637511979170'),
('1903221726046241146', '210546', '1903180946059317835'),
('1903221735365708196', '170236', '1903201623487739413'),
('1904040131134586735', '140491', '1903181330113183895'),
('1904040135322065566', '140491', '1904040057435504413'),
('1904081634419391931', '140491', '1903162038142399837');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_comment`
--

CREATE TABLE `tb_document_comment` (
  `DTCT_ID` varchar(255) NOT NULL DEFAULT '-',
  `DOC_ID` varchar(150) NOT NULL DEFAULT '-',
  `DTCT_DATE` datetime NOT NULL,
  `DTCT_AUTHOR` varchar(255) NOT NULL DEFAULT '-',
  `DTCT_USER` varchar(255) NOT NULL DEFAULT '-',
  `DTCT_NOTE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_comment`
--

INSERT INTO `tb_document_comment` (`DTCT_ID`, `DOC_ID`, `DTCT_DATE`, `DTCT_AUTHOR`, `DTCT_USER`, `DTCT_NOTE`) VALUES
('1903142015445091343', '1903050906241783554', '2019-03-14 20:15:44', '170236', '171314', 'Komentar by Aditya'),
('1903142027076717728', '1903050906241783554', '2019-03-14 20:27:07', '170236', '171251', 'saya kiting komentar dah'),
('1903142036119654173', '1903050906241783554', '2019-03-14 20:36:11', '170236', '171251', 'teddys\r\n'),
('1903181245406555696', '1903181146524339961', '2019-03-18 12:45:40', '140491', '12345', 'komentar dari admin aplikasi'),
('1903181246474638272', '1903181146524339961', '2019-03-18 12:46:47', '140491', '170406', 'Komentar dari Teddy Sutanto\r\nCCTV untuk keamanan sangatlah penting'),
('1903200913539810750', '1903181716488822119', '2019-03-20 09:13:53', '140491', '171314', 'test'),
('1903302017373759348', '1903171711301885316', '2019-03-30 20:17:37', '140491', '206005', 'tes'),
('1904040134042599474', '1903181330113183895', '2019-04-04 01:34:04', '171251', '140491', 'Bagus sekali untuk referensi'),
('1904181234272360393', '1903162038142399837', '2019-04-18 12:34:27', '140491', '150063', 'tes inoy coment'),
('1904201512511677876', '1903201623487739413', '2019-04-20 15:12:51', '170406', '171404', 'Jhony jhony yes papa'),
('1904240934169292174', '1904121454279989841', '2019-04-24 09:34:16', '170406', '170236', 'Tidak ada watermark'),
('1904301432242782023', '1903050906241783554', '2019-04-30 14:32:24', '170236', '171404', 'Tulisan copyrightnya di depan gambar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_detail`
--

CREATE TABLE `tb_document_detail` (
  `DOC_ID` varchar(150) NOT NULL DEFAULT '-',
  `DOCD_UTAMA` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_UTAMA_TYPE` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_UTAMA_STATUS` tinyint(1) NOT NULL,
  `DOCD_UTAMA_EXT` varchar(255) NOT NULL,
  `DOCD_PELENGKAP_1` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_PELENGKAP_1_TYPE` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_PELENGKAP_1_STATUS` tinyint(1) NOT NULL,
  `DOCD_PELENGKAP_1_EXT` varchar(255) NOT NULL,
  `DOCD_PELENGKAP_2` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_PELENGKAP_2_TYPE` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_PELENGKAP_2_STATUS` tinyint(1) NOT NULL,
  `DOCD_PELENGKAP_2_EXT` varchar(255) NOT NULL,
  `DOCD_PERSETUJUAN` varchar(255) NOT NULL DEFAULT '-',
  `DOCD_PERSETUJUAN_TYPE` varchar(255) NOT NULL,
  `DOCD_SEARCH` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_detail`
--

INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903031420197239685', 'Memo_Kebijakan_Perhitungan_PPMH_Morale_Monitoring_v21', 'application/pdf', 1, 'pdf', 'Memo_Kebijakan_Perhitungan_PPMH_Morale_Monitoring_v21', 'application/msword', 0, 'doc', 'File_Not_Found', '-', 0, '-', 'UAT_SignOff_Phase_12.pdf', 'application/pdf', '1 \n \n \n \nM E M O              \nNomor : 022 / MEMO.PEM / HRD.PRS / XII / 2014 \nTanggal : 30 Desember 2014 \nKepada Yth : All Store Manager \n  All Manager KP \nTembusan : BOD \n  Supply & Operation Director   Up. Bpk. Toni Yoyo \n  Engineering & OS Director   Up. Bpk. Widianto \n  HR General Manager    Up. Bpk. Richard W. Sinaulan \n  Operation General Manager   Up. Bpk. Budi Purnama \n  FAST General Manager    Up. Bpk. Anthony Pamungkas \n  Supply General Manager    Up. Bpk. Antonius Hendrajaya \n  Eng. & Office Service General Manager  Up. Bpk. Kho Yanto \n  Bussiness  Development General Manager  Up. Ibu Tammy Tanumihardja \n  Payroll Administration Supervisor   Up. Lionita Yohanes \n  Personnnel Administration Supervisor  Up. Bun Jun Kiong   \n  All Area Manager \nDari : Assistant HRIS Manager    Teddy Sutanto \nPerihal : Formula Perhitungan Labor Productivity dan Morale Monitoring (3 Halaman) \nSifat : General ± Non Confidential \nLampiran : -- \n \n \nDengan hormat, \nMenindaklanjuti pelaporan yang akan disampaikan sesuai dengan BSC , maka berdasarkan  hasil pertemuan pada saat meeting Area \ndi tanggal 17 Desember 2014, maka telah disepakati formula perhitungannya sebagai berikut : \n \n1. Labor Productivity \na. Labor Productivity Store \nUntuk mengukur tingkat produktivitas penjualan di store setiap bulannya dengan satuan PpMH ( Portion per Man \nHour). Maka telah disepakati formulanya adalah sbb : \n \n \n \n \nPLU  adalah informasi penjualan  porsi semua menu yang sudah dikonversi dan dikelola oleh bag. Costing \nsetiap bulannya. \n \nb. Labor Productivity CPP \nUntuk mengukur tingkat produktivitas jumlah produksi setiap bulannya dengan satuan KpMH (Kilo per Man Hour). \n \n \n \n \nKilo Production  adalah jumlah total produksi dalam satuan kilo yang sudah dikonversi oleh bag. Costing setiap \nbulannya. \n \n \n\nLabor Productivity(s) :  PLU \n    Total Man Hour\n  \nLabor Productivity(c) :  Kilo Production \n    Total Man Hour\n  \n2 \n \n \nc. Labor Productivity Support Office \nUntuk mengukur tingkat produktivitas jam kerja produktif dalam memberikan layanan kepada departemen-\ndepartemen lain / penjualan / produksi setiap bulannya dengan satuan Man Hour per Store (MHpS). \n \n \n   \n \n \n Total Store  adalah jumlah store yang diberikan pelayanan jasa dari departemen-departemen di kantor pusat.\n  \n \n \n \nTotal Man Hour adalah informasi jumlah jam kerja aktual dari para pekerja yang berlokasi di store/dept tersebut \nsetiap bulannya, dengan kaidah-kaidah standar yang sudah disepakti bersama. \n \n \nProductivity Hour adalah jam kerja aktual untuk para pekerja yang sudah terjadi dan sudah dikonfirmasikan ke store melalui \nproses tutup periode.  \nOTO adalah jam kerja lembur otomatis para pekerja yg terjadi di hari besar dan yang sudah dijadwalkan dengan \nshift kerja lembur otomatis. \nOTJ adalah jam kerja lembur dengan menggunakan formulir JKT dan yang sudah disetujui oleh atasan (minimal \ndisetujui  oleh  atasan  selevel Store  Manager  /  ass. Store Manager atau Manager  /  Ass.  Manager \nDepartment atau oleh level yang diatasnya. \n \n2. Morale Monitoring \na. Retention Rate \nUntuk mengukur tingkat retensi dan diharapkan adanya trend positif daripada retensi pekerja setiap bulannya. \nFormulanya adalah sbb : \n \n \n \n \n \n \n \nb. Attendance Rate \nUntuk mengukur tingkat kehadiran pekerja dan diharapkan adanya trend positif terhadap tingkat kehadiran pekerja \nsetiap bulannya. \nFormulanya adalah sbb : \n \n \n \n \n \n \n \nc. Lateness Rate \nUntuk  mengukur  tingkat  keterlambatan  pekerja  dan  diharapkan  tentunya  adanya  trend  positif  terhadap  tingkat \nketerlambatan pekerja ini dengan menurunnya jumlah pekerja yang terlambat setiap bulannya. \n \n  \n \n \n \n \n \n \nRetention Rate : 100% - % Turn Over \n% Turn Over : Jumlah Pekerja Keluar          * 100% \n          Rata-Rata (Jumlah Pekerja Existing + Jumlah Pekerja Keluar) \nAttendance Rate: 100% - % Absentiesm  \n% Absentiesm: Jumlah ALPA + SAKIT          * 100% \n          Rata-Rata (Jumlah Hari Kerja *  Jumlah Pekerja) \n% Lateness Rate:  Frekwensi Keterlambatan         * 100% \n           Rata-Rata (Jumlah Hari Kerja *  Jumlah Pekerja) \nTotal Man Hour : Productivity Hour + OTO + OTJ  \n  \nLabor Productivity(p) :  Total Man Hour \n    Total Store  \n3 \n \nd. Disciplinary Rate \nUntuk mengukur tingkat kedisiplinan pekerja secara keseluruhan organisasi. \n \n \n \n \n \nAdapun kaidah-kaidah standar yang sudah disepakati adalah sebagai berikut : \n1. Pengakuan data yang dihitung di store tujuan mutasi adalah apabila tanggal mutasi pekerja terjadi antara tanggal 1 \nsd 14. Apabila tanggal mutasi terjadi diantara tanggal 15 sd akhir bulan , maka akan menjadi beban man hour store \nasal mutasi. \n2. Perhitungan  man hour hanya bagi pekerja dengan status Diklat Tetap, PKWT, Tetap. \n3. Perhitungan man hour  hanya  berlaku untuk para pekerja dari level Crew sd Section Head. \n4. Perhitungan man hour dihitung berdasarkan data aktual setelah proses tutup periode (maksimum tgl 7). \n5. Jumlah Hari Kerja adalah 25 hari kerja untuk store / KP operation , sedangkan untuk KP Office adalah 22 hari kerja. \n6. Perhitungan retention rate  hanya berlaku untuk para pekerja  dengan status PKWT dan Tetap. \n7. Perhitungan attendance rate & lateness rate berlaku untuk semua pekerja dengan status apapun (DIKLAT, MT, \nPKWT, TETAP, Orientasi ± Percobaan) \n8. Tanggal cut off data adalah tanggal 30 / 31 ( akhir bulan), sedangkan untuk proses administrasi penyelesaian form-\nform terminasi maksimal adalah setiap tanggal 5 bulan berikutnya.  \n \nCatatan : \nRata ±Rata  : adalah pengukuran yang dilakukan dari bulan ke 1 sampai dengan ke n. \n \nHormat Kami, Mengetahui,   \n    \n    \n   \n   \nTeddy Sutanto Richard W.S Anthony Pamungkas Budi Purnama \nAss. HRIS Manager GM HR GM FAST GM Operation \n \nHormat Kami, Menyetujui,  \n   \n  \n  \n  \nLywiana Toni Yoyo Widianto \nCosting Manager Direksi Direksi \n \n% Disciplinary Rate:  Total Surat Disiplin         * 100% \n           Jumlah Pekerja Existing '),
('1903050906241783554', 'MNL_-_Aplikasi_Service_Desk_(Requester_Login)_30_03_20181', 'application/pdf', 1, 'pdf', 'Langkah_Singkat_Service_Desk1', 'application/pdf', 0, 'pdf', 'File_Not_Found', '-', 0, '-', 'MNL_-_Aplikasi_Service_Desk_(Requester_Login)_pengesahan.pdf', 'application/pdf', 'Manual: \nAplikasi Service Desk (Requester Login) Hal.: 1 / 9 \n  \n \nMNL-HRS-KMS-01 - Ver.01 \nTanggal Efektif : 1 April 2018 \nNo. Copy Dokumen :                                                    \nDistribusi ke : All Store, All Distribution Center, Dept. Channel Sales, Dept. L & D, & Food Truck \n \nDAFTAR ISI \n \n1. TUJUAN ............................................................................................................................................ 2 \n2. RUANG LINGKUP .......................................................................................................................... 2 \n3. DEFINISI ........................................................................................................................................... 2 \n4. REFERENSI ...................................................................................................................................... 2 \n5. DOKUMEN PENUNJANG .............................................................................................................. 2 \n6. PROSEDUR ...................................................................................................................................... 3 \n6.1. Akses ke Aplikasi Service Desk ..................................................................................................... 3 \n6.2. Tampilan Halaman Home .............................................................................................................. 3 \n6.3. Tampilan Halaman Requests .......................................................................................................... 4 \n6.4. Langkah ± Langkah Membuat Request .......................................................................................... 5 \n6.5. Langkah ± Langkah Memantau Request ........................................................................................ 7 \n6.6. Mengganti Password Akun Service Desk ...................................................................................... 9 \n6.7. Keluar / Log Out dari Aplikasi Service Desk ................................................................................. 9 \n7. KONDISI KHUSUS .......................................................................................................................... 9 \n8. LAMPIRAN ...................................................................................................................................... 9 \n \n  \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 2 / 9 \n 1. TUJUAN \n1. Menjadi alat untuk mengajukan/mengkomunikasikan request antara Tim Operasional (Store) dengan Tim Support \n(Divisi/Departemen terkait). \n2. Menjadi acuan bagi requester untuk mengetahui status dari request yang telah diajukan. \n3. Menjadi alat komunikasi yang teroganisir dan terstruktur antara requester dan technician terkait suatu request. \n4. Menjadi media repositori atas request yang telah diajukan. \n2. RUANG LINGKUP \n1. Requester \nx Seluruh Store Bakmi GM, (Wilayah Jabodetabek, Karawang, Bandung, Surabaya dan lokasi pengembangan \nstore lainnya); \nx Store Distribution Center (DC) Bakmi GM; \nx Food Truck; \nx Dept. Channel Sales; \nx Dept. Learning & Development. \n2. Seluruh Divisi dan Departemen terkait pelayanan/support melalui aplikasi Service Desk. \nx Dept. Compensation & Benefit; \nx Dept. HR Support; \nx Dept. Personnel Administration; \nx Dept. Recruitment;  \nx Dept. Engineering Store;  \nx Dept. Quality Control. \n3. DEFINISI \n1. Request adalah informasi atau komplain yang diajukan oleh seseorang/pihak melalui aplikasi Service Desk. \n2. Requester adalah orang/pihak yang mengajukan request melalui aplikasi Service Desk. \n3. Technician adalah orang/pihak yang menindaklanjuti suatu request dari aplikasi Service Desk. \n4. REFERENSI \n- \n5. DOKUMEN PENUNJANG \n- \n \n  \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 3 / 9 \n 6. PROSEDUR \n6.1. Akses ke Aplikasi Service Desk \n \n1) Buka aplikasi browser (Google Chrome, Mozila Firefox, dll.) pada desktop / laptop. Ketik alamat web berikut \nhttp://kms.bakmigm.co.id:8080  \n2) Pada layar Login masukan username dan password, lalu klik Login. \n3) Username or Password is IncorrectUsername dan/atau Password \nyang dimasukkan salah.  \n \nJika lupa username atau password, maka dapat menghubungi admin untuk mendapatkan username & password \nmelalui email ke kms@bakmigm.co.id atau telepon ke ext.416 (HR Support / KM Project Team). Permintaan \nusername & password akan dipenuhi dalam kurun waktu maksimal 24 jam (hari kerja).  \n \n6.2. Tampilan Halaman Home \n \n1) Request Catalog: Menu untuk membuat request baru; \n2) My Request Summary: Menampilkan status request dalam jumlah, meliputi yang belum terbaca (pending), \nmenunggu persetujuan (waiting approval), dan menunggu update (waiting update); \n\n\n\n1 2 \n1 \n3 \n4 \n1 \nHome \n2 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 4 / 9 \n 3) Popular Solutions: Menampilkan daftar solusi yang diinput oleh tim Departemen / Expert berdasarkan rangkuman \natau best practice dari request-request sebelumnya; \n4) Announcements:  Menampilkan berita  /  informasi yang  diinput  oleh technicians.  Technican  dapat  membuat \nannouncements baru dengan membuka menu \0?\0 Serta menampilkan seluruh daftar \nannouncements dengan membuka menu .  \n \n6.3. Tampilan Halaman Requests \n \n1) Pilih menu My Request dengan pilihan All My Requests, untuk menampilkan seluruh request yang telah diajukan \noleh pihak requester (user).  \nCatatan: \nPilihan menu lain pada My Request merupakan menu untuk menampilkan / mensortir request berdasarkan status \nrequest-nya. Misalnya My Closed Request, untuk menampilkan request  request yang statusnya sudah closed. \n2) New Issue: Menu untuk membuat request baru yang belum terakomodasi di dalam pilihan incident templates pada \nrequest catalog. \n3) Request ID: Menu untuk mencari dan masuk ke halaman suatu request dengan menuliskan nomer ID request; \n4) ID: Menampilkan nomer identitas suatu request; \n5) Subject: Menampilkan judul-judul request yang telah dibuat oleh user; \n6) Requester Name: Menampilkan nama/pihak requester yang mengajukan request;  \n7) Assigned To: Menampilkan nama/pihak technician yang manangani masing-masing request; \n8) Due By: Menampilkan tanggal batas waktu penyelesaian masing-masing request; \nCatatan: \nDue By ditentukan berdasarkan standar SLA (Service Level Agreement) dari masing-masing request (incident / \nservice templates).  \nStandar waktu SLA dari masing-masing incident / service templates dibedakan berdasarkan priority-nya.  \nPriority suatu request ditentukan oleh pihak technician.  \n9) Status: Menampilkan status penyelesaian suatu request. \nCatatan:  \nTerdapat beberapa jenis status yang berlaku di Aplikasi Service Desk. \nx Received: Status yang dimiliki suatu request, setiap sebuah request setelah diajukan. Dalam hal ini SLA sudah \nmulai berjalan. \nx In Progress: Status request yang sedang ditangani / dikerjakan oleh pihak technician. Dalam hal ini SLA \nberjalan. \nx On Hold: Status request saat prosesnya dihentikan sementara oleh pihak technician karena tidak lengkapnya \nkelengkapan suatu request. Misalnya pihak technician menerima request yang belum dilengkapi attachment \n\nRequests \n1 \n2 \n3 \n4 \n5 \n6 \n7 8 9 10 12 11 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 5 / 9 \n dokumen kelengkapan, maka technician dapat merubah status request menjadi on hold. Dalam hal ini SLA akan \nberhenti, dimana technician akan berkomunikasi kepada requester untuk melakukan perbaikan request. Jika \nkelengkapan request sudah dilengkapi maka status diganti kembali menjadi In Porgress dan SLA berjalan lagi. \nx Waiting for Approval: Status request yang prosesnya dihentikan sementara oleh pihak technician karena \nsedang menunggu proses approval. Dalam hal ini waktu approval merupakan bagian dari waktu SLA. \nx On Vendor Process: Status request yang prosesnya dihentikan sementara oleh pihak technician karena \nproses penyelesaian request perlu dilakukan oleh pihak ketiga / vendor. Dalam hal ini waktu proses di vendor \nmerupakan bagian dari waktu SLA.  \nx Resolved:  Status request yang  sudah selesai  ditangani oleh  pihak technician dan  sedang  menunggu \nkonfirmasi dari pihak requester. Dalam hal ini SLA sudah berhenti. \nx Closed: Status request yang sudah selesai ditangani. \nx Cancelled: Status request yang tidak dapat ditangani / diproses sehingga ditolak oleh tim technician. \n10) Created date: Menampilkan waktu pengajuan masing-masing request. \n11) Search column: Menu untuk mencari request berdasarkan kata kunci (keywords) yang ada pada columns. \nCatatan: \nKlik logo search column (lup) kemudian akan muncul kolom search di bawah masing-masing header columns. \nKetik keyword pada salah satu atau lebih kolom search. Lalu Go pada bagian ujung kiri untuk menampilkan \nrequest yang dicari. \n12) Pengatur columns: Menu untuk memilih columns yang akan di tampilkan serta mengatur urutan columns.  \nCatatan: \nUntuk  memilih columns yang  akan  ditampilkan dilakukan  dengan men-checklist menu columns yang  akan \nditampilkan. Lalu klik save. \nUntuk mengatur urutan columns dilakukan dengan men-select menu columns yang akan dipindahkan, lalu arahan \ncolumns tersebut ke atas atau kebawah dengan menggunakan tombol arah panah menuju urutan yang diinginkan. \nLalu klik save. \n \n6.4. Langkah  Langkah Membuat Request \n \n1)  Klik menu Request Catalog.  \nRequest Catalog merupakan halaman untuk memilih request templates yang akan diajukan / dibuat. \n \n2)  Klik menu Template Categories.  \n\n1 2 3 4 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 6 / 9 \n Template Categories merupakan menu pilihan nama Departemen terkait request templates yang akan dipilih. \nSetiap  menu nama Departemen memiliki pilihan request templates yang berbeda-beda. \nContoh:  \nTemplate Categories: 4. Compensation& Benefit, memiliki 3 (tiga) request templates, yaitu: \n- 1. BPJS Kesehatan  Pendaftaran Pekerja. \n- 2. BPJS Kesehatan  Penambahan Anggota Keluarga Tambahan. \n- 3. BPJS Kesehatan  Perubahan Data Pekerja. \n Template Categories: 6. QC Operations, memiliki 3 (tiga) request templates, yaitu: \n- 1. Komplain  Kualitas. \n- 2. Komplian  Kuantitas. \n- 3. Komplain  FYI.   \n3)  Klik menu Templates. \nMenu templates merupakan pilihan jenis request template yang akan diajukan.  \n4)  Search merupakan menu untuk menemukan request templates secara langsung dengan cara menulis kata kunci \n(key word) dari request templates yang ingin dipilih.  \nContoh: Jikan ingin memilih / mengajukan request terkait komplain bahan baku, maka requesters dapat mengetik \nsearch. Selanjutnya akan ditampilkan seluruh menu request yang mengandung kata \nkomplain. \n \n5) Setelah masuk ke halaman request template, pastikan nama template sesuai dengan request yang akan diajukan.  \n6) Isi seluruh field / kolom yang tersedia pada halaman request. Seluruh kolom dengan tanda bintang merah (*) harus \nterisi.  \n7) Pada bagian description terdapat beberapa petunjuk / keterangan tentang hal-hal yang perlu dilampirkan atau \ndilakukan terkait request yang diajukan. \n \n8) Attach Filemelampirkan file dokumen yang diperlukan (file edit / hasil scan). \n\n\n5 \n6 \n8 \n8a 8d \n8e \n8c \n8b \n7 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 7 / 9 \n a) Browse  \nb) File Upload \nc) open \nd) Pastikan nama file yang dipilih tersebut muncul di sebelah menu browse.  \ne) Attach filemelampirkan dokumen. \nUlangi langkah-langkah tersebut diatas (8a - 8e) jika ingin meng-attach file lainnya. \n \n9) Selanjutnya pastikan file attachment terlampir pada halaman request (scroll kebawah). \n10) Add Requestmengirimkan request tersebut (scroll kebawah).  \n6.5. Langkah  Langkah Memantau Request \n \n1) Klik menu requests untuk melihat daftar requests.  \n2) Klik subject request yang telah diajukan. \n \n3) Perhatikan status dan priority dari request yang diajukan. Perubahan status terjadi setiap pihak technician \nmelakukan update terhadap request yang diajukan. \n4) Perhatikan notes sebagai fitur komunikasi antara requester dengan technician. Perubahan angka terjadi setiap \npihak technician atau requester menambah note. \n5) Klik Action untuk technicianattachment \n6) Resolutionangkah-langkah follow up terhadap request yang dituliskan oleh technician (jika ada). \n7) Historyuntuk melihat rekaman / catatan perubahan dan update yang terjadi pada request. \n\n\n\n9 \n10 \n1 \n2 \n3 \n4 \n5 \n6 7 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 8 / 9 \n \n \n8) Perhatikan Request Details dan Requesters Details untuk melihat data dan informasi terkait request yang diajukan \n(scroll kebawah). \n \n \n9) requester dengan pihak technician. Menu add \nnotesdapat ditemukan pada dengan meng-klik menu Actions \n10) Tandai kotak e-mail this note to the techniciannote yang dikirim dapat dibaca oleh pihak technician. \n11) Add Note \n \n12) Perhatikan Discussion Notesrequester dan pihak technician (scroll \nkebawah). \n \n\n\n\n9\n8 \n10 11 \n8 \n8 \n12 \n5 \n Manual: \nAplikasi Service Desk (Requester Login) \n  \n Hal.: 9 / 9 \n 6.6.  Mengganti Password Akun Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk lalu klik Change Password. \n2) Isi password lama pada kolom current password. Lalu isi password baru pada kolom new password dan confirm new \npassword. \n3) Klik save untuk menyimpan password baru. \n \n6.7.  Keluar / Log Out dari Aplikasi Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk. \n2) Klik Log Out untuk keluar dari aplikasi Service Desk.  \n \n7. KONDISI KHUSUS \n- \n8. LAMPIRAN \n- \n\n\n1 \n2 \n3 \n1 \n2 '),
('1903050922414427383', 'MNL_-_Aplikasi_Service_Desk_(Technician_Login)_v.1', 'application/pdf', 1, 'pdf', 'PANDUAN_Service_Desk_Technician_EST_(Mei_2017)', 'application/pdf', 0, 'pdf', 'File_Not_Found', '-', 0, '-', 'MNL_-_Aplikasi_Service_Desk_Technician_Login_pengesahan.pdf', 'application/pdf', ' \nManual:  \nAplikasi Service Desk (Technician Login) Hal.: 1 / 17 \nSifat: Classified Tgl.: 6 Juni ¶17 Ver.: 01 No.: MNL-HRS-KMS-02 \nDibuat oleh: \n \n \n \n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Johan Mohammad \nKM Supervisor \nAditya Wardiman \nAsst. HR Support Manager \nCynthia Fellicianne \nGM HRD \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\nDiterapkan dan Disetujui oleh: \nDepartemen Disetujui Tanda Tangan \nRecruitment Rita Raesita  \nHI & Personnel Admin Hanggulan Kiting  \nCompensation & Benefit Daniel Ibnu Sidharta  \nHR Support Aditya Wardiman  \nEngineering Store Adhiguna Natadimadja  \nQuality Control Bobby Santosa  \n \nTanggal Efektif :                                                    \nNo. Copy Dokumen :                                                    \nDistribusi ke :                                                    \n \nDAFTAR ISI \n \n1. TUJUAN ........................................................................................................................................................... 2 \n2. RUANG LINGKUP ........................................................................................................................................... 2 \n3. DEFINISI .......................................................................................................................................................... 2 \n4. REFERENSI ..................................................................................................................................................... 2 \n5. DOKUMEN PENUNJANG ................................................................................................................................ 2 \n6. PROSEDUR ..................................................................................................................................................... 3 \n6.1. Akses ke Aplikasi Service Desk ................................................................................................................... 3 \n6.2. Tampilan Halaman Home............................................................................................................................. 4 \n6.3. Tampilan Halaman Dashboard ..................................................................................................................... 5 \n6.4. Tampilan Halaman Requests ....................................................................................................................... 7 \n6.5. Langkah ± Langkah Menindaklanjuti Request ............................................................................................ 10 \n6.6. Mengganti Password Akun Service Desk ................................................................................................... 16 \n6.7. Keluar / Log Out dari Aplikasi Service Desk ............................................................................................... 17 \n7. KONDISI KHUSUS ........................................................................................................................................ 17 \n8. LAMPIRAN ..................................................................................................................................................... 17 \n \n  \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 2 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n1. TUJUAN \n1. Menjadi  alat  untuk mengkomunikasikan request antara Tim  Operasional  (Store)  kepada  Tim Support \n(Divisi/Departemen terkait). \n2. Menjadi acuan bagi technician untuk mengetahui status dari request yang diterima. \n3. Menjadi alat komunikasi yang teroganisir dan terstruktur antara requester dan technician terkait suatu request. \n4. Menjadi media repositori atas request yang telah diajukan. \n5. Menjadi panduan bagi technician untuk menyelesaikan request berdasarkan solusi dari request serupa sebelumnya. \n2. RUANG LINGKUP \n1. Seluruh Divisi dan Departemen terkait pelayanan/support melalui aplikasi Service Desk. \nx Dept. Compensation & Benefit; \nx Dept. HR Support; \nx Dept. Personnel Administration; \nx Dept. Recruitment;  \nx Dept. Engineering Store;  \nx Dept. Quality Control. \n2. Store Operation. \nx Store Melawai (MLW), Jakarta Selatan. \nx Store Melawai (MLW), Jakarta Selatan.  \nx Store GFM (Graha Family), Surabaya.  \nx Store SPI (Supermall Pakuan Indah), Surabaya.  \nx Store TP6 (Tunjungan Plaza 6), Surabaya.  \nx DC - KSB (Kantor Surabaya), Surabaya.  \n3. DEFINISI \n1. Request adalah informasi atau komplain yang diajukan oleh seseorang/pihak melalui aplikasi Service Desk. \n2. Technician adalah orang/pihak yang menindaklanjuti suatu request dari aplikasi Service Desk. \n3. Requester adalah orang/pihak yang mengajukan request melalui aplikasi Service Desk. \n4. REFERENSI \n- \n5. DOKUMEN PENUNJANG \n- \n \n  \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 3 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6. PROSEDUR \n6.1. Akses ke Aplikasi Service Desk \n  \n1) Buka aplikasi browser (Mozila  Firefox,  Chrome,  dll.) pada  desktop/laptop.  Ketik  alamat  web  berikut \nhttp://kms.bakmigm.co.id:8080/. \n2) Pada layar Login masukan username dan password, lalu klik Login. \n3) -LNM PXQ?XO SHULQJMPMQ ³Username or Password is Incorrect´ hal tersebut disebabkan Username dan/atau Password \nyang dimasukkan salah.  \n \nJika lupa username atau password, maka dapat menghubungi admin untuk mendapatkan username & password \nmelalui email ke kms@bakmigm.co.id atau telepon ke ext.416 (HR Support / KM Project Team). Permintaan \nusername & password akan dipenuhi dalam kurun waktu maksimal 24 jam (hari kerja). \n \n\n\n1 \n2 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 4 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.2. Tampilan Halaman Home \n  \n1) Request Catalog: Menu untuk membuat request baru (menu untuk Requesters) ; \n2) Quick Actions: Menu yang menampilkan beberapa pilihan untuk melakukan quick action pada aplikasi Service Desk \nmeliputi, pembuatan insident request, solution, my schedule, mark unavailability, new task, dan new reminder(s). \nSerta  menampilkan my  task,  all  task,  my  reminder(s),  atau archived  request. Tampilan  menu quick  actions \nditampilkan seperti gambar dibawah ini. \n \n3) My View: Menampilkan my summary, my task dan announcements sesuai lingkup technician pemilik akun.  \n4) My Summary: Menampilkan status requests dalam jumlah, meliputi request yang tenggat waktu penyelesaiannya \ntelah lewat (requests overdue), requests yang tenggat waktu penyelesaiannya adalah hari ini (requests due today), \ndan requests yang belum ditanggapi / di-follow up oleh technician (pending requests); \n5) My Tasks: Menampilkan daftar tasks (tugas / proses) yang perlu diselesaikan oleh technician terkait suatu \nrequests. Tasks yang ada ditampilkan dapat berasal dari request yang memang dialamatkan kepada technician \npemilik akun, dan atau berasal dari request milik technician lain dimana salah satu/beberapa tasks-nya merupakan \ntugas /proses kerja yang perlu diselesaikan oleh technician pemilik akun. Hal tersebut ditentukan berdasarkan \nproses kerja dalam penyelesaian masing-masing template requests. \n6) + Add new (tasks): Menu untuk menambah tugas/proses baru untuk diselesaikan oleh technician, diluar dari task \ndari requests. Halaman add new tasks ditampilkan seperti gambar dibawah ini. \n \n\n\n\n3 \n9 \nHome \n4 \n5 \n8 \n1 2 \n6 7 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 5 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n7) > Show all (tasks): Menu untuk menampilkan seluruh tasks terkait lingkup / penugasan yang dialamatkan kepada \ntechnician pemilik akun. Daftar tasks yang ditampilkan dapat diatur sesuai kebutuhan. Halaman show all tasks \nditampilkan seperti gambar dibawah ini. \n \n8) Announcements: Menampilkan berita  / informasi yang  diinput  oleh technicians. Technican  dapat  membuat \nannouncements baru dengan membuka menu n Serta menampilkan seluruh daftar \nannouncements dengan membuka menu .  \n9) Scheduler: Menu untuk menampilkan kalender schedule bulanan yang terdiri dari mark unavailability, tasks, dan \nreminders dari technician pemilik akun serta jadwal libur kantor dan weekend. Menu ini dapat dikonfigurasi sesuai \nkebutuhan masing-masing technician pemilik akun dan di-back up. Halaman scheduler ditampilkan seperti contoh \ngambar dibawah ini. \n \n \n6.3. Tampilan Halaman Dashboard \n  \n\n\n\nDashboard \n3 4 \n5 \n8 \n1 2 \n6 \n7 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 6 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n1) Support Groups: Menu untuk memilih support group yang datanya akan ditampilkan pada halaman dashboard. User \ndapat memilih satu atau lebih support group XQPXN GLPMPSLONMQB.OLN ³Apply´ VHPHOMO SLOLOMQ GLPHQPXNMQB 7MPSLOMQ PHQX \nsupport groups ditampilkan seperti gambar dibawah ini.  \n \n2) Refresh: Menu untuk memilih selang waktu refresh halaman dashboard secara otomatis. Pilihan waktu refresh terdiri \ndari never, 5,10,15, 20, atau 30 minutes. Tampilan menu refresh ditampilkan seperti gambar dibawah ini. \n \n3) New Dashboard: Menu untuk menambah dashboard baru pada halaman dashboard. Untuk menambah dashboard \nbaru, klik ikon lalu klik  seperti gambar dibawah ini.  \n \nDashboard baru dapat dibuat sesuai kebutuhan user dengan cara mengisi field-field yang tersedia pada halaman \n³Add New Dashboard´ VHSHUPL JMPNMU GLNMRMO LQLB .OLN ³VMYH´ XQPXN PHQ\\LPSMQ GMQ PHQMPNMONMQ dashboard \nbaru. \n \n4) Dashboard  Setting: Menu  untuk  melakukan setting pada tampilan dahsboard. Setting dashboard yang  dapat \ndilakukan adalah setting layout style dan background color. Tampilan menu dashboard setting ditampilkan seperti \ngambar dibawah ini. \n             \n\n\n\n\n\n\n1 \n2 \n3 \n4 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 7 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n5) Judul dashboard menjelaskan  data  atau  informasi  terkait  hal-hal  yang  ditampilkan  pada dashboard tersebut, \nberdasarkan support groups yang dipilih user. Secara default, terdapat 10 (sepuluh) judul dashboard yang tampil \npada halaman dashboard yaitu; Request by, Request Summary, Task Summary, Open Request by, SLA Violation \nby, Unassigned and Open Request, SLA Violated Request, Request Approaching SLA Violation, Request Received \nin last 20 days, dan Request closed in last 20 days.  \n6) Menu filter dashboard digunakan untuk menampilkan data dan informasi pada dashboard berdasarkan menu filter \nyang  dipilih  oleh user.  Setiap  judul dashboard memiliki menu filter yang  berbeda-beda. Misalnya request  by \ntechnician, request by category, request summay last week, request summary last month, open requests by priority, \nopen requests by level, dan sebagainya. \n7) Menu refresh dashboard digunakan untuk me-refresh suatu dashboard secara langusng. Menu ini akan muncul pada \ndashboard yang dituju oleh kursor mouse. \n8) Menu dashboard graphic digunakan untuk mengatur tampilan grafik suatu dahsboard sesuai kebutuhan user. Pilihan \nmenu grafik setiap dashboard berbeda-beda. Menu ini akan muncul pada dashboard yang dituju oleh kursor mouse. \n \n6.4. Tampilan Halaman Requests \n  \n \n1) Pilih menu Request dengan pilihan All Requests, untuk menampilkan seluruh request dari pihak requester untuk \ndi-follow up oleh pihak technician (user).  \nCatatan: \nPilihan menu lain pada Request merupakan menu untuk menampilkan / mensortir request berdasarkan status \nrequest-nya.  Misalnya My Completed Request,  untuk  menampilkan request  request yang  statusnya  sudah \ncomplete. \n2) New Incident: Menu untuk membuat request baru yang belum terakomodasi di dalam pilihan incident templates \npada request catalog (dilakukan oleh requesters). \n3) Actions: Menu yang dapat digunakan oleh technician untuk mem-follow up suatu request. Pilih request yang akan di \nfollow-up dengan cara memberi tanda pada kotak pilihan pada daftar request (no. 10), lalu pilih alternatif follow-up \npada menu actions. Pilihan pada menu actions terdiri dari: edit request, delete, pick up, close, merge, dan link \nrequests. Contoh pilih menu pick up untuk mem-follow up request secara langsung oleh technician pemilik akun. \nTampilan menu actions ditampilkan seperti gambar dibawah ini. \n \n\n\nRequests \n1 5 2 6 7 8 3 4 9 \n10 \n11 \n12 13 14 15 16 17\n \n \n16 \n18 19 20 21 22 23 \n24 25 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 8 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n4) Select technician & Assign: Menu untuk memilih technician yang akan mem-pick up atau mem-follow up request(s) \nyang dipilih. Memilih request dilakukan dengan cara memberi tanda pada kotak pilihan pada daftar request (no. 10). \nKemudian klik select technician untuk memilih nama technician OMOX NOLN ³MVVLJQ´B \n5) Request ID: Menu untuk mencari dan masuk ke halaman suatu request dengan menuliskan nomer ID request. \n6) Advance Search: Menu untuk mencari request secara custom. Tampilan advance search ditampilkan seperti gambar \ndibawah ini. \n \n7) Setting: Menampilkan menu pilihan untuk membuat custom view dan mengatur custom view daftar request, serta \nmenampilkan pilihan frekuensi waktu refresh. Tampilan menu setting dan custom view ditampilkan seperti gambar \ndibawah ini. \n  \n8) All Tasks: Lihat. Sub Bab. 6.2 . point 7. \n9) Show per Page: Menu untuk mengatur jumlah daftar request per halaman.  \n10) Cheks Box: Kotak untuk memberi tanda (v) pada request-request yang dipilih. \n11) Conversation Envelope: Lambang penanda status conversation / percakapan antara requester dan technician. \nMakna dari lambang conversation ditampilkan pada gambar dibawah ini. \n \n12) Notes: Lambang penanda status ada-tidaknya notes komunikasi antara requester dan technician. Makna dari \nlambang notes ditampilkan pada gambar dibawah ini. \n \n13) Edit Request: Menu untuk melakukan edit / update pada suatu request. \n14) Task List: Menu untuk menampilkan jumlah tasks (total tasks) secara keseluruhan dan tasks yang belum di-follow \nup (pending tasks) pada suatu request. \n15) ID: menampilkan nomer identitas suatu request; \n16) Subject: Menampilkan judul-judul request yang telah dibuat oleh requester; \n17) Requester Name: Menampilkan nama/pihak requester yang mengajukan request;  \n18) Assigned To: Menampilkan nama/pihak technician yang manangani (pick-up) masing-masing request; \n \n \n \n\n\n\n\n\n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 9 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n19) Due By: Menampilkan tanggal batas waktu penyelesaian masing-masing request; \nCatatan: \nDue By ditentukan berdasarkan standar SLA (Service Level Agreement) dari masing-masing request (incident / \nservice templates).  \nStandar waktu SLA dari masing-masing incident / service templates dibedakan berdasarkan priority-nya.  \nPriority suatu request ditentukan oleh pihak technician.  \n20) Status: Menampilkan status penyelesaian suatu request. \nCatatan:  \nTerdapat beberapa jenis status yang berlaku di Aplikasi Service Desk. \nx Received: Status yang dimiliki suatu request, setiap sebuah request setelah diajukan. Dalam hal ini SLA sudah \nmulai berjalan. \nx In Progress: Status request yang sedang ditangani / dikerjakan oleh pihak technician. Dalam hal ini SLA \nberjalan. \nx On Hold: Status request saat prosesnya dihentikan sementara oleh pihak technician karena tidak lengkapnya \nkelengkapan suatu request. Misalnya pihak technician menerima request yang belum dilengkapi attachment \ndokumen kelengkapan, maka technician dapat merubah status request menjadi on hold. Dalam hal ini SLA akan \nberhenti, dimana technician akan berkomunikasi kepada requester untuk melakukan perbaikan request. Jika \nkelengkapan request sudah dilengkapi maka status diganti kembali menjadi In Porgress dan SLA berjalan lagi. \nx Waiting for Approval: Status request yang prosesnya sedang menunggu proses approval. Dalam hal ini SLA \ntidak berhenti karena proses approval merupakan bagian dari proses kerja. \nx On Vendor Process: Status request yang prosesnya sedang dalam tahap penyelesaian oleh pihak ketiga / \nvendor. Dalam hal ini waktu proses di vendor merupakan bagian dari waktu SLA. \nx Resolved:  Status request yang  sudah selesai  ditangani oleh  pihak technician dan  sedang  menunggu \nkonfirmasi dari pihak requester. Dalam hal ini SLA sudah berhenti. \nx Closed: Status request yang sudah selesai ditangani. \nx Cancelled: Status request yang tidak dapat ditangani / diproses sehingga ditolak oleh tim technician. \n21) Created date: Menampilkan waktu pengajuan masing-masing request. \n22) Priority: Menampilkan status prioritas suatu request. Setiap status request memiliki batasan waktu SLA (service level \nagreement). \n23) Group: Menampilkan nama support group dari suatu request. \n24) Search column: Menu untuk mencari request berdasarkan kata kunci (keywords) yang ada pada columns. \nCatatan: \nKlik logo search column (lup) kemudian akan muncul kolom search di bawah masing-masing header columns. \nKetik keyword pada salah satu atau lebih kolom search. Lalu Go pada bagian ujung kiri untuk menampilkan \nrequest yang dicari. \n25) Pengatur columns: Menu untuk memilih columns yang akan di tampilkan serta mengatur urutan columns.  \nCatatan: \nUntuk  memilih columns yang  akan  ditampilkan dilakukan  dengan men-checklist menu columns yang  akan \nditampilkan. Lalu klik save. \nUntuk mengatur urutan columns dilakukan dengan men-select menu columns yang akan dipindahkan, lalu arahan \ncolumns tersebut ke atas atau kebawah dengan menggunakan tombol arah panah menuju urutan yang diinginkan. \nLalu klik save. \n \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 10 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.5. Langkah  Langkah Menindaklanjuti Request \n \n \n1) Pastikan menu filter request \\MQJ GLSLOLO MGMOMO ³All Requests´ XQPXN PHQMPSLONMQ VHOXUXO requests. \n2) Subject dengan tulisan cetak tebal (Bold) berarti request tersebut belum dibuka/dibaca. Klik subject request yang \ndipilih untuk membukanya.  \n \n \n \n \n3) Arahkan kursor ke  untuk melihat  4 ³1RPHV´ D  6 ³FRQYHUVMPLRQ´ 7 \n (8) dan  (9). \n\n\n\n\n\n\n\n1 \n2 \n3 \n4 \n5 6 7 \n6 \n8 \n9 \n10 11 12 13 14 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 11 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n4) Description menampilkan deskripsi, informasi dan petunjuk terkait request yang diajukan. \n5) Notes merupakan fitur komunikasi antara requester dengan technician. Tampilan angka menandakan jumlah notes \nyang ada. Berikut adalah langkah-langkah membuat notes. \n \n \na) Pilih menu Action lalu pilih menu Add notes.  \nb) Kemudian akan muncul menu tampilan Add Notes. \nc) Kemudian tulis notes yang akan dikomunikasikan kepada pihak requester pada tempat yang tersedia.  \nd) Setelah itu PMQGML NMJLMQ ³show this note to requester´B  \ne) Kemudian klik add note untuk mengirim note. \nf) 3HUOMPLNMQ ³Discussion Notes´ XQPXN PHOLOMP ?MPMPMQ NRPXQLNMVL MQPMUM SLOMN requester dan pihak technician \n(scroll kebawah). \n6) Attachments berisi tentang file yang menjadi bagian lampiran dari request yang diajukan. \n7) Conversations menampilkan  komunikasi  antara technician dan requester yang  dikirim  dengan  format  email. \nTampilan conversation adalah sebagai berikut. \n \n\n\n\na \nb \nc \nd \ne \nf \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 12 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n8) Request Details menampilkan detil informasi terkait request yang diajukan. Setiap request template memiliki field \nyang berbeda-beda. Technician dapat mengubah isi request details dengan meng-klik edit, lalu mengubah isi \nrequrest details dan diakhiri dengan mengklik tombol update pada bagian bawah request details. \n9) Requester Details menampilkan informasi terkait requesters yang mengajukan request. Technician dapat mengubah \nisi requester  details dengan meng-klik edit, lalu mengubah isi requrester details dan diakhiri dengan mengklik tombol \nupdate pada bagian bawah requester details. \n10) Edit request merupakan menu untuk menindaklanjuti request yang masuk. Tampilan edit menu request adalah \nsebagai berikut: \n  \n--- (scroll ke bawah) --- \n  \na) Lengkapi field  field seperti, status, priority, technician, sub category, category, dan item. \nCatatan:  Pilihan  menu  pada field  priority berbeda-beda  setiap service  category.  Untuk request terkait \nEngineering Store pilihan priority  terdiri dari , Medium, dan Low´ disesuaikan dengan definisi kondisi \nkerusakan yang terjadi. Selain request terkait Engineering Store yang lain pilihan priority-nya adalah ´B \nUbah status request sesuai tindaklanjut yang telah dilakukan. Misalnya pilih  saat pertama kali pick \nup request MPMX ³UHVROYHG´ VMMP PHQ\\HOHVMLNMQ PLQGMN OMQÓXP VXMPX ³request´B \nb) Tekan PRPNRO ³Update Request´ SMGM NMJLMQ NMRMO (scroll ke bawah) untuk menyimpan data request yang \nsudah dilengkapi.  \n11) Close request merupakan fitur untuk mengubah status request menjadi close. \n12) Assign merupakan fitur untuk memilih Technician yang ditunjuk untuk menindaklanjuti sebuah request. Tampilan \nmenu Assign adalah sebagai berikut. \n \n \n \n \n \n\n\n\na \nb \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 13 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n13) Actions merupakan fitur yang menampilkan tindakan-tindakan (actions) yang dapat dilakukan Technician terhadap \nsebuah request. Tampilan menu Actions adalah sebagai berikut. \n \n14) Reply merupakan fitur untuk menjawab request yang masuk. Pilihan jawaban yang tersedia meliputi; \n \n \n15) Perhatikan perubahan status dan priority setelah request di edit (pick up). \n16) Masuk ke menu  dan ikuti urutan task.  \n17) Lalu uSGMPH VPMPXV PHQÓMGL ³ bila task sudah dilaksanakan. Task yang tidak terpakai bisa dihapus dengan \nmemberikan tanda centang pada pilihan task, kemudian pilih \0? . \n\n\n\n16 \n17 \n15 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 14 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n \n18) Selanjutnya pilih menu ´ XQPXN PHQJLQSXP MQMOLVM VHUPM UHQ?MQM SHUNMLNMQB  \n19) Isi resolution (tindak lanjut) dari request yang telah dikerjakan pada kolom yang tersedia.  \n20) Tekan PRPNRO ³Save´ XQPXN PHQ\\LPSMQ GMPMB \n \n21) Bila penyelesaian/tindak lanjut request dan membutuhkan persetujuan (approval) dari pejabat yang berwenang, \nmaka NOLN ³Actions´ \n22) Kemudian SLOLO ³6XNPLP IRU $SSURYMO´B Berikut adalah langkah-langkah untuk mengajukan approval request kepada \npejabat berwenang: \na) To: Ketik alamat email dari pejabat yang akan diminta persetujuannya (Misal Manager, GM dan/atau Direktur).  \nb) Subject: Tuliskan judul request yang akan diminta persetujuannya (approval) dengan mengubah kalimat \n³$SSURYMO UHTXLUHG IRU M UHTXHVP´ \\MQJ PHOMO PHUVHGLM SMGM field subject.  \nc) Description: Tuliskan rangkuman  deskripsi yang  diperlukan  untuk mendukung proses  pengajuan \npersetujuan (approval) yang diminta. Lengkapi pula dengan nama technician yang mengajukan apporval pada \nfield Description. \n\n\n18 \n19 \n20 \n21 \n22 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 15 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\nCatatan: Jangan menghapus tulisan link yang sudah tersedia  ³KRXU MSSURYMO LV UHTXLUHG IRU M UHTXHVP PR \nproceed with its execution. The details of the request canbe found at $ApprovalLink´B  \nPenambahan deskripsi dapat dilakukan sebelum atau sesudah tulisan link yang telah tersedia.  \nd) 7HNMQ PRPNRO ³Send´ XQPXN mengirimkan email. \n \n23) Email terkait approval akan dikirim ke email pejabat yang dituju. Saat tautan (link) approval pada email di klik oleh \npejabat yang dituju, maka akan muncul gambar tampilan seperti berikut pada layar email pejabat tersebut. Langkah-\nlangkah approval yang dilakukan oleh pejabat yang berwenang adalah sebagai berikut: \n \na) Pilih status approval, berupa pilihan  atau  \nb) Tulis penjelasan terkait status approval pada bagian comment. \nc) Klik save untuk mengubah status approval. \n\n\na \na \nb \nc \nb \nc \nd \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 16 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n \n \n24) Untuk melihat progres approval, lihat pada buka menu approval. \n25) Lihat status approval. \n26) Setelah menyelesaikan rangkaian tindak lanjut request, kembalilah ke menu edit. \n \n27) Ubah status menjadi ´ XQPXN tindak lanjut request yang sudah selesai dilakukan. Kemudian informasikan \nkepada Requester bahwa request PHOMO VHOHVML GL VHOHVMLNMQ GHQJMQ PHQJJXQMNMQ PHQX ³$GG 1RPHV´ SMGM PHQX \n\0?actions (lihat langkah No.5). Kemudian pihak requesters akan memberikan konfirmasi atas perbaikan yang sudah \ndilakukan. Setelah itu Technician/Staf Admin dapat melakukan verifikasi dan mengubah status request menjadi \n IMOX NOLN ³update request´ SMGM NMJLMQ NMRMOB \n6.6. Mengganti Password Akun Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk lalu klik Change Password. \n2) Isi password lama pada kolom current password. Lalu isi password baru pada kolom new password dan confirm new \npassword. \n3) Klik save untuk menyimpan password baru. \n \n\n\n\n\n1 \n2 \n3 \n24 25 \n25 \nBelum Approve \nSudah Approve \n26 \n27 \n25 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 17 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.7.  Keluar / Log Out dari Aplikasi Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk. \n2) Klik Log Out untuk keluar dari aplikasi Service Desk.  \n \n7. KONDISI KHUSUS \n- \n8. LAMPIRAN \n- \n\n1 \n2 ');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903141353374319124', '001._Implementasi_Aplikasi_Service_Desk_Paid_Version_untuk_Store_MLW_dan_Surabaya', 'application/pdf', 1, 'pdf', '001._Implementasi_Aplikasi_Service_Desk_Paid_Version_untuk_Store_MLW_dan_Surabaya', 'application/msword', 1, 'doc', '002._Undangan_Training_Refreshment_Penggunaan_Aplikasi_Service_Desk', 'application/msword', 0, 'doc', 'persetujuan_form.pdf', 'application/pdf', ' \n \nM E M O       \n \n \n1/2 \n\nNomor : 001/ MMO.KMS / HRD.HRS / IV / 2017 \nTanggal : 07 April 2017 \nKepada Yth. : Area Manager \nSenior Store Manager \n \nStore Manager ± Graha Family  \nAsistant Store Manager ± Melawai \nIbu Helen A. Kadirung \nBpk. Robby Ricardo \nBpk. Wibowo Sentoso \nBpk. Achmad Basyari \nIbu Ita Alemina \nTembusan : Boards of Directors \nGeneral Manager Engineering & Services \nKM Project Streering Commitee \n \nKM Project Sponsor \n \nR & D Manager \nQC Operation Manager \nStore Engineering Manager \nKM Project Manager \nKM Project Team \n \n \nBpk. Prihanto Basuki \nIbu Tammy Tanumihardja \nIbu Citrawati Hendrawidjadja \nIbu Cynthia Fellicianne \nBpk. Anthony Pamungkas \nIbu Rani Andarini \nBpk. Bobby Santosa \nBpk. Adhiguna Natadimadja \nBpk. Aditya Wardiman \nBpk. Hendri Wijaya \nIbu Siu Lian \nIbu Oktriesa \nDari : KM Supervisor Johan Mohammad \nPerihal : IMPLEMENTASI APLIKASI SERVICE DESK PAID VERSION UNTUK STORE MLW DAN SURABAYA  \nSifat : Classified ± Non Confidential \nLampiran : - \n \nDengan hormat, \n Terkait dengan  rencana  implementasi service  desk paid version untuk  Store  MLW  dan  Surabaya,  kami  telah \nmenambahkan menu baru ke dalam service katalog service desk. Sehingga menu yang dapat diakses oleh Store MLW dan \nSurabaya adalah sbb: \n \nNo Menu Sub Menu Approver Technician \n1 HRD Recruitment Complaint laporan data pekerja (LDP) - \nIbu Fitria \nHandayani \nComplaint realisasi jumlah pemenuhan pekerja - \nComplaint realisasi kualitas pemenuhan pekerja   - \nPermohonan lokasi mutasi pekerja (dalam kota) AM & SSM \nPermohonan mutasi seksi pekerja (dalam store / \nunit yang sama) \nAM & SSM \n2. HR Personal Admin  Submit jadwal kerja bulanan (JKB) - Ibu Putri Rahayu Submit revisi jadwal kerja bulanan (revisi JKB) - \n \n \nM E M O       \n \n \n2/2 \n\nNo Menu Sub Menu Approver Technician \nPermohonan jam kerja tambahan (JKT) ± \nPersonal  \n- \nPermohonan jam kerja tambahan (JKT) ± Massal  - \nKeputusan status hubungan kerja (KSHK) AM & SSM \nHasil penandatanganan surat perjanjian kerja \n(SPK) \n- \nInformasi terminasi (H=0) - \nInformasi penyelasaian terminasi (H+5) - \n3 HR Compentation & Benefit BPJS Kesehatan ± pendaftaran pekerja - \nBpk. Deky \nSabartono \nBPJS Kesehatan ± penambahan anggota \nkeluarga \n- \nBPJS Kesehatan ± perubahan data peserta - \n4 HR - Support Pengajuan reimbursement kegiatan olahraga dan \nmusik \n- Bpk. Aprizal \n5 E&S ± Store Engineering SPK / Permohonan Perbaikan - Ibu Ridha Merisha \n6 QC Operation Form complaint kualitas - Ibu Mira Edhira \n(SBY) dan atau \nBpk. Anggara \nIswadisar (JKT) \nForm complaint kuantitas - \n \n Adapun alamat website service desk ± KMS adalah kms.bakmigm.co.id:8080 untuk login & passwordnya Ibu dan \nBapak dapat menghubungi saya (Johan Mohammad) di nomor ext. 416.   \n Penggunaan service desk untuk seluruh menu diatas berlaku mulai Senin, 10 April 2017, dimana Ibu dan Bapak \ndiharapkan  untuk  melakukan direct  request melalui  aplikasi service desk tersebut  (tidak menggunakan cara \nkonvensional/sebelumnya). \n Demikian informasi ini kami sampaikan. Apabila terdapat hal yang ingin ditanyakan lebih lanjut, Ibu dan Bapak dapat \nmenghubungi kami di ext. 416 (Johan Mohammad dan Bpk. Aditya Wardiman ± HR Support/Knowledge Management). Atas \nperhatian dan kerjasamanyakami ucapkan terimakasih. \n \nHormat kami,        Mengetahui, \n \n \n \nJohan Mohammad         Aditya Wardiman  \nKM Supervisor        KM Project Manager '),
('1903141542331934082', 'BAST', 'application/msword', 1, 'doc', 'ApprovalPages', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'URF_RawData_Personalia', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'BAST_UAT_Phase_16.pdf', 'application/pdf', '                            \n             \nBerita  Acara Serah Terima \nPEMBUATAN APLIKASI EDOCUMENT\nPada hari ini Rabu Tanggal Tiga Belas Bulan Februari Tahun Dua Ribu\nSembilan Belas, bertempat di Kantor Griya Mie Sejati dilakukan tahapan\nUAT Phase 1, dimana meliputi :\nNKegiatanTanggalKeterangan\n1UAT Sign OfDokumen\nHardcopy\n2UAT Scenario Phase 1Dokumen\nSoftcopy\nDemikian   berita   acara   ini   dibuat   sesuai   dengan   sebenarnya   sebagai   bukti\npelaksanaan kegiatan di atas.\nRabu, 13 Februari 2019\nDiserahkan Oleh,Diterima Oleh,\nBakmiGM teamRekakomindo Team\nProject ManagerTechnical\nProject ManagerProject Manager\nBusiness Process\nAnalystProject Sponsor\nBAST- Berita Acara Serah TerimaHal:  1  dr 1'),
('1903141910315360253', 'UAT_SignOff_Phase_14', 'application/pdf', 1, 'pdf', 'ApprovalPages1', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 'docx', 'tb_docstructtipe', 'application/vnd.ms-excel', 0, 'xls', 'BAST_UAT_Phase_17.pdf', 'application/pdf', '\nPROYEK APLIKASI\nNEW E.DOGUMENT\nUsen Accepraruce Tesrtruc PnRsr 1 - Sre n-Orr Fonna\nTim Rekakomindo telah menerima dan menyepakati hasil UAT bersama tim BakmiGM.\nAdapun UAT dilakukan berdasarkan skenario UAT yang telah disusun bersama-sama dengan tim,\nsecara ringkas skenario UAT ditujukan untuk melakukan testing dan uji validasi terhadap fitur -fitur\nberikut :\no Kontribusi Dokumen\n. Workflow Approval Dokumen ( pencipta, pendistribusi, atasan pencipta)\no Publikasi Dokumen (dapat dilihat oleh pengguna)\nKami telah menyatakan bahwa UAT yang dilakukan berdasarkan skenario yang disusun telah dapat\nditerima dan sesuai denqan hasil vanq tertuanqkan dalam skenario UAT.\nSignaire:\n(UAT Team)\nNotes:'),
('1903142054476982363', 'UAT_Sign_Off_Phase11', 'application/msword', 1, 'doc', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'BAST_UAT_Phase_18.pdf', 'application/pdf', 'PROYEK APLIKASI \nNEW E-DOCUMENT\nUSER ACCEPTANCE TESTING PHASE 1 - SIGN-OFF FORM \nTim Rekakomindo telah menerima dan menyepakati hasil UAT bersama tim BakmiGM.\nAdapun UAT dilakukan berdasarkan skenario UAT yang telah disusun bersama-sama dengan tim, \nsecara ringkas skenario UAT ditujukan untuk melakukan testing dan uji validasi terhadap fitur -fitur \nberikut :\niKontribusi Dokumen\niWorkflow Approval Dokumen ( pencipta, pendistribusi, atasan pencipta)\niPublikasi Dokumen (dapat dilihat oleh pengguna)\n \nKami telah menyatakan bahwa UAT yang dilakukan berdasarkan skenario yang disusun telah dapat diterima\ndan sesuai dengan hasil yang tertuangkan dalam skenario UAT.\nSignatre:\n(UAT Team)\nSignature:\n(Rekakomindo)\nNotes :'),
('1903150841576896678', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 'r'),
('1903162038142399837', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali1', 'application/pdf', 1, 'pdf', 'SyncDataHRIS1', 'application/vnd.ms-excel', 1, 'xls', 'SyncDataHRIS2', 'application/vnd.ms-excel', 1, 'xls', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali2.pdf', 'application/pdf', '171251\n27/Feb/2019 16:17 WIBCopyright of Bakmi GM \n1 \n \nKebijakan :  Kartu Identitas Penduduk Sementara (KIPS) Bagi Pekerja BGM Di Kantor (DC) / \nStore Bali \nNomor      :  PKP-IRL-IRL-H.24   \nTanggal    :  01 September 2018 \nVer.          :  1.0 \nDistribusi  :  Store Mgr, Senior Store Mgr, Area Mgr, Mgr, General Mgr, Director \n \n \n1. Tujuan \n \nMengatur ketentuan mengenai KIPS (Kartu Identitas Penduduk Sementara) untuk Pekerja BGM di \nKantor (Distribution Center) / Store Bali. \n \n2. Pengertian \n \nKIPS (Kartu Identitas Penduduk Sementara) atau KIPP (Kartu Identitas Penduduk Pendatang) atau \nKIPEM (Kartu Identitas Penduduk Musiman) adalah Kartu Identitas Penduduk yang dipersyaratkan \noleh peraturan  lokal Desa (Desa pakreman dan/atau Desa  dinas) di wilayah  Provinsi Bali, yang \nbertujuan untuk mengatur pendataan penduduk pendatang. \n \n3. Ruang Lingkup  \n \n3.1. Perusahaan BGM \n3.2. Pekerja BGM di Kantor (Distribution Center) / Store Bali \n \n4. Ketentuan ² ketentuan  \n \n4.1. KIPS (Kartu Identitas Penduduk Sementara) atau KIPP (Kartu Identitas Penduduk Pendatang) \natau  KIPEM  (Kartu  Identitas  Penduduk  Musiman)  adalah  Kartu  Identitas  Penduduk  yang \ndipersyaratkan oleh peraturan lokal Desa (Desa pakreman dan/atau Desa dinas) di wilayah \nProvinsi Bali, yang bertujuan untuk mengatur pendataan penduduk pendatang; \n \n4.2. Pekerja BGM di Kantor (DC) / Store Bali yang termasuk sebagai penduduk pendatang juga \ndipersyaratkan / diwajibkan memiliki KIPS (KIPP/KIPEM) oleh peraturan lokal Desa setempat \n(Desa pakreman dan/atau Desa dinas); \n \n4.3. Bilamana peraturan lokal Desa setempat (Desa pakreman dan/atau Desa dinas) mewajibkan \ndan mempersyaratkan penduduk pendatang memiliki KIPS (KIPP/KIPEM), maka pekerja BGM \ndi Kantor (DC) / Store Bali yang menempati rumah (atau bertempat tinggal) di area Desa \nsetempat wajib memiki KIPS (KIPP/KIPEM); \n \n4.4. Ketentuan  mengenai µMVMO  GMHUMO /  asal  kota¶ penduduk  pendatang yang diwajibkan  / \ndipersyaratkan memiliki KIPS (KIPP/KIPEM) baik yang berasal dari daerah Luar Pulau Bali \nataupun yang berasal dari Luar Kota Denpasar adalah mengikuti ketentuan yang tertulis dalam \nperaturan lokal masing ± masing Desa setempat (Desa pakreman dan/atau Desa dinas);  \n171251\n27/Feb/2019 16:17 WIB \n2 \n \n4.5. Ketentuan mengenai besarnya biaya untuk pembuatan atau biaya untuk mendapatkan KIPS \n(KIPP/KIPEM) serta mengenai masa berlakunya KIPS (KIPP/KIPEM) adalah sesuai dengan \nperaturan lokal masing ± masing Desa setempat (Desa pakreman dan/atau Desa dinas); \n \n4.6. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) bagi \npekerja ² pekerja baru adalah sebagai berikut :  \n4.6.1. Bagi pekerja ± pekerja baru yang berdomisili atau direkrut µSRLQP RI OLUH¶ di Pulau Bali, \nuntuk ditempatkan di Kantor (DC) / Store ± store Bali :  biayanya ditanggung oleh \nmasing ± masing pekerja;  \n4.6.2. Bagi pekerja ± pekerja baru yang direkrut µSRLQP RI OLUH¶ di luar Pulau Bali, untuk \nditempatkan di Kantor (DC) / Store ± store Bali :  biayanya ditanggung oleh masing ± \nmasing pekerja;  \n \n4.7. Pengurusan pembuatan KIPS (KIPP/KIPEM) bagi pekerja ² pekerja baru sebagaimana yang \ndimaksud dalam ketentuan no. 4.6. tersebut diatas adalah dilakukan sendiri oleh masing ± \nmasing pekerja ybs; \n \n4.8. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) bagi \nPekerja Mutasi Luar Kota ke Kantor (DC) / Store ² store di Bali adalah sebagai berikut : \n4.8.1. Bagi 3HNHUÓM  µ0XPMVL  7HPMS  IXMU  .RPM  NMUHQM  3HUPLQPMMQ  6HQGLUL¶ :   biayanya \nditanggung oleh masing ± masing pekerja; \n4.8.2. %MJL  3HNHUÓM  µ0XPMVL  6HPHQPMUM Luar  Kota NMUHQM  3HUPLQPMMQ  6HQGLUL¶ :  biayanya  \nditanggung oleh masing ± masing pekerja; \n4.8.3. %MJL 3HNHUÓM µ0XPMVL 6HPHQPMUM Luar Kota NMUHQM 3HULQPMO 3HUXVMOMMQ¶ : biayanya \nditanggung  oleh  Perusahaan untuk masa  berlaku 6 (enam) bulan,  dan  dapat \ndiperpanjang untuk masa 6 (enam) bulan berikutnya; \n \n4.9. Pengurusan pembuatan KIPS (KIPP/KIPEM) bagi pekerja ² pekerja Mutasi Luar Kota ke \nKantor (DC) / Store ² store di Bali sebagaimana yang dimaksud dalam ketentuan no. 4.8. \ntersebut diatas adalah sebagai berikut :  \na. Bagi 3HNHUÓM  µ0XPMVL  7HPMS  IXMU  .RPM  NMUHQM  3HUPLQPMMQ  6HQGLUL¶ : : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan sendiri oleh masing ± masing pekerja ybs, atau \ndapat dibantu oleh Supervisor GA & Engineering Kantor (DC) Bali; \nb. Bagi pekerja µ0XPMVL  6HPHQPMUM Luar  Kota NMUHQM  3HUPLQPMMQ  6HQGLUL¶ : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan sendiri oleh masing ± masing pekerja ybs, atau \ndapat dibantu oleh Supervisor GA & Engineering Kantor (DC) Bali;  \nc. Bagi pekerja µ0XPMVL 6HPHQPMra Luar Kota NMUHQM 3HULQPMO 3HUXVMOMMQ¶ : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan oleh Supervisor GA & Engineering Kantor (DC) \nBali;  \n \n4.10. Pengajuan  biaya atau  penggantian  biaya ke  Perusahaan untuk  pembuatan  atau  untuk \nmendapatkan  KIPS  (KIPP/KIPEM) bagi pekerja µ0XPMVL  6HPHQPMUM Luar  Kota karena \n3HULQPMO 3HUXVMOMMQ¶ sebagaimana yang dimaksud dalam ketentuan no. 4.8. butir c dan no. \n4.9. butir c tersebut diatas dilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali \n171251\n27/Feb/2019 16:17 WIB \n3 \n \nmelalui  mekanisme pengajuan yang  ditetapkan  oleh  Dept.  Finance ± KP, baik  melalui \nmekanisme  Bon  Sementara  (BS)  maupun  melalui  mekanisme  penggantian  biaya \n(µreimbursement¶). \n \n4.11. Pengajuan  biaya atau  penggantian  biaya ke  Perusahaan untuk  pembuatan  atau  untuk \nmendapatkan  KIPS  (KIPP/KIPEM)  sebagaimana  yang  dimaksud  dalam  ketentuan no.  4.9. \ntersebut diatas harus melampirkan bukti ± bukti pendukung berupa : \na. Tanda bukti / tanda terima (asli) pembayaran biaya KIPS (KIPP/KIPEM) yang dikeluarkan \noleh Desa setempat (Desa pakreman dan/atau Desa dinas);  \nb. Memo (fotocopy) Mutasi Luar Kota pekerja ybs, yang dikeluarkan oleh Dept. Recruitment ± \nKP; \nc. KIPS (KIPP/KIPEM) (fotocopy) yang lama atau yang sudah tidak berlaku, bilamana untuk \nperpanjangan KIPS (KIPP/KIPEM); \n \n4.12. Bilamana 3HNHUÓM µ0XPMVL 6HPHQPMUM IXMU .RPM NMUHQM 3HULQPMO 3HUXVMOMMQ¶ GLPXPMVLNMQ NH \nStore lainnya di Bali sehingga harus membuat KIPS (KIPP/KIPEM) yang baru karena pindah \nrumah  (tempat  tinggal),  sedangkan  masa  berlaku KIPS  (KIPP/KIPEM)  yang  lama  belum \nberakhir dan 6 (enam) bulan biayanya masih menjadi tanggungan Perusahaan belum berakhir, \nmaka  biaya  pembuatan KIPS  (KIPP/KIPEM)  yang  baru tersebut tidak  menjadi  tanggungan \nPerusahaan; \n \n4.13. Pekerja BGM yang tidak memiliki KIPS (KIPP/KIPEM) atau yang sudah habis / lewat masa \nberlakunya adalah  melanggar Peraturan  /  Ketentuan  Perusahaan karena hal  tersebut \nberpotensi menyebabkan terganggunya operasional Perusahaan (Store).  Kepada pekerja yang \nmelakukan pelanggaran Peraturan / Ketentuan tsb dapat dikenakan sanksi sesuai ketentuan \ndalam Perjanjian Kerja Bersama (PKB) atau Peraturan Perusahaan yang berlaku;  \n \n4.14. Monitoring dan kontrol terhadap Pekerja BGM yang tidak memiliki KIPS (KIPP/KIPEM) atau \nyang sudah habis / lewat masa berlakunya dilakukan oleh Supervisor GA & Engineering \nKantor (DC) Bali atau oleh PIC Dept Kantor (DC) / PIC Store di Bali; \n \n4.15. KETENTUAN KHUSUS \nMengingat dan  mempertimbangkan bahwa pada saat  / waktu  pembukaan  Kantor \n(Distribution Center) Bali dan pembukaan Store pertama & kedua (ke-1 & ke-2) di Bali \ntahun  2018 belum  ada  Kantor  (DC)  /  Store  BGM  yang  sudah  beroperasi,  maka  berlaku \nKETENTUAN KHUSUS sebagai berikut : \n4.15.1. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) \npekerja adalah sebagai berikut : \na. Bagi pekerja ± pekerja baru yang direkrut µSRLQP RI OLUH¶ di luar Pulau Bali, yang \nmenjalani Prog. Diklat dan/atau masa PKWT-1 di store ± store luar Pulau Bali \n(misalnya  di  Surabaya)  atau yang menjalaninya  di  store  Pulau  Bali, dan \nselanjutnya untuk ditempatkan  di  Store  Bali  :   biayanya ditanggung  oleh \nPerusahaan untuk masa berlaku 6 (enam) bulan; \n171251\n27/Feb/2019 16:17 WIB \n4 \n \nb. %MJL 3HNHUÓM µ0XPMVL 6HPHQPMUM IXMU .RPM NMUHQM 3HUPLQPMMQ 6HQGLUL¶ ke Kantor \n(DC) / Store Bali : biayanya  ditanggung oleh Perusahaan untuk masa berlaku 6 \n(enam) bulan; \nc. %MJL  3HNHUÓM  µ0XPMVL  6HPHQPMUM  IXMU  .RPM  NMUHQM  3HULQPMO  3HUXVMOMMQ¶  NH \nKantor  (DC)  /  Store  Bali  : biayanya ditanggung oleh  Perusahaan untuk masa \nberlaku 6  (enam)  bulan,  dan  dapat  diperpanjang untuk masa  6  (enam)  bulan \nberikutnya; \n4.15.2. Pengurusan  pembuatan  KIPS  (KIPP/KIPEM) pekerja sebagaimana  yang  dimaksud \ndalam ketentuan no. 4.15.1. tersebut diatas adalah sebagai berikut :  \na. %MJL SHNHUÓM NMUX \\MQJ GLUHNUXP µSRLQP RI OLUH¶ GL OXMU 3XOMX %MOL yang menjalani \nProg.  Diklat  dan/atau  masa  PKWT-1  di  store  luar  Pulau  Bali  (misalnya  di \nSurabaya)  atau yang menjalaninya  di store  Pulau  Bali, dan  selanjutnya untuk \nditempatkan  di  Store  Bali    : pengurusan pembuatan KIPS (KIPP/KIPEM)  \ndilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali; \nb. Bagi pekerja µ0XPMVL 6HPHQPMUM Luar Kota NMUHQM 3HUPLQPMMQ 6HQGLUL¶ ke Kantor \n(DC) / Store Bali : pengurusan pembuatan KIPS (KIPP/KIPEM) dilakukan oleh \nSupervisor GA & Engineering Kantor (DC) Bali; \nc. Bagi pekerja µ0XPMVL 6HPHQPMUM Luar Kota karena Perintah Perusahaan¶ NH VPRUH \nBali : pengurusan pembuatan KIPS (KIPP/KIPEM) dilakukan oleh Supervisor GA \n& Engineering Kantor (DC) Bali;  \n4.15.3. Pengajuan biaya atau penggantian biaya ke Perusahaan untuk pembuatan atau untuk \nmendapatkan KIPS (KIPP/KIPEM) sebagaimana yang dimaksud dalam ketentuan no. \n4.15.2. tersebut diatas dilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali \nmelalui mekanisme pengajuan yang ditetapkan oleh Dept. Finance ± KP, baik melalui \nmekanisme  Bon  Sementara (BS) maupun  melalui  mekanisme  penggantian  biaya \n(reimbursement).  \n4.15.4. Pengajuan biaya atau penggantian biaya ke Perusahaan untuk pembuatan atau untuk \nmendapatkan KIPS (KIPP/KIPEM) sebagaimana yang dimaksud dalam ketentuan no. \n4.15.3. tersebut diatas harus melampirkan bukti ± bukti pendukung berupa : \na. Tanda bukti / tanda terima (asli) pembayaran biaya KIPS (KIPP/KIPEM) yang \ndikeluarkan oleh Desa setempat (Desa pakreman dan/atau Desa dinas);  \nb. Memo  (fotocopy)  Mutasi  Luar  Kota  pekerja  ybs,  yang  dikeluarkan  oleh  Dept. \nRecruitment ± KP; \nc. KIPS  (KIPP/KIPEM)  (fotocopy)  yang  lama  atau  yang  sudah  tidak  berlaku, \nbilamana untuk perpanjangan KIPS (KIPP/KIPEM); \n \n \n5. Dokumen Yang Terkait Kebijakan \n \n±   Surat Perjanjian Prog. Diklat / MT & Surat Perjanjian Kerja PKWT \n±   Memo Mutasi Luar Kota pekerja \n            ±  Formulir Permohonan Ijin dan Pemberitahuan (FPIP) \n \n \n \n \n171251\n27/Feb/2019 16:17 WIB \n5 \n \n6. Efektif Berlaku \n \nKebijakan ini berlaku mulai tanggal 01 September 2018.   \nApabila dalam pelaksanaannya terdapat hal-hal yang memerlukan pengaturan lebih lanjut baik hal-hal \nyang bersifat teknis dan prosedural maupun terhadap hal-hal baru yang timbul kemudian, maka akan \ndikeluarkan kebijakan baru sebagai kelengkapan dari kebijakan ini. \n '),
('1903170940409388080', 'uploadItem', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'ok1', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'Utama', 'application/pdf', 1, 'pdf', 'PERSETUJUAN1.pdf', 'application/pdf', 'Category NameItem Number\nJABODETABEKCHL0003\nJABODETABEKCHL5049\nJABODETABEKCHL5052\nJABODETABEKCLN5001\nJABODETABEKCLN5034\nJABODETABEKDRY0036\nJABODETABEKDRY4095\nJABODETABEKDRY4097\nJABODETABEKFSTR007\nJABODETABEKFSTR015\nJABODETABEKFSTR019\nJABODETABEKFSTR021\nJABODETABEKFSTR068\nJABODETABEKFSTR078\nJABODETABEKFSTR079\nJABODETABEKFSTR084\nJABODETABEKFSTR085\nJABODETABEKFSTR086\nJABODETABEKFSTR101\nJABODETABEKFSTR104\nFSTR021BAKMI GORENG REBUS\nFSTR068PANGSIT REBUS BUNGKUS\nCHL5052SAOS IKAN 1 LT\nCHL5049SAOS MIE GORENG 1 LT\nFSTR104ACAR TIMUN CINCANG\nFSTR085\nFSTR079\nFSTR086\nFSTR084\nFSTR078ISI BAKMI \nGORENG\n(DaunBwgI\nris, \nBwgPutihGl\ng, \nAyamGrgn, \nUdangKupa\nsBumbu, \nBasoIkan)\nISI CAP \nCAY\n(BwgPutih\nGlg, \nDaunBwgIri\ns, \nBasoIkan, \nBasoOtak-\notakGrg, \nAyamCapc\nayGrg, \nUdangBrsh\nBumbu)\nISI NASI \nGORENG\n(CabeMera\nhBelah, \nDaunBwgIri\ns, \nBwgPutihGl\ng, \nAyamGrgn, \nUdangKupa\nsBumbu, \nBaso Ikan)\nSAYURAN \nMIX \nBAKMI \nGORENG\n(CaisimPot\nong, Kol \nIris)\nSAYURAN \nMIX CAP \nCAY\nFSTR078\nCHL0003BASO SAPI\nFSTR007\nFSTR015DAGING PANGSIT BUMBU 2.4 KG\nFSTR019TELOR DADAR\nDRY0036HAWYU 80 OZ\nCLN5034TISSUE TAMU LIVI\nDRY4095PAPER BOWL XL\nDRY4097SOUP CUP 10 OZ\nCLN5001DIVERSOL CX\nFSTR101NOBLA LIQUID 2LT(Caisim \nPotong, \nPecai iris, \nWortel iris, \nKembang \nKol rebus)\nAYAM GM \nMASAK\n(JamurIris, \nDaunBwgIri\ns, \nBwgPutihGl\ng, \nAyamGMGr\ng, \nMyBimoli, \nSaosGM, \nSaosIkan, \ndll.)'),
('1903171711301885316', 'Manual_Guide_Personalia_v1.0.1', 'application/msword', 1, 'doc', 'tb_docstructtipe1', 'application/vnd.ms-excel', 0, 'xls', 'File_Not_Found', '-', 0, '-', 'BAST_UAT_Phase_110.pdf', 'application/pdf', 'Setup Attendance Group Schedule\nTUJUAN : Untuk menangani permasalahan user tidak dapat melakukan attendance \nedit untuk pekerja yang mutasi dari GMS ke GMR atau sebaliknnya.\n1.Login HRIS\n2.Kemudian lanjutkan ke menu Time Attendance | Attendance Group \nSchedule\n3.Pilih lakukan pencarian berdasarkan employee name atau employee No. dan \nklik [search].\n4.Setelah nama pekerja ditampilkan , maka kemudian klik link pada [ employee\nNo].\n5.Maka apabila ditampilkan sbb ; tidak ada group schedule yg diassign kepada \npekerja tsb.\n6.Klik link Add Attendance Schedule, kemudian akan ditampilkan Message Box \ndan klik [OK].\n7.Kemudian pada layar yang ditampilkan , lakukan langkah berikut :\na.Masukan tanggal 1 bulan mutasi pekerja tersebut pada kolom Start \nDate.\nb.Checklist pada kolom aktif.\nc.Pilih Group Name sesuai dengan pola kerjanya. Untuk Operation adalah\n6 hari kerja & 1 hari libur.\nd.Klik [Add] untuk menyimpan perubahannya.\nCollect Data Report HR\nTUJUAN : Untuk mengambil rawdata HR untuk keperluan pembuatan laporan data \nPersonalia di divisi HR.\nLAPORAN HR yang dapat dikelola adalah :\n1.Laporan Data Pekerja per 31 Desember berdasarkan Level\n2.Laporan Data Pekerja per 31 Desember berdasarkan Usia (range)\n3.Laporan Data Pekerja per 31 Desember berdasarkan Masa Kerja (range)\n4.Laporan Data Pekerja Pensiun\nLangkah-langkah untuk mengelolanya adalah sbb :\n1.Buka aplikasi Ms. OiÌifiÌice Excel\n2.Kemudian masuk ke DATA | FROM OTHER SOURCES | FROM MICROSOFT \nQUERY\n3.Kemudian akan ditampilkan message box seperti berikut.\n4.Pilihlah <New Data Source> dan klik [OK]. Selanjutnya berilah nama yang \nsesuai dan mempermudah anda. Kira-kira sesuai dengan gambar berikut.\n5.Kemudian klik [connect]. Dan kemudian masukkan beberapa parameter \nberikut.\niInput pada kolom SERVER :  hris.bakmigm.co.id\niUnchecked kolom "Use Trusted Connection".\niInput pada kolom Login ID : hrd ; dan kosongkan pada kolom password. \nDan klik [OK] ; juga klik button [OK] pada table berikutnya.\n6.Tunggu sampai ditampilkan layar Microsoft Query seperti pada gambar \nberikut, selanjutnnya klik [Cancel].\n7.Setelah itu akan ditampilkan layar untuk memilih table ; maka klik [Close].\n8.Klik Button [SQL] ; dan masukkan beberapa parameter berikut. Dan kemudian\ntulis di dalam box SQL Statement berikut : execute HR_Personalia \'2014\';\n9.Selanjutnya pilih FILE | Return Data to Ms. Excel\n10.Kemudian import data yg sudah ditarik dari HRIS ke ifile Excel tsb, sesuai \ngambar berikut. Dan klik [OK].\n11.Data yang dapat ditarik adalah data per tahun, maka parameter yang \ndimasukkan adalah angka digit tahun, seperti : 2014, 2015, 2016, dstnya.\n12.Ubahlah parameter tahun tersebut dengan cara sbb.\niKlik [Connection Properties]\niPilih Tab [Deifinition]\niDan lakukan perubahan pada ifield "Command Text " sbb : execute \nHR_Personalia \'2015\'\n13.Setelah sudah diperoleh datanya maka dapat digunakan oleh tim Personalia \nmengolahnya dengan PIVOT table.\nUpload Data Absensi Manual'),
('1903171719262822556', 'Glossari_Klasifikasi_Dokumen_-_(04.09.17)1', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali3', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali4', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali5.pdf', 'application/pdf', '171251\n27/Feb/2019 16:19 WIBCopyright of Bakmi GMNO.NAMASINGKATANDEFINISIContoh DokumenKomentar\nICOMPANY PROFILEDokumen yang berisi penjelasan mengenai perusahaan secara umum, seperti: profil perusahaan, sistem \nmanajemen, visi, misi, nilai  perusahaan serta manual produk dan layanan yang dihasilkan. \n1VisiPernyataan mengenai gambaran masa depan yang akan dipilih dan yang akan diwujudkan pada suatu saat \nyang ditentukan.\n2MisiPernyataan mengenai tindakan untuk mewujudkan atau merealisasikan apa yang menjadi visi dari \nperusahaan.\n3Corporate ValuePernyataan mengenai nilai-nilai dalam perusahaan yang dapat memotivasi karyawan guna mencapai tujuan \nperusahaan.\n7 Nilai Budaya Bakmi GM\n4Kode Etik PerusahaanKebijakan etis perusahaan berhubungan dengan kesulitan yang bisa timbul (mungkin pernah timbul dimasa \nlalu), seperti konflik kepentingan, hubungan dengan pesaing dan pemasok, menerima hadiah, sumbangan dan \nsebagainya.\n5Value Chain MapDokumen berisi pemetaan hubungan antara proses inti dengan proses pendukung dalam menjalankan suatu \nbisnis.\n6Kelengkapan perusahaanDokumen kelengkapan ijin pendirian perusahaan. TDP, SIUP, Akte, NPWP, Domisili.\n7Sertifikat dan StandarisasiDokumen pernyataan yang menunjukkan perusahaan sudah memenuhi kualifikasi tertentu.  \ncontoh: Halal, Paten\nHalal\n8Manual Sistem Jaminan HalalDokumen sistem yang menjamin kepada MUI atas kehalalan produk suatu perusahaan sepanjang masa \nperusahaan itu memegang Sertifikat  Halal  MUI.  \nManual Sistem Jaminan Halal Bakmi GM\n9Balance Score CardBSCDokumen berisi konsep yang mengukur kinerja suatu organisasi dari empat perspektif yaitu perspektif \nfinansial, perspektif customer, perspektif proses bisnis internal, perspektif pertumbuhan dan pembelajaran.\n10Bill of Material / \nStandar Bahan dan Bumbu\nBoM / SBBDokumen berisi material yang dibutuhkan untuk memproduksi produk akhir. \nDisajikan dalam rangkaian struktur atau tabel susunan.\nCoffee Mix\n11Product SpecificationDokumen yang mendefinisikan informasi / karakteristik utama mengenai suatu produk yang menjadi standar. \nKarakteristik produk dapat mencakup, tetapi tidak terbatas sebagai berikut: estetika (penampilan fisik) \nproduk, masa pakai, standar penyimpanan, dan lainnya.  \nBakmi Rebus\n12Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi.\ncontoh: Peraturan Halal, BPOM.\nDokumen Halal MUI\nIIKEBIJAKAN & STRUKTUR \nORGANISASI\nDokumen yang terkait dengan kebijakan, struktur organisasi, dan job summary.\n1Pernyataan Kebijakan \nPerusahaan\nPKPDokumen berisi batasan/ketentuan yang ditetapkan oleh perusahaan dan digunakan sebagai dasar dalam \nmelaksanakan prosedur terkait.\nPelaksanaan SSOP terkait Implementasi \nSistem Jaminan Halal (QA)\n2Struktur OrganisasiSTODokumen berisi diagram susunan dan hubungan antara tiap bagian serta posisi yang ada pada suatu \norganisasi atau perusahaan dalam menjalankan kegiatan operasional untuk mencapai tujuan yang \ndiharapakan dan diinginkan.\nSTO Operations ; STO Supply ; STO HR ; STO \nFAST\n3Job SummaryJBSDokumen berisi penjelasan singkat, pernyataan umum tentang fungsi dan tanggung jawab pekerjaan yang \nlebih penting, biasanya juga mengidentifikasi petugas bawahan dan atasan langsung.\nJBS IT Manager ;\nJBS PPIC & Warehouse \n4Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi,  \nmisalnya  regulasi atau peraturan perundang-undangan, spesifikasi, referensi.\nUU Ketenagakerjaan, \nPeraturan BPJS, UU ITE.\nIIIPROSEDUR & DOK. \nPENUNJANG\nPedoman kegiatan kerja termasuk diantaranya prosedur, prosedur detil, dokumen penunjang prosedur,  dan \nformulir \n1Prosedur\naBusiness Process MappingBPMSuatu kumpulan pekerjaan yang saling terkait untuk menyelesaikan suatu masalah tertentu. \nSuatu proses bisnis dapat dipecah menjadi beberapa subproses yang masing-masing memiliki atribut sendiri \ntapi juga berkontribusi untuk mencapai tujuan dari superprosesnya.\nPengeluaran dan Pengisian Uang Kas Kantor \nPusat (FIN)\nKLASIFIKASI DOKUMEN\n1 / 2\n171251\n27/Feb/2019 16:19 WIBNO.NAMASINGKATANDEFINISIContoh DokumenKomentar\nKLASIFIKASI DOKUMEN\nbOperation Process ChartOPCPeta kerja yang menggambarkan urutan kerja dan material yang digunakan untuk mencapai standar kontrol \nsuatu produk seperti critical control point dan quality control point, dimana yang diatur antara lain: ukuran \nkuantitas, waktu proses, suhu.\nBakmi Rebus Frozen (PRD)\ncStandard Operational \nProcedure\nSOPDokumen yang merupakan turunan dari bisnis proses, berisi urutan kegiatan dari suatu proses. Satu bisnis \nproses dapat terdiri dari satu atau lebih SOP.\nPelaksanaan Audit 4P, 5R dan Halal (QA) ; \nPemesanan Kue Ulang Tahun (MKT) ; \nKomplain Barang (WHS)\ndService Level AgreementSLADokumen berisi persetujuan tingkat pelayanan antara pemberi jasa/produk (pemasok internal) dengan \npenerima jasa/produk (pelanggan internal).\nDokumen SLA bisa langsung menjadi bagian dalam SOP dan tidak menjadi suatu dokumen terpisah.\nSLA Finance & Accounting Dept. (FIN)\n2Prosedur Detil\naManualMNLDokumen berisi pedoman dalam pembuatan/pengisian dokumen maupun pengoperasian suatu \nmesin/peralatan dan sistem aplikasi.\nKompor Rebus Autolifter (EST)\nbWork Instruction / \nLembar Uraian Kerja\nWIS / LUKDokumen yang merupakan turunan dari OPC / SOP / MNL, berisi petunjuk detail spesifik yang dibutuhkan \nuntuk melakukan pekerjaan tertentu secara benar berdasarkan standar pengerjaannya, seperti: ukuran \nkuantitas, waktu proses, suhu. Ditujukan untuk satu pelaku tugas.\nWIS disajikan dalam bentuk urutan langkah pekerjaan, dilengkapi gambar, item dan standar mutu.\nLUK disajikan dalam bentuk tabel berisi langkah utama, hal penting, dan alasan yang perlu diperhatikan \nsebagai bahan pengajaran bagi para trainer.\nPembersihan Kendaraan dengan Selang Air \n(OSV) ;\nPencucian Gelas (QC) ;\nPenggunaan Food Chopper (EST)\n3Dokumen Penunjang Prosedur\naStandar - Matriks / DaftarMTK / DFTBagian dari kebijakan / prosedur berisi kesepakatan-kesepakatan yang telah didokumentasikan yang di \ndalamnya terdiri antara lain mengenai spesifikasi-spesifikasi teknis atau kriteria-kriteria yang akurat yang \ndigunakan sebagai peraturan, petunjuk, atau definisi-definisi tertentu untuk menjamin suatu barang, produk, \nproses, atau jasa sesuai dengan yang telah dinyatakan. \nDisajikan dalam bentuk tabel hubungan keterkaitan antara suatu fungsi dengan fungsi lain (Matriks) atau  \ndalam bentuk tabel susunan (Daftar).\nStandar Upah ;\nStandar Bakmi Rebus Frozen (QA)\nbAs Built DrawingABDDokumen berisi gambar final dari bangunan gedung yang sudah selesai dilaksanakan.\ncGambar TeknikDokumen berisi gambar peralatan / aktiva.\ndModul TrainingDokumen yang disusun berdasarkan suatu kurikulum pelatihan/pembelajaran agar menjadi suatu langkah-\nlangkah pembelajaran.\nDrawer Change Reconciliation (FIN)\n4FormulirFRMTemplate dokumen dengan kolom standar yang harus diisi untuk merekam data.Barang Bergerak dan Kemasan Isi Ulang \n(WHS) ; Permintaan Pekerja (REC)\n5Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi.Manual Mesin dari Pabrik ;  \nMateri Training Eksternal\nIVREKAMANDokumen hasil kerja atau bukti pelaksanaan kegiatan.\n1CommunicationSemua dokumen atau media yang  digunakan dalam mengirim dan menerima pesan / informasi / opini secara \nlisan atau tulisan.\nmemo, perjanjian kerja karyawan, BST, SPB, \nBS,  BPKK, warta GM, media marketing, \nDirector Speech\n2EducationDokumen yang berisi informasi / pengetahuan / pengalaman yang dapat dijadikan bahan pembelajaran.Knowledge Document Asset, solusi \npenyelesaian kerusakan, Template Project & \nLesson Learned.\n3ReportSemua dokumen keluaran kerja untuk referensi di masa mendatang.laporan finance, laporan progress BSC, \nnotulen, laporan penjualan, laporan event\n4Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi. kontrak kerja dengan vendor / supplier.\nDitinjau ulang oleh,\nNama: \n2 / 2'),
('1903171744259661130', '036_Meeting_KM_-_24_10_181', 'application/msword', 1, 'doc', 'Form_Position_Setup', 'application/vnd.ms-excel', 1, 'xls', 'URF_-_Mutation_Employee', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'UAT_SignOff_Phase_15.pdf', 'application/pdf', 'Notulen RapatSifat: ConfidentialHalaman 1 dari 1\nDibuat Oleh: Adinda Nidya LestariNo.:  036/NTL/GMS.KMS/IX/18Tanggal: 24.10.2018\nPerihal: Meeting Mingguan KMRapat:\nHadir:\niCitra H\niTedy SiAditya W\niThomas AdityaiOktriesa \niAdinda Nidya LPemimpin: Aditya Wardiman\nTanggal   : 24.10.2018\nWaktu      : 09.30 - 11.15 WIB\nNo.Aktivitas /\nMasalahKeputusan / Tindak LanjutPJ1No.\n1PROJECT E-\nDOCUMENT1)Meeting lanjutan dengan vendor akan dilaksanakan tanggal 31 OKT \n2018. Meeting ini akan membahas UAT fase 1. \n2)UAT Fase 1 membahas : Set up data (master data form registrasi) & \nKontribusi form, Flow proses sampai publish . Fase ini akan dibagi \nmenjadi tiga skenario: \noUser Admin : Tedy S\noUser GM Pencipta dan User Pencipta : Aditya W & Johan M\nPembuatan UAT (Script) mengacu pada proses di SOP.\n3)Apabila terjadi bugs 2x pada fase 1, sebaiknya tidak melaju pada \nfase 2.\n4)Untuk mengatur organization design, step yang dilakukan adalah:\noTedy S Menarik data terbaru dari HRIS & Mengklasifikasikannya\ndalam bentuk Pivot\noThomas A mencocokan dengan STO \noReview dengan GM HR \noMembuat usulan \noReview dengan masing-masing divisi\n1 PJ: Penanggung Jawab'),
('1903180911113091034', 'SOP-IRL-SCH-1.3_Pengajuan_Cuti_Mendadak', 'application/msword', 1, 'doc', 'SOP-IRL-SCH-1.3_Pengajuan_Cuti_Mendadak', 'application/vnd.visio', 1, 'vsd', 'File_Not_Found', '-', 0, '-', 'SOP-IRL-SCH-1_Pengajuan_Cuti_Mendadak_Persetujuan.pdf', 'application/pdf', 'Prosedur: \nPengajuan Cuti MendadakHal.: 1 / 3\nSifat: ConfidentialTgl.: 1 Juni 2018Ver.: 1.0No.: SOP-IRL-SCH-1.3\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATINidia\nBPI SupervisorHarsono Subroto\nArea ManagerBudi Purnama\nGM Operations\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nIndustrial RelationHanggulan Kiting\nHKM Asst. ManagerTeddy Sutanto\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.............................................................................................................................................................................2\n2.RUANG LINGKUP.............................................................................................................................................................2\n3.DEFINISI............................................................................................................................................................................2\n4.REFERENSI......................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...........................................................................................................................2\n7.KONDISI KHUSUS............................................................................................................................................................3\n8.LAMPIRAN........................................................................................................................................................................3\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti MendadakNo.: SOP-IRL-SCH-1.3Ver.: 1.0\nTgl.: 1 Juni 2018Hal.: 2 / 3\n1.TUJUAN\nUntuk mengendalikan dan memonitor aktivitas permohonan cuti mendadak yang diajukan oleh pekerja Bakmi GM.\n2.RUANG LINGKUP\n1.Store Operations\n2.Personalia Department\n3.DEFINISI\n-\n4.REFERENSI\nPKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan\n5.DOKUMEN PENUNJANG\nForm Permohonan Ijin dan Pemberitahuan (FPIP)\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPemohon1.1Mengajukan permohonan cuti kepada atasan langsung (Kepala Seksi/ Kasie)\ndengan:\n1.Mengisi Form Permohonan Ijin & Pemberitahuan (FPIP).\n2.Melampirkan bukti/ surat pendukung lainnya yang menerangkan\nalasan cuti (bila diperlukan).\nCatatan:\nPengajuan cuti yang direncanakan, minimal 1 bulan di muka (paling lambat\ntanggal 10 pada bulan berjalan).\n1.2Meminta persetujuan Kasie, dengan menyerahkan FPIP dan bukti/ surat\npendukung (jika ada).\nKasie2.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari pemohon, periksa\nkesesuaian permohonan cuti pekerja:\n1.Pemohon memiliki saldo cuti.\n2.Sesuai dengan PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan.\n3.Tidak mengganggu operasional store.\n4.Terdapat alokasi libur pada hari yang diajukan oleh petugas (tidak\nmemerlukan tenaga full team).\n5.Tidak ada kepentingan petugas lain yang lebih mendesak.\n2.2Jika cuti yang diajukan sesuai dengan kebijakan yang berlaku dan disetujui,\nmaka tandatangani FPIP.\n2.3Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada Supervisor,\nuntuk dipertimbangkan.\nSupervisor3.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Kasie:\n1.Memeriksa dan mempertimbangkan pengajuan cuti yang diajukan\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti MendadakNo.: SOP-IRL-SCH-1.3Ver.: 1.0\nTgl.: 1 Juni 2018Hal.: 3 / 3\nDilakukan olehKegiatanWaktu\noleh   pemohon   sesuai   dengan   kebijakan   yang   berlaku   dan   tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti, dengan\nmenandatangani FPIP jika setuju.\nSupervisor3.2Meminta tanda tangan Store Manager/ Asst. sebagai bukti persetujuan.\n3.3Menginformasikan ke Kasie untuk diteruskan ke pemohon bahwa pengajuan\ncuti disetujui atau tidak, dan alasannya jika tidak disetujui.\n3.4Jika disetujui:\n1.Revisi Jadwal Kerja Bulanan yang terlah dibuat sebelumnya.\n2.Upload kembali JKB yang telah direvisi pada Aplikasi Absensi, lihat\nMNL-HIS-SCH-3 Aplikasi Absensi.\n3.Mengirimkan   FPIP   dan   bukti/   surat   pendukung   (jika   ada)   ke\nDepartemen Personalia paling lambat H+4.\n7.KONDISI KHUSUS\nUntuk kebutuhan operasional store, Supervisor/ Asst. Store Manager/ Store Manager, cuti tahunan dapat:\n1.Diberikan kepada pekerja tanpa adanya pengajuan cuti oleh pekerja.\n2.Dibatalkan atau digeser ke hari lain, jika operasional kekurangan tenaga.\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2'),
('1903180914206053569', 'JBS-HRD-HSP-05_Knowledge_Management_Staff', 'application/msword', 0, 'doc', 'JBS-HRD-HSP-05_Knowledge_Management_Staff', 'application/pdf', 0, 'pdf', 'STO_ER_KM', 'application/vnd.visio', 0, 'vsd', 'Reg_Doc_JBS_KM_Staff.pdf', 'application/pdf', '                                        JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :1 / 2\nNo. Dokumen:JBS-HRD-HSP-05\nVersi & Tgl. Berlaku:1.0 & 01 Jan. 2017\nDibuat Oleh:Ditinjau Oleh:Disetujui Oleh:\nNama : Aditya WardimanNama: Cynthia FellicianneNama: Peily Dian Lie\nTanggal: 01 Januari 2017Tanggal: Tanggal:\n1.IDENTITAS JABATAN\nNama JabatanKnowledge Management Staff\nDivisiHuman Resources\nDepartemen HR Support\nKedudukan dalam Organisasi\na.Atasan Langsung\nb.Bawahan LangsungAssistant HR Support Manager \n-\n2.TUJUAN UTAMA JABATAN\nTerlaksananya implementasi program-program Knowledge Management (KM) di Perusahaan Bakmi GM. \n3.TUGAS & TANGGUNG JAWAB  \nMelaksanakan / terlibat langsung dalam implementasi program-program Knowledge Management (KM) di Bakmi GM\n(PT. Griya Mie Sejati), dengan melakukan dan bertanggung jawab sebagai berikut:\n3.1.Membantu KM Manager dan KM Supervisor dalam mengumpulkan dan menyiapkan bahan untuk membuat\nkebijakan  Knowledge Management  Bakmi GM, serta membantu dalam proses penyebaran pemahaman\nterkait kebijakan / sistem tersebut kepada seluruh pekerja Bakmi GM.\n3.2.Membantu KM Manager dan KM Supervisor dalam proses retensi aset pengetahuan, baik berupa tacit dan\nexplicit yang diperlukan oleh Perusahaan Bakmi GM. \n3.3.Membantu  KM   Manager  dan   KM  Supervisor  dalam   proses   komunikasi   (socialization),   dokumentasi\n(documentation),   pengelolaan   dokumen   (combination)   dan   penyebaran   pengetahuan   (internalization)\nberdasarkan Knowledge & Information Taxonomy Bakmi GM.\n3.4.Membantu Knowldge Manager dalam rangka memonitor penggunaan dan pemberdayaan aplikasi Service\nDesk pada proses yang dijalankan di Bakmi GM.\n3.5.Membantu pengelolaan kegiatan Sharing Knowledge di Bakmi GM.\n3.6.Membantu pengelolaan dan pemberdayaan Web Portal Knowledge Management Bakmi GM. \n                                        JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :2 / 2\nNo. Dokumen:JBS-HRD-HSP-05\nVersi & Tgl. Berlaku:1.0 & 01 Jan. 2017\n4.WEWENANG JABATAN\n-\n5.HUBUNGAN KERJA\nEKSTERNALTUJUAN\n--\nINTERNALTUJUAN\nDepartemen KP & StoreMendukung suksesnya Implementasi program-program\nKnowledge Management di Bakmi GM.\n6.SPESIFIKASI JABATAN\n6.1.\n5.1.Pendidikan, Pelatihan, Keterampilan, dan Pengalaman:\n6.1.1.Pendidikan: Minimal S1 semua jurusan (lebih diutamakan lulusan Jurusan Ilmu Komunikasi, Jurnalistik,\natau Administrasi/Dokumentasi).\n6.1.2. Pengalaman:  Fresh Graduate, diutamakan punya pengalaman kerja/magang minimal 2 tahun dalam\nbidang jurnalistik dan administrasi.\n6.1.3.Keterampilan teknis: Komunikasi (wawancara), Penulisan (jurnalistik), dan MS Office. \n6.1.4.Keterampilan non teknis: memiliki passion jurnalistik (wawancara dan menulis), Presentasi, Problem\nSolving, Administrasi dokumen.\n6.1.5.Keterampilan managerial: Manajemen Waktu, Perencanaan (planning).\n6.2.Kondisi Fisik:\n6.2.3.Jenis kelamin Pria/Wanita\n6.2.4.Tidak buta warna.\n6.2.5.Umur maksimal 27 tahun.\n6.2.6.Berbadan sehat.');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903180919514736897', 'SOP-IRL-SCH-1.1_Pengajuan_Cuti_dan_Libur3', 'application/msword', 1, 'doc', 'SOP-IRL-SCH-1.1_Pengajuan_Cuti_dan_Libur3', 'application/vnd.visio', 1, 'vsd', 'File_Not_Found', '-', 0, '-', 'Pengajuan_Cuti_dan_Libur.pdf', 'application/pdf', 'Prosedur: \nPengajuan Cuti dan LiburHal.: 1 / 4\nSifat: ConfidentialTgl.: 1 Juni 2018Ver.: 1.0No.: SOP-IRL-SCH-1.1\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATINidia\nBPI SupervisorHarsono Subroto\nArea ManagerBudi Purnama\nGM Operations\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nIndustrial RelationHanggulan Kiting\nHKM Asst. ManagerTeddy Sutanto\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.............................................................................................................................................................................2\n2.RUANG LINGKUP.............................................................................................................................................................2\n3.DEFINISI............................................................................................................................................................................2\n4.REFERENSI......................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...........................................................................................................................2\n7.KONDISI KHUSUS............................................................................................................................................................4\n8.LAMPIRAN........................................................................................................................................................................4\n1.TUJUAN\nUntuk mengendalikan dan memonitor aktivitas permohonan cuti dan libur yang diajukan oleh pekerja Bakmi GM.\n2.RUANG LINGKUP\n1)Store Operations\n2)Departemen Personalia\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 2 / 4\n3.DEFINISI\n1)C2 adalah ijin meninggalkan pekerjaan dengan tetap mendapat upah.\n2)C3 adalah cuti hamil dan melahirkan/ keguguran.\n3)C4 adalah ijin meninggalkan pekerjaan diluar tanggungan perusahaan.\n4)C5 adalah cuti melaksanakan Ibadah Haji.\n5)C6 adalah cuti haid.\n6)Hari kerja terpendek tidak lembur (kode shift P) adalah hari kerja terpendek yang jumlah jam kerjanya 5 Jam. Jam\nkerja ini dapat berlaku pada shift pagi, tengah, ataupun sore. Banyaknya jumlah hari kerja terpendek tidak lembur\nper bulan = maksimal 2 hari.\n4.REFERENSI\n1)PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan\n2)PKP-IRL-IRL-E02 Istirahat Mingguan (L1)\n5.DOKUMEN PENUNJANG\n1)Laporan Saldo Cuti\n2)Form Permohonan Ijin & Pemberitahuan (FPIP)\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPersonalia1.1Mengirimkan Laporan Saldo Cuti Pekerja ke masing store dan departemen.Maksimal\ntgl. 10\nbulan\nberjalanStore Supervisor2.1Menerima Laporan Saldo Cuti dari Personalia, dan menyimpannya pada\ntempat yang telah ditentukan.\nPemohon3.1Mengajukan permohonan cuti dan libur kepada atasan langsung (Section\nHead) dengan:\n1.Mengisi Form Permohonan Ijin & Pemberitahuan (FPIP).\n2.Melampirkan bukti/ surat pendukung kuat lainnya yang menerangkan\nalasan cuti atau libur (bila diperlukan).\nCatatan:\nUntuk cuti dan libur yang sudah direncanakan, permohonan diajukan minimal\n1 bulan di muka atau paling lambat tanggal 10 pada bulan berjalan.\n3.2Meminta persetujuan  Section Head, dengan menyerahkan FPIP dan bukti/\nsurat pendukung (jika ada).\nSection Head4.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari pemohon, periksa\nkesesuaian permohonan cuti dan libur pekerja:\n1.Pemohon memiliki saldo cuti (untuk permohonan cuti).\n2.Sesuai dengan  PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan  (untuk\ncuti) dan  PKP-IRL-IRL-E02 Istirahat Mingguan  (untuk libur), dan tidak\nmengganggu operasional store.\n3.Terdapat alokasi libur pada hari yang diajukan oleh petugas (tidak\nmemerlukan tenaga full team (FT).\n4.Tidak ada kepentingan petugas lain yang lebih mendesak.Maksimal\ntgl. 10\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 3 / 4\nDilakukan olehKegiatanWaktu\n4.2Jika cuti dan libur yang diajukan sesuai dengan kebijakan yang berlaku dan\ndisetujui, maka tandatangani FPIP.\nJika tidak, informasikan ke pemohon bahwa cuti atau libur tidak disetujui.\n4.3Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor, untuk dipertimbangkan.\nStore Supervisor5.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Section Head:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti dan\nlibur:\na.Jika tidak setuju, informasikan ke Section Head untuk diteruskan ke\npemohon bahwa pengajuan cuti atau libur tidak disetujui.\nb.Jika disetujui, menandatangani FPIP dan menyerahkan FPIP dan\nbukti/ surat pendukung (jika ada) kepada Store Manager/ Asst..\nStore Manager/ Asst.6.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Supervisor:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti, dengan\nmenandatangani FPIP jika setuju.\n6.2Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor.\nStore Supervisor7.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Manager/\nAsst.:\n1.Menginformasikan ke Section Head untuk diteruskan ke pemohon,\ncuti atau libur disetujui atau tidak.\n2.Simpan FPIP dan bukti/ surat pendukung (jika ada) pada tempat yang\ntelah ditentukan,  untuk  digunakan sebagai  dokumen  penunjang  saat\npembuatan Jadwal Kerja Bulanan (JKB).\n3.Menyimpan atau mengirimkan FPIP dan bukti/ surat pendukung (jika\nada):\na.FPIP   untuk   pengajuan   libur   berurutan,   disimpan   di  store  dan\ndimusnahkan 1 tahun setelah FPIP dibuat.\nb.FPIP permohonan cuti dan libur (selain libur berurutan) yang telah\ndijadwalkan pada Jadwal Kerja Bulanan (JKB), disimpan di store dan\ndimusnahkan 1 bulan setelah JKB digunakan.\nc.FPIP dan bukti/ surat pendukung permohonan C2 yang direncanakan,\nC3, C4, C5, dan petugas yang tidak melaksanakan  shift  pendek P\ndikirimkan ke Departemen Personalia setelah pembuatan JKB selesai\n(setiap tanggal 25).\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 4 / 4\n7.KONDISI KHUSUS\nUntuk kebutuhan operasional store oleh Store Supervisor/ Asst. Store Manager/ Store Manager, cuti tahunan dapat:\n1.Diberikan kepada pekerja tanpa adanya pengajuan cuti oleh pekerja.\n2.Dibatalkan atau digeser ke hari lain, jika operasional kekurangan tenaga.\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2'),
('1903180946059317835', 'SOP-IRL-SCH-1.5_Administrasi_Absensi', 'application/msword', 1, 'doc', 'SOP-IRL-SCH-1.5_Administrasi_Absensi', 'application/vnd.visio', 1, 'vsd', 'File_Not_Found', '-', 0, '-', 'SOP-IRL-SCH-1_adm_absensi_persetujuan.pdf', 'application/pdf', 'Prosedur: \nAdministrasi AbsensiHal.: 1 / 3\nSifat: ConfidentialTgl.: 1 Juni 2018Ver.: 1.0No.: SOP-IRL-SCH-1.5\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATINidia\nBPI SupervisorHarsono Subroto\nArea ManagerBudi Purnama\nGM Operations\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nIndustrial RelationHanggulan Kiting\nHKM Asst. ManagerTeddy Sutanto\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.............................................................................................................................................................................2\n2.RUANG LINGKUP.............................................................................................................................................................2\n3.DEFINISI............................................................................................................................................................................2\n4.REFERENSI......................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...........................................................................................................................2\n7.KONDISI KHUSUS............................................................................................................................................................3\n8.LAMPIRAN........................................................................................................................................................................3\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nAdministrasi AbsensiNo.: SOP-IRL-SCH-1.5Ver.: 1.0\nTgl.: 1 Juni 2018Hal.: 2 / 3\n1.TUJUAN\nMengatur pengerjaan administrasi absensi oleh PIC Absensi di Store, sehingga Laporan Absensi Store dikirimkan tepat \nwaktu ke Departemen Personalia.\n2.RUANG LINGKUP\n1.Store Operations\n2.Personalia Department\n3.DEFINISI\n1.Person in Charge (PIC) Absensi adalah orang yang bertanggungjawab untuk melakukan administrasi absensi di\nStore. PIC Absensi dapat ditugaskan mulai dari Asst. Store Supervisor ke Atas.\n2.Aplikasi Absensi adalah sistem manajemen data kehadiran elektronik yang berfungsi sebagai penarik, pengelola\ndan pengirim informasi kehadiran harian dari pekerja Store Operation yang berupa Shiftcode, Swipe, Cardat dan\nLaporan Klarifikasi Kehadiran.\n4.REFERENSI\n1.MNL-HIS-SCH-3 Aplikasi Absensi\n2.MTK-HIS-SCH-1.4.1 Penyelesaian Masalah Absensi\n3.Prosedur Administrasi Data Kehadiran Harian\n5.DOKUMEN PENUNJANG\n-\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPIC Absensi1.1Pada keesokan hari (H+1) setelah absensi, mengerjakan administrasi absensi\npada Aplikasi Absensi, lihat MNL-HIS-SCH-3 Aplikasi Absensi:\n1.Tarik data absensi pada Mesin  Fingerprint  dengan menggunakan\nAplikasi Tymnet (menghasilkan file Cardat), dan upload file Cardat ke dalam\nAplikasi Absensi, lihat manual bagian 6.3.3.2.7 Tarik dan Upload Cardat.\n2.Proses absensi untuk membandingkan Jadwal Kerja Bulanan (JKB)\nyang sebelumnya telah di-upload  dengan  Cardat,  lihat manual bagian\n6.3.3.2.8 Proses Absensi. Jika terdapat perbedaan antara JKB dengan\nCardat, akan muncul outstanding absensi, seperti:\na.Tidak melakukan slot fingerprint.\nb.Terlambat dalam melakukan slot fingerprint.\nc.Slot fingerprint yang dilakukan kurang (contoh : hanya melakukan slot\nfingerprint pada saat masuk saja).\nd.Kode shift yang diberikan tidak sesuai dengan data Fingerprint.\n3.Edit status outstanding absensi yang muncul pada daftar outstanding\nabsensi sesuai dengan kondisi aktual di store:\na.Cara edit status, lihat manual bagian 6.3.3.2.9 Proses Outstanding\nTransaksi, dan\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nAdministrasi AbsensiNo.: SOP-IRL-SCH-1.5Ver.: 1.0\nTgl.: 1 Juni 2018Hal.: 3 / 3\nDilakukan olehKegiatanWaktu\nb.Daftar outstanding absensi dan penyelesaiannya, lihat MTK-HIS-SCH-\n1.4.1 Penyelesaian Masalah Absensi. \n4.Tutup periode harian pada Aplikasi Absensi dan mengirimkan data\nabsensi ke Departemen Personalia, lihat manual bagian 6.3.3.2.10 Tutup\nPeriode Harian:\na.Proses Tutup Harian bisa dilakukan apabila tahap proses absensi dan\nedit status outstanding absensi sudah dilakukan,\nb.Mengirimkan data absensi ke Departemen Personalia dengan menu\n"Send FTP". Saat mengirimkan data absensi, perhatikan tanggal data\nyang dikirimkan sesuai tanggal absensi yang dikerjakan.\nCatatan:\nSecara otomatis atau berdasarkan schedule, file yang dikirimkan oleh store\nakan di-upload ke dalam Aplikasi HRIS.H+1 maks.\njam 16.00\nWIB\nPIC Absensi1.2Print Laporan  Outstanding  Absensi pada Aplikasi HRIS dan tempel pada\ntempat yang mudah diakses oleh petugas.\nCatatan:\n1.Laporan  Outstanding  Absensi yang diprint setiap hari ditempel selama\nsebulan (penempelan dapat menggunakan paper fastener), dan\n2.Pemusnahan Laporan  Outstanding  Absensi dilakukan pada H+4 hari\nterakhir akhir bulan.\n3.Ketidaksesuaian   Laporan  Outstanding  Absensi   dapat   dilaporkan   ke\nDepartemen Personalia,  lihat  SOP-HIS-SCH-1.4 Penanganan Masalah\nDisiplin Waktu Kerja.H+2\nPersonalia2.1Memeriksa   data   absensi   harian,  lihat   Prosedur   Administrasi   Data\nKehadiran Harian.\n2.2Melakukan Tutup Periode maksimal tanggal 5 setiap bulan.\n7.KONDISI KHUSUS\n1.Administrasi absensi yang dikirimkan oleh store bersifat final pada hari tersebut (tutup harian), sehingga tidak ada\nrevisi data administrasi absensi yang dilakukan oleh store pada hari berikutnya atau saat tutup periode.\n2.Revisi hanya dapat dilakukan oleh Departemen Personalia berdasarkan bukti atau surat pendukung yang\ndikirimkan oleh store.\n3.Apabila terjadi selisih pembayaran yang dibayarkan ke pekerja dikarenakan kelalaian pihak  store, (seperti\nkekurangan pembayaran uang split atau uang lembur, dll) menjadi tanggungan store.\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2'),
('1903181002417186873', 'SOP-IRL-SCH-1.1_Pengajuan_Cuti_dan_Libur4', 'application/msword', 1, 'doc', 'SOP-IRL-SCH-1.1_Pengajuan_Cuti_dan_Liburz', 'application/vnd.visio', 1, 'vsd', 'File_Not_Found', '-', 0, '-', 'Pengajuan_Cuti_dan_Libur1.pdf', 'application/pdf', 'Prosedur: \nPengajuan Cuti dan LiburHal.: 1 / 4\nSifat: ConfidentialTgl.: 1 Juni 2018Ver.: 1.0No.: SOP-IRL-SCH-1.1\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATINidia\nBPI SupervisorHarsono Subroto\nArea ManagerBudi Purnama\nGM Operations\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nIndustrial RelationHanggulan Kiting\nHKM Asst. ManagerTeddy Sutanto\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.............................................................................................................................................................................2\n2.RUANG LINGKUP.............................................................................................................................................................2\n3.DEFINISI............................................................................................................................................................................2\n4.REFERENSI......................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...........................................................................................................................2\n7.KONDISI KHUSUS............................................................................................................................................................4\n8.LAMPIRAN........................................................................................................................................................................4\n1.TUJUAN\nUntuk mengendalikan dan memonitor aktivitas permohonan cuti dan libur yang diajukan oleh pekerja Bakmi GM.\n2.RUANG LINGKUP\n1)Store Operations\n2)Departemen Personalia\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 2 / 4\n3.DEFINISI\n1)C2 adalah ijin meninggalkan pekerjaan dengan tetap mendapat upah.\n2)C3 adalah cuti hamil dan melahirkan/ keguguran.\n3)C4 adalah ijin meninggalkan pekerjaan diluar tanggungan perusahaan.\n4)C5 adalah cuti melaksanakan Ibadah Haji.\n5)C6 adalah cuti haid.\n6)Hari kerja terpendek tidak lembur (kode shift P) adalah hari kerja terpendek yang jumlah jam kerjanya 5 Jam. Jam\nkerja ini dapat berlaku pada shift pagi, tengah, ataupun sore. Banyaknya jumlah hari kerja terpendek tidak lembur\nper bulan = maksimal 2 hari.\n4.REFERENSI\n1)PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan\n2)PKP-IRL-IRL-E02 Istirahat Mingguan (L1)\n5.DOKUMEN PENUNJANG\n1)Laporan Saldo Cuti\n2)Form Permohonan Ijin & Pemberitahuan (FPIP)\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPersonalia1.1Mengirimkan Laporan Saldo Cuti Pekerja ke masing store dan departemen.Maksimal\ntgl. 10\nbulan\nberjalanStore Supervisor2.1Menerima Laporan Saldo Cuti dari Personalia, dan menyimpannya pada\ntempat yang telah ditentukan.\nPemohon3.1Mengajukan permohonan cuti dan libur kepada atasan langsung (Section\nHead) dengan:\n1.Mengisi Form Permohonan Ijin & Pemberitahuan (FPIP).\n2.Melampirkan bukti/ surat pendukung kuat lainnya yang menerangkan\nalasan cuti atau libur (bila diperlukan).\nCatatan:\nUntuk cuti dan libur yang sudah direncanakan, permohonan diajukan minimal\n1 bulan di muka atau paling lambat tanggal 10 pada bulan berjalan.\n3.2Meminta persetujuan  Section Head, dengan menyerahkan FPIP dan bukti/\nsurat pendukung (jika ada).\nSection Head4.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari pemohon, periksa\nkesesuaian permohonan cuti dan libur pekerja:\n1.Pemohon memiliki saldo cuti (untuk permohonan cuti).\n2.Sesuai dengan  PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan  (untuk\ncuti) dan  PKP-IRL-IRL-E02 Istirahat Mingguan  (untuk libur), dan tidak\nmengganggu operasional store.\n3.Terdapat alokasi libur pada hari yang diajukan oleh petugas (tidak\nmemerlukan tenaga full team (FT).\n4.Tidak ada kepentingan petugas lain yang lebih mendesak.Maksimal\ntgl. 10\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 3 / 4\nDilakukan olehKegiatanWaktu\n4.2Jika cuti dan libur yang diajukan sesuai dengan kebijakan yang berlaku dan\ndisetujui, maka tandatangani FPIP.\nJika tidak, informasikan ke pemohon bahwa cuti atau libur tidak disetujui.\n4.3Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor, untuk dipertimbangkan.\nStore Supervisor5.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Section Head:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti dan\nlibur:\na.Jika tidak setuju, informasikan ke Section Head untuk diteruskan ke\npemohon bahwa pengajuan cuti atau libur tidak disetujui.\nb.Jika disetujui, menandatangani FPIP dan menyerahkan FPIP dan\nbukti/ surat pendukung (jika ada) kepada Store Manager/ Asst..\nStore Manager/ Asst.6.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Supervisor:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti, dengan\nmenandatangani FPIP jika setuju.\n6.2Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor.\nStore Supervisor7.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Manager/\nAsst.:\n1.Menginformasikan ke Section Head untuk diteruskan ke pemohon,\ncuti atau libur disetujui atau tidak.\n2.Simpan FPIP dan bukti/ surat pendukung (jika ada) pada tempat yang\ntelah ditentukan,  untuk  digunakan sebagai  dokumen  penunjang  saat\npembuatan Jadwal Kerja Bulanan (JKB).\n3.Menyimpan atau mengirimkan FPIP dan bukti/ surat pendukung (jika\nada):\na.FPIP   untuk   pengajuan   libur   berurutan,   disimpan   di  store  dan\ndimusnahkan 1 tahun setelah FPIP dibuat.\nb.FPIP permohonan cuti dan libur (selain libur berurutan) yang telah\ndijadwalkan pada Jadwal Kerja Bulanan (JKB), disimpan di store dan\ndimusnahkan 1 bulan setelah JKB digunakan.\nc.FPIP dan bukti/ surat pendukung permohonan C2 yang direncanakan,\nC3, C4, C5, dan petugas yang tidak melaksanakan  shift  pendek P\ndikirimkan ke Departemen Personalia setelah pembuatan JKB selesai\n(setiap tanggal 25).\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 4 / 4\n7.KONDISI KHUSUS\nUntuk kebutuhan operasional store oleh Store Supervisor/ Asst. Store Manager/ Store Manager, cuti tahunan dapat:\n1.Diberikan kepada pekerja tanpa adanya pengajuan cuti oleh pekerja.\n2.Dibatalkan atau digeser ke hari lain, jika operasional kekurangan tenaga.\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2'),
('1903181114109063798', 'SOP-IRL-SCH-1.1_Pengajuan_Cuti_dan_Libur5', 'application/msword', 0, 'doc', 'SOP-IRLSCH_Pengajuan_Cuti_dan_Libur', 'application/vnd.visio', 1, 'vsd', 'Pengajuan_Cuti_dan_Libur2', 'application/pdf', 1, 'pdf', 'UAT_Sign-Off_Phase_1.pdf', 'application/pdf', 'Prosedur: \nPengajuan Cuti dan LiburHal.: 1 / 4\nSifat: ConfidentialTgl.: 1 Juni 2018Ver.: 1.0No.: SOP-IRL-SCH-1.1\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATINidia\nBPI SupervisorHarsono Subroto\nArea ManagerBudi Purnama\nGM Operations\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nIndustrial RelationHanggulan Kiting\nHKM Asst. ManagerTeddy Sutanto\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.............................................................................................................................................................................2\n2.RUANG LINGKUP.............................................................................................................................................................2\n3.DEFINISI............................................................................................................................................................................2\n4.REFERENSI......................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...........................................................................................................................2\n7.KONDISI KHUSUS............................................................................................................................................................4\n8.LAMPIRAN........................................................................................................................................................................4\n1.TUJUAN\nUntuk mengendalikan dan memonitor aktivitas permohonan cuti dan libur yang diajukan oleh pekerja Bakmi GM.\n2.RUANG LINGKUP\n1)Store Operations\n2)Departemen Personalia\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 2 / 4\n3.DEFINISI\n1)C2 adalah ijin meninggalkan pekerjaan dengan tetap mendapat upah.\n2)C3 adalah cuti hamil dan melahirkan/ keguguran.\n3)C4 adalah ijin meninggalkan pekerjaan diluar tanggungan perusahaan.\n4)C5 adalah cuti melaksanakan Ibadah Haji.\n5)C6 adalah cuti haid.\n6)Hari kerja terpendek tidak lembur (kode shift P) adalah hari kerja terpendek yang jumlah jam kerjanya 5 Jam. Jam\nkerja ini dapat berlaku pada shift pagi, tengah, ataupun sore. Banyaknya jumlah hari kerja terpendek tidak lembur\nper bulan = maksimal 2 hari.\n4.REFERENSI\n1)PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan\n2)PKP-IRL-IRL-E02 Istirahat Mingguan (L1)\n5.DOKUMEN PENUNJANG\n1)Laporan Saldo Cuti\n2)Form Permohonan Ijin & Pemberitahuan (FPIP)\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPersonalia1.1Mengirimkan Laporan Saldo Cuti Pekerja ke masing store dan departemen.Maksimal\ntgl. 10\nbulan\nberjalanStore Supervisor2.1Menerima Laporan Saldo Cuti dari Personalia, dan menyimpannya pada\ntempat yang telah ditentukan.\nPemohon3.1Mengajukan permohonan cuti dan libur kepada atasan langsung (Section\nHead) dengan:\n1.Mengisi Form Permohonan Ijin & Pemberitahuan (FPIP).\n2.Melampirkan bukti/ surat pendukung kuat lainnya yang menerangkan\nalasan cuti atau libur (bila diperlukan).\nCatatan:\nUntuk cuti dan libur yang sudah direncanakan, permohonan diajukan minimal\n1 bulan di muka atau paling lambat tanggal 10 pada bulan berjalan.\n3.2Meminta persetujuan  Section Head, dengan menyerahkan FPIP dan bukti/\nsurat pendukung (jika ada).\nSection Head4.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari pemohon, periksa\nkesesuaian permohonan cuti dan libur pekerja:\n1.Pemohon memiliki saldo cuti (untuk permohonan cuti).\n2.Sesuai dengan  PKP-IRL-IRL-E03 Istirahat (Cuti) Tahunan  (untuk\ncuti) dan  PKP-IRL-IRL-E02 Istirahat Mingguan  (untuk libur), dan tidak\nmengganggu operasional store.\n3.Terdapat alokasi libur pada hari yang diajukan oleh petugas (tidak\nmemerlukan tenaga full team (FT).\n4.Tidak ada kepentingan petugas lain yang lebih mendesak.Maksimal\ntgl. 10\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 3 / 4\nDilakukan olehKegiatanWaktu\n4.2Jika cuti dan libur yang diajukan sesuai dengan kebijakan yang berlaku dan\ndisetujui, maka tandatangani FPIP.\nJika tidak, informasikan ke pemohon bahwa cuti atau libur tidak disetujui.\n4.3Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor, untuk dipertimbangkan.\nStore Supervisor5.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Section Head:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti dan\nlibur:\na.Jika tidak setuju, informasikan ke Section Head untuk diteruskan ke\npemohon bahwa pengajuan cuti atau libur tidak disetujui.\nb.Jika disetujui, menandatangani FPIP dan menyerahkan FPIP dan\nbukti/ surat pendukung (jika ada) kepada Store Manager/ Asst..\nStore Manager/ Asst.6.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Supervisor:\n1.Memeriksa dan mempertimbangkan pengajuan cuti dan libur yang\ndiajukan oleh pemohon sesuai dengan kebijakan yang berlaku dan tidak\nmengganggu kelancaran operasional store.\n2.Memberikan keputusan setuju atau tidak atas pengajuan cuti, dengan\nmenandatangani FPIP jika setuju.\n6.2Menyerahkan FPIP dan bukti/ surat pendukung (jika ada) kepada  Store\nSupervisor.\nStore Supervisor7.1Menerima FPIP dan bukti/ surat pendukung (jika ada) dari Store Manager/\nAsst.:\n1.Menginformasikan ke Section Head untuk diteruskan ke pemohon,\ncuti atau libur disetujui atau tidak.\n2.Simpan FPIP dan bukti/ surat pendukung (jika ada) pada tempat yang\ntelah ditentukan,  untuk  digunakan sebagai  dokumen  penunjang  saat\npembuatan Jadwal Kerja Bulanan (JKB).\n3.Menyimpan atau mengirimkan FPIP dan bukti/ surat pendukung (jika\nada):\na.FPIP   untuk   pengajuan   libur   berurutan,   disimpan   di  store  dan\ndimusnahkan 1 tahun setelah FPIP dibuat.\nb.FPIP permohonan cuti dan libur (selain libur berurutan) yang telah\ndijadwalkan pada Jadwal Kerja Bulanan (JKB), disimpan di store dan\ndimusnahkan 1 bulan setelah JKB digunakan.\nc.FPIP dan bukti/ surat pendukung permohonan C2 yang direncanakan,\nC3, C4, C5, dan petugas yang tidak melaksanakan  shift  pendek P\ndikirimkan ke Departemen Personalia setelah pembuatan JKB selesai\n(setiap tanggal 25).\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengajuan Cuti dan LiburNo.: SOP-IRL-SCH-1.1Ver.: 1.0 \nTgl.: 1 Juni 2018Hal.: 4 / 4\n7.KONDISI KHUSUS\nUntuk kebutuhan operasional store oleh Store Supervisor/ Asst. Store Manager/ Store Manager, cuti tahunan dapat:\n1.Diberikan kepada pekerja tanpa adanya pengajuan cuti oleh pekerja.\n2.Dibatalkan atau digeser ke hari lain, jika operasional kekurangan tenaga.\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2'),
('1903181146524339961', 'SOP-ITY-SS-1_Masalah_CCTV', 'application/pdf', 1, 'pdf', 'SOP-ITY-SS-1.5_SOP_Penanganan_Masalah_CCTV_FP1', 'application/vnd.visio', 0, 'vsd', 'File_Not_Found', '-', 0, '-', 'SOP-ITY-SS-1_Persetujuan_Masalah_CCTV.pdf', 'application/pdf', 'Prosedur :        \nPenanganan Masalah CCTVHal.: 1 / 3\nSifat: Classified Tgl.: 6 Mei 2015 Ver.: 1.0\nNo.: SOP-ITY-S&S-1.5\nDibuat oleh: Ditinjau oleh: Disetujui oleh:\nPT. GRIYA MIESEJATI\nNidia\nSys.Dev.Asc.Hendri WijayaIT ManagerAnthony PamungkasGM FAST\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujui\nOperationsBudi Purnama\nTanggal Efektif :                                                   \nNo. Copy Dokumen :                                                                  \nDistribusi ke :                                                   \n        \nDAFTAR ISI\n1. TUJUAN...............................................................................................................................................................................2\n2. RUANG LINGKUP...............................................................................................................................................................2\n3. DEFINISI..............................................................................................................................................................................2\n4. REFERENSI.........................................................................................................................................................................2\n5. DOKUMEN PENUNJANG....................................................................................................................................................2\n6. PROSEDUR DAN TANGGUNG JAWAB.............................................................................................................................2\n7. KONDISI KHUSUS / INFORMASI KHUSUS.......................................................................................................................3\n8. LAMPIRAN...........................................................................................................................................................................3\nFRM-SYS-GDM-3.2.1 Ver.1.1\n\nProsedur: \nPenanganan Masalah CCTV\nNo.: SOP-ITY-S&S-1.5 Ver.: 1.0\nTgl.: 6 Mei 2015 Hal.:2 / 3\n1. TUJUAN\nMemberikan acuan terkait proses dukungan dan layanan teknologi informasi, baik untuk perangkat lunak maupun keras\ndi Store.\n2. RUANG LINGKUP\nStore Operations \n3. DEFINISI\n1) CCTV : Closed Circuit Television\n2) DVR : Digital Video Recorder\n3) PC : Personal Computer\n4. REFERENSI \n-\n5. DOKUMEN PENUNJANG \n-\n6. PROSEDUR DAN TANGGUNG JAWAB \nDilakukan olehKegiatan\nIT Helpdesk 1.1 Melaporkan masalah CCTV.\nIT Support 2.1 Penanganan masalah tidak bisa playback :\n1) Remote PC Office.\n2) Cek konfigurasi aplikasi CCTV.\n3) Cek waktu video yang akan di-playback.\n4) Jika file tidak tersedia, informasikan ke User  file video tertimpa file baru.\n5) Jika file tersedia, informasikan ke User harddisk rusak, dan melaporkan masalah ke\nVendor.\n2.2 Penanganan masalah tidak bisa atau lambat saat membuka aplikasi DVR:\n1) Remote PC Office.\n2) Cek versi browser.\n3) Cek Active-X Windows .\n4) Lakukan test ping ke IP DVR.\n5) Jika tidak berhasil, melaporkan masalah ke Vendor.\n2.3 Penanganan masalah tidak bisa merekam video:\n1) Remote PC Office.\n2) Test playback dari DVR\n3) Jika tidak berhasil, melaporkan masalah ke Vendor.\n2.4 Penanganan masalah kamera tidak berfungsi/ mati:\n1) Minta Store test kamera dan adaptor.\n2) Jika berhasil, minta Store mengganti kabel coaxial dengan yang baru.\nFRM-SYS-GDM-3.2.1 Ver.1.1\n\nProsedur: \nPenanganan Masalah CCTV\nNo.: SOP-ITY-S&S-1.5 Ver.: 1.0\nTgl.: 6 Mei 2015 Hal.:3 / 3\nDilakukan olehKegiatan\n3) Jika tidak berhasil, minta Store untuk test adaptor.\n4) Jika berhasil, minta Store mengganti adaptor dengan yang baru.\n5) Jika tidak berhasil, melaporkan masalah ke Vendor.\n7. KONDISI KHUSUS / INFORMASI KHUSUS\n-\n8. LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.1\n'),
('1903181330113183895', 'ApprovalPages2', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'tb_docstructtipe2', 'application/vnd.ms-excel', 0, 'xls', 'File_Not_Found', '-', 0, '-', 'UAT_Sign-Off_Phase_11.pdf', 'application/pdf', '<Enhancement new eDocument>\nHalaman Persetujuan\nNama & JabatanTanda\nTanganTanggal\nDisusun oleh\nTeddy Sutanto\n(Ass. HKM Manager)\nAditya Wardiman\n(Ass. HR Support Manager)\nDireview olehCynthia .F\n(General Manager HR)\nThomas Aditya \n(BPI Manager)\nAnthony .P\n(General Manager FAST)\n Disetujui olehTammy .T\n(Direktur)\nCitra .H\n(Corporate Planning \nManager)'),
('1903181519084810445', 'ApprovalPages3', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'M_LibraryDatabase', 'text/plain', 0, 'txt', 'File_Not_Found', '-', 0, '-', 'UAT_Sign-Off_Phase_12.pdf', 'application/pdf', '<Enhancement new eDocument>\nHalaman Persetujuan\nNama & JabatanTanda\nTanganTanggal\nDisusun oleh\nTeddy Sutanto\n(Ass. HKM Manager)\nAditya Wardiman\n(Ass. HR Support Manager)\nDireview olehCynthia .F\n(General Manager HR)\nThomas Aditya \n(BPI Manager)\nAnthony .P\n(General Manager FAST)\n Disetujui olehTammy .T\n(Direktur)\nCitra .H\n(Corporate Planning \nManager)'),
('1903181716488822119', 'SOP-ITY-SS-1_Penanganan_Masalah_UPS', 'application/pdf', 1, 'pdf', 'SOP-ITY-SS-1.6_SOP_Penanganan_Masalah_UPS', 'application/vnd.visio', 0, 'vsd', 'File_Not_Found', '-', 0, '-', 'SOP-ITY-SS-1_Persetujuan_UPS.pdf', 'application/pdf', 'Prosedur :        \nPenanganan Masalah UPSHal.: 1 / 2\nSifat: Classified Tgl.: 6 Mei 2015 Ver.: 1.0\nNo.: SOP-ITY-S&S-1.6\nDibuat oleh: Ditinjau oleh: Disetujui oleh:\nPT. GRIYA MIESEJATI\nNidia\nSys.Dev.Asc.Hendri WijayaIT ManagerAnthony PamungkasGM FAST\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujui\nOperationsBudi Purnama\nTanggal Efektif :                                                   \nNo. Copy Dokumen :                                                                  \nDistribusi ke :                                                   \n        \nDAFTAR ISI\n1. TUJUAN...............................................................................................................................................................................2\n2. RUANG LINGKUP...............................................................................................................................................................2\n3. DEFINISI..............................................................................................................................................................................2\n4. REFERENSI.........................................................................................................................................................................2\n5. DOKUMEN PENUNJANG....................................................................................................................................................2\n6. PROSEDUR DAN TANGGUNG JAWAB.............................................................................................................................2\n7. KONDISI KHUSUS / INFORMASI KHUSUS.......................................................................................................................2\n8. LAMPIRAN...........................................................................................................................................................................2\nFRM-SYS-GDM-3.2.1 Ver.1.1\n\nProsedur: \nPenanganan Masalah UPS\nNo.: SOP-ITY-S&S-1.6 Ver.: 1.0\nTgl.: 6 Mei 2015 Hal.:2 / 2\n1. TUJUAN\nMemberikan acuan terkait proses dukungan dan layanan teknologi informasi, baik untuk perangkat lunak maupun keras\ndi Store.\n2. RUANG LINGKUP\nStore Operations \n3. DEFINISI\nUPS : Uninterruptible Power Supply\n4. REFERENSI \n-\n5. DOKUMEN PENUNJANG \n-\n6. PROSEDUR DAN TANGGUNG JAWAB \nDilakukan olehKegiatan\nIT Helpdesk 1.1 Melaporkan masalah UPS.\nIT Support 2.1 Penanganan masalah tidak bisa backup listrik:\n1) Minta Store mencabut kabel input listrik ke UPS.\n2) Jika tidak mati, menginformasikan tidak terdapat masalah pada UPS.\n3) Jika mati, melaporkan masalah ke Vendor.\n2.2 Penanganan masalah UPS mati total:\n1) Minta Store menghubungkan perangkat IT ke listrik PLN.\n2) Melaporkan masalah ke Vendor.\nVendor 3.1 Melakukan pengecekan dan on-site troubleshooting.\n7. KONDISI KHUSUS / INFORMASI KHUSUS\n-\n8. LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.1\n'),
('1903191332319102698', 'Moodle_Setup', 'application/msword', 1, 'doc', 'Kirkpatrick_new_world_model', 'image/png', 1, 'png', 'tb_docstructtipe3', 'application/vnd.ms-excel', 1, 'xls', 'BAST_UAT_Phase_111.pdf', 'application/pdf', 'https://www.youtube.com/watch?v=KH2BvLG22W0\nhttps://www.youtube.com/watch?v=nEYAWU5fQOs\nhttps://www.youtube.com/watch?v=8o3kmLHAEMg\nhttps://moodle.org/mod/forum/discuss.php?d=345493\nhttps://www.ispringsolutions.com/ppt-to-scorm#pricing\nhttps://docs.moodle.org/35/en/Creating_SCORM_Content\n1.Update Kuota Upload File di moodle\nPath : etc\\php\\7.0\\php.ini\n2.Update Session TImeOut\nPath : var/www/html/moodle/conifig.php\n3.Login to Moodle\nMoodle\nhttp://192.168.10.22/moodle/?redirect=0\nuser : admin\npass : !Bakmigm77\nuser :chandra\npass:Welcome!2\nUsernamePasswordRole\nChandraWelcome!2\nFajar EgitGanteng!1Student\nWilsonWelcome!1Student\nTeddyWelcome!1\n4.Upload Users\n5.Create Teachers\na.Site administration | Users |Permissions |Deifine roles\nb.\n6.How to Create Courses\n7.How to Import Courses\n8.\n9.Setting Users\n10.'),
('1903201006299867884', '028_Meeting_KM_-_15_08_18', 'application/msword', 1, 'doc', 'tb_docstructtipe4', 'application/vnd.ms-excel', 0, 'xls', 'File_Not_Found', '-', 0, '-', 'UAT_Sign-Off_Phase_13.pdf', 'application/pdf', 'Notulen RapatSifat: ConfidentialHalaman 1 dari 1\nDibuat Oleh: Adinda Nidya LestariNo.:  028/NTL/GMS.KMS/VIII/18Tanggal: 15.08.2018\nPerihal: Meeting Mingguan KMRapat:\nHadir:\niAditya W\niTeddy SiThomas Aditya\niJohan MiOktriesa \niAdinda Nidya LPemimpin: Aditya Wardiman\nTanggal   : 15.08.2018\nWaktu      : 14.15 - 15.45 WIB\nNo.Aktivitas /\nMasalahKeputusan / Tindak LanjutPJ1No.\n1Manajemen\nDokumen1.Pemberian nomor dokumen tetap ada di BRD, tapi optional dapat di \ntakeout  di FSD.\n2.Dalam SOP, ada penambahan unggah final e-document (dokumen asli \ndan dokumen pelengkap).\n3.Atasan user / pencipta dapat memberi komen (review) di dalam sistem \nuntuk settingan PMD saja & setup departemen akses (pada point 26 di \nBRD).\n4.Tanggal approval pada tanda terima merupakan tanggal pada saat BPI \nmeng-approve.\n5.BPI dapat melakukan publish manual jika GM mengalami kegagalan \nsistem.\n6.Dalam BRD, ada penambahan menu untuk cetak BRD apabila \ndiperlukan oleh admin BPI (penambahan menu ini tidak perlu \ndicantumkan di SOP).\n7.Dalam SOP di sheet ke 3, hak akses ditentukan oleh PMD dipindahkan\nke sheet 1 (dapat melakukan suggestion penambahan Departemen).\n8.Versioning X.Y\nPerubahan X (Mayor) jika terdapat perubahan isi\nPerubahan Y (Minor) jika isi tidak berubah, namun terdapat perubahan \nuntuk merubah tanggal efektif berlaku, masa berlaku, dan akses \ndepartemen.\n9.Dalam SOP, ada penambahan download dokumen untuk versioning\n10.Manajemen audit dapat membuka dokumen-dokumen yang lama \n(dokumen dengan versi yang lama) *TBD  \nOKT & TS\n1 PJ: Penanggung Jawab'),
('1903201207573824411', 'Timeline_Reka', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'Timeline', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'Monitoring_ALarm', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'brosur_tv_samsung.pdf', 'application/pdf', 'MATV\nNoPekerjaan1112131415\nTower 1\nPiping Wiring lt 252\nPasang Outlet lt 20 & 211\nPasang Outlet lt 22 & 23\nPasang Outlet lt 24 & 25\nPasang Tap/Spliter /Grouping lt 212\nPasang Tap/Spliter /Grouping lt 22\nPasang Tap/Spliter /Grouping lt 23\nPasang Tap/Spliter /Grouping lt 24\nPasang Tap/Spliter /Grouping lt 25\nPasang Boster lt 9, 15, 19, 25\nFinishing1\nTower 2\nPasang Outlet lt 17 & 181\nPasang Outlet lt 19 & 20\nPasang Outlet lt 21 & 22\nPasang Outlet lt 23 & 24\nPasang Outlet lt 25\nPasang Tap/Spliter /Grouping lt 172\nPasang Tap/Spliter /Grouping lt 18\nPasang Tap/Spliter /Grouping lt 19\nPasang Tap/Spliter /Grouping lt 20\nPasang Tap/Spliter /Grouping lt 21\nPasang Tap/Spliter /Grouping lt 22\nPasang Tap/Spliter /Grouping lt 23\nPasang Tap/Spliter /Grouping lt 24\nPasang Tap/Spliter /Grouping lt 25\nPasang Boster lt 9, 15, 19, 25\nFinishing1\nTower 3\nPasang Outlet lt 17 & 181\nPasang Outlet lt 19 & 20\nPasang Outlet lt 21 & 22\nPasang Outlet lt 23 & 24\nPasang Outlet lt 25\nPasang Tap/Spliter /Grouping lt 182\nPasang Tap/Spliter /Grouping lt 19\nPasang Tap/Spliter /Grouping lt 20\nPasang Tap/Spliter /Grouping lt 21\nPasang Tap/Spliter /Grouping lt 22\nPasang Tap/Spliter /Grouping lt 23\nPasang Tap/Spliter /Grouping lt 24\nPasang Tap/Spliter /Grouping lt 25\nPasang Boster lt 9, 15, 19, 25\nFinishing1\nTotal Pekerja\n16171819202122232425Pekerja\nTower 1\n6\nTower 2\n4\nTower 3\n4\n4\nTotal Pekerja14\nFire Alarm\nNoPekerjaan111213141516171819\nTower 1\nPiping + wiring lt 216\npiping + wiring lt 226\npiping + wiring lt 236\npiping + wiring lt 246\npiping + wiring lt 256\nwiring lt 164\nwiring lt 174\nwiring lt 184\nwiring lt 194\nwiring lt 204\nPasang Detector 163\nPasang Detector 173\nPasang Detector 183\nPasang Detector 193\nPasang Detector 203\nPasang Detector 213\nPasang Detector 223\nPasang Detector 233\nPasang Detector 243\nPasang Detector 25\nFinishing11111111\nTower 2\nPiping lt 186\nPiping lt 196\nPiping lt 206\nPiping lt 216\nPiping lt 226\nPiping lt 23\nPiping lt 24\nPiping lt 25\nwiring lt 186\nwiring lt 1910\nwiring lt 2010\nwiring lt 2110\nwiring lt 2210\nwiring lt 23\nwiring lt 24\nwiring lt 25\nPasang Detector 186\nPasang Detector 1910\nPasang Detector 2010\nPasang Detector 2110\nPasang Detector 2210\nPasang Detector 23\nPasang Detector 24\nPasang Detector 25\nFinishing111111111\nTower 3\nPiping + wiring lt 206\nPiping + wiring lt 216\nPiping + wiring lt 226\nPiping + wiring lt 236\nPiping + wiring lt 246\nPiping + wiring lt 25\nPasang Detector 163\nPasang Detector 175\nPasang Detector 183\nPasang Detector 193\nPasang Detector 203\nPasang Detector 21\nPasang Detector 22\nPasang Detector 23\nPasang Detector 24\nPasang Detector 25\nFinishing1\nTotal\n202122232425Pekerja\nTower 1\n13\n3\n11111\nTower 2\n186\n6\n6\n10\n10\n10\n18\n10\n10\n10\n111111\nTower 3\n96\n3\n3\n3\n3\n3\nTotal22'),
('1903201404014149976', 'Pengajuan_Cuti_dan_Libur3', 'application/pdf', 1, 'pdf', 'Timeline2', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'Timeline3', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'TV_SAMSUNG_SAMSUNG_32N4003_(1).pdf', 'application/pdf', '\n \nProsedur:  \nPengajuan Cuti dan Libur \n \nHal.: 1 / 4 \nSifat: Confidential  Tgl.: 1 Juni 2018  Ver.: 1.0  No.: SOP-IRL-SCH-1.1 \nDibuat oleh: \n \n\n \n\n \n\n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Nidia \nBPI Supervisor Harsono Subroto\n \nArea Manager Budi Purnama \nGM Operations \n \nFRM-SYS-GDM-3.2.1 Ver.1.2 \nDiterapkan dan Disetujui oleh: \nDepartemen  Disetujui  Tanda Tangan \n \nIndustrial Relation Hanggulan Kiting    \nHKM Asst. Manager Teddy Sutanto    \n \nTanggal Efektif  :                                                    \nNo. Copy Dokumen  :                                                    \nDistribusi ke  :                                                    \n \nDAFTAR ISI \n1.  TUJUAN ........................................................................................................................................................................... 2 \n2.  RUANG LINGKUP ............................................................................................................................................................ 2 \n3.  DEFINISI .......................................................................................................................................................................... 2 \n4.  REFERENSI ..................................................................................................................................................................... 2 \n5.  DOKUMEN PENUNJANG ................................................................................................................................................ 2 \n6.  PROSEDUR DAN TANGGUNG JAWAB ......................................................................................................................... 2 \n7.  KONDISI KHUSUS ........................................................................................................................................................... 4 \n8.  LAMPIRAN ....................................................................................................................................................................... 4 \n \n\n \n\n \n\n \n\n \n\n  \n \n\n \n\n \n\n \n\n \n\n \n\n  \n \n\n \n\n \n\n \n\n  ');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903201623487739413', '33Manual_Sistem_Penilaian_Kinerja_Berbasis_Kompetensi_KP-CPP', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'Persetujuan_Manual_Sistem_Penilaian_Kinerja_Berbasis_Kompetensi_KP-CPP_-_Copy.pdf', 'application/pdf', '\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi KP-CPPN 	\n\n\r 	\n \r  \Z !"\n #$\r\Z%\n\n\n\n\n\n\n\n \r&\'$\Z% (\r$\'$\Z%\nPT. GRIYA MIESEJATI )%(&\r$(*&+,\n\r		\n),&\r%-&&\n	\n		\n, &\n\n \n.\n/\n0 "\n \r1&+& (\r$\'$\Z%\nDivisi  Disetujui  Tanda Tangan \n\Z\n&22,&$2%+\'  \n\Z%&\r\Z3($  \n*\n *&\r%\Z&,2$&(   \n	),&\r%-&&  \n 	3$+$&2  \n\n!*&\r\Z&$( &+\',  \n\n&4\r \Z52#"\n\Z ! \Z$2& \n\n (\r#$( \n\n\nDAFTAR ISI \n 676*"\n" .6*08096"\n!  488\n8"\n .44.4\n8"\n:  964467*0"\n; .\n4 6. **00607*<*3"\n; \Z+&&"\n;" *(1&&3#((9\Z21\r&("\n;"*(19\Z21\r&("\n;""*(1	\n	 	+&\r9\'!\n;"!*(19+(1&&!\n;! 9\r&\r$&\n(\r2&&9&\'3#((9\Z21\r&(\n;!"\Z\n9\Z21\r&(\n;!"*(19\Z21\r&(\n;!!*(1	\n	 	+&\r9\'\n;!*(19+(1&&\n;!:&+&/& &;\n; 9\r$9,=&;\n;: 6($&#&+&&2#&&;\n 9 8\n89 6\n6\n;\n	 *8.*\n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  "	\n\n.\n/\n0 !""\n \n1. TUJUAN \n \n#$%1\Z((2&\'2&$&\r$22(\r&\'22\Z$(&1\'&21+1&-1&((&\n\Z&((\n" $1& #& + ((\r2 1&\Z& ($2# +, 2&$( +2 2&-&&> 2(&&> +&\n2&5$(&\'+\'\n! &+$$&1&-1&((&\Z&((2$1&-1&&\'+\'\n\n2. RUANG LINGKUP  ($$%+1\r2&,&#++9+&)\r\n \n3. DEFINISI \n! &&&\'++&(&(#($\r$1\Z(+$,&2&-$11&\r1&(\r&+\'>1&&1(\r(\n\'+1\'(-&,\r+#&+&&+&&(\r&+,&\r%+\r\r1&>+&12#&$21&#\n1+ 1\' +&& \r$\'$& $&\r$ 22\Z\r5( 1\'  221\r%&& #%& 2&&\r& 1(\r(\n\'&,\n!" &&&\'##((\Z21\r&(+%1&&&\'+&&2&$&&\Z21\r&((#(%(\r$\n\r$$&,>(&\r\r\r$((&\'+&+(1&&\n!! 9\Z21\r&( 2$1& #$&& + \r21&> 1&\r%$&> +& (1 ,& +\r$&\'$& \' +2\n2(&&1\'&&,\n \n4. REFERENSI  \n \n5. DOKUMEN PENUNJANG \n:  \r92$(&&9\Z21\r&(0&\n:"  \r92$(9\Z21\r&($&(\Z&\n:! \Z9\Z21\r&(\n: \n\r$\r$&((\n \n6. PROSEDUR DAN TANGGUNG JAWAB \n6.1. Periode Penilaian \n? \Z+1&&#$&(21+&&\r\Z#+&#$&\Z52#(21+&&*1$&\r$\n\Z\n\n\n\r*+2&(\r(>\r$(@ #?>+&91\n(\n"? \Z+1&&#$&7&$(21+&&7$&+&#$&7$(21+&& (2#$&\r$\n\Z\n\n\r\n\n1((>*((\r&\Z>\Z>*((\r&		>		>		>+&			\n \n6.2. Aspek Penilaian Berbasis Kompetensi \n6.2.1. Aspek Kompetensi \n*(1\Z21\r&(\r++\Z21\r&(&+&\Z21\r&($&(\Z&\n1) Kompetensi Generik \n9\Z21\r&(&+%&2\Z21\r&(,&%$(+2(2$\'320+2&(\r1\n\Z21\r&(\r++2\n\Z\n%\r  ! \r92$(&&9\Z21\r&(0&\n\n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  !	\n\n.\n/\n0 !""\n2) Kompetensi Fungsional 9\Z21\r&( $&(\Z& \r$ #( +(#$\r \Z21\r&( \r&( +#$\r $&\r$ 22#&\r$ \'  +1\r\n2$&1\'&&,+&&#>(%&\Z21\r&($&(\Z&+1\r##++(\r$1\'&\n1\'&&9\Z21\r&($&(\Z&\r+++$\'&(,\r$$	+&\n%\r \r92$(9\Z21\r&($&(\Z&(($+1\r2& \n\n6.2.2. Aspek o.:. ML-NPMFDL1.D- dan Target Kerja \n	\n	  	@3\n)? +% ($\r$ \Z&(1 $&\r$ 2&$$ 1% \r5\r(\r5\r( \Z1(\Z& ($\r$\n1$(%&+2(,&#%-(\'&+&&\r$\'$&\Z&(($\'$&+3\n)&\r&$&\r$\n2&,(&5(+&(\r\r\Z&((>2&&\r&\Z2$&(&\r&+&(\r&>(\r22&\r$&\'\n\Z&((\r%+1((&(\r\r(&,\n3\n),&+2\'2$1&\r$$&&+3\n)\Z&((\n&$$&&\'+(13\n)\r++21\r1(1\r>,\r$\n1) Aspek Keuangan  \n 6$& (1 $&& \Z&(( \r+ + 1&&\r& 5\Z$2 1&\'$&> 1&$$&& #, +&\n1&&\r&1\Z+$\r5\r(>\Z1\r2((1&$&&(\r>(\r&5(\r(\n2) Aspek Pelanggan \n 6$&(11&&\r++1&&\r&1$(&1&&>1&&\r&1,&&>+&%	\n	#	\n3) Aspek Proses Internal \n 6$&(11\Z((&\r&\r++1&&\r&\r5\r(+&(&(\Z1(\Z&+($$%\Z&((\n+&&&\Z5(1\Z((1\Z((>212&\r(&\r1(\Z&,&\r+&(&+(\r11\Z((#(&(\n4) Aspek Pertumbuhan dan Pembelajaran \n 6$& (1 1\r$2#$%& +& 12#\'& \r++ 1&&\r& \Z21\r&( \'> +& \r&(\n\'\n\r9\'+%($\r$\Z&+(,&%$(+-1+&+5+$\r$$&\r\'@\Z\r?+21\Z+=\r$\n\r\r&\r$6$&1&-1&\r\r\'+1\r#$1$$&$&\r\r(>$\r(>+&=\r$1&-1&\n \n6.2.3. Aspek Kedisiplinan \n9+(1&& +% ($\r$ \Z&+( ,& \r-1\r +& \r#&\r$ 2$ 1\Z(( + (&& 1$ ,&\n2&$&\'$&&&\r\r&>1\r$%&>(\r&>\r\r$&>+&\r\r#&*(1+(1&&\r++\n1) Sakit \',&\r+2($#\'&(\r\r$(&&>&2$&\r%22#\r%$&1+\r(&\n&($&,&#\r$(>(1+%\r$\'$>+&22#&\n$\r9\r&&\r$#$\r1&+$$&\n&1&2#\r%!@\r?(\'%1\r2\r+%+&&,\n2) Mangkir \n*+%\r+%+&\r&1\r&&\r\r$(,&+1\r+\r2\Z%1$(%&\n3) Keterlambatan 9\r2#\r&,&+$$+21&&&\'+%($\r$\Z&+(+2&\'\r+2$&\n1\Z(+$+2&(\r(%+&@12&+&(+\'\r$2&(\Z2$8&\Z2(*#(&( &?(($\n\'+=\',&\r%+\r\r1&\n4) Sanksi \n&(,&+$$+21&&&\'+%\'$2%\n$\r$&>+&\n$\r&\r&,&+\r2\n\Z%\'+21\Z+1&&\n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  	\n\n.\n/\n0 !""\n6.3. Ketentuan Sistem Penilaian Kinerja Berbasis Kompetensi \n6.3.1. 3L2L: Kompetensi  \n"\Z\n \Z21\r&( +\r& (# \r&\r& (\r&+ \Z21\r&( \' 1+ 2(&2(& 1\Z((\'#\r&\n\n2&\r&1\Z((\'#\r&\'>2(2&$(-$1&(\r&+\Z21\r&(&,%\r\Z9\Z21\r&(\n(($ 1\r2&\n3$\r1&+$&\r$1\Z$2$2\n\Z\n\Z21\r&(,&+1+(\r1\r&\r&\'#\r&\n\n? "\Z\n:	\n		\n#? "\Z\n*((\r&		>		\n-? "\Z\n!\n\r\n1((>*((\r&\Z>\Z\n+? "\Z\n"91\n(\n? "\Z\n\n\r*+2&(\r(>\r$(@ #?\n\n6.3.2. Aspek Kompetensi \n*(1\Z21\r&(+5(+&+5+(di awal +&akhir1\Z+1&&+(=1&&>#\r$\'$&\n$&\r$2&\r%$(($&&\r\Z21\r&(\'+&\Z21\r&(\'#\r&>(%&+1$&=\r$\n$&\r$1#&\'+\r+(($&&\r\Z21\r&(\'+&&\Z21\r&(\'#\r&+(+%\n1\Z+1&&#\r$\'$&$&\r$2&\r%$1&-1&\Z21\r&(\'>+&(&\'$\r&,+$&&+2\n1&&&\'\n+1\r+$-+22$&&&9\Z21\r&(>,\r$\n? &&#$&+&\',&+&2&,1\r\'+=5(\Z21\r&(\n#? && \r$\r$1 & 2$& \Z#(5( 1+ (\r \' ,& +& (+& 2$&\n1\'&&,>(%&\',&+&\r+2&\r%$\'(+&+&\n1) Kompetensi Generik   9\Z21\r&(&+&\Z%*\r(&&($&+&*\r(&+&($&+&&22#&+&&&\r\n1$,&+\r$&\'$&\Z%1\'+&&92$(&&9\Z21\r&(0&\n2) Kompetensi Fungsional 9\Z21\r&($&(\Z&+5+(\Z%*\r(&&($&2$+&+5(\Z%*\r(&+&($&\n+&&22#&+&&&\r1$,&+\r$&\'$&\Z%1\'+&&92$(9\Z21\r&($&(\Z&\n9)2(&2(&+1\r2&\n \n6.3.3. Aspek o.:. ML-NPMFDL1.D- dan Target Kerja\n \n1) o.:. ML-NPMFDL1.D- \n	\n		1+1&&&\'%&,$&\r$\n\Z\n*((\r&\Z\r( &#+(&\n1\Z((1\Z\r#$&&(21\Z+1&&>+&+$2$((\r+5+(\Z%	\n		\n2(&2(&+5(+%1\Z+1&&\n2) Target Kerja  \n\r9\'1+1&&&\'%&,$&\r$\n\Z\n #>91\n(>(\r\n\r*+2&(\r(\r\n9\'+2(&2(&+1\r2&2$1&\r\r\'&+5+$,&+\r&\r$&\Z%&)\Z&\r\Z%\n7$2%\',&#%(+$\r@\n\r.$\r2&?>9\r1\r&=\r$1\Z& \r1\Z2\Z(@\n\r ?>\n&2&3&\n\r\Z\r1\r9$\r(>+&9$&\r\r(@\n\r<%\Z$(?\n\n6.3.4. Aspek Kedisiplinan\n \n \r 1+ *(1 9+(1&& ++1\r& &($& +  1\r2& (\Z&> (%& 1& \r+ 1$\n2&(*(19+(1&&+\Z2$&&9&\'\n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  :	\n\n.\n/\n0 !""\n\n1) Sakit Ketentuan Nilai Sakit \nSAKIT\n Nilai \n+1&%(\r(21\Z+1&&*\n%\r+%++(\r#$\r($\r\r&&\n(\r(21\Z+1&&\n3\n"%\r+%++(\r#$\r($\r\r&&\n(\r(21\Z+1&&\n)\n!%\r+%++(\r#$\r($\r\r&&\n(\r(21\Z+1&&\n \n%\r+%++(\r#$\r($\r\r&&\n(\r(21\Z+1&&\n4\n#% +  % \r+ %+ +(\r #$\r\n\r+%+&(21\Z+1&&\n\n \n2) Mangkir Ketentuan Nilai Mangkir \nKeterangan Mangkir\n Nilai \n+1&%2&*\n%2&(21\Z+1&&3\n"%2&\r$#%(21\Z+1&&)\n \n3) Keterlambatan Ketentuan Nilai Keterlambatan \nKeterangan Keterlambatan\n Nilai \n\n$%+\r1\r=\r$*\n(+"\r2#\r+21\Z+1&&3\n!(+;\r2#\r+21\Z+1&&)\n(+"\r2#\r+21\Z+1&& \n#% + !  \r2#\r +2  1\Z+\n1&&\n4\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  ;	\n\n.\n/\n0 !""\n \n4) Sanksi Ketentuan Nilai Sanksi \nKeterangan Sanksi\n Nilai \n+2&+1\r&($\r\r$&*\n&+1\r&($\r\r$&(21\Z+\n1&&\n3\n&+1\r&"($\r\r$&(21\Z+\n1&&\n)\n&+1\r&!($\r\r$&(21\Z+\n1&&\n \n&+1\r&   ($\r 1&\r& (2\n1\Z+1&&\n4\n\n6.3.5. Penilai dan Yang Dinilai & @*\r(& &($&? +% \' ,& 2$& 1&& \r%+1 #=%& &($&> (+&&\n*\r(& & @*\r(& + &($&? +% \' ,& 2$& 1&& \r%+1 #=%& \r+\n&($&\n\n\n6.4. Kartu Karyawan 9\r$9,=&+%\r#&\r$@\n?$&\r$22#&\r$&2&-\r\r##\'+&\r\r&\'1\'>\n##$1\'+&&\r2$1$&1\Z(\r &+2($+&&#%%&\Z+22&&\'\n1\'(2(\r$1\Z+1&&\n\n\n6.5. Usulan Perbaikan dan Pengembangan\n \n ( \Z% 1& $&\r$ #=%&&, ,& 22$& 1\Z2 1#& \r$ 1&2#&& (($ \r$&\r$\r&\n\Z21\r&(&,\n \n7. KONDISI KHUSUS \n\n\n\n\n\n\n\n\n\n\n\n\n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \n\Z !" \n\r  	\n\n.\n/\n0 !""\n8. LAMPIRAN \n8.1 Diagram Alir  \n?  2*&&9&\'3#((9\Z21\r&(9)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nr£×ë[ZZJJJªªªRRR&\'\'ívûýý}__ßÒÒÒøøxjjêññ1?333"?¨¸¸øââ?Ï¶¶6²Ø9ggg+•J\'ÍAE¯×K.?Á`puuõää¤¾¾þööV*•³»»;??Ozyy9???\'\'\'	ae`2™ˆ<==õù|{{{½½½¥¥¥T9??çpuuþ^QQQä5==Ã??µZ]WWGúëë+ükkkÉmooÏÍÍ5F£ñðð011ñéé	]sss×××ýýý ++kccC,ƒ¦R©ärùâââãã#ub€pOÊ?ü©¹ AEÿÎÎlüm.ÿîú	QaEI Q Ó"¼^×u7\'ÍñxoeL&º®ƒï8Îr¹Ä‡cåV"Õï÷ÉÅìËK£`D¸^¯DÃyÇƒÁÈñè\n\'Íâce5úº¿oeîé¤{ë·;Ügx;Ïó?ó;_¿s"÷ûú"€?¢@ÈårÁ`0\'ÍÒûp8Ä÷|>"Õjv»=™Lêõú×ë...?çó	+t%ÈøâÚív...Âh4?ÇãƒA"Õ²;j4?ù|!\nÁWCáPx$Ò?Tk·Û•Jåñx° ?!ùbäív{½^£Ñ("Q´t...ÎûçÙR2B¼¦ò922p¿ßý%áét:YpN§Óé"J%Äd2y½Þ¯¦à‡ý~°"Õj£ÑàìHÈãñ88N*&<²/7nµZFÇC\n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z \n \n \n !"!#\r\n\Z \r	 		 \n$j\n%&\'(&()*+\n \n\n \n\r	 N\n  !" \n % \n \n,\'(- \n .	 \n \n/0\'+!,\' \n12+ \n "  ##  #  \n\r\n	 \n\n\n\n\n\n \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n   \n\n          \n 	\n		\r\n \n\n \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z 3\n \n \n !"!#\r\n \n\n \n" ##  #  \n\r\n	 \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n          \n 	\n		\r\n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z \n \n \n !"!#\r\n$ \n%&\'	(\'\'()\'(*)	+		\n \n\Z  \n\n  !! ! " \n \n  "  # $  ! % &!     \n #   \'() \n,-).........   /0 /1 ......... \n  0	 .........   /1,!......... \n *  \'()  \n?	\n\n\n  \n\r\n  \n		\n  \n			\n \n 	      		   \r		 \n 	\n\n	\Z   \r		      \n\n+C#$   " \n!\r  !  "  #	 \n, \n \n+C#$  ! \'$! !&!&) \n!\r  !  "  #	 \n, \n \n+C#$ $!  ! \'$! $# !&!&) \n!\r  !  "  #	 \n, \n \n*+C\Z  !! \n+C   $ ! \n+-  $ ! & !  \n2\'(34(\'\'(3544(64\'(%4(7\'5(((898989877&\')%&7	(\'\'(\n)%4(7\'#(\'\n\n!+  \r\n	 \n!		 \n\'#		\n	 		) !		 \n\'\n 		)  		 \n?	\Z \n?	 \n\r !"	# \n$\Z \n9%\Z	&	\' \n:% \Z\Z&$	# \n! $$ \n\n \n\n \n \n\n \n\n \n\n  \n \n\n \n\n \n\n 	\n		\r\r \n \n\n  \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z \n \n \n !"!#\r\n \Z  \n \n+.  $ ! !&!\n2\'(34(\'\'(3544(64\'(%4(7\'5(((898989877&\'	(5&(!\'7%\n	(\'\'()\'(*2;7\'7)%4(7\'\n\n!+  \r\n	 !		 \n\'#		\n	 		)  		 \n \n \n \n \n \n \n \n \n \n \n \n \n! $$ \n \n\n\n\n \n \n+C  BALANCED SCORECARD \') $ $& $  "/ \n\n;2!+\'(\'&(&	7\n! \n %  \n$    $0  !		   \'1) \Z          \n\'!		 2 )  	 34 #	5	 \n\n\n\n\n\n \n! $$ \n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n\n 	\n		\r\r \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z \n \n \n !"!#\r\n\n\Z\n\n\n\n;)*\'(\'&(&<?(	\n\n	\n! \n" !  \n$& $  " $0  5	  !  $ \n\Z \'!		 \n2 ) \n     \n     \n     \n     \n     \n ! $$\n/)	\Z		&)*545\'%4\'( \n \n+C   #!! \n!     #!!  !  $  \Z \'!		 2 ) \n !\'  \n (\'  \n\r )%;(  \n !(7\'  \n  ! $$ \n\n*+C!  $  " \Z\n&!  ! $$  $  \Z \'!		 2 ) \n0 0!	,))	,, !-   \n2 0!	,)2!+0 #,), /0   \n+ 0!	,)),-!-	- 0    \n!  $  " \Z \'6 7 6 7 6) \n\n\n\n !  $!  ! \n\n\n  \n \n\n \n\n\r\n 	\n		\r\r \n \n \n \n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \nNo.: MNL-PFM-PMPD-1.3.2  Ver.: 1.0 \nTgl.: 04 Okt "17  Hal.: 1381/ \n \n   FRM-SYS-GDM-3.2.1 Ver.1.2 \n \n36 For)Clnr hiClas Permankas uas Pesge)masgas. \n \nRAHASIA \n \n\n \n \nFORMULIR USULAN PERBAIKAN DAN PENGEMBANGAN \n \n \nPERBAIKAN DAN PENGEMBANGAN \nTClnikas     Urogra)     Uesge)masgas     basg    unUerlCkas    Uekerdap   uesgas    )e)Uertn)masgkas    Ciaya    CstCk   )esjaUan   \nSaiaras8TCdCas uas ,o)Uetesin basg unUerlCkas oley Uekerda basg unsnlan. \nProgra) uaUat merCUa : UesCgaias cjob assignment6p sharing UesgetayCasp Uelatnyasp ull. \n \nLOKASI KERJA : DEPARTEMEN/BAGIAN: SEKSI : \n \nNO  NAMA  NIP PROGRAM PERBAIKAN \nPENGEMBANGAN KOMPETENSI \nTERKAIT KETERANGAN \n \n         \n          \n          \n          \n          \n          \n           \n           \n           \n           \n           \n           \n           \n           \n           \n \nPENILAI ATASAN PENILAI \n   \nTgl: Tgl: \n              1                    FRM-PFM-PMPD-1.3.4  Ver.1.1  \n  \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z \n \n \n !"!#\r\n$ %&\'	&()(&\n*+(,+,-.&\n \n\n \n\r	 N\n\Z \Z \n *  &-) )(,/ ,	\n 0	 1\n 23(&!)( 455+&(&67\n89& 455+&(&!::\n          \n\r\n	 \n ;!+*&+&<&+&<2/&)\'(&=(:()(<+*&(\'&(<))(\n2.+	6\n 1; 3)<(**?2/&&/(&-&)<&5+( 1\n\n\n\n \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n  \n          \n 	\n		\r\n  \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z  \n \n \n!"#"$\r\n% &\'(	\')*)\'\n+,)	\'))\'-)\'.-	&		\n \n\Z  \n\n  !! ! " \n \n  "   # $  ! % &!   \n\'\'	( ) $* \n   \'\'	( ++ \n #   ,-. \n/0-111111111   23 24 111111111 \n?  3	!111111111   24/"111111111 \n /  ,-. \n? Crew / Staff   Ast. Supervisor  Manager  Area Manager \n Section Head   Supervisor   Senior Manager   Gen. Manager \n Staff Specialist   Ast. Manager      \n\n0 #$   " \n!\r  $1\n  ! 234442  " \'\'	( ++  #	 \n5 6423 \n \n0 #$  ! ,$! !&!&. \n!\r 7  ! 284422  " \'\'	( 9  #	 \n5 6428 \n \n0 #$ $!  ! ,$! $# !&!&. \n!\r (\n  ! 2:4426 \n" \'\'	( \n0 \n( #	 \n5 642: \n \n/0 \Z  !! \n0    $ ! \n02  $ ! & !  \n5)\'(6\'))\'(766\'86)\'+6\'*)7\'\'\'9999**,)-+,*	\'))\'\n-+6\'*)$\')\n\n!0  \r\n	 \n!		 \n,#		\n	 		. !		 \n,\n 		.  		 \nConcern For Quality  \nCustomer Service Orientation  \n\rObjective Oriented Teamwork  \nDevelopment  \nPlanning & Organizing  \n:Problem Solving & Decision Making  \n! $$ \n\n \n\n \n \n\n \n\n \n\n  \n \n\n \n\n \n\n!	\n		\r\r \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z : \n \n \n!"#"$\r\n  \n \n\Z  \n \n06  $ ! !&!\n5)\'(6\'))\'(766\'86)\'+6\'*)7\'\'\'9999**,)	\'7,\'")*+\n	\'))\'-)\'.5;*)*-+6\'*)\n\n!0  \r\n	 !		 \n,#		\n	 		.  		 \nBusiness Acumen \nAccounting Management \n\r 	6.\' \n 	\'7+)\')**)\' \n \n \n \n \n \n \n \n \n! $$ \n \n\n\n\n \n \n0   BALANCED SCORECARD ,. $ $& $  "; \n\n;5"&)\'),\',Assistant Supervisor*\n! \n %  \n$    $(  !		   ,<. \Z          \n,!		 = .  	 7> #	\'	 \n\n\n\n\n\n \n! $$ \n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n!	\n		\r\r \n \n \n\n \n N\n	\n\r 		 	 \n	\n \r\n	 \n \n  	\n		\r \n\Z  \n \n \n!"#"$\r\n\n\Z\n\n\n\n;-.)\'),\',< Crew, Staff s/d Section Head\n! " !  \n$& $  " $(  \'	  !  $ \n\Z ,!		    \n= . \n)=)*)7,+\')(\'**)6\n>,7\'\'6    ?\n 	6\'7\'6+;@\'6.6>,    ?\n\r 	\'8\';)@6>,7\'\'6  A ?\n	\'8\'+,*)*+\')7\'\n7),67   ?\n    \n ! $$\n;Balanced Scorecard,-.767)+6)\' \n \n0    #!! \n!     #!!  !  $  \Z ,!		 = . \n ")  \n \')  \n\r -+;\'  \n "\'*)  \n  ! $$ \n\n/0 !  $  " \Z\n&!  ! $$  $  \Z ,!		 = . \n3 3"	/--	// "0   \n5 3"	/-5"&3!$/-/!23   \n& 3"	/--/0"0	0 3    \n!  $  " \Z ,8 ? 8 ? 8. \n\n\n\n !  $!  ! \n\n\n  \n \n\n \n\n\r\n!	\n		\r\r \n \n \n \n\n \nManual:  \nSistem Penilaian Kinerja Berbasis Kompetensi \nKP-CPP \nNo.: MNL-PFM-PMPD-1.3.2  Ver.: 1.0 \nTgl.: 04 Okt "17  Hal.: 18/18 \n \n   FRM-SYS-GDM-3.2.1 Ver.1.2 \n \n6) Contoh Pengisian Formulir Usulan Perbaikan dan Pengembangan. \n \nRAHASIA \n \n\n \n \nFORMULIR USULAN PERBAIKAN DAN PENGEMBANGAN \n \n \nPERBAIKAN DAN PENGEMBANGAN \nTuliskan     program     pengembangan     yang    diperlukan    pekerja,   dengan    mempertimbangkan    usaha    untuk   mencapai   \nSasaran/Tujuan dan Kompetensi yang diperlukan oleh pekerja yang dinilai. \nProgram dapat berupa : penugasan (job assignment), sharing pengetahuan, pelatihan, dll. \n \nLOKASI KERJA : KP DEPARTEMEN/BAGIAN: Accounting & Tax SEKSI : Accounting Staff \n \nNO  NAMA  NIP PROGRAM PERBAIKAN \nPENGEMBANGAN KOMPETENSI \nTERKAIT KETERANGAN \n1  Ratna Tyas  150001  Training Pengelolaan Tugas  P&O Pengelolaan  tugas \ndapat efektif dan efisien \n     Coaching PS&DM Mampu menyelesaikan \npermasalahan harian \n2  Bella Ayu  150002 Counseling DEV  Meningkatkan kinerja \n3  Andin Surya  150003 Coaching Accounting & Tax \nMembuat laporan \nkeuangan yang akurat \ndan tepat waktu \n          \n          \n           \n           \n           \n           \n           \n           \n           \n           \n           \n \nPENILAI ATASAN PENILAI \n   \nTgl: Tgl: \n              1                    FRM-PFM-PMPD-1.3.4 Ver.1.1 \n  '),
('1903201626163202050', 'FRM-ERP-SPL-01_Ver._1.2_Form_Pengajuan_Kode_Barang_(upload)', 'application/pdf', 1, 'pdf', 'FRM-ERP-SPL-01_Ver._1.2_Petunjuk_Pengisian_Form_Pengajuan_Kode_Barang_(upload)', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'PERSETUJUAN2.pdf', 'application/pdf', 'Teruskan dokumen sesuai no.urut tiap section \nuntuk pengisian data\n1.\n ? VI. ACCOUNTING Section\nItem Code         1.\nProduct Line2.,  Description  :  ( ______________Tgl________ )\n ? V.  COSTING Section\nBOM Code:1.\nItem Phantom\n2.\nYes (Isi data dibawah),\n?  Item Code  :   ...................................\n?  Item Name :   ...................................\nNo\nItem Type\n3........................., Desc.: ............................ \n?  BOM Code : .......................................\nDiperiksa:\nCosting Manager/Ast.,\nDiperiksa Oleh:\nAccounting Manager/ Ast,Input ke Sistem Oleh:\nTidak ada\nBaru / Update\n                                                                                                                                                         FRM-ERP-SPL-01  Ver.1.2\nDilampirkan form Perubahan BoM\n4.Permintaan GMR     DO   /     PR     /     PO\nUM Main          1.\n2.Material Requirement Planning :\n Alasan penambahan item code, \nItem Name1.\n ? I. REQUESTOR Section\nUM Purchase            2.\n3.\nLead Time             4.\nMinimum Order     5.\nMultiple Order     6.Rp ..................\nUSD / SIN ............., per ............\nTax 10 %, Non TaxPrice Table Code  :  ................... Item Class A : Yes / No\n(UM Main)\n(UM Main)\nPrice List Maintenance :                         (Harga sesuai UM Main)\n  ?  Supplier Code:  ..................\n?  Supplier Name:  ..................................\nBuyer / Staff2.\n(Days)\n ? III.  WAREHOUSE Section\nSafety stock \n(UM Main)GMS:3.\nPackaging Conversion :2.\n? (UM PCH) ............ \n (UM Main) ........ x (Konversi) ........ \n?  Master Schedule  :  \nYes,No\n?  Order Policy  : .............? Order Period : ............(Days)\n?  Plan Order           :  Yes (Isi Order Policy & Period),No\nNew (Masukkan data lengkap di QAD),Existing\nDiscount item:  ..............  %? (UM TR2) ........... \n (UM Main) ......... x (Konversi) ........ ? (UM TR1) ............ \n (UM Main) ........ x (Konversi) ........ \n3.NewSubstitute\n.....................................................................................\nBila substitusi, menggantikan Kode & Nama Barang: ................\n.....................................................................................\nType *Manufacture  /  Purchase  /  Distribution5.\nGMR:\nSupplier Maintenance :\nGMS:Loc.3.GMR:\nLokasi penggunaan item: (*Create pada domain GMR & PRM).4.\nItem Standar KP; Dept. .........\nItem Standar Store*\nItem Produksi (bahan baku) KP\nItem Produksi (bahan baku) Store*\n1.\n?  ........................ &......................................................Bila substitusi, item yang digantikan, Code & Name:\n? Status:\nActive, per tgl .......Non Active, per tgl ......\nMaterial Replace, per tgl ........\n ? IV.  PURCHASING Section\n ? II. PPIC Section\nDiajukan oleh:\nManager /Ast._________,\n( ___________________)\n( ______________Tgl________ )III. Warehouse Manager /Ast.IV. Purchasing Manager /Ast.II. PPIC Manager/Ast.\n( ______________Tgl________ )\n( ______________Tgl________ ) ( ______________Tgl________ )V. GM Supply\n( ______________Tgl________ ) ( ______________Tgl________ )( ___________Tgl____)\nPENGAJUAN KODE BARANG\nNo. PKB :\nTanggal :  /      /\n\n\n\n\n       Barang Perlengkapan Dapur / \nResto / Spare part.\nLampirkan form Standarisasi & \nkirimkan form ke Sysdev.Form standarisasi diterima oleh:Sysdev. Manager /Ast.,\n( ___________________)5'),
('1903201627053424414', 'PKP-PB-PKA-1_Ver._1.0_Perencanaan_Anggaran_(bw)', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'Persetujuan_PKP_PB.pdf', 'application/pdf', '\nffiw\nBokml Gltt\nKebijakan : Perencanaan AnggaranDitetapkan Oleh:Disahkan Oleh:tq---\nJenny Mokhtar\nBOD\nNomor :PKP-P&B-PKA-1\nVer: 1.0\nTanoqal :22Ju\\i2015Sifat : General\n1. Tujuan\n1) Memberikan pedoman kepada seluruh Person in Charge (PiC) Kantor Pusat dalam rangka menyusun anggaran,2) Memastikan pelaksanaan perencanaan anggaran sesuaidengan aturan yang berlaku.\n2. Pengertian1) CAPEX (Capital Expenditure)\nAdalah pengeluaran yang dialokasikan dalam pembelian, perbaikan, penggantian atau penambahan aset yang\nsecara akuntansi dikategorikan sebagai aset perusahaan, lihat DFT-AMG.AMG.1.1 Daftar KlasifikasiAktiva.2) OPEX (Operational Expenditure)\nAdalah alokasi pengeluaran uang atas biaya yang tidak digolongkan kedalam CAPEX dan merupakan biaya yang\nbersifat consumable (habis pakai).3) Master Budget\nAdalah template profff /oss dan seluruh template konsolidasi dari departemen dalam menyusun anggaran.\n3. Ruang Lingkup1) Board of Directors2) GeneralManager3) All Department Manager\nr;\'ltr..rLl-ffi 6] u**ettfu1 h\'N-f i\nKetentuan-ketentuan1) Setiap departemen wajib menyusun rencana anggaran CAPEX dan OPEX untuk departemennya masing-masing\ndan menyerahkan anggaran yang telah disusun ke Plan & Budget Department sesuai periode cycle budget yang\nberjalan setiap tahun.2) Plan & Budget Department berhak melakukan pengurangan/ pemotongan anggaran apabila setelah dr-review\nterdapat ketidaksesuaian dalam penyusunan anggaran,\nSebelum melakukan pengurangan/ pemotongan anggaran, Plan & Budget Department harus melakukan\nkomunikasi dan mendapatkan persetujuan departemen/ Pihak yang bersangkutan.3) Dari setiap anggaran yang disusun, Plan & Budget Department akan membuat Master Budget dan meminta\npersetujuan BOD atas Master Budgef tersebut,4) Master Budgef yang telah disetujui menjadi acuan penggunaan anggaran selama 1 tahun kedepan.\nHalaman 1 dari 2\n\nW\nBakmi Gltt\nKebijakan:\nPerencanaan Anggaran\nNo.: PKP-P&B-PKA-1Ver.: 1.0\nIgl.:22 Juli2015Hal;212\nSebelum melakukan pengeluaran anggaran, setiap departemen harus memastikan ketersediaan anggaran yang\nakan digunakan sesuai dengan anggaran yang telah disetujui.\nJika tidak terdapat ketersediaan anggaran, departemen ybs harus meminta persetujuan pengeluaran biaya diluar\nanggaran sesuai dengan Kebijakan Otorisasi Persetujuan Pengeluaran.\nAnggaran yang telah disetujui akan dikontrol penggunaannya oleh Plan & Budget Department dan setiap bulan\nakan dilaporkan kepada masing-masing departemen baik melalui email ataupun pembahasan bulanan dengan\ndivisi fungsionalnya.\n7) Masing-masing departemen wajib memberikan informasi pertanggungjawaban atas aktual anggaran yang\ndikeluarkan apabila melebihi dari anggaran yang telah disetujui.\nDokumen yang terkait dalam kebijakan\nKebijakan Otorisasi Persetujuan Pengeluaran\nEfektif Berlaku\nKebijakan ini berlaku tanggal 1 September 2015. Apabila dalam pelaksanaannya terdapat hal-hal yang memerlukan\npengaturan lebih lanjut baik hal-hal yang bersifat teknis dan prosedural maupun terhadap hal-hal baru yang timbul\nkemudian, maka akan dikeluarkan kebijakan baru sebagai kelengkapan dari kebijakan ini.');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903201627054922395', 'MNL_-_Sharing_Knowledge_Bakmi_GM', 'application/pdf', 1, 'pdf', 'MNL_-_Sharing_Knowledge_Bakmi_GM_-_28_11_2018_FIN', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'LAMPIRAN_Manual_Sharing_Knowledge_Bakmi_GM', 'application/pdf', 1, 'pdf', 'MNL_Sharing_Knowledge_Bakmi_GM_dok_persetujuan.pdf', 'application/pdf', ' \nManual:  \nPelaksanaan Sharing Knowledge Bakmi GM Hal.: 1 / 11 \nSifat: Confidential Tgl.: 1 1RYHPNHU¶18 Ver.: 1.0 No.: MNL-HSP-KMS-03 \nDibuat oleh: \n \n \n \n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Johan Mohammad \nKM Supervisor \nAditya Wardiman \nAsst. HR Support Manager \nCynthia Fellicianne \nGM HRD \n \nMNL-HRS-KMS-03 - Ver.01 \n\nDiterapkan dan Disetujui oleh: \nDivisi/Departemen Disetujui Tanda Tangan  \nDivisi Business Development a/n Tammy Tanumihardja   \nDivisi Supply Antonius Hendrajaya   \nDivisi Operation Budi Purnama   \nDivisi Engineering & Services Iman Dwinanto   \nDivisi Human Resource Cynthia Fellicianne   \nDivisi FAST Anthony Pamungkas   \n \nTanggal Efektif :    1 Januari 2019                        \nNo. Copy Dokumen :                                                    \nDistribusi ke :                                                    \n \nDAFTAR ISI \n \n1. LATAR BELAKANG ........................................................................................................................................................ 2 \n2. TUJUAN ........................................................................................................................................................................... 2 \n3. RUANG LINGKUP ........................................................................................................................................................... 2 \n4. DEFINISI .......................................................................................................................................................................... 2 \n5. SHARING KNOWLEDGE BAKMI GM ............................................................................................................................. 3 \n6. PROSEDUR ..................................................................................................................................................................... 3 \n6.1. Peran dan Tanggung Jawab (People) ........................................................................................................................... 3 \n6.2. Proses Pelaksanaan Sharing Knowledge .................................................................................................................... 5 \n6.3. Sarana Teknologi terkait Sharing Knowledge ............................................................................................................. 8 \n7. TATA KELOLA ................................................................................................................................................................ 9 \n7.1. Guidance Principle ......................................................................................................................................................... 9 \n7.2. Penilaian Kinerja (Performance Management) ............................................................................................................ 9 \n7.3. Dukungan (Support) ..................................................................................................................................................... 10 \n8. KONDISI KHUSUS ........................................................................................................................................................ 11 \n9. LAMPIRAN .................................................................................................................................................................... 11 \n \n  \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 2 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n1. LATAR BELAKANG \nBakmi GM telah berdiri sejak tahun 1959 hingga saat ini masih terus tumbuh dan berkembang menjadi restoran keluarga \nyang memiliki kualitas dunia dan dicintai konsumennya. Hal ini tidak terlepas dari adanya pengetahuan perusahaan yang \ndiciptakan, dikelola, dikembangkan, disebarkan dan digunakan kembali oleh karyawan Bakmi GM dari dulu hingga kini. \nSaat ini Bakmi GM telah melakukan banyak hal dalam rangka mengelola pengetahuannya. Seperti pengetahuan tentang; \nproduksi, pengadaan, penyimpanan, distribusi, pemasaran, pelayanan, operasional, pengelolaan SDM dan sebagainya. \nHal ini dibuktikan dengan adanya kegiatan; pelatihan di training center Bakmi GM, dokumentasi SGS (standard guidance \nstore), serta pemanfaatan aplikasi e-dokumen dan service desk. Hal ± hal tersebut semata-mata dilakukan demi \nmenyebarkan pengetahuan organisasi kepada karyawan sesuai peran dan fungsi-nya masing-masing, guna mencapai \ntujuan akhir yaitu memuaskan pelanggan Bakmi GM.  \nPengetahuan Bakmi GM saat ini masih banyak yang tersimpan sebagai tacit di masing-masing karyawan. Pengetahuan \ntacit yang dimiliki karyawan tersebut dapat berupa pengalaman, kebijaksanaan (wisdom), (best practice), cerita sukses \n(success story), keterampilan (skill), sikap kerja (attitude), tips & trick dan atau inovasi. Pengetahuan tersebut sangat \nberguna bagi perusahaan guna menyamaratakan dan meningkatkan kinerja dalam rangka menumbuh-kembangkan \nusaha perusahaan. Diperlukan wadah/kegiatan yang dapat mengakomodasi setiap karyawan Bakmi GM untuk berbagi \npengetahuannya.  \nSaat ini Bakmi GM tengah menginisiasi program Pengelolaan Pengetahuan (Knowledge Management). Program ini \nbertujuan agar seluruh karyawan Bakmi GM terlibat dalam kegiatan pengelolaan pengetahuan di lingkungan Bakmi GM. \nKeterlibatan karyawan dalam kegiatan pengelolaan pengetahuan sangat diperlukan agar antar karyawan di lingkungan \nBakmi GM dapat saling berbagi pengetahuan sesuai peran dan fungsinya. Salah satu langkah yang dilakukan adalah \ndengan meningkatkan budaya berbagi pengetahuan di lingkungan Bakmi GM. Peningkatan budaya berbagi pengetahuan \nsalah satunya dilakukan dengan cara menginisiasi kegiatan sharing knowledge di lingkungan Bakmi GM. \n2. TUJUAN \nManual ini disusun sebagai panduan (guidance) pelaksanaan sharing knowledge di lingkungan Bakmi GM, dalam rangka: \n1) Menciptakan dan menumbuhkan budaya berbagi pengetahuan (sharing knowledge) di lingkungan Bakmi GM. \n2) Menyediakan media untuk membantu karyawan Bakmi GM dalam menyebarkan pengetahuannya. \n3) Menyediakan media sosialisasi program-program strategis yang ada di lingkungan Bakmi GM. \n4) Menjadi salah satu media penyebaran pengetahuan, dimana terjadi interaksi langsung antara knowledge owner \ndengan knowledge customer (user) dalam suasana fun, informal dan value. \n3. RUANG LINGKUP \nSeluruh Unit kerja di Bakmi GM meliputi :  \n Area & Store Operation; \n Distribution Center (DC);  \n Divisi / Departemen di Kantor Pusat / CPP dan; \n Unit Kerja lainnya di Bakmi GM. \n4. DEFINISI \n1. Pengetahuan (knowledge), adalah pengalaman, kebijaksanaan (wisdom), best practice, cerita sukses, keterampilan \n(skill), sikap kerja (attitude), tips & trick  dan atau inovasi yang dimiliki karyawan Bakmi GM serta memiliki nilai tambah \n(value) untuk disebarkan kepada karyawan lain guna meningkatkan kinerja karyawan dan perusahaan. \n2. Sharing Knowledge, adalah aktifitas berbagi pengetahuan yang dilakukan oleh dan untuk karyawan Bakmi GM dalam \nsuasana fun, informal, dan value. \n3. Pemiliki  Pengetahuan  (knowledge  owner),  adalah  karyawan  Bakmi  GM  atau  pihak  eksternal  yang  memiliki \npengetahuan untuk dibagikan kepada karyawan Bakmi GM lainnya. Dimana pengetahuan tersebut memiliki value \nuntuk meningkatkan kinerja karyawan dan juga perusahaan. \n4. Subject Matter Expert (SME) adalah karyawan Bakmi GM yang ahli (expert) terhadap suatu bidang atau topik \npengetahuan. \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 3 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n5. SHARING KNOWLEDGE BAKMI GM \nSharing Knowledge Bakmi GM adalah aktifitas berbagi pengetahuan yang dilakukan oleh dan untuk karyawan Bakmi GM \ndalam suasana fun, informal, dan value.     \nSharing Knowledge di Bakmi GM Bakmi GM terdiri dari: \na) Sharing Knowledge General; \nb) Sharing Knowledge Internal Unit Kerja.  \nPenjelasan atas perbedaan dari dua kegiatan Sharing Knowledge tersebut disampaikan pada tabel berikut: \n Sharing Knowledge General Sharing Knowledge Internal Unit Kerja \nInisiasi Tim KM Korporat Unit Kerja masing-masing (Divisi / Area / \nDepartemen / Store / Distribution Center / Unit \nKerja Central Production Plant)  \nTopik Materi - Hal-hal yang bersifat umum (general), namun \nberkaitan  dengan  pekerjaan  di  lingkungan \nBakmi GM secara langsung / tidak langsung; \n- Sosialisasi kebijakan / peraturan baru baik dari \ninternal  Bakmi  GM  atau  eksternal \n(stakeholder); \n- Pengalaman  (experience / wisdom), \npengetahuan (knowledge), best practice, dan \natau success  story yang  bermanfaat  dalam \nmenambah wawasan karyawan Bakmi GM. \n- Berkaitan  dengan  kebutuhan  pengetahuan \nyang mendukung pekerjaan bagi tim di masing-\nmasing internal unit kerja;  \n- Sosialisasi  terkait  implementasi  kebijakan  / \nperaturan baru dari suatu unit kerja atau dari \npihak  ekstenal  (stakehoder)  yang \npelaksanaannya dinaungi oleh suatu unit kerja; \n- Pengalaman  (experience / wisdom), \npengetahuan (knowledge), best practice, dan \natau success  story yang  bermanfaat  dalam \nmenambah  wawasan  karyawan internal  unit \nkerja. \nWaktu \nPelaksanaan \nDitentukan  dan  dijadwalkan  oleh  Tim KM \nKorporat. \nDitentukan  oleh masing-masing  Internal  Unit \nKerja. Dapat menggunakan waktu kerja selama \ntidak menganggu operasional kerja, atau diluar \nwaktu kerja yang telah disepakati.  \nNarasumber Dari Internal Bakmi GM atau Pihak Eksternal \nBakmi GM (jika diperlukan). \nDari  Internal  Unit  Kerja,  Internal  Bakmi  GM \natau  Pihak  Eksternal Bakmi  GM (jika \ndiperlukan). \nPeserta Seluruh karyawan Bakmi GM Internal Unit Kerja atau peserta dari unit kerja \nlain yang membutuhkan pengetahuan sesuai \ntopik yang disampaikan. \nSarana & \nPrasarana \nRuangan, peralatan serta kelengkapan sharing \nknowledge disiapkan oleh Tim KM Korporat.  \nRuangan dan kelengkapan sharing knowledge \ndisiapkan oleh Internal Unit Kerja.   \nProsedur  Dijelaskan  dalam  dokumen  manual  ini. \n(Manual: Pelaksanaan Sharing Knowledge di \nlingkungan Bakmi GM) \nDijelaskan  dalam  dokumen  Manual: \nPelaksanaan Sharing  Knowledge untuk \nInternal Unit Kerja. (dokumen terpisah) \n \n6. PROSEDUR  \nBerikut ini adalah Prosedur pelaksanaan Sharing Knowledge Bakmi GM. \n6.1. Peran dan Tanggung Jawab (People)  \nPeran (roles) dan tanggung jawab (responsibilities) dalam kegiatan Sharing Knowledge Bakmi GM terdiri dari: \n \n \n \n \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 4 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n \nPeran (Roles) Tanggung Jawab (Responsibilities) \nSharing Knowledge General Sharing Knowledge Internal Unit Kerja \nSponsor - Membentuk Tim KM Korporat; \n- Menginisiasi  kegiatan sharing  knowledge \ngeneral; \n- Memonitor  persiapan  dan  pelaksanaan \nsharing knowledge general. \n- Mementuk Tim KM Internal Unit Kerja; \n- Menginisiasi kegiatan sharing knowledge di \nInternal Unit Kerja; \n- Memonitor  persiapan  dan  pelaksanaan \nsharing knowledge  di Internal Unit Kerja. \nTim KM \nKorporat \n- Melaksanakan dan  mengoordinasikan \nkegiatan sharing knowledge; \n- Menyiapkan manual    pelaksanaan sharing \nknowledge; \n- Menyusun,  memonitor  dan  menjalankan \njadwal, topik dan konsep sharing knowledge \n- Mengusahakan,  mengelola  dan  memonitor \npenyediaan  sumberdaya  dan  sarana  untuk \nkegiatan sharing knowledge; \n- Mengumpulkan,  memverifikasi  dan \nmenyebarkan  dokumentasi  hasil sharing \nknowledge. \n- Men-support pelaksanaan sharing knowledge \ninternal unit kerja, baik secara moril maupun \nmaterial sesuai kapasitasnya; \n- Memonitor  kegiatan sharing  knowledge \nsesuai jadwal, topik dan konsep yang telah \ndirencanakan oleh internal unit kerja; \n- Memverifikasi  dan  menyebarkan \ndokumentasi hasil sharing knowledge internal \nunit kerja. \nTim KM Internal \nUnit Kerja \n- Menginformasikan  anggota  unit  kerja  yang \nterkait kegiatan sharing knowledge general; \n- Mendaftarkan  tim  yang  akan  mengikuti \nsharing knowledge general; \n- Memberikan masukan terkait topik dan saran \nperbaikan kegiatan sharing  knowledge \nkepada Tim KM Korporat. \n- Melaksanakan dan  mengoordinasikan \nkegiatan sharing knowledge di internal unit \nkerja \n- Menyusun dan menjalankan jadwal, topik dan \nkonsep sharing knowledge untuk internal unit \nkerja \n- Mengusahakan,  mengelola  dan  memonitor \npenyediaan  sumberdaya  dan  sarana  untuk \nkegiatan sharing  knowledge di  lingkungan \nunit kerja \n- Mengumpulkan  dokumentasi  hasil sharing \nknowledge kepada Tim KM Korporat. \nNarasumber - Menginformasikan dan menyiapkan bahan materi sesi sharing knowledge \n- Berbagi pengetahuan dalam sesi sharing knowledge \n- Bertindak sebagai subject matter expert (SME) dengan memvalidasi dokumentasi hasil sharing \nknowledge \nModerator - Memandu pembukaan  dan  penutupan  juga  bertindak  sebagai time  keeper pada  saat \npelaksanaan sharing knowledge \n- Membantu menciptakan dan menjaga suasana fun, informal & value pada saat pelaksanaan \nsharing knowledge \n- Memandu sesi diskusi dan tanya-jawab dalam saat pelaksanaan sharing knowledge \nTim \nDokumentasi \n(Notulen) \n- Mendokumentasikan isi materi serta suasana sharing knowledge baik dalam bentuk script, \nnotulen, audio dan atau video \n- Menulis dokumentasi hasil sharing knowledge dalam format newsletter atau artikel \n- Melakukan proses verifikasi hasil dokumentasi sharing knowledge kepada tim KM korporat Bakmi \nGM \n- Melakukan proses validas hasil dokumentasi sharing knowledge kepada narasumber / SME \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 5 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n6.2. Proses Pelaksanaan Sharing Knowledge \nProses sharing knowledge terdiri dari 3 tahapan utama yaitu: \n1) Tahap Persiapan \n2) Tahap Pelaksanaan \n3) Tahap Setelah Kegiatan \nRincian dari tahapan proses tersebut adalah sebagai berikut: \n1) Tahap Persiapan \nNo. 1) Tahap Persiapan General Internal \nUnit Kerja \nA Set waktu dan tempat   \ni Perencanaan waktu pelaksanaan; ¥ ¥ \nii Konfirmasi lokasi kegiatan, meliputi perizinan untuk peminjaman (booking) tempat/ruangan sesuai \nkapasitas jumlah peserta; (terlampir contoh memo peminjaman ruangan); ¥ ¥ \nB Tema, Narasumber dan Materi Sharing   \ni Perencanaan tema sharing knowledge, meliputi brainstorm dengan narasumber; ¥ ¥ \nii Konfirmasi topik dan konsep sharing knowledge kepada narasumber, baik secara informal maupun \nformal* (terlampir contoh memo undangan narasumber); ¥ ¥ \n(*optional) \niii Konfirmasi  materi sharing  knowledge dengan  narasumber  (slide  show power  point,  profil  / CV \nnarasumber*, alat peraga*, cetak materi*, perlengkapan games*, dll) dilakukan maksimal dua hari \nsebelum kegiatan. \n¥ ¥ \n(*optional) \nC Publikasi & Pendaftaran   \ni Penyusunan memo undangan (terlampir contoh memo undangan sharing knowledge)  ¥ ¥ \nii Desain materi publikasi (flyer)* (terlampir contoh flyer); ¥ (*optional) \niii Konfirmasi design materi publikasi (flyer) dengan narasumber* ¥ (*optional) \niv Sosialisasi  dengan  menyebarkan  memo  undangan  dan  flyer  materi  publikasi*  (terlampir  contoh \nsosialisasi via email); ¥ ¥ \nv Konfirmasi  kehadiran  peserta  melalui  penerimaan  pendaftaran  peserta  (terlampir  contoh  email \nkonfirmasi (reply) pendaftaran peserta dan format daftar hadir peserta); ¥ (*optional) \nD Persiapan Sarana & Prasarana   \ni Persiapan sarana pendukung kegiatan sharing knowledge meliputi:   \na. Pembuatan, pengesahan & pengajuan quotation letter* & bon sementara (BS)* / Bukti pengembalian \nKas Kecil (BPKK)* dan atau pengajuan Surat Pengajuan Barang (SPB)* untuk pemenuhan sarana & \nprasarana penunjang sharing knowledge; \n¥ (*optional) \nb. Pengadaan snack & coffe break; ¥ ¥ \nc. Pengadaan reward untuk peserta & narasumber; ¥ (*optional) \nd. Pengadaan alat dokumentasi (ATK notulensi, perekam suara, kamera foto / video*, ATK notulensi); ¥ ¥ \ne. Pengadaan atribut games*; (*optional) (*optional) \nf. Cetak daftar hadir, dan lembar evaluasi (terlampir contoh lembar evaluasi); ¥ ¥ \ng. Peminjaman peralatan pendukung (laptop, projector, rol kabel, sound system, mic, clicker, flipchart, \nspidol, lampu* water tank*, cangkir / hot cup*, piring*, dll) (terlampir contoh pengajuan peminjaman \nperalatan). Pastikan seluruh sarana telah diperiksa, berfungsi dan siap digunakan. \n¥ (*optional) \nh. Konfirmasi  personil  pendukung  meliputi:  narasumber,  moderator;  tim  dokumentasi;  notulen;  tim \npendukung lainnya. Pastikan setiap personel pendukung telah dikonfirmasi kehadiran maksimal dua \nhari  sebelum  kegiatan sharing  knowledge.  Jika  ada  yang  berhalangan  maka  perlu  mencari \npenggantinya. \n \n¥ ¥ \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 6 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n2) Tahap Pelaksanaan (Hari H) \nNo. 2) Tahap Pelaksanaan General Internal \nUnit Kerja \nA Set Ruangan dan Peralatan   \ni Minimal 1-2 Jam sebelum kegiatan sharing knowledge dimulai, seluruh personil pedukung telah berada \nditempat untuk mempersiapkan set up ruangan dan peralatan.  ¥ (*optional) \nii Set  ruangan  dapat  disesuaikan  dengan  kebutuhan,  misalnya: islands  table*, class  room  table*, \nbangku  berjajar*,  bangku  setengah  lingkaran*, U-shape  class*,  O-shape  class*,  lesehan*,  atau \nlainnya. Pastikan terdapat jalur mobilisasi peserta baik menuju tempat duduk dan keluar ruangan \n(Terlampir contoh denah set ruangan) \n¥ (*optional) \niii Set peralatan presentasi dapat disesuaikan dengan kebutuhan minimal meliputi projector, laptop, rol \nkabel, sound system*, mic*, clicker*, papan tulis / flipchart, spidol, dan kursi narasumber. ¥ (*optional) \niv Set coffee break* & meja registrasi* dapat ditempatkan di dalam ruangan atau di luar ruangan, \ntergantung kapasitas ruangan. Pastikan terdapat jalur mobilisasi peserta dari tempat duduk ke area \ncoffee break, atau sebaliknya, sehingga tidak terhalang. \n¥ (*optional) \nB Simulasi persentasi & dokumentasi   \ni Simulasi presentasi dilakukan minimal 30 menit sebelum acara dimulai untuk memastikan seluruh \nmateri dapat ditampilkan. Audio dan video berjalan (jika ada), clicker berfungsi, serta melakukan \nsound  check baik  dari microphone atau audio dari  laptop,  sehingga  saat  presentasi  tidak  ada \nkesalahan teknis. \n¥ (*optional) \nii Set up alat dokumentasi dilakukan untuk memastikan bahwa seluruh sesi sharing knowledge terekam \ndengan baik dari sisi audio maupun video*. Perlu diperhatikan penempatan alat rekam suara yang \nsebaiknya berada di dekat sumber suara (speaker). Penempatan perekam video* yang sebaiknya \ndapat mengambil gambar pergerakan, ekspresi, serta body language narasumber saat pemaparan \nmateri dan juga peserta saat interaksi tanya jawab. \n¥ ¥ \n(*optional) \nC Konsep Fun, Informal, Value   \ni Fun ± Sharing Session dilakukan dalam suasana santai sehingga peserta merasa nyaman dalam \nmengemukakan pendapatnya. ¥ ¥ \nii Informal ± Semua peserta sharing session melepaskan kedudukan atau jabatan, sehingga peserta \nbebas mengutarakan pendapatnya tanpa rasa sungkan. ¥ ¥ \niii Value ² Materi sharing session berkaitan dengan pekerjaan sehari-hari dan juga bisnis perusahaan \nsehingga jika ditindaklanjuti akan memeberikan dampak positif dan nilai tambah terhadap kinerja \nperusahaan. \n¥ ¥ \nD Sesi Pelaksanaan    \ni Kegiatan sharing  knowledge harus dimulai  dan  diakhiri  tepat  waktu  dalam  rangka  memelihara \nintegritas kegiatan. Waktu pelaksanaan kegiatan Sharing knowledge adalah maksimal 2 jam. Kecuali \nada kesepakatan dengan peserta untuk melebihi waktu 2 jam*. Berikut adalah standar daftar susunan \nkegiatan sharing knowledge di untuk lingkungan Bakmi GM: \n- Pembukaan oleh moderator (15 menit) \n- Sesi sharing knowledge oleh narasumber (60 menit) \n- Sesi tanya jawab dipandu oleh moderator + games* (30 menit) \n- Pemberian hadiah bagi peserta & penutupan (15 menit). \n¥ \n(*optional) \n¥ \n(*optional) \nE Dokumentasi   \ni Notulen  mendokumentasikan  isi  materi  dan  suasana  yang  terjadi  saat  sesi sharing  knowledge \nberlangsung, termasuk diskusi dan tanya jawab.  \nBest Practice: Untuk mempermudah pada saat proses pembuatan knowledge asset, maka notulen \nperlu mensinkronisasi poin-poin dalam catatan notulen dengan waktu yang tertera ada alat rekaman \n¥ ¥ \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 7 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\nNo. 2) Tahap Pelaksanaan General Internal \nUnit Kerja \naudio / video, sehingga saat menyusun knowledge asset tidap perlu mendengarkan seluruh rekaman, \ncukup pada waktu-waktu sesuai catatan saja. (terlampir contoh notulen) \nii Tim  dokumentasi  video* (live /  tidak live)  perlu  menempatkan  kamera  agar  dapat  menjangkau \npergerakan narasumber serta tampilan slide materi. Hal ini agar peserta conference call atau live \ndapat menyaksikan secara offline dan memahami penjelasan melalui ekspresi & body language \nnarasumber serta tampilan materi slide.  \nSaat sesi diskusi dan tanya jawab, kamera perlu mengarah baik kepada narasumber dan peserta aktif \n(yang berdiskusi / bertanya). \n¥ (*optional) \niii Tim dokumentasi foto perlu mengambil gambar foto minimal, antara lain: \n- Group peserta (per meja* atau keseluruhan)  \n- Narasumber (saat menerangkan),  \n- Moderator \n- Peserta aktif (saat diskusi / bertanya-jawab)*, \n- Sesi penyerahan reward (kepada narasumber & peserta aktif) \n- Foto bersama narasumber dan peserta (akhir sesi) \n- Foto sesi ice breaking / games (jika ada) \n¥ ¥ \n(*optional) \nF Akhir Pelaksanaan   \ni Setelah  kegiatan  selesai,  seluruh  tim  pendukung  kegiatan perlu merapihkan  peralatan sharing \n(termasuk lembar evaluasi), membersihkan ruangan, dan membawa kembali peralatan pendukung ke \ntempat awal.  \nJika kegiatan sharing knowledge diadakan di store, maka peralatan dapat didistribusi via ekspedisi ke \nstore. Jika peralatan merupakan pinjaman dari unit kerja lain (store atau departemen lain), pastikan \nperalatan tersebut dikembalikan. \nBest Practice: Tim perlu menyiapkan checklist* terkait peralatan yang digunakan untuk memastikan \ntidak ada perlengkapan yang tertinggal saat meninggalkan tempat kegiatan, baik itu alat pinjaman \natau bukan. \n¥ ¥ \n(*optional) \n3) Tahap Setelah Kegiatan  \nNo. 3) Tahap Setelah Kegiatan General Internal \nUnit Kerja \nA Pembuatan notulensi (dokumentasi knoweldge asset) hasil sharing knowledge   \ni Pembuatan notulensi (dokumentasi knowledge asset) bertujuan untuk mendokumentasikan informasi \nserta pengetahuan yang disampaikan oleh narasumber pada sesi sharing knowledge. Agar materi \nsharing knowlegde dapat pula diketahui oleh karyawan yang berhalangan hadir mengikuti kegiatan \nsharing knowledge. \nNotulensi sharing knowledge disusun oleh tim notulen dengan format newsletter* atau artikel. Isinya \nberupa materi, catatan dan rekaman yang dihasilkan dari sesi persentasi materi dan sesi tanya jawab. \nNewsletter dibuat semenarik mungkin dengan penambahan gambar, foto atau ilustrasi serta penulisan \ndengan tata bahasa yang informal namun kontennya mudah dipahami.  \nSebelum dipublikasikan, hasil notulen/newsletter hasil kegiatan sharing knowledge tersebut perlu \nmelalui tahap verifikasi oleh Tim KM Korporat Bakmi GM dan melalui tahap validasi oleh narasumber. \n¥ ¥ \n(*optional) \nB Publikasi hasil notulensi (newsletter) sharing knowledge    \ni Penyebaran hasil notulensi (newsletter) sharing knoweldge dilakukan melalui media internal Bakmi \nGM yang dapat diakses oleh karyawan Bakmi GM sesuai hak aksesnya.  \nUntuk  materi sharing  knowledge yang  bersifat confidential,  maka  publikasinya  terbatas  kepada \nkaryawan yang diberikan hak akses (tergantung Departemen atau level jabatannya).   \n¥ \n(*optional) \n¥ \n(*optional) \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 8 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\nNo. 3) Tahap Setelah Kegiatan General Internal \nUnit Kerja \nMedia internal Bakmi GM yangdapat digunakan untuk mempublikasikan hasil notuensi (newsletter) \nadalah: \n- Webportal (E-Document)* \n- Email Korporat (@bakmigm.co.id)* \n- Media lain yang dipilih oleh Tim KM Korporat Bakmi GM*. \nPublikasi dilakukan paling lambat 1 (satu) bulan setelah penyelenggaraan sharing knowledge.* \nC After Action Review (evaluasi)   \ni Setelah melakukan serangkaian tahap proses persiapan dan pelaksanaan sharing knowlegde, maka \nseluruh tim personil dan  narasumber* yang terlibat dalam kegiatan perlu melakukan pertemuan after \naction review (AAR) untuk mengevaluasi pelaksanaan sharing knowledge yang telah dilalui, guna \nmenangkap pembelajaran dan improvement yang dapat dilakukan pada kegiatan sharing knowledge \nselanjtunya. Sesi AAR ini akan menghasilkan dokumentasi pembelajaran (lesson learned) yang ditulis \noleh notulen. (contoh format AAR terlampir). \nUntuk mendapatkan hasil evaluasi yang maksimal maka pelaksanaan AAR dapat dilakukan setelah \nselesai kegiatan atau maksimal 1 (satu) hari setelah kegiatan, agar seluruh tim masih mengingat hal-\nhal yang perlu dievaluasi. \n¥ \n(*optional) \n¥ \n(*optional) \nD Penyusunan Laporan    \nI Laporan Sharing Knowledge disusun untuk merekapitulasi data dan informasi dari kegiatan sharing \nknowledge yang telah diadakan, minimal meliputi: \n- CV Profil Narasumber \n- Statistik kegiatan \n- Data kepesertaan \n- Nilai evaluasi kegiatan \n- Foto kegiatan \n- Hasil Evaluasi AAR* \n¥ ¥ \n(*optional) \nii Laporan administrasi keuangan ¥ ¥ \n(*optional) \n6.3. Sarana Teknologi terkait Sharing Knowledge \nSarana  teknologi  dalam  kegiatan  pengelolaan  pengetahuan  digunakan  untuk  membantu  proses  komunikasi, \ndokumentasi dan penyebaran pengetahuan dalam suatu organisasi. Terkait kegiatan sharing knowledge di lingkungan \nBakmi GM, sarana teknologi yang tersedia adalah sebagai berikut: \no Web Portal / Booking System: Aplikasi yang berfungsi untuk pemesanan (booking) ruangan sharing knowledge di \narea Kantor Pusat. \no Web Portal / E-Document: Aplikasi yang berfungsi sebagai repositori dokumen knowledge asset hasil kegiatan \nsharing knowledge. \no Email korporat: Berfungsi untuk; mengkomunikasikan perihal perizinan ruangan di store; peminjaman peralatan antar \ndepartemen; penyebaran undangan, memo dan flyer kegiatan kepada narasumber, peserta dan personil; serta \nmedia publikasi dan media repositori digital hasil notulensi hasil dokumentasi dari kegiatan sharing knowledge. \no Facebook Live: Sarana media untuk menyiarkan kegiatan sharing knowledge secara live kepada karyawan yang \nmenjadi anggota Akar Bakmi GM secara satu arah, sekaligus menjadi alat dokumentasi kegiatan sharing knowledge. \no Zoom  Meeting  /  Vsee:  Sarana conference  call dimana  dapat  mengakomodasi  komunikasi  dua  arah  untuk \nnarasumber dan peserta yang berada di luar kota. \no Instagram & Facebook: Sarana untuk mem-posting flyer undangan serta foto kegiatan sharing knowledge kepada \nkaryawan yang menjadi anggota Akar Bakmi GM. \no Whats App: Penyebaran undangan. \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 9 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\n7. TATA KELOLA \nPengelolaan kegiatan sharing knowlegde di lingkungan Bakmi GM mengikuti dasar acuan tata kelola sebagai berikut: \n7.1. Panduan Prinsip (Guidance Principle) \nGuidance Principle disusun berdasarkan harapan, ekspektasi, masukan dan saran dari Jajaran Manajemen Puncak \nBakmi GM terkait pelaksanaan sharing knowledge di lingkungan Bakmi GM, sebagai berikut: \no Kegiatan sharing knowledge di lingkungan Bakmi GM diadakan dengan berlandaskan Nilai budaya Bakmi GM. \nTerutama nilai ke-5, yaitu 1LOML ³H´ AE ³HQRYMVL GMOMP HILVLHQVL GMQ SURGXNPLILPMV´. Dimana tujuan dari kegiatan sharing \nknowledge ini  adalah  menumbuhkan  budaya  berbagi pengetahuan  (sharing  knowledge)  sehingga  dapat \nmemperkaya pengetahuan karyawan bakmi GM yang akhirnya karyawan dapat mengembangkan pengetahuan \nmenjadi inovasi dalam efisensi dan produktifitas kerja.  \no Penerapan sharing knowledge ditujukan untuk berbagi topik pengetahuan yang berkaitan dengan pelembagaan Nilai \nBudaya Bakmi GM (corporate value), pengetahuan umum, serta pengetahuan yang berkaitan dengan hal-hal \nbaik/positif untuk meningkatkan efisiensi dan produktifitas kerja karyawan Bakmi GM. \no Kegiatan sharing knowledge dilakukan dengan menggunakan waktu kerja tetapi sama sekali tidak menganggu \nproses operasional / kerja yang sedang berjalan. \no Kegiatan sharing knowledge wajib dibudayakan dan dilaksanakan oleh jajaran manajerial di lingkungan Bakmi GM. \n7.2. Penilaian Kinerja (Performance Management) \no Key Performance Indicator (KPI) \nPenyusunan KPI untuk aktifitas sharing knowledge dilakukan dengan cara sebagai berikut:  \na) Melengkapi tabel KPI yang terdiri dari kolom Aktifitas KM, Deliverables, Target, dan How to Track;  \nb) Aktifitas KM: menentukan aktifitas-aktifitas sharing knowledge yang memiliki pengaruh terhadap penerapan KM \ndi lingkungan Bakmi GM;  \nc) Deliverables: menentukan hasil nyata/tampak yang dapat menjadi bukti dari hasil aktifitas KM;  \nd) Target: menentukan target pencapaian yang dihasillkan dari aktifitas KM, dapat berupa kerangka waktu, jumlah \naktifitas atau lainnya;  \ne) How To Track: menentukan cara untuk mengetahui kemajuan dari aktifitas-aktifitas KM tersebut dari waktu ke \nwaktu.  \n \nBerikut adalah tabel KPI untuk penerapan sharing knowledge di lingkungan Bakmi GM \nNo. Aktifitas KM Deliverables Target How to Track \n1. Sharing Knowledge \nGeneral Bakmi GM \n Daftar hadir peserta \n Materi Sharing \n Hasil Notulensi \n Laporan kegiatan \n Dilakukan dua kali \nsetiap bulan. \n Notulensi hasil \nterpublikasikan  \n2. Sharing Knowledge \nInternal Unit Kerja \n Daftar hadir peserta \n Materi Sharing \n Hasil Notulensi \n Laporan Kegaitan \n Dilakukan oleh \nmasing-masing Unit \nKerja (Dept. di \nKP/CPP dan Store \n/DC minimal satu \ntahun sekali.  \n Notulensi hasil \nterpublikasikan \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 10 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\nNo. Aktifitas KM Deliverables Target How to Track \n3. Menjadi Narasumber \nSharing Knowledge  \n \n Materi sharing  Level Direktur, GM, \nManager dan Asisten \nManager (untuk KP & \nCPP); serta level \nArea Manager & \nSenior Store \nManager (untuk \nStore dan DC) \nmengisi sharing \nknowledge general \npada periode 2017-\n2018, (2019 untuk \nSSM) dan sharing \nknowledge internal \nunit kerja, 1 kali \ndalam setahun.  \n Materi sharing \nterpublikasi dalam \nbetuk notulensi. \n4. Keikutsertaan \nkaryawan Bakmi GM \ndalam mengikuti \nkegiatan sharing \nknowledge \n Daftar hadir peserta  Setiap karyawan \nwajib mengikuti \nkegiatan sharing \nknowledge General \ndan Internal Unit \nKerja masing-masing \nminimal 1 (satu) kali. \n Nama peserta \ntercantum dalam \ndaftar hadir \nPelaksanaan sharing knowledge general dan internal unit kerja dapat dimonitor dari dokumentasi berupa hasil \nnotulensi yang diterima oleh tim KM Bakmi GM. Narasumber dan Unit kerja yang belum melaksanakan sharing \nknowledge akan diumumkan dalam meeting bulanan manager. \n7.3. Dukungan (Support) \nDukungan manajemen Bakmi GM beserta jajarannya terhadap pelaksanaan kegiatan sharing knowledge di lingkungan \nBakmi GM adalah sebagai berikut: \no Dukungan Finansial \nManajemen Bakmi GM berkomitmen untuk mendukung kegiatan sharing knowledge di lingkungan Bakmi GM dengan \nmengeluarkan dana pelaksanaan untuk setiap kegiatan sharing knowledge. Tim KM Korporat dapat mengajukan \nanggaran dana untuk menjalankan kegiatan sharing knowledge yang besarnya ditentukan berdasarkan kebutuhan. \no Dukungan Non-finansial  \n- Tim KM Korporat & Tim KM Internal Unit Kerja dapat mengajukan penggunaan waktu kerja untuk melaksanakan \nkegiatan sharing knoweldge selama sama sekali tidak mengganggu berjalannya kegiatan operasional. \n- Setiap karyawan yang ingin menyampaikan sesi sharing dan atau terlibat dalam proses notulensi dapat meminta \nuntuk dibekali dengan keterampilan presentasi serta menyusun notulensi hasil sharing knowledge oleh Tim KM \nKorporat. \no Penghargaan (reward & recognition) \n Setiap karyawan yang bertindak sebagai narasumber dan atau notulen dalam kegiatan sharing knowledge \nmendapatkan reward menarik. \n Setiap peserta yang menghadiri sesi sharing knowledge berhak mendapat apresiasi berupa poin plus dalam \nkartu karyawan atau penilaian kinerja. \n \n \nManual: Pelaksanaan Sharing Knowledge Bakmi GM No.: MNL-HSP-KMS-03 Ver.: 1.0 \nTgl.: 1 November 2018 Hal.: 11 / 11 \n \nMNL-HRS-KMS-03 - Ver.01 \n\no Hukuman (Punishment) \nKaryawan yang tidak memenuhi KPI terkait pelaksanaan sharing knowledge, akan di berikan punishment sesuai \nketentuan yang berlaku. \n8. KONDISI KHUSUS \n- \n9. LAMPIRAN \n- '),
('1903201641246109276', '70FRM-TRN-DEA-012_Ver._1.1_PKRP_Seksi_Mie-Intermediate_Advance', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'Persetujuan.pdf', 'application/pdf', 'STORE :\nBULAN :\nFRM-TRN-DEA-012 / Ver.1.1\nI.2\n1 2 3 4 5 6 7 8 9 1 1 2 3 4 5 1 2 3 4 5 6 7 8 9 10 1 2 Pekerjaan\nTgl Trainer\nTgl/Nilai\nPIC\nTgl/Nilai\nPIC\nTgl/Nilai\nPIC\n1\n\n\n2\n\n\n3\n\n\n4\n\n\n5\n\n\n6\n\n\n7\n\n\n8\n\n\n9\n10\n\n\n11\n\n\n12\n\n\n13\n\n\n14\n\n\n15\n\n\n16\n\n\n17\n\n\n18\n\n\n19\n\n20\nPETA KOMPETENSI DAN RENCANA PELATIHAN\nSEKSI MIE - INTERMEDIATE ( I ) dan ADVANCE (A)\nNo NamaPeta Kompetensi TeknisRencana PelatihanNIPVerifikasi\nI.1I.3I.4 A.1Verifikasi 1 Verifikasi 2 Verifikasi 3'),
('1903201656376038452', 'FRM-OPT-FPC-01_Ver._3.12_(Autopush)_LSM_Harian_Sie_Mie', 'application/pdf', 1, 'pdf', 'FRM-OPT-FPC-02_Ver._3.13_(Autopush)_LSM_Harian_Sie_Masak_2_Pelayanan,_Minuman', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'sETUjU.pdf', 'application/pdf', ''),
('1903201735347302757', 'File_Not_Found', '-', 0, '-', 'PKP_ITY_IOS_02_Penggunaan_Komputer_Portabel', 'application/msword', 0, 'doc', 'File_Not_Found', '-', 0, '-', 'UAT_Sign-Off_Phase_14.pdf', 'application/pdf', 'abstrak registrasi dokumen\r\n'),
('1903211356343481427', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 'Test'),
('1903221637432531222', 'FRM-OPT-FPC-01_Ver_312_(Autopush)_LSM_Harian_Sie_Mie', 'application/pdf', 1, 'pdf', 'FRM-OPT-FPC-02_Ver._3.13_(Autopush)_LSM_Harian_Sie_Masak_1', 'application/pdf', 1, 'pdf', 'FRM-OPT-FPC-02_Ver._3.13_(Autopush)_LSM_Harian_Sie_Masak_2_Pelayanan,_Minuman1', 'application/pdf', 1, 'pdf', 'FRM-OPT-FPC-01_Ver_312_(Autopush)_LSM_Harian_Sie_Mie1.pdf', 'application/pdf', ''),
('1903221637442174595', 'SOP-FIN-FIN-1.3_Pengeluaran_Kas_Kecil', 'application/msword', 1, 'doc', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'SOP-FIN-FIN-1.pdf', 'application/pdf', 'Prosedur: \nPengeluaran Kas KecilHal.: 1 / 3\nSifat: ConfidentialTgl.: 30 Okt 2018Ver.:1.1 No.: SOP-FIN-FIN-1.3\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATIFransiska K.Prabawa \nFinance Asst. ManagerThomas Aditya\nBPI ManagerAnthony Pamungkas\nGM FAST\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.........................................................................................................................................................................2\n2.RUANG LINGKUP.........................................................................................................................................................2\n3.DEFINISI........................................................................................................................................................................2\n4.REFERENSI..................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.............................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB.......................................................................................................................2\n7.KONDISI KHUSUS / INFORMASI KHUSUS.................................................................................................................4\n8.LAMPIRAN.......................................................................................................................................................................\n9.4\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengeluaran Kas KecilNo.: SOP-FIN-FIN-1.3Ver.: 1.1\nTgl.: 30 Okt 2018Hal.: 2 / 3\n1.TUJUAN\nMengatur Mengatur administrasi pengeluaran Kas Kecil di Store / Department.\n2.RUANG LINGKUP\n1)Pihak Store / Department\n2)Finance Department\n3.DEFINISI\n1)Kas Kecil adalah dana yang disediakan untuk keperluan-keperluan rutin yang nilainya relatif kecil (dibawah Rp.\n300.000,- sekali transaksi).\n2)Bukti Pengeluaran Kas Kecil (BPKK) adalah bukti pengeluaran Kas Kecil per transaksi atau per sekali\npertanggungjawaban.\n3)Ikhtisar Pengeluaran Kas Kecil (IPKK) adalah rangkuman BPKK pada periode tertentu yang digunakan untuk\nmengajukan pengisian kembali kas kecil ke Finance Departemen.\n4)Bukti Pendukung Eksternal (BPE) adalah bukti pendukung pembelian dengan menggunakan kas kecil seperti nota,\nbon atau struk yang dapat dipertanggungjawabkan / ditelusuri keabsahannya.\n5)Pejabat pemegang kas di :\na)Store = Cashier Section Head\nb)DC = Supervisor Department\nc)Food Truck, Booth dan Bazar = Store Supervisor\n4.REFERENSI\n1)FRM-FIN-FIN-4.2.2 Bukti Pengeluaran Kas Kecil\n2)LUK-FIN-FIN-4.2.1 Pengisian Ikhtisar Pengeluaran Kas Kecil\n5.DOKUMEN PENUNJANG\n1)Bukti Pengeluaran Kas Kecil (BPKK)\n2)Ikhtisar Pengeluaran Kas Kecil (IPKK)\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengeluaran Kas KecilNo.: SOP-FIN-FIN-1.3Ver.: 1.1\nTgl.: 30 Okt 2018Hal.: 3 / 3\n6. PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPemohon1.1Melakukan pembayaran atau pembelian, lihat PKP-FIN-FIN-2 Pengeluaran\nDana Kas Kecil :\n1)Meminta Bukti Pendukung Eksternal (BPE) dari Supplier.\n2)Meminta persetujuan pejabat 1 level diatasnya.Max H+1 \njika BSm \natau max \nH+30 jika \nreimburse\nPejabat 1 level \ndiatasnya2.1Menerima BPE dari Pemohon lihat PKP-FIN-FIN-2 Pengeluaran Dana Kas\nKecil:\n1)Menganalisa dan memastikan kesesuaian jumlah pengeluaran pada\nBPE.\n2)Menandatangani BPE sebagai bukti persetujuan.\n3)Menyerahkan kembali ke Pemohon untuk diserahkan ke  Pejabat\npemegang Kas.Max H+1 \njika BSm \natau max \nH+30 jika \nreimburse\nPejabat pemegang \nKas3.1Menerima BPE dari Pemohon dan memastikan BPE terdapat tanda tangan\npejabat 1 level diatas pemohon lihat PKP-FIN-FIN-2 Pengeluaran Dana Kas\nKecil. \n3.2Membuat Bukti Pengeluaran Kas Kecil (BPKK) rangkap 1 (satu), lihat FRM-\nFIN-FIN-4.2.2 Bukti Pengeluaran Kas Kecil:\n1)Menyerahkan uang kepada Pemohon sesuai dengan BPKK.\n2)Meminta tanda tangan Penerima/ Pemohon pada BPKK sebagai\nbukti penerimaan Kas Kecil.\n3)Meminta tanda tangan 1 level diatas pemohon pada BPKK sebagai\nbukti persetujuan.Max H+1\n3.3Mencatat   semua   pengeluaran   Kas   Kecil   ke dalam   aplikasi   Ikhtisar\nPengeluaran Kas Kecil (IPKK), lihat LUK-FIN-FIN-4.2.1 Pengisian Ikhtisar\nPengeluaran Kas Kecil  dan save IPKK yang telah dibuat.  IPKK harus\ndipertanggungjawabkan   maksimal   H+3   dari   tanggal   terakhir   transaksi\ndilakukan.Max H+1\n3.4Menyatukan IPKK, semua BPKK dan BPE serta menyimpannya ke dalam\nbrankas/Cash Box.Max H+1\n7.KONDISI KHUSUS\n-\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1903221637511979170', 'PKP-FIN-FIN-2_Pengeluaran_Dana_Kas_Kecil', 'application/msword', 0, 'doc', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'PKP-FIN-FIN-2_Pengeluaran_Dana_Kas_Kecil.pdf', 'application/pdf', 'Kebijakan: \nPengeluaran Dana Kas KecilDitetapkan Oleh:\nAnthony Pamungkas\nGM FASTDisahkan Oleh:\nJenny Mokhtar    \nBODNomor: PKP-FIN-FIN-2\nTanggal: 01 Nov 2018\nVer.: 1.1\nSifat: Confidential\nPersetujuan Kebijakan:\nJabatanDisetujui OlehParaf\nDirektur / GM Business DevelopmentTammy Tanumihardja\nGM OperationsBudi Purnama\nGM Human ResourcesCynthia F\nGM SupplyAntonius Hendrajaya\nDirektur / GM Engineering & ServicesWidianto\nDirevisi Oleh:\nJabatanNamaParaf\nAsst Finance ManagerFransiska K.P.\n1.Tujuan\nMengatur batas pengeluaran yang boleh disetujui oleh pejabat dalam lingkungan perusahaan agar terdapat suatu\nmetode yang baku mengenai otorisasi dan persetujuan pengeluaran.\n2.Pengertian\nHPengeluaran biaya yang dimaksudkan adalah pemakaian biaya yang diperlukan dalam menjalankan kegiatan\nperusahaan dan untuk mencapai tujuan perusahaan.\nHDaftar Anggaran Pengeluaran (DAP) adalah daftar yang memuat rincian dana secara spesifik yang dapat dikeluarkan\noleh PIC Kas Kecil, dan diketahui oleh 1 level atasannya / PIC tertinggi di Lokasi.\n3.Ruang Lingkup\n1)Supervisor\n2)Manager / Assistant \n3)General Manager\n4)Director\n4.Ketentuan-ketentuan\nHalaman 1 dari 4\nFRM-SYS-GDM-1 Ver.1.2\nKebijakan:\nPengeluaran Dana Kas KecilNo.: PKP-FIN-FIN-2Ver.: 1.1\nTgl: 01 Nov 2018Hal.: 2 / 4\n4.1.Kebijakan\n1)Persetujuan atas pembayaran atau pengeluaran biaya yang menjadi beban perusahaan tidak boleh melebihi batas\nwewenangnya.\n2)Bentuk pertanggungjawaban dan akuntabilitas setiap pejabat perusahaan sekaligus untuk menjamin terciptanya\npengendalian internal yang baik.\n3)Semua transaksi keuangan harus mengacu pada Daftar Otorisasi yang memuat rekomendasi dan persetujuan final\ndari tingkatan pejabat dalam organisasi perusahaan.\n4.2.Batas / Limit Persetujuan\nLIMIT OTORISASIPEJABAT YANG BERWENANG\n      < Rp. 100.000,-Supervisor / Assistant Spv\n      < Rp. 300.000,-SSM / Store Manager / ASM / Area \nManager / Manager / Asst Manager \nDepartment\n      < Rp. 500.000,-General Manager.\n      > Rp. 500.000,-Director\nUntuk transaksi dalam mata uang asing, maka perlu dikonversi ke nilai Rupiah dengan menggunakan kurs dari Finance\nDepartment pada tanggal persetujuan transaksi pembayaran atau pengeluaran biaya.\n4.3.Restriksi Terhadap Limit Persetujuan\n4.3.1.Tidak ada pejabat yang boleh menyetujui pembayaran atau pengeluaran atas transaksi yang dilakukannya sendiri.\nPersetujuan atas pembayaran atau pengeluaran biaya harus dilakukan oleh pejabat yang lebih tinggi hirarki/\nkedudukannya dalam organisasi.\nContoh: Pengeluaran biaya oleh Manager harus disetujui oleh General Manager, dan pengeluaran biaya oleh\nGeneral Manager harus disetujui oleh Director dari Departemen / Divisi / Direktorat yang membutuhkan dana.\n4.3.2.Apabila pejabat yang berwenang berhalangan, maka persetujuannya harus dilakukan oleh atasan pejabat yang\nbersangkutan.\nContoh: Jika Manager berhalangan, maka persetujuannya harus dilakukan oleh General Manager atau Director\nyang bersangkutan.\n4.3.3.Bukti/ Bon Pembayaran tidak boleh dipecah-pecah dan dibuat secara terpisah dengan tujuan untuk menghindari\npersetujuan biaya pejabat diatasnya.\nContoh : Biaya Perbaikan atau Pemeliharaan Kendaraan Rp.350.000,-, tidak boleh dipecah menjadi 2 bon/ kuitansi,\nmasing-masing Rp. 250.000,- dan Rp. 100.000,-, sehingga boleh disetujui oleh Manager.\n4.3.4.Fungsi kontrol atas policy 4.3.3 diatas akan dilakukan melalui mekanisme audit yang dilakukan secara reguler oleh\ndepartemen Internal Audit.\n4.4.Pembayaran atau Pengeluaran Biaya-Biaya yang Tercakup pada Kebijakan Ini\n4.4.1.Batas/ limit persetujuan hanya mencakup pada transaksi rutin sehari-hari yang bersifat biasa dan normal dalam\nrangka kegiatan usaha perusahaan\n4.4.2.Selain transaksi rutin atau transaksi yang belum pernah terjadi, limitasi ini berlaku terbatas pada pembayaran atau\npengeluaran-pengeluaran biaya yang wajar dan dapat dipertanggungjawabkan\nHalaman 2 dari 4\n           FRM-SYS-GDM-1 Ver.1.2\nKebijakan:\nPengeluaran Dana Kas KecilNo.: PKP-FIN-FIN-2Ver.: 1.1\nTgl: 01 Nov 2018Hal.: 3 / 4\n4.4.3.Pembelian semua barang harus melalui Purchasing Department, untuk mendapatkan perbandingan harga pasaran\nyang paling baik dan mendapatkan barang sesuai standar dan kualitas perusahaan\n4.4.4.Pembelian barang yang karena kebutuhan yang penting dan mendesak sehingga menyebabkan berhentinya\noperasional perusahaan, dapat dilakukan oleh store/departemen sendiri dengan rekomendasi dan persetujuan\nPurchasing Department dengan menggunakan Purchase Order.\n4.4.5.Pembelian bahan produksi untuk pembuatan produk Bakmi GM harus memperhatikan Sistem Jaminan Halal yang\nberlaku, oleh karena itu hanya diperbolehkan membeli bahan baku jenis tertentu seperti sayuran.\n4.4.6.Pembelian suku cadang karena rusak pada peralatan atau aset milik dan pembayaran jasa perbaikan barang / alat\nharus diketahui dan direkomendasikan oleh departemen yang berkompeten untuk menilai kewajaran transaksi yang\ndilaksanakan, contoh : perbaikan komputer harus melalui ICT Department, perbaikan peralatan bukan IT harus\nmelalui Engineering Department.\n4.4.7.Pembayaran jasa perbaikan / persewaan barang harus memperhatikan peraturan perpajakan yang berlaku untuk\nperusahaan, untuk itu mohon dikonsultasikan dengan Finance Department.\n4.4.8.Pembelian rutin lokal yang menunjang kegiatan normal perusahaan disesuaikan dengan ketentuan internal yang\nberlaku, contoh: penggantian biaya transpor berdasarkan Tabel Jarak Tempuh, penggantian kue/catering sesuai\nMemo yang berlaku, dll.\n4.4.9.Pengeluaran dana yang dibuatkan Daftar Anggaran Pengeluaran (DAP).\n4.5.Pembayaran atau Pengeluaran Biaya-Biaya yang Tidak Tercakup pada Kebijakan Otorisasi dan Persetujuan\nPengeluaran\nBerikut adalah transaksi-transaksi perusahaan yang spesifik dan tidak termasuk dalam kebijakan pengeluaran dana\nkas kecil ini :\n4.5.1.Capital Expediture\na)Pembelian aktiva tetap.\nb)Penghapusan aktiva tetap.\n4.5.2.Kontrak Kerja\na)Kontrak atau Surat Perintah Kerja (SPK), seperti Kontrak Pembiayaan (Leasing), Kontrak Pembelian atau\nPenjualan.\nb)Sewa ruangan untuk usaha.\n4.5.3.Pembayaran atas Pembelian\na)Barang yang tidak standar.\nb)Jasa\nyJasa yang tidak mendapatkan rekomendasi dari departemen yang berkompeten.\nyJasa yang secara nilai dan manfaatnya lebih besar dari harga aset / perlengkapan yang diperbaiki\nc)Renumerasi\niPembayaran gaji karyawan, tunjangan dan beserta asuransi kesehatan dan asuransi tenaga kerja.\niPerjalanan dinas ke dalam dan luar negeri\niPelatihan, seminar, konferensi, dan kegiatan sejenis\niPembayaran lain-lain ke karyawan harus sesuai dengan kebijakan penggantian yang masih berlaku.\n4.5.4.Penjualan & Komplimen.\niPenentuan harga jual, pemberian undangan / voucher, dan promosi\niPemberian komplimen yang tidak sesuai dengan aturan pemberian komplimen yang berlaku\nHalaman 3 dari 4\n           FRM-SYS-GDM-1 Ver.1.2\nKebijakan:\nPengeluaran Dana Kas KecilNo.: PKP-FIN-FIN-2Ver.: 1.1\nTgl: 01 Nov 2018Hal.: 4 / 4\n4.5.5.Segala bentuk representasi/ perjamuan, pemberian hadiah, donasi/ sumbangan atau biaya-biaya yang sejenis.\n4.5.6.Pengeluaran yang nilainya lebih besar dari limit Kas Kecil\n4.6.Sanksi\nDikarenakan pentingnya kebijakan Otorisasi dan Persetujuan Pengeluaran ini, maka segala bentuk penyimpangan,\npenyelewengan, dan pelanggaran atas kebijakan ini akan mendapatkan sanksi yang berlaku di perusahaan.\n4.7.Pertanggung Jawaban\nPihak-pihak yang bertanggungjawab atas persetujuan pembayaran dan pengeluaran biaya adalah sebagai berikut:\n1.GM Divisi dan / Manager Departemen yang bersangkutan bertanggungjawab atas ketaatan terhadap kebijakan\nOtorisasi dan Persetujuan Pengeluaran. GM dan  /  Manager  juga bertanggungjawab atas kelayakan dan\nkeabsahan atas pengeluaran yang dilakukannya.\n2.Finance Department bertanggungjawab untuk : \ni)Memastikan ketaatan terhadap kelengkapan, keabsahan, dan kebenaran dokumen pendukung pembayaran.\nTermasuk didalamnya keakuratan perhitungan biayanya dan meyakini bahwa dokumen pembayaran telah\ndisetujui oleh pejabat yang berwenang.\nii)Mencegah terjadinya pembayaran ganda, kelebihan pembayaran atau pembayaran-pembayaran yang tidak\ndilengkapi dengan dokumen pembayaran yang asli, valid, dan tidak sebagaimana mestinya.\n3.GM FAST harus memastikan bahwa Finance Department menjalankan fungsinya dengan baik dan benar, dengan\nsecara acak memeriksa dan mengecek beberapa transaksi.\n5.SOP dan Form yang terkait\n-\n6.Efektif Berlaku\nKebijakan ini berlaku tanggal 01 November 2018. Apabila dalam pelaksanaannya terdapat hal-hal yang memerlukan\npengaturan lebih lanjut baik hal-hal yang bersifat teknis dan prosedural maupun terhadap hal-hal baru yang timbul\nkemudian, maka akan dikeluarkan kebijakan baru sebagai kelengkapan dari kebijakan ini.\nHalaman 4 dari 4\n           FRM-SYS-GDM-1 Ver.1.2'),
('1903221643485217289', 'FRM-ERP-SPL-01_Ver._1.2_Petunjuk_Pengisian_Form_Pengajuan_Kode_Barang_(upload)1', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'FRM-ERP-SPL-01.pdf', 'application/pdf', ' Form:   \nFormulir Pengajuan Kode Barang (PKB) \n \nNo : FRM-ERP-SPL-01 \nVer.: 1.2  Hal.: 1 / 4 Dibuat oleh: \n \n Disetujui oleh: Tgl.: 25 Maret 2014 \nPT. GRIYA MIESEJATI Siu Lian \nSysDev.Manager Budi Purnama \nGM Operations Sifat: Classified / General \n \nFRM-SYS-GDM-4.3 Ver.1.0 \n\n \nTeruskan dokumen sesuai no.urut tiap section \nuntuk pengisian data\n1.\n ?  VI. ACCOUNTING Section\nItem Code         1.\nProduct Line2.,  Description  :  ( ______________Tgl________ )\n ?  V.  COSTING Section\nBOM Code:1.\nItem Phantom\n2.\nYes (Isi data dibawah),\n¦   Item Code  :   ...................................\n¦   Item Name :   ...................................\nNo\nItem Type\n3........................., Desc.: ............................ \n¦   BOM Code : .......................................\nDiperiksa:\nCosting Manager/Ast.,\nDiperiksa Oleh:\nAccounting Manager/ Ast,Input ke Sistem Oleh:\nTidak ada\nBaru / Update\n                                                                                                                                                         FRM -ERP-SPL-01  Ver.1.2\nDilampirkan form Perubahan BoM\n4.Permintaan GMR     DO   /     PR     /     PO\nUM Main          1.\n2.Material Requirement Planning :\n Alasan penambahan item code, \nItem Name1.\n ?  I. REQUESTORSection\nUM Purchase            2.\n3.\nLead Time               4.\nMinimum Order     5.\nMultiple Order     6.Rp ..................\nUSD / SIN ............., per ............\nTax 10 %, Non TaxPrice Table Code  :  ................... Item Class A : Yes / No\n(UM Main)\n(UM Main)\nPrice List Maintenance :                         (Harga sesuai UM Main)\n  ¦   Supplier Code:  ..................\n¦   Supplier Name:  ..................................\nBuyer / Staff  2.\n(Days)\n ?  III.  WAREHOUSE Section\nSafety stock \n(UM Main)GMS:3.\nPackaging Conversion :2.\n¦  (UM PCH) ............ ? (UM Main) ........ x (Konversi) ........ \n¦   Master Schedule  :  \nYes,No\n¦   Order Policy  : .............¦  Order Period : ............(Days)\n¦   Plan Order           :  Yes (Isi Order Policy & Period),No\nNew (Masukkan data lengkap di QAD),Existing\nDiscount item:  ..............  %¦  (UM TR2) ........... ? (UM Main) ......... x (Konversi) ........ ¦  (UM TR1) ............ ? (UM Main) ........ x (Konversi) ........ \n3.NewSubstitute\n.....................................................................................\nBila substitusi, menggantikan Kode & Nama Barang: ................\n.....................................................................................\nType *Manufacture  /  Purchase  /  Distribution5.\nGMR:\nSupplier Maintenance :\nGMS:Loc.3.GMR:\nLokasi penggunaan item: (*Create pada domain GMR & PRM).4.\nItem Standar KP; Dept. .........\nItem Standar Store*\nItem Produksi (bahan baku) KP\nItem Produksi (bahan baku) Store*\n1.\n¦   ........................ &......................................................Bila substitusi, item yang digantikan, Code & Name:\n¦  Status:\nActive, per tgl .......Non Active, per tgl ......\nMaterial Replace, per tgl ........\n ?  IV.  PURCHASING Section\n ?  II. PPIC Section\nDiajukan oleh:\nManager /Ast._________,\n( ___________________)\n( ______________Tgl________ )III. Warehouse Manager /Ast.IV. Purchasing Manager /Ast.II. PPIC Manager/Ast.\n( ______________Tgl________ )\n( ______________Tgl________ ) ( ______________Tgl________ )V. GM Supply\n( ______________Tgl________ ) ( ______________Tgl________ )( ___________Tgl____)\nPENGAJUAN KODE BARANG\nNo. PKB :\nTanggal :  /      /\n\n       Barang Perlengkapan Dapur / \nResto / Spare part.\nLampirkan form Standarisasi & \nkirimkan form ke Sysdev.Form standarisasi diterima oleh:Manager /Ast. SysDev.,\n( ___________________)5\n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 2/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \nFungsi: \nMengumpulkan  data-data  yang  berkaitan  dengan  barang  baru,  dari  beberapa  departemen,  yang  diperlukan  dalam \npembuatan kode barang dalam sistem. \n\n \nPetunjuk Pengisian: \n\n \nNo.\n Kolom Diisi dengan \n1 No.PKB Nomor urut formulir. \n2  Tanggal  Tanggal pengisian formulir. \nI. REQUESTOR Section \n1  Item Name  Nama barang yang baru. \n2  UM Purchase Satuan pembelian ke supplier. \n3 Alasan pengajuan kode barang Diisi dengan alasan pengajuan kode barang dan apakah kode barang baru \natau menggantikan; dan alasannya. \nBila menggantikan, isi juga kode dan nama barang yang digantikan. \n4 Lokasi Penggunaan Item Beri tanda centang pada pilihan ini (bisa lebih dari 1jenis). \nDengan definisi pilihan lokasi penggunaan item sbb: \n? Item Standar KP; Dept....: barang menjadi item standar di dept. ybs. \n? Item Standar Store: barang menjadi item standar/ digunakan di store (& \nKP). \n? Item Produksi (bahan baku) KP: barang digunakan sebagai bahan baku di \nProduksi -KP. \n? Item Produksi (bahan baku) Store: barang digunakan sebagai bahan baku \ndi Store. \nBila barang digunakan di store, maka kode barang dibuatkan di GMR dan \nstore Puri (PRM). \n  Diajukan oleh Manager / Ast. Tanda tangan oleh Manager atau Asisten yang mengajukan kode barang. \n5 Barang Perlengkapan Dapur / Resto \n/ Spare part \nBila barang termasuk jenis barang yang disebutkan, beri tanda centang pada \nkotak yang disebutkan. \nDan disertai dengan pengisian form standarisasi perlengkapan. \n  Keterangan: \n  1. Ukuran                  : A4, Portrait \n  2. Rangkap               : 1 \n  3. Cara Pengisian     : Ditulis \n  4. Cara Pengarsipan: 1. Accounting \n  2. Costing \n  3. PPIC \n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 3/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \nNo. Kolom Diisi dengan \n Form standarisasi diterima oleh \nManager/ Ast. \nTanda tangan oleh Manager atau Asisten yang menerima form untuk \ndilanjutkan dengan pembaruan data di Web Catalog. \n \nII. PPIC Section \nII.1 Bila Item Substitusi Kode dan nama barang yang digantikan dan tanggal pergantian status. \nII.2 Material Requirement Planning Jika item diperhitungkan dalam proses MRP, maka centang Master Schedule \n"Yes", jika tidak "No".  \nJika item diperhitungkan dalam proses Order, maka centang "Yes" lalu isi \norder policy dengan "EOQ" dan berapa hari periodenya. \nII.3 Safety Stock Jumlah safety stock barang dalam satuan dasar (UM Main) untuk masing-\nmasing domain (GMS & GMR). \nII.4 Permintaan GMR Pilih salah satu tipe permintaan store Puri ke PPIC -KP  \n? DO: Distribustion Order \n? PR: Purchase Request \n? PO: Purchase Order \nII.5 Type Pilih salah satu tipe pengadaan barang, yaitu: \n? Manufacture: produksi \n? Purchase: pembelian ke supplier \n? Distribution: distribusi dari Kantor Pusat \n Baris Paraf: \nII. PPIC Manager / Ast. \nTanda tangan oleh Manager atau Asisten PPIC atas persetujuan data kode \nbarang baru. \nIII. WAREHOUSE Section \nIII.1 UM Main Satuan dasar (satuan terkecil). \nIII.2 Packaging Conversion Angka konversi dari satuan kemasan ke satuan dasar. \nIII.3 Location Nama lokasi gudang untuk penyimpanan barang GMS dan GMR. \n Baris Paraf: \nIII. Warehouse Manager / Ast. \nTanda tangan oleh Manager atau Asisten Warehouse atas persetujuan data \nkode barang baru. \nIV. PURCHASING Section \nIV.1 Supplier Maintenance Bila supplier baru, maka buat data supplier dengan baru di QAD. \nBila dari supplier yang sudah ada, maka daftar barang baru ke dalam list \nbarang supplier tsb. \nIV.2 Buyer Staff Staf Pembelian yang ditugaskan. \n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 4/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \nNo. Kolom Diisi dengan \nIV.3 Price List Maintenace ? Price Table Code : Isi kode Price List di QAD. \n? Class: Isi dengan "A", jika bahan baku / pendukung merupakan item \nkritikal. \n? Rp / USD : Isi harga bahan baku / pendukung sesuai dengan satuan beli. \n? Tax : Informasi pengenaan pajak 10 % atau tidak atas pembelian barang. \n? Discount Item: Isi besar diskon yang diberikan supplier. \nIV.4 Lead Time Batas waktu dari pembuatan PO sampai dengan pengiriman barang supplier. \nIV.5 Minimum Order Jumlah minimum order ke supplier. \nIV.6 Multiplle Order Kelipatan order sesuai dengan satuan dasar. \n Baris Paraf: \nIV. Purchasing Manager / Ast. \nTanda tangan oleh Manager atau Asisten Purchasing atas persetujuan data \nkode barang baru. \nV. COSTING Section \nV.1 Item Type Kode dan nama jenis item type, disesuaikan dengan item type di Laporan \nStok Malam (LSM). \nV.2 BOM Code Tanda centang (?) pada kotak yang sesuai, bila barang memiliki BOM atau \ntidak. \nBila memiliki dengan BOM, dilampirkan dengan form Perubahan BOM. \nV.3 Item Phantom ? Bila barang memiliki substitusi dan masuk dalam BOM, maka barang \nakan diberi tipe "Phantom". \n? Beri tanda centang (?) pada kotak yang sesuai, bila barang termasuk \ntipe "Phantom" atau tidak. \nBila phantom, isilah kode, nama barang dan kode BOM dari barang yang \ndigantikan. \n Diperiksa Oleh Paraf dan nama jelas Costing Manager / Assistant yang memeriksa dan \nmengisi data. \nVI. ACCOUNTING Section \nVI.1 Item Code Kode barang sesuai dengan sistematika format kode barang. \nVI.2 Product Line Product line sesuai dengan kategori yang sudah ditetapkan. \n Input ke Sistem Oleh Paraf & nama jelas karyawan yang mendata pada QAD. \n Diperiksa Oleh Paraf dan nama jelas Accounting Manager / Assistant yang memeriksa hasil \ninput data di QAD. \n \n \n\n \n\n '),
('1903221645108347192', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 'PENGISIAN DATA BPJS KESEHATAN\r\n\r\n'),
('1903221705362472794', 'FRM-ERP-SPL-01_Ver._1.2_Petunjuk_Pengisian_Form_Pengajuan_Kode_Barang_(upload)2', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'FRM-ERP-SPL-011.pdf', 'application/pdf', ' Form:   \nFormulir Pengajuan Kode Barang (PKB) \n \nNo : FRM-ERP-SPL-01 \nVer.: 1.2  Hal.: 1 / 4 Dibuat oleh: \n \n Disetujui oleh: Tgl.: 25 Maret 2014 \nPT. GRIYA MIESEJATI Siu Lian \nSysDev.Manager Budi Purnama \nGM Operations Sifat: Classified / General \n \nFRM-SYS-GDM-4.3 Ver.1.0 \n\n \nTeruskan dokumen sesuai no.urut tiap section \nuntuk pengisian data\n1.\n ?  VI. ACCOUNTING Section\nItem Code         1.\nProduct Line2.,  Description  :  ( ______________Tgl________ )\n ?  V.  COSTING Section\nBOM Code:1.\nItem Phantom\n2.\nYes (Isi data dibawah),\n¦   Item Code  :   ...................................\n¦   Item Name :   ...................................\nNo\nItem Type\n3........................., Desc.: ............................ \n¦   BOM Code : .......................................\nDiperiksa:\nCosting Manager/Ast.,\nDiperiksa Oleh:\nAccounting Manager/ Ast,Input ke Sistem Oleh:\nTidak ada\nBaru / Update\n                                                                                                                                                         FRM -ERP-SPL-01  Ver.1.2\nDilampirkan form Perubahan BoM\n4.Permintaan GMR     DO   /     PR     /     PO\nUM Main          1.\n2.Material Requirement Planning :\n Alasan penambahan item code, \nItem Name1.\n ?  I. REQUESTORSection\nUM Purchase            2.\n3.\nLead Time               4.\nMinimum Order     5.\nMultiple Order     6.Rp ..................\nUSD / SIN ............., per ............\nTax 10 %, Non TaxPrice Table Code  :  ................... Item Class A : Yes / No\n(UM Main)\n(UM Main)\nPrice List Maintenance :                         (Harga sesuai UM Main)\n  ¦   Supplier Code:  ..................\n¦   Supplier Name:  ..................................\nBuyer / Staff  2.\n(Days)\n ?  III.  WAREHOUSE Section\nSafety stock \n(UM Main)GMS:3.\nPackaging Conversion :2.\n¦  (UM PCH) ............ ? (UM Main) ........ x (Konversi) ........ \n¦   Master Schedule  :  \nYes,No\n¦   Order Policy  : .............¦  Order Period : ............(Days)\n¦   Plan Order           :  Yes (Isi Order Policy & Period),No\nNew (Masukkan data lengkap di QAD),Existing\nDiscount item:  ..............  %¦  (UM TR2) ........... ? (UM Main) ......... x (Konversi) ........ ¦  (UM TR1) ............ ? (UM Main) ........ x (Konversi) ........ \n3.NewSubstitute\n.....................................................................................\nBila substitusi, menggantikan Kode & Nama Barang: ................\n.....................................................................................\nType *Manufacture  /  Purchase  /  Distribution5.\nGMR:\nSupplier Maintenance :\nGMS:Loc.3.GMR:\nLokasi penggunaan item: (*Create pada domain GMR & PRM).4.\nItem Standar KP; Dept. .........\nItem Standar Store*\nItem Produksi (bahan baku) KP\nItem Produksi (bahan baku) Store*\n1.\n¦   ........................ &......................................................Bila substitusi, item yang digantikan, Code & Name:\n¦  Status:\nActive, per tgl .......Non Active, per tgl ......\nMaterial Replace, per tgl ........\n ?  IV.  PURCHASING Section\n ?  II. PPIC Section\nDiajukan oleh:\nManager /Ast._________,\n( ___________________)\n( ______________Tgl________ )III. Warehouse Manager /Ast.IV. Purchasing Manager /Ast.II. PPIC Manager/Ast.\n( ______________Tgl________ )\n( ______________Tgl________ ) ( ______________Tgl________ )V. GM Supply\n( ______________Tgl________ ) ( ______________Tgl________ )( ___________Tgl____)\nPENGAJUAN KODE BARANG\nNo. PKB :\nTanggal :  /      /\n\n       Barang Perlengkapan Dapur / \nResto / Spare part.\nLampirkan form Standarisasi & \nkirimkan form ke Sysdev.Form standarisasi diterima oleh:Manager /Ast. SysDev.,\n( ___________________)5\n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 2/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \nFungsi: \nMengumpulkan  data-data  yang  berkaitan  dengan  barang  baru,  dari  beberapa  departemen,  yang  diperlukan  dalam \npembuatan kode barang dalam sistem. \n\n \nPetunjuk Pengisian: \n\n \nNo.\n Kolom Diisi dengan \n1 No.PKB Nomor urut formulir. \n2  Tanggal  Tanggal pengisian formulir. \nI. REQUESTOR Section \n1  Item Name  Nama barang yang baru. \n2  UM Purchase Satuan pembelian ke supplier. \n3 Alasan pengajuan kode barang Diisi dengan alasan pengajuan kode barang dan apakah kode barang baru \natau menggantikan; dan alasannya. \nBila menggantikan, isi juga kode dan nama barang yang digantikan. \n4 Lokasi Penggunaan Item Beri tanda centang pada pilihan ini (bisa lebih dari 1jenis). \nDengan definisi pilihan lokasi penggunaan item sbb: \n? Item Standar KP; Dept....: barang menjadi item standar di dept. ybs. \n? Item Standar Store: barang menjadi item standar/ digunakan di store (& \nKP). \n? Item Produksi (bahan baku) KP: barang digunakan sebagai bahan baku di \nProduksi -KP. \n? Item Produksi (bahan baku) Store: barang digunakan sebagai bahan baku \ndi Store. \nBila barang digunakan di store, maka kode barang dibuatkan di GMR dan \nstore Puri (PRM). \n  Diajukan oleh Manager / Ast. Tanda tangan oleh Manager atau Asisten yang mengajukan kode barang. \n5 Barang Perlengkapan Dapur / Resto \n/ Spare part \nBila barang termasuk jenis barang yang disebutkan, beri tanda centang pada \nkotak yang disebutkan. \nDan disertai dengan pengisian form standarisasi perlengkapan. \n  Keterangan: \n  1. Ukuran                  : A4, Portrait \n  2. Rangkap               : 1 \n  3. Cara Pengisian     : Ditulis \n  4. Cara Pengarsipan: 1. Accounting \n  2. Costing \n  3. PPIC \n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 3/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \nNo. Kolom Diisi dengan \n Form standarisasi diterima oleh \nManager/ Ast. \nTanda tangan oleh Manager atau Asisten yang menerima form untuk \ndilanjutkan dengan pembaruan data di Web Catalog. \n \nII. PPIC Section \nII.1 Bila Item Substitusi Kode dan nama barang yang digantikan dan tanggal pergantian status. \nII.2 Material Requirement Planning Jika item diperhitungkan dalam proses MRP, maka centang Master Schedule \n"Yes", jika tidak "No".  \nJika item diperhitungkan dalam proses Order, maka centang "Yes" lalu isi \norder policy dengan "EOQ" dan berapa hari periodenya. \nII.3 Safety Stock Jumlah safety stock barang dalam satuan dasar (UM Main) untuk masing-\nmasing domain (GMS & GMR). \nII.4 Permintaan GMR Pilih salah satu tipe permintaan store Puri ke PPIC -KP  \n? DO: Distribustion Order \n? PR: Purchase Request \n? PO: Purchase Order \nII.5 Type Pilih salah satu tipe pengadaan barang, yaitu: \n? Manufacture: produksi \n? Purchase: pembelian ke supplier \n? Distribution: distribusi dari Kantor Pusat \n Baris Paraf: \nII. PPIC Manager / Ast. \nTanda tangan oleh Manager atau Asisten PPIC atas persetujuan data kode \nbarang baru. \nIII. WAREHOUSE Section \nIII.1 UM Main Satuan dasar (satuan terkecil). \nIII.2 Packaging Conversion Angka konversi dari satuan kemasan ke satuan dasar. \nIII.3 Location Nama lokasi gudang untuk penyimpanan barang GMS dan GMR. \n Baris Paraf: \nIII. Warehouse Manager / Ast. \nTanda tangan oleh Manager atau Asisten Warehouse atas persetujuan data \nkode barang baru. \nIV. PURCHASING Section \nIV.1 Supplier Maintenance Bila supplier baru, maka buat data supplier dengan baru di QAD. \nBila dari supplier yang sudah ada, maka daftar barang baru ke dalam list \nbarang supplier tsb. \nIV.2 Buyer Staff Staf Pembelian yang ditugaskan. \n\n \nForm:  \nFormulir Pengajuan Kode Barang (PKB) \nNo.: FRM-ERP-SPL-01  Ver.: 1.2 \nTgl.: 25 Maret 2014 Hal.: 4/4 \n \nFRM-SYS-GDM-4.3 Ver.1.0 \nNo. Kolom Diisi dengan \nIV.3 Price List Maintenace ? Price Table Code : Isi kode Price List di QAD. \n? Class: Isi dengan "A", jika bahan baku / pendukung merupakan item \nkritikal. \n? Rp / USD : Isi harga bahan baku / pendukung sesuai dengan satuan beli. \n? Tax : Informasi pengenaan pajak 10 % atau tidak atas pembelian barang. \n? Discount Item: Isi besar diskon yang diberikan supplier. \nIV.4 Lead Time Batas waktu dari pembuatan PO sampai dengan pengiriman barang supplier. \nIV.5 Minimum Order Jumlah minimum order ke supplier. \nIV.6 Multiplle Order Kelipatan order sesuai dengan satuan dasar. \n Baris Paraf: \nIV. Purchasing Manager / Ast. \nTanda tangan oleh Manager atau Asisten Purchasing atas persetujuan data \nkode barang baru. \nV. COSTING Section \nV.1 Item Type Kode dan nama jenis item type, disesuaikan dengan item type di Laporan \nStok Malam (LSM). \nV.2 BOM Code Tanda centang (?) pada kotak yang sesuai, bila barang memiliki BOM atau \ntidak. \nBila memiliki dengan BOM, dilampirkan dengan form Perubahan BOM. \nV.3 Item Phantom ? Bila barang memiliki substitusi dan masuk dalam BOM, maka barang \nakan diberi tipe "Phantom". \n? Beri tanda centang (?) pada kotak yang sesuai, bila barang termasuk \ntipe "Phantom" atau tidak. \nBila phantom, isilah kode, nama barang dan kode BOM dari barang yang \ndigantikan. \n Diperiksa Oleh Paraf dan nama jelas Costing Manager / Assistant yang memeriksa dan \nmengisi data. \nVI. ACCOUNTING Section \nVI.1 Item Code Kode barang sesuai dengan sistematika format kode barang. \nVI.2 Product Line Product line sesuai dengan kategori yang sudah ditetapkan. \n Input ke Sistem Oleh Paraf & nama jelas karyawan yang mendata pada QAD. \n Diperiksa Oleh Paraf dan nama jelas Accounting Manager / Assistant yang memeriksa hasil \ninput data di QAD. \n \n \n\n \n\n '),
('1903221708013233733', 'SOP-HSP-ERM-3.3_Administrasi_Penggantian_Biaya_Kegiatan_Olahraga_dan_Musik1', 'application/msword', 0, 'doc', 'SLA-HSP-ERM-3.3_Administrasi_Penggantian_Biaya_Kegiatan_Olahraga_dan_Musik1', 'application/vnd.oasis.opendocument.text', 0, 'odt', 'SOP-HSP-ERM-3.3_Administrasi_Penggantian_Biaya_Kegiatan_Olahraga_dan_Musik', 'application/vnd.visio', 0, 'vsd', 'dok_persetujuan_Administrasi_Penggantian_Biaya_Kegiatan_Olahraga_dan_Musik.pdf', 'application/pdf', 'Prosedur: \nAdministrasi Penggantian Biaya Kegiatan Olahraga & MusikHal.: 1 / 3\nKerahasiaan: ConfidentialTgl.: 23.10.2018Ver.: 1.0No.: SOP-HSP-ERM-3.3\nDibuat oleh:\nAditya Wardiman\nAsst. HR Support ManagerDitinjau oleh:\nThomas Aditya\nBPI ManagerDisetujui oleh:\nCynthia Fellicianne\nHR General ManagerPT. GRIYA MIESEJATI\nDiterapkan dan Disetujui oleh:\nDivisi / DepartemenDisetujui olehTanda Tangan\n Store Operation Budi Purnama\n Business Developmenta/n Tammy Tanumihardja\n Human ResourcesCynthia Fellicianne\n Engineering & Servicesa/n Widianto\nSupplyAntonius Hendrajaya\nFinance, Accounting, Costing,\nPlan&Budget & IT Anthony Pamungkas\nTanggal Efektif :           01 November 2018\nDAFTAR ISI1.TUJUAN...............................................................................................................................................................................2\n2.RUANG LINGKUP................................................................................................................................................................2\n3.DEFINISI..............................................................................................................................................................................2\n4.REFERENSI.........................................................................................................................................................................2\n5.DOKUMEN PENUNJANG....................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB..............................................................................................................................2\n7.KONDISI KHUSUS/INFORMASI KHUSUS..........................................................................................................................3\n8.LAMPIRAN...........................................................................................................................................................................3\nFRM-SYS-GDM-3.1.3 Ver.1.3\nProsedur: \nAdministrasi Penggantian Biaya Kegiatan Olahraga\ndan MusikNo: SOP-HSP-ERM-3.3Ver.: 1.0\nTgl.: 23 Oktober 2018Hal.: 2 / 3\n1.TUJUAN\nMengadministrasikan permintaan penggantian biaya yang digunakan pada kegiatan olahraga dan musik. \n2.RUANG LINGKUP\na.Store Operation - Luar Kota\nb.Distribution Center - Luar Kota\n3.DEFINISI\na.Kegiatan Olahraga dan Musik:Adalah kegiatan Olahraga (Badminton atau Futsal) dan atau  \nBermusik (Latihan Band) yang dilakukan oleh Pekerja Bakmi GM \nsecara bersama-sama, yang bertujuan untuk bersilaturahmi antar \npekerja dan meningkatkan keterikatan (engagement) pekerja dengan\nPerusahaan.\n4.REFERENSI\na.PKP-SYS-GDM-1: Pernyataan Kebijakan Perusahaan - Manajemen Dokumen.\nb.BPM-HSP-ERM-1: Business Process Mapping - Employee Relation.\nc.SOP-HSP-ERM-3.1: Prosedur Pengajuan Penggantian Biaya Kegiatan Olahraga dan Musik (Jabodetabek).\nd.SOP-HSP-ERM-3.2: Prosedur Pengajuan Penggantian Biaya Kegiatan Olahraga dan Musik (Luar Kota).\ne.MNL-HRS-KMS-01: Manual Aplikasi Service Desk - Requester\n5.DOKUMEN PENUNJANG\na.FRM-HSP-ERM-3.3.1: Formulir Permohonan Transfer - Biaya Kegiatan Olahraga dan Musik.\n6.PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nEmployee Relation \nSpecialist1.Masuk dari Prosedur Pengajuan Penggantian Biaya Kegiatan Olahraga\ndan Musik (Jabodetabek) dan Prosedur Pengajuan Penggantian Biaya\nKegiatan Olahraga dan Musik (Luar Kota).\nMelakukan :\n1.Menarik dan memfollow-up request via Service Desk.\n2.Mengadministrasikan data kegiatan olahraga dan musik.\n3.Menyiapkan Form Permohonan Transfer - Biaya Kegiatan Olahraga\ndan Musik dan Kuitansi Kegiatan, lalu meminta persetujuan Asst. HSP\nManager.Setiap hari\nRabu\nAsst. HSP Manager2.Menerima FPT-BKOM dan Kuitansi. Lalu memeriksa :\na.Apabila menyetujui, maka lanjut ke Kegiatan 3\nb.Apabila   tidak   menyetujui,   maka   menginformasikan   kesalahan\ndata/dokumen kepada Employee Relation SpecialistSetiap hari\nKamis\nEmployee Relation \nSpecialist3.Merevisi kesalahan data / dokumen, lalu menyerahkan ke Asst. HSP\nManager. Kembali ke Kegiatan 2.30 menit\nAsst. HSP Manager4.Menandatangani FPT-BKOM dan Kuitansi.Setiap hari\nKamis\nFRM-SYS-GDM-3.1.3 Ver.1.3\nProsedur: \nAdministrasi Penggantian Biaya Kegiatan Olahraga\ndan MusikNo: SOP-HSP-ERM-3.3Ver.: 1.0\nTgl.: 23 Oktober 2018Hal.: 3 / 3\nDilakukan olehKegiatanWaktu\nEmployee Relation \nSpecialist5.Melakukan :\n1.Mengirim konfirmasi penggantian biaya kegiatan olahraga dan musik\nkepada Store/Dept Pemohon.\n2.Menyerahkan FBT-BKOM dan Kuitansi ke Finance Supervisor.Sesuai SLA\nManager on Duty (MoD) \nStore/Dept Pemohon6.Menerima konfirmasi penggantian biaya kegiatan olahraga dan musik.\nArsip.Sesuai SLA\nFinance Supervisor7.Menerima FPT-BKOM dan Kuitansi. Lalu masuk ke  SOP-FIN-FIN-6.3\nProsedur Penerimaan Faktur dari Departemen.Sesuai SLA\n8.Setelah proses transfer selesai, kemudian menginformasikan selesainya\nproses transfer kepada Employee Relation Specialist.Sesuai SLA\nEmployee Relation \nSpecialist9.Melakukan :\n1.Menginformasikan  selesainya  proses  transfer kepada Store/Dept\nPemohon.\n2.Mengupdate status request pada Service Desk menjadi "Resolved".\n3.Apabila tidak ada feedback, kemudian mengupdate status request\npada Service Desk menjadi "Closed".Sesuai SLA\nCashier Section Head / \nPIC Dept10.Melakukan :\n1.Mengambil uang tunai dari rekening ATM Petty Cash Bank Mandiri\n(Store) / Finance Supervisor (Kantor Pusat).\n2.Menyerahkan uang kepada PIC Kegiatan Olahraga dan Musik.\nSelesai.Sesaat\nsetelah\npenerimaan\ninformasi\n7.KONDISI KHUSUS/INFORMASI KHUSUS\n-\n8.LAMPIRAN\nBagan terlampir.\nFRM-SYS-GDM-3.1.3 Ver.1.3'),
('1903271005521122252', 'JBS-HRD-HSP-05_Employee_Relation_Specialist1', 'application/msword', 1, 'doc', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', '                                        JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :1 / 3\nNo. Dokumen:JBS-HRD-HSP-05\nVersi & Tgl. Berlaku:1.0 & 11 Sep. 2017\nDibuat Oleh:Ditinjau Oleh:Disetujui Oleh:\nNama : Aditya WardimanNama: Cynthia FellicianneNama: Peily Dian Lie\nTanggal: 11 September 2017Tanggal: Tanggal:\n1.IDENTITAS JABATAN\nNama JabatanEmployee Relation Specialist\nDivisiHuman Resources\nDepartemen HR Support\nKedudukan dalam Organisasi\na.Atasan Langsung\nb.Bawahan LangsungAssistant HR Support Manager \n-\n2.TUJUAN UTAMA JABATAN\nTerlaksananya kegiatan Employee Engagement dan Implementasi Nilai Budaya di Perusahaan Bakmi GM. \n3.TUGAS & TANGGUNG JAWAB  \nTerlaksananya kegiatan Employee Engagement dan Implementasi Nilai Budaya di Perusahaan Bakmi GM, dengan\nmelakukan dan bertanggung jawab atas:\n3.1.Tugas dan Tanggung Jawab terkait Kegiatan Employee Engagement :\na.Membantu Asst. HR Support Manager dalam merencanakan Program Employee Engagement Corporate.\nb.Membantu   Store/Dept   Manager   dalam   merencanakan   dan   melaksanakan   Program   Employee\nEngagement Local.\nc.Membantu  pelaksanaan  seluruh kegiatan  Employee Engagement  Corporate  yang telah disetujui\nManagement. Mulai dari perencanaan, pemilihan vendor, permintaan dan pengelolaan anggaran,\npelaksanaan lapangan dan pelaporan.\nd.Memonitor pelaksanaan Program Employee Engagement (Local) dan melakukan kunjungan ke Store dan\nDept. KP. Lalu membuat laporan dari kunjungan tersebut.\ne.Melaksanakan survey-survey yang dapat meningkatkan kepuasan dan pelayanan HR Support kepada\nseluruh Pekerja.\n                                        JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :2 / 3\nNo. Dokumen:JBS-HRD-HSP-03\nVersi & Tgl. Berlaku:1.0 & 01 Jan. 2017\nf.Membantu proses penyiapan data, pengelolaan data dan pelaporan kegiatan Employee Engagement\nCorporate dan Local. Termasuk diantaranya adalah mengelola proses Reimbursement Kegiatan Olahraga\ndan Musik.\ng.Mengelola Social Media Kekaryawanan Perusahaan (Facebook & Instagram).\n3.2.Tugas dan Tanggung Jawab terkait Kegiatan Implementasi Nilai Budaya Bakmi GM :\na.Membantu Asst. HR Support Manager dalam merencanakan Kegiatan Implementasi Nilai Budaya Bakmi\nGM Corporate.\nb.Membantu Store/Dept Manager dalam merencanakan Kegiatan Implementasi Nilai Budaya Bakmi GM\nLocal.\nc.Membantu pelaksanaan seluruh kegiatan Implementasi Nilai Budaya Bakmi GM Corporate, mulai dari\nperencanaan, pemilihan vendor, permintaan dan pengelolaan anggaran, pelaksanaan lapangan dan\npelaporan.\nd.Memonitor pelaksanaan Implementasi Nilai Budaya Bakmi GM Local dan melakukan kunjungan ke Store\ndan Dept. KP. Lalu membuat laporan dari kunjungan tersebut.\n4.WEWENANG JABATAN\n-\n5.HUBUNGAN KERJA\nEKSTERNALTUJUAN\nVendor Barang dan JasaKomunikasi terkait desain, jumlah dan waktu pengiriman\nINTERNALTUJUAN\nDepartemen KPSupport pelaksanaan Program Employee Engagement\ndan Implementasi Nilai Budaya Bakmi GM Lokal.\nStore OperationSupport pelaksanaan Program Employee Engagement\ndan Implementasi Nilai Budaya Bakmi GM Lokal.\nDepartemen FinanceKoordinasi pembayaran tagihan.\n6.SPESIFIKASI JABATAN\n6.1.\n5.1.Pendidikan, Pelatihan, Ketrampilan, dan Pengalaman:\n                                        JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :3 / 3\nNo. Dokumen:JBS-HRD-HSP-03\nVersi & Tgl. Berlaku:1.0 & 01 Jan. 2017\n6.1.1.Pendidikan: minimal S1 semua jurusan. Lebih diutamakan lulusan Communication / Public Relation.\n6.1.2. Pengalaman: minimal 1 tahun dalam bidang yang sama.\n6.1.3.Ketrampilan teknis: MS Office, Desain Grafis, Statistik (Pembuatan Laporan).\n6.1.4.Ketrampilan non teknis: Komunikasi, Social Media.\n6.1.5.Ketrampilan managerial: Planning.\n6.2.Kondisi Fisik:\n6.2.3.Jenis kelamin Pria/Wanita\n6.2.4.Tidak buta warna.\n6.2.5.Umur maksimal 30 tahun.\n6.2.6.Berbadan sehat.\n6.3.Lain-lain \n6.3.3.Domisili Jabodetabek.\n6.3.4.Sanggup menghadiri kegiatan Store yang diadakan pada malam hari dan selesai pada tengah malam.'),
('1903271100144059466', 'SOP-FIN-FIN-1.3_Pengeluaran_Kas_Kecil1', 'application/msword', 1, 'doc', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'SOP-FIN-FIN-11.pdf', 'application/pdf', 'Prosedur: \nPengeluaran Kas KecilHal.: 1 / 3\nSifat: ConfidentialTgl.: 30 Okt 2018Ver.:1.1 No.: SOP-FIN-FIN-1.3\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATIFransiska K.Prabawa \nFinance Asst. ManagerThomas Aditya\nBPI ManagerAnthony Pamungkas\nGM FAST\nTanggal Efektif:                                                   \nNo. Copy Dokumen:                                                   \nDistribusi ke:                                                   \nDAFTAR ISI\n1.TUJUAN.........................................................................................................................................................................2\n2.RUANG LINGKUP.........................................................................................................................................................2\n3.DEFINISI........................................................................................................................................................................2\n4.REFERENSI..................................................................................................................................................................2\n5.DOKUMEN PENUNJANG.............................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB.......................................................................................................................2\n7.KONDISI KHUSUS / INFORMASI KHUSUS.................................................................................................................4\n8.LAMPIRAN.......................................................................................................................................................................\n9.4\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengeluaran Kas KecilNo.: SOP-FIN-FIN-1.3Ver.: 1.1\nTgl.: 30 Okt 2018Hal.: 2 / 3\n1.TUJUAN\nMengatur Mengatur administrasi pengeluaran Kas Kecil di Store / Department.\n2.RUANG LINGKUP\n1)Pihak Store / Department\n2)Finance Department\n3.DEFINISI\n1)Kas Kecil adalah dana yang disediakan untuk keperluan-keperluan rutin yang nilainya relatif kecil (dibawah Rp.\n300.000,- sekali transaksi).\n2)Bukti Pengeluaran Kas Kecil (BPKK) adalah bukti pengeluaran Kas Kecil per transaksi atau per sekali\npertanggungjawaban.\n3)Ikhtisar Pengeluaran Kas Kecil (IPKK) adalah rangkuman BPKK pada periode tertentu yang digunakan untuk\nmengajukan pengisian kembali kas kecil ke Finance Departemen.\n4)Bukti Pendukung Eksternal (BPE) adalah bukti pendukung pembelian dengan menggunakan kas kecil seperti nota,\nbon atau struk yang dapat dipertanggungjawabkan / ditelusuri keabsahannya.\n5)Pejabat pemegang kas di :\na)Store = Cashier Section Head\nb)DC = Supervisor Department\nc)Food Truck, Booth dan Bazar = Store Supervisor\n4.REFERENSI\n1)FRM-FIN-FIN-4.2.2 Bukti Pengeluaran Kas Kecil\n2)LUK-FIN-FIN-4.2.1 Pengisian Ikhtisar Pengeluaran Kas Kecil\n5.DOKUMEN PENUNJANG\n1)Bukti Pengeluaran Kas Kecil (BPKK)\n2)Ikhtisar Pengeluaran Kas Kecil (IPKK)\nFRM-SYS-GDM-3.2.1 Ver.1.2\nProsedur: \nPengeluaran Kas KecilNo.: SOP-FIN-FIN-1.3Ver.: 1.1\nTgl.: 30 Okt 2018Hal.: 3 / 3\n6. PROSEDUR DAN TANGGUNG JAWAB\nDilakukan olehKegiatanWaktu\nPemohon1.1Melakukan pembayaran atau pembelian, lihat PKP-FIN-FIN-2 Pengeluaran\nDana Kas Kecil :\n1)Meminta Bukti Pendukung Eksternal (BPE) dari Supplier.\n2)Meminta persetujuan pejabat 1 level diatasnya.Max H+1 \njika BSm \natau max \nH+30 jika \nreimburse\nPejabat 1 level \ndiatasnya2.1Menerima BPE dari Pemohon lihat PKP-FIN-FIN-2 Pengeluaran Dana Kas\nKecil:\n1)Menganalisa dan memastikan kesesuaian jumlah pengeluaran pada\nBPE.\n2)Menandatangani BPE sebagai bukti persetujuan.\n3)Menyerahkan kembali ke Pemohon untuk diserahkan ke  Pejabat\npemegang Kas.Max H+1 \njika BSm \natau max \nH+30 jika \nreimburse\nPejabat pemegang \nKas3.1Menerima BPE dari Pemohon dan memastikan BPE terdapat tanda tangan\npejabat 1 level diatas pemohon lihat PKP-FIN-FIN-2 Pengeluaran Dana Kas\nKecil. \n3.2Membuat Bukti Pengeluaran Kas Kecil (BPKK) rangkap 1 (satu), lihat FRM-\nFIN-FIN-4.2.2 Bukti Pengeluaran Kas Kecil:\n1)Menyerahkan uang kepada Pemohon sesuai dengan BPKK.\n2)Meminta tanda tangan Penerima/ Pemohon pada BPKK sebagai\nbukti penerimaan Kas Kecil.\n3)Meminta tanda tangan 1 level diatas pemohon pada BPKK sebagai\nbukti persetujuan.Max H+1\n3.3Mencatat   semua   pengeluaran   Kas   Kecil   ke dalam   aplikasi   Ikhtisar\nPengeluaran Kas Kecil (IPKK), lihat LUK-FIN-FIN-4.2.1 Pengisian Ikhtisar\nPengeluaran Kas Kecil  dan save IPKK yang telah dibuat.  IPKK harus\ndipertanggungjawabkan   maksimal   H+3   dari   tanggal   terakhir   transaksi\ndilakukan.Max H+1\n3.4Menyatukan IPKK, semua BPKK dan BPE serta menyimpannya ke dalam\nbrankas/Cash Box.Max H+1\n7.KONDISI KHUSUS\n-\n8.LAMPIRAN\n-\nFRM-SYS-GDM-3.2.1 Ver.1.2');
INSERT INTO `tb_document_detail` (`DOC_ID`, `DOCD_UTAMA`, `DOCD_UTAMA_TYPE`, `DOCD_UTAMA_STATUS`, `DOCD_UTAMA_EXT`, `DOCD_PELENGKAP_1`, `DOCD_PELENGKAP_1_TYPE`, `DOCD_PELENGKAP_1_STATUS`, `DOCD_PELENGKAP_1_EXT`, `DOCD_PELENGKAP_2`, `DOCD_PELENGKAP_2_TYPE`, `DOCD_PELENGKAP_2_STATUS`, `DOCD_PELENGKAP_2_EXT`, `DOCD_PERSETUJUAN`, `DOCD_PERSETUJUAN_TYPE`, `DOCD_SEARCH`) VALUES
('1904040057435504413', 'Glossari_Klasifikasi_Dokumen_-_(04.09.17)4', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali6', 'application/pdf', 1, 'pdf', 'Glossari_Klasifikasi_Dokumen_-_(04.09.17)2', 'application/pdf', 1, 'pdf', 'BAST_UAT_Phase_1101.pdf', 'application/pdf', '171251\n27/Feb/2019 16:19 WIBCopyright of Bakmi GMNO.NAMASINGKATANDEFINISIContoh DokumenKomentar\nICOMPANY PROFILEDokumen yang berisi penjelasan mengenai perusahaan secara umum, seperti: profil perusahaan, sistem \nmanajemen, visi, misi, nilai  perusahaan serta manual produk dan layanan yang dihasilkan. \n1VisiPernyataan mengenai gambaran masa depan yang akan dipilih dan yang akan diwujudkan pada suatu saat \nyang ditentukan.\n2MisiPernyataan mengenai tindakan untuk mewujudkan atau merealisasikan apa yang menjadi visi dari \nperusahaan.\n3Corporate ValuePernyataan mengenai nilai-nilai dalam perusahaan yang dapat memotivasi karyawan guna mencapai tujuan \nperusahaan.\n7 Nilai Budaya Bakmi GM\n4Kode Etik PerusahaanKebijakan etis perusahaan berhubungan dengan kesulitan yang bisa timbul (mungkin pernah timbul dimasa \nlalu), seperti konflik kepentingan, hubungan dengan pesaing dan pemasok, menerima hadiah, sumbangan dan \nsebagainya.\n5Value Chain MapDokumen berisi pemetaan hubungan antara proses inti dengan proses pendukung dalam menjalankan suatu \nbisnis.\n6Kelengkapan perusahaanDokumen kelengkapan ijin pendirian perusahaan. TDP, SIUP, Akte, NPWP, Domisili.\n7Sertifikat dan StandarisasiDokumen pernyataan yang menunjukkan perusahaan sudah memenuhi kualifikasi tertentu.  \ncontoh: Halal, Paten\nHalal\n8Manual Sistem Jaminan HalalDokumen sistem yang menjamin kepada MUI atas kehalalan produk suatu perusahaan sepanjang masa \nperusahaan itu memegang Sertifikat  Halal  MUI.  \nManual Sistem Jaminan Halal Bakmi GM\n9Balance Score CardBSCDokumen berisi konsep yang mengukur kinerja suatu organisasi dari empat perspektif yaitu perspektif \nfinansial, perspektif customer, perspektif proses bisnis internal, perspektif pertumbuhan dan pembelajaran.\n10Bill of Material / \nStandar Bahan dan Bumbu\nBoM / SBBDokumen berisi material yang dibutuhkan untuk memproduksi produk akhir. \nDisajikan dalam rangkaian struktur atau tabel susunan.\nCoffee Mix\n11Product SpecificationDokumen yang mendefinisikan informasi / karakteristik utama mengenai suatu produk yang menjadi standar. \nKarakteristik produk dapat mencakup, tetapi tidak terbatas sebagai berikut: estetika (penampilan fisik) \nproduk, masa pakai, standar penyimpanan, dan lainnya.  \nBakmi Rebus\n12Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi.\ncontoh: Peraturan Halal, BPOM.\nDokumen Halal MUI\nIIKEBIJAKAN & STRUKTUR \nORGANISASI\nDokumen yang terkait dengan kebijakan, struktur organisasi, dan job summary.\n1Pernyataan Kebijakan \nPerusahaan\nPKPDokumen berisi batasan/ketentuan yang ditetapkan oleh perusahaan dan digunakan sebagai dasar dalam \nmelaksanakan prosedur terkait.\nPelaksanaan SSOP terkait Implementasi \nSistem Jaminan Halal (QA)\n2Struktur OrganisasiSTODokumen berisi diagram susunan dan hubungan antara tiap bagian serta posisi yang ada pada suatu \norganisasi atau perusahaan dalam menjalankan kegiatan operasional untuk mencapai tujuan yang \ndiharapakan dan diinginkan.\nSTO Operations ; STO Supply ; STO HR ; STO \nFAST\n3Job SummaryJBSDokumen berisi penjelasan singkat, pernyataan umum tentang fungsi dan tanggung jawab pekerjaan yang \nlebih penting, biasanya juga mengidentifikasi petugas bawahan dan atasan langsung.\nJBS IT Manager ;\nJBS PPIC & Warehouse \n4Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi,  \nmisalnya  regulasi atau peraturan perundang-undangan, spesifikasi, referensi.\nUU Ketenagakerjaan, \nPeraturan BPJS, UU ITE.\nIIIPROSEDUR & DOK. \nPENUNJANG\nPedoman kegiatan kerja termasuk diantaranya prosedur, prosedur detil, dokumen penunjang prosedur,  dan \nformulir \n1Prosedur\naBusiness Process MappingBPMSuatu kumpulan pekerjaan yang saling terkait untuk menyelesaikan suatu masalah tertentu. \nSuatu proses bisnis dapat dipecah menjadi beberapa subproses yang masing-masing memiliki atribut sendiri \ntapi juga berkontribusi untuk mencapai tujuan dari superprosesnya.\nPengeluaran dan Pengisian Uang Kas Kantor \nPusat (FIN)\nKLASIFIKASI DOKUMEN\n1 / 2\n171251\n27/Feb/2019 16:19 WIBNO.NAMASINGKATANDEFINISIContoh DokumenKomentar\nKLASIFIKASI DOKUMEN\nbOperation Process ChartOPCPeta kerja yang menggambarkan urutan kerja dan material yang digunakan untuk mencapai standar kontrol \nsuatu produk seperti critical control point dan quality control point, dimana yang diatur antara lain: ukuran \nkuantitas, waktu proses, suhu.\nBakmi Rebus Frozen (PRD)\ncStandard Operational \nProcedure\nSOPDokumen yang merupakan turunan dari bisnis proses, berisi urutan kegiatan dari suatu proses. Satu bisnis \nproses dapat terdiri dari satu atau lebih SOP.\nPelaksanaan Audit 4P, 5R dan Halal (QA) ; \nPemesanan Kue Ulang Tahun (MKT) ; \nKomplain Barang (WHS)\ndService Level AgreementSLADokumen berisi persetujuan tingkat pelayanan antara pemberi jasa/produk (pemasok internal) dengan \npenerima jasa/produk (pelanggan internal).\nDokumen SLA bisa langsung menjadi bagian dalam SOP dan tidak menjadi suatu dokumen terpisah.\nSLA Finance & Accounting Dept. (FIN)\n2Prosedur Detil\naManualMNLDokumen berisi pedoman dalam pembuatan/pengisian dokumen maupun pengoperasian suatu \nmesin/peralatan dan sistem aplikasi.\nKompor Rebus Autolifter (EST)\nbWork Instruction / \nLembar Uraian Kerja\nWIS / LUKDokumen yang merupakan turunan dari OPC / SOP / MNL, berisi petunjuk detail spesifik yang dibutuhkan \nuntuk melakukan pekerjaan tertentu secara benar berdasarkan standar pengerjaannya, seperti: ukuran \nkuantitas, waktu proses, suhu. Ditujukan untuk satu pelaku tugas.\nWIS disajikan dalam bentuk urutan langkah pekerjaan, dilengkapi gambar, item dan standar mutu.\nLUK disajikan dalam bentuk tabel berisi langkah utama, hal penting, dan alasan yang perlu diperhatikan \nsebagai bahan pengajaran bagi para trainer.\nPembersihan Kendaraan dengan Selang Air \n(OSV) ;\nPencucian Gelas (QC) ;\nPenggunaan Food Chopper (EST)\n3Dokumen Penunjang Prosedur\naStandar - Matriks / DaftarMTK / DFTBagian dari kebijakan / prosedur berisi kesepakatan-kesepakatan yang telah didokumentasikan yang di \ndalamnya terdiri antara lain mengenai spesifikasi-spesifikasi teknis atau kriteria-kriteria yang akurat yang \ndigunakan sebagai peraturan, petunjuk, atau definisi-definisi tertentu untuk menjamin suatu barang, produk, \nproses, atau jasa sesuai dengan yang telah dinyatakan. \nDisajikan dalam bentuk tabel hubungan keterkaitan antara suatu fungsi dengan fungsi lain (Matriks) atau  \ndalam bentuk tabel susunan (Daftar).\nStandar Upah ;\nStandar Bakmi Rebus Frozen (QA)\nbAs Built DrawingABDDokumen berisi gambar final dari bangunan gedung yang sudah selesai dilaksanakan.\ncGambar TeknikDokumen berisi gambar peralatan / aktiva.\ndModul TrainingDokumen yang disusun berdasarkan suatu kurikulum pelatihan/pembelajaran agar menjadi suatu langkah-\nlangkah pembelajaran.\nDrawer Change Reconciliation (FIN)\n4FormulirFRMTemplate dokumen dengan kolom standar yang harus diisi untuk merekam data.Barang Bergerak dan Kemasan Isi Ulang \n(WHS) ; Permintaan Pekerja (REC)\n5Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi.Manual Mesin dari Pabrik ;  \nMateri Training Eksternal\nIVREKAMANDokumen hasil kerja atau bukti pelaksanaan kegiatan.\n1CommunicationSemua dokumen atau media yang  digunakan dalam mengirim dan menerima pesan / informasi / opini secara \nlisan atau tulisan.\nmemo, perjanjian kerja karyawan, BST, SPB, \nBS,  BPKK, warta GM, media marketing, \nDirector Speech\n2EducationDokumen yang berisi informasi / pengetahuan / pengalaman yang dapat dijadikan bahan pembelajaran.Knowledge Document Asset, solusi \npenyelesaian kerusakan, Template Project & \nLesson Learned.\n3ReportSemua dokumen keluaran kerja untuk referensi di masa mendatang.laporan finance, laporan progress BSC, \nnotulen, laporan penjualan, laporan event\n4Dok. EksternalDokumen yang diterima dari pihak-pihak di luar perusahaan yang biasanya digunakan sebagai referensi. kontrak kerja dengan vendor / supplier.\nDitinjau ulang oleh,\nNama: \n2 / 2'),
('1904040108102680536', 'uploadItem1', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'BAST_UAT_Phase_1102', 'application/pdf', 1, 'pdf', 'Glossari_Klasifikasi_Dokumen_-_(04.09.17)3', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali7.pdf', 'application/pdf', 'Category NameItem Number\nJABODETABEKCHL0003\nJABODETABEKCHL5049\nJABODETABEKCHL5052\nJABODETABEKCLN5001\nJABODETABEKCLN5034\nJABODETABEKDRY0036\nJABODETABEKDRY4095\nJABODETABEKDRY4097\nJABODETABEKFSTR007\nJABODETABEKFSTR015\nJABODETABEKFSTR019\nJABODETABEKFSTR021\nJABODETABEKFSTR068\nJABODETABEKFSTR078\nJABODETABEKFSTR079\nJABODETABEKFSTR084\nJABODETABEKFSTR085\nJABODETABEKFSTR086\nJABODETABEKFSTR101\nJABODETABEKFSTR104\nFSTR021BAKMI GORENG REBUS\nFSTR068PANGSIT REBUS BUNGKUS\nCHL5052SAOS IKAN 1 LT\nCHL5049SAOS MIE GORENG 1 LT\nFSTR104ACAR TIMUN CINCANG\nFSTR085\nFSTR079\nFSTR086\nFSTR084\nFSTR078ISI BAKMI \nGORENG\n(DaunBwgI\nris, \nBwgPutihGl\ng, \nAyamGrgn, \nUdangKupa\nsBumbu, \nBasoIkan)\nISI CAP \nCAY\n(BwgPutih\nGlg, \nDaunBwgIri\ns, \nBasoIkan, \nBasoOtak-\notakGrg, \nAyamCapc\nayGrg, \nUdangBrsh\nBumbu)\nISI NASI \nGORENG\n(CabeMera\nhBelah, \nDaunBwgIri\ns, \nBwgPutihGl\ng, \nAyamGrgn, \nUdangKupa\nsBumbu, \nBaso Ikan)\nSAYURAN \nMIX \nBAKMI \nGORENG\n(CaisimPot\nong, Kol \nIris)\nSAYURAN \nMIX CAP \nCAY\nFSTR078\nCHL0003BASO SAPI\nFSTR007\nFSTR015DAGING PANGSIT BUMBU 2.4 KG\nFSTR019TELOR DADAR\nDRY0036HAWYU 80 OZ\nCLN5034TISSUE TAMU LIVI\nDRY4095PAPER BOWL XL\nDRY4097SOUP CUP 10 OZ\nCLN5001DIVERSOL CX\nFSTR101NOBLA LIQUID 2LT(Caisim \nPotong, \nPecai iris, \nWortel iris, \nKembang \nKol rebus)\nAYAM GM \nMASAK\n(JamurIris, \nDaunBwgIri\ns, \nBwgPutihGl\ng, \nAyamGMGr\ng, \nMyBimoli, \nSaosGM, \nSaosIkan, \ndll.)'),
('1904121454279989841', 'PKP_ITY_IOS_02_Penggunaan_Komputer_Portabel2', 'application/msword', 1, 'doc', 'File_Not_Found', '-', 1, '-', 'tb_docstructtipe5', 'application/vnd.ms-excel', 1, 'xls', 'SignOff.pdf', 'application/pdf', 'Kebijakan: Penggunaan Komputer \nPortabelDitetapkan Oleh:\nAnthony Pamungkas\nGM FASTDisahkan Oleh:\nJenny Mokhtar\nDirectorNomor: PKP-ITY-IOS-2\nTanggal: 01 Februari 2017\nVer.: 2.0\nSifat: General -NonConfidential\nPersetujuan Kebijakan\nJabatanNamaParaf\nGM E&SPrihanto Basuki\nGM OperationsBudi Purnama\nGM SupplyAntonius Hendrajaya\nGM HRCynthia Fellicianne\nDisusun Oleh:\nJabatanNamaParaf\nIT Service DeskDimas Andi\nIT ManagerHendri Wijaya\n1.Tujuan\nMengatur kebijakan tentang pemakaian, keamanan, pemeliharaan dan pengembalian Komputer Portabel yang\ndisediakan oleh Perusahaan untuk pejabat yang ditunjuk oleh Direksi. Pemberian Komputer Portabel dimaksudkan\nuntuk meningkatkan produktifitas dan efisiensi pekerjaan pengguna Komputer Portabel tersebut.\nKebijakan ini diperuntukan bagi karyawan yang mendapatkan Komputer Portabel sesuai dengan spesifikasi dari\nDepartemen IT Kantor Pusat.\n2.Pengertian\n1)Notebook : yaitu komputer jinjing/komputer portable (yang selanjutnya disebut Komputer Portabel).\n2)Perlengkapan notebook : terdiri dari tas, adaptor, dan mouse.\n3)Perangkat lunak/software :  terdiri dari sistem operasi dan aplikasi/program sesuai standard yang telah ter-install.\n4)Anti-virus : perangkat lunak (software) yang berguna untuk melakukan pendeteksian terhadap virus komputer.\n5)NAS :  Network Area Storage  merupakan tempat  hard-drive  penyimpanan data yang bisa terhubung melalui\njaringan.\n6)Back-up : kegiatan melakukan penyalinan data penting, sebagai antisipasi apabila terjadi kerusakan perangkat\nkeras (hardware).\n3.Ruang Lingkup\nDiterapkan di seluruh area Bakmi GM yang diberikan fasilitas penggunaan Komputer Portabel.\n4.Ketentuan-ketentuan\nHalaman 1 dari 4\nKebijakan: \nPenggunaan Komputer PortabelNo.: PKP-ITY-IOS-2Ver.: 2.0\nTgl: 01 Februari 2017Hal.: 2 / 4\n4.1.PEMAKAIAN YANG DIIZINKAN\n4.1.1. Pemakaian Sah\nKomputer Portabel dan perangkat lunak (software) diberikan untuk mencapai tujuan dan kepentingan Perusahaan.\n4.1.2. Pemakai Sah\nyBertanggung jawab atas peralatan dan perangkat lunak (software) sampai pengguna mengembalikannya pada\nPerusahaan. \nyPengguna tidak boleh mengijinkan orang lain menggunakan peralatan dan perangkat lunak (software) yang\ndiberikan oleh Perusahaan.\nyPengguna Komputer Portabel di store adalah Duty Manager (Assistant Supervisor ke atas).\nyPengguna Komputer Portabel di Kantor Pusat adalah semua pejabat yang ditunjuk oleh Direksi.\n4.1.3. Perangkat Lunak (Software)\nyPerangkat lunak (software) yang dipasang dan digunakan dalam Komputer Portabel hanya perangkat lunak\n(software) yang telah disediakan Perusahaan dan diberikan hak khusus untuk digunakan pada Komputer Portabel.\nyPengguna tidak boleh menyalin (copy), mengunduh (download), memasang (install), atau menghilangkan\n(uninstall) perangkat lunak (software) tersebut atau perangkat lunak (software) lainnya ke dan dari peralatan lain,\nbaik yang dimiliki Perusahaan atau tidak.\nyPengguna tidak diperkenankan mengubah konfigurasi (setting) sistem operasi maupun perangkat lunak pada\nKomputer Portabel.\n4.1.4. Berkomputer yang aman\nTidak diperbolehkan mengambil, memasang, menyalin (copy) dokumen, ataupun membuka berkas pada surat\nelektronik (email) dari sumber lain tanpa memeriksa berkas tersebut dengan perangkat lunak (software) anti-virus\nyang disediakan Perusahaan.\n4.1.5. Mobilisasi Komputer Portabel\nyPenggunaan Komputer Portabel beserta kelengkapannya di store tidak diperkenankan untuk dibawa pulang.\nyPenggunaan Komputer Portabel di Kantor Pusat bergantung pada tuntutan jabatan masing-masing Pengguna.\nyPengguna bertanggung jawab penuh atas keutuhan serta penggunaan Komputer Portabel dan kelengkapannya.\n4.2.KEAMANAN\n4.2.1. Keamanan Peralatan\nyTidak meninggalkan Komputer Portabel tanpa pengawasan di area publik atau di dalam ruangan yang tidak\nterkunci.\nyMenyimpan Komputer Portabel dalam lemari terkunci jika tidak digunakan.\nyMenjauhkan Komputer Portabel dari jangkauan anak kecil berumur di bawah 8 (delapan) tahun.\nyTidak makan dan minum di atas Komputer Portabel.\nBila Komputer Portabel yang diberikan pada pengguna hilang atau rusak, segera hubungi Departemen IT Kantor\nPusat. Kata sandi (password) jaringan pengguna akan segera diubah untuk mencegah orang lain mengakses sistem\nkomputer Perusahaan serta menggunakan perangkat lunak (software) yang dipasang dalam Komputer Portabel.\nKebijakan: \nPenggunaan Komputer PortabelNo.: PKP-ITY-IOS-2Ver.: 2.0\nTgl: 01 Februari 2017Hal.: 3 / 4\n4.2.2. Keamanan Data\nSeringkali masalah yang paling mengganggu dalam pencurian Komputer Portabel adalah kehilangan data dan\npelanggaran kerahasiaan karena pencuri berhasil mengakses data pada Komputer Portabel.\nyLakukan back-up semua data dalam Komputer Portabel secara berkala sebagai perlindungan terhadap pencurian\natau kerusakan mekanis.\nyPasang kata sandi (password) pada semua data rahasia di hard drive Komputer Portabel sebagai perlindungan\nterhadap pencurian.\n4.2.3. Keamanan Kata Sandi (Password)\nySemua akun, kata sandi, dan perihal lain yang berhubungan dengan autentikasi dan otorisasi dalam Komputer\nPortabel tidak boleh diberikan (share) kepada pengguna lain.\nyPengguna wajib melakukan pembaharuan kata sandi sebanyak satu kali dalam kurun waktu tiga bulan.\n4.3.PERAWATAN & PEMELIHARAAN\n4.3.1. Pemeliharaan\nBertanggung jawab untuk menjaga agar Komputer Portabel beserta perlengkapannya selalu dalam kondisi baik.\nApabila menemukan kerusakan mekanis, elektronis atau perangkat lunak (software), harus segera melaporkan\nkerusakan tersebut pada Departemen IT Kantor Pusat.\n4.3.2. Tanggung jawab atas Kerugian atau Kerusakan\nyJika   terjadi   kerusakan/kehilangan   pada  Komputer   Portabel  dan   atau   perlengkapannya,   maka   Pengguna\nbertanggungjawab untuk membuat secara tertulis Berita Acara Kronologis Kejadian dan melaporkannya ke\nDepartemen IT Kantor Pusat.\nyPengguna secara pribadi bertanggung jawab atas Komputer Portabel yang diberikan.  Bila peralatan rusak, dicuri\natau hilang karena tindakan pengguna atau karena tidak bertindak, Perusahaan bisa, dengan kewenangannya,\nmeminta pengguna untuk membayar seluruh biaya perbaikan atau penggantian Komputer Portabel.\nyPerusahaan dapat mengasuransikan Komputer Portabel; tetapi asuransi tidak melepaskan pengguna dari\ntanggung jawab untuk perawatan dan pemeliharaan Komputer Portabel.\nyPerusahaan memiliki kuasa untuk mengambil tindakan yang dianggap perlu guna memastikan pembayaran dari\npengguna untuk biaya perbaikan atau penggantian.\n4.3.3. Pemilikan Data\nySemua data, teks, grafik dan dokumen lain yang dibuat atau disimpan dalam Komputer Portabel adalah Milik\nPerusahaan. \nySemua Komputer Portabel dan semua media magnetis akan diperiksa dan diaudit oleh Tim Internal Audit dengan\ndidampingi oleh IT. \nySemua bahan klien Perusahaan, bahan Perusahaan dan data harus disimpan secara rahasia.\n4.3.4. Back-up\nyKomputer Portabel tidak selalu dihubungkan dengan jaringan, sehingga pengguna bertanggung jawab untuk\nmembuat salinan (back-up) secara teratur dari semua dokumen yang dibuat. \nyApabila Pengguna sedang berada di area kantor, dan terhubung dengan jaringan lokal Perusahaan, maka\nPengguna dapat melakukan back-up data dan dokumen lain yang disimpan dalam Komputer Portabel ke NAS\ndengan terhubung ke jaringan lokal Perusahaan dan sesuai dengan petunjuk dari IT.\nKebijakan: \nPenggunaan Komputer PortabelNo.: PKP-ITY-IOS-2Ver.: 2.0\nTgl: 01 Februari 2017Hal.: 4 / 4\n4.4.PENGEMBALIAN KOMPUTER PORTABEL & PERANGKAT LUNAK (SOFTWARE)\n4.4.1. Atas Permintaan\nAtas permintaan Perusahaan pada setiap saat, untuk alasan apapun, pengguna harus segera mengembalikan setiap\nKomputer Portabel dan perangkat lunak (software) pada Perusahaan.\n4.4.2. Penghentian Kepegawaian\nSemua perangkat lunak (software), data atau dokumen yang terdapat di dalam Komputer Portabel adalah milik PT.\nGriya MieSejati, sehingga wajib dikembalikan secara keseluruhan kepada Perusahaan apabila status kepegawaian\npengguna diberhentikan.\n4.4.3. Kondisi Komputer Portabel\nyKomputer Portabel dan perangkat lunak (software) harus dikembalikan dalam keadaan baik (kecuali dikembalikan\nkarena kerusakan) bersama semua dokumen, perangkat lunak (software) dan konfigurasinya.\nySebelum menyerahkan Komputer Portabel, semua kata sandi (password), perangkat lunak (software) dan\nperangkat keras (hardware), bila ada, harus diberikan kepada Departemen IT Kantor Pusat.\n5.Tahapan-tahapan dalam kebijakan\nN/A\n6.SOP dan Form yang terkait dalam kebijakan\nPKP-ITY-IOS-2L1 Lampiran Spesifikasi Komputer Portabel Berdasarkan Level Jabatan\n7.Efektif Berlaku\nKebijakan ini akan diberlakukan per tanggal 1 Februari 2017. Apabila dalam pelaksanaannya terdapat hal-hal yang\nmemerlukan pengaturan lebih lanjut baik hal-hal yang bersifat teknis dan prosedural maupun terhadap hal-hal baru yang\ntimbul kemudian, maka akan diterbitkan kebijakan baru sebagai kelengkapan dari kebijakan ini.'),
('1904150903281955566', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_07032018', 'application/pdf', 1, 'pdf', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_070320181', 'application/msword', 0, 'doc', 'WIS-SCS-REC-1.1.1_Ver.1.0_Input_Sharing_Cost_Seragam_di_HRIS_-file_edit', 'application/vnd.visio', 0, 'vsd', 'Persetujuan_SOP_Penambahan_Posisi_Baru_persetujuan.pdf', 'application/pdf', ' \n \n \nProsedur:  \nPenambahan Posisi/Kuota Baru Hal.: 1 / 3 \nKerahasiaan: Confidential Tgl.: )HNUXMUL¶18 Ver.: 1.0 No.: SOP-REC-REC-7.1 \nDibuat oleh: \n \n \n \n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Maudy Fitriani Irana \nRecruitment Ass.Manager \nRita Raesita \nRecruitment Manager \nCynthia Fellicianne \nGM HRS \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\nDiterapkan dan Disetujui oleh: \nDepartemen / Divisi Disetujui Tanda Tangan \nPMPD C. Andrey   \nC&B Daniel Sidharta  \nITY-HKM Teddy Sutanto  \nBPI Thomas Aditya  \nBusiness Development a.n. Tammy Tanumihardja  \nOperations Budi Purnama  \nSupply Antonius Hendrajaya  \nFAST Anthony Pamungkas  \nEngineering & Services Prihanto Basuki  \n \nTanggal Efektif   : Maret 2018                            \n \nDAFTAR ISI \n1. TUJUAN ............................................................................................................................................................................. 2 \n2. RUANG LINGKUP .............................................................................................................................................................. 2 \n3. DEFINISI ............................................................................................................................................................................ 2 \n4. REFERENSI ....................................................................................................................................................................... 2 \n5. DOKUMEN PENUNJANG .................................................................................................................................................. 2 \n6. PROSEDUR DAN TANGGUNG JAWAB ........................................................................................................................... 2 \n7. KONDISI KHUSUS/INFORMASI KHUSUS ........................................................................................................................ 3 \n8. LAMPIRAN ......................................................................................................................................................................... 3 \n \n \n \n \n \n \n \n \n \n Prosedur:  \nPenambahan Posisi/Kuota Baru \nNo: SOP-REC-REC-7.1 Ver.: 1.0 \nTgl.: )HNUXMUL¶18 Hal.: 2 / 3 \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\n1. TUJUAN \nMenjelaskan alur proses penambahan posisi/kuota baru. \n \n2. RUANG LINGKUP \n2.1. Store / Dept. Manager (Pemohon) \n2.2. Performance Management & People Development Dept. \n2.3. Compensation & Benefit Dept.  \n2.4. Business Process Improvement Dept. \n2.5. Accounting Dept. \n2.6. Recruitment Dept. \n2.7. ITY-HKM Dept \n \n3. DEFINISI \n - \n \n4. REFERENSI \n- \n \n5. DOKUMEN PENUNJANG \n5.1. FRM-REC-REC-7.1.2 Ver.1.1 Form Penambahan Kuota \n5.2. FRM-REC-REC-7.1.3 Ver.1.1 Forn Penambahan Posisi Baru di HRIS \n5.3. Struktur Organisasi (STO) \n5.4. Job Summary (JBS) \n5.5. Kamus Penilaian Kompetensi Generik \n5.6. Kamus Penilaian Kompetensi Fungsional \n \n6. PROSEDUR DAN TANGGUNG JAWAB \nDilakukan oleh Kegiatan Waktu \nStore / Dept. Manager \n(Pemohon)  \n1 Berdasarkan  inisiasi  perubahan  struktur  organisasi, penambahan \nposisi/kuota maka : \n1) Berdiskusi dengan GM/Direktur mengenai penambahan posisi/ kuota :   \n Terkait dengan budget tahunan  ataupun  rencana  strategis \nperusahaan \n Ada Analisa Jabatan berdasarkan faktor desain organisasi \ndan desain pekerjaan \n2) Jika ada penambahan posisi dan kuota, lanjutkan ke poin 2. \n3) Jika hanya penambahan kuota, mengisi  Form  Penambahan  Kuota \n(FPK) dan lanjutkan ke poin 9. \n \n 2 Berdasarkan adanya penambahan posisi dan kuota, maka: \n1) Merevisi Struktur Organisasi (STO). \n2) Membuat Job Summary (JBS).  \n3) Mengisi Form Penambahan Posisi Baru (FPPB) sesuai kolom PIC. \n \nAst. PMPD Manager 3 1) Membahas  kaitan antara  STO  dan JBS dengan Kamus Penilaian \nKompetensi Generik  dan  Kamus Penilaian Kompetensi  Fungsional \n10 hari kerja \n Prosedur:  \nPenambahan Posisi/Kuota Baru \nNo: SOP-REC-REC-7.1 Ver.: 1.0 \nTgl.: )HNUXMUL¶18 Hal.: 3 / 3 \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\nDilakukan oleh Kegiatan Waktu \nbersama dengan pemohon, kemudian:  \na. Menentukan level pada Kamus Penilaian Kompetensi Generik \nb. Mereview Kamus Penilaian Kompetensi Fungsional. Jika sudah \nada,  tentukan  level  kompetensinya.  Jika  belum  ada,  maka \nmembuat kompetensinya. \n2) Mengisi FPPB sesuai kolom PIC. \nAst. PMPD Manager;  \nAst. Comben Manager; \nStore / Dept. Manager \n(Pemohon)   \n4 1) Melaksanakan review Job Summary untuk menentukan grade jabatan, \nbersama dengan pemohon dan Ast. PMPD Manager \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \nStore / Dept. Manager \n(Pemohon) \n5 1) Meminta tanda tangan GM divisi terkait, GM Human Resource dan \nDirektur terkait  pada  STO, JBS, FPPB, dan Kamus Penilaian \nKompetensi (KPK) Fungsional (jika ada). \n2) Setelah mendapat persetujuan, maka mengirimkan STO, JBS, FPPB, \nKPK Fungsional ke Dept. BPI. \n7 hari kerja \nDept. BPI 6 1) Menerima STO, JBS, FPPB, dan KPK Fungsional (jika  ada)  dan \nmelakukan serah terima sesuai prosedur yang berlaku. \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \n7 Melakukan publish dokumen-dokumen tersebut pada web portal sesuai \nManual Aplikasi e-Document.  \n2 hari kerja \nRecruitment Manager 8 Berdasarkan  FPPB yang  diterima dari  BPI untuk  penambahan  posisi, \nmaka: \n1) Melihat STO, JBS, dan KPK Fungsional di E-Document. \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \n 9 Lanjutan dari kegiatan 1.2). \nBerdasarkan  FPK  yang  diterima  dari  Store/Dept. Manager (pemohon) \nuntuk penambahan kuota, maka: \n1) Mengarsipkan FPK asli. \n2) Menyerahkan FPPB ke ITY-HKM. \n2 hari kerja \nAst. ITY-HKM Manager 10 Berdasarkan FPPB, maka melakukan: \n1) Setup new position di HRIS, dengan referensi E-Doc. / punya akses \nke STO dan JBS. \n2) Mengarsipkan FPPB. \n2 hari kerja \n \n7. KONDISI KHUSUS/INFORMASI KHUSUS \n- \n \n8. LAMPIRAN \nBagan Alir '),
('1904150938051405212', 'Job_Summary', 'application/msword', 1, 'doc', 'Job_Summary', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'docx', 'File_Not_Found', '-', 0, '-', 'DOKUMEN_PERSETUJUAN.pdf', 'application/pdf', ' JOB SUMMARY\nPT. Griya MieSejati\nJl. Arjuna Utara No.66, Duri Kepa\nTelp. 565.5008Hal. :1 / 1\nNo. Dokumen:\nVersi & Tgl. Berlaku:\nDibuat Oleh:Ditinjau Oleh:Disetujui Oleh:\nNama:Nama:Nama: \nTanggal:Tanggal:Tanggal:\n1.IDENTITAS JABATAN\n2.TUJUAN UTAMA JABATAN\n3.TANGGUNG JAWAB\n4.HUBUNGAN KERJA\n5.SPESIFIKASI JABATAN'),
('1904161020164804913', 'UAT_2_PENCIPTA_-_16_11_2018', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 0, 'pptx', 'logo_bank', 'image/png', 0, 'PNG', 'MP4', 'video/mp4', 0, 'mp4', 'PMD_WIS-IRL-PRS-131_Ver_10_asli_(Copy).pdf', 'application/pdf', 'Temuan Ci\nDiubah jadi "Regitrasi \nDokumen"\nJudul "atribut dokumen" disini dihilangkan \nkarena sudah ada di atas. Konsisten pada \nwizard selanjutnya.'),
('1904161026136248169', 'Auto_Cad', 'application/octet-stream', 0, 'dwg', 'PMD_-_Matriks-MUTASI_TETAP', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'temuan', 'image/jpeg', 0, 'jpg', 'Persetujuan_SOP_Penambahan_Posisi_Baru_persetujuan1.pdf', 'application/pdf', 'coba upload excel dan jpg'),
('1904221025083646425', '10b._FRM-BPI-GDM-1.1.10_Ver.2.0_Format_Work_Instruction', 'application/vnd.visio', 1, 'vsd', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', '10a._MNL-BPI-GDM-1.1.10_Ver.2.pdf', 'application/pdf', 'Instruksi Kerja : \nPelaku :\nBagan AlirStandar MutuKerahasiaan: non confidentialNo.:\nHal.:   /Ver.: \nTgl.: Disetujui oleh:\n3.Mulai\nFRM-BPI-GDM-1.1.10 Ver.2.01.\nSelesai5.2.\n6.4.AlasanGambarDibuat oleh:\nCatatan:xxxxxx\nxx xxxxxx\nxx \nInstruksi Kerja : \nPelaku :\nBagan AlirStandar MutuKerahasiaan: non confidentialNo.:\nHal.:   /Ver.: \nTgl.: \nFRM-BPI-GDM-1.1.10 Ver.2.0AlasanGambar\nCatatan:\nInstruksi Kerja : \nPelaku :\nBagan AlirStandar MutuKerahasiaan:  No.:\nHal.:   /Ver.: \nTgl.: Disetujui oleh:\nFRM-BPI-GDM-1.1.10 Ver.2.0AlasanGambarDibuat oleh:\nxxxxxx\nxx xxxxxx\nxx 5)\n6.2)2)6)7)3)4)8)9)\n6.3)2)3)4)5)\n6)Catatan:1)1)'),
('1904241016215937786', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 'sasasasasasasasasasasassa'),
('1904250722344439233', 'SyncDataHRIS3_(1)', 'application/pdf', 1, 'pdf', 'BAST_UAT_Phase_1103', 'application/pdf', 1, 'pdf', 'uploadItem2', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, 'xlsx', 'SyncDataHRIS3.pdf', 'application/pdf', 'Copyright of Bakmi GM\n	\n	\r		\n	\n	\r				\Z	\n	\n	\r	\n	\n	\r				\nCopyright of Bakmi GM\n !!	\n\n "\Z	\Z		\n\n "##		\n\n$$ \r	\n\n$ !	\n\n$ #		\n\n$$!			%&%	\n\n# "			\n\n\'	\n\n		\n\nCopyright of Bakmi GM()*\n !!\r\n !"+\n !"!\n "	\n "\n "$\n "	\n$$#\n$#,\Z\n$"\n$ $	\Z\n$ \n$ \n$ $\n$ #\n$ !!\r\n$$#!\n$$!	\Z\n$$! \n$!#\n#\n##"\n\n#!\n\n#!\n%%\n#!\n,\Z\n#!\n\n#"\n# \n# \n# \Z\n# \n## %\n#"\n##	\n##\n	\n#!!\n#"\n# #\Z\n#  \n#   	\n#  "\n# $\n# $\n# "\n	\nCopyright of Bakmi GM# "$\n\n#$\n##$\n	\n##$\n\n##$"%%\nCopyright of Bakmi GM-.*\n	\r !!\n	+ !!\n !!\n				 "\n	 "\n		 "\n			 "\n$$ \n,	\Z$$ \n	\n	\Z$$ \n	$ #\n/	$ !\n	\Z	$ !\n		$ #\n	\r	$ #\n			$ #\n	\Z "##\n$$ \n	$ !\n	$ !\n\n	\n%\'%\n,	\Z\n,	\Z\n				\n			$ #\n			$ #\n\Z "##\n	 "##\n%		$$!\n		 "\n		$$ \n	\n			\n		\n\Z			 "\n		# "\n	$$!\n	\n				 "##\n		 "##\n		\nCopyright of Bakmi GM	\n	\Z		 !!\n	$ !\n/$ !\n%%	$$!'),
('1904250726174649213', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali21', 'application/pdf', 1, 'pdf', 'SyncDataHRIS31', 'application/pdf', 1, 'pdf', 'BAST_UAT_Phase_1104', 'application/pdf', 1, 'pdf', 'UAT_SignOff_Phase_151.pdf', 'application/pdf', 'Copyright of Bakmi GM171251\n27/Feb/2019 16:17 WIBCopyright of Bakmi GM \n1 \n \nKebijakan :  Kartu Identitas Penduduk Sementara (KIPS) Bagi Pekerja BGM Di Kantor (DC) / \nStore Bali \nNomor      :  PKP-IRL-IRL-H.24   \nTanggal    :  01 September 2018 \nVer.          :  1.0 \nDistribusi  :  Store Mgr, Senior Store Mgr, Area Mgr, Mgr, General Mgr, Director \n \n \n1. Tujuan \n \nMengatur ketentuan mengenai KIPS (Kartu Identitas Penduduk Sementara) untuk Pekerja BGM di \nKantor (Distribution Center) / Store Bali. \n \n2. Pengertian \n \nKIPS (Kartu Identitas Penduduk Sementara) atau KIPP (Kartu Identitas Penduduk Pendatang) atau \nKIPEM (Kartu Identitas Penduduk Musiman) adalah Kartu Identitas Penduduk yang dipersyaratkan \noleh peraturan  lokal Desa (Desa pakreman dan/atau Desa  dinas) di wilayah  Provinsi Bali, yang \nbertujuan untuk mengatur pendataan penduduk pendatang. \n \n3. Ruang Lingkup  \n \n3.1. Perusahaan BGM \n3.2. Pekerja BGM di Kantor (Distribution Center) / Store Bali \n \n4. Ketentuan ² ketentuan  \n \n4.1. KIPS (Kartu Identitas Penduduk Sementara) atau KIPP (Kartu Identitas Penduduk Pendatang) \natau  KIPEM  (Kartu  Identitas  Penduduk  Musiman)  adalah  Kartu  Identitas  Penduduk  yang \ndipersyaratkan oleh peraturan lokal Desa (Desa pakreman dan/atau Desa dinas) di wilayah \nProvinsi Bali, yang bertujuan untuk mengatur pendataan penduduk pendatang; \n \n4.2. Pekerja BGM di Kantor (DC) / Store Bali yang termasuk sebagai penduduk pendatang juga \ndipersyaratkan / diwajibkan memiliki KIPS (KIPP/KIPEM) oleh peraturan lokal Desa setempat \n(Desa pakreman dan/atau Desa dinas); \n \n4.3. Bilamana peraturan lokal Desa setempat (Desa pakreman dan/atau Desa dinas) mewajibkan \ndan mempersyaratkan penduduk pendatang memiliki KIPS (KIPP/KIPEM), maka pekerja BGM \ndi Kantor (DC) / Store Bali yang menempati rumah (atau bertempat tinggal) di area Desa \nsetempat wajib memiki KIPS (KIPP/KIPEM); \n \n4.4. Ketentuan  mengenai µMVMO  GMHUMO /  asal  kota¶ penduduk  pendatang yang diwajibkan  / \ndipersyaratkan memiliki KIPS (KIPP/KIPEM) baik yang berasal dari daerah Luar Pulau Bali \nataupun yang berasal dari Luar Kota Denpasar adalah mengikuti ketentuan yang tertulis dalam \nperaturan lokal masing ± masing Desa setempat (Desa pakreman dan/atau Desa dinas);  \nCopyright of Bakmi GM \n2 \n \n4.5. Ketentuan mengenai besarnya biaya untuk pembuatan atau biaya untuk mendapatkan KIPS \n(KIPP/KIPEM) serta mengenai masa berlakunya KIPS (KIPP/KIPEM) adalah sesuai dengan \nperaturan lokal masing ± masing Desa setempat (Desa pakreman dan/atau Desa dinas); \n \n4.6. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) bagi \npekerja ² pekerja baru adalah sebagai berikut :  \n4.6.1. Bagi pekerja ± pekerja baru yang berdomisili atau direkrut µSRLQP RI OLUH¶ di Pulau Bali, \nuntuk ditempatkan di Kantor (DC) / Store ± store Bali :  biayanya ditanggung oleh \nmasing ± masing pekerja;  \n4.6.2. Bagi pekerja ± pekerja baru yang direkrut µSRLQP RI OLUH¶ di luar Pulau Bali, untuk \nditempatkan di Kantor (DC) / Store ± store Bali :  biayanya ditanggung oleh masing ± \nmasing pekerja;  \n \n4.7. Pengurusan pembuatan KIPS (KIPP/KIPEM) bagi pekerja ² pekerja baru sebagaimana yang \ndimaksud dalam ketentuan no. 4.6. tersebut diatas adalah dilakukan sendiri oleh masing ± \nmasing pekerja ybs; \n \n4.8. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) bagi \nPekerja Mutasi Luar Kota ke Kantor (DC) / Store ² store di Bali adalah sebagai berikut : \n4.8.1. Bagi 3HNHUÓM  µ0XPMVL  7HPMS  IXMU  .RPM  NMUHQM  3HUPLQPMMQ  6HQGLUL¶ :   biayanya \nditanggung oleh masing ± masing pekerja; \n4.8.2. %MJL  3HNHUÓM  µ0XPMVL  6HPHQPMUM Luar  Kota NMUHQM  3HUPLQPMMQ  6HQGLUL¶ :  biayanya  \nditanggung oleh masing ± masing pekerja; \n4.8.3. %MJL 3HNHUÓM µ0XPMVL 6HPHQPMUM Luar Kota NMUHQM 3HULQPMO 3HUXVMOMMQ¶ : biayanya \nditanggung  oleh  Perusahaan untuk masa  berlaku 6 (enam) bulan,  dan  dapat \ndiperpanjang untuk masa 6 (enam) bulan berikutnya; \n \n4.9. Pengurusan pembuatan KIPS (KIPP/KIPEM) bagi pekerja ² pekerja Mutasi Luar Kota ke \nKantor (DC) / Store ² store di Bali sebagaimana yang dimaksud dalam ketentuan no. 4.8. \ntersebut diatas adalah sebagai berikut :  \na. Bagi 3HNHUÓM  µ0XPMVL  7HPMS  IXMU  .RPM  NMUHQM  3HUPLQPMMQ  6HQGLUL¶ : : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan sendiri oleh masing ± masing pekerja ybs, atau \ndapat dibantu oleh Supervisor GA & Engineering Kantor (DC) Bali; \nb. Bagi pekerja µ0XPMVL  6HPHQPMUM Luar  Kota NMUHQM  3HUPLQPMMQ  6HQGLUL¶ : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan sendiri oleh masing ± masing pekerja ybs, atau \ndapat dibantu oleh Supervisor GA & Engineering Kantor (DC) Bali;  \nc. Bagi pekerja µ0XPMVL 6HPHQPMra Luar Kota NMUHQM 3HULQPMO 3HUXVMOMMQ¶ : pengurusan \npembuatan KIPS (KIPP/KIPEM) dilakukan oleh Supervisor GA & Engineering Kantor (DC) \nBali;  \n \n4.10. Pengajuan  biaya atau  penggantian  biaya ke  Perusahaan untuk  pembuatan  atau  untuk \nmendapatkan  KIPS  (KIPP/KIPEM) bagi pekerja µ0XPMVL  6HPHQPMUM Luar  Kota karena \n3HULQPMO 3HUXVMOMMQ¶ sebagaimana yang dimaksud dalam ketentuan no. 4.8. butir c dan no. \n4.9. butir c tersebut diatas dilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali \nCopyright of Bakmi GM \n3 \n \nmelalui  mekanisme pengajuan yang  ditetapkan  oleh  Dept.  Finance ± KP, baik  melalui \nmekanisme  Bon  Sementara  (BS)  maupun  melalui  mekanisme  penggantian  biaya \n(µreimbursement¶). \n \n4.11. Pengajuan  biaya atau  penggantian  biaya ke  Perusahaan untuk  pembuatan  atau  untuk \nmendapatkan  KIPS  (KIPP/KIPEM)  sebagaimana  yang  dimaksud  dalam  ketentuan no.  4.9. \ntersebut diatas harus melampirkan bukti ± bukti pendukung berupa : \na. Tanda bukti / tanda terima (asli) pembayaran biaya KIPS (KIPP/KIPEM) yang dikeluarkan \noleh Desa setempat (Desa pakreman dan/atau Desa dinas);  \nb. Memo (fotocopy) Mutasi Luar Kota pekerja ybs, yang dikeluarkan oleh Dept. Recruitment ± \nKP; \nc. KIPS (KIPP/KIPEM) (fotocopy) yang lama atau yang sudah tidak berlaku, bilamana untuk \nperpanjangan KIPS (KIPP/KIPEM); \n \n4.12. Bilamana 3HNHUÓM µ0XPMVL 6HPHQPMUM IXMU .RPM NMUHQM 3HULQPMO 3HUXVMOMMQ¶ GLPXPMVLNMQ NH \nStore lainnya di Bali sehingga harus membuat KIPS (KIPP/KIPEM) yang baru karena pindah \nrumah  (tempat  tinggal),  sedangkan  masa  berlaku KIPS  (KIPP/KIPEM)  yang  lama  belum \nberakhir dan 6 (enam) bulan biayanya masih menjadi tanggungan Perusahaan belum berakhir, \nmaka  biaya  pembuatan KIPS  (KIPP/KIPEM)  yang  baru tersebut tidak  menjadi  tanggungan \nPerusahaan; \n \n4.13. Pekerja BGM yang tidak memiliki KIPS (KIPP/KIPEM) atau yang sudah habis / lewat masa \nberlakunya adalah  melanggar Peraturan  /  Ketentuan  Perusahaan karena hal  tersebut \nberpotensi menyebabkan terganggunya operasional Perusahaan (Store).  Kepada pekerja yang \nmelakukan pelanggaran Peraturan / Ketentuan tsb dapat dikenakan sanksi sesuai ketentuan \ndalam Perjanjian Kerja Bersama (PKB) atau Peraturan Perusahaan yang berlaku;  \n \n4.14. Monitoring dan kontrol terhadap Pekerja BGM yang tidak memiliki KIPS (KIPP/KIPEM) atau \nyang sudah habis / lewat masa berlakunya dilakukan oleh Supervisor GA & Engineering \nKantor (DC) Bali atau oleh PIC Dept Kantor (DC) / PIC Store di Bali; \n \n4.15. KETENTUAN KHUSUS \nMengingat dan  mempertimbangkan bahwa pada saat  / waktu  pembukaan  Kantor \n(Distribution Center) Bali dan pembukaan Store pertama & kedua (ke-1 & ke-2) di Bali \ntahun  2018 belum  ada  Kantor  (DC)  /  Store  BGM  yang  sudah  beroperasi,  maka  berlaku \nKETENTUAN KHUSUS sebagai berikut : \n4.15.1. Ketentuan biaya untuk pembuatan atau biaya untuk mendapatkan KIPS (KIPP/KIPEM) \npekerja adalah sebagai berikut : \na. Bagi pekerja ± pekerja baru yang direkrut µSRLQP RI OLUH¶ di luar Pulau Bali, yang \nmenjalani Prog. Diklat dan/atau masa PKWT-1 di store ± store luar Pulau Bali \n(misalnya  di  Surabaya)  atau yang menjalaninya  di  store  Pulau  Bali, dan \nselanjutnya untuk ditempatkan  di  Store  Bali  :   biayanya ditanggung  oleh \nPerusahaan untuk masa berlaku 6 (enam) bulan; \nCopyright of Bakmi GM \n4 \n \nb. %MJL 3HNHUÓM µ0XPMVL 6HPHQPMUM IXMU .RPM NMUHQM 3HUPLQPMMQ 6HQGLUL¶ ke Kantor \n(DC) / Store Bali : biayanya  ditanggung oleh Perusahaan untuk masa berlaku 6 \n(enam) bulan; \nc. %MJL  3HNHUÓM  µ0XPMVL  6HPHQPMUM  IXMU  .RPM  NMUHQM  3HULQPMO  3HUXVMOMMQ¶  NH \nKantor  (DC)  /  Store  Bali  : biayanya ditanggung oleh  Perusahaan untuk masa \nberlaku 6  (enam)  bulan,  dan  dapat  diperpanjang untuk masa  6  (enam)  bulan \nberikutnya; \n4.15.2. Pengurusan  pembuatan  KIPS  (KIPP/KIPEM) pekerja sebagaimana  yang  dimaksud \ndalam ketentuan no. 4.15.1. tersebut diatas adalah sebagai berikut :  \na. %MJL SHNHUÓM NMUX \\MQJ GLUHNUXP µSRLQP RI OLUH¶ GL OXMU 3XOMX %MOL yang menjalani \nProg.  Diklat  dan/atau  masa  PKWT-1  di  store  luar  Pulau  Bali  (misalnya  di \nSurabaya)  atau yang menjalaninya  di store  Pulau  Bali, dan  selanjutnya untuk \nditempatkan  di  Store  Bali    : pengurusan pembuatan KIPS (KIPP/KIPEM)  \ndilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali; \nb. Bagi pekerja µ0XPMVL 6HPHQPMUM Luar Kota NMUHQM 3HUPLQPMMQ 6HQGLUL¶ ke Kantor \n(DC) / Store Bali : pengurusan pembuatan KIPS (KIPP/KIPEM) dilakukan oleh \nSupervisor GA & Engineering Kantor (DC) Bali; \nc. Bagi pekerja µ0XPMVL 6HPHQPMUM Luar Kota karena Perintah Perusahaan¶ NH VPRUH \nBali : pengurusan pembuatan KIPS (KIPP/KIPEM) dilakukan oleh Supervisor GA \n& Engineering Kantor (DC) Bali;  \n4.15.3. Pengajuan biaya atau penggantian biaya ke Perusahaan untuk pembuatan atau untuk \nmendapatkan KIPS (KIPP/KIPEM) sebagaimana yang dimaksud dalam ketentuan no. \n4.15.2. tersebut diatas dilakukan oleh Supervisor GA & Engineering Kantor (DC) Bali \nmelalui mekanisme pengajuan yang ditetapkan oleh Dept. Finance ± KP, baik melalui \nmekanisme  Bon  Sementara (BS) maupun  melalui  mekanisme  penggantian  biaya \n(reimbursement).  \n4.15.4. Pengajuan biaya atau penggantian biaya ke Perusahaan untuk pembuatan atau untuk \nmendapatkan KIPS (KIPP/KIPEM) sebagaimana yang dimaksud dalam ketentuan no. \n4.15.3. tersebut diatas harus melampirkan bukti ± bukti pendukung berupa : \na. Tanda bukti / tanda terima (asli) pembayaran biaya KIPS (KIPP/KIPEM) yang \ndikeluarkan oleh Desa setempat (Desa pakreman dan/atau Desa dinas);  \nb. Memo  (fotocopy)  Mutasi  Luar  Kota  pekerja  ybs,  yang  dikeluarkan  oleh  Dept. \nRecruitment ± KP; \nc. KIPS  (KIPP/KIPEM)  (fotocopy)  yang  lama  atau  yang  sudah  tidak  berlaku, \nbilamana untuk perpanjangan KIPS (KIPP/KIPEM); \n \n \n5. Dokumen Yang Terkait Kebijakan \n \n±   Surat Perjanjian Prog. Diklat / MT & Surat Perjanjian Kerja PKWT \n±   Memo Mutasi Luar Kota pekerja \n            ±  Formulir Permohonan Ijin dan Pemberitahuan (FPIP) \n \n \n \n \nCopyright of Bakmi GM \n5 \n \n6. Efektif Berlaku \n \nKebijakan ini berlaku mulai tanggal 01 September 2018.   \nApabila dalam pelaksanaannya terdapat hal-hal yang memerlukan pengaturan lebih lanjut baik hal-hal \nyang bersifat teknis dan prosedural maupun terhadap hal-hal baru yang timbul kemudian, maka akan \ndikeluarkan kebijakan baru sebagai kelengkapan dari kebijakan ini. \n '),
('1904250838472519918', 'UAT_SignOff_Phase_152', 'application/pdf', 1, 'pdf', 'Kebijakan_KIPS_bagi_Pekerja_BGM_di_Kantor_(DC)_dan_Store_Bali22', 'application/pdf', 1, 'pdf', 'BAST_UAT_Phase_1105', 'application/pdf', 1, 'pdf', 'SyncDataHRIS32.pdf', 'application/pdf', 'Copyright of Bakmi GM\nPROYEK APLIKASI\nNEW E.DOGUMENT\nUsen Accepraruce Tesrtruc PnRsr 1 - Sre n-Orr Fonna\nTim Rekakomindo telah menerima dan menyepakati hasil UAT bersama tim BakmiGM.\nAdapun UAT dilakukan berdasarkan skenario UAT yang telah disusun bersama-sama dengan tim,\nsecara ringkas skenario UAT ditujukan untuk melakukan testing dan uji validasi terhadap fitur -fitur\nberikut :\no Kontribusi Dokumen\n. Workflow Approval Dokumen ( pencipta, pendistribusi, atasan pencipta)\no Publikasi Dokumen (dapat dilihat oleh pengguna)\nKami telah menyatakan bahwa UAT yang dilakukan berdasarkan skenario yang disusun telah dapat\nditerima dan sesuai denqan hasil vanq tertuanqkan dalam skenario UAT.\nSignaire:\n(UAT Team)\nNotes:'),
('1904262247456400812', 'SyncDataHRIS321', 'application/pdf', 1, 'pdf', 'UAT_SignOff_Phase_153', 'application/pdf', 1, 'pdf', 'SyncDataHRIS33', 'application/pdf', 1, 'pdf', 'BAST_UAT_Phase_1106.pdf', 'application/pdf', 'Copyright of Bakmi GMCopyright of Bakmi GM\n	\n	\r		\n	\n	\r				\Z	\n	\n	\r	\n	\n	\r				\nCopyright of Bakmi GM\n !!	\n\n "\Z	\Z		\n\n "##		\n\n$$ \r	\n\n$ !	\n\n$ #		\n\n$$!			%&%	\n\n# "			\n\n\'	\n\n		\n\nCopyright of Bakmi GM()*\n !!\r\n !"+\n !"!\n "	\n "\n "$\n "	\n$$#\n$#,\Z\n$"\n$ $	\Z\n$ \n$ \n$ $\n$ #\n$ !!\r\n$$#!\n$$!	\Z\n$$! \n$!#\n#\n##"\n\n#!\n\n#!\n%%\n#!\n,\Z\n#!\n\n#"\n# \n# \n# \Z\n# \n## %\n#"\n##	\n##\n	\n#!!\n#"\n# #\Z\n#  \n#   	\n#  "\n# $\n# $\n# "\n	\nCopyright of Bakmi GM# "$\n\n#$\n##$\n	\n##$\n\n##$"%%\nCopyright of Bakmi GM-.*\n	\r !!\n	+ !!\n !!\n				 "\n	 "\n		 "\n			 "\n$$ \n,	\Z$$ \n	\n	\Z$$ \n	$ #\n/	$ !\n	\Z	$ !\n		$ #\n	\r	$ #\n			$ #\n	\Z "##\n$$ \n	$ !\n	$ !\n\n	\n%\'%\n,	\Z\n,	\Z\n				\n			$ #\n			$ #\n\Z "##\n	 "##\n%		$$!\n		 "\n		$$ \n	\n			\n		\n\Z			 "\n		# "\n	$$!\n	\n				 "##\n		 "##\n		\nCopyright of Bakmi GM	\n	\Z		 !!\n	$ !\n/$ !\n%%	$$!'),
('1905020817431312386', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 'STO Struktur Organisasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_detail_status`
--

CREATE TABLE `tb_document_detail_status` (
  `DTDLSS_ID` varchar(255) NOT NULL DEFAULT '-',
  `DOC_ID` varchar(150) NOT NULL DEFAULT '-',
  `DTDLSS_DATE` datetime NOT NULL,
  `DTDLSS_MAKER` varchar(255) NOT NULL DEFAULT '-',
  `DTDLSS_STATUS` varchar(255) NOT NULL DEFAULT '-',
  `DTDLSS_NOTE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_detail_status`
--

INSERT INTO `tb_document_detail_status` (`DTDLSS_ID`, `DOC_ID`, `DTDLSS_DATE`, `DTDLSS_MAKER`, `DTDLSS_STATUS`, `DTDLSS_NOTE`) VALUES
('1903050920008603166', '1903050906241783554', '2019-03-05 09:20:00', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'dok utama not found'),
('1903141427383270771', '1903050922414427383', '2019-03-14 14:27:38', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'tidak bisa di approve'),
('1903141440127708013', '1903050922414427383', '2019-03-14 14:40:12', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'tidak bisa di approve'),
('1903141440177198541', '1903050922414427383', '2019-03-14 14:40:17', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'tidak bisa di approve'),
('1903150845062441694', '1903150841576896678', '2019-03-15 08:45:06', 'CYNTHIA FELLICIANNE', 'Ditolak ATASAN PENCIPTA', 'edit lagi\r\n'),
('1903171724586509647', '1903171711301885316', '2019-03-17 17:24:58', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'tambahkan agar dapat digunakan oleh departemen HI\r\n'),
('1903171752203170724', '1903171744259661130', '2019-03-17 17:52:20', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Departemen Marketing tidak tampil, sedangkan departemen HI perlu diberikna akses juga terkait opening new store'),
('1903180920289592826', '1903050906241783554', '2019-03-18 09:20:28', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Dokumen Utama dan Dokumen Pelengkap sama'),
('1903180921371124182', '1903050906241783554', '2019-03-18 09:21:37', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Dokumen utama dan dokumen pelengkap isinya sama. Revisi ulang'),
('1903180923283458534', '1903050906241783554', '2019-03-18 09:23:28', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'dokumen utama dan pelengkap sama'),
('1903180945003237014', '1903050906241783554', '2019-03-18 09:45:00', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'revisiupload dokumen'),
('1903181128159342535', '1903181114109063798', '2019-03-18 11:28:15', 'HARRY NUGROHO POERNOMO', 'Ditolak PENDISTRIBUSI', 'Tolak Sirkulasi Dokumen 02 Pengajuan Cuti & Libur'),
('1903181200248437853', '1903181146524339961', '2019-03-18 12:00:24', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Dokumen utama tidak bisa dibuka, cek upload dokumen.'),
('1903181215029526816', '1903181146524339961', '2019-03-18 12:15:02', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'masih belum bisa buka dokumen\r\n'),
('1903191002405097241', '1903181716488822119', '2019-03-19 10:02:40', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Isi lampiran Dokumen Utama dan Dokumen Pelengkap 1, sama. Revisi ulang.'),
('1903191341265780021', '1903191332319102698', '2019-03-19 13:41:26', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'tambahkan departemen IRL'),
('1903191404212535233', '1903191332319102698', '2019-03-19 14:04:21', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'belum ditambahkan departemen IRL'),
('1903191404213029443', '1903191332319102698', '2019-03-19 14:04:21', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'belum ditambahkan departemen IRL'),
('1903201014127248691', '1903201006299867884', '2019-03-20 10:14:12', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Tambahkan departemen IRL di kolom pengguna dokumen'),
('1903201216268448875', '1903180946059317835', '2019-03-20 12:16:26', 'HARRY NUGROHO POERNOMO', 'Ditolak PENDISTRIBUSI', 'TESTING TOLAK'),
('1903201217307200650', '1903180946059317835', '2019-03-20 12:17:30', 'HARRY NUGROHO POERNOMO', 'Ditolak PENDISTRIBUSI', 'TOLAK AH'),
('1903201218285686167', '1903180946059317835', '2019-03-20 12:18:28', 'HARRY NUGROHO POERNOMO', 'Ditolak PENDISTRIBUSI', 'YOI'),
('1903201220083904134', '1903180946059317835', '2019-03-20 12:20:08', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'YIO'),
('1903201542083462919', '1903180946059317835', '2019-03-20 15:42:08', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Tadi sudah ditambahkan departemennya pada saat versioning (PENGKINIAN) \r\ntetapi tidak miuncul di pengguna tuh '),
('1903201751551956078', '1903201627053424414', '2019-03-20 17:51:55', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Mohon upload scan halaman persetujuan (halaman yang ada approval-nya saja)'),
('1903201752066945621', '1903201627054922395', '2019-03-20 17:52:06', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'harap tambahkan dept. ACC sebagai pengguna'),
('1903220918457868592', '1903180946059317835', '2019-03-22 09:18:45', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Dok. Latihan'),
('1903220929259262863', '1903141910315360253', '2019-03-22 09:29:25', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'dok latihan\r\n'),
('1903220929457597353', '1903142054476982363', '2019-03-22 09:29:45', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'Dok Latihan'),
('1903220930084171872', '1903142054476982363', '2019-03-22 09:30:08', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'Dok Latihan'),
('1903220930218113136', '1903142054476982363', '2019-03-22 09:30:21', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'Dok Latihan'),
('1903220930407525813', '1903191332319102698', '2019-03-22 09:30:40', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'Dok LAtihan'),
('1903220931062747773', '1903142054476982363', '2019-03-22 09:31:06', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'Dok Latihan\r\n'),
('1903221721277375337', '1903201656376038452', '2019-03-22 17:21:27', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'harap perbaiki abstrak'),
('1904040130209274884', '1904040108102680536', '2019-04-04 01:30:20', 'ANTHONY PAMUNGKAS', 'Ditolak ATASAN PENCIPTA', 'rubah untuk pengetesanreject'),
('1904040200064129014', '1904040057435504413', '2019-04-04 02:00:06', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'ganti distribusi'),
('1904081636307091654', '1903162038142399837', '2019-04-08 16:36:30', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'dhdfsg'),
('1904081636322334020', '1903162038142399837', '2019-04-08 16:36:32', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'dhdfsg'),
('1904081646118645612', '1903162038142399837', '2019-04-08 16:46:11', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'vutsgjvsj'),
('1904121526136952244', '1904121454279989841', '2019-04-12 15:26:13', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Ditolak,\r\nharap diupdate kata kuncinya'),
('1904150956055046667', '1904150903281955566', '2019-04-15 09:56:05', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Mohon Tambah Kata kuncinya'),
('1904160843117253212', '1904150903281955566', '2019-04-16 08:43:11', 'CYNTHIA FELLICIANNE', 'Ditolak ATASAN PENCIPTA', 'Tambahkan Pengguna '),
('1904221435085363234', '1904221025083646425', '2019-04-22 14:35:08', 'NIDIA', 'Ditolak PENDISTRIBUSI', 'Upload salah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_form`
--

CREATE TABLE `tb_document_form` (
  `DTFM_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTFM_NAME` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_form`
--

INSERT INTO `tb_document_form` (`DTFM_ID`, `DTFM_NAME`) VALUES
('HCD', 'HARDCOPY'),
('SCD', 'SOFTCOPY');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_level_access`
--

CREATE TABLE `tb_document_level_access` (
  `DTLLAS_ID` varchar(150) NOT NULL DEFAULT '-',
  `DTLLAS_TYPE` varchar(150) NOT NULL DEFAULT '-' COMMENT 'VISI',
  `DTLLAS_SECURITY` varchar(150) NOT NULL DEFAULT '-' COMMENT 'CONFIDENTIAL',
  `DTLLAS_DEPT_AL_VIEW` text NOT NULL,
  `DTLLAS_DEPT_AL_DOWNLOAD` text NOT NULL,
  `DTLLAS_DEPT_ACCESS_LEVEL` text NOT NULL,
  `DTLLAS_DEPT_DIST` text NOT NULL,
  `DTLLAS_DATE` datetime NOT NULL,
  `UR_ID` varchar(150) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_link`
--

CREATE TABLE `tb_document_link` (
  `LINK_ID` varchar(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `TOKEN` int(255) NOT NULL,
  `LINK_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_link`
--

INSERT INTO `tb_document_link` (`LINK_ID`, `DOC_ID`, `TOKEN`, `LINK_TIME`) VALUES
('012715514d7001e0fcf45cb562929af3', '1903201404014149976', 825153, '2019-03-21 14:23:29'),
('0daa2d40d19e0eb60f456ec9629fbce5', '1904161020164804913', 34671, '2019-04-17 11:42:58'),
('0ea33e987b709afdfe8d53541c8dcfc7', '1903221705362472794', 534919, '2019-03-23 17:58:21'),
('14a7e24e1ee9094498092f6651d16d34', '1903180946059317835', 745177, '2019-03-21 11:44:11'),
('235c5597d71467dfd999f8002fa7ef20', '1903162038142399837', 495025, '2019-04-10 06:15:29'),
('35bdf9b27f6bd0798945c8fe7344180d', '1903162038142399837', 983263, '2019-04-10 06:14:28'),
('7dc8e30728743e1e2708e21771c9f75e', '1903050906241783554', 881372, '2019-03-21 18:17:08'),
('9618b2a6550aefc73176a66c77ae54cf', '1903180946059317835', 171100, '2019-03-19 10:06:16'),
('a4f2de2d87f2733df263b2bac8427065', '1903201623487739413', 249280, '2019-04-17 15:44:43'),
('c0445a88969ea9bf3dc8628a989df28b', '1903050922414427383', 942584, '2019-03-21 09:00:01'),
('d0b89ef06366f79eb72a803014c7a95f', '1903050922414427383', 345152, '2019-03-23 17:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_news`
--

CREATE TABLE `tb_document_news` (
  `NEWS_ID` int(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `UR_ID` varchar(255) NOT NULL,
  `DEPCODE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_news`
--

INSERT INTO `tb_document_news` (`NEWS_ID`, `DOC_ID`, `UR_ID`, `DEPCODE`) VALUES
(80, '1903031420197239685', '150443', '7550'),
(85, '1903031420197239685', '151009', '7550'),
(135, '1903031420197239685', '212383', '7550'),
(336, '1903031420197239685', '209686', '7550'),
(1212, '1903150841576896678', '171314', '7550'),
(1233, '1903150841576896678', '150443', '7550'),
(1236, '1903150841576896678', '151009', '7550'),
(1262, '1903150841576896678', '212383', '7550'),
(1320, '1903150841576896678', '209686', '7550'),
(1474, '1903180914206053569', '171314', '7550'),
(1495, '1903180914206053569', '150443', '7550'),
(1498, '1903180914206053569', '151009', '7550'),
(1524, '1903180914206053569', '212383', '7550'),
(1583, '1903180914206053569', '209686', '7550'),
(1594, '1903050922414427383', '171314', '7550'),
(1615, '1903050922414427383', '150443', '7550'),
(1618, '1903050922414427383', '151009', '7550'),
(1644, '1903050922414427383', '212383', '7550'),
(1703, '1903050922414427383', '209686', '7550'),
(1714, '1903181146524339961', '171314', '7550'),
(1735, '1903181146524339961', '150443', '7550'),
(1738, '1903181146524339961', '151009', '7550'),
(1764, '1903181146524339961', '212383', '7550'),
(1823, '1903181146524339961', '209686', '7550'),
(1835, '1903181716488822119', '171314', '7550'),
(1856, '1903181716488822119', '150443', '7550'),
(1859, '1903181716488822119', '151009', '7550'),
(1885, '1903181716488822119', '212383', '7550'),
(1944, '1903181716488822119', '209686', '7550'),
(2078, '1903201404014149976', '171314', '7550'),
(2099, '1903201404014149976', '150443', '7550'),
(2102, '1903201404014149976', '151009', '7550'),
(2129, '1903201404014149976', '212383', '7550'),
(2273, '1903171711301885316', '171314', '7550'),
(2294, '1903171711301885316', '150443', '7550'),
(2297, '1903171711301885316', '151009', '7550'),
(2324, '1903171711301885316', '212383', '7550'),
(2398, '1903171711301885316', '209686', '7550'),
(2415, '1903201006299867884', '171314', '7550'),
(2436, '1903201006299867884', '150443', '7550'),
(2439, '1903201006299867884', '151009', '7550'),
(2466, '1903201006299867884', '212383', '7550'),
(2540, '1903201006299867884', '209686', '7550'),
(2557, '1903201656376038452', '171314', '7550'),
(2578, '1903201656376038452', '150443', '7550'),
(2581, '1903201656376038452', '151009', '7550'),
(2608, '1903201656376038452', '212383', '7550'),
(2682, '1903201656376038452', '209686', '7550'),
(2839, '1903201627054922395', '171314', '7550'),
(2860, '1903201627054922395', '150443', '7550'),
(2863, '1903201627054922395', '151009', '7550'),
(2890, '1903201627054922395', '212383', '7550'),
(2964, '1903201627054922395', '209686', '7550'),
(3123, '1903141910315360253', '171314', '7550'),
(3144, '1903141910315360253', '150443', '7550'),
(3147, '1903141910315360253', '151009', '7550'),
(3174, '1903141910315360253', '212383', '7550'),
(3248, '1903141910315360253', '209686', '7550'),
(3466, '1903142054476982363', '171314', '7550'),
(3487, '1903142054476982363', '150443', '7550'),
(3490, '1903142054476982363', '151009', '7550'),
(3517, '1903142054476982363', '212383', '7550'),
(3533, '1903050906241783554', '171314', '7550'),
(3556, '1903201641246109276', '171314', '7550'),
(3559, '1903201641246109276', '204017', '7924'),
(3577, '1903201641246109276', '150443', '7550'),
(3580, '1903201641246109276', '151009', '7550'),
(3591, '1903201641246109276', '190164', '7924'),
(3593, '1903201641246109276', '206329', '7924'),
(3607, '1903201641246109276', '212383', '7550'),
(3618, '1903180946059317835', '171314', '7550'),
(3622, '1903180946059317835', '204017', '7924'),
(3640, '1903180946059317835', '150443', '7550'),
(3643, '1903180946059317835', '151009', '7550'),
(3654, '1903180946059317835', '190164', '7924'),
(3656, '1903180946059317835', '206329', '7924'),
(3670, '1903180946059317835', '212383', '7550'),
(3744, '1903180946059317835', '209686', '7550'),
(3902, '1903201623487739413', '171314', '7550'),
(3906, '1903201623487739413', '204017', '7924'),
(3924, '1903201623487739413', '150443', '7550'),
(3927, '1903201623487739413', '151009', '7550'),
(3938, '1903201623487739413', '190164', '7924'),
(3940, '1903201623487739413', '206329', '7924'),
(3954, '1903201623487739413', '212383', '7550'),
(4028, '1903201623487739413', '209686', '7550'),
(4045, '1903221637442174595', '171314', '7550'),
(4049, '1903221637442174595', '204017', '7924'),
(4067, '1903221637442174595', '150443', '7550'),
(4070, '1903221637442174595', '151009', '7550'),
(4081, '1903221637442174595', '190164', '7924'),
(4083, '1903221637442174595', '206329', '7924'),
(4097, '1903221637442174595', '212383', '7550'),
(4171, '1903221637442174595', '209686', '7550'),
(4189, '1903221637511979170', '171314', '7550'),
(4193, '1903221637511979170', '204017', '7924'),
(4211, '1903221637511979170', '150443', '7550'),
(4214, '1903221637511979170', '151009', '7550'),
(4225, '1903221637511979170', '190164', '7924'),
(4227, '1903221637511979170', '206329', '7924'),
(4241, '1903221637511979170', '212383', '7550'),
(4250, '1903221705362472794', '171314', '7550'),
(4254, '1903221705362472794', '204017', '7924'),
(4272, '1903221705362472794', '150443', '7550'),
(4275, '1903221705362472794', '151009', '7550'),
(4286, '1903221705362472794', '190164', '7924'),
(4288, '1903221705362472794', '206329', '7924'),
(4302, '1903221705362472794', '212383', '7550'),
(4376, '1903221705362472794', '209686', '7550'),
(4391, '1903201626163202050', '171314', '7550'),
(4395, '1903201626163202050', '204017', '7924'),
(4413, '1903201626163202050', '150443', '7550'),
(4416, '1903201626163202050', '151009', '7550'),
(4427, '1903201626163202050', '190164', '7924'),
(4429, '1903201626163202050', '206329', '7924'),
(4443, '1903201626163202050', '212383', '7550'),
(4517, '1903201626163202050', '209686', '7550'),
(4532, '1903181330113183895', '171314', '7550'),
(4536, '1903181330113183895', '204017', '7924'),
(4554, '1903181330113183895', '150443', '7550'),
(4557, '1903181330113183895', '151009', '7550'),
(4567, '1903181330113183895', '190164', '7924'),
(4569, '1903181330113183895', '206329', '7924'),
(4583, '1903181330113183895', '212383', '7550'),
(4656, '1903181330113183895', '209686', '7550'),
(4814, '1903170940409388080', '171314', '7550'),
(4818, '1903170940409388080', '204017', '7924'),
(4836, '1903170940409388080', '150443', '7550'),
(4839, '1903170940409388080', '151009', '7550'),
(4849, '1903170940409388080', '190164', '7924'),
(4852, '1903170940409388080', '206329', '7924'),
(4866, '1903170940409388080', '212383', '7550'),
(4938, '1904040108102680536', '171314', '7550'),
(4942, '1904040108102680536', '204017', '7924'),
(4960, '1904040108102680536', '150443', '7550'),
(4963, '1904040108102680536', '151009', '7550'),
(4973, '1904040108102680536', '190164', '7924'),
(4976, '1904040108102680536', '206329', '7924'),
(4990, '1904040108102680536', '212383', '7550'),
(5063, '1904040108102680536', '209686', '7550'),
(5202, '1904040057435504413', '171314', '7550'),
(5206, '1904040057435504413', '204017', '7924'),
(5224, '1904040057435504413', '150443', '7550'),
(5227, '1904040057435504413', '151009', '7550'),
(5237, '1904040057435504413', '190164', '7924'),
(5240, '1904040057435504413', '206329', '7924'),
(5254, '1904040057435504413', '212383', '7550'),
(5407, '1903162038142399837', '171314', '7550'),
(5411, '1903162038142399837', '204017', '7924'),
(5429, '1903162038142399837', '150443', '7550'),
(5432, '1903162038142399837', '151009', '7550'),
(5442, '1903162038142399837', '190164', '7924'),
(5445, '1903162038142399837', '206329', '7924'),
(5459, '1903162038142399837', '212383', '7550'),
(5533, '1903162038142399837', '209686', '7550'),
(5977, '1904150903281955566', '171314', '7550'),
(5981, '1904150903281955566', '204017', '7924'),
(5999, '1904150903281955566', '150443', '7550'),
(6002, '1904150903281955566', '151009', '7550'),
(6012, '1904150903281955566', '190164', '7924'),
(6015, '1904150903281955566', '206329', '7924'),
(6029, '1904150903281955566', '212383', '7550'),
(6104, '1904150903281955566', '209686', '7550'),
(6126, '1904121454279989841', '171314', '7550'),
(6130, '1904121454279989841', '204017', '7924'),
(6148, '1904121454279989841', '150443', '7550'),
(6151, '1904121454279989841', '151009', '7550'),
(6161, '1904121454279989841', '190164', '7924'),
(6164, '1904121454279989841', '206329', '7924'),
(6178, '1904121454279989841', '212383', '7550'),
(6253, '1904121454279989841', '209686', '7550'),
(6275, '1904161020164804913', '171314', '7550'),
(6279, '1904161020164804913', '204017', '7924'),
(6297, '1904161020164804913', '150443', '7550'),
(6300, '1904161020164804913', '151009', '7550'),
(6310, '1904161020164804913', '190164', '7924'),
(6313, '1904161020164804913', '206329', '7924'),
(6327, '1904161020164804913', '212383', '7550'),
(6402, '1904161020164804913', '209686', '7550'),
(6418, '1904161026136248169', '171314', '7550'),
(6422, '1904161026136248169', '204017', '7924'),
(6440, '1904161026136248169', '150443', '7550'),
(6443, '1904161026136248169', '151009', '7550'),
(6453, '1904161026136248169', '190164', '7924'),
(6456, '1904161026136248169', '206329', '7924'),
(6470, '1904161026136248169', '212383', '7550'),
(6545, '1904161026136248169', '209686', '7550'),
(6561, '1903180911113091034', '171314', '7550'),
(6565, '1903180911113091034', '204017', '7924'),
(6583, '1903180911113091034', '150443', '7550'),
(6586, '1903180911113091034', '151009', '7550'),
(6596, '1903180911113091034', '190164', '7924'),
(6599, '1903180911113091034', '206329', '7924'),
(6613, '1903180911113091034', '212383', '7550'),
(6688, '1903180911113091034', '209686', '7550'),
(6704, '1903180919514736897', '171314', '7550'),
(6708, '1903180919514736897', '204017', '7924'),
(6717, '1903180919514736897', '210569', '7527'),
(6726, '1903180919514736897', '150443', '7550'),
(6729, '1903180919514736897', '151009', '7550'),
(6733, '1903180919514736897', '170236', '7527'),
(6739, '1903180919514736897', '190164', '7924'),
(6742, '1903180919514736897', '206329', '7924'),
(6756, '1903180919514736897', '212383', '7550'),
(6802, '1903180919514736897', '171318', '7527'),
(6805, '1903180919514736897', '171404', '7527'),
(6831, '1903180919514736897', '209686', '7550'),
(6848, '1904241016215937786', '171314', '7550'),
(6852, '1904241016215937786', '204017', '7924'),
(6861, '1904241016215937786', '210569', '7527'),
(6870, '1904241016215937786', '150443', '7550'),
(6873, '1904241016215937786', '151009', '7550'),
(6877, '1904241016215937786', '170236', '7527'),
(6883, '1904241016215937786', '190164', '7924'),
(6886, '1904241016215937786', '206329', '7924'),
(6900, '1904241016215937786', '212383', '7550'),
(6946, '1904241016215937786', '171318', '7527'),
(6949, '1904241016215937786', '171404', '7527'),
(6975, '1904241016215937786', '209686', '7550'),
(6983, '1904241016215937786', '151010', '5901'),
(6984, '1904241016215937786', '200054', '5901');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_notification`
--

CREATE TABLE `tb_document_notification` (
  `NOTIF_ID` int(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `UR_ID` varchar(255) NOT NULL,
  `PENDISTRIBUSI` text,
  `PEMILIK` text,
  `PENGGUNA` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_notification`
--

INSERT INTO `tb_document_notification` (`NOTIF_ID`, `DOC_ID`, `UR_ID`, `PENDISTRIBUSI`, `PEMILIK`, `PENGGUNA`) VALUES
(40, '1903171711301885316', '', '7550', '6563', '5882|5893|5898|6563|7550|7924'),
(41, '1903171719262822556', '', '7550', '7550', '7550|7924'),
(42, '1903171744259661130', '', '7550', '6563', '6563|7550|7924'),
(43, '1903180911113091034', '', '7550', '5904', '5904|7550|7924'),
(44, '1903180919514736897', '', '7550', '5904', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(46, '1903180946059317835', '', '7550', '5904', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(47, '1903181002417186873', '', '7550', '5904', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(64, '1903181114109063798', '', '7550', '5904', '5904|7550|7924'),
(83, '1903181519084810445', '', '7550', '6563', '6563|7550|7924'),
(85, '1903191332319102698', '', '7550', '6563', '5882|6563|7550|7924'),
(98, '1903142054476982363', '207316', '6563', '6563', NULL),
(99, '1903142054476982363', '210569', '6563', '6563', NULL),
(100, '1903142054476982363', '211577', '6563', '6563', NULL),
(101, '1903142054476982363', '212383', '6563', '6563', NULL),
(125, '1903201006299867884', '', '7550', '6563', '5882|5922|5942|6563|7550|7924'),
(126, '1903201207573824411', '', '7550', '6563', '6563|7550|7924'),
(150, '1903201404014149976', '', '7550', '6563', '6563|7550|7924|5882|5904|5922|5926|5942'),
(151, '1903201626163202050', '', '7550', '6540', '7550|6540|7550|7924'),
(152, '1903201623487739413', '', '7550', '6563', '5893|1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(153, '1903201641246109276', '', '7550', '5926', '5926|6684|7550|7924'),
(154, '1903201656376038452', '', '7550', '6837', '6837|7550|7924'),
(156, '1903201627053424414', '', '7550', '7013', '6685|1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(157, '1903201735347302757', '', '7550', '6563', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(158, '1903211356343481427', '', '7550', '6563', '7550'),
(159, '1903221645108347192', '', '5901', '5922', '5922|6540|7550|7924'),
(161, '1903221643485217289', '', '7550', '6540', '5922|6540|7550|7924'),
(162, '1903221637432531222', '', '7550', '6837', '6837|6837|7550|7564|7924'),
(163, '1903221637442174595', '', '7550', '7762', '7550|7762|7924'),
(164, '1903221705362472794', '', '7550', '6540', '6540|7550|7924'),
(165, '1903221708013233733', '', '7550', '7527', '5922|6551|7527|7550|7761|7762|7924'),
(166, '1903221637511979170', '097097', NULL, NULL, NULL),
(167, '1903221637511979170', '099305', NULL, NULL, NULL),
(168, '1903221637511979170', '140491', NULL, NULL, NULL),
(169, '1903221637511979170', '150381', NULL, NULL, NULL),
(170, '1903221637511979170', '150443', NULL, NULL, NULL),
(171, '1903221637511979170', '150521', NULL, NULL, NULL),
(172, '1903221637511979170', '151009', NULL, NULL, NULL),
(173, '1903221637511979170', '160997', NULL, NULL, NULL),
(174, '1903221637511979170', '170007', NULL, NULL, NULL),
(175, '1903221637511979170', '170236', NULL, NULL, NULL),
(176, '1903221637511979170', '170406', NULL, NULL, NULL),
(177, '1903221637511979170', '171251', NULL, NULL, NULL),
(178, '1903221637511979170', '171270', NULL, NULL, NULL),
(179, '1903221637511979170', '171314', NULL, NULL, NULL),
(180, '1903221637511979170', '180580', NULL, NULL, NULL),
(181, '1903221637511979170', '180887', NULL, NULL, NULL),
(182, '1903221637511979170', '200054', NULL, NULL, NULL),
(183, '1903221637511979170', '206329', NULL, NULL, NULL),
(184, '1903221637511979170', '206366', NULL, NULL, NULL),
(185, '1903221637511979170', '207316', NULL, NULL, NULL),
(186, '1903221637511979170', '210546', NULL, NULL, NULL),
(187, '1903221637511979170', '210569', NULL, NULL, NULL),
(188, '1903221637511979170', '211363', NULL, NULL, NULL),
(189, '1903221637511979170', '211374', NULL, NULL, NULL),
(190, '1903221637511979170', '211577', NULL, NULL, NULL),
(191, '1903221637511979170', '212383', NULL, NULL, NULL),
(192, '1903221637511979170', '', NULL, NULL, NULL),
(193, '1903050922414427383', '150443', NULL, NULL, NULL),
(194, '1903050922414427383', '151009', NULL, NULL, NULL),
(195, '1903050922414427383', '171314', NULL, NULL, NULL),
(196, '1903050922414427383', '212383', NULL, NULL, NULL),
(197, '1903050922414427383', '170236', NULL, NULL, NULL),
(198, '1903050922414427383', '200054', NULL, NULL, NULL),
(199, '1903201627054922395', '097097', NULL, NULL, NULL),
(200, '1903201627054922395', '099305', NULL, NULL, NULL),
(201, '1903201627054922395', '140491', NULL, NULL, NULL),
(202, '1903201627054922395', '150381', NULL, NULL, NULL),
(203, '1903201627054922395', '150443', NULL, NULL, NULL),
(204, '1903201627054922395', '150521', NULL, NULL, NULL),
(205, '1903201627054922395', '151009', NULL, NULL, NULL),
(206, '1903201627054922395', '160997', NULL, NULL, NULL),
(207, '1903201627054922395', '170007', NULL, NULL, NULL),
(208, '1903201627054922395', '170236', NULL, NULL, NULL),
(209, '1903201627054922395', '170406', NULL, NULL, NULL),
(210, '1903201627054922395', '171251', NULL, NULL, NULL),
(211, '1903201627054922395', '171270', NULL, NULL, NULL),
(212, '1903201627054922395', '171314', NULL, NULL, NULL),
(213, '1903201627054922395', '180580', NULL, NULL, NULL),
(214, '1903201627054922395', '180887', NULL, NULL, NULL),
(215, '1903201627054922395', '200054', NULL, NULL, NULL),
(216, '1903201627054922395', '206329', NULL, NULL, NULL),
(217, '1903201627054922395', '206366', NULL, NULL, NULL),
(218, '1903201627054922395', '207316', NULL, NULL, NULL),
(219, '1903201627054922395', '210546', NULL, NULL, NULL),
(220, '1903201627054922395', '210569', NULL, NULL, NULL),
(221, '1903201627054922395', '211363', NULL, NULL, NULL),
(222, '1903201627054922395', '211374', NULL, NULL, NULL),
(223, '1903201627054922395', '211577', NULL, NULL, NULL),
(224, '1903201627054922395', '212383', NULL, NULL, NULL),
(225, '1903201627054922395', '', NULL, NULL, NULL),
(226, '1903271005521122252', '', '7550', '7527', '5926|5942|7013|7239|7527|7550|7924'),
(227, '1903271100144059466', '', '7550', '6563', '6563|7550|7924'),
(237, '1903170940409388080', '150443', NULL, NULL, NULL),
(238, '1903170940409388080', '151009', NULL, NULL, NULL),
(239, '1903170940409388080', '171314', NULL, NULL, NULL),
(240, '1903170940409388080', '212383', NULL, NULL, NULL),
(241, '1903170940409388080', '140491', NULL, NULL, NULL),
(242, '1903170940409388080', '171270', NULL, NULL, NULL),
(243, '1904040108102680536', '092022', NULL, NULL, NULL),
(244, '1904040108102680536', '097097', NULL, NULL, NULL),
(245, '1904040108102680536', '099305', NULL, NULL, NULL),
(246, '1904040108102680536', '140491', NULL, NULL, NULL),
(247, '1904040108102680536', '150381', NULL, NULL, NULL),
(248, '1904040108102680536', '150443', NULL, NULL, NULL),
(249, '1904040108102680536', '150521', NULL, NULL, NULL),
(250, '1904040108102680536', '151009', NULL, NULL, NULL),
(251, '1904040108102680536', '160997', NULL, NULL, NULL),
(252, '1904040108102680536', '170007', NULL, NULL, NULL),
(253, '1904040108102680536', '170236', NULL, NULL, NULL),
(254, '1904040108102680536', '170406', NULL, NULL, NULL),
(255, '1904040108102680536', '171251', NULL, NULL, NULL),
(256, '1904040108102680536', '171270', NULL, NULL, NULL),
(257, '1904040108102680536', '171314', NULL, NULL, NULL),
(258, '1904040108102680536', '180580', NULL, NULL, NULL),
(259, '1904040108102680536', '180887', NULL, NULL, NULL),
(260, '1904040108102680536', '200054', NULL, NULL, NULL),
(261, '1904040108102680536', '204017', NULL, NULL, NULL),
(262, '1904040108102680536', '206329', NULL, NULL, NULL),
(263, '1904040108102680536', '206366', NULL, NULL, NULL),
(264, '1904040108102680536', '207316', NULL, NULL, NULL),
(265, '1904040108102680536', '208171', NULL, NULL, NULL),
(266, '1904040108102680536', '210546', NULL, NULL, NULL),
(267, '1904040108102680536', '210569', NULL, NULL, NULL),
(268, '1904040108102680536', '211363', NULL, NULL, NULL),
(269, '1904040108102680536', '211374', NULL, NULL, NULL),
(270, '1904040108102680536', '211577', NULL, NULL, NULL),
(271, '1904040108102680536', '212383', NULL, NULL, NULL),
(272, '1904040108102680536', '', NULL, NULL, NULL),
(274, '1903181330113183895', '', '7550', '6563', '5882|5893|5898|5904|5922|5926|5942|6467|6473|6526|6534|6540|6551|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924'),
(275, '1903162038142399837', '', '7550', '6563', '6563|7550|7924|5898'),
(276, '1904121454279989841', '', '7550', '6563', '5882|5893|5898|5904|5922|5926|5942|6467|6473|6526|6534|6540|6551|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924|6494|6559|7081|7488|7494|7761|7762'),
(278, '1904150938051405212', '', '7550', '7924', '5922|5942|7239|7550|7924'),
(281, '1904161026136248169', '', '7550', '7527', '7527|7550|7924'),
(282, '1904161020164804913', '', '7550', NULL, '7527|7550|7924'),
(283, '1904150903281955566', '', '7550', NULL, '7527|7550|7924|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7555|7562|7564|7591|7596|7603|7761|7762|7769'),
(284, '1904221025083646425', '', '7550', '7550', '7550|7924'),
(285, '1904241016215937786', '', '7527', '7527', '7527|7550|7924'),
(286, '1904250722344439233', '', '7550', '6563', '6563|7550|7924'),
(287, '1904250726174649213', '', '7550', '5904', '5882|5904|7550|7924'),
(288, '1904250838472519918', '', '7550', '5904', '5904|7550|7924'),
(289, '1904262247456400812', '', '6538', '6563', '6563|7550|7924'),
(290, '1905020817431312386', '', '7527', '7527', '7527|7550|7924');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_status`
--

CREATE TABLE `tb_document_status` (
  `DTSS_ID` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_status`
--

INSERT INTO `tb_document_status` (`DTSS_ID`) VALUES
('DIARSIP'),
('DIPERBAHARUI'),
('DIPUBLIKASI'),
('KADALUARSA'),
('MENUNGGU');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_structure_jenis`
--

CREATE TABLE `tb_document_structure_jenis` (
  `DTSEJS_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEKI_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEJS_JENIS` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_structure_jenis`
--

INSERT INTO `tb_document_structure_jenis` (`DTSEJS_ID`, `DTSEKI_ID`, `DTSEJS_JENIS`) VALUES
('DTSEJS0001', 'DTSEKI0001', 'VISI'),
('DTSEJS0002', 'DTSEKI0001', 'MISI'),
('DTSEJS0003', 'DTSEKI0001', 'CORPORATE VALUE'),
('DTSEJS0004', 'DTSEKI0001', 'KODE ETIK PERUSAHAAN'),
('DTSEJS0005', 'DTSEKI0001', 'VALUE CHAIN MAP'),
('DTSEJS0006', 'DTSEKI0001', 'KELENGKAPAN PERIJINAN PERUSAHAAN'),
('DTSEJS0007', 'DTSEKI0001', 'SERTIFIKAT DAN STANDARISASI'),
('DTSEJS0008', 'DTSEKI0001', 'BALANCED SCORECARD PERUSAHAAN'),
('DTSEJS0009', 'DTSEKI0001', 'DOK. EKSTERNAL'),
('DTSEJS0010', 'DTSEKI0002', 'PERNYATAAN KEBIJAKAN PERUSAHAAN'),
('DTSEJS0011', 'DTSEKI0002', 'STRUKTUR ORGANISASI'),
('DTSEJS0012', 'DTSEKI0002', 'JOB SUMMARY'),
('DTSEJS0013', 'DTSEKI0002', 'BALANCED SCORECARD'),
('DTSEJS0014', 'DTSEKI0002', 'PANDUAN MANUAL MUTU PRODUK'),
('DTSEJS0015', 'DTSEKI0002', 'DOK. EKSTERNAL'),
('DTSEJS0016', 'DTSEKI0003', 'PROSEDUR'),
('DTSEJS0017', 'DTSEKI0003', 'PROSEDUR DETIL'),
('DTSEJS0018', 'DTSEKI0003', 'DOKUMEN PENUNJANG PROSEDUR'),
('DTSEJS0019', 'DTSEKI0003', 'FORMULIR'),
('DTSEJS0020', 'DTSEKI0003', 'DOK. EKSTERNAL'),
('DTSEJS0021', 'DTSEKI0004', 'COMMUNICATION'),
('DTSEJS0022', 'DTSEKI0004', 'EDUCATION'),
('DTSEJS0023', 'DTSEKI0004', 'REPORT'),
('DTSEJS0024', 'DTSEKI0004', 'DOK. EKSTERNAL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_structure_kategori`
--

CREATE TABLE `tb_document_structure_kategori` (
  `DTSEKI_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEKI_KATEGORI` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_structure_kategori`
--

INSERT INTO `tb_document_structure_kategori` (`DTSEKI_ID`, `DTSEKI_KATEGORI`) VALUES
('DTSEKI0001', 'COMPANY PROFILE'),
('DTSEKI0002', 'KEBIJAKAN & STRUKTUR ORGANISASI'),
('DTSEKI0003', 'PROSEDUR & DOK. PENUNJANG'),
('DTSEKI0004', 'REKAMAN');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_structure_tipe`
--

CREATE TABLE `tb_document_structure_tipe` (
  `DTSETE_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEJS_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEKI_ID` varchar(255) NOT NULL,
  `DTSETE_TIPE` varchar(255) NOT NULL DEFAULT '-',
  `DTSETE_SINGKATAN` varchar(255) NOT NULL DEFAULT '-',
  `CL_ID` varchar(255) NOT NULL DEFAULT '-',
  `JBLL_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSETE_DOWNLOAD` varchar(255) NOT NULL DEFAULT 'None',
  `JBLL_DOWNLOAD` text NOT NULL,
  `DTSETE_ACCESS` text NOT NULL,
  `DTSETE_DISTRIBUTION` varchar(255) NOT NULL DEFAULT 'None',
  `DTSETE_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `WATERMARK` varchar(255) NOT NULL DEFAULT 'Copyright of Bakmi GM'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_structure_tipe`
--

INSERT INTO `tb_document_structure_tipe` (`DTSETE_ID`, `DTSEJS_ID`, `DTSEKI_ID`, `DTSETE_TIPE`, `DTSETE_SINGKATAN`, `CL_ID`, `JBLL_ID`, `DTSETE_DOWNLOAD`, `JBLL_DOWNLOAD`, `DTSETE_ACCESS`, `DTSETE_DISTRIBUTION`, `DTSETE_ACTIVE`, `WATERMARK`) VALUES
('DTSETE0001', 'DTSEJS0001', 'DTSEKI0001', 'VISI', 'VIS', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0002', 'DTSEJS0002', 'DTSEKI0001', 'MISI', 'MIS', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0003', 'DTSEJS0003', 'DTSEKI0001', 'CORPORATE VALUE', 'CPV', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0004', 'DTSEJS0004', 'DTSEKI0001', 'KODE ETIK PERUSAHAAN', 'KEP', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0005', 'DTSEJS0005', 'DTSEKI0001', 'VALUE CHAIN MAP', 'VCM', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0006', 'DTSEJS0006', 'DTSEKI0001', 'KELENGKAPAN PERIJINAN PERUSAHAAN', 'KPP\n', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0007', 'DTSEJS0007', 'DTSEKI0001', 'SERTIFIKAT DAN STANDARISASI', 'SSS', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0008', 'DTSEJS0008', 'DTSEKI0001', 'BALANCED SCORECARD PERUSAHAAN', 'BSC', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0010', 'DTSEJS0010', 'DTSEKI0002', 'PERNYATAAN KEBIJAKAN PERUSAHAAN', 'PKP', 'CONF', 'JNSPV', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0011', 'DTSEJS0011', 'DTSEKI0002', 'STRUKTUR ORGANISASI', 'STO', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0012', 'DTSEJS0012', 'DTSEKI0002', 'JOB SUMMARY', 'JBS', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0013', 'DTSEJS0013', 'DTSEKI0002', 'BALANCED SCORECARD DIVISI', 'BSC', 'REST', 'JNMGR', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0014', 'DTSEJS0013', 'DTSEKI0002', 'BALANCED SCORECARD UNIT KERJA', 'BSC', 'CONF', 'JNSPV', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0015', 'DTSEJS0014', 'DTSEKI0002', 'MANUAL SISTEM JAMINAN HALAL', 'MNL', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0016', 'DTSEJS0014', 'DTSEKI0002', 'BILL OF MATERIAL', 'BOM', 'REST', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0017', 'DTSEJS0014', 'DTSEKI0002', 'PRODUK SPESIFIKASI', 'SPC', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0018', 'DTSEJS0015', 'DTSEKI0002', 'STANDAR BAHAN DAN BUMBU\n', 'SBB', 'REST', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0019', 'DTSEJS0016', 'DTSEKI0003', 'BUSINESS PROCESS MAPPING', 'BPM', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0020', 'DTSEJS0016', 'DTSEKI0003', 'OPERATION PROCESS CHART', 'OPC', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0021', 'DTSEJS0016', 'DTSEKI0003', 'STANDARD OPERATING PROCEDURE', 'SOP', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0022', 'DTSEJS0016', 'DTSEKI0003', 'SERVICE LEVEL AGREEMENT', 'SLA', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0023', 'DTSEJS0017', 'DTSEKI0003', 'MANUAL', 'MNL', 'CONF', 'STAF', 'JNSPV', 'JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0024', 'DTSEJS0017', 'DTSEKI0003', 'WORK INSTRUCTIONS', 'WIS', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0025', 'DTSEJS0018', 'DTSEKI0003', 'STANDAR', 'STD', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0026', 'DTSEJS0018', 'DTSEKI0003', 'AS BUILT DRAWING', 'ABD', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0027', 'DTSEJS0018', 'DTSEKI0003', 'GAMBAR TEKNIK', 'GTK', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0028', 'DTSEJS0018', 'DTSEKI0003', 'MODUL TRAINING', 'MTR', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0029', 'DTSEJS0019', 'DTSEKI0003', 'FORMULIR', 'FRM', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0030', 'DTSEJS0020', 'DTSEKI0003', 'LEMBAR URAIAN KERJA', 'LUK', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0031', 'DTSEJS0021', 'DTSEKI0004', 'DIRECTOR SPEECH', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0032', 'DTSEJS0021', 'DTSEKI0004', 'MEMO', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0033', 'DTSEJS0021', 'DTSEKI0004', 'PERJANJIAN KERJA KARYAWAN', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0034', 'DTSEJS0021', 'DTSEKI0004', 'BON SEMENTARA', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0035', 'DTSEJS0021', 'DTSEKI0004', 'SURAT PENERIMAAN BARANG', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0036', 'DTSEJS0021', 'DTSEKI0004', 'BUKTI PENERIMAAN KAS KECIL', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0037', 'DTSEJS0021', 'DTSEKI0004', 'MEDIA MARKETING', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0038', 'DTSEJS0021', 'DTSEKI0004', 'BUKTI SERAH TERIMA', 'COM', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0040', 'DTSEJS0022', 'DTSEKI0004', 'KNOWLEDGE ASSET', 'EDU', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0041', 'DTSEJS0022', 'DTSEKI0004', 'SOLUSI PENYELESAIAN KERUSAKAN', 'EDU', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0042', 'DTSEJS0022', 'DTSEKI0004', 'TEMPLATE PROJECT', 'EDU', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0044', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN KEUANGAN', 'RPT', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0045', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN PROGRESS BSC', 'RPT', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0046', 'DTSEJS0023', 'DTSEKI0004', 'NOTULEN', 'RPT', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0047', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN PENJUALAN', 'RPT', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0049', 'DTSEJS0024', 'DTSEKI0004', 'KONTRAK KERJA VENDOR', 'RPT', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_structure_tipe_access`
--

CREATE TABLE `tb_document_structure_tipe_access` (
  `TD_ID` varchar(255) NOT NULL,
  `DTSETE_ID` varchar(255) NOT NULL,
  `TD_DN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_structure_tipe_distribution`
--

CREATE TABLE `tb_document_structure_tipe_distribution` (
  `TDD_ID` varchar(255) NOT NULL,
  `DTSETE_ID` varchar(255) NOT NULL,
  `TDD_DN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_structure_tipe_distribution`
--

INSERT INTO `tb_document_structure_tipe_distribution` (`TDD_ID`, `DTSETE_ID`, `TDD_DN`) VALUES
('10b718de0fceb66e839f95da456f92a3', 'DTSETE0030', '7550'),
('21c3aac9d9fd1f873301e108a6889eb2', 'DTSETE0010', '7550'),
('2bcbc8586f2bbd2a73b1bd28c0afb788', 'DTSETE0021', '7550'),
('2d79a52a374cd0f345a8a9d6ce99cf96', 'DTSETE0023', '7550'),
('3950acb09b8e2732f5f89167fff905f6', 'DTSETE0017', '7550'),
('54fe0715321bce60019713ed27ac1329', 'DTSETE0011', '7550'),
('58bd0bcd5bb1e0e43d1f0c7218b8aee2', 'DTSETE0001', '7494'),
('6c228510decd20ae7b493ae0751f1aec', 'DTSETE0024', '7550'),
('707602527a67431f109e314350f95e5b', 'DTSETE0022', '7550'),
('718a2dacdf015bf642e9873662285d75', 'DTSETE0014', '7550'),
('7e4c29ff4566bfec43656ba4aa571ea9', 'DTSETE0019', '7550'),
('807d1594db9c79c82246df201c7da3e3', 'DTSETE0027', '7550'),
('89e460063eb9620687540c606287f4f7', 'DTSETE0013', '7550'),
('8ae791ba879b557fe356fafbb2c405d5', 'DTSETE0028', '7550'),
('916412641efd79d3ececa75c0fd97e56', 'DTSETE0016', '7550'),
('a63fb2aa051bbb45b72c054ba618cafc', 'DTSETE0026', '7550'),
('aa55a58f28aa32f5d85fe43abacce222', 'DTSETE0020', '7550'),
('bddab4faae662e4c70fba98cde41ce00', 'DTSETE0012', '7550'),
('c358bbd4e84fa07f06e93015b0bb149d', 'DTSETE0018', '7550'),
('e597ffcdac87abd91852c92cbdb56274', 'DTSETE0001', '7559'),
('eba8a34ac766aae56d4eb04e45580fe9', 'DTSETE0015', '7550'),
('f3a206f2a226dfd02697ad726980f3d4', 'DTSETE0025', '7550'),
('fefe5f6bb3fd708e23c318a69c99077b', 'DTSETE0029', '7550');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_template`
--

CREATE TABLE `tb_document_template` (
  `DOCTEMP_ID` varchar(150) NOT NULL DEFAULT '-',
  `DOCTEMP_NAME` varchar(150) NOT NULL DEFAULT '-',
  `DTSEKI_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSEJS_ID` varchar(255) NOT NULL DEFAULT '-',
  `DTSETE_ID` varchar(255) DEFAULT '-',
  `DOCTEMP_GROUP_PROSES` varchar(255) NOT NULL DEFAULT '-',
  `DOCTEMP_PROSES` varchar(255) NOT NULL DEFAULT '-',
  `DOCTEMP_NOMOR` varchar(150) NOT NULL DEFAULT '-',
  `DOCTEMP_NAMA` varchar(150) NOT NULL DEFAULT '-',
  `DOC_WUJUD` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DTFM_ID',
  `DOC_DISTRIBUSI` varchar(255) NOT NULL DEFAULT '-' COMMENT 'DNMD_ID',
  `DOC_KERAHASIAAN` varchar(255) NOT NULL DEFAULT '-' COMMENT 'CL_ID',
  `UR_ID` varchar(150) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_template`
--

INSERT INTO `tb_document_template` (`DOCTEMP_ID`, `DOCTEMP_NAME`, `DTSEKI_ID`, `DTSEJS_ID`, `DTSETE_ID`, `DOCTEMP_GROUP_PROSES`, `DOCTEMP_PROSES`, `DOCTEMP_NOMOR`, `DOCTEMP_NAMA`, `DOC_WUJUD`, `DOC_DISTRIBUSI`, `DOC_KERAHASIAAN`, `UR_ID`) VALUES
('1903050906241783554', 'Manual HSP', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', '', '', 'MNL-HRS-KMS-01', 'Aplikasi Service Desk (Requester Login)', 'HCD', 'EDOC', 'CONF', '170236'),
('1903141353374319124', 'FRM', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM201903/0-1', 'Formulir Pengetahuan Strategis', 'HCD', 'EDOC', 'CONF', '210569'),
('1903141910315360253', 'BPM ITY', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0019', 'GROUP PROSES', 'PROSES', 'BPM201903/015', 'BPM ITY 01', 'HCD', 'EDOC', 'CONF', '140491'),
('1903170940409388080', 'test minggu 1', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201903/020', 'Test Minggu', 'SCD', 'EDOC', 'CONF', '140491'),
('1903171711301885316', 'PROSEDUR TEMPLATE', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/021', 'SETUP PUBLIC HOLIDAY', 'HCD', 'EDOC', 'CONF', '140491'),
('1903171719262822556', 'tes tem', 'DTSEKI0002', 'DTSEJS0011', 'DTSETE0011', 'GROUP PROSES', 'PROSES', 'STO201903/022', 'tes dok', 'HCD', 'EDOC', 'CONF', '171314'),
('1903180911113091034', 'SOP Scheduling', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-SCH-1.3', 'Pengajuan Cuti Mendadak', 'HCD', 'EDOC', 'CONF', '171251'),
('1903180914206053569', 'Job Summary', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS201903/024', 'Job Summary KM Staff', 'HCD', 'EDOC', 'CONF', '170236'),
('1903201623487739413', 'Penilaian Kinerja', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'MNL-PFM-PMPD-1.3.2', 'Sistem Penilaian Kinerja Berbasis Kompetensi KP-CPP', 'HCD', 'EDOC', 'CONF', '170406'),
('1903201626163202050', 'FORM PENGAJUAN KODE BARANG', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'FRM-ERP-SPL-01', 'FORM PENGAJUAN KODE BARANG ( PKB )', 'HCD', 'EDOC', 'CONF', '160997'),
('1903201627053424414', 'Budget', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', '', '', 'PKP-P&B-PKA-1', 'Perencanaan Anggaran', 'HCD', 'EDOC', 'CONF', '180887'),
('1903201627054922395', 'Manual KM', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', '', '', 'MNL-HRS-KMS-001', 'Pelaksanaan Sharing Knowledge Bakmi GM', 'HCD', 'EDOC', 'CONF', '170236'),
('1903201632035911458', 'template SOP penambahan kuota posisi baru', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0024', 'GROUP PROSES', 'PROSES', 'SOP-REC-REC-7.1', 'Penambahan Posisi kuota baru', 'HCD', 'EDOC', 'CONF', '211374'),
('1903201637361153453', 'SOP ', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-IRL-PRS-1.3', 'SETTING HARI LIBUR DI HRIS', 'HCD', 'EDOC', 'CONF', '170007'),
('1903201641246109276', 'Form PKRP', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'FRM-TRN-DEA-012', 'PKRP Seksi Mie-Intermediate & Advance', 'HCD', 'EDOC', 'CONF', '206366'),
('1903201656376038452', 'LSM MIE', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-OPT-FPC-01', 'LSM', 'HCD', 'EDOC', 'CONF', '99305'),
('1903221637401158797', 'SOP tentang buah buahan', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201903/004', 'Biaya Penggantian Olahraga dan Musik', 'HCD', 'EDOC', 'CONF', '210569'),
('1903221637432531222', 'LSM STORE', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-OPT-FPC-01 Ver. 3.12', 'LSM Harian Sie Mie', 'HCD', 'EDOC', 'CONF', '210546'),
('1903221637442174595', 'KAS KECIL', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-FIN-FIN-1.3', 'PENGELUARAN KAS KECIL', 'HCD', 'EDOC', 'CONF', '211363'),
('1903221637511979170', 'SOP PENGELUARAN KAS KECIL', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', '', '', 'PKP-FIN-FIN-2', 'Pengeluaran Dana Kas Kecil', 'HCD', 'EDOC', 'CONF', '150381'),
('1903221637515118611', 'Job Summary', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS-MGM-MAT-11', 'Job Summary Auditor', 'HCD', 'EDOC', 'CONF', '206329'),
('1903221643485217289', 'Formulir tata cara pengajuan kode barang', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-ERP-SPL-02', 'Formulir Pengajuan Kode Barang (PKB)', 'HCD', 'EDOC', 'CONF', '207316'),
('1903221645108347192', 'FORMULIR 1 BPJS KESEHATAN', 'DTSEKI0004', 'DTSEJS0021', 'DTSETE0032', '', '', '004 / MMO-PEM / HR-IRL / I / 2014', 'Pengisian Formulir Daftar Isian Peserta (Formulir 1) - BPJS Kesehatan', 'HCD', 'EMAIL', 'CONF', '150521'),
('1903221705362472794', 'Tata Cara Pengajuan Kode barang', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', '', '', 'FRM-ERP-SPL-02', 'Formulir Pengajuan Kode Barang (PKB)', 'HCD', 'EDOC', 'CONF', '207316'),
('1903221707531689529', 'JOB SUMMARY INTERNAL AUDIT STAFF', 'DTSEKI0002', 'DTSEJS0012', 'DTSETE0012', '', '', 'JBS-FAST-AUD-02', 'INTERNAL AUDIT STAFF', 'HCD', 'EDOC', 'CONF', '170406'),
('1904040057435504413', 'SPJ', 'DTSEKI0002', 'DTSEJS0010', 'DTSETE0010', 'GROUP PROSES', 'PROSES', 'PKP201904/001', 'Rekapitulasi Biaya Perjalanan Dinas', 'SCD', 'EDOC', 'CONF', '140491'),
('1904150903281955566', 'SOP HSP', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP-REC-REC-7.1', 'SOP Penambahan Posisi Baru', 'HCD', 'EDOC', 'CONF', '170236');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_versioning`
--

CREATE TABLE `tb_document_versioning` (
  `DOCV_ID` varchar(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `DOCV_DATE` datetime NOT NULL,
  `DOCV_DETAIL` varchar(255) NOT NULL,
  `DOCV_CATATAN` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_versioning`
--

INSERT INTO `tb_document_versioning` (`DOCV_ID`, `DOC_ID`, `DOCV_DATE`, `DOCV_DETAIL`, `DOCV_CATATAN`) VALUES
('1903141955218879975', '1903031420197239685', '2019-03-14 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'Perubahan Metadata saja'),
('1903181110556865654', '1903180914206053569', '2019-03-18 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'tambah kata kunci'),
('1903181145166369253', '1903150841576896678', '2019-03-18 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'Perubahan Meta Data Dokumen'),
('1903191415026658936', '1903142054476982363', '2019-03-19 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'perubahan metadata dokumen'),
('1903191642443072192', '1903181146524339961', '2019-03-19 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'update versi dokumen'),
('1903201444589017414', '1903181716488822119', '2019-03-20 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'test'),
('1903201540055665880', '1903201404014149976', '2019-03-20 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'versioning hari rabu\r\nada penambahan departemen pengguna'),
('1903221730501991777', '1903221637511979170', '2019-03-22 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'mmmm'),
('1903221743233084977', '1903201627054922395', '2019-03-22 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'nambah dept akses, mat, iad. perpanjnang umur dokumen 2 tahun'),
('1904040139505755672', '1904040057435504413', '2019-04-04 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'Ada file yang perlu update haraga'),
('1904040155044227846', '1904040108102680536', '2019-04-04 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'ada update dokumen pengguna'),
('1904040157354626324', '1904040057435504413', '2019-04-04 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'tadi mkok gk keluar yah'),
('1904081511186578031', '1903162038142399837', '2019-04-08 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'test tanggal 8 april 2019'),
('1904081523237632645', '1904040057435504413', '2019-04-08 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'test versioninb'),
('1904081537318913036', '1904040057435504413', '2019-04-08 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'test perubahan'),
('1904081632455379680', '1903181330113183895', '2019-04-08 00:00:00', 'PERUBAHAN META DATA DOKUMEN', 'test Versioning'),
('1904081635471119974', '1903162038142399837', '2019-04-08 16:35:47', 'PERUBAHAN META DATA DOKUMEN', 'test versioning'),
('1904161206084844442', '1904161026136248169', '2019-04-16 12:06:08', 'PERUBAHAN META DATA DOKUMEN', 'tambah dokumen dwg'),
('1904161210202919774', '1904161020164804913', '2019-04-16 12:10:20', 'PERUBAHAN META DATA DOKUMEN', 'mohon tambah dept.'),
('1904180929228934873', '1904150903281955566', '2019-04-18 09:29:22', 'PERUBAHAN META DATA DOKUMEN', 'Perubahan Akses Pengguna Dokumen');

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `NIP` varchar(12) NOT NULL,
  `USER_NAME` varchar(200) NOT NULL,
  `FULL_NAME` varchar(200) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` text NOT NULL,
  `JOBTITLE` varchar(200) NOT NULL,
  `JOBLVL` varchar(200) NOT NULL,
  `DEPCODE` varchar(200) DEFAULT NULL,
  `DEPNAME` varchar(200) DEFAULT NULL,
  `ORG_PARENT` varchar(200) DEFAULT NULL,
  `SYNC_DATE` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee`
--

INSERT INTO `tb_employee` (`NIP`, `USER_NAME`, `FULL_NAME`, `EMAIL`, `PASSWORD`, `JOBTITLE`, `JOBLVL`, `DEPCODE`, `DEPNAME`, `ORG_PARENT`, `SYNC_DATE`) VALUES
('092022', '092022', 'WINA ANESSIA LEOLITA J.', 'wina.anessia@gmail.com', '', 'Cash Management Supervisor', 'SNSPV', '6551', 'Finance Department', 'FAST', '2019-05-03 06:00:10'),
('097003', '097003', 'RATIH PUTRI HAPSARI', 'ratihputrihapsari@gmail.com', '', 'Cooperatives Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('097097', '097097', 'FRANSISKA K PRABAWA', 'fransiska@bakmigm.co.id', '', 'Ass. Account Payable & Expenses Manager', 'SNMGR', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('099305', '099305', 'KARTIKA ATMADJA', 'albertakartika@gmail.com', '', 'Assistant Costing Manager', 'JNMGR', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('120077', '120077', 'WILLY WIDJAJA', 'wil.widjaja@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('120422', '120422', 'WAHYU KURNIAWAN', 'wahyu.pringgo@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('130057', '130057', 'MELISA ROSALINA', 'melisa.rosalina72@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('130137', '130137', 'TUA MARTHIN HARRY SIAGIAN', 'crozsball@gmail.com', '', 'IT PMO Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('130175', '130175', 'BUN JUN KIONG', 'jk.anakgembala@gmail.com', '', 'Personnel Administration Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('130546', 'Ita', 'ITA APRILIANI', 'it4.apriliani@gmail.com', '', 'People Development Administration Staff', 'STAF', '7239', 'Performance Management & People Development', 'HRS', '2019-05-03 06:00:10'),
('130675', '130675', 'SUHENDRA TAMBUNAN', 'suhendratambz@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('130677', '130677', 'SAFITRI DEVI HARTATI', 'safitri.devi@gmail.com', '', 'QAD Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('130782', '130782', 'JEFFRY FERNANDO', 'fernandojfree@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('140118', 'Desni', 'DESNI PENESIA PURBA', 'desnipp@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('140124', 'Agnes', 'AGNES', 'onlyagneslie@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('140349', '140349', 'EDWIN KURNIAWAN', 'edwin.k1991@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('140491', 'hendri', 'HENDRI WIJAYA', 'henz.wijaya@gmail.com', '', 'IT Manager', 'SNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('140688', '140688', 'MELLA APRIYANI', 'melaapril@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('140969', '140969', 'YAN KHARISMA', 'yan.kharisma@gmail.com', '', 'Learning Analytic Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('140978', 'Kara', 'DEDI SETIAWAN BAKARA', 'Dedisetiawanbakara@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('150032', '150032', 'DIMAS ANDI SAPUTRA', 'dimas.andi.saputra@gmail.com', '', 'Store Application Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('150063', '150063', 'R FAJAR EGIT INDRASWARA', 'eghiet@gmail.com', '', 'IT Service Desk', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('150243', '150243', 'RANI DAME SIMANJORANG', 'ranidamesimanjorang@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('150343', '150343', 'EVELINE MELANIE', 'evelinemelanie@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-03 06:00:10'),
('150380', '150380', 'DIAH AYU NOVITASARI', 'diah.ayu.novitasari@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('150381', '150381', 'MEME MERY', 'meme.mery@bakmigm.co.id', '', 'Account Receivable Manager', 'SNMGR', '6551', 'Finance Department', 'FAST', '2019-05-03 06:00:10'),
('150443', '150443', 'SABASTIAN CAHYA DERMAWAN', 'bastiancahya.bakmigm77@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'OTH', '2019-05-03 06:00:10'),
('150447', '150447', 'JUNIATI MAYASARI SIDABUTAR', 'juniati.mayasari@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('150521', 'daniel', 'DANIEL IBNU SIDHARTA', 'daniel.sidharta@bakmigm.co.id', '', 'Compensation & Benefit Assistant Manager', 'JNMGR', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('150665', '150665', 'DEBORA NOPRIANA SIPAHUTAR', 'debdeb.nopriana@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-05-03 06:00:10'),
('150734', '150734', 'HOTSAIDA SITUMORANG', 'idatania.situmorang@gmail.com ', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('150974', '150974', 'NINA SUDIANA', 'nina.sudiana09@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('150992', '150992', 'FEBBY ANDI PUTRA', 'FebbyandiPutra@gmail.com', '', 'Data Costing Process Specialist', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('150994', '150994', 'ANDDREAS MARSHEILO IRAWAN', 'anddreas.marsheilo@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('151004', '151004', 'ANEIS TIRTA PERTIWI', 'aneistirtapertiwi@gmail.com', '', 'IT Admin Staf', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('151009', '151009', 'HARRY NUGROHO POERNOMO', 'harry.hhyou@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'OTH', '2019-05-03 06:00:10'),
('151010', '151010', 'RIDWANTO SALIM', 'vergoares@gmail.com', '', 'HR Analyst', 'SNSPV', '5901', 'Human Resource Division', 'DIR.002', '2019-05-03 06:00:10'),
('151023', '151023', 'STELLA MARIA PAYUNG', 'stella5992@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('160001', 'kristanti', 'KRISTANTI RETNO H.', 'ichacrista.89@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('160057', 'doropat', 'DOROPAT SITUMORANG', 'doropatstumorang@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('160323', '160323', 'ALFONSIUS F. H MATONDANG', 'alfonferry@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('160997', '160997', 'NUGROHO VALENTINO', 'nugroho.valentino@bakmigm.co.id', '', 'Assistant Accounting Manager', 'JNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('161064', 'laela', 'LAELA ROBINGATUN', 'llaella007@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('161067', 'putri', 'PUTRI RAHAYU', 'putrirasgt10@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('161158', '161158', 'EDUARDO KUKILA AJI', 'edokukila@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('161225', 'deky', 'DEKY SABARTONO', 'deky.sabartono22@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('161229', '161229', 'PATAR ERIKSON PAKPAHAN', 'erickson.patar@gmail.com', '', 'Inventory Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('161371', '161371', 'SAMUEL', 'samuelkudo22@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('170007', '170007', 'NOVEL EM ALAM', 'novel@bakmigm.co.id', '', 'Industrial Relation Assistant Manager', 'JNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('170012', '170012', 'CHATARINA YUNI KARTIKA', 'chatarinayk94@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('170035', 'robiatul', 'ROBIATUL ADAWIYAH', 'weykoyuki@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('170232', 'vinoria', 'VINORIA ANDRIYANI', 'vinoria.andriyani@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('170236', '170236', 'JOHAN MOHAMMAD', 'johan.mohammad@gmail.com', '', 'Knowledge Management Supervisor', 'SNSPV', '7527', 'Human Resources Support', 'HRS', '2019-05-03 06:00:10'),
('170302', '170302', 'AGUS SAIFUDIN', 'agussaifudin2908@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('170389', '170389', 'DANIEL JULY FRIDAYANA', 'danieljuly26@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('170406', '170406', 'TEDDY SUTANTO', 'teddy.sutanto@bakmigm.co.id', '', 'Assistant HKM Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('170668', '170668', 'NOVITA HENDRIANA', 'novitahendriana68@gmail.com', '', 'Training Administration Staff', 'STAF', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('170904', '170904', 'DATIM', 'mzdatim72gm@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('170963', '170963', 'AKHMAD SUDRAJAT', 'akhmadsudrajat.96@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('171168', '171168', 'SITI SAYIDATURROHMAH', 'ayisanjaya4@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('171173', '171173', 'MARIA ANJELINA KAE', 'Jellynangellyna30@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('171251', 'hkiting', 'HANGGULAN KITING', 'hanggulan.kiting@bakmigm.co.id', '', 'Industrial Relation Manager', 'SNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('171252', '171252', 'ASAEL FETRARI PALAMBA', 'asaelpalamba@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('171255', '171255', 'RIVALDY RYAN JOHANNES SANI', 'ryansani25@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('171270', '171270', 'ANTHONY PAMUNGKAS', 'anthony@bakmigm.co.id', '', 'Finance & Acct. IT, Sys. Dev. General Manager', 'GMMGR', '6538', 'Finance, Acct, Costing, Budget, IT Division', 'DIR.002', '2019-05-03 06:00:10'),
('171314', '171314', 'THOMAS ADITYA PANDU WIRAWAN', 'thomas.wirawan@gmail.com', '', 'Business Process Improvement Manager', 'SNMGR', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'OTH', '2019-05-03 06:00:10'),
('171318', '171318', 'TRI MUHARYANTI', 'trryanty@gmail.com', '', 'Employee Relation Specialist', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-05-03 06:00:10'),
('171349', '171349', 'CLAUDIA CINDRY DOROTEA', 'claudorotea@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('171369', '171369', 'FIRSTIAN ANDREA PUTRI', 'firstian.andre22@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('171404', '171404', 'ADINDA NIDYA LESTARI SLAWAT', 'dindanidyajob@gmail.com', '', 'Knowledge Management Staff', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-05-03 06:00:10'),
('180003', '180003', 'NANDA IQBAL IBRAHIM', 'nandaiqbal@gmail.com', '', 'Planning & Forecast Supervisor', 'SNSPV', '7013', 'Plan & Budget Department', 'FAST', '2019-05-03 06:00:10'),
('180079', '180079', 'KEVIN JONATHAN', 'mrkevinjonathan@gmail.com', '', 'People Development Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-05-03 06:00:10'),
('180095', '180095', 'IRLAN FAJRIAN', 'irlanfajrian@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('180121', '180121', 'SRI PUTRIYANA BR GINTING', 'putriyana605@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-05-03 06:00:10'),
('180158', '180158', 'MARIA ASSUMPTA DYAH PUTRI UTAMI', 'mariaassumpta93@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180161', '180161', 'DIMAS PUTRA SADEWO', 'dimas51dewo@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180210', '180210', 'MUHAMMAD DANARDI ARIJONA', 'danarstei12@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180270', '180270', 'RIZKI AKBAR FAZRIANTO', 'rizkiakbarfazrianto@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180340', '180340', 'ANDRI', 'andridjun1997@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('180418', '180418', 'AZMI BIMA PRAYUDHA', 'azmibima16@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-03 06:00:10'),
('180580', '180580', 'DILO YANSIMAN MANIK', 'dilomanik01@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180586', '180586', 'RIA AGUSTINA', 'riaagsstna@gmail.com', '', 'Learning Design Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('180617', '180617', 'AJENG PUSPITASARI', 'ajengpuspita398@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('180756', '180756', 'SYARIFAH MUDARSIH', 'syarifahmu23@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('180764', '180764', 'ANDREAS WILSON H. SIMANGUNSONG', 'wilsonmangunsong@gmail.com', '', 'Developer PHP', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('180853', '180853', 'ADAM SAPUTRA', 'adamsaputra1807@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('180887', '180887', 'LYWIANA', 'lywiana@bakmigm.co.id', '', 'Finance Planning & Analysis Manager', 'SNMGR', '7013', 'Plan & Budget Department', 'FAST', '2019-05-03 06:00:10'),
('180992', '180992', 'BATARA KUMARA', 'batarakumara27@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('181111', '181111', 'NORMANDI LIMAN', 'normandi1991@gmail.com', '', 'HRIS Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('181183', '181183', 'KHARISMA ANNISA K', 'kharisma19ak@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('181289', '181289', 'AHMAD ISMURROCHMAN', 'ahmad.ismu@gmail.com', '', 'Learning & Development Senior Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('181370', '181370', 'ANDINI SHAFA HUSNIYAH', 'andinishafa88@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('181413', '181413', 'TAUFIK HIDAYAT', 'taufikhide22@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('190047', '190047', 'JONATHAN SILITONGA', 'joeseries24@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('190107', '190107', 'ALAMSYAH HERMAWAN', 'alamsyahhermawan@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('190164', '190164', 'ESTHER CLAUDYA SITUMORANG', 'estherclaudyasit@gmail.com', '', 'Auditor', 'SNSPV', '7924', 'Management Audit Department', 'OTH', '2019-05-03 06:00:10'),
('190315', '190315', 'DZIKRI FITRANUDDIN', 'd.fitranuddin@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('190317', '190317', 'ABED NEGO HERBOWO', 'abednegoherbowo@gmail.com', '', 'Performance Management & People Development Manager', 'SNMGR', '7239', 'Performance Management & People Development', 'HRS', '2019-05-03 06:00:10'),
('190372', '190372', 'DYLAN WINALDA', 'dylanwinalda@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('190379', '190379', 'GIOVANNY SIREGAR', 'gioregar87.gio@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('190441', '190441', 'RICKY NOVIYANDI', 'rickynoviyandi08@gmail.com', '', 'Ass.Finance and Performance Analysis Manager', 'SNMGR', '7013', 'Plan & Budget Department', 'FAST', '2019-05-03 06:00:10'),
('190442', '190442', 'ALBER FADHLY YUVA', '', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('200044', 'catur', 'CATUR SUSIANI', 'caturmudisusiani@gmail.com', '', 'Personnel Administration Section Head', 'SCH', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('200054', 'cynthia', 'CYNTHIA FELLICIANNE', 'cynthia-f@bakmigm.co.id', '', 'Human Resource Division General Manager', 'GMMGR', '5901', 'Human Resource Division', 'DIR.002', '2019-05-03 06:00:10'),
('204017', '204017', 'KWOK SIOE LIAN', 'siulian@bakmigm.co.id', '', 'Audit Analysis Manager', 'SNMGR', '7924', 'Management Audit Department', 'OTH', '2019-05-03 06:00:10'),
('206003', 'lionita', 'LIONITA YOHANES', 'Lioni.jo@gmail.com', '', 'Payroll Administration Supervisor', 'SNSPV', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('206005', '206005', 'ROLAND MATONDANG', 'rolandmatondang@gmail.com', '', 'Operation & Support Assistant Supervisor', 'JNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('206329', '206329', 'ANICETA MADA O AMANTI', 'oktriesa@gmail.com', '', 'Auditor', 'SNSPV', '7924', 'Management Audit Department', 'OTH', '2019-05-03 06:00:10'),
('206366', 'nia', 'KURNIATI', 'nheeah@gmail.com', '', 'Learning & Development Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('207316', 'rico', 'RICO WIRYANTO', 'rico.wiryanto@bakmigm.co.id', '', 'Accounting & Tax Manager', 'SNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('208136', '208136', 'ARIE YANSARI', 'ay080112@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('208152', '208152', 'DEVINA GLORYA ESTHER', 'devinaglorya24@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('208171', '208171', 'ZAINAL ARIFIN', 'zainal230584@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('208205', 'linday', 'LINDA YUSNIAWATI', 'fanemanda1006@gmail.com', '', 'Industrial Relation Admin Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('208519', '208519', 'VINA ELVIRA SAVITRI', 'vinasiagian22@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('209067', 'retno', 'RETNO TRISNANINGSIH', 'retnotrisnaningsih@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('209397', 'nuryati', 'NURYATI', 'aina23691@gmail.com', '', 'Field Recruiter', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('209420', '209420', 'KUNDRAT BASRI', 'kundrat01@gmail.com', '', 'Cooperatives Specialist', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('209561', '209561', 'SRI WIDODO', 'sriwidodo878@gmail.com', '', 'Operation Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('209686', '209686', 'IRA KURNIAWATI', 'ira.kurniawati.bgm@gmail.com', '', 'BPI Admin', 'STAF', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'OTH', '2019-05-03 06:00:10'),
('210120', '210120', 'RACHMAH YURIS TRIANA', 'rachmah.yuris@gmail.com', '', 'Regional 1 Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('210326', 'erlina', 'ERLINA', 'erlina.sihaloho79@gmail.com', '', 'Performance Management Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-05-03 06:00:10'),
('210546', '210546', 'INDRA', 'indra250285@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('210569', 'aditya', 'ADITYA W', 'aditya@bakmigm.co.id', '', 'HR Support Assistant Manager', 'JNMGR', '7527', 'Human Resources Support', 'HRS', '2019-05-03 06:00:10'),
('210638', 'fitri', 'FITRIA HANDAYANI VALENTINA', 'fitriahazim@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('211104', '211104', 'HANI AGUSTIANI', 'hanyagustiani5@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('211108', '211108', 'IGNATIUS SURONO ARIE W', 'arisurono@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-03 06:00:10'),
('211171', 'eka', 'EKA WAHYU HARYANINGSIH', 'eka.wahyu58@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('211362', 'mardianah', 'MARDIANAH', 'mardianahdian03@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('211363', '211363', 'CAECILIA NOVIANTARI', 'caecilia.noviantari@gmail.com', '', 'Account Payable Supervisor', 'SNSPV', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-03 06:00:10'),
('211374', 'maudy', 'MAUDY FITRIANI IRANDA', 'irandamaudy@gmail.com', '', 'Recruitment Assistant Manager', 'JNMGR', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('211577', 'rita', 'RITA RAESITA', 'rita.raesita@bakmigm.co.id', '', 'Recruitment Manager', 'SNMGR', '5942', 'Recruitment Department', 'HRS', '2019-05-03 06:00:10'),
('211752', '211752', 'SUGIYANTO', 'sugiyanto1312@gmail.com', '', 'Cooperatives Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-03 06:00:10'),
('211939', 'andi', 'ANDI', 'andi.k.allwin@gmail.com', '', 'Technology & Development Assistant Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('212126', '212126', 'AGUSTINUS TRIJARWANTO', 'agustnustrij@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-03 06:00:10'),
('212139', '212139', 'R. WIJATMOKO', 'rwijatmoko82@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-03 06:00:10'),
('212244', '212244', 'RIKY', 'rikyriq@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-03 06:00:10'),
('212335', '212335', 'VERRY SUNARYA', 'fx.verry@gmail.com', '', 'Infrastruktur & Network Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10'),
('212383', '212383', 'NIDIA', 'nidia.lie@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'OTH', '2019-05-03 06:00:10'),
('212798', '212798', 'VONNY MELINDA', 'vonnymelinda1987@gmail.com', '', 'General Accounting Supervisor', 'SNSPV', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-03 06:00:10'),
('918075', '918075', 'AZIZ AL ISRA', '', '', 'IT Part - Timer', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-03 06:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_detail`
--

CREATE TABLE `tb_employee_detail` (
  `NIP` int(11) NOT NULL,
  `USER_GROUP` varchar(255) NOT NULL,
  `IMAGE` varchar(255) NOT NULL,
  `ROLES` varchar(255) NOT NULL,
  `ROLES_2` varchar(255) NOT NULL,
  `ROLES_3` varchar(255) NOT NULL,
  `ROLES_4` varchar(255) NOT NULL,
  `ROLES_5` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_detail`
--

INSERT INTO `tb_employee_detail` (`NIP`, `USER_GROUP`, `IMAGE`, `ROLES`, `ROLES_2`, `ROLES_3`, `ROLES_4`, `ROLES_5`) VALUES
(0, '', '', 'PENDISTRIBUSI', '', '', '', ''),
(92022, '', '', 'ADMIN KONFIGURASI', '', '', '', ''),
(97097, '', '', 'PENCIPTA', '', '', '', ''),
(99305, '', '', 'PENCIPTA', '', '', '', ''),
(140491, '', '', 'PENCIPTA', '', '', '', ''),
(150381, '', '', 'PENCIPTA', '', '', '', ''),
(150443, '', '', 'PENCIPTA', '', '', '', ''),
(150521, '', '', 'PENCIPTA', '', '', '', ''),
(151009, '', '', 'PENDISTRIBUSI', 'PENCIPTA', '', '', ''),
(160997, '', '', 'PENCIPTA', '', '', '', ''),
(170007, '', '', 'PENCIPTA', '', '', '', ''),
(170236, '', '', 'PENCIPTA', '', '', '', ''),
(170406, '', '', 'PENCIPTA', 'ADMIN KONFIGURASI', '', '', ''),
(171251, '', '', 'PENCIPTA', '', '', '', ''),
(171270, '', '', 'ATASAN PENCIPTA', '', '', '', ''),
(171314, '', '', 'PENCIPTA', '', '', '', ''),
(180580, '', '', 'PENDISTRIBUSI', '', '', '', ''),
(180887, '', '', 'PENCIPTA', '', '', '', ''),
(200054, '', '', 'ATASAN PENCIPTA', 'PENCIPTA', '', '', ''),
(204017, '', '', 'PENCIPTA', 'PENCIPTA', '', '', ''),
(206329, '', '', 'PENCIPTA', '', '', '', ''),
(206366, '', '', 'PENCIPTA', '', '', '', ''),
(207316, '', '', 'PENCIPTA', '', '', '', ''),
(208171, '', '', 'ADMIN DOKUMEN', '', '', '', ''),
(210546, '', '', 'PENCIPTA', '', '', '', ''),
(210569, '', '', 'PENCIPTA', '', '', '', ''),
(211363, '', '', 'PENCIPTA', '', '', '', ''),
(211374, '', '', 'PENCIPTA', '', '', '', ''),
(211577, '', '', 'PENCIPTA', '', '', '', ''),
(212383, '', '', 'PENDISTRIBUSI', 'PENCIPTA', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_job_level`
--

CREATE TABLE `tb_job_level` (
  `JBLL_ID` varchar(255) NOT NULL DEFAULT '-',
  `JBLL_NAME` varchar(255) NOT NULL DEFAULT '-',
  `JBLL_INDEX` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_job_level`
--

INSERT INTO `tb_job_level` (`JBLL_ID`, `JBLL_NAME`, `JBLL_INDEX`) VALUES
('CRW', 'CREW', '9'),
('DIR', 'DIRECTOR', '1'),
('GMMGR', 'GENERAL MGR', '2'),
('JNMGR', 'JNR. MGR', '4'),
('JNSPV', 'JNR. SPV', '6'),
('SCH', 'SECTION HEAD', '7'),
('SNMGR', 'SNR. MGR', '3'),
('SNSPV', 'SNR. SPV', '5'),
('STAF', 'STAF', '8');

-- --------------------------------------------------------

--
-- Table structure for table `tb_level_organization`
--

CREATE TABLE `tb_level_organization` (
  `LO_NO` varchar(255) NOT NULL,
  `LO_NAME` varchar(255) NOT NULL,
  `LO_LINK` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_level_organization`
--

INSERT INTO `tb_level_organization` (`LO_NO`, `LO_NAME`, `LO_LINK`) VALUES
('01', 'BOD', 'directorate-structure'),
('02', 'DIVISI', 'division-structure'),
('03', 'DEPARTEMEN', 'dapartemen-structure');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menus`
--

CREATE TABLE `tb_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `parent` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_menus`
--

INSERT INTO `tb_menus` (`id`, `name`, `slug`, `icon`, `parent`, `type`) VALUES
(1, 'Pencarian', 'C_menu', 'fa-search', 0, 1),
(2, 'Favoritku', 'bookmarks', 'fa-bookmark', 0, 1),
(4, 'Aktivitas', 'notification', 'fa-bell', 0, 1),
(5, 'News', 'news', 'fa-newspaper-o', 0, 1),
(6, 'Persetujuan', 'approval', 'fa-thumbs-up', 0, 0),
(7, 'Kontribusi', 'contribution', 'fa-file-text', 0, 1),
(8, 'Report', 'report', 'fa-flag', 0, 1),
(9, 'Komentar', 'comentar', NULL, 0, 0),
(10, 'Setting', '#', 'fa-file-text', 0, 1),
(11, 'General Setting', '#', 'fa-cogs', NULL, 1),
(12, 'Data Master', 'C_setting_data_master', NULL, 10, 1),
(13, 'Struktur Organisasi', 'C_setting_structure_organization', NULL, 10, 1),
(14, 'User', 'C_setting_user', NULL, 10, 1),
(15, 'Struktur Dokumen', 'C_setting_sturcture_document', NULL, 10, 1),
(16, 'Aturan Bisnis', 'C_setting_business_rule', NULL, 10, 1),
(17, 'Tingkat Akses Dokumen', 'C_setting_document_level_access', NULL, 10, 1),
(18, 'Welcome Speech', 'C_general_setting/welcome_speech', NULL, 11, 1),
(19, 'Nomor Dokumen', 'C_general_setting/nomor', NULL, 11, 1),
(20, 'Sharelink', 'C_general_setting/sharelink', NULL, 11, 1),
(21, 'Watermark', 'C_general_setting/watermark', NULL, 11, 1),
(22, 'Role Menus', 'role-menus', NULL, 10, 1),
(23, 'Pengkinian', 'revise', NULL, 0, 0),
(24, 'Sharelink Document', 'sharelink-document', NULL, 0, 0),
(25, 'Archive', 'archive', NULL, 0, 0),
(26, 'Format Dokumen', 'C_setting_structure_document', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_notification_history`
--

CREATE TABLE `tb_notification_history` (
  `ID` int(11) NOT NULL,
  `DOC_ID` varchar(100) DEFAULT NULL,
  `USER_ID` varchar(100) DEFAULT NULL,
  `DELETE_DATE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_notification_history`
--

INSERT INTO `tb_notification_history` (`ID`, `DOC_ID`, `USER_ID`, `DELETE_DATE`) VALUES
(6, '1903181002417186873', '210569', '2019-03-20 11:43:50'),
(10, '1903181519084810445', '140491', '2019-03-20 14:10:42'),
(15, '1903181002417186873', '140491', '2019-03-20 14:11:04'),
(18, '1903050922414427383', '171270', '2019-03-20 14:12:26'),
(19, '1903141353374319124', '171270', '2019-03-20 14:12:36'),
(20, '1903141542331934082', '171270', '2019-03-20 14:12:40'),
(21, '1903031420197239685', '171270', '2019-03-20 14:12:51'),
(22, '1903180914206053569', '171270', '2019-03-20 14:12:57'),
(23, '1903150841576896678', '171270', '2019-03-20 14:13:04'),
(24, '1903181146524339961', '171270', '2019-03-20 14:13:16'),
(25, NULL, '171270', '2019-03-20 14:13:20'),
(26, NULL, '171270', '2019-03-20 14:13:23'),
(27, NULL, '171270', '2019-03-20 14:13:39'),
(28, NULL, '171270', '2019-03-20 14:13:46'),
(29, NULL, '171270', '2019-03-20 14:13:59'),
(30, NULL, '171270', '2019-03-20 14:14:07'),
(31, NULL, '171270', '2019-03-20 14:14:12'),
(32, NULL, '171270', '2019-03-20 14:14:17'),
(33, NULL, '171270', '2019-03-20 14:14:21'),
(34, NULL, '171270', '2019-03-20 14:14:46'),
(35, NULL, '171270', '2019-03-20 14:14:59'),
(36, NULL, '171270', '2019-03-20 14:15:02'),
(37, NULL, '171270', '2019-03-20 14:15:06'),
(38, NULL, '171270', '2019-03-20 14:15:27'),
(39, NULL, '171270', '2019-03-20 14:15:33'),
(40, NULL, '171270', '2019-03-20 14:15:39'),
(41, NULL, '171270', '2019-03-20 14:15:43'),
(42, '1903201207573824411', '171270', '2019-03-20 14:17:31'),
(43, NULL, '171270', '2019-03-20 14:17:35'),
(44, NULL, '171270', '2019-03-20 14:17:45'),
(45, NULL, '171270', '2019-03-20 14:17:49'),
(47, NULL, '171270', '2019-03-20 14:18:01'),
(49, NULL, '171270', '2019-03-20 14:18:14'),
(50, NULL, '171270', '2019-03-20 14:18:20'),
(51, NULL, '171270', '2019-03-20 14:18:27'),
(52, NULL, '171270', '2019-03-20 14:18:34'),
(53, NULL, '171270', '2019-03-20 14:18:39'),
(54, NULL, '171270', '2019-03-20 14:18:43'),
(55, NULL, '171270', '2019-03-20 14:18:46'),
(56, NULL, '171270', '2019-03-20 14:18:53'),
(57, NULL, '171270', '2019-03-20 14:19:00'),
(58, '1903050922414427383', '171270', '2019-03-20 14:19:04'),
(60, NULL, '171270', '2019-03-20 14:19:06'),
(61, '1903171744259661130', '171270', '2019-03-20 14:19:17'),
(64, NULL, '171270', '2019-03-20 14:19:42'),
(65, '1903050922414427383', '171270', '2019-03-20 14:19:42'),
(68, NULL, '171270', '2019-03-20 14:19:46'),
(69, NULL, '171270', '2019-03-20 14:20:37'),
(70, NULL, '171270', '2019-03-20 14:20:40'),
(72, NULL, '171270', '2019-03-20 14:21:08'),
(73, NULL, '171270', '2019-03-20 14:21:09'),
(75, '1903181002417186873', '170406', '2019-03-20 15:26:50'),
(77, '1903171744259661130', '170406', '2019-03-20 15:29:55'),
(78, '1903181519084810445', '170406', '2019-03-20 15:30:01'),
(80, '1903171744259661130', '170406', '2019-03-20 15:30:49'),
(81, '1903171744259661130', '170406', '2019-03-20 15:30:58'),
(82, '1903201006299867884', '170406', '2019-03-20 15:31:05'),
(83, '1903201207573824411', '170406', '2019-03-20 15:31:12'),
(86, '1903201207573824411', '140491', '2019-03-20 15:37:44'),
(87, '1903201006299867884', '140491', '2019-03-20 15:37:45'),
(89, '1903171744259661130', '171314', '2019-03-20 17:50:23'),
(91, '1903181716488822119', '171270', '2019-03-20 17:55:58'),
(95, '1903181002417186873', '99305', '2019-03-20 17:56:08'),
(99, '1903201627053424414', '99305', '2019-03-20 17:56:18'),
(100, '1903201735347302757', '99305', '2019-03-20 17:56:19'),
(101, '1903050906241783554', '200054', '2019-03-22 09:21:36'),
(102, '1903141353374319124', '200054', '2019-03-22 09:21:47'),
(103, '1903141542331934082', '200054', '2019-03-22 09:21:52'),
(104, '1903181716488822119', '200054', '2019-03-22 09:22:38'),
(105, '1903150841576896678', '200054', '2019-03-22 09:22:45'),
(106, '1903031420197239685', '200054', '2019-03-22 09:23:11'),
(107, '1903180914206053569', '200054', '2019-03-22 09:23:16'),
(112, '1903171711301885316', '140491', '2019-04-04 01:13:07'),
(114, '1903170940409388080', '140491', '2019-04-04 01:32:55'),
(115, '1903171711301885316', '212383', '2019-04-04 01:50:33'),
(116, '1903171719262822556', '212383', '2019-04-04 01:50:39'),
(118, '1903211356343481427', '140491', '2019-04-04 01:56:19'),
(119, '1903171711301885316', '190161', '2019-04-04 02:10:23'),
(120, '1903271005521122252', '170236', '2019-04-05 09:37:10'),
(121, '1903201627053424414', '170236', '2019-04-05 09:37:14'),
(122, '1903181002417186873', '170236', '2019-04-05 09:37:18'),
(123, '1903180946059317835', '170236', '2019-04-05 09:37:20'),
(125, '1903201735347302757', '170236', '2019-04-05 09:37:30'),
(126, '1903221708013233733', '170236', '2019-04-05 09:37:31'),
(128, '1903171711301885316', '206329', '2019-04-15 09:37:26'),
(130, '1903201623487739413', '170236', '2019-04-18 09:29:34'),
(132, '1903162038142399837', '200054', '2019-04-18 09:46:07'),
(133, NULL, '200054', '2019-04-18 09:46:08'),
(134, '1903271005521122252', '200054', '2019-04-18 09:46:09'),
(136, '1903171711301885316', '200054', '2019-04-18 09:46:13'),
(137, '1903171744259661130', '200054', '2019-04-18 09:46:17'),
(138, '1903181114109063798', '200054', '2019-04-18 09:46:19'),
(139, '1903181002417186873', '200054', '2019-04-18 09:46:19'),
(140, '1903181519084810445', '200054', '2019-04-18 09:46:21'),
(141, '1903191332319102698', '200054', '2019-04-18 09:46:22'),
(142, '1903201006299867884', '200054', '2019-04-18 09:47:06'),
(143, '1903201207573824411', '200054', '2019-04-18 09:47:08'),
(144, '1903201404014149976', '200054', '2019-04-18 09:47:09'),
(145, '1903201641246109276', '200054', '2019-04-18 09:47:17'),
(146, '1903201735347302757', '200054', '2019-04-18 09:47:31'),
(147, '1903211356343481427', '200054', '2019-04-18 09:47:33'),
(148, '1903201627053424414', '200054', '2019-04-18 09:47:34'),
(149, '1903271100144059466', '170406', '2019-04-18 10:03:43'),
(150, '1903211356343481427', '170406', '2019-04-18 10:03:44'),
(151, '1903201623487739413', '170406', '2019-04-18 10:03:46'),
(152, '1903201627053424414', '170406', '2019-04-18 10:03:46'),
(153, '1903201404014149976', '170406', '2019-04-18 10:03:47'),
(154, '1903181330113183895', '170406', '2019-04-18 10:03:53'),
(156, '1903191332319102698', '170406', '2019-04-18 10:03:56'),
(157, '1903201735347302757', '170406', '2019-04-18 10:03:57'),
(158, '1903142054476982363', '170406', '2019-04-18 10:03:59'),
(159, '1904150938051405212', '212383', '2019-04-22 10:53:45'),
(160, '1904121454279989841', '170236', '2019-04-24 09:47:56'),
(161, '1904161026136248169', '170236', '2019-04-24 09:47:58'),
(162, '1904161020164804913', '170236', '2019-04-24 09:47:59'),
(163, '1904150903281955566', '170236', '2019-04-24 09:48:02'),
(165, '1903180946059317835', '210569', '2019-04-24 10:18:49'),
(166, '1903201623487739413', '210569', '2019-04-24 10:18:50'),
(167, '1903221708013233733', '210569', '2019-04-24 10:18:52'),
(168, '1903271005521122252', '210569', '2019-04-24 10:18:53'),
(169, '1904121454279989841', '210569', '2019-04-24 10:18:54'),
(170, '1904161026136248169', '210569', '2019-04-24 10:18:56'),
(171, '1904161020164804913', '210569', '2019-04-24 10:18:57'),
(172, '1904150903281955566', '210569', '2019-04-24 10:18:58'),
(173, '1903180911113091034', '200054', '2019-04-24 10:20:06'),
(174, '1903180919514736897', '200054', '2019-04-24 10:20:38'),
(175, '1904241016215937786', '170236', '2019-04-24 10:23:20'),
(176, '1903180919514736897', '170236', '2019-04-24 10:23:21'),
(177, '1904241016215937786', '210569', '2019-04-30 15:05:52'),
(178, '1903180919514736897', '210569', '2019-04-30 15:05:56'),
(179, '1904262247456400812', '170406', '2019-05-02 14:08:08'),
(180, '1904150903281955566', '170406', '2019-05-02 14:08:10'),
(181, '1903180919514736897', '170406', '2019-05-02 14:08:14'),
(182, '1903171711301885316', '170406', '2019-05-02 14:08:21'),
(183, '1903162038142399837', '170406', '2019-05-02 14:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_organization`
--

CREATE TABLE `tb_organization` (
  `ON_ID` varchar(255) NOT NULL DEFAULT '-',
  `ON_NAME` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_organization`
--

INSERT INTO `tb_organization` (`ON_ID`, `ON_NAME`) VALUES
('CONF', 'CONFIDENTIAL'),
('NCNF', 'NON CONFIDENTIAL'),
('REST\r\n', 'RESTRICTED');

-- --------------------------------------------------------

--
-- Table structure for table `tb_periode_preview`
--

CREATE TABLE `tb_periode_preview` (
  `PEPW_ID` varchar(255) NOT NULL DEFAULT '-',
  `PEPW_INDEX` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_periode_preview`
--

INSERT INTO `tb_periode_preview` (`PEPW_ID`, `PEPW_INDEX`) VALUES
('12', '2'),
('120', '5'),
('24', '3'),
('6', '1'),
('60', '4');

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `RS_ID` varchar(255) NOT NULL DEFAULT '-',
  `RS_DESC` text NOT NULL,
  `RS_BY` varchar(255) NOT NULL,
  `RS_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RS_INDEX` int(255) NOT NULL,
  `ROLE_MENUS` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`RS_ID`, `RS_DESC`, `RS_BY`, `RS_TIME`, `RS_INDEX`, `ROLE_MENUS`) VALUES
('ADMIN DOKUMEN', 'Admin dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 3, 'a:24:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"0";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"0";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"0";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"0";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"1";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"1";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"1";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"1";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"1";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"1";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"1";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"1";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}i:23;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"10";s:5:"value";i:1;}}}'),
('ADMIN KONFIGURASI', 'Konfigurasi aplikasi', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 5, 'a:25:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"0";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"0";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"0";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"0";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"0";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"1";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"1";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"1";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"1";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"1";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"1";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"1";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"1";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"1";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"1";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"1";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"0";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}i:23;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"10";s:5:"value";i:1;}}i:24;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"11";s:5:"value";i:1;}}}'),
('ATASAN PENCIPTA', 'Atasan pencipta dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 1, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"0";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"0";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"1";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"1";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"0";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}'),
('PENCIPTA', 'Pencipta dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"1";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"1";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"1";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"1";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"1";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"1";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}'),
('PENDISTRIBUSI', 'Distribusi dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 2, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"0";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"1";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"1";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"0";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}'),
('PENGGUNA', 'Pengguna dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"1";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"0";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"0";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"1";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"1";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_structure_organization_departemen`
--

CREATE TABLE `tb_structure_organization_departemen` (
  `SOD_ID` int(255) NOT NULL,
  `DN_ID` varchar(255) NOT NULL,
  `UR_ID` varchar(150) NOT NULL,
  `SOD_LVL` varchar(255) NOT NULL,
  `SOD_DESC` text NOT NULL,
  `SOD_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_structure_organization_departemen`
--

INSERT INTO `tb_structure_organization_departemen` (`SOD_ID`, `DN_ID`, `UR_ID`, `SOD_LVL`, `SOD_DESC`, `SOD_TIME`) VALUES
(1, '5882', 'ADMIN KONFIGURASI', '03 - Departemen', 'MARKETING', '2019-01-21 00:00:00'),
(2, '5893', 'ADMIN KONFIGURASI', '03 - Departemen', 'BUILDING PROJECT', '2019-01-21 00:00:00'),
(3, '5898', 'ADMIN KONFIGURASI', '03 - Departemen', 'BUSINESS DEVELOPMENT', '2019-01-21 00:00:00'),
(4, '5904', 'ADMIN KONFIGURASI', '03 - Departemen', 'INDUSTRIAL RELATION, COOPERATIVES & PERSONNEL ADMIN', '2019-01-21 00:00:00'),
(5, '5922', 'ADMIN KONFIGURASI', '03 - Departemen', 'COMPENSATION & BENEFIT DEPARTMENT', '2019-01-21 00:00:00'),
(6, '5926', 'ADMIN KONFIGURASI', '03 - Departemen', 'LEARNING & DEVELOPMENT DEPARTMENT', '2019-01-21 00:00:00'),
(7, '5942', 'ADMIN KONFIGURASI', '03 - Departemen', 'RECRUITMENT DEPARTMENT', '2019-01-21 00:00:00'),
(8, '6467', 'ADMIN KONFIGURASI', '03 - Departemen', 'PPIC', '2019-01-21 00:00:00'),
(9, '6473', 'ADMIN KONFIGURASI', '03 - Departemen', 'WAREHOUSE', '2019-01-21 00:00:00'),
(10, '6494', 'ADMIN KONFIGURASI', '03 - Departemen', 'PLANT DEPARTMENT', '2019-01-21 00:00:00'),
(11, '6526', 'ADMIN KONFIGURASI', '03 - Departemen', 'PURCHASING', '2019-01-21 00:00:00'),
(12, '6534', 'ADMIN KONFIGURASI', '03 - Departemen', 'ASSET MANAGEMENT DEPARTMENT', '2019-01-21 00:00:00'),
(13, '6540', 'ADMIN KONFIGURASI', '03 - Departemen', 'ACCOUNTING & TAX DEPARTMENT', '2019-01-21 00:00:00'),
(14, '6563', 'ADMIN KONFIGURASI', '03 - Departemen', 'INFORMATION TECHNOLOGY DEPARTMENT', '2019-01-21 00:00:00'),
(15, '6573', 'ADMIN KONFIGURASI', '03 - Departemen', 'OFFICE SERVICE DEPARTMENT', '2019-01-21 00:00:00'),
(16, '6588', 'ADMIN KONFIGURASI', '03 - Departemen', 'ENGINEERING KP DEPARTMENT', '2019-01-21 00:00:00'),
(17, '6678', 'ADMIN KONFIGURASI', '03 - Departemen', 'PROPERTY MANAGEMENT DEPARTMENT', '2019-01-21 00:00:00'),
(18, '6684', 'ADMIN KONFIGURASI', '03 - Departemen', 'OPERATION HO OFFICE', '2019-01-21 00:00:00'),
(19, '6685', 'ADMIN KONFIGURASI', '03 - Departemen', 'LOGISTIC', '2019-01-21 00:00:00'),
(20, '6837', 'ADMIN KONFIGURASI', '03 - Departemen', 'COSTING DEPARTMENT', '2019-01-21 00:00:00'),
(21, '7013', 'ADMIN KONFIGURASI', '03 - Departemen', 'PLAN & BUDGET DEPARTMENT', '2019-01-21 00:00:00'),
(22, '7079', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP PPIC', '2019-01-21 00:00:00'),
(23, '7080', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP ENGINEERING', '2019-01-21 00:00:00'),
(24, '7081', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP QA-QC', '2019-01-21 00:00:00'),
(25, '7082', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP WAREHOUSE', '2019-01-21 00:00:00'),
(26, '7083', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP PPIC & WAREHOUSE', '2019-01-21 00:00:00'),
(27, '7091', 'ADMIN KONFIGURASI', '03 - Departemen', 'CORPORATE SECRETARY', '2019-01-21 00:00:00'),
(28, '7150', 'ADMIN KONFIGURASI', '03 - Departemen', 'STORE PROCESS ENGINEERING', '2019-01-21 00:00:00'),
(29, '7151', 'ADMIN KONFIGURASI', '03 - Departemen', 'ENGINEERING STORE DEPARTMENT', '2019-01-21 00:00:00'),
(30, '7152', 'ADMIN KONFIGURASI', '03 - Departemen', 'CHANNEL SALES', '2019-01-21 00:00:00'),
(31, '7153', 'ADMIN KONFIGURASI', '03 - Departemen', 'PMO DEPARTMENT', '2019-01-21 00:00:00'),
(32, '7175', 'ADMIN KONFIGURASI', '03 - Departemen', 'QUALITY CONTROL DEPARTMENT', '2019-01-21 00:00:00'),
(33, '7239', 'ADMIN KONFIGURASI', '03 - Departemen', 'PERFORMANCE MANAGEMENT & PEOPLE DEVELOPMENT', '2019-01-21 00:00:00'),
(34, '7371', 'ADMIN KONFIGURASI', '03 - Departemen', 'PROCUREMENT', '2019-01-21 00:00:00'),
(35, '7407', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP FORMULATION', '2019-01-21 00:00:00'),
(36, '7488', 'ADMIN KONFIGURASI', '03 - Departemen', 'CORPORATE PLANNING DEPARTMENT', '2019-01-21 00:00:00'),
(37, '7494', 'ADMIN KONFIGURASI', '03 - Departemen', 'INTERNAL AUDIT DEPARTMENT', '2019-01-21 00:00:00'),
(38, '7527', 'ADMIN KONFIGURASI', '03 - Departemen', 'HUMAN RESOURCES SUPPORT', '2019-01-21 00:00:00'),
(39, '7550', 'ADMIN KONFIGURASI', '03 - Departemen', 'BUSINESS PROCESS IMPROVEMENT', '2019-01-21 00:00:00'),
(40, '7555', 'ADMIN KONFIGURASI', '03 - Departemen', 'R&D', '2019-01-21 00:00:00'),
(41, '7559', 'ADMIN KONFIGURASI', '03 - Departemen', 'MANAGEMENT AUDIT DEPARTEMENT', '2019-01-21 00:00:00'),
(42, '7562', 'ADMIN KONFIGURASI', '03 - Departemen', 'STORE PERFORMANCE ANALYST DEPARTMENT', '2019-01-21 00:00:00'),
(43, '7564', 'ADMIN KONFIGURASI', '03 - Departemen', 'STORE DEMAND PLANNING DEPARTMENT', '2019-01-21 00:00:00'),
(44, '7591', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP FLOUR PROCESSING', '2019-01-21 00:00:00'),
(45, '7596', 'ADMIN KONFIGURASI', '03 - Departemen', 'CPP FOOD PROCESSING', '2019-01-21 00:00:00'),
(46, '7603', 'ADMIN KONFIGURASI', '03 - Departemen', 'DESIGN & ARCHITECTURE DEPARTMENT', '2019-01-21 00:00:00'),
(47, '7761', 'ADMIN KONFIGURASI', '03 - Departemen', 'FINANCE ACCOUNT RECEIVABLE', '2019-01-21 00:00:00'),
(48, '7762', 'ADMIN KONFIGURASI', '03 - Departemen', 'FINANCE ACCOUNT PAYABLE & EXPENSES', '2019-01-21 00:00:00'),
(49, '7769', 'ADMIN KONFIGURASI', '03 - Departemen', 'QA QC SUPPLY DEPARTMENT', '2019-01-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_structure_organization_direktorat`
--

CREATE TABLE `tb_structure_organization_direktorat` (
  `SODT_ID` int(255) NOT NULL,
  `DT_ID` varchar(255) NOT NULL,
  `UR_ID` varchar(255) NOT NULL,
  `SODT_LVL` varchar(255) NOT NULL,
  `SODT_DESC` text NOT NULL,
  `SODT_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_structure_organization_direktorat`
--

INSERT INTO `tb_structure_organization_direktorat` (`SODT_ID`, `DT_ID`, `UR_ID`, `SODT_LVL`, `SODT_DESC`, `SODT_TIME`) VALUES
(1, 'DIR.001', 'ADMIN KONFIGURASI', '01 - BOD', 'DIREKTORAT SUPPLY & OPERATION', '2019-01-22 00:00:00'),
(2, 'DIR.002', 'ADMIN KONFIGURASI', '01 - BOD', 'DIREKTORAT STRATEGIC CORPORATE, HR & FAST', '2019-01-22 00:00:00'),
(3, 'DIR.003', 'ADMIN KONFIGURASI', '01 - BOD', 'DIREKTORAT BUSINESS DEVELOPMENT', '2019-01-22 00:00:00'),
(4, 'DIR.004', 'ADMIN KONFIGURASI', '01 - BOD', 'DIREKTORAT ENGINEERING SERVICES & PROCESS DEVELOPMENT', '2019-01-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_structure_organization_divisi`
--

CREATE TABLE `tb_structure_organization_divisi` (
  `SODI_ID` int(255) NOT NULL,
  `DI_ID` varchar(255) NOT NULL,
  `UR_ID` varchar(150) NOT NULL,
  `SODI_LVL` varchar(255) NOT NULL,
  `SODI_DESC` text NOT NULL,
  `SODI_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_structure_organization_divisi`
--

INSERT INTO `tb_structure_organization_divisi` (`SODI_ID`, `DI_ID`, `UR_ID`, `SODI_LVL`, `SODI_DESC`, `SODI_TIME`) VALUES
(1, '5880', 'System', '02 - Divisi', 'BUSINESS DEVELOPMENT DIVISION', '2019-01-22 00:00:00'),
(2, '7549', 'System', '02 - Divisi', 'ENGINEERING SERVICE & PROCESS DEVELOPMENT', '2019-01-22 00:00:00'),
(3, 'CPP1', 'System', '02 - Divisi', 'CPP - SUPPLY DIVISION', '2019-01-22 00:00:00'),
(4, '6571', 'System', '02 - Divisi', 'ENGINEERING & SERVICES DIVISION', '2019-01-22 00:00:00'),
(5, '6538', 'System', '02 - Divisi', 'FINANCE, ACCT, COSTING, BUDGET, IT DIVISION', '2019-01-22 00:00:00'),
(6, '5901', 'System', '02 - Divisi', 'HUMAN RESOURCE DIVISION', '2019-01-22 00:00:00'),
(7, '5977', 'System', '02 - Divisi', 'OPERATIONS DIVISION', '2019-01-22 00:00:00'),
(8, '6682', 'System', '02 - Divisi', 'RND QA/QC CORPORATE', '2019-01-22 00:00:00'),
(9, 'SCD1', 'System', '02 - Divisi', 'STRATEGIC CORPORATE DIVISION', '2019-01-22 00:00:00'),
(10, '6465', 'System', '02 - Divisi', 'SUPPLY KP DIVISION', '2019-01-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `NIP` varchar(255) NOT NULL,
  `UR_ID` varchar(150) NOT NULL DEFAULT '-',
  `UR_PASSWORD` varchar(150) NOT NULL DEFAULT '-',
  `UR_EMAIL` varchar(150) NOT NULL DEFAULT '-',
  `DN_ID` varchar(255) NOT NULL DEFAULT '-',
  `RS_ID` varchar(150) NOT NULL DEFAULT '-',
  `JBLL_ID` varchar(255) NOT NULL DEFAULT '-',
  `UR_GROUP` varchar(255) NOT NULL,
  `UR_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`NIP`, `UR_ID`, `UR_PASSWORD`, `UR_EMAIL`, `DN_ID`, `RS_ID`, `JBLL_ID`, `UR_GROUP`, `UR_DATE`) VALUES
('12345', 'ADMIN APLIKASI', '12345', 'aldiabdul34@gmail.com', '7550', 'ADMIN KONFIGURASI', 'STAF', '', '2019-02-08 08:49:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_picture`
--
ALTER TABLE `employee_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_format`
--
ALTER TABLE `m_format`
  ADD PRIMARY KEY (`nama`);

--
-- Indexes for table `m_group`
--
ALTER TABLE `m_group`
  ADD PRIMARY KEY (`GROUP_ID`);

--
-- Indexes for table `m_icon`
--
ALTER TABLE `m_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_log`
--
ALTER TABLE `m_log`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `LogDoc` (`LogDoc`);

--
-- Indexes for table `m_maks_comment`
--
ALTER TABLE `m_maks_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_no`
--
ALTER TABLE `m_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_nomor`
--
ALTER TABLE `m_nomor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_proses`
--
ALTER TABLE `m_proses`
  ADD PRIMARY KEY (`PROSES_ID`);

--
-- Indexes for table `m_sharelink`
--
ALTER TABLE `m_sharelink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_watermark`
--
ALTER TABLE `m_watermark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_business_rule`
--
ALTER TABLE `tb_business_rule`
  ADD PRIMARY KEY (`BSRE_ID`);

--
-- Indexes for table `tb_confidential`
--
ALTER TABLE `tb_confidential`
  ADD PRIMARY KEY (`CL_ID`);

--
-- Indexes for table `tb_departemen`
--
ALTER TABLE `tb_departemen`
  ADD PRIMARY KEY (`DN_ID`),
  ADD KEY `FK_DI_ID` (`DI_ID`);

--
-- Indexes for table `tb_direktorat`
--
ALTER TABLE `tb_direktorat`
  ADD PRIMARY KEY (`DT_ID`);

--
-- Indexes for table `tb_distribution_method`
--
ALTER TABLE `tb_distribution_method`
  ADD PRIMARY KEY (`DNMD_ID`);

--
-- Indexes for table `tb_divisi`
--
ALTER TABLE `tb_divisi`
  ADD PRIMARY KEY (`DI_ID`),
  ADD KEY `FK_DT_ID` (`DT_ID`);

--
-- Indexes for table `tb_document`
--
ALTER TABLE `tb_document`
  ADD PRIMARY KEY (`DOC_ID`);

--
-- Indexes for table `tb_document_bookmark`
--
ALTER TABLE `tb_document_bookmark`
  ADD PRIMARY KEY (`DOCB_ID`),
  ADD KEY `DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_comment`
--
ALTER TABLE `tb_document_comment`
  ADD PRIMARY KEY (`DTCT_ID`),
  ADD KEY `FK_DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_detail`
--
ALTER TABLE `tb_document_detail`
  ADD PRIMARY KEY (`DOC_ID`);

--
-- Indexes for table `tb_document_detail_status`
--
ALTER TABLE `tb_document_detail_status`
  ADD PRIMARY KEY (`DTDLSS_ID`),
  ADD KEY `FK_DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_form`
--
ALTER TABLE `tb_document_form`
  ADD PRIMARY KEY (`DTFM_ID`);

--
-- Indexes for table `tb_document_level_access`
--
ALTER TABLE `tb_document_level_access`
  ADD PRIMARY KEY (`DTLLAS_ID`),
  ADD KEY `FK_UR_ID` (`UR_ID`);

--
-- Indexes for table `tb_document_link`
--
ALTER TABLE `tb_document_link`
  ADD PRIMARY KEY (`LINK_ID`),
  ADD KEY `DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_news`
--
ALTER TABLE `tb_document_news`
  ADD PRIMARY KEY (`NEWS_ID`),
  ADD KEY `DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_notification`
--
ALTER TABLE `tb_document_notification`
  ADD PRIMARY KEY (`NOTIF_ID`),
  ADD KEY `DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_document_status`
--
ALTER TABLE `tb_document_status`
  ADD PRIMARY KEY (`DTSS_ID`);

--
-- Indexes for table `tb_document_structure_jenis`
--
ALTER TABLE `tb_document_structure_jenis`
  ADD PRIMARY KEY (`DTSEJS_ID`),
  ADD KEY `FK_DTSEKI_ID` (`DTSEKI_ID`);

--
-- Indexes for table `tb_document_structure_kategori`
--
ALTER TABLE `tb_document_structure_kategori`
  ADD PRIMARY KEY (`DTSEKI_ID`);

--
-- Indexes for table `tb_document_structure_tipe`
--
ALTER TABLE `tb_document_structure_tipe`
  ADD PRIMARY KEY (`DTSETE_ID`),
  ADD KEY `FK_DTSEJS_ID` (`DTSEJS_ID`),
  ADD KEY `FK_JBLL_ID` (`JBLL_ID`),
  ADD KEY `FK_CL_ID` (`CL_ID`),
  ADD KEY `DTSEKI_ID` (`DTSEKI_ID`);

--
-- Indexes for table `tb_document_structure_tipe_access`
--
ALTER TABLE `tb_document_structure_tipe_access`
  ADD PRIMARY KEY (`TD_ID`);

--
-- Indexes for table `tb_document_structure_tipe_distribution`
--
ALTER TABLE `tb_document_structure_tipe_distribution`
  ADD PRIMARY KEY (`TDD_ID`);

--
-- Indexes for table `tb_document_template`
--
ALTER TABLE `tb_document_template`
  ADD PRIMARY KEY (`DOCTEMP_ID`),
  ADD KEY `FK_DTSEKI_ID` (`DTSEKI_ID`),
  ADD KEY `FK_DTSEJS_ID` (`DTSEJS_ID`),
  ADD KEY `FK_DTSETE_ID` (`DTSETE_ID`),
  ADD KEY `FK_UR_ID` (`UR_ID`);

--
-- Indexes for table `tb_document_versioning`
--
ALTER TABLE `tb_document_versioning`
  ADD PRIMARY KEY (`DOCV_ID`),
  ADD KEY `DOC_ID` (`DOC_ID`);

--
-- Indexes for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `tb_employee_detail`
--
ALTER TABLE `tb_employee_detail`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `tb_job_level`
--
ALTER TABLE `tb_job_level`
  ADD PRIMARY KEY (`JBLL_ID`);

--
-- Indexes for table `tb_level_organization`
--
ALTER TABLE `tb_level_organization`
  ADD PRIMARY KEY (`LO_NO`);

--
-- Indexes for table `tb_menus`
--
ALTER TABLE `tb_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_notification_history`
--
ALTER TABLE `tb_notification_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_organization`
--
ALTER TABLE `tb_organization`
  ADD PRIMARY KEY (`ON_ID`),
  ADD UNIQUE KEY `ON_NAME` (`ON_NAME`);

--
-- Indexes for table `tb_periode_preview`
--
ALTER TABLE `tb_periode_preview`
  ADD PRIMARY KEY (`PEPW_ID`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`RS_ID`);

--
-- Indexes for table `tb_structure_organization_departemen`
--
ALTER TABLE `tb_structure_organization_departemen`
  ADD PRIMARY KEY (`SOD_ID`),
  ADD KEY `DN_ID` (`DN_ID`),
  ADD KEY `UR_ID` (`UR_ID`);

--
-- Indexes for table `tb_structure_organization_direktorat`
--
ALTER TABLE `tb_structure_organization_direktorat`
  ADD PRIMARY KEY (`SODT_ID`),
  ADD KEY `DT_ID` (`DT_ID`),
  ADD KEY `UR_ID` (`UR_ID`);

--
-- Indexes for table `tb_structure_organization_divisi`
--
ALTER TABLE `tb_structure_organization_divisi`
  ADD PRIMARY KEY (`SODI_ID`),
  ADD KEY `DI_ID` (`DI_ID`),
  ADD KEY `UR_ID` (`UR_ID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`NIP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_picture`
--
ALTER TABLE `employee_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_icon`
--
ALTER TABLE `m_icon`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_log`
--
ALTER TABLE `m_log`
  MODIFY `LogID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `m_maks_comment`
--
ALTER TABLE `m_maks_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_no`
--
ALTER TABLE `m_no`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_nomor`
--
ALTER TABLE `m_nomor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `m_sharelink`
--
ALTER TABLE `m_sharelink`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_watermark`
--
ALTER TABLE `m_watermark`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_document_news`
--
ALTER TABLE `tb_document_news`
  MODIFY `NEWS_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6985;
--
-- AUTO_INCREMENT for table `tb_document_notification`
--
ALTER TABLE `tb_document_notification`
  MODIFY `NOTIF_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;
--
-- AUTO_INCREMENT for table `tb_menus`
--
ALTER TABLE `tb_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tb_notification_history`
--
ALTER TABLE `tb_notification_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT for table `tb_structure_organization_departemen`
--
ALTER TABLE `tb_structure_organization_departemen`
  MODIFY `SOD_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `tb_structure_organization_direktorat`
--
ALTER TABLE `tb_structure_organization_direktorat`
  MODIFY `SODT_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_structure_organization_divisi`
--
ALTER TABLE `tb_structure_organization_divisi`
  MODIFY `SODI_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_log`
--
ALTER TABLE `m_log`
  ADD CONSTRAINT `m_log_ibfk_1` FOREIGN KEY (`LogDoc`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE;

--
-- Constraints for table `tb_document_bookmark`
--
ALTER TABLE `tb_document_bookmark`
  ADD CONSTRAINT `tb_document_bookmark_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_detail`
--
ALTER TABLE `tb_document_detail`
  ADD CONSTRAINT `tb_document_detail` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_detail_status`
--
ALTER TABLE `tb_document_detail_status`
  ADD CONSTRAINT `tb_document_detail_status_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_link`
--
ALTER TABLE `tb_document_link`
  ADD CONSTRAINT `tb_document_link_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_news`
--
ALTER TABLE `tb_document_news`
  ADD CONSTRAINT `tb_document_news_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_notification`
--
ALTER TABLE `tb_document_notification`
  ADD CONSTRAINT `tb_document_notification_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_structure_jenis`
--
ALTER TABLE `tb_document_structure_jenis`
  ADD CONSTRAINT `tb_document_structure_jenis_ibfk_1` FOREIGN KEY (`DTSEKI_ID`) REFERENCES `tb_document_structure_kategori` (`DTSEKI_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_structure_tipe`
--
ALTER TABLE `tb_document_structure_tipe`
  ADD CONSTRAINT `tb_document_structure_tipe_ibfk_1` FOREIGN KEY (`DTSEKI_ID`) REFERENCES `tb_document_structure_kategori` (`DTSEKI_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_document_versioning`
--
ALTER TABLE `tb_document_versioning`
  ADD CONSTRAINT `tb_document_versioning_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `tb_document` (`DOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
