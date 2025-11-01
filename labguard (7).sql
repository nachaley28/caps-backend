-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2025 at 06:05 PM
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
-- Database: `labguard`
--

-- --------------------------------------------------------

--
-- Table structure for table `computer_equipments`
--

CREATE TABLE `computer_equipments` (
  `pc_name` varchar(50) DEFAULT NULL,
  `lab_name` varchar(100) DEFAULT NULL,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specs`)),
  `id` varchar(255) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `other_parts` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_equipments`
--

INSERT INTO `computer_equipments` (`pc_name`, `lab_name`, `specs`, `id`, `lab_id`, `other_parts`) VALUES
('1', '1', '{\"monitor\":1,\"systemUnit\":1,\"keyboard\":1,\"mouse\":1,\"headphone\":1,\"hdmi\":1,\"power\":1,\"wifi\":1}', '72821404', 0, NULL),
('2', '1', '{\"monitor\":2,\"systemUnit\":2,\"keyboard\":2,\"mouse\":2,\"headphone\":2,\"hdmi\":2,\"power\":2,\"wifi\":2}', '77842792', 0, NULL),
('3', '1', '{\"monitor\":3,\"systemUnit\":3,\"keyboard\":3,\"mouse\":3,\"headphone\":3,\"hdmi\":3,\"power\":3,\"wifi\":3}', '69366564', 0, NULL),
('4', '1', '{\"monitor\":4,\"systemUnit\":4,\"keyboard\":4,\"mouse\":4,\"headphone\":4,\"hdmi\":4,\"power\":4,\"wifi\":4}', '55393272', 0, NULL),
('5', '1', '{\"monitor\":5,\"systemUnit\":5,\"keyboard\":5,\"mouse\":5,\"headphone\":5,\"hdmi\":5,\"power\":5,\"wifi\":5}', '38973086', 0, NULL),
('6', '1', '{\"monitor\":6,\"systemUnit\":6,\"keyboard\":6,\"mouse\":6,\"headphone\":6,\"hdmi\":6,\"power\":6,\"wifi\":6}', '81432790', 0, NULL),
('7', '1', '{\"monitor\":7,\"systemUnit\":7,\"keyboard\":7,\"mouse\":7,\"headphone\":7,\"hdmi\":7,\"power\":7,\"wifi\":7}', '24495639', 0, NULL),
('8', '1', '{\"monitor\":8,\"systemUnit\":8,\"keyboard\":8,\"mouse\":8,\"headphone\":8,\"hdmi\":8,\"power\":8,\"wifi\":8}', '39074966', 0, NULL),
('9', '1', '{\"monitor\":9,\"systemUnit\":9,\"keyboard\":9,\"mouse\":9,\"headphone\":9,\"hdmi\":9,\"power\":9,\"wifi\":9}', '79904411', 0, NULL),
('10', '1', '{\"monitor\":10,\"systemUnit\":10,\"keyboard\":10,\"mouse\":10,\"headphone\":10,\"hdmi\":10,\"power\":10,\"wifi\":10}', '66934248', 0, NULL),
('11', '1', '{\"monitor\":11,\"systemUnit\":11,\"keyboard\":11,\"mouse\":11,\"headphone\":11,\"hdmi\":11,\"power\":11,\"wifi\":11}', '51329200', 0, NULL),
('12', '1', '{\"monitor\":12,\"systemUnit\":12,\"keyboard\":12,\"mouse\":12,\"headphone\":12,\"hdmi\":12,\"power\":12,\"wifi\":12}', '37073481', 0, NULL),
('13', '1', '{\"monitor\":13,\"systemUnit\":13,\"keyboard\":13,\"mouse\":13,\"headphone\":13,\"hdmi\":13,\"power\":13,\"wifi\":13}', '31766817', 0, NULL),
('14', '1', '{\"monitor\":14,\"systemUnit\":14,\"keyboard\":14,\"mouse\":14,\"headphone\":14,\"hdmi\":14,\"power\":14,\"wifi\":14}', '44244327', 0, NULL),
('15', '1', '{\"monitor\":15,\"systemUnit\":15,\"keyboard\":15,\"mouse\":15,\"headphone\":15,\"hdmi\":15,\"power\":15,\"wifi\":15}', '21590766', 0, NULL),
('16', '1', '{\"monitor\":16,\"systemUnit\":16,\"keyboard\":16,\"mouse\":16,\"headphone\":16,\"hdmi\":16,\"power\":16,\"wifi\":16}', '20584342', 0, NULL),
('17', '1', '{\"monitor\":17,\"systemUnit\":17,\"keyboard\":17,\"mouse\":17,\"headphone\":17,\"hdmi\":17,\"power\":17,\"wifi\":17}', '33333085', 0, NULL),
('18', '1', '{\"monitor\":18,\"systemUnit\":18,\"keyboard\":18,\"mouse\":18,\"headphone\":18,\"hdmi\":18,\"power\":18,\"wifi\":18}', '99614355', 0, NULL),
('19', '1', '{\"monitor\":19,\"systemUnit\":19,\"keyboard\":19,\"mouse\":19,\"headphone\":19,\"hdmi\":19,\"power\":19,\"wifi\":19}', '88374869', 0, NULL),
('20', '1', '{\"monitor\":20,\"systemUnit\":20,\"keyboard\":20,\"mouse\":20,\"headphone\":20,\"hdmi\":20,\"power\":20,\"wifi\":20}', '71536005', 0, NULL),
('21', '1', '{\"monitor\":21,\"systemUnit\":21,\"keyboard\":21,\"mouse\":21,\"headphone\":21,\"hdmi\":21,\"power\":21,\"wifi\":21}', '21506841', 0, NULL),
('22', '1', '{\"monitor\":22,\"systemUnit\":22,\"keyboard\":22,\"mouse\":22,\"headphone\":22,\"hdmi\":22,\"power\":22,\"wifi\":22}', '45434386', 0, NULL),
('23', '1', '{\"monitor\":23,\"systemUnit\":23,\"keyboard\":23,\"mouse\":23,\"headphone\":23,\"hdmi\":23,\"power\":23,\"wifi\":23}', '59056086', 0, NULL),
('24', '1', '{\"monitor\":24,\"systemUnit\":24,\"keyboard\":24,\"mouse\":24,\"headphone\":24,\"hdmi\":24,\"power\":24,\"wifi\":24}', '42306185', 0, NULL),
('25', '1', '{\"monitor\":25,\"systemUnit\":25,\"keyboard\":25,\"mouse\":25,\"headphone\":25,\"hdmi\":25,\"power\":25,\"wifi\":25}', '26443980', 0, NULL),
('26', '1', '{\"monitor\":26,\"systemUnit\":26,\"keyboard\":26,\"mouse\":26,\"headphone\":26,\"hdmi\":26,\"power\":26,\"wifi\":26}', '61104341', 0, NULL),
('27', '1', '{\"monitor\":27,\"systemUnit\":27,\"keyboard\":27,\"mouse\":27,\"headphone\":27,\"hdmi\":27,\"power\":27,\"wifi\":27}', '74171606', 0, NULL),
('28', '1', '{\"monitor\":28,\"systemUnit\":28,\"keyboard\":28,\"mouse\":28,\"headphone\":28,\"hdmi\":28,\"power\":28,\"wifi\":28}', '91131838', 0, NULL),
('29', '1', '{\"monitor\":29,\"systemUnit\":29,\"keyboard\":29,\"mouse\":29,\"headphone\":29,\"hdmi\":29,\"power\":29,\"wifi\":29}', '37548473', 0, NULL),
('30', '1', '{\"monitor\":30,\"systemUnit\":30,\"keyboard\":30,\"mouse\":30,\"headphone\":30,\"hdmi\":30,\"power\":30,\"wifi\":30}', '20152012', 0, NULL),
('31', '1', '{\"monitor\":31,\"systemUnit\":31,\"keyboard\":31,\"mouse\":31,\"headphone\":31,\"hdmi\":31,\"power\":31,\"wifi\":31}', '73191630', 0, NULL),
('32', '1', '{\"monitor\":32,\"systemUnit\":32,\"keyboard\":32,\"mouse\":32,\"headphone\":32,\"hdmi\":32,\"power\":32,\"wifi\":32}', '62964170', 0, NULL),
('33', '1', '{\"monitor\":33,\"systemUnit\":33,\"keyboard\":33,\"mouse\":33,\"headphone\":33,\"hdmi\":33,\"power\":33,\"wifi\":33}', '72510621', 0, NULL),
('34', '1', '{\"monitor\":34,\"systemUnit\":34,\"keyboard\":34,\"mouse\":34,\"headphone\":34,\"hdmi\":34,\"power\":34,\"wifi\":34}', '13053688', 0, NULL),
('35', '1', '{\"monitor\":35,\"systemUnit\":35,\"keyboard\":35,\"mouse\":35,\"headphone\":35,\"hdmi\":35,\"power\":35,\"wifi\":35}', '40868094', 0, NULL),
('36', '1', '{\"monitor\":36,\"systemUnit\":36,\"keyboard\":36,\"mouse\":36,\"headphone\":36,\"hdmi\":36,\"power\":36,\"wifi\":36}', '32066666', 0, NULL),
('37', '1', '{\"monitor\":37,\"systemUnit\":37,\"keyboard\":37,\"mouse\":37,\"headphone\":37,\"hdmi\":37,\"power\":37,\"wifi\":37}', '41873000', 0, NULL),
('38', '1', '{\"monitor\":38,\"systemUnit\":38,\"keyboard\":38,\"mouse\":38,\"headphone\":38,\"hdmi\":38,\"power\":38,\"wifi\":38}', '72358943', 0, NULL),
('39', '1', '{\"monitor\":39,\"systemUnit\":39,\"keyboard\":39,\"mouse\":39,\"headphone\":39,\"hdmi\":39,\"power\":39,\"wifi\":39}', '84833910', 0, NULL),
('40', '1', '{\"monitor\":40,\"systemUnit\":40,\"keyboard\":40,\"mouse\":40,\"headphone\":40,\"hdmi\":40,\"power\":40,\"wifi\":40}', '87667261', 0, NULL),
('41', '1', '{\"monitor\":41,\"systemUnit\":41,\"keyboard\":41,\"mouse\":41,\"headphone\":41,\"hdmi\":41,\"power\":41,\"wifi\":41}', '17566630', 0, NULL),
('42', '1', '{\"monitor\":42,\"systemUnit\":42,\"keyboard\":42,\"mouse\":42,\"headphone\":42,\"hdmi\":42,\"power\":42,\"wifi\":42}', '15013909', 0, NULL),
('43', '1', '{\"monitor\":43,\"systemUnit\":43,\"keyboard\":43,\"mouse\":43,\"headphone\":43,\"hdmi\":43,\"power\":43,\"wifi\":43}', '56272568', 0, NULL),
('44', '1', '{\"monitor\":44,\"systemUnit\":44,\"keyboard\":44,\"mouse\":44,\"headphone\":44,\"hdmi\":44,\"power\":44,\"wifi\":44}', '73744904', 0, NULL),
('45', '1', '{\"monitor\":45,\"systemUnit\":45,\"keyboard\":45,\"mouse\":45,\"headphone\":45,\"hdmi\":45,\"power\":45,\"wifi\":45}', '37968846', 0, NULL),
('46', '1', '{\"monitor\":46,\"systemUnit\":46,\"keyboard\":46,\"mouse\":46,\"headphone\":46,\"hdmi\":46,\"power\":46,\"wifi\":46}', '21580784', 0, NULL),
('47', '1', '{\"monitor\":47,\"systemUnit\":47,\"keyboard\":47,\"mouse\":47,\"headphone\":47,\"hdmi\":47,\"power\":47,\"wifi\":47}', '62410569', 0, NULL),
('48', '1', '{\"monitor\":48,\"systemUnit\":48,\"keyboard\":48,\"mouse\":48,\"headphone\":48,\"hdmi\":48,\"power\":48,\"wifi\":48}', '88938699', 0, NULL),
('49', '1', '{\"monitor\":49,\"systemUnit\":49,\"keyboard\":49,\"mouse\":49,\"headphone\":49,\"hdmi\":49,\"power\":49,\"wifi\":49}', '27097695', 0, NULL),
('50', '1', '{\"monitor\":50,\"systemUnit\":50,\"keyboard\":50,\"mouse\":50,\"headphone\":50,\"hdmi\":50,\"power\":50,\"wifi\":50}', '28878072', 0, NULL),
('900', '1', '{\"monitor\":\"jh\",\"systemUnit\":\"bvh\",\"keyboard\":\"jjkk\",\"mouse\":\"rtt\",\"headphone\":\"tyty\",\"hdmi\":\"vvb\",\"power\":\"ghftyy\",\"wifi\":\"gg\"}', '43995053', 4, NULL),
('80', '1', '{\"monitor\":\"t\",\"systemUnit\":\",m\",\"keyboard\":\"m\",\"mouse\":\"jj\",\"headphone\":\",\",\"hdmi\":\"k\",\"power\":\"h\",\"wifi\":\"jh\"}', '62244473', 4, NULL),
('51', '1', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '46578552', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `computer_status`
--

CREATE TABLE `computer_status` (
  `com_id` text NOT NULL DEFAULT 'operational',
  `hdmi` text NOT NULL DEFAULT 'operational',
  `headphone` text NOT NULL DEFAULT 'operational',
  `keyboard` text NOT NULL DEFAULT 'operational',
  `monitor` text NOT NULL DEFAULT 'operational',
  `mouse` text NOT NULL DEFAULT 'operational',
  `power` text NOT NULL DEFAULT 'operational',
  `systemUnit` text NOT NULL DEFAULT 'operational',
  `wifi` text NOT NULL DEFAULT 'operational',
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_status`
--

INSERT INTO `computer_status` (`com_id`, `hdmi`, `headphone`, `keyboard`, `monitor`, `mouse`, `power`, `systemUnit`, `wifi`, `status_id`) VALUES
('72821404', 'damaged', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 17514246),
('77842792', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 87879077),
('69366564', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 58981200),
('55393272', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 29796364),
('38973086', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 90461959),
('81432790', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 91722725),
('24495639', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 69902867),
('39074966', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 93333304),
('79904411', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 58690618),
('66934248', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 96265134),
('51329200', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 47935692),
('37073481', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 34185550),
('31766817', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 96692688),
('44244327', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 57962805),
('21590766', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 67697354),
('20584342', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 83653946),
('33333085', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 90226836),
('99614355', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 76054338),
('88374869', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 50393670),
('71536005', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 51574560),
('21506841', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 62505752),
('45434386', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 75314235),
('59056086', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 40849197),
('42306185', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 81345039),
('26443980', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 52778214),
('61104341', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 15897305),
('74171606', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 93388080),
('91131838', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 64208085),
('37548473', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 65888394),
('20152012', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 89365602),
('73191630', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 40749704),
('62964170', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 22255819),
('72510621', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 91937588),
('13053688', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 82716434),
('40868094', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 25799870),
('32066666', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 72999815),
('41873000', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 65730651),
('72358943', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 48450302),
('84833910', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 18613643),
('87667261', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 68419870),
('17566630', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 92693112),
('15013909', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 48739653),
('56272568', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 56154517),
('73744904', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 59678249),
('37968846', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 66300545),
('21580784', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 76394065),
('62410569', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 56024759),
('88938699', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 76114566),
('27097695', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 17677327),
('28878072', 'operational', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 77265419),
('43995053', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 67737470),
('62244473', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 31818034),
('46578552', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 64674896);

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `lab_id` int(11) NOT NULL,
  `lab_name` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`lab_id`, `lab_name`, `location`) VALUES
(3, '90', '4'),
(4, '1', 'EL Building');

-- --------------------------------------------------------

--
-- Table structure for table `other_part_status`
--

CREATE TABLE `other_part_status` (
  `com_id` int(11) NOT NULL,
  `parts` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `com_id` varchar(50) DEFAULT NULL,
  `part` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `lab` varchar(100) DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT 'System',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `solution_done` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `com_id`, `part`, `status`, `lab`, `submitted_by`, `notes`, `created_at`, `sent`, `solution_done`) VALUES
(258, '72821404', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 1, 0),
(259, '77842792', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 1, 0),
(260, '69366564', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(261, '55393272', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(262, '38973086', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(263, '81432790', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(264, '24495639', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(265, '39074966', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(266, '79904411', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(267, '66934248', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(268, '51329200', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(269, '37073481', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(270, '31766817', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(271, '44244327', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(272, '21590766', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(273, '20584342', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(274, '33333085', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(275, '99614355', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(276, '88374869', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(277, '71536005', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(278, '21506841', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(279, '45434386', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(280, '59056086', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(281, '42306185', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(282, '26443980', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(283, '61104341', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(284, '74171606', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(285, '91131838', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(286, '37548473', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(287, '20152012', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(288, '73191630', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(289, '62964170', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(290, '72510621', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(291, '13053688', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(292, '40868094', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(293, '32066666', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(294, '41873000', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(295, '72358943', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(296, '84833910', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(297, '87667261', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(298, '17566630', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(299, '15013909', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(300, '56272568', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(301, '73744904', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(302, '37968846', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(303, '21580784', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(304, '62410569', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(305, '88938699', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(306, '27097695', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(307, '28878072', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-11-01 13:15:52', 0, 0),
(308, '61104341', NULL, 'Damaged', '1', 'System', 'hdmi issue detected', '2025-11-01 13:32:35', 0, 0),
(309, '72821404', NULL, 'Damaged', '1', 'System', 'hdmi issue detected', '2025-11-01 16:34:32', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `technician_logs`
--

CREATE TABLE `technician_logs` (
  `report_id` text NOT NULL,
  `fix_id` text NOT NULL,
  `issue_found` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `solution` text NOT NULL,
  `status` text NOT NULL,
  `technician_email` text NOT NULL,
  `fix_time` datetime NOT NULL DEFAULT current_timestamp(),
  `sent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technician_logs`
--

INSERT INTO `technician_logs` (`report_id`, `fix_id`, `issue_found`, `solution`, `status`, `technician_email`, `fix_time`, `sent`) VALUES
('65351747', '40569113', '{\'lab\': \'10\', \'PC_Number\': \'2\', \'status\': \'Notoperational\', \'notes\': \'headphone issue detected\'}', 'hehe', 'operational', '1@gmail.com', '2025-10-23 15:06:10', 1),
('308', '92271416', '{\'lab\': \'1\', \'PC_Number\': \'26\', \'status\': \'Damaged\', \'notes\': \'hdmi issue detected\'}', 'Repaired', 'operational', '1@gmail.com', '2025-11-01 21:33:23', 1),
('258', '93710901', '{\'lab\': \'1\', \'PC_Number\': \'1\', \'status\': \'Notoperational\', \'notes\': \'keyboard issue detected\'}', 'Replaced', 'operational', '1@gmail.com', '2025-11-01 23:01:25', 0),
('258', '90856197', '{\'lab\': \'1\', \'PC_Number\': \'1\', \'status\': \'Notoperational\', \'notes\': \'keyboard issue detected\'}', 'Replaced', 'operational', '1@gmail.com', '2025-11-01 23:11:38', 0),
('258', '43441154', '{\'lab\': \'1\', \'PC_Number\': \'1\', \'status\': \'Notoperational\', \'notes\': \'keyboard issue detected\'}', 'Repaired', 'Damaged', '1@gmail.com', '2025-11-01 23:12:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `lgid` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `role` text NOT NULL,
  `year` text DEFAULT NULL,
  `password` text NOT NULL,
  `profile` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT 'Not specified',
  `position` varchar(100) DEFAULT 'Not Specified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`lgid`, `name`, `email`, `role`, `year`, `password`, `profile`, `department`, `position`) VALUES
('AD-123456', 'Ryan Valeriano', 'rcvaleriano.ui@phinmaed.com', 'Admin', NULL, '123456789', 'ryan.jpg', 'CITE Department', 'Dean'),
('', '', '', '', NULL, '', '', 'CITE DEPARTMENT', 'Faculty Member'),
('10', '1', '1@gmail.com', 'ITSD', '1', '1', '2024-06-13-222542610.jpeg', 'Not specified', 'Not Specified'),
('DEAN-12345678', 'Seth Nono', 'seth@gmail.com', 'Dean', NULL, '1', '', 'CITE', 'Dean');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `other_part_status`
--
ALTER TABLE `other_part_status`
  ADD PRIMARY KEY (`com_id`,`parts`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
