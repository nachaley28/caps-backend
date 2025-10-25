-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2025 at 02:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `lab_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_equipments`
--

INSERT INTO `computer_equipments` (`pc_name`, `lab_name`, `specs`, `id`, `lab_id`) VALUES
('1', '90', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '66162603', 3),
('4', '10', '{\"monitor\":\"4\",\"systemUnit\":\"4\",\"keyboard\":\"4\",\"mouse\":\"4\",\"headphone\":\"4\",\"hdmi\":\"4\",\"power\":\"4\",\"wifi\":\"4\"}', '89523799', 4),
('2', '10', '{\"monitor\":\"2\",\"systemUnit\":\"2\",\"keyboard\":\"2\",\"mouse\":\"2\",\"headphone\":\"2\",\"hdmi\":\"2\",\"power\":\"2\",\"wifi\":\"2\"}', '65351747', 4);

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
('66162603', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 38181049),
('89523799', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 17587907),
('65351747', 'operational', 'operational', 'missing', 'notOperational', 'operational', 'damaged', 'operational', 'damaged', 82702591);

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
(4, '10', '4');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `com_id`, `part`, `status`, `lab`, `submitted_by`, `notes`, `created_at`) VALUES
(20, '50342044', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-10-11 04:33:09'),
(21, '50342044', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-10-12 02:02:54'),
(22, '50342044', NULL, 'Notoperational', '1', 'System', 'keyboard issue detected', '2025-10-12 02:03:37'),
(23, '47500017', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-10-12 09:27:30'),
(24, '44872654', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-10-12 09:29:13'),
(25, '44872654', NULL, 'Notoperational', '1', 'System', 'headphone issue detected', '2025-10-12 10:13:59'),
(26, '78223936', NULL, 'Damaged', '1', 'System', 'hdmi issue detected', '2025-10-12 10:20:39'),
(28, '89523799', NULL, 'Notoperational', '10', 'System', 'power issue detected', '2025-10-13 15:23:43'),
(42, '65351747', NULL, 'Missing', '10', 'System', 'keyboard issue detected', '2025-10-23 06:22:14'),
(43, '65351747', NULL, 'Notoperational', '10', 'System', 'monitor issue detected', '2025-10-23 06:22:14'),
(44, '65351747', NULL, 'Damaged', '10', 'System', 'power issue detected', '2025-10-23 06:22:14'),
(45, '65351747', NULL, 'Damaged', '10', 'System', 'wifi issue detected', '2025-10-23 06:22:14');

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
  `fix_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technician_logs`
--

INSERT INTO `technician_logs` (`report_id`, `fix_id`, `issue_found`, `solution`, `status`, `technician_email`, `fix_time`) VALUES
('65351747', '40569113', '{\'lab\': \'10\', \'PC_Number\': \'2\', \'status\': \'Notoperational\', \'notes\': \'headphone issue detected\'}', 'hehe', 'operational', '1@gmail.com', '2025-10-23 15:06:10');

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
('10', '1', '1@gmail.com', 'ITSD', '1', '1', '2024-06-13-222542610.jpeg', 'Not specified', 'Not Specified');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`lab_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
