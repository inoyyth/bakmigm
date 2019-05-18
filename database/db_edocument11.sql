-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2019 at 09:39 AM
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
(1, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-02 20:16:35'),
(2, '1905030931092605889', 'Komentar', '200054', NULL, '2019-05-02 20:36:36'),
(3, '1905030931092605889', 'Lihat', '200054', NULL, '2019-05-02 20:36:42'),
(4, '1905030931092605889', 'Lihat', '200054', NULL, '2019-05-02 20:36:50'),
(5, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-02 20:39:55'),
(6, '1905030931092605889', 'Lihat', '170236', NULL, '2019-05-02 20:41:12'),
(7, '1905030931092605889', 'Bookmark', '170236', NULL, '2019-05-02 20:41:22'),
(8, '1905031055327394039', 'Komentar', '171404', NULL, '2019-05-02 21:01:14'),
(9, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-02 21:01:27'),
(10, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-02 21:01:30'),
(11, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-02 21:01:32'),
(12, '1905030931092605889', 'Sharelink', '171404', NULL, '2019-05-02 21:13:03'),
(13, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-02 21:16:43'),
(14, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-02 21:16:46'),
(15, '1905030931092605889', 'Download', '170236', NULL, '2019-05-02 21:18:24'),
(16, '1905031105235395060', 'Lihat', '210569', NULL, '2019-05-02 23:35:30'),
(17, '1905031105235395060', 'Lihat', '210569', NULL, '2019-05-02 23:35:38'),
(18, '1905031105235395060', 'Lihat', '210569', NULL, '2019-05-02 23:35:42'),
(19, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-05 23:43:50'),
(20, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-05 23:44:33'),
(21, '1905031105235395060', 'Lihat', '171404', NULL, '2019-05-05 23:44:48'),
(22, '1905030931092605889', 'Lihat', '210569', NULL, '2019-05-06 00:42:03'),
(23, '1905030931092605889', 'Lihat', '170236', NULL, '2019-05-06 02:21:41'),
(24, '1905030931092605889', 'Lihat', '171404', NULL, '2019-05-07 19:47:44'),
(25, '1905030931092605889', 'Archived', '170236', NULL, '2019-05-07 19:51:26'),
(26, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-07 19:55:17'),
(27, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-07 19:55:55'),
(28, '1905031055327394039', 'Lihat', '171404', NULL, '2019-05-07 19:56:10'),
(29, '1905031055327394039', 'Komentar', '210569', NULL, '2019-05-07 20:19:03'),
(30, '1905031055327394039', 'Sharelink', '171404', NULL, '2019-05-14 20:36:21');

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
(4, 'DOCNO', 'Nomor Dokumen', 'Table', 'Year', 'Month', 'Delimeter', 'Free Text', 'form', 'MNL-HRS-KMS-01'),
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
(1, 'Diunduh Oleh : ', 'NIP', 'Nama', 'Tanggal/Bulan/Tahun');

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
('1844', 'GMABMG', 'Building Management GEMA', '1843', '2019-05-18 05:00:05'),
('5882', 'MKT', 'Marketing', '5880', '2019-05-18 05:00:05'),
('5893', 'BPJ', 'Building Project', '5880', '2019-05-18 05:00:05'),
('5898', 'BDV', 'Business Development', '5880', '2019-05-18 05:00:05'),
('5904', 'IRL', 'Industrial Relation, Cooperatives & Personnel Admin ', '5901', '2019-05-18 05:00:05'),
('5922', 'CnB', 'COMPENSATION & BENEFIT DEPARTMENT', '5901', '2019-05-18 05:00:05'),
('5926', 'LnD', 'LEARNING & DEVELOPMENT DEPARTMENT', '5901', '2019-05-18 05:00:05'),
('5942', 'REC', 'Recruitment Department', '5901', '2019-05-18 05:00:05'),
('6467', 'PPIC', 'PPIC', '6465', '2019-05-18 05:00:05'),
('6494', 'PLANT', 'Plant Department', '7840', '2019-05-18 05:00:05'),
('6526', 'PRCH', 'Purchasing', '6465', '2019-05-18 05:00:05'),
('6534', 'AMG', 'Asset Management Department', '6571', '2019-05-18 05:00:05'),
('6540', 'ACC', 'Accounting & Tax Department', '6538', '2019-05-18 05:00:05'),
('6551', 'FIN', 'Finance Department', '6538', '2019-05-18 05:00:05'),
('6559', 'SYS', 'System Development', '5877', '2019-05-18 05:00:05'),
('6563', 'ITY', 'Information Technology Department', '6538', '2019-05-18 05:00:05'),
('6573', 'OSV', 'Office Service Department', '6571', '2019-05-18 05:00:05'),
('6588', 'EKP', 'Engineering KP Department', '6571', '2019-05-18 05:00:05'),
('6678', 'PPM', 'Property Management Department', '6571', '2019-05-18 05:00:05'),
('6684', 'GMSOPS100H', 'Operation HO Office', '5977', '2019-05-18 05:00:05'),
('6685', 'LOG', 'Logistic', '7840', '2019-05-18 05:00:05'),
('6837', 'CST', 'Costing Department', '6538', '2019-05-18 05:00:05'),
('7013', 'BDT', 'Plan & Budget Department', '6538', '2019-05-18 05:00:05'),
('7016', 'CHS.FT1', 'Food Truck', '5977', '2019-05-18 05:00:05'),
('7080', 'CPP.ES', 'CPP ENGINEERING', '7818', '2019-05-18 05:00:05'),
('7081', 'CPP.QAQC', 'CPP QA-QC', '7176', '2019-05-18 05:00:05'),
('7083', 'CPP.PPIC', 'CPP PPIC & WAREHOUSE', '7818', '2019-05-18 05:00:05'),
('7091', 'CSY', 'Corporate Secretary', '7841', '2019-05-18 05:00:05'),
('7150', 'SPE', 'Store Process Engineering', '6571', '2019-05-18 05:00:05'),
('7151', 'EST', 'Engineering Store Department', '6571', '2019-05-18 05:00:05'),
('7152', 'CHS', 'CHANNEL SALES', '5977', '2019-05-18 05:00:05'),
('7153', 'PMO', 'PMO DEPARTMENT', '5977', '2019-05-18 05:00:05'),
('7175', 'QCL', 'Quality Control Department', '6682', '2019-05-18 05:00:05'),
('7176', 'QUA', 'RnD QA-QC Department', '6682', '2019-05-18 05:00:05'),
('7239', 'PMPD', 'Performance Management & People Development', '5901', '2019-05-18 05:00:05'),
('7371', 'PROC', 'PROCUREMENT', '6465', '2019-05-18 05:00:05'),
('7407', 'CPP.FRM', 'CPP FORMULATION', '7818', '2019-05-18 05:00:05'),
('7488', 'CPG', 'Corporate Planning Department', '5877', '2019-05-18 05:00:05'),
('7494', 'IAD', 'Internal Audit Department', '5877', '2019-05-18 05:00:05'),
('7527', 'HSP', 'Human Resources Support', '5901', '2019-05-18 05:00:05'),
('7550', 'BPI', 'BUSINESS PROCESS IMPROVEMENT', '7549', '2019-05-18 05:00:05'),
('7555', 'RnD', 'R&D', '6682', '2019-05-18 05:00:05'),
('7562', 'SPA', 'STORE PERFORMANCE ANALYST DEPARTMENT', '5977', '2019-05-18 05:00:05'),
('7564', 'SDP', 'STORE DEMAND PLANNING DEPARTMENT', '5977', '2019-05-18 05:00:05'),
('7591', 'CPP.FLOUR', 'CPP - FLOUR PROCESSING', '7818', '2019-05-18 05:00:05'),
('7596', 'CPP.FOOD', 'CPP - FOOD PROCESSING', '7818', '2019-05-18 05:00:05'),
('7603', 'DAE', 'Design & Architecture Department', '5880', '2019-05-18 05:00:05'),
('7761', 'FIN.AR.0001', 'Finance Account Receivable', '6551', '2019-05-18 05:00:05'),
('7762', 'FIN.AP.0002', 'Finance Account Payable & Expenses', '6551', '2019-05-18 05:00:05'),
('7769', 'QAQC', 'QA QC SUPPLY DEPARTMENT', '6682', '2019-05-18 05:00:05'),
('7924', 'MAT', 'Management Audit Department', '7841', '2019-05-18 05:00:05');

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
('5880', 'BDD', 'Business Development Division', 'DIR.003', '2019-05-18 05:00:05'),
('5901', 'HRS', 'Human Resource Division', 'DIR.002', '2019-05-18 05:00:05'),
('5977', 'OPT', 'Operations Division', 'DIR.001', '2019-05-18 05:00:05'),
('6465', 'SUPL', 'SUPPLY KP DIVISION', 'DIR.001', '2019-05-18 05:00:05'),
('6538', 'FAST', 'Finance, Acct, Costing, Budget, IT Division', 'DIR.002', '2019-05-18 05:00:05'),
('6571', 'EnS', 'ENGINEERING & SERVICES DIVISION', 'DIR.004', '2019-05-18 05:00:05'),
('6682', 'QRD', 'RnD QAQC Corporate', 'DIR.004', '2019-05-18 05:00:05'),
('7549', 'PDD', 'PROCESS DEVELOPMENT DIVISION', 'DIR.004', '2019-05-18 05:00:05'),
('7818', 'CPP', 'CPP-Supply Division', 'DIR.001', '2019-05-18 05:00:05'),
('7841', 'OTH', 'Other Strategic Division', 'DIR.001', '2019-05-18 05:00:05'),
('7911', 'KDP', 'DC - KANTOR DENPASAR BALI', '', '2019-05-18 05:00:05');

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
('1905030931092605889', '2019-05-03 11:19:53', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', 'PROSES', 'SOP201905/007', 'SOP UAT 03 05 2019 Test 1 PDF, WORD, VISIO', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7550', '7550', '2.1', '2019-01-01', '12', '2019-05-08', 'SOP, UAT, TEST, Test 1, PDF, WORD, VISIO, Standart operating procedure', 'UAT 03 05 2019 TEST 1 PDF, WORD, VISIO Standar Operating Procedur', '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||1905030931092605889|1905031055327394039|1905031105235395060', '170236', 'DEPARTEMEN', 'JOHAN MOHAMMAD', 'DIARSIPKAN', 'Diarsipkan oleh JOHAN MOHAMMAD', 'proses sudah tidak berlaku'),
('1905031055327394039', '2019-05-03 10:57:59', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201905/008', 'SOP UAT 3 05 2019 Test 2 Excel, Autocad, JPG', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '7527|7550|7924', '7527', '7550', '7550', '1.0', '2019-05-01', '24', '2021-04-30', 'Excel, Autocad, JPG', 'Excel, Autocad, JPG', '1905030931092605889', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1905031105235395060', '2019-05-03 11:08:55', 'DTSEKI0004', 'DTSEJS0022', 'DTSETE0040', 'GROUP PROSES', 'PROSES', 'EDU201905/009', 'UAT Test 3 PPT, PNG, MP4', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '7527|7550|7924', '7527', '7527', '7527', '1.0', '2019-05-01', '12', '2020-04-30', 'UAT 3, PPT, PNG, MP4', 'UAT3 PPT PNG MP4', '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1905131811184220576', '2019-05-13 18:26:26', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-BPI-GDM-1.1.8', 'Penulisan Standart Operating Procedure', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '7550', '7550', '7550', '2.0', '2019-05-13', '12', '2020-05-12', 'sop, template, petunjuk, pengisian, procedures, prosedur, format, esope', 'Penjelasan petunjuk atau cara pengisian SOP (prosedur) sekaligus template formal', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905140933553750985', '2019-05-14 09:46:22', 'DTSEKI0002', 'DTSEJS0011', 'DTSETE0011', '', '', 'STO201810/002', 'Struktur organisasi dept Financial Planning & Analysis', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '6540|6551|6563|6837|7013|7550|7761|7762|7924', '7013', '7550', '7550', '2', '2018-10-22', '12', '2019-10-21', 'STO FPA, STO finance planning, STO finance analis, STO finance analysis', 'Struktur organisasi departemen Financial Planning & Analysis', '', '180887', 'DEPARTEMEN', 'THOMAS ADITYA PANDU WIRAWAN', 'DITOLAK 7550', 'Ditolak BPI ( BUSINESS PROCESS IMPROVEMENT )', '-'),
('1905150835572218319', '2019-05-15 08:43:23', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-BPI-GDM-1.1.5', 'Penulisan Spesifikasi Produk', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '7176|7550|7555|7924', '7550', '7550', '7550', '2', '2019-05-13', '12', '2020-05-12', 'SPC, spesifikasi, specification, product specification', 'Petunjuk pengisian SPC / produk spesifikasi', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905150844574113342', '2019-05-15 08:58:44', 'DTSEKI0003', 'DTSEJS0018', 'DTSETE0025', 'GROUP PROSES', 'PROSES', 'STD-BPI-GDM-1.1.1', 'Klasifikasi Dokumen', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '7550', '7550', '7550', '1.0', '2019-05-13', '12', '2020-05-12', 'Umur dokumen, masa berlaku dokumen, contoh dokumen, tipe dokumen, approver, users, BPO, BPA', 'Daftar klasifikasi dokumen beserta umur dokumen yang ditentukan', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905150925413017532', '2019-05-15 09:29:21', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', 'GROUP PROSES', 'PROSES', 'FRM-BPI-GDM-1.2.1', 'Daftar Distribusi Dokumen', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '7550', '7550', '7550', '2', '2019-05-13', '12', '2020-05-12', 'Daftar Distribusi Dokumen', 'Formulir dan petunjuk pengisian daftar distribusi', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905150931138833724', '2019-05-15 09:35:08', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', 'GROUP PROSES', 'PROSES', 'FRM-BPI-GDM-1.1.13', 'Lembar Distribusi Persetujuan', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '7550', '7550', '7550', '2', '2019-05-13', '12', '2020-05-12', 'Lembar distribusi persetujuan, LDP', 'Petunjuk pengisian lembar distribusi persetujuan', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905150936547996033', '2019-05-15 09:39:05', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', 'GROUP PROSES', 'PROSES', 'FRM-BPI-GDM-1.2.2', 'Tanda Terima Dokumen / Rekaman', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924', '7550', '7550', '7550', '2', '2019-05-13', '12', '2020-05-12', 'TTD, Tante', 'Petunjuk dan format tanda terima dokumen', '', '171314', 'DEPARTEMEN', '171314', '7549', 'Menunggu Persetujuan dari PDD (PROCESS DEVELOPMENT DIVISION)', '-'),
('1905151000507775134', '2019-05-15 10:53:10', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-HRS-KMS-01', 'Aplikasi Service Desk (Requester Login)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV', '5882|5893|5898|5904|5922|5926|5942|6467|6526|6534|6540|6551|6563|6573|6588|6678|6684|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924', '7527', '7550', '7550', '1.0', '2018-04-01', '24', '2020-03-31', 'service desk, service, desk, requester, technician, request, complain', 'Manual ini menginformasikan cara menggunakan aplikasi service desk untuk login sebagai requester (peminta jasa)', '', '210569', 'DEPARTEMEN', 'THOMAS ADITYA PANDU WIRAWAN', 'DITOLAK 7550', 'Ditolak BPI ( BUSINESS PROCESS IMPROVEMENT )', '-');

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
('1905031041226223275', '170236', '1905030931092605889');

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
('1905031036369583158', '1905030931092605889', '2019-05-03 10:36:36', '170236', '200054', 'Dilengkapi'),
('1905031101147199675', '1905031055327394039', '2019-05-03 11:01:14', '170236', '171404', 'Tes komentar UAT Test 2'),
('1905081019039362260', '1905031055327394039', '2019-05-08 10:19:03', '170236', '210569', 'Sudah tidak relevan');

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
('1905030931092605889', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_070320181', 'application/pdf', 1, 'pdf', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_070320186', 'application/msword', 0, 'doc', 'WIS-SCS-REC-1.1.1_Ver.1.0_Input_Sharing_Cost_Seragam_di_HRIS_-file_edit1', 'application/vnd.visio', 0, 'vsd', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_persetujuan.pdf', 'application/pdf', ' \n \n \nProsedur:  \nPenambahan Posisi/Kuota Baru Hal.: 1 / 3 \nKerahasiaan: Confidential Tgl.: )HNUXMUL¶18 Ver.: 1.0 No.: SOP-REC-REC-7.1 \nDibuat oleh: \n \n \n \n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Maudy Fitriani Irana \nRecruitment Ass.Manager \nRita Raesita \nRecruitment Manager \nCynthia Fellicianne \nGM HRS \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\nDiterapkan dan Disetujui oleh: \nDepartemen / Divisi Disetujui Tanda Tangan \nPMPD C. Andrey   \nC&B Daniel Sidharta  \nITY-HKM Teddy Sutanto  \nBPI Thomas Aditya  \nBusiness Development a.n. Tammy Tanumihardja  \nOperations Budi Purnama  \nSupply Antonius Hendrajaya  \nFAST Anthony Pamungkas  \nEngineering & Services Prihanto Basuki  \n \nTanggal Efektif   : Maret 2018                            \n \nDAFTAR ISI \n1. TUJUAN ............................................................................................................................................................................. 2 \n2. RUANG LINGKUP .............................................................................................................................................................. 2 \n3. DEFINISI ............................................................................................................................................................................ 2 \n4. REFERENSI ....................................................................................................................................................................... 2 \n5. DOKUMEN PENUNJANG .................................................................................................................................................. 2 \n6. PROSEDUR DAN TANGGUNG JAWAB ........................................................................................................................... 2 \n7. KONDISI KHUSUS/INFORMASI KHUSUS ........................................................................................................................ 3 \n8. LAMPIRAN ......................................................................................................................................................................... 3 \n \n \n \n \n \n \n \n \n \n Prosedur:  \nPenambahan Posisi/Kuota Baru \nNo: SOP-REC-REC-7.1 Ver.: 1.0 \nTgl.: )HNUXMUL¶18 Hal.: 2 / 3 \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\n1. TUJUAN \nMenjelaskan alur proses penambahan posisi/kuota baru. \n \n2. RUANG LINGKUP \n2.1. Store / Dept. Manager (Pemohon) \n2.2. Performance Management & People Development Dept. \n2.3. Compensation & Benefit Dept.  \n2.4. Business Process Improvement Dept. \n2.5. Accounting Dept. \n2.6. Recruitment Dept. \n2.7. ITY-HKM Dept \n \n3. DEFINISI \n - \n \n4. REFERENSI \n- \n \n5. DOKUMEN PENUNJANG \n5.1. FRM-REC-REC-7.1.2 Ver.1.1 Form Penambahan Kuota \n5.2. FRM-REC-REC-7.1.3 Ver.1.1 Forn Penambahan Posisi Baru di HRIS \n5.3. Struktur Organisasi (STO) \n5.4. Job Summary (JBS) \n5.5. Kamus Penilaian Kompetensi Generik \n5.6. Kamus Penilaian Kompetensi Fungsional \n \n6. PROSEDUR DAN TANGGUNG JAWAB \nDilakukan oleh Kegiatan Waktu \nStore / Dept. Manager \n(Pemohon)  \n1 Berdasarkan  inisiasi  perubahan  struktur  organisasi, penambahan \nposisi/kuota maka : \n1) Berdiskusi dengan GM/Direktur mengenai penambahan posisi/ kuota :   \n Terkait dengan budget tahunan  ataupun  rencana  strategis \nperusahaan \n Ada Analisa Jabatan berdasarkan faktor desain organisasi \ndan desain pekerjaan \n2) Jika ada penambahan posisi dan kuota, lanjutkan ke poin 2. \n3) Jika hanya penambahan kuota, mengisi  Form  Penambahan  Kuota \n(FPK) dan lanjutkan ke poin 9. \n \n 2 Berdasarkan adanya penambahan posisi dan kuota, maka: \n1) Merevisi Struktur Organisasi (STO). \n2) Membuat Job Summary (JBS).  \n3) Mengisi Form Penambahan Posisi Baru (FPPB) sesuai kolom PIC. \n \nAst. PMPD Manager 3 1) Membahas  kaitan antara  STO  dan JBS dengan Kamus Penilaian \nKompetensi Generik  dan  Kamus Penilaian Kompetensi  Fungsional \n10 hari kerja \n Prosedur:  \nPenambahan Posisi/Kuota Baru \nNo: SOP-REC-REC-7.1 Ver.: 1.0 \nTgl.: )HNUXMUL¶18 Hal.: 3 / 3 \n \nFRM-SYS-GDM-3.2.1 Ver.1.1 \n\nDilakukan oleh Kegiatan Waktu \nbersama dengan pemohon, kemudian:  \na. Menentukan level pada Kamus Penilaian Kompetensi Generik \nb. Mereview Kamus Penilaian Kompetensi Fungsional. Jika sudah \nada,  tentukan  level  kompetensinya.  Jika  belum  ada,  maka \nmembuat kompetensinya. \n2) Mengisi FPPB sesuai kolom PIC. \nAst. PMPD Manager;  \nAst. Comben Manager; \nStore / Dept. Manager \n(Pemohon)   \n4 1) Melaksanakan review Job Summary untuk menentukan grade jabatan, \nbersama dengan pemohon dan Ast. PMPD Manager \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \nStore / Dept. Manager \n(Pemohon) \n5 1) Meminta tanda tangan GM divisi terkait, GM Human Resource dan \nDirektur terkait  pada  STO, JBS, FPPB, dan Kamus Penilaian \nKompetensi (KPK) Fungsional (jika ada). \n2) Setelah mendapat persetujuan, maka mengirimkan STO, JBS, FPPB, \nKPK Fungsional ke Dept. BPI. \n7 hari kerja \nDept. BPI 6 1) Menerima STO, JBS, FPPB, dan KPK Fungsional (jika  ada)  dan \nmelakukan serah terima sesuai prosedur yang berlaku. \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \n7 Melakukan publish dokumen-dokumen tersebut pada web portal sesuai \nManual Aplikasi e-Document.  \n2 hari kerja \nRecruitment Manager 8 Berdasarkan  FPPB yang  diterima dari  BPI untuk  penambahan  posisi, \nmaka: \n1) Melihat STO, JBS, dan KPK Fungsional di E-Document. \n2) Mengisi FPPB sesuai kolom PIC. \n2 hari kerja \n 9 Lanjutan dari kegiatan 1.2). \nBerdasarkan  FPK  yang  diterima  dari  Store/Dept. Manager (pemohon) \nuntuk penambahan kuota, maka: \n1) Mengarsipkan FPK asli. \n2) Menyerahkan FPPB ke ITY-HKM. \n2 hari kerja \nAst. ITY-HKM Manager 10 Berdasarkan FPPB, maka melakukan: \n1) Setup new position di HRIS, dengan referensi E-Doc. / punya akses \nke STO dan JBS. \n2) Mengarsipkan FPPB. \n2 hari kerja \n \n7. KONDISI KHUSUS/INFORMASI KHUSUS \n- \n \n8. LAMPIRAN \nBagan Alir '),
('1905031055327394039', 'PMD_-_Matriks-MUTASI_TETAP1', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 'xlsx', 'Auto_Cad1', 'application/octet-stream', 0, 'dwg', 'temuan1', 'image/jpeg', 0, 'jpg', 'SOP-REC-REC-7.1_Ver.1.0_Penambahan_Posisi_Baru_persetujuan1.pdf', 'application/pdf', 'PERSETUJUAN MANAJEMEN DOKUMEN\nNama Dokumen                   Matriks-MUTASI TETAP-PERMINTAAN PEKERJA (Crew)\nNomor Dokumen                : MTK-IRL-REC-C.08-08\nWujud Dokumen Master: Hard CopyMetode Distribusi\nStandar Kerahasiaan: Confidential\nAtribut Dokumen \nKategori Dokumen: Prosedur & Dokumen Penunjang\nJenis Dokumen: Dokumen Penunjang Prosedur\nTipe Dokumen: Standar\nGroup Proses 5 M: Man\nProses: Recruitment \nKepemilikan Dokumen\nLevel Akses (Job Level): All Level \nPengguna Dokumen  (Dept)             : All\nDivisi/Dept. Pemilik Proses: Recruitment\nDivisi/Dept. Penyimpan Dokumen Master: Industrial Relation\nDivisi/Dept. Pendistribusi: Business Process Improvement \nSejarah Dokumen\nTanggal Efektif Berlaku: 01 November 2016Versi\n: 2 Tahun\nKata Kunci\nAbstrak\n \nDokumen terkaitPKP-IRL-REC-C08 (Kebijakan Mutasi Luar Kota)\nGM yang bersangkutanManager SYS*ManagerHeader Dokumen\nPeriode ReviewTanggal Expired\n: Mutasi; Tetap; Luar; Kota; Penugasan; Perusahaan; Crew;Keinginan; Permintaan; Pekerja; \nGanti; Posisi\nMatriks Mutasi Tetap atas Keinginan atau permintaan pekerja untuk Crew.  Membahas pula \nprosedur mutasi, gaji pokok / upah pokok,  tunjangan jabatan,  fasilitas makan atau \ncatering, uang transport, bantuan biaya hidup luar kota, bantuan biaya akomodasi luar kota, \nBPJS kesehatan, BPJS ketenagakerjaan, biaya perjalanan dinas mutasi-luar kota, bantuan \nbiaya mutasi pindah - luar kota, ketentuan penetapan upah PKWT, ketentuan penetapan \nupah - PT, ketentuan penetapan upah - PKWT - LU, ketentuan penyesuaian upah berkala 1 \nJanuari - PKWT, ketentuan penyesuaian upah berkala 1 Januari - PT, ketentuan upah \nberkala 1 Januari - PKWT - LU, dan kesempatan libur pulang dengan tanggungan \nperusahaan.\nPersetujuan / komentar:Persetujuan / komentar:Persetujuan / komentar:\n*\nFRM-GDM-SYS-2.1.1 Ver.1.3Khusus untuk dokumen dengan kategori Kebijakan dan Struktur Organisasi, serta Prosedur dan Dokumen Penunjang\nPERSETUJUAN MANAJEMEN DOKUMEN\n: e-Document\n:1.0\n: 31 Oktober 2018\nPKP-IRL-REC-C08 (Kebijakan Mutasi Luar Kota)\nManager: Mutasi; Tetap; Luar; Kota; Penugasan; Perusahaan; Crew;Keinginan; Permintaan; Pekerja; \nGanti; Posisi\nMatriks Mutasi Tetap atas Keinginan atau permintaan pekerja untuk Crew.  Membahas pula \nprosedur mutasi, gaji pokok / upah pokok,  tunjangan jabatan,  fasilitas makan atau \ncatering, uang transport, bantuan biaya hidup luar kota, bantuan biaya akomodasi luar kota, \nBPJS kesehatan, BPJS ketenagakerjaan, biaya perjalanan dinas mutasi-luar kota, bantuan \nbiaya mutasi pindah - luar kota, ketentuan penetapan upah PKWT, ketentuan penetapan \nupah - PT, ketentuan penetapan upah - PKWT - LU, ketentuan penyesuaian upah berkala 1 \nJanuari - PKWT, ketentuan penyesuaian upah berkala 1 Januari - PT, ketentuan upah \nberkala 1 Januari - PKWT - LU, dan kesempatan libur pulang dengan tanggungan \nperusahaan.\nFRM-GDM-SYS-2.1.1 Ver.1.3\nNo.Wujud dokumen\n1Hardcopy\n2Softcopy\nNo.Metode Distribusi\n1e-Document\nNo.Standar Kerahasiaan(lihat detilnya di sheet "atribut")\n1Restricted\n2Confidential\n3Non Confidential\nNo.Kategori DokumenJenis DokumenTipe Dokumen\nICOMPANY PROFILE1.1Visi\n1.2Misi\n1.3Corporate Value\n1.4Kode Etik Perusahaan\n1.5Value Chain Map\n1.6Kelengkapan perijinan perusahaan\n1.7Sertifikat dan Standarisasi\n1.8\n1.9Dok. Eksternal\nII2.1Pernyataan Kebijakan Perusahaan\n2.2Struktur Organisasi\n2.3Job Summary\n2.4Balanced Scorecard2.4.a\n2.4.b\n2.5Panduan Manual Mutu Produk2.5.a\n2.5.b\n2.5.c\n2.6Dok. Eksternal\nIII3.1Prosedur3.1.a\n3.1.b\n3.1.c\n3.1.d\n3.2Prosedur Detil3.2.a\n3.2.b\n3.3Dokumen Penunjang Prosedur3.3.a\n3.3.b\n3.3.c\n3.3.d\n3.4Formulir\n3.5Dok. Eksternal\nIVREKAMAN4.1Communication\n4.2Education\n4.3Report\n4.4Dok. EksternalBalanced Scorecard Perusahaan\nKEBIJAKAN & STRUKTUR \nORGANISASI\nPROSEDUR & DOK. \nPENUNJANG\nNo.Group Proses 5 MProses\nIMan1.1Recruitment\n1.2People Development\n1.3Performance Management\n1.4Retention\n1.5Termination\nIIMachine\nIIIMethode\nIVMaterial\nVMoney\nMAN\nRecruitment\nTraining & Development\nPerformance Management\nPeople Retention\nTermination\nMATERIAL\nSource \nMake\nDeliver\nDelivery Return\nSource Return\nMETHODE\nBusiness Analyst\nProject Management\nService Transition\nService Operation\nContinual Service Improvement\nMACHINE\nSearch\nBuild\nMaintenance\nRenovate\nTerminate\nMONEY\nModal \nPenjualan\nPelaporan & Penerimaan Hasil Penjualan\nPembayaran Hutang\nPengelolaan Kelebihan Dana\nTipe DokumenStandar Kerahasiaan\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nConfidential\nRestricted\nRestricted\nManual Sistem Jaminan HalalConfidential\nRestricted\nProduk SpesifikasiConfidential\nBusiness Process MappingConfidential\nOperation Process ChartConfidential\nStandard Operating ProcedureConfidential\nService Level AgreementConfidential\nManualConfidential\nConfidential\nStandar Confidential\nAs Built DrawingConfidential\nGambar TeknikConfidential\nConfidential\nConfidential\nConfidential ; Non Confidential (Public)\nConfidential\nRestricted ; ConfidentialBalanced Scorecard Divisi\nBalanced Scorecard Unit Kerja\nBill of Material / \nStandar Bahan dan Bumbu\nWork Instruction / Lembar Uraian Kerja\nModul Training\nmerujuk pada manusia sebagai tenaga kerja\nmerujuk pada bahan baku sebagai unsur utama untuk diolah sampai menjadi produk akhir untuk diserahkan pada konsumen\nmerujuk pada metode/prosedur sebagai panduan pelaksanaan kegiatan perusahaan\nmerujuk pada mesin sebagai fasilitas/alat penunjang kegiatan perusahaan baik operasional maupun nonoprasional.\nmerujuk pada uang sebagai modal untuk pembiayaan seluruh kegiatan perusahaan\nmerujuk pada bahan baku sebagai unsur utama untuk diolah sampai menjadi produk akhir untuk diserahkan pada konsumen\nmerujuk pada mesin sebagai fasilitas/alat penunjang kegiatan perusahaan baik operasional maupun nonoprasional.\nLevel Akses (Job Level)BoD\nGM\nMgr.\nAst. Mgr\nSpv.\nAst. Spv\n..\n..\nPengguna Dokumen  (Dept)             ..\nDivisi/Dept. Pemilik ProsesPMPD\nDivisi/Dept. Penyimpan Dokumen MasterSYS\nDivisi/Dept. PendistribusiSYS'),
('1905031105235395060', 'UAT_2_PENCIPTA_-_16_11_20181', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 0, 'pptx', 'logo_bank1', 'image/png', 0, 'PNG', 'MP41', 'video/mp4', 0, 'mp4', 'Persetujuan_SOP_Penambahan_Posisi_Baru_persetujuan2.pdf', 'application/pdf', 'Temuan Ci\nDiubah jadi "Regitrasi \nDokumen"\nJudul "atribut dokumen" disini dihilangkan \nkarena sudah ada di atas. Konsisten pada \nwizard selanjutnya.'),
('1905131811184220576', '8a._MNL-BPI-GDM-1.1.8_Ver.2.0_Penulisan_Standart_Operating_Procedure', 'application/msword', 1, 'doc', '8b._FRM-BPI-GDM-1.1.8_Ver.2.0_Format_Standart_Operating_Procedure_Narasi', 'application/msword', 0, 'doc', '8c._FRM-BPI-GDM-1.1.8_Ver.2.0_Format_Standart_Operating_Procedure_Bagan', 'application/vnd.visio', 0, 'vsd', 'Pengesahan_Dokumen_Penulisan_Standar_Operating_Procedure.pdf', 'application/pdf', 'Manual: \nPenulisan Standart Operating ProcedureHal.: 1 / 9\nKerahasiaan: ConfidentialTgl.: 14 Mar-\'19Ver.: 2.0No.: MNL-BPI-GDM-1.1.8\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATIHarry Nugroho P.\nBPI SupervisorThomas Aditya\nBPI ManagerWidianto\nBOD\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nBDVTammy T.\nOPTBudi P\nFASTAnthony P.\nE&SIman D.\nHRCynthia F.\nSPLAntonius H.\nR&D/ QA/ QCYunita K.\nTanggal Efektif :                            \nDAFTAR ISI\n1.TUJUAN.................................................................................................................................................................2\n2.RUANG LINGKUP.................................................................................................................................................2\n3.DEFINISI................................................................................................................................................................2\n4.REFERENSI..........................................................................................................................................................2\n5.DOKUMEN PENUNJANG.....................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB...............................................................................................................2\n7.KONDISI KHUSUS/INFORMASI KHUSUS...........................................................................................................8\n8.LAMPIRAN (DIAGRAM ALIR, DLL)......................................................................................................................8\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 2 / 9\n1.TUJUAN\nMenjelaskan cara penulisan Standart Operating Procedure.\n2.RUANG LINGKUP\nSeluruh Dept./Store PT Griya MieSejati\n3.DEFINISI\nStandart Operating Procedure: Dokumen   yang   menginformasikan   tentang   bagaimana menjalankan\nkegiatan dari proses manajemen secara konsisten\n4.REFERENSI\n1)PKP-BPI-GDM-1: Kebijakan Manajemen Dokumen\n2)PKP-PMPD-ODV-1: Kebijakan Manajemen Struktur Organisasi Bakmi GM\n3)SOP-BPI-GDM-1.1: Prosedur Penciptaan Dokumen\n4)STD-BPI-GDM-1.1: Standar Klasifikasi Dokumen\n5.DOKUMEN PENUNJANG\n-\n6.PROSEDUR DAN TANGGUNG JAWAB\n6.1. Format Layout\n1)Ukuran kertas: A4 (21 cm x 29,7 cm) / (8,3" x 11,7")\n2)Nama program: Microsoft Office Word \n3)Ukuran margin:\nLeft      : 2,0 cm (0,8")Right     : 1,5 cm (0,6")\nTop       : 1,5 cm (0,6")Bottom  : 1,2 cm (0,5")\nHeader : 1,5 cm (0,6")Footer   : 1,2 cm (0,6")\n4)Ukuran paragraph: Line spacing- fixed of  0,55 cm (0,22")\n5)Ukuran header:\nNamaLainnya\nFontArial NarrowArial Narrow\nSize1411\nStyleBoldRegular\nTypeTitle caseSentence case\n6)Ukuran footer:\nNomor FormulirFootnote\nFontArial NarrowArial Narrow\nSize1010\nStyleRegularRegular\nTypeUpper caseSentence case\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 3 / 9\n7)Pengarsipan: Dept. Business Process Improvement\n8)Pendistribusian: e-Document \nGambar 6.1.Halaman Depan Prosedur\n6.2.Format Header\n1)Logo  : Logo dan nama perusahaan\n2)Nama  : Nama dokumen\n3)No.  : Nomor dokumen (SOP-AAA-BBB-C.D)\nAAA    : singkatan nama departemen pemilik proses\nBBB     : singkatan nama proses\nC.D      : nomor urut prosedur berdasarkan bisnis proses\n4)Ver.: Versi dokumen (pengkinian dokumen dengan perubahan isi dan pengkinian \ndokumen\nFRM-BPI-GDM-1.1.9 Ver.2.06.\n2\n6.\n321\n45673\n8\n1\n2\n3\nFRM-BPI-GDM-1.1.12 Ver. 2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 4 / 9\n     tanpa perubahan isi)\n5)Tanggal: Tanggal dibuat prosedur\n6)Hal.: Halaman dan jumlah halaman dokumen\n7)Kerahasiaan: Kerahasiaan dokumen\na)Restricted: Data sangat sensitif dan strategis, distribusi terbatas hanya pada pihak internal\n  perusahaan yang berhak mengetahaui informasi dari dokumen/ pihak eksternal yang\n  sedang mengerjakan project strategic\nb)Confidential: Data yang sensitif yang ditujukan untuk seluruh Dept./ Store serta pihak eksternal\n  yang diijinkan untuk mengetahui informasi dari dokumen\nc)Non-Confidential: Data yang tidak sensitif dimana distribusi tidak dibatasi dan tersedia untuk umum\n8)Persetujuan penerbitan:\na)Dibuat oleh: Tanda tangan dan nama jelas pembuat dokumen (minimal Team Leader)\nb)Ditinjau oleh: Tanda tangan dan nama jelas peninjau ulang (minimal Head of Department)\nc)Disetujui oleh: Tanda tangan dan nama jelas pejabat yang berwenang (minimal Head of Division)\nLevel jabatan lihat PKP-PMPD-ODV-1 Kebijakan Manajemen Struktur Organisasi Bakmi GM\n6.3.Format Halaman Depan\n1)Diterapkan dan disetujui oleh: Nama   departemen   yang   terlibat   dalam\npenyusunan   prosedur   maupun   penerapannya   disertai   nama   jelas  Head   of\nDepartment terkait dan tanda tangannya.\n2)Tanggal Efektif      : Tanggal prosedur mulai diterapkan/diimplementasikan\n3)Daftar Isi                                  : Daftar isi dari dokumen\n6.4.Format Isi\n1)Tujuan: Maksud dibuatnya dokumen yang bersangkutan\n2)Ruang Lingkup: Area/wilayah penerapan dokumen yang bersangkutan diterapkan\n3)Definisi: Pengertian/istilah khusus yang perlu diketahui\n4)Referensi: Acuan/rujukan  yang  digunakan  untuk  terlaksananya  penerapan dokumen\n                                                                   yang bersangkutan\n5)Dokumen Penunjang: Dokumen lain yang berkaitan dengan prosedur\n6)Prosedur dan tanggung jawab: Rincian  tugas  yang  harus  dilaksanakan  dan  personil  terkait  yang\n                                                                   harus bertanggung jawab terhadap penerapan prosedur tersebut.\n7)Service Level Agreement (SLA): Persetujuan tingkat pelayanan antara pemberi jasa/produk (pemasok internal)\n                                                                   dengan penerima jasa/produk (pelanggan internal)\na)Output: Produk/ jasa yang diberikan\nb)Pelanggan: Pelanggan yang menerima produk/ jasa\nc)Ukuran: Ukuran dari produk/ jasa\nd)Target: Sasaran dari pemenuhan produk/ jasa\n8)Kondisi khusus/ Informasi khusus: Informasi mengenai keadaan-keadaan khusus yang berkaitan dengan\n                                                                   pelaksanaan prosedur yang bersangkutan dan catatan kualitas.\n9)Lampiran: Segala media yang diperlukan dalam prosedur, seperti bagan, dll.\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 5 / 9\nGambar 6.2.Halaman Isi Prosedur\nFRM-BPI-GDM-1.1.9 Ver.2.06.\n2\n6.\n41\n2\n3\n4\n5\n6\n7\n8\n9abcd\nFRM-BPI-GDM-1.1.12 Ver. 2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 6 / 9\n6.5.Format Bagan (Diagaram Alir)\nGambar 6.3.Halaman Diagram Alir\n1)Pelaku: Nama departemen/ bagian yang bertanggung jawab dalam pelaksanaan proses.\n2)Flow Chart: Bagan alir kegiatan sesuai dengan narasi pada SOP\n3)Format Layout\na)Ukuran Header:\nNamaLainnya\nFontArial NarrowArial Narrow\nSize129\nStyleBoldRegular\nTypeTitle caseSentence case\nb)Ukuran Tulisan:\nNamaLainnya\nFontArial NarrowArial Narrow\nSize99\nStyleBoldRegular\nTypeTitle caseSentence case\nFRM-BPI-GDM-1.1.9 Ver.2.06.\n2\n6.\n51\n2\nFRM-BPI-GDM-3.1.3 Ver.2.0FRM-BPI-GDM-1.1.12 Ver. 2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 7 / 9\n6.6.Format Simbol\nGambar SimbolKeteranganGambar SimbolKeterangan\nSimbol pelaku/PIC yang \nbertanggung jawab atas \nproses \nPada bagian atas baganiSimbol terminal \nsebagai awal dan akhir\nproses\niSimbol PIC dalam \nproses\nSimbol prosesSimbol keputusan:\ndigunakan untuk suatu \nseleksi kondisi di dalam \nproses\nSimbol dokumenSimbol kartu\niSimbol keterangan: \nmenunjukkan penjelasan \ndari proses/kegiatan\niSimbol nomor \nkegiatan dalam proses Simbol disk:\nmenunjukkan input/output \nmenggunakan harddisk\niSimbol kertas\niSimbol uangSimbol simpan sementara\niSimbol barang\niSimbol laporan \nlisanSimbol simpan tetap/ \npermanen\nSimbol hubungan \nkomunikasi:\nmenunjukkan saluran \nkomunikasiSimbol garis alir:\nmenunjukkan arus dari \nproses\nSimbol penghubung:\nmenunjukkan penghubung \nke halaman yang sama atau \nhalaman yang lainSimbol membuat/ \nmengisi/menghasilkan\nSimbol input dataSimbol keterangan \ntambahan:\nmenunjukkan penjelasan \ndari suatu proses\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 8 / 9\nTabel 6.2. Format Simbol\n6.7.Sistem Penomoran\n1)Bab dan Isi\nBabIsi\nPenomoran1. ; 2.; 3.; ...1) ; 2) ; 3) ; ... (jika berupa poin)\nFontArial NarrowArial Narrow\nSize1111\nStyleBoldRegular\nTypeUpper caseSentence case\nIndent0,00 cm\nSpacing to text0,62 cm (0,25")\n2)Sub Prosedur dan Isi Kegiatan\nTabel 6.3. Numbering Position Sub Prosedur dan Isi Kegiatan\nSub ProsedurKegiatanSub KegiatanSub-sub Kegiatan\nPenomoran6.1. ; 6.2. ; 6.3. ; ....1.1 ; 2. 1 ; 3.1 ; ....a) ; b) ; c) ; ....i) ; ii) ; iii) ; ....\nFontArial Narrow\nSize11\nStyleReguler\nTypeSentence case\nIndent0,00 cm0,00 cm0,55 cm (0,22")1,25 cm (0,50")\nIndent first line0,65 cm (-0,26")0,00 cm-0,53 cm (-0,21")-0,70 cm (-0,28")\nTabel 6.4. Numbering Position Keterangan\nKeteranganSub KeteranganSub-sub KeteranganSub-sub-sub Keterangan\nPenomoran1.1 ; 2. 1 ; 3.1 ; ....a) ; b) ; c) ; ....i) ; ii) ; iii) ; ....Bullet solid small circular\nFontArial Narrow\nSize11\nStyleReguler\nTypeSentence case\nIndent0,62 cm (0,25")1,25 cm (0,50")1,88 cm (0,75")2,50 cm (1,00")\nSpacing to text0,62 cm (0,25")0,62 cm (0,25")0,62 cm (0,25")0,62 cm (0,25")\n7.KONDISI KHUSUS/INFORMASI KHUSUS\nBahasa asing ditulis dengan huruf miring/Italic, kecuali bila berupa singkatan.\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Standart Operating ProcedureNo : MNL-BPI-GDM-1.1.8Ver.: 2.0\nTgl.: 14 Maret 2019Hal.: 9 / 9\n8.LAMPIRAN (DIAGRAM ALIR, DLL)\nCatatan Revisi Dokumen\nFRM-BPI-GDM-1.1.9 Ver.2.0'),
('1905140933553750985', 'STO_Finance_Planning_Analysis_Dept._2018', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'STO_Finance_Planning_Analysis_Dept._2018_-file_scan.pdf', 'application/pdf', '\n\n\n\n\n\n\n  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n'),
('1905150835572218319', '5a._MNL-BPI-GDM-1.1.5_Ver.2.0_Penulisan_Spesifikasi_Produk', 'application/msword', 1, 'doc', '5b._FRM-BPI-GDM-1.1.5_Ver.2.0_Format_Spesifikasi_Produk', 'application/msword', 0, 'doc', 'File_Not_Found', '-', 0, '-', 'Pengesahan_Dokumen_Penulisan_Spesifikasi_Produk.pdf', 'application/pdf', 'Manual: \nPenulisan Spesifikasi ProdukHal.: 1 / 5\nKerahasiaan: ConfidentialTgl.: 4 Apr-\'19Ver.: 2.0No.: MNL-BPI-GDM-1.1.5\nDibuat oleh:Ditinjau oleh:Disetujui oleh:\nPT. GRIYA MIESEJATIHarry Nugroho P.\nBPI SupervisorThomas Aditya\nBPI ManagerWidianto\nBOD\nDiterapkan dan Disetujui oleh:\nDepartemenDisetujuiTanda Tangan\nR&D/ QA/ QCYunita K.\nTanggal Efektif :                            \nDAFTAR ISI\n1.TUJUAN...............................................................................................................................................................................2\n2.RUANG LINGKUP................................................................................................................................................................2\n3.DEFINISI..............................................................................................................................................................................2\n4.REFERENSI.........................................................................................................................................................................2\n5.DOKUMEN PENUNJANG....................................................................................................................................................2\n6.PROSEDUR DAN TANGGUNG JAWAB..............................................................................................................................2\n7.KONDISI KHUSUS/INFORMASI KHUSUS..........................................................................................................................4\n8.LAMPIRAN...........................................................................................................................................................................4\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Spesifikasi ProdukNo : MNL-BPI-GDM-1.1.5Ver.: 2.0\nTgl.: 4 April 2019Hal.: 2 / 5\n1.TUJUAN\nMenjelaskan cara penulisan Spesifikasi Produk.\n2.RUANG LINGKUP\nWakil manajemen PT Griya MieSejati yang ditunjuk untuk menyusun Spesifikasi Produk.\n3.DEFINISI\nSpesifikasi Produk         : Dokumen yang berisi desktripsi produk, spesifikasi produk dan informasi pengemasan \nsesuai dengan persyaratan kualitas dan pekerjaan yang ditetapkan oleh perusahaan.\n4.REFERENSI\n1)PKP-BPI-GDM-1: Kebijakan Manajemen Dokumen\n2)PKP-PMPD-ODV-1: Kebijakan Manajemen Struktur Organisasi Bakmi GM\n3)SOP-BPI-GDM-1.1: Prosedur Penciptaan Dokumen\n4)STD-BPI-GDM-1.1: Standar Klasifikasi Dokumen\n5.DOKUMEN PENUNJANG\n-\n6.PROSEDUR DAN TANGGUNG JAWAB\n6.1. Format Layout\n1)Ukuran kertas: A4 (21 cm x 29,7 cm) / (8,3" x 11,7")\n2)Nama program: Microsoft Office Word \n3)Ukuran margin:\nLeft      : 2,0 cm (0,8")Right     : 1,5 cm (0,6")\nTop       : 1,5 cm (0,6")Bottom  : 1,2 cm (0,5")\nHeader : 1,5 cm (0,6")Footer   : 1,2 cm (0,6")\n4)Ukuran paragraph: Line spacing- fixed of  0,55 cm (0,22")\n5)Ukuran header:\nNamaLainnya\nFontArial NarrowArial Narrow\nSize1411\nStyleBoldRegular\nTypeTitle caseSentence case\n6)Ukuran tulisan:\nNamaLainnya\nFontArial NarrowArial Narrow\nSize1111\nStyleBoldRegular\nTypeTitle caseSentence case\nFRM-BPI-GDM-1.1.9 Ver.2.0\nManual: \nPenulisan Spesifikasi ProdukNo : MNL-BPI-GDM-1.1.5Ver.: 2.0\nTgl.: 4 April 2019Hal.: 3 / 5\n7)Ukuran footer:\nNomor FormulirFootnote\nFontArial NarrowArial Narrow\nSize1010\nStyleRegularRegular\nTypeUpper caseSentence case\n8)Pendistribusi: e-Document\n9)Pengarsipan: Dept. Business Process Improvement\n \nFRM-BPI-GDM-1.1.9 Ver.2.06.\n251\n32\n64\nba\n2\n6.\n3c\n3\n4\n5d1\na\nbabc\nManual: \nPenulisan Spesifikasi ProdukNo : MNL-BPI-GDM-1.1.5Ver.: 2.0\nTgl.: 4 April 2019Hal.: 4 / 5\nGambar 6.1. Format Header dan Format Isi\n6.2Format Header\n1)Nama  : Nama spesifikasi produk (dicetak tebal)\n2)Nomor  : Nomor dokumen (SPC-AAA-BBB-C)\nAAA: singkatan nama departemen pemilik proses\nBBB: singkatan nama proses\nC: nomor urut produk\n3)Ver.: Versi dokumen (pengkinian dokumen dengan perubahan isi dan pengkinian \ndokumen\n  tanpa perubahan isi)\n4)Tanggal: Tanggal dibuat prosedur\n5)Kerahasiaan: Kerahasiaan dokumen\na)Restricted: Data sangat sensitif dan strategis, distribusi terbatas hanya pada pihak internal\n  perusahaan yang berhak mengetahaui informasi dari dokumen/ pihak eksternal yang\n  sedang mengerjakan project strategic\nb)Confidential: Data yang sensitif yang ditujukan untuk seluruh Dept./ Store serta pihak eksternal\n  yang diijinkan untuk mengetahui informasi dari dokumen\nc)Non-Confidential: Data yang tidak sensitif dimana distribusi tidak dibatasi dan tersedia untuk umum\n6)Persetujuan\na)Dibuat oleh  : Tanda tangan dan nama jelas pembuat dokumen (minimal Team Leader)\nb)Ditinjau oleh  : Tanda tangan dan nama jelas peninjau ulang (minimal Head of Department)\nc)Disetujui oleh   : Tanda tangan dan nama jelas pejabat yang berwenang (minimal Head of Division)\n6.3Format Isi\n1)Deskripsi Produk\na)Nama Produk: Nama produk sesuai dengan penamaan pada sistem (QAD)\nb)Kode Produk: Kode produk sesuai dengan penamaan pada sistem (QAD)\nc)Komposisi: Bahan-bahan yang terkandung dalam produk\nd)Aplikasi: Kegunaan atau penerapan produk\n2)Spesifikasi Fisik: Persyaratan yang berkaitan dengan mutu fisik produk (penampakan dan sensori)\na)Parameter: Ukuran/ patokan yang digunakan untuk analisa\nb)Spesifikasi: Batasan dari parameter yang dianalisa\nc)Metode: Cara analisa yang digunakan dalam pengukuran parameter\n3)Spesifikasi Mikrobiologi:   Persyaratan   yang   berkaitan   dengan  jumlah\nmikrobia dalam produk\n4)Spesifikasi Kimia: Persyaratan yang berkaitan dengan indeks kimiawi produk\n5)Informasi Kemasan: Persyaratan yang berkaitan dengan kemasan \nprimer, kemasan sekunder dan tempat\n   penyimpanan\na)Kemasan Primer: Kemasan yang bersinggungan langsung dengan produknya\nb)Kemasan Sekunder: Kemasan yang digunakan untuk melindungi kemasan primer saat penyimpanan,\nFRM-BPI-GDM-1.1.9 Ver.2.0FRM-BPI-GDM-1.1.12 Ver. 2.0c\nManual: \nPenulisan Spesifikasi ProdukNo : MNL-BPI-GDM-1.1.5Ver.: 2.0\nTgl.: 4 April 2019Hal.: 5 / 5\n  distribusi, dll.\nc)Penyimpanan: Persyaratan yang berkaitan dengan kondisi penyimpanan produk\n7KONDISI KHUSUS/INFORMASI KHUSUS\nBahasa asing ditulis dengan huruf miring/Italic, kecuali bila berupa singkatan.\n8LAMPIRAN\nCatatan Revisi Dokumen\nFRM-BPI-GDM-1.1.9 Ver.2.0'),
('1905150844574113342', 'STD-BPI-GDM-1.1_Ver_2.0_Standar_Klasifikasi_Dokumen_-_Upload', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'Pengesahan_Standar_Klasifikasi_Dokumen.pdf', 'application/pdf', 'Ver.: 1.0Hal: 1 / 3\nViewDownload\nI\n1.1VisiVIS10 tahunAll Dept&StoreStaf-\n1.2MisiMIS10 tahunAll Dept&StoreStaf-\n1.3CPV10 tahun7 Nilai Budaya Bakmi GMAll Dept&StoreStaf-\n1.4KEP10 tahunAll Dept&StoreStaf-\n1.5VCM5 tahunAll Dept&StoreAst.Spv. -\n1.6KPPSesuai masa berlaku \ndokumen\nCSYCSY,BDV,FIN,OSVAst.Spv. -\n1.7SSSSesuai masa berlaku \ndokumen\nHalal, PatenAll Dept&StoreAst.Spv. -\n1.8BSC3 tahunCPGCPGCPGAll Dept&StoreAst.Spv. -\nII\n2.1PKP2 tahunPKP Manajemen Dokumen ;\nPKP Disiplin Waktu Kerja\nAll Dept.BPI ; \nIRL\nBPI ; \nIRL\nDept./Store Divisi \nterkait; IRL; BPI\nAst.Spv. -\n2.2STO1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; REC ; PMPD; \nHRIS; BPI\nStafManager\n2.3Job SummaryJBS1 tahunJBS IT Manager ;\nJBS PPIC & Warehouse \nAll Dept.BPIBPIDept./Store Divisi \nterkait; REC ; PMPD; \nHRIS; BPI\nmin. \nSesuai \njob level \nManager\n2.4\n2.4.aBSC1 tahunCPGCPGCPGDept./Store Divisi \nterkait\nAst.Mgr. -\n2.4.bBSC1 tahunCPGCPGCPGDept./Store Divisi \nterkait\nAst.Spv. -\n2.5Jika terdapat \nperubahan aturan \ndari MUI\n2.5.aMNL1 tahunManual Sistem Jaminan Halal \nBakmi GM\nQUABPIBPI\nCorporate Value\nBalanced Scorecard Divisi\nWidianto\nDirector\nDokumen kelengkapan ijin pendirian perusahaan. \nDokumen pernyataan yang menunjukkan perusahaan sudah memenuhi kualifikasi tertentu.  \nBalanced Scorecard\nNO.DEFINISINAMASINGKATANPeriode Review\n Disetujui oleh:\nNo: STD-BPI-GDM-1.1.1Kerahasiaan: Confidential\n Ditinjau oleh:\nTDP, SIUP, Akte, NPWP, Domisili\nSTO Operations ; STO Supply ; STO HR \nPengguna Dokumen\nDept.Min. Job Level\nContoh DokumenPencipta/\nPengkini\nPenyimpan \nDokumen Asli\nPendistribusi \nDokumen\nKode Etik Perusahaan\nTgl.: 12 April 2019\n Dibuat:\nHarry Nugroho P.\nBPI Supervisor\nThomas Aditya\nBPI Manager\nPernyataan mengenai nilai-nilai dalam perusahaan yang dapat memotivasi karyawan guna mencapai tujuan \nperusahaan.\nDokumen yang berisi penjelasan mengenai perusahaan secara umum, seperti: profil perusahaan, sistem \nmanajemen, visi, misi, serta nilai budaya perusahaan. \nPernyataan mengenai gambaran masa depan yang akan dipilih dan yang akan diwujudkan pada suatu saat \nyang ditentukan.\nPernyataan mengenai tindakan untuk mewujudkan atau merealisasikan apa yang menjadi visi dari \nperusahaan.\nStandar:\nKlasifikasi Dokumen\nKebijakan etis perusahaan berhubungan dengan kesulitan yang bisa timbul (mungkin pernah timbul dimasa \nlalu), seperti konflik kepentingan, hubungan dengan pesaing dan pemasok, menerima hadiah, sumbangan \ndan sebagainya.\nDokumen berisi pemetaan hubungan antara proses inti dengan proses pendukung dalam menjalankan \nsuatu bisnis.\nDokumen berisi konsep yang mengukur kinerja suatu perusahaan dari empat perspektif yaitu perspektif \nfinansial, perspektif customer, perspektif proses bisnis internal, perspektif pertumbuhan dan pembelajaran.\nDokumen sistem yang menjamin kepada MUI atas kehalalan produk suatu perusahaan sepanjang masa \nperusahaan itu memegang Sertifikat  Halal  MUI.  \nDokumen berisi konsep yang mengukur kinerja suatu divisi dari empat perspektif yaitu perspektif finansial, \nperspektif pelanggan, perspektif proses bisnis internal, perspektif pertumbuhan dan pembelajaran.\nPT. GRIYA MIESEJATI\nCOMPANY PROFILE\nValue Chain Map\nKelengkapan perijinan \nperusahaan\nSertifikat dan Standarisasi\nManual Sistem Jaminan Halal\nStruktur Organisasi\nBalanced Scorecard Unit Kerja\nPanduan Manual Mutu \nProduk\nBalanced Scorecard \nPerusahaan\nKEBIJAKAN & STRUKTUR \nORGANISASI\nPernyataan Kebijakan \nPerusahaan\nDokumen berisi konsep yang mengukur kinerja suatu unit kerja dari empat perspektif yaitu perspektif \nfinansial, perspektif pelanggan, perspektif proses bisnis internal, perspektif pertumbuhan dan pembelajaran.\nDokumen berisi kebijakan-kebijakan manajemen dalam mengendalikan mutu produk yang dihasilkan.\nDokumen yang terkait dengan kebijakan, struktur organisasi, job summary, balanced scorecard divisi \ndan unit kerja, dan panduan manual mutu produk.\nDokumen berisi batasan/ketentuan yang ditetapkan oleh perusahaan dan digunakan sebagai dasar dalam \nmelaksanakan prosedur terkait.\nDokumen berisi diagram susunan dan hubungan antara tiap bagian serta posisi yang ada pada suatu \norganisasi atau perusahaan dalam menjalankan kegiatan operasional untuk mencapai tujuan yang \ndiharapakan dan diinginkan.\nDokumen berisi penjelasan singkat, pernyataan umum tentang fungsi dan tanggung jawab pekerjaan yang \nlebih penting, biasanya juga mengidentifikasi petugas bawahan dan atasan langsung.\n\nVer.: 1.0\nHal: 2 / 3\nViewDownload\n2.5.b SBB1 tahunBoM Coffee MixR&DCST ;\nBPI \nBPIDept./Store Divisi \nterkait; SYS\n-\n2.5.cSPC1 tahunR&DBPIBPITidak di-upload-\nIII\n3.1Prosedur\n3.1.aBPM1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStaf-\n3.1.bOPC1 tahunR&DBPIBPIDept./Store Divisi \nterkait; BPI\nStaf-\n3.1.cSOP1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStaf-\n3.2\n3.2.aManualMNL1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStafManager\n3.2.bWIS1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStaf-\n3.3\n3.3.aSTD1 tahunAll Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStaf-\n3.3.bABDJika ada perubahanBPJBPJBPJBPJ; OPT; PMOStaf-\n3.3.cGTKJika ada perubahanSPESPESPESPE; OPT; PCHStaf-\n3.3.dMTRJika ada perubahanAll Dept.L&D ; \nAll Dept.\nL&D ; \nAll Dept.\nDept./Store Divisi \nterkait; SYS\nStaf-\n3.4FormulirFRM1 tahunPermintaan Pekerja (REC)All Dept.BPIBPIDept./Store Divisi \nterkait; BPI\nStafManager\nIVREKAMAN\n4.1COMSesuai jadwal \nretensi masing-\nmasing Dept.\nAll Dept.All Dept.All Dept.Dept./Divisi terkaitStaf-\nNo: STD-BPI-GDM-1.1.1\nDrawer Change Reconciliation (FIN)\nStandar Upah ;\nStandar Bakmi Rebus Frozen (QA)\nBPM Pengeluaran dan Pengisian Uang Kas \nKantor Pusat (FIN)\nOPC Bakmi Rebus Frozen (PRD)\nSOP Komplain Barang (WHS)\nMNL Kompor Rebus Autolifter (EST)\nWIS Pembersihan Kendaraan dengan Selang \nAir (OSV) ;\nWIS Pencucian Gelas (QC) ;\nWIS Penggunaan Food Chopper (EST)\nTgl.: 12 April 2019\nDokumen berisi gambar final dari bangunan gedung yang sudah selesai dilaksanakan.\nDokumen berisi gambar peralatan / aktiva.\nDokumen yang disusun berdasarkan suatu kurikulum pelatihan/pembelajaran agar menjadi suatu langkah-\nlangkah pembelajaran.\nTemplate dokumen dengan kolom standar yang harus diisi untuk merekam data/informasi.\nPedoman kegiatan kerja termasuk diantaranya prosedur, prosedur detil, dokumen penunjang prosedur, dan \nformulir.\nDokumen yang merupakan turunan dari bisnis proses, berisi urutan kegiatan dari suatu proses dan \npersetujuan tingkat pelayanan. Satu bisnis proses dapat terdiri dari satu atau lebih SOP.\nDokumen yang merupakan turunan dari OPC / SOP / MNL, berisi petunjuk detail spesifik yang dibutuhkan \nuntuk melakukan pekerjaan tertentu secara benar berdasarkan standar pengerjaannya, seperti: ukuran \nkuantitas, waktu proses, suhu. Ditujukan untuk satu pelaku tugas.\nWIS disajikan dalam bentuk urutan langkah pekerjaan, dilengkapi gambar, item dan standar mutu.\ndan alasan yang perlu diperhatikan sebagai bahan pengajaran bagi para trainer.\nDokumen berisi pedoman dalam pembuatan/pengisian dokumen maupun pengoperasian suatu \nmesin/peralatan dan sistem aplikasi.\nBagian dari kebijakan / prosedur berisi kesepakatan-kesepakatan yang telah didokumentasikan yang di \ndalamnya terdiri antara lain mengenai spesifikasi-spesifikasi teknis atau kriteria-kriteria yang akurat yang \ndigunakan sebagai peraturan, petunjuk, atau definisi-definisi tertentu untuk menjamin suatu barang, produk, \nproses, atau jasa sesuai dengan yang telah dinyatakan. \nDisajikan dalam bentuk tabel hubungan keterkaitan antara suatu fungsi dengan fungsi lain (Matriks), \ndalam bentuk tabel susunan (Daftar), atau visualisasi / foto.\nDokumen hasil kerja atau bukti pelaksanaan kegiatan.\nSuatu kumpulan pekerjaan yang saling terkait untuk menyelesaikan suatu tujuan tertentu. \nSuatu proses bisnis dapat dipecah menjadi beberapa subproses yang masing-masing memiliki atribut \nsendiri tapi juga berkontribusi untuk mencapai tujuan dari superprosesnya.\nPeta kerja yang menggambarkan urutan kerja dan material yang digunakan untuk mencapai standar kontrol \nsuatu produk seperti critical control point dan quality control point, dimana yang diatur antara lain: ukuran \nkuantitas, waktu proses, suhu.\nStandard Operating Procedure\nProsedur Detil\nWork Instruction\nStandar \nPROSEDUR & DOK. \nPENUNJANG\nNO.NAMA\nKlasifikasi Dokumen\nStandar:\nSINGKATANDEFINISIContoh DokumenPencipta/\nPengkini\nPenyimpan \nDokumen Asli\nPendistribusi \nDokumen\nPengguna Dokumen\nDept.Min. Job Level\nPeriode Review\nStandar Bahan dan BumbuDokumen berisi material yang dibutuhkan untuk memproduksi suatu produk. \nDisajikan dalam rangkaian struktur atau tabel susunan.\nProduk SpesifikasiDokumen yang mendefinisikan informasi / karakteristik utama mengenai suatu produk yang menjadi \nstandar. Karakteristik produk dapat mencakup, tetapi tidak terbatas sebagai berikut: estetika (penampilan \nfisik) produk, masa pakai, standar penyimpanan, dan lainnya.  \nProduk Spesifikasi Bakmi Rebus\nCommunicationSemua dokumen atau media yang  digunakan dalam mengirim dan menerima pesan / informasi / opini \nsecara lisan atau tulisan.\nMemo, Perjanjian kerja karyawan, BST, SPB, \nBS,  BPKK, Warta GM, Media marketing, \nDirector Speech\nBusiness Process Mapping\nOperation Process Chart\nDokumen Penunjang \nProsedur\nAs Built Drawing\nGambar Teknik\nModul Training\n\n4.2EducationEDUSesuai jadwal \nretensi masing-\nmasing Dept.\nAll Dept.All Dept.All Dept.Dept./Divisi terkaitStaf-\nVer.: 1.0\nHal: 3 / 3\nViewDownload\n4.3ReportRPTSesuai jadwal \nretensi masing-\nmasing Dept.\nAll Dept.All Dept.All Dept.Dept./Divisi terkaitStaf-Laporan finance, Laporan progress BSC, \nNotulen, Laporan penjualan, Laporan event\nPengguna Dokumen\nSemua dokumen keluaran kerja untuk referensi di masa mendatang.\nStandar:\nSINGKATANDEFINISIContoh DokumenPencipta/\nPengkini\nPenyimpan \nDokumen Asli\nPendistribusi \nDokumenNO.NAMA\nKlasifikasi Dokumen\nDept.Min. Job Level\nNo: STD-BPI-GDM-1.1.1\nTgl.: 12 April 2019\nDokumen yang berisi informasi / pengetahuan / pengalaman yang dapat dijadikan bahan pembelajaran.Knowledge Document Asset, Solusi \npenyelesaian kerusakan, Template Project & \nLesson Learned\n'),
('1905150925413017532', '9a._FRM-BPI-GDM-1.2.1_Ver.2.0_Daftar_Distribusi_Dokumen', 'application/msword', 1, 'doc', '9b._FRM-BPI-GDM-1.2.1_Ver.2.0_Daftar_Distribusi_Dokumen', 'application/vnd.ms-excel', 0, 'xls', 'File_Not_Found', '-', 0, '-', 'Pengesahan_Dokumen_Daftar_Distribusi_Dokumen.pdf', 'application/pdf', 'Formulir: \nDaftar Distribusi DokumenNo.: FRM-BPI-GDM-1.2.1\nDibuat oleh:Disetujui oleh:Ver.: 2.0Hal.: 1 / 1\nTgl.: 2 May 2019\nPT. GRIYA MIESEJATINidia\nBPI SupervisorThomas Aditya\nBPI ManagerKerahasiaan: Confidential\n \nFungsi : digunakan untuk mendata dokumen/ rekaman yang tersimpan pada suatu departemen dan berfungsi untuk\nmengetahui penanggung jawab penyimpan serta lokasi simpannya.\nPetunjuk Pengisian:\nNo.Baris/ KolomDiisi dengan\n1Nama ProsesNama / judul proses\n2Nama PICNama departemen pemilik proses\n3No.Nomo urut\n4No. DokumenNomor dokumen\n5Nama DokumenJudul dokumen yang didistribusikan\n6Ver.Versi dokumen\n7No. Urut Salinan PenerimaUrutan salinan dokumen yang didistribusikan kepada penerima.\n8Nama Dept./ StoreNama departemen/ store yang menerima dokumen terkontrol sesuai\nurutan nomor penerima.\n9Tgl. PendistribusianTanggal dokumen terkontrol diterima oleh penanggung jawab dokumen di\ndepartemen/ store.\n10Paraf dan Nama JelasParaf dan nama jelas dari penanggung jawab dokumen di departemen/\nstore saat menerima dokumen terkontrol.\n11Tgl. PenarikanTanggal dokumen terkontrol diambil dari/ dikembalikan oleh penanggung\njawab dokumen di departemen/ store.\n12Paraf dan Nama JelasParaf dan nama jelas dari penanggung jawab dokumen di departemen/\nstore saat dokumen terkontrol ditarik.\nFRM-BPI-GDM-1.1.12 Ver.2.0Keterangan:\n1.Ukuran: A4, Landscape\n2.Rangkap: 1 (satu)\n3.Cara Pengisian: ditulis tangan\n4.Pengarsipan: Dept./ Store pembuat'),
('1905150931138833724', '5a._FRM-BPI-GDM-1.1.13_Ver._2.0_Lembar_Distribusi_Persetujuan', 'application/msword', 1, 'doc', '5b._FRM-BPI-GDM-1.1.13_Ver._2.0_Lembar_Distribusi_Persetujuan', 'application/vnd.ms-excel', 0, 'xls', 'File_Not_Found', '-', 0, '-', 'Pengesahan_Dokumen_Lembar_Distribusi_Persetujuan.pdf', 'application/pdf', 'Formulir: \nLembar Distribusi PersetujuanNo.: FRM-BPI-GDM-1.1.13\nDibuat oleh:Disetujui oleh:Ver.: 2.0Hal.: 1 / 1\nTgl.: 23 April 2019\nPT. GRIYA MIESEJATINidia\nBPI SupervisorThomas Aditya\nBPI ManagerKerahasiaan: Confidential\n \nFungsi : digunakan sebagai petunjuk pendistribusian dokumen/ rekaman untuk proses persetujuan.\nPetunjuk Pengisian:\nNo.Baris/ KolomDiisi dengan\n1Nama Dokumen/ RekamanNama dokumen atau rekaman yang akan dimintakan persetujuan.\n2PembuatNama pembuat dokumen atau rekaman.\n3NamaNama - nama pihak yang terlibat dalam proses persetujuan dokumen/\nrekaman. Nama dicantumkan sesuai dengan urutan persetujuan.\n4Tgl. MasukTanggal masuk dokumen atau rekaman pada masing - masing urutan.\n5Tgl. KeluarTanggal keluar dokumen atau rekaman pada masing - masing urutan.\nFRM-BPI-GDM-1.1.12 Ver.2.0Keterangan:\n1.Ukuran: 1/3 A4, Portrait\n2.Rangkap: 1 (satu)\n3.Cara Pengisian: ditulis tangan\n4.Pengarsipan: Dept./ Store pembuat'),
('1905150936547996033', '10a._FRM-BPI-GDM-1.2.2_Ver.2.0_Tanda_Terima_Dokumen', 'application/msword', 1, 'doc', '10b._FRM-BPI-GDM-1.2.2_Ver.2.0_Tanda_Terima_Dokumen', 'application/msword', 0, 'doc', 'File_Not_Found', '-', 0, '-', 'Pengesahan_Dokumen_Tanda_Terima_Dokumen.pdf', 'application/pdf', 'Formulir: \nTanda Terima Dokumen/ RekamanNo.: FRM-BPI-GDM-1.2.2\nDibuat oleh:Disetujui oleh:Ver.: 2.0Hal.: 1 / 2\nTgl.: 2 May 2019\nPT. GRIYA MIESEJATINidia\nBPI SupervisorThomas Aditya\nBPI ManagerKerahasiaan: Confidential\n \nFungsi : digunakan sebagai bukti pengiriman/ distribusi maupun penerimaan dokumen dan rekaman kepada setiap store atau\npenerima yang tidak secara langsung menerima dokumen/ rekaman yang dikirimkan oleh pengirim.\nPetunjuk Pengisian:\nNo.Baris/ KolomDiisi dengan\n1Judul *)Tanda terima dokumen atau rekaman (coret yang tidak sesuai)\n2Diserahkan kepadaNama penerima yang dituju\n3Tgl.Tanggal pendistribusian dokumen atau rekaman.\n4StoreNama store\n5Dokumen/ Rekaman *)Dokumen atau rekaman (coret yang tidak sesuai).\n6(Blank)Nomor dan nama dokumen atau rekaman yang akan didistribusikan.\n7KeteranganIdentitas dokumen atau rekaman yang perlu diketahui (versi, tempat\npenyimpanan, dll).\nFRM-BPI-GDM-1.1.12 Ver.2.0Keterangan:\n1.Ukuran: sesuai dengan kebutuhan\n2.Rangkap: 2 (Dua)\n3.Cara Pengisian: ketik\n4.Pengarsipan: Staf Administrasi yang ditunjuk pada \nsetiap departemen/ store\nFormulir: \nTanda Terima Dokumen/ RekamanNo: FRM-BPI-GDM-1.2.2Ver.: 2.0\nTgl.: 2 May 2019Hal.: 2 / 2\nNo.Baris/ KolomDiisi dengan\n8PengirimTanda tangan, nama jelas dan jabatan pengirim dokumen atau rekaman.\n9PenerimaTanda tangan, nama jelas dan jabatan penerima dokumen atau rekaman.\nFRM-BPI-GDM-1.1.12 Ver.2.0'),
('1905151000507775134', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'File_Not_Found', '-', 0, '-', 'MNL-HRS-KMS-01_Persetujuan.pdf', 'application/pdf', 'Manual ini menginformasikan cara menggunakan aplikasi service desk untuk login sebagai requester (peminta jasa)');

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
('1905030958544149941', '1905030931092605889', '2019-05-03 09:58:54', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Tambah kata kunci '),
('1905031001537251645', '1905030931092605889', '2019-05-03 10:01:53', 'CYNTHIA FELLICIANNE', 'Ditolak ATASAN PENCIPTA', 'tambah abstrak'),
('1905031108372385679', '1905031105235395060', '2019-05-03 11:08:37', 'CYNTHIA FELLICIANNE', 'Ditolak ATASAN PENCIPTA', 'tambah kata kunci'),
('1905150835511854982', '1905140933553750985', '2019-05-15 08:35:51', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Mohon nomor STO diganti dengan format:\r\n\r\nSTO-AAA-BBB-C\r\n\r\nAAA	: Singkatan nama divisi pemilik struktur organisasi\r\nBBB	: Singkatan nama departemen pemilik struktur organisasi (BDT)\r\nC	: Nomot urut struktur organisasi\r\n\r\nUntuk nomor urut bisa didiskusikan dengan Pak Anthony apa mau yang duluan registrasi dapat nomor 1 atau akan ditentukan dulu nomor urut masing-masing dept'),
('1905151050412739878', '1905151000507775134', '2019-05-15 10:50:41', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Tanggal berlaku seharusnya 1 April 2018'),
('1905151118114486539', '1905151000507775134', '2019-05-15 11:18:11', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'Masa berlaku MNL adalah 1 tahun (12 bulan). Mohon untuk melakukan review dokumen dan updating dok tsb');

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
('38de64d47673de5df0c4c49438fb3724', '1905031055327394039', 210548, '2019-05-16 10:36:20'),
('d4383465cff995c78d71c76ceb7662e2', '1905030931092605889', 430257, '2019-05-04 11:13:01');

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
(150, '1905031055327394039', '171314', '7550'),
(155, '1905031055327394039', '204017', '7924'),
(164, '1905031055327394039', '210569', '7527'),
(173, '1905031055327394039', '150443', '7550'),
(176, '1905031055327394039', '151009', '7550'),
(180, '1905031055327394039', '170236', '7527'),
(186, '1905031055327394039', '190164', '7924'),
(189, '1905031055327394039', '206329', '7924'),
(203, '1905031055327394039', '212383', '7550'),
(249, '1905031055327394039', '171318', '7527'),
(277, '1905031055327394039', '209686', '7550'),
(293, '1905031105235395060', '171314', '7550'),
(298, '1905031105235395060', '204017', '7924'),
(316, '1905031105235395060', '150443', '7550'),
(319, '1905031105235395060', '151009', '7550'),
(323, '1905031105235395060', '170236', '7527'),
(329, '1905031105235395060', '190164', '7924'),
(332, '1905031105235395060', '206329', '7924'),
(346, '1905031105235395060', '212383', '7550'),
(392, '1905031105235395060', '171318', '7527'),
(420, '1905031105235395060', '209686', '7550'),
(579, '1905030931092605889', '171314', '7550'),
(584, '1905030931092605889', '204017', '7924'),
(602, '1905030931092605889', '150443', '7550'),
(605, '1905030931092605889', '151009', '7550'),
(609, '1905030931092605889', '170236', '7527'),
(615, '1905030931092605889', '190164', '7924'),
(618, '1905030931092605889', '206329', '7924'),
(632, '1905030931092605889', '212383', '7550'),
(678, '1905030931092605889', '171318', '7527'),
(706, '1905030931092605889', '209686', '7550'),
(714, '1905030931092605889', '151010', '5901'),
(715, '1905030931092605889', '200054', '5901');

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
(2, '1905031055327394039', '', '7550', '7527', '7527|7550|7924'),
(3, '1905031105235395060', '', '7527', '7527', '7527|7550|7924'),
(6, '1905131811184220576', '', '7550', '7550', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6473|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(7, '1905140933553750985', '', '7550', '7013', '6540|6551|6563|6837|7013|7550|7761|7762|7924'),
(8, '1905150835572218319', '', '7550', '7550', '7176|7550|7555|7924'),
(9, '1905150844574113342', '', '7550', '7550', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(10, '1905150925413017532', '', '7550', '7550', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(11, '1905150931138833724', '', '7550', '7550', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(12, '1905150936547996033', '', '7550', '7550', '1844|5882|5893|5898|5904|5922|5926|5942|6467|6494|6526|6534|6540|6551|6559|6563|6573|6588|6678|6684|6685|6837|7013|7016|7080|7081|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7488|7494|7527|7550|7555|7562|7564|7591|7596|7603|7761|7762|7769|7924'),
(13, '1905151000507775134', '', '7550', '7527', '5882|5893|5898|5904|5922|5926|5942|6467|6526|6534|6540|6551|6563|6573|6588|6678|6684|6837|7013|7016|7080|7083|7091|7150|7151|7152|7153|7175|7176|7239|7371|7407|7527|7550|7555|7562|7564|7591|7596|7603|7769|7924');

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
('DTSETE0021', 'DTSEJS0016', 'DTSEKI0003', 'STANDARD OPERATING PROCEDURE', 'SOP', 'CONF', 'STAF', 'STAF', 'STAF|SCH|JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
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
('a9dd65a31e1803e6865a88752abfa2b5', 'DTSETE0021', '7550'),
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
('1905030931092605889', 'UAT SOP', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', '', '', 'SOP201905/007', 'SOP UAT 03 05 2019 Test 1 PDF, WORD, VISIO', 'HCD', 'EDOC', 'CONF', '170236'),
('1905131811184220576', 'Manual', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-BPI-GDM-1.1.8', 'Penulisan Standart Operating Procedure', 'HCD', 'EDOC', 'CONF', '171314'),
('1905140933553750985', 'STO dept FPA', 'DTSEKI0002', 'DTSEJS0011', 'DTSETE0011', '', '', 'STO201810/002', 'Struktur organisasi dept Financial Planning & Analysis', 'HCD', 'EDOC', 'CONF', '180887'),
('1905150844574113342', 'Standar', 'DTSEKI0003', 'DTSEJS0018', 'DTSETE0025', 'GROUP PROSES', 'PROSES', 'STD-BPI-GDM-1.1.1', 'Klasifikasi Dokumen', 'HCD', 'EDOC', 'CONF', '171314'),
('1905150925413017532', 'Formulir', 'DTSEKI0003', 'DTSEJS0019', 'DTSETE0029', 'GROUP PROSES', 'PROSES', 'FRM-BPI-GDM-1.2.1', 'Daftar Distribusi Dokumen', 'HCD', 'EDOC', 'CONF', '171314');

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
('1905031119538995768', '1905030931092605889', '2019-05-03 11:19:53', 'PERUBAHAN META DATA DOKUMEN', 'Test Perubahan isi Dokumen'),
('1905031128095966386', '1905030931092605889', '2019-05-03 11:28:09', 'PERUBAHAN META DATA DOKUMEN', 'Test 2 ');

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
('092022', '092022', 'WINA ANESSIA LEOLITA J.', 'wina.anessia@gmail.com', '', 'Cash Management Supervisor', 'SNSPV', '6551', 'Finance Department', 'FAST', '2019-05-18 06:00:05'),
('097003', '097003', 'RATIH PUTRI HAPSARI', 'ratihputrihapsari@gmail.com', '', 'Cooperatives Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('097097', '097097', 'FRANSISKA K PRABAWA', 'fransiska@bakmigm.co.id', '', 'Ass. Account Payable & Expenses Manager', 'SNMGR', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('099305', '099305', 'KARTIKA ATMADJA', 'albertakartika@gmail.com', '', 'Assistant Costing Manager', 'JNMGR', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('120077', '120077', 'WILLY WIDJAJA', 'wil.widjaja@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('120422', '120422', 'WAHYU KURNIAWAN', 'wahyu.pringgo@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('130057', '130057', 'MELISA ROSALINA', 'melisa.rosalina72@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('130137', '130137', 'TUA MARTHIN HARRY SIAGIAN', 'crozsball@gmail.com', '', 'IT PMO Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('130175', '130175', 'BUN JUN KIONG', 'jk.anakgembala@gmail.com', '', 'Personnel Administration Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('130546', 'Ita', 'ITA APRILIANI', 'it4.apriliani@gmail.com', '', 'People Development Administration Staff', 'STAF', '7239', 'Performance Management & People Development', 'HRS', '2019-05-18 06:00:05'),
('130675', '130675', 'SUHENDRA TAMBUNAN', 'suhendratambz@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('130677', '130677', 'SAFITRI DEVI HARTATI', 'safitri.devi@gmail.com', '', 'QAD Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('130782', '130782', 'JEFFRY FERNANDO', 'fernandojfree@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('140118', 'Desni', 'DESNI PENESIA PURBA', 'desnipp@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('140124', 'Agnes', 'AGNES', 'onlyagneslie@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('140349', '140349', 'EDWIN KURNIAWAN', 'edwin.k1991@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('140491', 'hendri', 'HENDRI WIJAYA', 'henz.wijaya@gmail.com', '', 'IT Manager', 'SNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('140688', '140688', 'MELLA APRIYANI', 'melaapril@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('140969', '140969', 'YAN KHARISMA', 'yan.kharisma@gmail.com', '', 'Learning Analytic Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('140978', 'Kara', 'DEDI SETIAWAN BAKARA', 'Dedisetiawanbakara@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('141071', '141071', 'CITRAWATI HENDRAWIDJAJA', 'citra.h@bakmigm.co.id', '', 'Corporate Planning Manager', 'SNMGR', '7488', 'Corporate Planning Department', 'DIR.002', '2019-05-18 06:00:05'),
('150032', '150032', 'DIMAS ANDI SAPUTRA', 'dimas.andi.saputra@gmail.com', '', 'Store Application Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('150063', '150063', 'R FAJAR EGIT INDRASWARA', 'eghiet@gmail.com', '', 'IT Service Desk', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('150243', '150243', 'RANI DAME SIMANJORANG', 'ranidamesimanjorang@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('150343', '150343', 'EVELINE MELANIE', 'evelinemelanie@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-18 06:00:05'),
('150380', '150380', 'DIAH AYU NOVITASARI', 'diah.ayu.novitasari@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('150381', '150381', 'MEME MERY', 'meme.mery@bakmigm.co.id', '', 'Account Receivable Manager', 'SNMGR', '6551', 'Finance Department', 'FAST', '2019-05-18 06:00:05'),
('150443', '150443', 'SABASTIAN CAHYA DERMAWAN', 'bastiancahya.bakmigm77@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'DIR.004', '2019-05-18 06:00:05'),
('150447', '150447', 'JUNIATI MAYASARI SIDABUTAR', 'juniati.mayasari@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('150521', 'daniel', 'DANIEL IBNU SIDHARTA', 'daniel.sidharta@bakmigm.co.id', '', 'Compensation & Benefit Assistant Manager', 'JNMGR', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('150665', '150665', 'DEBORA NOPRIANA SIPAHUTAR', 'debdeb.nopriana@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-05-18 06:00:05'),
('150734', '150734', 'HOTSAIDA SITUMORANG', 'idatania.situmorang@gmail.com ', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('150974', '150974', 'NINA SUDIANA', 'nina.sudiana09@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('150992', '150992', 'FEBBY ANDI PUTRA', 'FebbyandiPutra@gmail.com', '', 'Data Costing Process Specialist', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('150994', '150994', 'ANDDREAS MARSHEILO IRAWAN', 'anddreas.marsheilo@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('151004', '151004', 'ANEIS TIRTA PERTIWI', 'aneistirtapertiwi@gmail.com', '', 'IT Admin Staf', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('151009', '151009', 'HARRY NUGROHO POERNOMO', 'harry.hhyou@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'DIR.004', '2019-05-18 06:00:05'),
('151010', '151010', 'RIDWANTO SALIM', 'vergoares@gmail.com', '', 'HR Analyst', 'SNSPV', '5901', 'Human Resource Division', 'DIR.002', '2019-05-18 06:00:05'),
('151023', '151023', 'STELLA MARIA PAYUNG', 'stella5992@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('160001', 'kristanti', 'KRISTANTI RETNO H.', 'ichacrista.89@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('160057', 'doropat', 'DOROPAT SITUMORANG', 'doropatstumorang@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('160323', '160323', 'ALFONSIUS F. H MATONDANG', 'alfonferry@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('160997', '160997', 'NUGROHO VALENTINO', 'nugroho.valentino@bakmigm.co.id', '', 'Assistant Accounting Manager', 'JNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('161064', 'laela', 'LAELA ROBINGATUN', 'llaella007@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('161067', 'putri', 'PUTRI RAHAYU', 'putrirasgt10@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('161158', '161158', 'EDUARDO KUKILA AJI', 'edokukila@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('161225', 'deky', 'DEKY SABARTONO', 'deky.sabartono22@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('161229', '161229', 'PATAR ERIKSON PAKPAHAN', 'erickson.patar@gmail.com', '', 'Inventory Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('161371', '161371', 'SAMUEL', 'samuelkudo22@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('170007', '170007', 'NOVEL EM ALAM', 'novel@bakmigm.co.id', '', 'Industrial Relation Assistant Manager', 'JNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('170012', '170012', 'CHATARINA YUNI KARTIKA', 'chatarinayk94@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('170035', 'robiatul', 'ROBIATUL ADAWIYAH', 'weykoyuki@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('170232', 'vinoria', 'VINORIA ANDRIYANI', 'vinoria.andriyani@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('170236', '170236', 'JOHAN MOHAMMAD', 'johan.mohammad@gmail.com', '', 'Knowledge Management Supervisor', 'SNSPV', '7527', 'Human Resources Support', 'HRS', '2019-05-18 06:00:05'),
('170302', '170302', 'AGUS SAIFUDIN', 'agussaifudin2908@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('170389', '170389', 'DANIEL JULY FRIDAYANA', 'danieljuly26@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('170406', '170406', 'TEDDY SUTANTO', 'teddy.sutanto@bakmigm.co.id', '', 'Assistant HKM Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('170545', '170545', 'ADITYA RIAWAN KARNADI', 'aditya.riawan@bakmigm.co.id', '', 'Corporate Planning Ass. Manager', 'SNMGR', '7488', 'Corporate Planning Department', 'DIR.002', '2019-05-18 06:00:05'),
('170668', '170668', 'NOVITA HENDRIANA', 'novitahendriana68@gmail.com', '', 'Training Administration Staff', 'STAF', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('170904', '170904', 'DATIM', 'mzdatim72gm@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('170963', '170963', 'AKHMAD SUDRAJAT', 'akhmadsudrajat.96@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('171168', '171168', 'SITI SAYIDATURROHMAH', 'ayisanjaya4@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('171173', '171173', 'MARIA ANJELINA KAE', 'Jellynangellyna30@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('171251', 'hkiting', 'HANGGULAN KITING', 'hanggulan.kiting@bakmigm.co.id', '', 'Industrial Relation Manager', 'SNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('171252', '171252', 'ASAEL FETRARI PALAMBA', 'asaelpalamba@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('171255', '171255', 'RIVALDY RYAN JOHANNES SANI', 'ryansani25@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('171270', '171270', 'ANTHONY PAMUNGKAS', 'anthony@bakmigm.co.id', '', 'Finance & Acct. IT, Sys. Dev. General Manager', 'GMMGR', '6538', 'Finance, Acct, Costing, Budget, IT Division', 'DIR.002', '2019-05-18 06:00:05'),
('171314', '171314', 'THOMAS ADITYA PANDU WIRAWAN', 'thomas.wirawan@gmail.com', '', 'Business Process Improvement Manager', 'SNMGR', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'DIR.004', '2019-05-18 06:00:05'),
('171318', '171318', 'TRI MUHARYANTI', 'trryanty@gmail.com', '', 'Employee Relation Specialist', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-05-18 06:00:05'),
('171349', '171349', 'CLAUDIA CINDRY DOROTEA', 'claudorotea@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('171369', '171369', 'FIRSTIAN ANDREA PUTRI', 'firstian.andre22@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('171404', '171404', 'ADINDA NIDYA LESTARI SLAWAT', 'dindanidyajob@gmail.com', '', 'Knowledge Management Staff', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-05-18 06:00:05'),
('180003', '180003', 'NANDA IQBAL IBRAHIM', 'nandaiqbal@gmail.com', '', 'Planning & Forecast Supervisor', 'SNSPV', '7013', 'Plan & Budget Department', 'FAST', '2019-05-18 06:00:05'),
('180079', '180079', 'KEVIN JONATHAN', 'mrkevinjonathan@gmail.com', '', 'People Development Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-05-18 06:00:05'),
('180095', '180095', 'IRLAN FAJRIAN', 'irlanfajrian@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('180121', '180121', 'SRI PUTRIYANA BR GINTING', 'putriyana605@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-05-18 06:00:05'),
('180158', '180158', 'MARIA ASSUMPTA DYAH PUTRI UTAMI', 'mariaassumpta93@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180161', '180161', 'DIMAS PUTRA SADEWO', 'dimas51dewo@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180210', '180210', 'MUHAMMAD DANARDI ARIJONA', 'danarstei12@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180270', '180270', 'RIZKI AKBAR FAZRIANTO', 'rizkiakbarfazrianto@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180340', '180340', 'ANDRI', 'andridjun1997@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('180418', '180418', 'AZMI BIMA PRAYUDHA', 'azmibima16@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-18 06:00:05'),
('180580', '180580', 'DILO YANSIMAN MANIK', 'dilomanik01@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180586', '180586', 'RIA AGUSTINA', 'riaagsstna@gmail.com', '', 'Learning Design Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('180617', '180617', 'AJENG PUSPITASARI', 'ajengpuspita398@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('180756', '180756', 'SYARIFAH MUDARSIH', 'syarifahmu23@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('180764', '180764', 'ANDREAS WILSON H. SIMANGUNSONG', 'wilsonmangunsong@gmail.com', '', 'Developer PHP', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('180853', '180853', 'ADAM SAPUTRA', 'adamsaputra1807@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('180887', '180887', 'LYWIANA', 'lywiana@bakmigm.co.id', '', 'Finance Planning & Analysis Manager', 'SNMGR', '7013', 'Plan & Budget Department', 'FAST', '2019-05-18 06:00:05'),
('180992', '180992', 'BATARA KUMARA', 'batarakumara27@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('181111', '181111', 'NORMANDI LIMAN', 'normandi1991@gmail.com', '', 'HRIS Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('181183', '181183', 'KHARISMA ANNISA K', 'kharisma19ak@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('181289', '181289', 'AHMAD ISMURROCHMAN', 'ahmad.ismu@gmail.com', '', 'Learning & Development Senior Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('181370', '181370', 'ANDINI SHAFA HUSNIYAH', 'andinishafa88@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('181413', '181413', 'TAUFIK HIDAYAT', 'taufikhide22@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('190047', '190047', 'JONATHAN SILITONGA', 'joeseries24@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('190107', '190107', 'ALAMSYAH HERMAWAN', 'alamsyahhermawan@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('190164', '190164', 'ESTHER CLAUDYA SITUMORANG', 'estherclaudyasit@gmail.com', '', 'Auditor', 'SNSPV', '7924', 'Management Audit Department', 'DIR.001', '2019-05-18 06:00:05'),
('190315', '190315', 'DZIKRI FITRANUDDIN', 'd.fitranuddin@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('190317', '190317', 'ABED NEGO HERBOWO', 'abednegoherbowo@gmail.com', '', 'Performance Management & People Development Manager', 'SNMGR', '7239', 'Performance Management & People Development', 'HRS', '2019-05-18 06:00:05'),
('190372', '190372', 'DYLAN WINALDA', 'dylanwinalda@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('190379', '190379', 'GIOVANNY SIREGAR', 'gioregar87.gio@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('190441', '190441', 'RICKY NOVIYANDI', 'rickynoviyandi08@gmail.com', '', 'Ass.Finance and Performance Analysis Manager', 'SNMGR', '7013', 'Plan & Budget Department', 'FAST', '2019-05-18 06:00:05'),
('190442', '190442', 'ALBER FADHLY YUVA', 'alberfadhly@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('190488', '190488', 'ZULFIKAR DJAFFAR SHODIQ', '', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('190489', '190489', 'GRACE SHINSHIA N. SIANTURI', 'graceshinshia14@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('200044', 'catur', 'CATUR SUSIANI', 'caturmudisusiani@gmail.com', '', 'Personnel Administration Section Head', 'SCH', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('200054', 'cynthia', 'CYNTHIA FELLICIANNE', 'cynthia-f@bakmigm.co.id', '', 'Human Resource Division General Manager', 'GMMGR', '5901', 'Human Resource Division', 'DIR.002', '2019-05-18 06:00:05'),
('204017', '204017', 'KWOK SIOE LIAN', 'siulian@bakmigm.co.id', '', 'Audit Analysis Manager', 'SNMGR', '7924', 'Management Audit Department', 'DIR.001', '2019-05-18 06:00:05'),
('206003', 'lionita', 'LIONITA YOHANES', 'Lioni.jo@gmail.com', '', 'Payroll Administration Supervisor', 'SNSPV', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('206005', '206005', 'ROLAND MATONDANG', 'rolandmatondang@gmail.com', '', 'Operation & Support Assistant Supervisor', 'JNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('206329', '206329', 'ANICETA MADA O AMANTI', 'oktriesa@gmail.com', '', 'Auditor', 'SNSPV', '7924', 'Management Audit Department', 'DIR.001', '2019-05-18 06:00:05'),
('206366', 'nia', 'KURNIATI', 'nheeah@gmail.com', '', 'Learning & Development Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('207316', 'rico', 'RICO WIRYANTO', 'rico.wiryanto@bakmigm.co.id', '', 'Accounting & Tax Manager', 'SNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('208136', '208136', 'ARIE YANSARI', 'ay080112@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('208152', '208152', 'DEVINA GLORYA ESTHER', 'devinaglorya24@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('208171', '208171', 'ZAINAL ARIFIN', 'zainal230584@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('208205', 'linday', 'LINDA YUSNIAWATI', 'fanemanda1006@gmail.com', '', 'Industrial Relation Admin Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('208519', '208519', 'VINA ELVIRA SAVITRI', 'vinasiagian22@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('209067', 'retno', 'RETNO TRISNANINGSIH', 'retnotrisnaningsih@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('209397', 'nuryati', 'NURYATI', 'aina23691@gmail.com', '', 'Field Recruiter', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('209420', '209420', 'KUNDRAT BASRI', 'kundrat01@gmail.com', '', 'Cooperatives Specialist', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('209561', '209561', 'SRI WIDODO', 'sriwidodo878@gmail.com', '', 'Operation Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('209686', '209686', 'IRA KURNIAWATI', 'ira.kurniawati.bgm@gmail.com', '', 'BPI Admin', 'STAF', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'DIR.004', '2019-05-18 06:00:05'),
('210120', '210120', 'RACHMAH YURIS TRIANA', 'rachmah.yuris@gmail.com', '', 'Regional 1 Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('210326', 'erlina', 'ERLINA', 'erlina.sihaloho79@gmail.com', '', 'Performance Management Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-05-18 06:00:05'),
('210546', '210546', 'INDRA', 'indra250285@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('210569', 'aditya', 'ADITYA W', 'aditya@bakmigm.co.id', '', 'HR Support Assistant Manager', 'JNMGR', '7527', 'Human Resources Support', 'HRS', '2019-05-18 06:00:05'),
('210638', 'fitri', 'FITRIA HANDAYANI VALENTINA', 'fitriahazim@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('211104', '211104', 'HANI AGUSTIANI', 'hanyagustiani5@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('211108', '211108', 'IGNATIUS SURONO ARIE W', 'arisurono@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-05-18 06:00:05'),
('211171', 'eka', 'EKA WAHYU HARYANINGSIH', 'eka.wahyu58@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('211362', 'mardianah', 'MARDIANAH', 'mardianahdian03@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('211363', '211363', 'CAECILIA NOVIANTARI', 'caecilia.noviantari@gmail.com', '', 'Account Payable Supervisor', 'SNSPV', '7762', 'Finance Account Payable & Expenses', 'FAST', '2019-05-18 06:00:05'),
('211374', 'maudy', 'MAUDY FITRIANI IRANDA', 'irandamaudy@gmail.com', '', 'Recruitment Assistant Manager', 'JNMGR', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('211577', 'rita', 'RITA RAESITA', 'rita.raesita@bakmigm.co.id', '', 'Recruitment Manager', 'SNMGR', '5942', 'Recruitment Department', 'HRS', '2019-05-18 06:00:05'),
('211752', '211752', 'SUGIYANTO', 'sugiyanto1312@gmail.com', '', 'Cooperatives Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-05-18 06:00:05'),
('211939', 'andi', 'ANDI', 'andi.k.allwin@gmail.com', '', 'Technology & Development Assistant Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('212126', '212126', 'AGUSTINUS TRIJARWANTO', 'agustnustrij@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', 'FAST', '2019-05-18 06:00:05'),
('212139', '212139', 'R. WIJATMOKO', 'rwijatmoko82@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', 'FAST', '2019-05-18 06:00:05'),
('212244', '212244', 'RIKY', 'rikyriq@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-05-18 06:00:05'),
('212335', '212335', 'VERRY SUNARYA', 'fx.verry@gmail.com', '', 'Infrastruktur & Network Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05'),
('212383', '212383', 'NIDIA', 'nidia.lie@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', 'DIR.004', '2019-05-18 06:00:05'),
('212798', '212798', 'VONNY MELINDA', 'vonnymelinda1987@gmail.com', '', 'General Accounting Supervisor', 'SNSPV', '6540', 'Accounting & Tax Department', 'FAST', '2019-05-18 06:00:05'),
('918075', '918075', 'AZIZ AL ISRA', '', '', 'IT Part - Timer', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-05-18 06:00:05');

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
(5, 'News', 'news', 'fa-newspaper-o', 0, 0),
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
(1, '1905031055327394039', '210569', '2019-05-07 15:18:47'),
(2, '1905031105235395060', '210569', '2019-05-07 15:18:49'),
(4, '1905131811184220576', '210569', '2019-05-15 08:48:19'),
(5, '1905150844574113342', '170406', '2019-05-15 10:38:11'),
(7, '1905031105235395060', '171314', '2019-05-17 14:26:03'),
(8, '1905031055327394039', '171314', '2019-05-17 14:26:06');

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
('PENCIPTA', 'Pencipta dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"1";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"1";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"1";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"1";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"1";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"1";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"1";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}'),
('PENDISTRIBUSI', 'Distribusi dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 2, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"0";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"1";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"1";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"0";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"0";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}'),
('PENGGUNA', 'Pengguna dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4, 'a:23:{i:0;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"1";s:5:"value";s:1:"1";}}i:1;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"2";s:5:"value";s:1:"1";}}i:2;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"4";s:5:"value";s:1:"1";}}i:3;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"5";s:5:"value";s:1:"1";}}i:4;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"6";s:5:"value";s:1:"0";}}i:5;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"7";s:5:"value";s:1:"0";}}i:6;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"8";s:5:"value";s:1:"0";}}i:7;a:1:{s:4:"menu";a:2:{s:3:"key";s:1:"9";s:5:"value";s:1:"1";}}i:8;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"12";s:5:"value";s:1:"0";}}i:9;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"13";s:5:"value";s:1:"0";}}i:10;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"14";s:5:"value";s:1:"0";}}i:11;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"15";s:5:"value";s:1:"0";}}i:12;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"16";s:5:"value";s:1:"0";}}i:13;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"17";s:5:"value";s:1:"0";}}i:14;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"18";s:5:"value";s:1:"0";}}i:15;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"19";s:5:"value";s:1:"0";}}i:16;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"20";s:5:"value";s:1:"0";}}i:17;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"21";s:5:"value";s:1:"0";}}i:18;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"22";s:5:"value";s:1:"0";}}i:19;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"23";s:5:"value";s:1:"0";}}i:20;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"24";s:5:"value";s:1:"1";}}i:21;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"25";s:5:"value";s:1:"0";}}i:22;a:1:{s:4:"menu";a:2:{s:3:"key";s:2:"26";s:5:"value";s:1:"0";}}}');

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
  MODIFY `LogID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
  MODIFY `NEWS_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;
--
-- AUTO_INCREMENT for table `tb_document_notification`
--
ALTER TABLE `tb_document_notification`
  MODIFY `NOTIF_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tb_menus`
--
ALTER TABLE `tb_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tb_notification_history`
--
ALTER TABLE `tb_notification_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
