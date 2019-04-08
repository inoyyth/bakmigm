-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2019 at 12:48 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

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
(1, 'logo1.png', '<p><strong>Welcome Speech by Director</strong></p>');

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
(6, '1903050922414427383', 'Lihat', '210569', NULL, '2019-03-05 00:42:30');

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
(4, 'DOCNO', 'Nomor Dokumen', 'Table', 'Year', 'Month', 'Delimeter', 'Free Text', 'form', 'MNL-HRS-KMS-02'),
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
(1, 'test', 'Nama', 'NIP', 'Tanggal/Bulan/Tahun');

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
('1844', 'GMABMG', 'Building Management GEMA', '1843', '2019-03-07 06:00:02'),
('5882', 'MKT', 'Marketing', '5880', '2019-03-07 06:00:02'),
('5893', 'BPJ', 'Building Project', '5880', '2019-03-07 06:00:02'),
('5898', 'BDV', 'Business Development', '5880', '2019-03-07 06:00:02'),
('5904', 'IRL', 'Industrial Relation, Cooperatives & Personnel Admin ', '5901', '2019-03-07 06:00:02'),
('5922', 'CnB', 'COMPENSATION & BENEFIT DEPARTMENT', '5901', '2019-03-07 06:00:02'),
('5926', 'LnD', 'LEARNING & DEVELOPMENT DEPARTMENT', '5901', '2019-03-07 06:00:02'),
('5942', 'REC', 'Recruitment Department', '5901', '2019-03-07 06:00:02'),
('6467', 'PPIC', 'PPIC', '6465', '2019-03-07 06:00:02'),
('6473', 'WHS', 'Warehouse', '6465', '2019-03-07 06:00:02'),
('6494', 'PLANT', 'Plant Department', '7840', '2019-03-07 06:00:02'),
('6526', 'PRCH', 'Purchasing', '6465', '2019-03-07 06:00:02'),
('6534', 'AMG', 'Asset Management Department', '6571', '2019-03-07 06:00:02'),
('6540', 'ACC', 'Accounting & Tax Department', '6538', '2019-03-07 06:00:02'),
('6551', 'FIN', 'Finance Department', '6538', '2019-03-07 06:00:02'),
('6559', 'SYS', 'System Development', '5877', '2019-03-07 06:00:02'),
('6563', 'ITY', 'Information Technology Department', '6538', '2019-03-07 06:00:02'),
('6573', 'OSV', 'Office Service Department', '6571', '2019-03-07 06:00:02'),
('6588', 'EKP', 'Engineering KP Department', '6571', '2019-03-07 06:00:02'),
('6678', 'PPM', 'Property Management Department', '6571', '2019-03-07 06:00:02'),
('6684', 'GMSOPS100H', 'Operation HO Office', '5977', '2019-03-07 06:00:02'),
('6685', 'LOG', 'Logistic', '6465', '2019-03-07 06:00:02'),
('6837', 'CST', 'Costing Department', '6538', '2019-03-07 06:00:02'),
('7013', 'BDT', 'Plan & Budget Department', '6538', '2019-03-07 06:00:02'),
('7016', 'CHS.FT1', 'Food Truck', '5977', '2019-03-07 06:00:02'),
('7080', 'CPP.ES', 'CPP ENGINEERING', '7818', '2019-03-07 06:00:02'),
('7081', 'CPP.QAQC', 'CPP QA-QC', '7176', '2019-03-07 06:00:02'),
('7083', 'CPP.PPIC', 'CPP PPIC & WAREHOUSE', '7818', '2019-03-07 06:00:02'),
('7091', 'CSY', 'Corporate Secretary', '7841', '2019-03-07 06:00:02'),
('7150', 'SPE', 'Store Process Engineering', '6571', '2019-03-07 06:00:02'),
('7151', 'EST', 'Engineering Store Department', '6571', '2019-03-07 06:00:02'),
('7152', 'CHS', 'CHANNEL SALES', '5977', '2019-03-07 06:00:02'),
('7153', 'PMO', 'PMO DEPARTMENT', '5977', '2019-03-07 06:00:02'),
('7175', 'QCL', 'Quality Control Department', '6682', '2019-03-07 06:00:02'),
('7176', 'QUA', 'RnD QA-QC Department', '6682', '2019-03-07 06:00:02'),
('7239', 'PMPD', 'Performance Management & People Development', '5901', '2019-03-07 06:00:02'),
('7371', 'PROC', 'PROCUREMENT', '6465', '2019-03-07 06:00:02'),
('7407', 'CPP.FRM', 'CPP FORMULATION', '7818', '2019-03-07 06:00:02'),
('7488', 'CPG', 'Corporate Planning Department', '5877', '2019-03-07 06:00:02'),
('7494', 'IAD', 'Internal Audit Department', '5877', '2019-03-07 06:00:02'),
('7527', 'HSP', 'Human Resources Support', '5901', '2019-03-07 06:00:02'),
('7550', 'BPI', 'BUSINESS PROCESS IMPROVEMENT', '7549', '2019-03-07 06:00:02'),
('7555', 'RnD', 'R&D', '6682', '2019-03-07 06:00:02'),
('7562', 'SPA', 'STORE PERFORMANCE ANALYST DEPARTMENT', '5977', '2019-03-07 06:00:02'),
('7564', 'SDP', 'STORE DEMAND PLANNING DEPARTMENT', '5977', '2019-03-07 06:00:02'),
('7591', 'CPP.FLOUR', 'CPP - FLOUR PROCESSING', '7818', '2019-03-07 06:00:02'),
('7596', 'CPP.FOOD', 'CPP - FOOD PROCESSING', '7818', '2019-03-07 06:00:02'),
('7603', 'DAE', 'Design & Architecture Department', '5880', '2019-03-07 06:00:02'),
('7769', 'QAQC', 'QA QC SUPPLY DEPARTMENT', '6682', '2019-03-07 06:00:02');

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
('5880', 'BDD', 'Business Development Division', 'DIR.003', '2019-03-07 06:00:02'),
('5901', 'HRS', 'Human Resource Division', 'DIR.002', '2019-03-07 06:00:02'),
('5977', 'OPT', 'Operations Division', 'DIR.001', '2019-03-07 06:00:02'),
('6465', 'SUPL', 'SUPPLY KP DIVISION', 'DIR.001', '2019-03-07 06:00:02'),
('6538', 'FAST', 'Finance, Acct, Costing, Budget, IT Division', 'DIR.002', '2019-03-07 06:00:02'),
('6571', 'EnS', 'ENGINEERING & SERVICES DIVISION', 'DIR.004', '2019-03-07 06:00:02'),
('6682', 'QRD', 'RnD QAQC Corporate', 'DIR.004', '2019-03-07 06:00:02'),
('7549', 'PDD', 'PROCESS DEVELOPMENT DIVISION', 'DIR.004', '2019-03-07 06:00:02'),
('7818', 'CPP', 'CPP-Supply Division', 'DIR.001', '2019-03-07 06:00:02'),
('7841', 'OTH', 'Other Strategic Division', 'DIR.001', '2019-03-07 06:00:02'),
('7911', 'KDP', 'DC - KANTOR DENPASAR BALI', '', '2019-03-07 06:00:02');

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
('1903031420197239685', '2019-03-03 14:33:14', 'DTSEKI0003', 'DTSEJS0016', 'DTSETE0021', 'GROUP PROSES', '', 'SOP201903/001', 'SOP PPMH', 'SCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF|CRW', '5904|7550', '5904', '5904', '7550', '1.0', '2014-12-01', '24', '2016-11-30', 'manhour, portion, ppmh, galau', 'Adapun kaidah-kaidah standar yang sudah disepakati adalah sebagai berikut :\r\n1.	Pengakuan data yang dihitung di store tujuan mutasi adalah apabila tanggal mutasi pekerja terjadi antara tanggal 1 sd 14. Apabila tanggal mutasi terjadi diantara tanggal 15 sd akhir bulan , maka akan menjadi beban man hour store asal mutasi.\r\n2.	Perhitungan  man hour hanya bagi pekerja dengan status Diklat Tetap, PKWT, T', '', '171251', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903050906241783554', '2019-03-05 09:20:39', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', 'GROUP PROSES', 'PROSES', 'MNL-HRS-KMS-01', 'Aplikasi Service Desk (Requester Login)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR', '5904|5922|5926|5942|7239|7527|7550', '7527', '7550', '7550', '1.0', '2018-04-01', '12', '2019-03-31', 'Service Desk, requester, login, manual', 'Manual penggunaan service desk dari sisi requester', '', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-'),
('1903050922414427383', '2019-03-05 09:32:24', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', '', '', 'MNL-HRS-KMS-02', 'Aplikasi Service Desk (Technician Login)', 'HCD', 'EDOC', 'CONF', 'DIR|GMMGR|SNMGR|JNMGR|SNSPV|JNSPV|SCH|STAF', '5904|5922|5926|5942|7239|7527|7550', '7527', '7550', '7527', '1.0', '2018-04-01', '12', '2019-03-31', 'Service Desk, Technician, manual', 'Manual penggunaan Service Desk terkait dari technician', '', '170236', 'DEPARTEMEN', '200054', 'DIPUBLIKASI', 'DIPUBLIKASI', '-');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_bookmark`
--

CREATE TABLE `tb_document_bookmark` (
  `DOCB_ID` varchar(255) NOT NULL,
  `UR_ID` varchar(150) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('1903050922414427383', 'MNL_-_Aplikasi_Service_Desk_(Technician_Login)_v.1', 'application/pdf', 1, 'pdf', 'PANDUAN_Service_Desk_Technician_EST_(Mei_2017)', 'application/pdf', 1, 'pdf', 'File_Not_Found', '-', 0, '-', 'MNL_-_Aplikasi_Service_Desk_Technician_Login_pengesahan.pdf', 'application/pdf', ' \nManual:  \nAplikasi Service Desk (Technician Login) Hal.: 1 / 17 \nSifat: Classified Tgl.: 6 Juni ¶17 Ver.: 01 No.: MNL-HRS-KMS-02 \nDibuat oleh: \n \n \n \n \nDitinjau oleh: Disetujui oleh: \nPT. GRIYA MIESEJATI Johan Mohammad \nKM Supervisor \nAditya Wardiman \nAsst. HR Support Manager \nCynthia Fellicianne \nGM HRD \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\nDiterapkan dan Disetujui oleh: \nDepartemen Disetujui Tanda Tangan \nRecruitment Rita Raesita  \nHI & Personnel Admin Hanggulan Kiting  \nCompensation & Benefit Daniel Ibnu Sidharta  \nHR Support Aditya Wardiman  \nEngineering Store Adhiguna Natadimadja  \nQuality Control Bobby Santosa  \n \nTanggal Efektif :                                                    \nNo. Copy Dokumen :                                                    \nDistribusi ke :                                                    \n \nDAFTAR ISI \n \n1. TUJUAN ........................................................................................................................................................... 2 \n2. RUANG LINGKUP ........................................................................................................................................... 2 \n3. DEFINISI .......................................................................................................................................................... 2 \n4. REFERENSI ..................................................................................................................................................... 2 \n5. DOKUMEN PENUNJANG ................................................................................................................................ 2 \n6. PROSEDUR ..................................................................................................................................................... 3 \n6.1. Akses ke Aplikasi Service Desk ................................................................................................................... 3 \n6.2. Tampilan Halaman Home............................................................................................................................. 4 \n6.3. Tampilan Halaman Dashboard ..................................................................................................................... 5 \n6.4. Tampilan Halaman Requests ....................................................................................................................... 7 \n6.5. Langkah ± Langkah Menindaklanjuti Request ............................................................................................ 10 \n6.6. Mengganti Password Akun Service Desk ................................................................................................... 16 \n6.7. Keluar / Log Out dari Aplikasi Service Desk ............................................................................................... 17 \n7. KONDISI KHUSUS ........................................................................................................................................ 17 \n8. LAMPIRAN ..................................................................................................................................................... 17 \n \n  \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 2 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n1. TUJUAN \n1. Menjadi  alat  untuk mengkomunikasikan request antara Tim  Operasional  (Store)  kepada  Tim Support \n(Divisi/Departemen terkait). \n2. Menjadi acuan bagi technician untuk mengetahui status dari request yang diterima. \n3. Menjadi alat komunikasi yang teroganisir dan terstruktur antara requester dan technician terkait suatu request. \n4. Menjadi media repositori atas request yang telah diajukan. \n5. Menjadi panduan bagi technician untuk menyelesaikan request berdasarkan solusi dari request serupa sebelumnya. \n2. RUANG LINGKUP \n1. Seluruh Divisi dan Departemen terkait pelayanan/support melalui aplikasi Service Desk. \nx Dept. Compensation & Benefit; \nx Dept. HR Support; \nx Dept. Personnel Administration; \nx Dept. Recruitment;  \nx Dept. Engineering Store;  \nx Dept. Quality Control. \n2. Store Operation. \nx Store Melawai (MLW), Jakarta Selatan. \nx Store Melawai (MLW), Jakarta Selatan.  \nx Store GFM (Graha Family), Surabaya.  \nx Store SPI (Supermall Pakuan Indah), Surabaya.  \nx Store TP6 (Tunjungan Plaza 6), Surabaya.  \nx DC - KSB (Kantor Surabaya), Surabaya.  \n3. DEFINISI \n1. Request adalah informasi atau komplain yang diajukan oleh seseorang/pihak melalui aplikasi Service Desk. \n2. Technician adalah orang/pihak yang menindaklanjuti suatu request dari aplikasi Service Desk. \n3. Requester adalah orang/pihak yang mengajukan request melalui aplikasi Service Desk. \n4. REFERENSI \n- \n5. DOKUMEN PENUNJANG \n- \n \n  \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 3 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6. PROSEDUR \n6.1. Akses ke Aplikasi Service Desk \n  \n1) Buka aplikasi browser (Mozila  Firefox,  Chrome,  dll.) pada  desktop/laptop.  Ketik  alamat  web  berikut \nhttp://kms.bakmigm.co.id:8080/. \n2) Pada layar Login masukan username dan password, lalu klik Login. \n3) -LNM PXQ?XO SHULQJMPMQ ³Username or Password is Incorrect´ hal tersebut disebabkan Username dan/atau Password \nyang dimasukkan salah.  \n \nJika lupa username atau password, maka dapat menghubungi admin untuk mendapatkan username & password \nmelalui email ke kms@bakmigm.co.id atau telepon ke ext.416 (HR Support / KM Project Team). Permintaan \nusername & password akan dipenuhi dalam kurun waktu maksimal 24 jam (hari kerja). \n \n\n\n1 \n2 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 4 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.2. Tampilan Halaman Home \n  \n1) Request Catalog: Menu untuk membuat request baru (menu untuk Requesters) ; \n2) Quick Actions: Menu yang menampilkan beberapa pilihan untuk melakukan quick action pada aplikasi Service Desk \nmeliputi, pembuatan insident request, solution, my schedule, mark unavailability, new task, dan new reminder(s). \nSerta  menampilkan my  task,  all  task,  my  reminder(s),  atau archived  request. Tampilan  menu quick  actions \nditampilkan seperti gambar dibawah ini. \n \n3) My View: Menampilkan my summary, my task dan announcements sesuai lingkup technician pemilik akun.  \n4) My Summary: Menampilkan status requests dalam jumlah, meliputi request yang tenggat waktu penyelesaiannya \ntelah lewat (requests overdue), requests yang tenggat waktu penyelesaiannya adalah hari ini (requests due today), \ndan requests yang belum ditanggapi / di-follow up oleh technician (pending requests); \n5) My Tasks: Menampilkan daftar tasks (tugas / proses) yang perlu diselesaikan oleh technician terkait suatu \nrequests. Tasks yang ada ditampilkan dapat berasal dari request yang memang dialamatkan kepada technician \npemilik akun, dan atau berasal dari request milik technician lain dimana salah satu/beberapa tasks-nya merupakan \ntugas /proses kerja yang perlu diselesaikan oleh technician pemilik akun. Hal tersebut ditentukan berdasarkan \nproses kerja dalam penyelesaian masing-masing template requests. \n6) + Add new (tasks): Menu untuk menambah tugas/proses baru untuk diselesaikan oleh technician, diluar dari task \ndari requests. Halaman add new tasks ditampilkan seperti gambar dibawah ini. \n \n\n\n\n3 \n9 \nHome \n4 \n5 \n8 \n1 2 \n6 7 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 5 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n7) > Show all (tasks): Menu untuk menampilkan seluruh tasks terkait lingkup / penugasan yang dialamatkan kepada \ntechnician pemilik akun. Daftar tasks yang ditampilkan dapat diatur sesuai kebutuhan. Halaman show all tasks \nditampilkan seperti gambar dibawah ini. \n \n8) Announcements: Menampilkan berita  / informasi yang  diinput  oleh technicians. Technican  dapat  membuat \nannouncements baru dengan membuka menu n Serta menampilkan seluruh daftar \nannouncements dengan membuka menu .  \n9) Scheduler: Menu untuk menampilkan kalender schedule bulanan yang terdiri dari mark unavailability, tasks, dan \nreminders dari technician pemilik akun serta jadwal libur kantor dan weekend. Menu ini dapat dikonfigurasi sesuai \nkebutuhan masing-masing technician pemilik akun dan di-back up. Halaman scheduler ditampilkan seperti contoh \ngambar dibawah ini. \n \n \n6.3. Tampilan Halaman Dashboard \n  \n\n\n\nDashboard \n3 4 \n5 \n8 \n1 2 \n6 \n7 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 6 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n1) Support Groups: Menu untuk memilih support group yang datanya akan ditampilkan pada halaman dashboard. User \ndapat memilih satu atau lebih support group XQPXN GLPMPSLONMQB.OLN ³Apply´ VHPHOMO SLOLOMQ GLPHQPXNMQB 7MPSLOMQ PHQX \nsupport groups ditampilkan seperti gambar dibawah ini.  \n \n2) Refresh: Menu untuk memilih selang waktu refresh halaman dashboard secara otomatis. Pilihan waktu refresh terdiri \ndari never, 5,10,15, 20, atau 30 minutes. Tampilan menu refresh ditampilkan seperti gambar dibawah ini. \n \n3) New Dashboard: Menu untuk menambah dashboard baru pada halaman dashboard. Untuk menambah dashboard \nbaru, klik ikon lalu klik  seperti gambar dibawah ini.  \n \nDashboard baru dapat dibuat sesuai kebutuhan user dengan cara mengisi field-field yang tersedia pada halaman \n³Add New Dashboard´ VHSHUPL JMPNMU GLNMRMO LQLB .OLN ³VMYH´ XQPXN PHQ\\LPSMQ GMQ PHQMPNMONMQ dashboard \nbaru. \n \n4) Dashboard  Setting: Menu  untuk  melakukan setting pada tampilan dahsboard. Setting dashboard yang  dapat \ndilakukan adalah setting layout style dan background color. Tampilan menu dashboard setting ditampilkan seperti \ngambar dibawah ini. \n             \n\n\n\n\n\n\n1 \n2 \n3 \n4 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 7 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n5) Judul dashboard menjelaskan  data  atau  informasi  terkait  hal-hal  yang  ditampilkan  pada dashboard tersebut, \nberdasarkan support groups yang dipilih user. Secara default, terdapat 10 (sepuluh) judul dashboard yang tampil \npada halaman dashboard yaitu; Request by, Request Summary, Task Summary, Open Request by, SLA Violation \nby, Unassigned and Open Request, SLA Violated Request, Request Approaching SLA Violation, Request Received \nin last 20 days, dan Request closed in last 20 days.  \n6) Menu filter dashboard digunakan untuk menampilkan data dan informasi pada dashboard berdasarkan menu filter \nyang  dipilih  oleh user.  Setiap  judul dashboard memiliki menu filter yang  berbeda-beda. Misalnya request  by \ntechnician, request by category, request summay last week, request summary last month, open requests by priority, \nopen requests by level, dan sebagainya. \n7) Menu refresh dashboard digunakan untuk me-refresh suatu dashboard secara langusng. Menu ini akan muncul pada \ndashboard yang dituju oleh kursor mouse. \n8) Menu dashboard graphic digunakan untuk mengatur tampilan grafik suatu dahsboard sesuai kebutuhan user. Pilihan \nmenu grafik setiap dashboard berbeda-beda. Menu ini akan muncul pada dashboard yang dituju oleh kursor mouse. \n \n6.4. Tampilan Halaman Requests \n  \n \n1) Pilih menu Request dengan pilihan All Requests, untuk menampilkan seluruh request dari pihak requester untuk \ndi-follow up oleh pihak technician (user).  \nCatatan: \nPilihan menu lain pada Request merupakan menu untuk menampilkan / mensortir request berdasarkan status \nrequest-nya.  Misalnya My Completed Request,  untuk  menampilkan request  request yang  statusnya  sudah \ncomplete. \n2) New Incident: Menu untuk membuat request baru yang belum terakomodasi di dalam pilihan incident templates \npada request catalog (dilakukan oleh requesters). \n3) Actions: Menu yang dapat digunakan oleh technician untuk mem-follow up suatu request. Pilih request yang akan di \nfollow-up dengan cara memberi tanda pada kotak pilihan pada daftar request (no. 10), lalu pilih alternatif follow-up \npada menu actions. Pilihan pada menu actions terdiri dari: edit request, delete, pick up, close, merge, dan link \nrequests. Contoh pilih menu pick up untuk mem-follow up request secara langsung oleh technician pemilik akun. \nTampilan menu actions ditampilkan seperti gambar dibawah ini. \n \n\n\nRequests \n1 5 2 6 7 8 3 4 9 \n10 \n11 \n12 13 14 15 16 17\n \n \n16 \n18 19 20 21 22 23 \n24 25 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 8 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n4) Select technician & Assign: Menu untuk memilih technician yang akan mem-pick up atau mem-follow up request(s) \nyang dipilih. Memilih request dilakukan dengan cara memberi tanda pada kotak pilihan pada daftar request (no. 10). \nKemudian klik select technician untuk memilih nama technician OMOX NOLN ³MVVLJQ´B \n5) Request ID: Menu untuk mencari dan masuk ke halaman suatu request dengan menuliskan nomer ID request. \n6) Advance Search: Menu untuk mencari request secara custom. Tampilan advance search ditampilkan seperti gambar \ndibawah ini. \n \n7) Setting: Menampilkan menu pilihan untuk membuat custom view dan mengatur custom view daftar request, serta \nmenampilkan pilihan frekuensi waktu refresh. Tampilan menu setting dan custom view ditampilkan seperti gambar \ndibawah ini. \n  \n8) All Tasks: Lihat. Sub Bab. 6.2 . point 7. \n9) Show per Page: Menu untuk mengatur jumlah daftar request per halaman.  \n10) Cheks Box: Kotak untuk memberi tanda (v) pada request-request yang dipilih. \n11) Conversation Envelope: Lambang penanda status conversation / percakapan antara requester dan technician. \nMakna dari lambang conversation ditampilkan pada gambar dibawah ini. \n \n12) Notes: Lambang penanda status ada-tidaknya notes komunikasi antara requester dan technician. Makna dari \nlambang notes ditampilkan pada gambar dibawah ini. \n \n13) Edit Request: Menu untuk melakukan edit / update pada suatu request. \n14) Task List: Menu untuk menampilkan jumlah tasks (total tasks) secara keseluruhan dan tasks yang belum di-follow \nup (pending tasks) pada suatu request. \n15) ID: menampilkan nomer identitas suatu request; \n16) Subject: Menampilkan judul-judul request yang telah dibuat oleh requester; \n17) Requester Name: Menampilkan nama/pihak requester yang mengajukan request;  \n18) Assigned To: Menampilkan nama/pihak technician yang manangani (pick-up) masing-masing request; \n \n \n \n\n\n\n\n\n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 9 / 17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n19) Due By: Menampilkan tanggal batas waktu penyelesaian masing-masing request; \nCatatan: \nDue By ditentukan berdasarkan standar SLA (Service Level Agreement) dari masing-masing request (incident / \nservice templates).  \nStandar waktu SLA dari masing-masing incident / service templates dibedakan berdasarkan priority-nya.  \nPriority suatu request ditentukan oleh pihak technician.  \n20) Status: Menampilkan status penyelesaian suatu request. \nCatatan:  \nTerdapat beberapa jenis status yang berlaku di Aplikasi Service Desk. \nx Received: Status yang dimiliki suatu request, setiap sebuah request setelah diajukan. Dalam hal ini SLA sudah \nmulai berjalan. \nx In Progress: Status request yang sedang ditangani / dikerjakan oleh pihak technician. Dalam hal ini SLA \nberjalan. \nx On Hold: Status request saat prosesnya dihentikan sementara oleh pihak technician karena tidak lengkapnya \nkelengkapan suatu request. Misalnya pihak technician menerima request yang belum dilengkapi attachment \ndokumen kelengkapan, maka technician dapat merubah status request menjadi on hold. Dalam hal ini SLA akan \nberhenti, dimana technician akan berkomunikasi kepada requester untuk melakukan perbaikan request. Jika \nkelengkapan request sudah dilengkapi maka status diganti kembali menjadi In Porgress dan SLA berjalan lagi. \nx Waiting for Approval: Status request yang prosesnya sedang menunggu proses approval. Dalam hal ini SLA \ntidak berhenti karena proses approval merupakan bagian dari proses kerja. \nx On Vendor Process: Status request yang prosesnya sedang dalam tahap penyelesaian oleh pihak ketiga / \nvendor. Dalam hal ini waktu proses di vendor merupakan bagian dari waktu SLA. \nx Resolved:  Status request yang  sudah selesai  ditangani oleh  pihak technician dan  sedang  menunggu \nkonfirmasi dari pihak requester. Dalam hal ini SLA sudah berhenti. \nx Closed: Status request yang sudah selesai ditangani. \nx Cancelled: Status request yang tidak dapat ditangani / diproses sehingga ditolak oleh tim technician. \n21) Created date: Menampilkan waktu pengajuan masing-masing request. \n22) Priority: Menampilkan status prioritas suatu request. Setiap status request memiliki batasan waktu SLA (service level \nagreement). \n23) Group: Menampilkan nama support group dari suatu request. \n24) Search column: Menu untuk mencari request berdasarkan kata kunci (keywords) yang ada pada columns. \nCatatan: \nKlik logo search column (lup) kemudian akan muncul kolom search di bawah masing-masing header columns. \nKetik keyword pada salah satu atau lebih kolom search. Lalu Go pada bagian ujung kiri untuk menampilkan \nrequest yang dicari. \n25) Pengatur columns: Menu untuk memilih columns yang akan di tampilkan serta mengatur urutan columns.  \nCatatan: \nUntuk  memilih columns yang  akan  ditampilkan dilakukan  dengan men-checklist menu columns yang  akan \nditampilkan. Lalu klik save. \nUntuk mengatur urutan columns dilakukan dengan men-select menu columns yang akan dipindahkan, lalu arahan \ncolumns tersebut ke atas atau kebawah dengan menggunakan tombol arah panah menuju urutan yang diinginkan. \nLalu klik save. \n \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 10 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.5. Langkah  Langkah Menindaklanjuti Request \n \n \n1) Pastikan menu filter request \\MQJ GLSLOLO MGMOMO ³All Requests´ XQPXN PHQMPSLONMQ VHOXUXO requests. \n2) Subject dengan tulisan cetak tebal (Bold) berarti request tersebut belum dibuka/dibaca. Klik subject request yang \ndipilih untuk membukanya.  \n \n \n \n \n3) Arahkan kursor ke  untuk melihat  4 ³1RPHV´ D  6 ³FRQYHUVMPLRQ´ 7 \n (8) dan  (9). \n\n\n\n\n\n\n\n1 \n2 \n3 \n4 \n5 6 7 \n6 \n8 \n9 \n10 11 12 13 14 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 11 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n4) Description menampilkan deskripsi, informasi dan petunjuk terkait request yang diajukan. \n5) Notes merupakan fitur komunikasi antara requester dengan technician. Tampilan angka menandakan jumlah notes \nyang ada. Berikut adalah langkah-langkah membuat notes. \n \n \na) Pilih menu Action lalu pilih menu Add notes.  \nb) Kemudian akan muncul menu tampilan Add Notes. \nc) Kemudian tulis notes yang akan dikomunikasikan kepada pihak requester pada tempat yang tersedia.  \nd) Setelah itu PMQGML NMJLMQ ³show this note to requester´B  \ne) Kemudian klik add note untuk mengirim note. \nf) 3HUOMPLNMQ ³Discussion Notes´ XQPXN PHOLOMP ?MPMPMQ NRPXQLNMVL MQPMUM SLOMN requester dan pihak technician \n(scroll kebawah). \n6) Attachments berisi tentang file yang menjadi bagian lampiran dari request yang diajukan. \n7) Conversations menampilkan  komunikasi  antara technician dan requester yang  dikirim  dengan  format  email. \nTampilan conversation adalah sebagai berikut. \n \n\n\n\na \nb \nc \nd \ne \nf \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 12 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n8) Request Details menampilkan detil informasi terkait request yang diajukan. Setiap request template memiliki field \nyang berbeda-beda. Technician dapat mengubah isi request details dengan meng-klik edit, lalu mengubah isi \nrequrest details dan diakhiri dengan mengklik tombol update pada bagian bawah request details. \n9) Requester Details menampilkan informasi terkait requesters yang mengajukan request. Technician dapat mengubah \nisi requester  details dengan meng-klik edit, lalu mengubah isi requrester details dan diakhiri dengan mengklik tombol \nupdate pada bagian bawah requester details. \n10) Edit request merupakan menu untuk menindaklanjuti request yang masuk. Tampilan edit menu request adalah \nsebagai berikut: \n  \n--- (scroll ke bawah) --- \n  \na) Lengkapi field  field seperti, status, priority, technician, sub category, category, dan item. \nCatatan:  Pilihan  menu  pada field  priority berbeda-beda  setiap service  category.  Untuk request terkait \nEngineering Store pilihan priority  terdiri dari , Medium, dan Low´ disesuaikan dengan definisi kondisi \nkerusakan yang terjadi. Selain request terkait Engineering Store yang lain pilihan priority-nya adalah ´B \nUbah status request sesuai tindaklanjut yang telah dilakukan. Misalnya pilih  saat pertama kali pick \nup request MPMX ³UHVROYHG´ VMMP PHQ\\HOHVMLNMQ PLQGMN OMQÓXP VXMPX ³request´B \nb) Tekan PRPNRO ³Update Request´ SMGM NMJLMQ NMRMO (scroll ke bawah) untuk menyimpan data request yang \nsudah dilengkapi.  \n11) Close request merupakan fitur untuk mengubah status request menjadi close. \n12) Assign merupakan fitur untuk memilih Technician yang ditunjuk untuk menindaklanjuti sebuah request. Tampilan \nmenu Assign adalah sebagai berikut. \n \n \n \n \n \n\n\n\na \nb \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 13 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n13) Actions merupakan fitur yang menampilkan tindakan-tindakan (actions) yang dapat dilakukan Technician terhadap \nsebuah request. Tampilan menu Actions adalah sebagai berikut. \n \n14) Reply merupakan fitur untuk menjawab request yang masuk. Pilihan jawaban yang tersedia meliputi; \n \n \n15) Perhatikan perubahan status dan priority setelah request di edit (pick up). \n16) Masuk ke menu  dan ikuti urutan task.  \n17) Lalu uSGMPH VPMPXV PHQÓMGL ³ bila task sudah dilaksanakan. Task yang tidak terpakai bisa dihapus dengan \nmemberikan tanda centang pada pilihan task, kemudian pilih \0? . \n\n\n\n16 \n17 \n15 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 14 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n \n18) Selanjutnya pilih menu ´ XQPXN PHQJLQSXP MQMOLVM VHUPM UHQ?MQM SHUNMLNMQB  \n19) Isi resolution (tindak lanjut) dari request yang telah dikerjakan pada kolom yang tersedia.  \n20) Tekan PRPNRO ³Save´ XQPXN PHQ\\LPSMQ GMPMB \n \n21) Bila penyelesaian/tindak lanjut request dan membutuhkan persetujuan (approval) dari pejabat yang berwenang, \nmaka NOLN ³Actions´ \n22) Kemudian SLOLO ³6XNPLP IRU $SSURYMO´B Berikut adalah langkah-langkah untuk mengajukan approval request kepada \npejabat berwenang: \na) To: Ketik alamat email dari pejabat yang akan diminta persetujuannya (Misal Manager, GM dan/atau Direktur).  \nb) Subject: Tuliskan judul request yang akan diminta persetujuannya (approval) dengan mengubah kalimat \n³$SSURYMO UHTXLUHG IRU M UHTXHVP´ \\MQJ PHOMO PHUVHGLM SMGM field subject.  \nc) Description: Tuliskan rangkuman  deskripsi yang  diperlukan  untuk mendukung proses  pengajuan \npersetujuan (approval) yang diminta. Lengkapi pula dengan nama technician yang mengajukan apporval pada \nfield Description. \n\n\n18 \n19 \n20 \n21 \n22 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 15 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\nCatatan: Jangan menghapus tulisan link yang sudah tersedia  ³KRXU MSSURYMO LV UHTXLUHG IRU M UHTXHVP PR \nproceed with its execution. The details of the request canbe found at $ApprovalLink´B  \nPenambahan deskripsi dapat dilakukan sebelum atau sesudah tulisan link yang telah tersedia.  \nd) 7HNMQ PRPNRO ³Send´ XQPXN mengirimkan email. \n \n23) Email terkait approval akan dikirim ke email pejabat yang dituju. Saat tautan (link) approval pada email di klik oleh \npejabat yang dituju, maka akan muncul gambar tampilan seperti berikut pada layar email pejabat tersebut. Langkah-\nlangkah approval yang dilakukan oleh pejabat yang berwenang adalah sebagai berikut: \n \na) Pilih status approval, berupa pilihan  atau  \nb) Tulis penjelasan terkait status approval pada bagian comment. \nc) Klik save untuk mengubah status approval. \n\n\na \na \nb \nc \nb \nc \nd \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 16 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n \n \n24) Untuk melihat progres approval, lihat pada buka menu approval. \n25) Lihat status approval. \n26) Setelah menyelesaikan rangkaian tindak lanjut request, kembalilah ke menu edit. \n \n27) Ubah status menjadi ´ XQPXN tindak lanjut request yang sudah selesai dilakukan. Kemudian informasikan \nkepada Requester bahwa request PHOMO VHOHVML GL VHOHVMLNMQ GHQJMQ PHQJJXQMNMQ PHQX ³$GG 1RPHV´ SMGM PHQX \n\0?actions (lihat langkah No.5). Kemudian pihak requesters akan memberikan konfirmasi atas perbaikan yang sudah \ndilakukan. Setelah itu Technician/Staf Admin dapat melakukan verifikasi dan mengubah status request menjadi \n IMOX NOLN ³update request´ SMGM NMJLMQ NMRMOB \n6.6. Mengganti Password Akun Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk lalu klik Change Password. \n2) Isi password lama pada kolom current password. Lalu isi password baru pada kolom new password dan confirm new \npassword. \n3) Klik save untuk menyimpan password baru. \n \n\n\n\n\n1 \n2 \n3 \n24 25 \n25 \nBelum Approve \nSudah Approve \n26 \n27 \n25 \n \nManual:  \nAplikasi Service Desk (Technician Login) \nNo.: MNL-HRS-KMS-02 Ver.: 01 \nTgl.: 6 Juni ¶17 Hal.: 17 / \n17 \n \nMNL-HRS-KMS-02 ± Ver. 01 \n\n6.7.  Keluar / Log Out dari Aplikasi Service Desk \n \n1) Klik gambar lingkaran di ujung kanan atas layar Service Desk. \n2) Klik Log Out untuk keluar dari aplikasi Service Desk.  \n \n7. KONDISI KHUSUS \n- \n8. LAMPIRAN \n- \n\n1 \n2 ');

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
('1903050920008603166', '1903050906241783554', '2019-03-05 09:20:00', 'THOMAS ADITYA PANDU WIRAWAN', 'Ditolak PENCIPTA', 'dok utama not found');

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
(31, '1903031420197239685', '171251', '5904'),
(49, '1903031420197239685', '170007', '5904'),
(67, '1903031420197239685', '130175', '5904'),
(80, '1903031420197239685', '150443', '7550'),
(85, '1903031420197239685', '151009', '7550'),
(132, '1903031420197239685', '211752', '5904'),
(135, '1903031420197239685', '212383', '7550'),
(170, '1903031420197239685', '200044', '5904'),
(190, '1903031420197239685', '97003', '5904'),
(210, '1903031420197239685', '140978', '5904'),
(237, '1903031420197239685', '161064', '5904'),
(238, '1903031420197239685', '161067', '5904'),
(246, '1903031420197239685', '170035', '5904'),
(247, '1903031420197239685', '170232', '5904'),
(331, '1903031420197239685', '208205', '5904'),
(333, '1903031420197239685', '209067', '5904'),
(335, '1903031420197239685', '209420', '5904'),
(336, '1903031420197239685', '209686', '7550'),
(341, '1903031420197239685', '211362', '5904'),
(392, '1903050906241783554', '171251', '5904'),
(397, '1903050906241783554', '181289', '5926'),
(401, '1903050906241783554', '206366', '5926'),
(403, '1903050906241783554', '211577', '5942'),
(407, '1903050906241783554', '150521', '5922'),
(410, '1903050906241783554', '170007', '5904'),
(416, '1903050906241783554', '210569', '7527'),
(418, '1903050906241783554', '211374', '5942'),
(419, '1903050906241783554', '211875', '7239'),
(454, '1903050922414427383', '171251', '5904'),
(455, '1903050922414427383', '171314', '7550'),
(459, '1903050922414427383', '181289', '5926'),
(463, '1903050922414427383', '206366', '5926'),
(465, '1903050922414427383', '211577', '5942'),
(469, '1903050922414427383', '150521', '5922'),
(472, '1903050922414427383', '170007', '5904'),
(480, '1903050922414427383', '211374', '5942'),
(481, '1903050922414427383', '211875', '7239'),
(488, '1903050922414427383', '120077', '5926'),
(489, '1903050922414427383', '120422', '5926'),
(490, '1903050922414427383', '130175', '5904'),
(497, '1903050922414427383', '140969', '5926'),
(503, '1903050922414427383', '150443', '7550'),
(508, '1903050922414427383', '151009', '7550'),
(515, '1903050922414427383', '161158', '5926'),
(529, '1903050922414427383', '180079', '7239'),
(532, '1903050922414427383', '180586', '5926'),
(533, '1903050922414427383', '180617', '5926'),
(534, '1903050922414427383', '181020', '5926'),
(540, '1903050922414427383', '206003', '5922'),
(542, '1903050922414427383', '208136', '5926'),
(543, '1903050922414427383', '208152', '5926'),
(544, '1903050922414427383', '208171', '5926'),
(545, '1903050922414427383', '208519', '5926'),
(546, '1903050922414427383', '209561', '5926'),
(548, '1903050922414427383', '210120', '5926'),
(550, '1903050922414427383', '210326', '7239'),
(552, '1903050922414427383', '211108', '5926'),
(555, '1903050922414427383', '211752', '5904'),
(558, '1903050922414427383', '212383', '7550'),
(575, '1903050922414427383', '150974', '5926'),
(580, '1903050922414427383', '170904', '5926'),
(586, '1903050922414427383', '180853', '5926'),
(593, '1903050922414427383', '200044', '5904'),
(613, '1903050922414427383', '97003', '5904'),
(620, '1903050922414427383', '130546', '7239'),
(627, '1903050922414427383', '140118', '5922'),
(628, '1903050922414427383', '140124', '5922'),
(633, '1903050922414427383', '140978', '5904'),
(650, '1903050922414427383', '160001', '5942'),
(652, '1903050922414427383', '160057', '5922'),
(660, '1903050922414427383', '161064', '5904'),
(661, '1903050922414427383', '161067', '5904'),
(663, '1903050922414427383', '161225', '5922'),
(669, '1903050922414427383', '170035', '5904'),
(670, '1903050922414427383', '170232', '5904'),
(676, '1903050922414427383', '170389', '5942'),
(680, '1903050922414427383', '170668', '5926'),
(685, '1903050922414427383', '171173', '5942'),
(692, '1903050922414427383', '171318', '7527'),
(695, '1903050922414427383', '171349', '5942'),
(699, '1903050922414427383', '171404', '7527'),
(754, '1903050922414427383', '208205', '5904'),
(756, '1903050922414427383', '209067', '5904'),
(757, '1903050922414427383', '209397', '5942'),
(758, '1903050922414427383', '209420', '5904'),
(759, '1903050922414427383', '209686', '7550'),
(760, '1903050922414427383', '210638', '5942'),
(762, '1903050922414427383', '211171', '5942'),
(764, '1903050922414427383', '211362', '5904'),
(783, '1903050922414427383', '151010', '5901'),
(784, '1903050922414427383', '200054', '5901');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_notification`
--

CREATE TABLE `tb_document_notification` (
  `NOTIF_ID` int(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `UR_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_document_notification`
--

INSERT INTO `tb_document_notification` (`NOTIF_ID`, `DOC_ID`, `UR_ID`) VALUES
(1, '1903031420197239685', '171314'),
(2, '1903031420197239685', '200054'),
(3, '1903031420197239685', '171251'),
(4, '1903050906241783554', '171314'),
(5, '1903050906241783554', '200054'),
(6, '1903050906241783554', '170236'),
(7, '1903050922414427383', '200054'),
(8, '1903050922414427383', '170236');

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
('DTSETE0001', 'DTSEJS0001', 'DTSEKI0001', 'VISI', 'TMP1', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0002', 'DTSEJS0002', 'DTSEKI0001', 'MISI', 'TMP2', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0003', 'DTSEJS0003', 'DTSEKI0001', 'CORPORATE VALUE', 'TMP3', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0004', 'DTSEJS0004', 'DTSEKI0001', 'KODE ETIK PERUSAHAAN', 'TMP4', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0005', 'DTSEJS0005', 'DTSEKI0001', 'VALUE CHAIN MAP', 'TMP5', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0006', 'DTSEJS0006', 'DTSEKI0001', 'KELENGKAPAN PERIJINAN PERUSAHAAN', 'TMP6', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0007', 'DTSEJS0007', 'DTSEKI0001', 'SERTIFIKAT DAN STANDARISASI', 'TMP7', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0008', 'DTSEJS0008', 'DTSEKI0001', 'BALANCED SCORECARD PERUSAHAAN', 'BSC', 'CONF', 'JNSPV', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0009', 'DTSEJS0009', 'DTSEKI0001', 'DOK. EKSTERNAL', 'TMP8', 'NCNF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0010', 'DTSEJS0010', 'DTSEKI0002', 'PERNYATAAN KEBIJAKAN PERUSAHAAN', 'PKP', 'CONF', 'JNSPV', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0011', 'DTSEJS0011', 'DTSEKI0002', 'STRUKTUR ORGANISASI', 'STO', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0012', 'DTSEJS0012', 'DTSEKI0002', 'JOB SUMMARY', 'JBS', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0013', 'DTSEJS0013', 'DTSEKI0002', 'BALANCED SCORECARD DIVISI', 'BSC', 'REST', 'JNMGR', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0014', 'DTSEJS0013', 'DTSEKI0002', 'BALANCED SCORECARD UNIT KERJA', 'BSC', 'CONF', 'JNSPV', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0015', 'DTSEJS0014', 'DTSEKI0002', 'MANUAL SISTEM JAMINAN HALAL', 'TMP8', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0016', 'DTSEJS0014', 'DTSEKI0002', 'BILL OF MATERIAL / STANDAR BAHAN DAN BUMBU', 'BOM / SBB', 'REST', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0017', 'DTSEJS0014', 'DTSEKI0002', 'PRODUK SPESIFIKASI', 'TMP9', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0018', 'DTSEJS0015', 'DTSEKI0002', 'DOK. EKSTERNAL', 'TMP10', 'NCNF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0019', 'DTSEJS0016', 'DTSEKI0003', 'BUSINESS PROCESS MAPPING', 'BPM', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0020', 'DTSEJS0016', 'DTSEKI0003', 'OPERATION PROCESS CHART', 'OPC', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0021', 'DTSEJS0016', 'DTSEKI0003', 'STANDARD OPERATING PROCEDURE', 'SOP', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0022', 'DTSEJS0016', 'DTSEKI0003', 'SERVICE LEVEL AGREEMENT', 'SLA', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0023', 'DTSEJS0017', 'DTSEKI0003', 'MANUAL', 'MNL', 'CONF', 'STAF', 'JNSPV', 'JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0024', 'DTSEJS0017', 'DTSEKI0003', 'WORK INSTRUCTION / LEMBAR URAIAN KERJA', 'WIS / LUK', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0025', 'DTSEJS0018', 'DTSEKI0003', 'STANDAR', 'STD', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0026', 'DTSEJS0018', 'DTSEKI0003', 'AS BUILT DRAWING', 'ABD', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0027', 'DTSEJS0018', 'DTSEKI0003', 'GAMBAR TEKNIK', 'TMP11', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0028', 'DTSEJS0018', 'DTSEKI0003', 'MODUL TRAINING', 'TMP12', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0029', 'DTSEJS0019', 'DTSEKI0003', 'FORMULIR', 'FRM', 'CONF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0030', 'DTSEJS0020', 'DTSEKI0003', 'DOK. EKSTERNAL', 'TMP13', 'NCNF', 'STAF', 'None', '', 'All', 'Available', 1, 'Copyright of Bakmi GM'),
('DTSETE0031', 'DTSEJS0021', 'DTSEKI0004', 'DIRECTOR SPEECH', 'TMP14', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0032', 'DTSEJS0021', 'DTSEKI0004', 'MEMO', 'MMO', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0033', 'DTSEJS0021', 'DTSEKI0004', 'PERJANJIAN KERJA KARYAWAN', 'TMP15', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0034', 'DTSEJS0021', 'DTSEKI0004', 'BON SEMENTARA', 'BS', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0035', 'DTSEJS0021', 'DTSEKI0004', 'SURAT PENERIMAAN BARANG', 'SPB', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0036', 'DTSEJS0021', 'DTSEKI0004', 'BUKTI PENERIMAAN KAS KECIL', 'BPKK', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0037', 'DTSEJS0021', 'DTSEKI0004', 'MEDIA MARKETING', 'TMP16', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0038', 'DTSEJS0021', 'DTSEKI0004', 'BUKTI SERAH TERIMA', 'BST', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0039', 'DTSEJS0021', 'DTSEKI0004', 'DLL.', '-', 'NCNF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0040', 'DTSEJS0022', 'DTSEKI0004', 'KNOWLEDGE ASSET', 'TMP17', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0041', 'DTSEJS0022', 'DTSEKI0004', 'SOLUSI PENYELESAIAN KERUSAKAN', 'TMP18', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0042', 'DTSEJS0022', 'DTSEKI0004', 'TEMPLATE PROJECT', 'TMP19', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0043', 'DTSEJS0022', 'DTSEKI0004', 'DLL.', '-', 'NCNF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0044', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN KEUANGAN', 'TMP20', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0045', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN PROGRESS BSC', 'TMP21', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0046', 'DTSEJS0023', 'DTSEKI0004', 'NOTULEN', 'NTL', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0047', 'DTSEJS0023', 'DTSEKI0004', 'LAPORAN PENJUALAN', 'TMP22', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0048', 'DTSEJS0023', 'DTSEKI0004', 'DLL.', '-', 'NCNF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0049', 'DTSEJS0024', 'DTSEKI0004', 'KONTRAK KERJA VENDOR', 'TMP23', 'CONF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM'),
('DTSETE0050', 'DTSEJS0024', 'DTSEKI0004', 'DLL.', '-', 'NCNF', 'STAF', 'None', '', 'All', 'None', 1, 'Copyright of Bakmi GM');

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
('1903050906241783554', 'Manual HSP', 'DTSEKI0003', 'DTSEJS0017', 'DTSETE0023', '', '', 'MNL-HRS-KMS-01', 'Aplikasi Service Desk (Requester Login)', 'HCD', 'EDOC', 'CONF', '170236');

-- --------------------------------------------------------

--
-- Table structure for table `tb_document_versioning`
--

CREATE TABLE `tb_document_versioning` (
  `DOCV_ID` varchar(255) NOT NULL,
  `DOC_ID` varchar(150) NOT NULL,
  `DOCV_DATE` date NOT NULL,
  `DOCV_DETAIL` varchar(255) NOT NULL,
  `DOCV_CATATAN` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `NIP` int(11) NOT NULL,
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
(1, 'comben', 'PEILY DIAN LIE', 'cynthia-f@bakmigm.co.id;anthony@bakmigm.co.id', '', 'Director of FAST & HR', 'SNMGR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(2, '000002', 'LIE KAY HOAT', '', '', 'Boards Of Directors', 'DIR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(3, 'jenny', 'L JENNY MOKHTAR', 'jennym@bakmigm.co.id', '', 'Director of Div. Supply & Operation', 'SNMGR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(4, 'tammy', 'TAMMY TANUMIHARDJA', 'tammyt.bakmigm@gmail.com', '', 'Business Development Director', 'SNMGR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(6, '000006', 'FENNY WIDJAJA', 'fennyw73@yahoo.com', '', 'Procurement Manager', 'SNMGR', '7371', 'PROCUREMENT', 'SUPL', '2019-03-04 08:18:04'),
(8, 'marsudia', 'MARSUDI', '', '', 'Boards Of Directors', 'DIR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(10, 'julia', 'JULIA', '', '', 'Boards Of Directors', 'DIR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(87220, '087220', 'WINARTO SUPANDI', 'winartosupandi65@gmail.com', '', 'CPP - FLP  Supervisor', 'SNSPV', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(87224, '087224', 'TJANG EN FIE', 'tjangenfie68@gmail.com', '', 'FOP Formulation Supervisor', 'SNSPV', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(92003, '092003', 'WAHYUNI PURNAMAWATI', 'wahyunipurnamawati@gmail.com', '', 'CPP - Food Processing Section Head', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(92022, '092022', 'WINA ANESSIA LEOLITA J.', 'wina.anessia@gmail.com', '', 'Cash Management Supervisor', 'SNSPV', '6551', 'Finance Department', NULL, '2019-03-04 08:18:04'),
(92100, '092100', 'ROCHMAN', 'piurochman@gmail.com', '', 'CPP - FLP Section Head', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(93032, '093032', 'BUDIONO', 'budionogm3@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(93091, 'kuat triana', 'MARYONO', 'maryonoaja702@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(95001, '095001', 'DWI WAHYONO', 'wahyonodwi74@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(95019, '095019', 'TONI SUPRIATNA', 'tonicpp4@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(95020, '095020', 'WARIDAN', 'waridantea@gmail.com', '', 'CPP - Food Processing Section Head', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(95040, 'dede kuswanda', 'DEDE KUSWANDA', 'dedekuswanda22@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(95041, '095041', 'SUWANTO', 'suwantoajja@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(95309, '095309', 'WAGIMAN', 'wagiman.andreas@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(95324, '095324', 'KIDAM HIDAYANTO', 'khidayanto79@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(96030, '096030', 'EKO SUPRIYATNO', 'ekosupriyatno507@gmail.com', '', 'Maintenance Section Head KP', 'SCH', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(96068, '096068', 'HENDRIKA NINIK', 'hendrika.ninik.suryanti@gmail.com', '', 'FOP Formulation Supervisor', 'SNSPV', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(96351, '096351', 'MUGIO RAHAYU', 'mugiorahayu50@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(97003, '097003', 'RATIH PUTRI HAPSARI', 'ratihputrihapsari@gmail.com', '', 'Cooperatives Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(97028, 'asep supriatna', 'ASEP SUPRIATNA', '74.asepsupriatna@gmail.com', '', 'Driver', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(97044, '097044', 'YANTO ANDRIKA', 'yantoandrika@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(97097, '097097', 'FRANSISKA K PRABAWA', 'fransiska@bakmigm.co.id', '', 'Ass. Account Payable & Expenses Manager', 'SNMGR', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(97113, '097113', 'WARKIM', 'zhraakifah30@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(97114, '097114', 'SUDIN SUTIANA', 'sijalupd@gmail.com', '', 'CPP - FOP Formulation Foreman', 'STAF', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(97123, 'rasam', 'RASAM', 'salaryalif23@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(97315, 'abdul muhid', 'ABDUL MUHID', 'Abdulmuhidd77@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(99001, 'sulasno', 'SULASNO', 'sulasnoaja11@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(99012, '099012', 'SUNARTO', 'sunartopurwoketo@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(99304, '099304', 'NANANG SURYAMAN', 'nanangsuryaman57@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(99305, '099305', 'KARTIKA ATMADJA', 'albertakartika@gmail.com', '', 'Assistant Costing Manager', 'JNMGR', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(120002, '120002', 'ADHIGUNA NATADIMADJA', '', '', 'Store Engineering Manager', 'SNMGR', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(120003, '120003', 'ARIS SETIOKO', 'arissetioko30@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(120077, '120077', 'WILLY WIDJAJA', 'wil.widjaja@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(120108, '120108', 'HADIYANTO', 'antohadihadianto@gmail.com', '', 'Good Transp Section Head', 'SCH', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(120136, '120136', 'BOBBY SANTOSA', 'bobbysantosa@yahoo.com', '', 'QC Manager', 'SNMGR', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(120245, 'renos', 'RENOS GC', '', '', 'Security Section Head', 'SCH', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(120246, '120246', 'SORANG PARDAMEAN', 'sorang.pardamean@gmail.com', '', 'Warehouse Assistant Supervisor', 'JNSPV', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(120318, '120318', 'ERWIN SURYANTO', 'erwinsuryanto.bgm@gmail.com', '', 'Store Demand Planning Assistant Manager', 'JNMGR', '7564', 'STORE DEMAND PLANNING DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(120355, '120355', 'AGUNG CHANDRA', '', '', 'Logistic Manager', 'SNMGR', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(120413, '120413', 'AGUS SETIAWAN', 'agusaddiba80@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(120422, '120422', 'WAHYU KURNIAWAN', 'wahyu.pringgo@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(120454, '120454', 'ERWIN FIRMANSYAH', 'erwinfirmansyah194@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(120455, '120455', 'LEDY', 'ledy@bakmigm.co.id', '', 'Corporate Secretary', 'SNMGR', '7091', 'Corporate Secretary', NULL, '2019-03-04 08:18:04'),
(120491, '120491', 'RYSCHA AL ROHMAN', 'ryscha.arohman@gmail.com', '', 'CPP - FLP Admin Staf', 'STAF', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(130057, '130057', 'MELISA ROSALINA', 'melisa.rosalina72@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(130079, '130079', 'INDAH APRIYANI', 'indah.apriliani.x@gmail.com', '', 'Telephone Operator', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(130115, '130115', 'SULAIMAN', 'sulaiman.sl895@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(130137, '130137', 'TUA MARTHIN HARRY SIAGIAN', 'crozsball@gmail.com', '', 'Delivery Service Application Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(130175, '130175', 'BUN JUN KIONG', 'jk.anakgembala@gmail.com', '', 'Personnel Administration Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(130221, '130221', 'DINI NURYANI', 'lixiadini@gmail.com', '', 'CPP - FLP  Supervisor', 'SNSPV', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(130243, '130243', 'ANDRI SAPUTRO', 'andri.saputro10@gmail.com', '', 'Maintenance Crew  KP', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(130383, '130383', 'KUROTUL AENI', 'kurotulaeni83@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(130546, 'Ita', 'ITA APRILIANI', 'it4.apriliani@gmail.com', '', 'People Development Administration Staff', 'STAF', '7239', 'Performance Management & People Development', 'HRS', '2019-03-04 08:18:04'),
(130550, '130550', 'CONCORDEUS MEYSELVA SETYARANTO NUGROHO', 'concordeusmeyselva@gmail.com', '', 'Engineering Supervisor Store', 'SNSPV', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(130635, '130635', 'JENESS HENDRAWIDJAJA', '', '', 'R&D Specialist', 'SNSPV', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(130638, '130638', 'IRANSYAH', 'iransyah94@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(130639, '130639', 'MUHAMMAD JAMALUDIN', 'jamalmuhammad3001@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(130675, '130675', 'SUHENDRA TAMBUNAN', 'suhendratambz@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(130677, '130677', 'SAFITRI DEVI HARTATI', 'safitri.devi@gmail.com', '', 'QAD Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(130678, '130678', 'RACHEL ARDINA SINAGA', 'ardinakornelius@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(130751, '130751', 'TRI CAHYADI', 'tri.cahyadi@bakmigm.com', '', 'Engineering Manager', 'SNMGR', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(130754, '130754', 'CHANDRA PUTRASOGIT SITOHANG', 'sitohangchandra@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(130782, '130782', 'JEFFRY FERNANDO', 'fernandojfree@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(130827, '130827', 'DEWI HANTARI PUTRI', 'dewihantari.29@gmail.com', '', 'Ass. Event/Bazaar Supervisor', 'SNSPV', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(130838, '130838', 'ARI WAHIDIN', 'ariwahidin.21@gmail.com', '', 'Maintenance Crew  KP', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(130874, '130874', 'MIRANTI DEWI PUTRI', 'mirantidewiputri@gmail.com', '', 'Call Center QA Staff', 'STAF', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(140001, '140001', 'JULIETTA TIURMA', 'julietta.tiurma@gmail.com', '', 'Purchasing Manager', 'SNMGR', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(140118, 'Desni', 'DESNI PENESIA PURBA', 'desnipp@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(140124, 'Agnes', 'AGNES', 'onlyagneslie@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(140235, 'antonius', 'ANTONIUS HENDRAJAYA', '', '', 'Supply Division General Manager', 'GMMGR', '6465', 'SUPPLY KP DIVISION', NULL, '2019-03-04 08:18:04'),
(140349, '140349', 'EDWIN KURNIAWAN', 'edwin.k1991@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(140490, '140490', 'M.Y NUGROHO', 'nugroho.my@gmail.com', '', 'Office Service Supervisor', 'SNSPV', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(140491, 'hendri', 'HENDRI WIJAYA', 'henz.wijaya@gmail.com', '', 'IT Manager', 'SNMGR', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(140615, '140615', 'AGUS HERNANTO', 'agushernanto0873@gmail.com', '', 'Channel Sales Manager', 'SNMGR', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(140621, '140621', 'MUFTI FIRMANSYAH', 'mofez08@gmail.com', '', 'Site Engineer', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(140688, '140688', 'MELLA APRIYANI', 'melaapril@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(140719, '140719', 'BAYU SETIAWAN', 'Bayunetsetiawan@gmail.com', '', 'Warehouse Admin', 'STAF', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(140897, '140897', 'R. ANDIKA AVIES WAHYUWINANTO', 'andika0609.aw7@gmail.com', '', 'CPP GA Supervisor', 'SNSPV', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(140969, '140969', 'YAN KHARISMA', 'yan.kharisma@gmail.com', '', 'Learning Analytic Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(140970, '140970', 'ADI DHARMA GAUTAMA', 'gautama888@gmail.com', '', 'Purchasing Supervisor', 'SNSPV', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(140978, 'Kara', 'DEDI SETIAWAN BAKARA', 'Dedisetiawanbakara@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(141071, '141071', 'CITRAWATI HENDRAWIDJAJA', 'citra.h@bakmigm.co.id', '', 'Corporate Planning Manager', 'SNMGR', '7488', 'Corporate Planning Department', NULL, '2019-03-04 08:18:04'),
(141238, 'widianto', 'WIDIANTO', 'ledy@bakmigm.co.id', '', 'Director of Div. Engineering & Services', 'SNMGR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(150029, '150029', 'ARI SURYANA', 'arisuryana83@gmail.com', '', 'CPP Engineering Ass. Supervisor', 'SNSPV', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(150032, '150032', 'DIMAS ANDI SAPUTRA', 'dimas.andi.saputra@gmail.com', '', 'Store Application Specialist', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(150058, '150058', 'TANSARI DEWI', 'filetansaridewi@gmail.com', '', 'R&D Specialist', 'SNSPV', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(150063, '150063', 'R FAJAR EGIT INDRASWARA', 'eghiet@gmail.com', '', 'IT Service Desk', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(150154, '150154', 'NOVITA PURWATI', 'nvii87@gmail.com', '', 'Designer & Architect Supervisor', 'SNSPV', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(150156, '150156', 'HUZAIFAH', 'evahuzaifah12@gmail.com', '', 'Call Center Section Head', 'SCH', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(150217, '150217', 'INDRA ANGGRIAWAN', 'indraanggriawan17@gmail.com', '', 'CPP QC/QA Supervisor', 'SNSPV', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(150243, '150243', 'RANI DAME SIMANJORANG', 'ranidamesimanjorang@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(150248, '150248', 'SOFIAN CHANDRA', 'sofian.chandra@gmail.com', '', 'Office Service Manager', 'SNMGR', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(150343, '150343', 'EVELINE MELANIE', 'evelinemelanie@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', NULL, '2019-03-04 08:18:04'),
(150380, '150380', 'DIAH AYU NOVITASARI', 'diah.ayu.novitasari@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(150381, '150381', 'MEME MERY', 'meme.mery@bakmigm.co.id', '', 'Account Receivable Manager', 'SNMGR', '6551', 'Finance Department', NULL, '2019-03-04 08:18:04'),
(150385, '150385', 'MUHAMAD KARIL', 'muhamadkaril788@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(150443, '150443', 'SABASTIAN CAHYA DERMAWAN', 'bastiancahya.bakmigm77@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', NULL, '2019-03-04 08:18:04'),
(150446, '150446', 'KUSTINI MAESAROH', 'kustinimae@gmail.com', '', 'CPP - FOP Admin Staff', 'STAF', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(150447, '150447', 'JUNIATI MAYASARI SIDABUTAR', 'juniati.mayasari@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(150455, '150455', 'MUHAMMAD BINTANG ANUGRAH', 'bintanganugraah97@gmail.com', '', 'Warehouse Admin', 'STAF', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(150456, '150456', 'CHRISTIAN BARNABAS', '', '', 'Marketing Manager', 'SNMGR', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(150521, 'daniel', 'DANIEL IBNU SIDHARTA', 'daniel.sidharta@bakmigm.co.id', '', 'Compensation & Benefit Assistant Manager', 'JNMGR', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(150554, '150554', 'ANDRI CHAIRUDDIN', 'andrichairuddin@gmail.com', '', 'CPP - FLP  Supervisor', 'SNSPV', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(150621, '150621', 'ADITYA JEIHANDANU', 'Jeihandanu@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(150663, '150663', 'RUTH ARUAN', 'rutharuan27@gmail.com', '', 'Direct Sales Assistant Manager', 'JNMGR', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(150665, '150665', 'DEBORA NOPRIANA SIPAHUTAR', 'debdeb.nopriana@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-03-04 08:18:04'),
(150721, '150721', 'RIDWAN', 'ridwan.ella01@gmail.com', '', 'QA Delivery Service Supervisor', 'SNSPV', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(150725, '150725', 'ANDY CAHYADY', 'andy.cahyady1982@gmail.com', '', 'Store Process Engineer Manager', 'SNMGR', '7150', 'Store Process Engineering', 'OPT', '2019-03-04 08:18:04'),
(150734, '150734', 'HOTSAIDA SITUMORANG', 'idatania.situmorang@gmail.com ', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(150867, '150867', 'MUKHLISIN', 'mukhlisalpens@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(150948, '150948', 'PATRICIA OKTAVIANA', 'oktaviana.po@gmail.com', '', 'Marketing Promotion Support', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(150974, '150974', 'NINA SUDIANA', 'nina.sudiana09@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(150992, '150992', 'FEBBY ANDI PUTRA', 'FebbyandiPutra@gmail.com', '', 'Data Costing Process Specialist', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(150994, '150994', 'ANDDREAS MARSHEILO IRAWAN', 'anddreas.marsheilo@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(151004, '151004', 'ANEIS TIRTA PERTIWI', 'aneistirtapertiwi@gmail.com', '', 'IT Admin Staf', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(151009, '151009', 'HARRY NUGROHO POERNOMO', 'harry.hhyou@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', NULL, '2019-03-04 08:18:04'),
(151010, '151010', 'RIDWANTO SALIM', 'vergoares@gmail.com', '', 'HR Analyst', 'SNSPV', '5901', 'Human Resource Division', 'HRS', '2019-03-04 08:18:04'),
(151015, '151015', 'LARASATI INES WARDIANI', 'ineswardana@gmail.com', '', 'QA Staff KP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(151021, '151021', 'WAHYU ISYA SETYADI', 'wahyuisya91@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(151023, '151023', 'STELLA MARIA PAYUNG', 'stella5992@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(151060, '151060', 'FAJAR KURNIA', 'fajarkurnia793@gmail.com', '', 'CPP - FLP Foreman', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(160001, 'kristanti', 'KRISTANTI RETNO H.', 'ichacrista.89@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(160007, '160007', 'RIKY PRATOMO', 'RikyPratomo06@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(160057, 'doropat', 'DOROPAT SITUMORANG', 'doropatstumorang@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(160114, '160114', 'ANDREAS KEVIN', 'ktarmidi@gmail.com', '', 'Store Demand Planning Staff', 'STAF', '7564', 'STORE DEMAND PLANNING DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(160118, '160118', 'FIRLI SAFIRANI', 'firlifiru@gmail.com', '', 'QC Inspector Supply', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(160182, '160182', 'REVIA PRAMESTI', 'reviavia@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(160315, '160315', 'FAJAR MUHAMAD HASAN', 'fajar.mh16@gmail.com', '', 'PPIC - DCH Planner', 'SCH', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(160322, '160322', 'HERMAWAN SUSANTO', 'kenzahermawan20@gmail.com', '', 'Engineering Supervisor Store', 'SNSPV', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(160323, '160323', 'ALFONSIUS F. H MATONDANG', 'alfonferry@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(160325, '160325', 'ALOYSIUS BAYU WITANTO', 'bayowitanto.25@gmail.com', '', 'QC Operation Supervisor', 'SNSPV', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(160416, '160416', 'ANGGARA ISWADISAR', 'iswadisar@gmail.com', '', 'QC Supply Supervisor', 'SNSPV', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(160477, '160477', 'ARIF HIDAYAT', 'arif.hidayatyoi@gmail.com', '', 'Call Center QA Support Staff', 'STAF', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(160757, '160757', 'NURYANTO', 'yantonur836@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(160767, '160767', 'NOVIAN DIMAS ARIZONA', 'novian.dimas@gmail.com', '', 'Internal Audit Staff', 'STAF', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(160834, '160834', 'SUDIRI', 'dongker0@gmail.com', '', 'CPP - FLP Foreman', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(160892, '160892', 'ENGGAL CIPTANAGARA SUBIADINATA', 'enggalcs@gmail.com', '', 'Internal Auditor Supervisor', 'SNSPV', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(160893, '160893', 'ANTON WIJAYA', 'antonwihaya3790@gmail.com', '', 'Engineering Supervisor Store', 'SNSPV', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(160894, '160894', 'MOSELEY RH SIMATUPANG', 'moseley.simatupang@bakmigm.co.id', '', 'Director of Div. Supply', 'SNMGR', '5877', 'Boards Of Directors', NULL, '2019-03-04 08:18:04'),
(160907, '160907', 'FLORENTINA YUNITA RATRI', 'florentina.yunitaratri@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(160989, '160989', 'SEPTIYAN SOLAHUDIN', 'septiyansolahudin@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(160997, '160997', 'NUGROHO VALENTINO', 'nugroho.valentino@bakmigm.co.id', '', 'Assistant Accounting Manager', 'JNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(161064, 'laela', 'LAELA ROBINGATUN', 'llaella007@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(161067, 'putri', 'PUTRI RAHAYU', 'putrikbz@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(161069, '161069', 'MUHAMMAD JANUAR DITYA PRATAMA', 'januarditya@gmail.com', '', 'Big Order / Cord Order Staff', 'STAF', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(161158, '161158', 'EDUARDO KUKILA AJI', 'edokukila@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(161225, 'deky', 'DEKY SABARTONO', 'deky.sabartono22@gmail.com', '', 'Payroll Administration Staff', 'STAF', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(161229, '161229', 'PATAR ERIKSON PAKPAHAN', 'erickson.patar@gmail.com', '', 'Inventory Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(161230, '161230', 'FRIDES MUSLIM', 'freedezh@gmail.com', '', 'Site Engineer Supervisor', 'SNSPV', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(161281, '161281', 'YORIE', 'yorieyorie60@gmail.com', '', 'Purchasing Material Supervisor', 'SNSPV', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(161371, '161371', 'SAMUEL', 'samuelkudo22@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(161375, '161375', 'HIDAYATTULLOH', 'Hidayattulloh1412@gmail.com', '', 'Store Demand Planning Staff', 'STAF', '7564', 'STORE DEMAND PLANNING DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(161562, '161562', 'RICKY DANIEL SILITONGA', 'silitongar8@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170002, '170002', 'AGUS SUNARYO', 'agussunaryo84@gmail.com', '', 'Internal Audit Staff', 'STAF', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(170007, '170007', 'NOVEL EM ALAM', 'novel@bakmigm.co.id', '', 'Industrial Relation Assistant Manager', 'JNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(170011, '170011', 'ARRIDHA AFIATI', 'arridhaa@gmail.com', '', 'R&D Staff', 'STAF', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(170012, '170012', 'CHATARINA YUNI KARTIKA', 'chatarinayk94@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(170030, '170030', 'ERIKO E SIHOTANG', 'ericosihotang96@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170035, 'robiatul', 'ROBIATUL ADAWIYAH', 'weykoyuki@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(170090, '170090', 'VICTOR VIDYANTO NUGRAHA', 'victor.vidyanto@gmail.com', '', 'QC Operation Supervisor', 'SNSPV', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(170199, '170199', 'MUKSIDIN', 'Muksidin60@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170230, '170230', 'I GUSTI NGURAH ADHI PUTRA', 'agusadhi16@gmail.com', '', 'Procurement Supervisor', 'SNSPV', '7371', 'PROCUREMENT', 'SUPL', '2019-03-04 08:18:04'),
(170232, 'vinoria', 'VINORIA ANDRIYANI', 'vinoria.andriyani@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(170236, '170236', 'JOHAN MOHAMMAD', 'johan.mohammad@gmail.com', '', 'Knowledge Management Supervisor', 'SNSPV', '7527', 'Human Resources Support', 'HRS', '2019-03-04 08:18:04'),
(170242, '170242', 'DASUKI ADNAN', 'apepcagar86@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170243, '170243', 'INDAH NOVITASARI MANURUNG', 'insmanurung@gmail.com', '', 'QC Inspector Supply', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(170247, '170247', 'FERNANDO', 'nfer0707@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170277, '170277', 'DWI ENDAH PRISKAWATI', 'dwipriskawati73@gmail.com', '', 'Direct Sales Support Staf', 'STAF', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(170278, '170278', 'RR. DYAH RATNANINGRUM', 'nandutzz88@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(170281, '170281', 'EMAN', 'aimanrizki971@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170299, '170299', 'RIZAL NURBAYAN', 'rizalnurbayan@gmail.com', '', 'Store Demand Planning Staff', 'STAF', '7564', 'STORE DEMAND PLANNING DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(170300, '170300', 'HANUM MURTI HAPSARI', 'hanummurti@gmail.com', '', 'QC Inspection Staf', 'STAF', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(170302, '170302', 'AGUS SAIFUDIN', 'agussaifudin2908@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(170307, '170307', 'DANANG PRASETYO', 'danangprasetyo1717@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170310, '170310', 'AGUNG SANTOSO', 'agungmif16@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170312, '170312', 'ICHZA MAHENDRA', 'ichzam15@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170389, '170389', 'DANIEL JULY FRIDAYANA', 'danieljuly26@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(170390, '170390', 'SUCI MAYANG SARI', 'sucimayangsari.06@gmail.com', '', 'QC Inspection Staf', 'STAF', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(170395, '170395', 'ARI ANWARI', 'anwariari10@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170398, '170398', 'APIPULLOH', 'apipulloh91@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170399, '170399', 'EPRIZAL', 'eprizal516@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(170404, '170404', 'SLAMET ARIFIN', 'sarifin184@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170406, '170406', 'TEDDY SUTANTO', 'teddy.sutanto@bakmigm.co.id', '', 'Assistant HKM Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(170470, '170470', 'YESSI FRISKILA', 'friskilayessi@gmail.com', '', 'QA Staff KP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(170472, '170472', 'EKO PRASETYO', 'franzescohimura@gmail.com', '', 'Internal Audit Staff', 'STAF', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(170537, '170537', 'FITRI', 'fitri.ryan1110@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(170540, '170540', 'IRWANSYAH', 'syahiir@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170542, '170542', 'RIPKI PAUZAN', 'Rifkifauzan711@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170543, '170543', 'AZWAR HALIM', 'azwarhalim8886@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170545, '170545', 'ADITYA RIAWAN KARNADI', 'aditya.riawan@bakmigm.co.id', '', 'Corporate Planning Ass. Manager', 'SNMGR', '7488', 'Corporate Planning Department', NULL, '2019-03-04 08:18:04'),
(170546, '170546', 'BAEDOWI', 'baedowi4@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170565, '170565', 'CANRA PANE', 'candrapane94@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170668, '170668', 'NOVITA HENDRIANA', 'novitahendriana68@gmail.com', '', 'Training Administration Staff', 'STAF', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(170672, '170672', 'DONI', 'doniadam71@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(170675, '170675', 'EMED HUMAEDI', 'humaedi.xfriends@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170782, '170782', 'RIYAN HANAFI', 'Riyanhanafi134@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170784, '170784', 'TRI ARIF ROHIM', 'triarifrohim101@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170789, '170789', 'MUHAMAD RIFKI WIJAYA', 'rifkiwjy19@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170791, '170791', 'ABDULLAH NUR FAJAR', 'Abdullahnurfajar19@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170792, '170792', 'ANDI MAULANA', 'andi.maulana15@gmail.com', '', 'Store Process Engineer', 'SNSPV', '7150', 'Store Process Engineering', 'OPT', '2019-03-04 08:18:04'),
(170793, '170793', 'PIRZA BOBI IRWAN', 'Pirzabobiirwan19@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(170806, '170806', 'SYAIFUL ANWAR', 'muraiblacktell22@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170887, '170887', 'WIRYONO', 'wiryono.1994@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170892, '170892', 'SAJIMAN', 'sajiman.cpp@gmail.com', '', 'CPP - FLP Foreman', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170894, '170894', 'SAIPUL ANWAR', 'sanwar12341@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170899, '170899', 'CAHYUDIN', 'cahyudin021@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(170901, '170901', 'WINRO NAINGGOLAN', 'nainggolanraja95@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170903, '170903', 'ROLINUXS', 'kulingolan30899@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(170904, '170904', 'DATIM', 'mzdatim72gm@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(170948, '170948', 'MUHAMAD FAIZ', 'faisanwar26@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170954, '170954', 'MAULANA AKBAR', 'maulanaakbar909@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170957, '170957', 'NOVRIZAL RIYADI', 'novrizal7680@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(170960, '170960', 'MUHAMMAD ZAENAL', 'zaenal.muhammad2687@gmail.com', '', 'Asset Management Supervisor', 'SNSPV', '6534', 'Asset Management Department', 'EnS', '2019-03-04 08:18:04'),
(170961, '170961', 'LINDA WULANSARI', 'ulland.sariie@gmail.com', '', 'CPP PPIC & Warehouse Admin Staff', 'STAF', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(170963, '170963', 'AKHMAD SUDRAJAT', 'akhmadsudrajat.96@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(170967, '170967', 'HABIL NURHAMID', 'Habilnurhamid89@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(170970, '170970', 'MUHAMMAD FACHMI', 'fachmi1906muhammad@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(171081, '171081', 'LUSIA SRIWAHYUNI', 'theesia1@gmail.com', '', 'Customer Experience Kasie', 'SCH', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(171165, '171165', 'SANTOSA', 'ssantosa57@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171166, '171166', 'TB REZA MAULANA', 'maulanar202@gmail.com', '', 'Marketing Administration Staff', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(171167, '171167', 'RIKA LIEVI YANI PURBA', 'rikalieviyanipurba@gmail.com', '', 'CRM Supervisor', 'SNSPV', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(171168, '171168', 'SITI SAYIDATURROHMAH', 'ayisanjaya4@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(171170, '171170', 'WALUYO', 'yoyowaluyo36@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171171, '171171', 'NUR HAKIM', 'Haqimbae@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171173, '171173', 'MARIA ANJELINA KAE', 'Jellynangellyna30@gmail.com', '', 'Recruitment Administration Staff', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(171204, '171204', 'MOCHAMMAD SYAIFUL ANWAR', 'bayuaji089@gmail.com', '', 'Internal Audit Staff', 'STAF', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(171211, '171211', 'HENDRA GUNAWAN', '', '', 'Project Manager', 'SNMGR', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(171238, '171238', 'HARYADI', 'boyhariyadi@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171251, 'hkiting', 'HANGGULAN KITING', 'hanggulan.kiting@bakmigm.co.id', '', 'Industrial Relation Manager', 'SNMGR', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(171252, '171252', 'ASAEL FETRARI PALAMBA', 'asaelpalamba@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(171253, '171253', 'PARDAMEAN HASUDUNGAN', 'pardamean65@gmail.com', '', 'PPIC Staff', 'STAF', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(171255, '171255', 'RIVALDY RYAN JOHANNES SANI', 'ryansani25@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(171260, '171260', 'ANDI JATMIKO', '', '', 'CPP PPIC & Warehouse Assistant Manager', 'JNMGR', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(171261, '171261', 'AGUNG NUR PRATAMA', 'agngpratma25@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(171270, '171270', 'ANTHONY PAMUNGKAS', 'anthony@bakmigm.co.id', '', 'Finance & Acct. IT, Sys. Dev. General Manager', 'GMMGR', '6538', 'Finance, Acct, Costing, Budget, IT Division', NULL, '2019-03-04 08:18:04'),
(171271, '171271', 'RIZAL FAJRIYANA', 'rizalfajriyana89@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(171294, '171294', 'FERDY PANGESTU', 'ferdyjedhot@gmail.com', '', 'CPP - Formulation Crew', 'CREW', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(171298, '171298', 'ALFONSO SOLAGRACIA S', 'alfonso.solagracia@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171303, '171303', 'KATLYA BUDITRIAMI', 'katlya.buditriami@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(171305, '171305', 'ISMAT', 'ismed0197@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171310, '171310', 'WAHYU INDRA SAPUTRA', 'indrasaputra.wahyu@gmail.com', '', 'Process Engineer Specialist', 'STAF', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(171314, '171314', 'THOMAS ADITYA PANDU WIRAWAN', 'thomas.wirawan@gmail.com', '', 'Business Process Improvement Manager', 'SNMGR', '7550', 'BUSINESS PROCESS IMPROVEMENT', NULL, '2019-03-04 08:18:04'),
(171316, '171316', 'HERI KARSO', 'herikarso@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(171318, '171318', 'TRI MUHARYANTI', 'trryanty@gmail.com', '', 'Employee Relation Specialist', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-03-04 08:18:04'),
(171321, '171321', 'RENDY RENALDY', 'rendyrenaldy101@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(171322, '171322', 'MOHAMAD HANAFI', 'mohanafi9896@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(171323, '171323', 'USBANDA ABDUL HAMID', 'Usbandaburning@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171324, '171324', 'ARIEF GUNTARA', 'guntaraa2@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171326, '171326', 'BUDI SANTOSO', 'acux70@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(171334, '171334', 'AMRIN MAHFUD', 'amrinmahfud326@gmail.com', '', 'Maintenance Crew  KP', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(171340, '171340', 'ANITA FIRDAUS', 'anitafirdaus851@gmail.com', '', 'Food Truck Staff', 'STAF', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(171343, '171343', 'KHOLIQ FACTHUR RACHMAN', 'facthurbram@gmail.com', '', 'Engineering Store Section Head', 'SCH', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(171349, '171349', 'CLAUDIA CINDRY DOROTEA', 'claudorotea@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(171355, '171355', 'KOKO KADARISMAN', 'kadarismankoko41@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171357, '171357', 'LARA MAHLINDIANI', 'mahlindianilara@gmail.com', '', 'Market Research Staff', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(171362, '171362', 'AMRULLOH', 'amrulsajha@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(171364, '171364', 'PAMUNGKAS SRI WIDODO', 'pamungkas.sri.widodo@gmail.com', '', 'Store Process Engineer', 'SNSPV', '7150', 'Store Process Engineering', 'OPT', '2019-03-04 08:18:04'),
(171369, '171369', 'FIRSTIAN ANDREA PUTRI', 'firstian.andre22@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(171370, '171370', 'YERRI HERDINAL', 'yerriherdinal10@gmail.com', '', 'Asset Management Staff', 'STAF', '6534', 'Asset Management Department', 'EnS', '2019-03-04 08:18:04'),
(171404, '171404', 'ADINDA NIDYA LESTARI SLAWAT', 'dindanidyajob@gmail.com', '', 'Knowledge Management Staff', 'STAF', '7527', 'Human Resources Support', 'HRS', '2019-03-04 08:18:04'),
(171435, '171435', 'SAUT MARTUPA MANALU', 'sautmanalu0652@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(171453, '171453', 'HASTI NUR RAMADHANI', 'Hastinurramadhani00@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(171454, '171454', 'NOVIA NUR AMALIA', 'amalianurnovia@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(171455, '171455', 'INDRIANI FATIMAH', 'Indrianifatimah12@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(171456, '171456', 'AYU INDAH CAHYANI', 'Ayudia234@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(180002, '180002', 'DEWI EKAWATI HANDININGRUM TARDAN', 'dewihandiningrumt@gmail.com', '', 'Customer Experience Supervisor', 'SNSPV', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(180003, '180003', 'NANDA IQBAL IBRAHIM', 'nandaiqbal@gmail.com', '', 'Planning & Forecast Supervisor', 'SNSPV', '7013', 'Plan & Budget Department', 'FAST', '2019-03-04 08:18:04'),
(180006, '180006', 'HADELI GUSMAN', 'hadeligusman1@gmail.com', '', 'Store Process Engineer', 'SNSPV', '7150', 'Store Process Engineering', 'OPT', '2019-03-04 08:18:04'),
(180011, '180011', 'ELDY JIMMI YANSYAH', 'eldyjimmi@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180012, '180012', 'FAUZI RAMDANI', 'danyqyu@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180031, '180031', 'M DHENNY SETIAWAN', 'Dhenny210399@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180036, '180036', 'ANGGARISKA WINARTI', 'anggariska93@gmail.com', '', 'R&D Staff', 'STAF', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(180039, '180039', 'RAHMAT NURWANTO', 'rahmatnw69@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180040, '180040', 'WIAZMI DWI ASTRID', 'dwiwiazmi@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180079, '180079', 'KEVIN JONATHAN', 'mrkevinjonathan@gmail.com', '', 'People Development Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-03-04 08:18:04'),
(180089, '180089', 'DIMAS KRISNA PRAYOGA', 'dimaskrisnaprayoga@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180092, '180092', 'JUSENTO', 'jusento13@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(180093, '180093', 'SITI AMANIAH', 'niaaman97@gmail.com', '', 'Store Engineering Admin Staf', 'STAF', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(180095, '180095', 'IRLAN FAJRIAN', 'irlanfajrian@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(180119, '180119', 'SYAHRUL MAULANA', 'baoyy44@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180120, '180120', 'VERINA HALIM', 'verinanana@gmail.com', '', 'Marcomm & Digital Marketing Ass. Manager', 'SNMGR', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(180121, '180121', 'SRI PUTRIYANA BR GINTING', 'putriyana605@gmail.com', '', 'Planning & Forecast Staf', 'STAF', '7013', 'Plan & Budget Department', 'FAST', '2019-03-04 08:18:04'),
(180122, '180122', 'INDAH', 'iinindah193@gmail.com', '', 'CPP - FOP Admin Staff', 'STAF', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180125, '180125', 'ADI SAPUTRO', 'adisaputro80638@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180144, '180144', 'CANDRA WINDU KURNIAWAN', 'candrawinduk48@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(180158, '180158', 'MARIA ASSUMPTA DYAH PUTRI UTAMI', 'mariaassumpta93@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180161, '180161', 'DIMAS PUTRA SADEWO', 'dimas51dewo@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180162, '180162', 'KHOFIPAH', 'khofifahaja91@gmail.com', '', 'Engineering Administration Staff', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(180209, '180209', 'LISTA AMANIAH', 'andiniwinata01@gmail.com', '', 'CPP Engineering Admin Staff', 'STAF', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(180210, '180210', 'MUHAMMAD DANARDI ARIJONA', 'danarstei12@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180211, '180211', 'SOPANDI', 'sopandialfaro@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180212, '180212', 'MUHAMMAD AMRULLOH', 'muhammadamrulloh06@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180213, '180213', 'SELFI FAHRUNISAH', 'selfi.fahrunisah@gmail.com', '', 'Project Admin', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(180218, '180218', 'OCTAVIANUS', 'octavianussitinjak@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(180219, '180219', 'AHMAD KHUMAIDI ANNAJA', 'a.khumaidi.a@gmail.com', '', 'Store Performance Analyst Staff', 'STAF', '7562', 'STORE PERFORMANCE ANALYST DEPARTMENT', 'OPT', '2019-03-04 08:18:04');
INSERT INTO `tb_employee` (`NIP`, `USER_NAME`, `FULL_NAME`, `EMAIL`, `PASSWORD`, `JOBTITLE`, `JOBLVL`, `DEPCODE`, `DEPNAME`, `ORG_PARENT`, `SYNC_DATE`) VALUES
(180220, '180220', 'DEDY MARTHIN SITANGGANG', 'dsitanggang34@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(180222, '180222', 'ARTHA KUSUMA', 'arthakusuma38@gmail.com', '', 'Site Engineer Supervisor', 'SNSPV', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(180263, '180263', 'HASBI RUSNADI', 'hasbirusnadi5@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180264, '180264', 'MUHARAM APRILA NASIHAN', 'muharamaprila123@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180265, '180265', 'MULYANA', 'yanaiyan71@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180267, '180267', 'VINNY ALAWIYAH', 'vinnyalawiyah@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(180268, '180268', 'CANDRA ARIYANTO', 'candraariyanto722@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(180270, '180270', 'RIZKI AKBAR FAZRIANTO', 'rizkiakbarfazrianto@gmail.com', '', 'Costing Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180272, '180272', 'JESSICA LESTIA SUCIPTO', 'jessicalestia@gmail.com', '', 'Designer', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(180276, '180276', 'WIWIT', 'wiwit0494@gmail.com', '', 'CPP - Formulation Admin Staff', 'STAF', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(180295, '180295', 'ALDI RIYANSAH', 'riyansah.aldi@gmail.com', '', 'QC Inspection Staf', 'STAF', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(180319, '180319', 'RIZKA NADHIRA', 'nadhirarizka@gmail.com', '', 'QC Inspector Supply', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(180320, '180320', 'SYAKIROTUN NIKMAH', 'syakirotunnikmah16@gmail.com', '', 'R&D Staff', 'STAF', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(180332, '180332', 'AHMAD JAELANI', 'amadjaelani13@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180340, '180340', 'ANDRI', 'andridjun1997@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(180346, '180346', 'DANIEL CINDRA', 'daniel.cindra17@gmail.com', '', 'Business Development Executive', 'SCH', '5898', 'Business Development', 'BDD', '2019-03-04 08:18:04'),
(180412, '180412', 'YUNIKA MAGDALENA', 'yunikamagdalena96@gmail.com', '', 'Secretary', 'STAF', '7091', 'Corporate Secretary', NULL, '2019-03-04 08:18:04'),
(180418, '180418', 'AZMI BIMA PRAYUDHA', 'azmibima16@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', NULL, '2019-03-04 08:18:04'),
(180453, '180453', 'FAUSTIN ANGELICA', 'faustinangelica14@gmail.com', '', 'Designer', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(180467, '180467', 'ARIYANTO', 'ariyantocs6@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180470, '180470', 'AGUNG RAHYUDI', 'agungrahyudi17@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180471, '180471', 'ZONA JAYA ARPAN', 'zonajaya50@gmail.com', '', 'CPP - Food Processing Section Head', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180482, '180482', 'GUSTI P S. PANE', 'gusti.pssitorus@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(180483, '180483', 'FIKI PRASSETIO', 'fikiprassetio212@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180549, '180549', 'MUHAMAD RIZKY SALAM', 'rizkyxsalam@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180550, '180550', 'ERIN DODI M PANE', 'dodimpane@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(180552, '180552', 'RYANTO FERRY SIHOTANG', 'riantosihotang46@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(180556, '180556', 'LEGI MURSALEH', 'egimursale2017@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180561, '180561', 'AZIZAH WIDIASMARA', 'azizahwdmsr@gmail.com', '', 'Data Scientist (CRM) Staff', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(180562, '180562', 'ANJAR ARIFAN', 'anjar.arifan17@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180578, '180578', 'IRWAN SURYANA', 'bangawankumis@gmail.com', '', 'Purchasing Officer', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(180579, '180579', 'BARANI LERIDA', 'barani.lerida@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(180580, '180580', 'DILO YANSIMAN MANIK', 'dilomanik01@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180584, '180584', 'MUHAMAD JUSUP', 'muhamadjusup@gmail.com', '', 'Permit Supervisor', 'SNSPV', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(180586, '180586', 'RIA AGUSTINA', 'riaagsstna@gmail.com', '', 'Learning Design Specialist', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(180590, '180590', 'CATHERINE DE PUTRI', 'catherinedeputri@gmail.com', '', 'Designer', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(180591, '180591', 'FIKRI RAMA WARDANI', 'fikrisnsd@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180594, '180594', 'MUHAMAD AFRIZAL', 'mafrizal083@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180596, '180596', 'SORES SONJAYA', 'soressinaga@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180617, '180617', 'AJENG PUSPITASARI', 'ajengpuspita398@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(180628, '180628', 'SANDI FIRDAUS', 'sandifirdas@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180665, '180665', 'ABDI AZIZ', 'azizabdi129@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(180706, '180706', 'RISKI NOFIANTO', 'riskinofian17@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180708, '180708', 'M. FIKLAR AULLAMA', 'mfiqlar@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180746, '180746', 'ROHMAT', 'juventinimander@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(180748, '180748', 'VALENCIA VERENA', 'valenciaverena9@gmail.com', '', 'QA/QC Supply Manager', 'SNMGR', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(180752, '180752', 'ABI SUHERI', 'abisuheri28@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180755, '180755', 'ABDUL WAHID SYAHRONI', 'abdulwahidsyahroni@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(180756, '180756', 'SYARIFAH MUDARSIH', 'syarifahmu23@gmail.com', '', 'Inventory Staff', 'STAF', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(180757, '180757', 'HENDRA SAPUTRA BONDAR', 'hendrasaputrabondar975@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180760, '180760', 'YUDI SETIAWAN', 'yudisetiawan000724@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(180764, '180764', 'ANDREAS WILSON H. SIMANGUNSONG', 'wilsonmangunsong@gmail.com', '', 'Developer PHP', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(180853, '180853', 'ADAM SAPUTRA', 'adam.69saputra@gmail.com', '', 'Demonstrator', 'SCH', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(180860, '180860', 'SYAIFUDIN ZUHRI', 'cagarapep@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(180862, '180862', 'HERI SETIADI', 'linda.sllusyng123@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(180863, '180863', 'AJI PURWANTO', 'adjie.45.92@gmail.com', '', 'Maintenance Crew  KP', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(180887, '180887', 'LYWIANA', 'lywiana@bakmigm.co.id', '', 'Finance Planning & Analysis Manager', 'SNMGR', '7013', 'Plan & Budget Department', 'FAST', '2019-03-04 08:18:04'),
(180895, '180895', 'BONATIO MICHAEL PARTOGI', 'bonatiomichael@gmail.com', '', 'Purchasing Staff', 'STAF', '6526', 'Purchasing', 'SUPL', '2019-03-04 08:18:04'),
(180896, '180896', 'ANTO SUNANTO', 'antosunanto33@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(180946, '180946', 'MOHAMAD KHOERUL ANAM', 'akhoerul035@gmail.com', '', 'Maintenance Crew  KP', 'STAF', '6588', 'Engineering KP Department', 'EnS', '2019-03-04 08:18:04'),
(180956, '180956', 'FERDY KURNIAWAN', 'ferdykurniawaqn@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(180992, '180992', 'BATARA KUMARA', 'batarakumara27@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(180993, '180993', 'IMAN DWINANTO', 'iman.dwinanto@bakmigm.co.id', '', 'Engineering & Services General Manager', 'GMMGR', '6571', 'ENGINEERING & SERVICES DIVISION', NULL, '2019-03-04 08:18:04'),
(181005, '181005', 'WAHYU AKBAR', 'wahyu.indomotor@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(181008, '181008', 'A EDY SUSANTO', 'edisusanto42@gmail.com', '', 'CPP Warehouse Section Head', 'SCH', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(181010, '181010', 'DENIANTO', 'antodeni902@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181012, '181012', 'HARIANDA SIMATUPANG', 'simatupangrian11@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(181020, '181020', 'GIOVANNY SIREGAR', 'gioregar87.gio@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(181025, '181025', 'M. DIMAS DESRATAMA', 'dimasdesratama04@gmail.com', '', 'MT Direct Sales Representative', 'SCH', '5950', 'DIKLAT / MT Department', NULL, '2019-03-04 08:18:04'),
(181069, '181069', 'JOEL PADANG', 'joelpadangpadang78894@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181093, '181093', 'AJAT SUDRAJAT', 'ajats3039@gmail.com', '', 'CPP - Formulation Crew', 'CREW', '7407', 'CPP FORMULATION', 'CPP', '2019-03-04 08:18:04'),
(181105, '181105', 'GERSON SARUMPAET', 'sibaranigerson93@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(181111, '181111', 'NORMANDI LIMAN', 'normandi1991@gmail.com', '', 'HRIS Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(181182, '181182', 'DANI NATANAEL SIAHAAN', 'daninatanael15@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(181183, '181183', 'KHARISMA ANNISA K', 'kharisma19ak@gmail.com', '', 'AR Staf JKT', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(181185, '181185', 'AYU DWI NINGTIAS', 'ayu.dwiningtyas91@gmail.com', '', 'Office Service Admin Staff', 'STAF', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(181187, '181187', 'FERI ANDRIANTO', 'feriandrianto661@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(181244, '181244', 'ALWI', 'suzukiworldindonesia@gmail.com', '', 'Big Order / Cord Order Staff', 'STAF', '7152', 'CHANNEL SALES', 'OPT', '2019-03-04 08:18:04'),
(181246, '181246', 'HAMDAN', 'hdan389@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(181280, '181280', 'IMAN AGUNG PRATAMA', 'imanagungp@gmail.com', '', 'Internal Audit Staff', 'STAF', '7494', 'Internal Audit Department', NULL, '2019-03-04 08:18:04'),
(181282, '181282', 'IMAM RIZKY SYAHPUTRA', 'rinalrizky17@gmail.com', '', 'PPIC - DCH Planner', 'SCH', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(181283, '181283', 'KARTIKA EKA PUTRI', 'kartikaputeri97@gmail.com', '', 'QC Inspector CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(181284, '181284', 'CAECILIA JESSICA UNARSO', 'jessicacaecilia@gmail.com', '', 'CPP QC/QA Supervisor', 'SNSPV', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(181288, '181288', 'CHERWIN WIJAYA', 'cherwinwijaya@gmail.com', '', 'PPIC Assistant Manager', 'JNMGR', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(181289, '181289', 'AHMAD ISMURROCHMAN', 'ahmad.ismu@gmail.com', '', 'Learning & Development Senior Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(181341, '181341', 'ANDRIAS SETRIAWAN SUSANTO', 'ndre.sbp@gmail.com', '', 'QA Supervisor KP', 'SNSPV', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(181347, '181347', 'SUTRISNA WIJAYA', 'sutrisnawijaya17teufel@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181358, '181358', 'AMBAR WAHYU WIJAYANTO', 'ambarwahyu28@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181359, '181359', 'DEDI KURNIAWAN', 'dedik4555@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181360, '181360', 'MUSLIMAN', 'muslimanduaenam@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(181361, '181361', 'RIZKANALIA', 'ryzkanalia@gmail.com', '', 'Call Center Section Head', 'SCH', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(181362, '181362', 'RIHLAH', 'rihlah93@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(181363, '181363', 'MARLINA', 'marlinabyan03@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(181370, '181370', 'ANDINI SHAFA HUSNIYAH', 'andinishafa88@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(181413, '181413', 'TAUFIK HIDAYAT', 'taufikhide22@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(181414, '181414', 'M SYAHBANI', 'banisarew@gmail.com', '', 'Diklat Flour Processing', 'CREW', '5950', 'DIKLAT / MT Department', NULL, '2019-03-04 08:18:04'),
(190039, '190039', 'MUHAMMAD HOLIK', 'cholikmuhammad20@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190047, '190047', 'JONATHAN SILITONGA', 'joeseries24@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(190055, '190055', 'NARATAMA PRADIPTA', 'naratama.pradipta@gmail.com', '', 'Site Engineer Supervisor', 'SNSPV', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(190056, '190056', 'YESSY CHING FUDIN', 'yessychingfudin@gmail.com', '', 'Ass. Chef Supervisor', 'SNSPV', '6682', 'RnD QAQC Corporate', NULL, '2019-03-04 08:18:04'),
(190057, '190057', 'NEFA EKA VIRGORA', 'nev8977@gmail.com', '', 'Plant Manager', 'SNMGR', '7818', 'CPP-Supply Division', NULL, '2019-03-04 08:18:04'),
(190058, '190058', 'AHMAD ALFIAN', 'alvian.1892@gmail.com', '', 'Drafter', 'STAF', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(190090, '190090', 'CISWANTO', 'syswanto18@gmail.com', '', 'CCTV Controller Staf', 'STAF', '5977', 'Operations Division', NULL, '2019-03-04 08:18:04'),
(190091, '190091', 'ARIF PRIANA', 'arifpriana20@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(190105, '190105', 'ADE FIRMANSYAH', 'adefirmand@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190106, '190106', 'AHMAD IYZUR RAHMAN', 'inahmod463@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190107, '190107', 'ALAMSYAH HERMAWAN', 'alamsyahhermawan@gmail.com', '', 'Accounting Staff', 'STAF', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(190161, '190161', 'ALFIYANTO JANUAR', 'alfie.solidious@gmail.com', '', 'Operation & Support Staff', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(190163, '190163', 'DANETTE PARICAN NATALIE', 'danet.natalie@gmail.com', '', 'QC Inspection Staf', 'STAF', '7175', 'Quality Control Department', 'QRD', '2019-03-04 08:18:04'),
(190217, '190217', 'WINDIRA INDAH MURISKA', 'windiraindah14@gmail.com', '', 'QA Admin', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(190218, '190218', 'RIZKI DIAN PANGESTU', 'rizkidp406@gmail.com', '', 'QC Checker CPP', 'STAF', '7769', 'QA QC SUPPLY DEPARTMENT', 'QRD', '2019-03-04 08:18:04'),
(190219, '190219', 'JACOBIS DANIEL MBOEIK', 'jacobismboeik@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190220, '190220', 'RAHMAT SANTOSO', 'rahmatgobel5@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190221, '190221', 'HARNANI ISROWATI KARIMAH', 'harnanikarimah9@gmail.com', '', 'CPP Engineering Admin Staff', 'STAF', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(190223, '190223', 'LINGGAR CAESAR', 'linggarcaesaryan@gmail.com', '', 'Store Operation Admin Officer', 'SCH', '7153', 'PMO DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(190225, '190225', 'AINUL FANANI', 'ainulfanani5@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190233, '190233', 'SALDY RENALDY', 'saldirenaldi18@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190234, '190234', 'ADI FAISAL BAZAR', 'adifaisal166@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190235, '190235', 'YUNITA KRISTANTI', '', '', 'R&D and QA/QC Corporate Senior Manager', 'SNMGR', '6682', 'RnD QAQC Corporate', NULL, '2019-03-04 08:18:04'),
(190238, '190238', 'YULITA SARI', 'yulitasari014@gmail.com', '', 'Taking Distribution Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(190258, '190258', 'ARIS SUPRIYANTO', 'arissupriyanto150105@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(190262, '190262', 'ABDUL AJID', 'ajidabizar@gmail.com', '', 'Driver', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(190265, '190265', 'ANGGARA WIDYASTANTO', 'anggarawidyastanto1995@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190266, '190266', 'AEP BUDIARTO', 'aepbudyartograbbike@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(190275, '190275', 'MOH ADNAN NURDINSYAH', 'adnannurDinsyah@gmail.com', '', 'CPP Crew Engineering', 'CREW', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(200016, 'sutarso', 'SUTARSO', 'tarsoajah20@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(200018, '200018', 'KADIM', 'kadim6125@gmail.com', '', 'CPP - FLP Section Head', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(200044, 'catur', 'CATUR SUSIANI', 'caturmudisusiani@gmail.com', '', 'Personnel Administration Section Head', 'SCH', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(200054, 'cynthia', 'CYNTHIA FELLICIANNE', 'cynthia-f@bakmigm.co.id', '', 'Human Resource Division General Manager', 'GMMGR', '5901', 'Human Resource Division', 'HRS', '2019-03-04 08:18:04'),
(200058, 'kasno', 'KASNO', 'ano290381@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(200065, 'dadan hermawan', 'DADAN HERMAWAN', 'dadan.hermawan2000@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(200074, '200074', 'JUMARNO', 'puteriwae1980@gmail.com', '', 'CPP Warehouse Crew', 'CREW', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(200087, 'budiyanto', 'BUDIYANTO', 'budiantobdy@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(201307, 'rahmat', 'RAHMAT', '', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(202003, 'thomas antonius s', 'THOMAS ANTONIUS SELANGOR', 'THOMASANTONIUS62@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(202004, '202004', 'EDI KUSWORO', 'edikusworo202@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(203001, '203001', 'ABIDIN', 'abidin.zidan.az@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(203028, 'danan manggono', 'DANAN MANGGONO', 'Danancomandnadjib@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(203029, 'asnadi', 'ASNADI', 'jalunavitha220407@gmail.com', '', 'Security Officer', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(204017, '204017', 'KWOK SIOE LIAN', 'siulian@bakmigm.co.id', '', 'Audit Analysis Manager', 'SNMGR', '7924', 'Management Audit Department', NULL, '2019-03-04 08:18:04'),
(205205, '205205', 'ROBERT EFENDI HUTABARAT', 'robertefendihutabarat@gmail.com', '', 'PPIC Assistant Manager', 'JNMGR', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(205275, '205275', 'BUDI PURNAMA', 'budipy@bakmigm.co.id', '', 'Operation Division General Manager', 'GMMGR', '5977', 'Operations Division', NULL, '2019-03-04 08:18:04'),
(206003, 'lionita', 'LIONITA YOHANES', 'Lioni.jo@gmail.com', '', 'Payroll Administration Supervisor', 'SNSPV', '5922', 'COMPENSATION & BENEFIT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(206005, '206005', 'ROLAND MATONDANG', 'rolandmatondang@gmail.com', '', 'Operation & Support Assistant Supervisor', 'JNSPV', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(206209, '206209', 'RESINTALAWATI ANGGRAENI', 'sintaa585@gmail.com', '', 'Warehouse Admin', 'STAF', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(206329, '206329', 'ANICETA MADA O AMANTI', 'oktriesa@gmail.com', '', 'Auditor', 'SNSPV', '7924', 'Management Audit Department', NULL, '2019-03-04 08:18:04'),
(206366, 'nia', 'KURNIATI', 'nheeah@gmail.com', '', 'Learning & Development Manager', 'SNMGR', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(207316, 'rico', 'RICO WIRYANTO', 'rico.wiryanto@bakmigm.co.id', '', 'Accounting & Tax Manager', 'SNMGR', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(207323, '207323', 'TUKIRIN', 'aratkirin@gmail.com', '', 'CPP - Food Processing Foreman', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(207324, '207324', 'AEP JAKARIA', 'aeplabib@gmail.com', '', 'CPP - FLP Section Head', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(207452, '207452', 'ISMAIL SALEH', 'ismailpriya20@gmail.com', '', 'Warehouse Crew', 'CREW', '6487', 'Warehouse Logistic', NULL, '2019-03-04 08:18:04'),
(207543, '207543', 'RACHMI INDITA PUTRI', 'rindhita@gmail.com', '', 'Marketing Promotion Staff', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(207625, '207625', 'MURSIDAH', 'idhawanto@gmail.com', '', 'Call Center QA Staff', 'STAF', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(208002, '208002', 'SIGIT HARTANTA', 'sigithar83@gmail.com', '', 'CPP - FLP Section Head', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(208008, 'siti', 'SITI RUKOYAH', 'rukoyahsiti00@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(208136, '208136', 'ARIE YANSARI', 'ay080112@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(208152, '208152', 'DEVINA GLORYA ESTHER', 'devinaglorya24@gmail.com', '', 'General Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(208171, '208171', 'ZAINAL ARIFIN', 'zainal230584@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(208205, 'linday', 'LINDA YUSNIAWATI', 'fanemanda1006@gmail.com', '', 'Industrial Relation Admin Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(208519, '208519', 'VINA ELVIRA SAVITRI', 'vinasiagian22@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(209030, '209030', 'JUNDAH SITI WAHYUNI', 'jundahsitiwahyuni@gmail.com', '', 'Warehouse Admin', 'STAF', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(209067, 'retno', 'RETNO TRISNANINGSIH', 'retnotrisnaningsih@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(209397, 'nuryati', 'NURYATI', 'aina23691@gmail.com', '', 'Field Recruiter', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(209420, '209420', 'KUNDRAT BASRI', 'kundrat01@gmail.com', '', 'Cooperatives Specialist', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(209561, '209561', 'SRI WIDODO', 'sriwidodo878@gmail.com', '', 'Operation Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(209656, 'rustazidumalang', 'RUSTAZI DUMALANG', 'azinisha23@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(209686, '209686', 'IRA KURNIAWATI', 'ira.kurniawati.bgm@gmail.com', '', 'BPI Admin', 'STAF', '7550', 'BUSINESS PROCESS IMPROVEMENT', NULL, '2019-03-04 08:18:04'),
(210007, '210007', 'YUSUP SUHARDJAPRAJA', 'yusup.suhardjapraja@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210024, '210024', 'MUKHLASIN', 'mukhlas.ved@gmail.com', '', 'Delivery Service Assistant Manager', 'JNMGR', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(210028, '210028', 'DECY SELVIANA', 'decyselvi@gmail.com', '', 'CPP - Food Processing Supervisor', 'SNSPV', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210033, '210033', 'TRI NURYATNO', 'trinuryatno19@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(210078, '210078', 'MUHAMMAD LUKMAN HAKIM', 'oemarlukman@gmail.com', '', 'CPP Warehouse Section Head', 'SCH', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(210102, '210102', 'IKHWANI', 'iwanportugal84@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210120, '210120', 'RACHMAH YURIS TRIANA', 'rachmah.yuris@gmail.com', '', 'Regional 1 Training Supervisor', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(210301, '210301', 'DOAN SURYO WIJAYA', 'doansurya@gmail.com', '', 'Process Engineer', 'SNSPV', '7818', 'CPP-Supply Division', NULL, '2019-03-04 08:18:04'),
(210302, '210302', 'LANGGENG BUDIMAN', 'langgengbudiman3@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210325, '210325', 'ACHMAD NURDIN', 'nurdinachmad87@gmail.com', '', 'CPP - Food Processing Foreman', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210326, 'erlina', 'ERLINA', 'erlina.sihaloho79@gmail.com', '', 'Performance Management Specialist', 'SNSPV', '7239', 'Performance Management & People Development', 'HRS', '2019-03-04 08:18:04'),
(210350, '210350', 'M SUHANDI', 'msuhandi210350@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210419, '210419', 'OPIK TAUFIK', 'bangopik14@gmail.com', '', 'CPP - Food Processing Foreman', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(210545, 'mohamaddapithidayat1', 'MOHAMAD DAPIT HIDAYAT', 'dapithidayat61701@gmail.com', '', 'Cleaning Service Crew', 'CREW', '6573', 'Office Service Department', 'EnS', '2019-03-04 08:18:04'),
(210546, '210546', 'INDRA', 'indra250285@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(210569, 'aditya', 'ADITYA W', 'aditya@bakmigm.co.id', '', 'HR Support Assistant Manager', 'JNMGR', '7527', 'Human Resources Support', 'HRS', '2019-03-04 08:18:04'),
(210638, 'fitri', 'FITRIA HANDAYANI VALENTINA', 'fitriahazim@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(210643, '210643', 'ARINY WIDYASI', 'widyasi.ariny@gmail.com', '', 'Operation Support Specialist', 'SCH', '5977', 'Operations Division', NULL, '2019-03-04 08:18:04'),
(210649, '210649', 'HERLINA PATRISIA', 'patzie.patzie@gmail.com', '', 'Design Assistant Manager', 'JNMGR', '5893', 'Building Project', 'BDD', '2019-03-04 08:18:04'),
(211104, '211104', 'HANI AGUSTIANI', 'hanyagustiani5@gmail.com', '', 'Account Payable Staff', 'STAF', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(211108, '211108', 'IGNATIUS SURONO ARIE W', 'arisurono@gmail.com', '', 'Operational Trainer', 'SNSPV', '5926', 'LEARNING & DEVELOPMENT DEPARTMENT', 'HRS', '2019-03-04 08:18:04'),
(211116, '211116', 'BUDI PRIYADI', 'dhenyakecil@gmail.com', '', 'CPP - Food Processing Foreman', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211117, '211117', 'NUR KHOLIK', 'nhurqholik389@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211118, '211118', 'SYAHRONI', 'syhroni1933@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211124, '211124', 'NUR ABDILAH B MAHMUD', 'nurabdilahb@gmail.com', '', 'CPP - Food Processing Section Head', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211171, 'eka', 'EKA WAHYU HARYANINGSIH', 'eka.wahyu58@gmail.com', '', 'Recruitment Specialist', 'STAF', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(211172, '211172', 'YANTO SITUMORANG', 'liya.maylonidas@gmail.com', '', 'CPP - Food Processing Foreman', 'SCH', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211214, '211214', 'SOHIRIN', 'javiercaem@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211244, '211244', 'AGUS WIBOWO', 'aguswibowo14@gmail.com', '', 'PPIC Staff', 'STAF', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(211251, '211251', 'RUSLI SETYADI', 'Ruslijawa21@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211252, '211252', 'EKO MULYONO', 'bondanazkamaliq7@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211362, 'mardianah', 'MARDIANAH', 'mardianahdian03@gmail.com', '', 'Personnel Administration Staff', 'STAF', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(211363, '211363', 'CAECILIA NOVIANTARI', 'caecilia.noviantari@gmail.com', '', 'Account Payable Supervisor', 'SNSPV', '7762', 'Finance Account Payable & Expenses', NULL, '2019-03-04 08:18:04'),
(211374, 'maudy', 'MAUDY FITRIANI IRANDA', 'irandamaudy@gmail.com', '', 'Recruitment Assistant Manager', 'JNMGR', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(211520, '211520', 'HARTO KARTONO B. SUDARMO', 'tombolsaputra2@gmail.com', '', 'CPP - Food Processing Crew', 'CREW', '7596', 'CPP - FOOD PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211577, 'rita', 'RITA RAESITA', 'rita.raesita@bakmigm.co.id', '', 'Recruitment Manager', 'SNMGR', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(211644, '211644', 'JAKA', 'jakanazwa27@gmail.com', '', 'CPP - FLP Crew', 'CREW', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(211647, '211647', 'MUSFADILAH', 'vierabenjamal@gmail.com', '', 'Call Center Section Head', 'SCH', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(211714, '211714', 'WULANTIKA PRAMADANTI', 'wulantikapramadanti2@gmail.com', '', 'Delivery Service Supervisor', 'SNSPV', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(211716, '211716', 'GUPATRA MARINGGALA', 'gupatramarinngala@gmail.com', '', 'Call Center Section Head', 'SCH', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(211752, '211752', 'SUGIYANTO', 'sugiyanto1312@gmail.com', '', 'Cooperatives Supervisor', 'SNSPV', '5904', 'Industrial Relation, Cooperatives & Personnel Admin ', 'HRS', '2019-03-04 08:18:04'),
(211754, '211754', 'EKO WALUYO', 'ekowaluyo14041988@gmail.com', '', 'CPP PPIC & Warehouse Specialist', 'STAF', '7083', 'CPP PPIC & WAREHOUSE', 'CPP', '2019-03-04 08:18:04'),
(211761, '211761', 'FAIRDI SETIAWAN', 'fairdisetiawan@gmail.com', '', 'PPIC Assistant Supervisor', 'JNSPV', '6467', 'PPIC', 'SUPL', '2019-03-04 08:18:04'),
(211829, '211829', 'DERI JULFIKAR', 'dery1234.di@gmail.com', '', 'CPP Engineering Section Head', 'SCH', '7080', 'CPP ENGINEERING', 'CPP', '2019-03-04 08:18:04'),
(211875, 'andrey', 'CHRISANTUS ANDREY T', 'mantabman@gmail.com', '', 'People Development Assistant Manager', 'JNMGR', '7239', 'Performance Management & People Development', 'HRS', '2019-03-04 08:18:04'),
(211939, 'andi', 'ANDI', 'andi.k.allwin@gmail.com', '', 'Technology & Development Assistant Manager', 'JNMGR', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(212015, '212015', 'KAMAL ALAMSYAH', 'kamalamsyah@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(212018, '212018', 'MERRY MERDIANA', 'diey25.md@gmail.com', '', 'Warehouse Admin', 'STAF', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(212046, '212046', 'TEGUH NURANDI', 'teguh.tolhe@gmail.com', '', 'CPP - FLP Foreman', 'SCH', '7591', 'CPP - FLOUR PROCESSING', 'CPP', '2019-03-04 08:18:04'),
(212050, '212050', 'YUDI WIBOWO', 'yuddiwibowwo@gmail.com', '', 'Warehouse Section Head', 'SCH', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(212126, '212126', 'AGUSTINUS TRIJARWANTO', 'agustnustrij@gmail.com', '', 'AR Staf Non JKT & CO', 'STAF', '7761', 'Finance Account Receivable', NULL, '2019-03-04 08:18:04'),
(212127, '212127', 'LASTIURMA SINTJE', 'lastysintje@gmail.com', '', 'Field Trip & Birthday Staf', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(212139, '212139', 'R. WIJATMOKO', 'rwijatmoko82@gmail.com', '', 'Cash Management Staff', 'STAF', '6551', 'Finance Department', NULL, '2019-03-04 08:18:04'),
(212190, '212190', 'MARTHA SUSANTI', 'marthasusanti.ishak@gmail.com', '', 'Marketing Promotion Support', 'STAF', '5882', 'Marketing', 'BDD', '2019-03-04 08:18:04'),
(212244, '212244', 'RIKY', 'rikyriq@gmail.com', '', 'Costing Supervisor', 'SNSPV', '6837', 'Costing Department', 'FAST', '2019-03-04 08:18:04'),
(212335, '212335', 'VERRY SUNARYA', 'fx.verry@gmail.com', '', 'Infrastruktur & Network Supervisor', 'SNSPV', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(212383, '212383', 'NIDIA', 'nidia.lie@gmail.com', '', 'BPI Supervisor', 'SNSPV', '7550', 'BUSINESS PROCESS IMPROVEMENT', NULL, '2019-03-04 08:18:04'),
(212413, '212413', 'BENING WIJI HERMANTO', 'bening.wiji@gmail.com', '', 'R&D Specialist', 'SNSPV', '7555', 'R&D', 'QRD', '2019-03-04 08:18:04'),
(212546, '212546', 'DEASY INDRIYANI HALIM', 'deasy.indriyani.halim@gmail.com', '', 'Assistant Store Performance Analyst Manager', 'JNMGR', '7562', 'STORE PERFORMANCE ANALYST DEPARTMENT', 'OPT', '2019-03-04 08:18:04'),
(212798, '212798', 'VONNY MELINDA', 'vonnymelinda1987@gmail.com', '', 'General Accounting Supervisor', 'SNSPV', '6540', 'Accounting & Tax Department', 'FAST', '2019-03-04 08:18:04'),
(212825, '212825', 'RIDHA MERISHA', 'ridha.merisha@gmail.com', '', 'Store Engineering Admin Staf', 'STAF', '7151', 'Engineering Store Department', 'OPT', '2019-03-04 08:18:04'),
(212970, '212970', 'DOHARMA SILALOHO', 'doharma.sihaloho78@gmail.com', '', 'Warehouse Supervisor', 'SNSPV', '6680', 'Warehouse Office', NULL, '2019-03-04 08:18:04'),
(880001, '880001', 'NANA HARYADI', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880002, '880002', 'DECKI SUPRIANTO', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880003, '880003', 'AHMAD SETIAWAN', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880004, '880004', 'AHMAD FAISAL', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880005, '880005', 'AGUS PERMANA', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880006, '880006', 'JANUARI JONFERY MARBUN', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880007, '880007', 'RAMAYANSYAH', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880008, '880008', 'AMIRRUDDIN', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880009, '880009', 'UJANG SOLEHUDIN', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880010, '880010', 'AHMAD GUNAWAN', '', '', 'Security Outsource', 'STAF', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880011, '880011', 'HARISAL AULIA', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880012, '880012', 'RAHMAT', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880013, '880013', 'WARDI SAPUTRA', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880014, '880014', 'M RIZKI ALFIAN', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880015, '880015', 'APRIADI', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880016, '880016', 'KARNAN', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880017, '880017', 'ASEP KUSTIYAWAN', '', '', 'Office Boy Outsource', 'CREW', '6968', 'CPP', NULL, '2019-03-04 08:18:04'),
(880030, '880030', 'MUHAMAD FIRDAUS', 'dausbsd6@gmail.com', '', 'Security Outsource Store / DC', 'CREW', '7714', 'Security Outsource Department', NULL, '2019-03-04 08:18:04'),
(880031, '880031', 'IWAN NANDAR', '', '', 'Security Outsource Store / DC', 'CREW', '7714', 'Security Outsource Department', NULL, '2019-03-04 08:18:04'),
(910007, '910007', 'LINA GUNAWAN', '', '', 'Business Development Manager', 'SNMGR', '5898', 'Business Development', 'BDD', '2019-03-04 08:18:04'),
(915041, '915041', 'ALIKA LAILA RAHMI', 'Alikalaila96@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(915108, '915108', 'SYAFINATUNAJA', 'syafinatunaja06@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(915130, '915130', 'AMALIA NURHIKMAH', 'anurhikmah88@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(916035, '916035', 'AYU HANDAYANI', 'Ayuhandayani98@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(916108, '916108', 'ALFIAH', 'Alfiah337@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(917036, '917036', 'SITI FATIMAH', 'sitifatimah101010@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(917101, '917101', 'JAENUDIN RAMDAN', 'jaenudinramdan@gmail.com', '', 'Recruitment Admin Staff Part-timer', 'CREW', '5942', 'Recruitment Department', 'HRS', '2019-03-04 08:18:04'),
(918007, '918007', 'SALMA NISA', 'salmanissa43@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(918008, '918008', 'SULISTIANI', 'stiani148@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(918009, '918009', 'WANDA SRIALIMAH NINGSIH', 'wanda.kijung@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(918013, '918013', 'WIRDAH HADEINAH', 'hadeinahwirdah@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(918025, '918025', 'RIZCHA FAUZIAH', 'rizchafauziahhh@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(918075, '918075', 'AZIZ AL ISRA', '', '', 'IT Part - Timer', 'STAF', '6563', 'Information Technology Department', 'FAST', '2019-03-04 08:18:04'),
(919001, '919001', 'FADIYAH YAHYA', 'biahyahya01@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(919002, '919002', 'HESTY SETYAWATI', 'hestihs98@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04'),
(919003, '919003', 'LINTANG RAHAYU', 'lintangr03@gmail.com', '', 'Taking Order Officer', 'CREW', '6458', 'Delivery Section', NULL, '2019-03-04 08:18:04');

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
(140491, '', '', 'PENCIPTA', '', '', '', ''),
(150521, '', '', 'PENCIPTA', '', '', '', ''),
(170236, '', '', 'PENCIPTA', '', '', '', ''),
(171251, '', '', 'PENCIPTA', '', '', '', ''),
(171270, '', '', 'ATASAN PENCIPTA', '', '', '', ''),
(171314, '', '', 'PENCIPTA', '', '', '', ''),
(180887, '', '', 'PENCIPTA', '', '', '', ''),
(200054, '', '', 'ATASAN PENCIPTA', '', '', '', ''),
(206366, '', '', 'PENCIPTA', '', '', '', ''),
(207316, '', '', 'PENCIPTA', '', '', '', ''),
(210569, '', '', 'PENCIPTA', '', '', '', ''),
(211577, '', '', 'PENCIPTA', '', '', '', '');

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
  `RS_INDEX` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`RS_ID`, `RS_DESC`, `RS_BY`, `RS_TIME`, `RS_INDEX`) VALUES
('ADMIN DOKUMEN', 'Admin dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 3),
('ADMIN KONFIGURASI', 'Konfigurasi aplikasi', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 5),
('ATASAN PENCIPTA', 'Atasan pencipta dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 1),
('PENCIPTA', 'Pencipta dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4),
('PENDISTRIBUSI', 'Distribusi dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 2),
('PENGGUNA', 'Pengguna dokumen', 'ADMIN KONFIGURASI', '2019-01-22 23:34:23', 4);

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
-- AUTO_INCREMENT for table `m_icon`
--
ALTER TABLE `m_icon`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_log`
--
ALTER TABLE `m_log`
  MODIFY `LogID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `NEWS_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=785;
--
-- AUTO_INCREMENT for table `tb_document_notification`
--
ALTER TABLE `tb_document_notification`
  MODIFY `NOTIF_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
