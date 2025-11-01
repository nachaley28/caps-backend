-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 01, 2025 at 08:15 AM
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
  `lab_id` int(11) NOT NULL,
  `other_parts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`other_parts`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `lab_id` int(11) NOT NULL,
  `lab_name` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other_parts_status`
--

CREATE TABLE `other_parts_status` (
  `com_id` text NOT NULL,
  `parts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`parts`)),
  `status_id` text NOT NULL
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
  `sent` tinyint(1) DEFAULT 0,
  `solution_done` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `sent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('AD-123456', 'Ryan Valeriano', 'nama.alarcon.ui@phinmaed.com', 'Admin', NULL, '123456789', 'ryan.jpg', 'CITE Department', 'CL Adviser'),
('ITSD-1234', 'Natalie', '1@phinma.com', 'ITSD', NULL, '1', 'final.webp', 'ITSD', 'Technician'),
('DEAN-1234', 'Seth dA Nono', 'practice1@gmail.com', 'DEAN', NULL, '12345', 'dean.jpg', 'CITE DEPARTMENT', 'CITE DEAN'),
('AD122344', 'Nataliee', 'villaleahmay@gmail.com', 'Admin', NULL, '12345', '', 'COED', '1222');

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
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
