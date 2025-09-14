-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2025 at 01:39 PM
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
  `id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_equipments`
--

INSERT INTO `computer_equipments` (`pc_name`, `lab_name`, `specs`, `id`) VALUES
('21424', 'Justin', '{\"monitor\":\"21424\",\"systemUnit\":\"21424\",\"keyboard\":\"21424\",\"mouse\":\"21424\",\"headphone\":\"21424\",\"hdmi\":\"21424\",\"power\":\"21424\",\"wifi\":\"21424\"}', '13782527'),
('1', 'Cl3', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '17939919'),
('r', 'Cl3', '{\"monitor\":\"r\",\"systemUnit\":\"r\",\"keyboard\":\"r\",\"mouse\":\"r\",\"headphone\":\"r\",\"hdmi\":\"r\",\"power\":\"r\",\"wifi\":\"r\"}', '71130950');

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
('17939919', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 62074493),
('71130950', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'damaged', 'operational', 84333131),
('13782527', 'operational', 'damaged', 'operational', 'operational', 'operational', 'damaged', 'operational', 'operational', 25807771);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `status` enum('Operational','Not Operational') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `lab_id`, `status`) VALUES
(1, 'Laptop', 1, 'Operational'),
(2, 'Desktop', 1, 'Not Operational'),
(3, 'Projector', 2, 'Operational'),
(4, 'Chair', 2, 'Operational'),
(5, 'Mouse', 3, 'Not Operational'),
(6, 'Keyboard', 3, 'Operational'),
(7, 'Monitor', 4, 'Operational'),
(8, 'Printer', 4, 'Not Operational'),
(9, 'Router', 5, 'Operational'),
(10, 'Switch', 5, 'Operational'),
(11, 'Tablet', 6, 'Not Operational'),
(12, 'Scanner', 6, 'Operational'),
(13, 'Desk', 7, 'Operational'),
(14, 'Chair', 7, 'Not Operational');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `name` text NOT NULL,
  `lab` text NOT NULL,
  `specs` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `id` int(11) NOT NULL,
  `lab_name` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`id`, `lab_name`, `location`) VALUES
(1, 'Cl3', 'Cl3');

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

CREATE TABLE `labs` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labs`
--

INSERT INTO `labs` (`id`, `name`) VALUES
(1, 'Computer Lab 1'),
(2, 'Computer Lab 2'),
(3, 'Computer Lab 3'),
(4, 'Computer Lab 4'),
(5, 'Computer Lab 5'),
(6, 'Computer Lab 6'),
(7, 'Computer Lab 7');

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
(1, '71130950', 'systemUnit', 'damaged', 'Unknown', 'System', '', '2025-09-14 11:19:17'),
(2, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:23:57'),
(3, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:29:26'),
(4, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:41'),
(5, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:41'),
(6, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:42'),
(7, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:42'),
(8, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:50'),
(9, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:30:50'),
(10, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:30:50'),
(11, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:51'),
(12, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:30:51'),
(13, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:30:51'),
(14, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:52'),
(15, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:30:52'),
(16, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:30:52'),
(17, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:30:53'),
(18, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:30:53'),
(19, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:30:53'),
(20, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:31:06'),
(21, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:31:06'),
(22, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:31:06'),
(23, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:31:06'),
(24, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:31:06'),
(25, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:31:06'),
(26, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:39:07'),
(27, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:39:07'),
(28, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:39:07'),
(29, 'PC-71130950', NULL, 'Damaged', 'Lab A', 'System', 'systemUnit issue detected', '2025-09-14 11:39:08'),
(30, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'headphone issue detected', '2025-09-14 11:39:08'),
(31, 'PC-13782527', NULL, 'Damaged', 'Lab A', 'System', 'power issue detected', '2025-09-14 11:39:08');

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
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`lgid`, `name`, `email`, `role`, `year`, `password`) VALUES
('1', 'Natalie Jenh Alarcon', 'natnat@gmail.com', 'Lab Assistant', '4th Year', '123'),
('AD-1234', 'Admin ', 'admin@example.com', 'Admin', '0', 'adminpass'),
('AD-123456789', 'Admin', 'admin.ui@phinmaed.com', 'Admin', NULL, 'Admin1234'),
('AS-0000', 'Lab Assistant', 'assistant2@example.com', ' Lab Assistant', '2', 'pass456'),
('LA-3001', 'Grace Kim', 'grace@example.com', 'Lab Adviser', NULL, 'grace303'),
('LA-5678', 'Lab Adviser', 'labadviser@example.com', 'Lab Adviser', '0', 'labpass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computer_equipments`
--
ALTER TABLE `computer_equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_id` (`lab_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labs`
--
ALTER TABLE `labs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`lgid`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
