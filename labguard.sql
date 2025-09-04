-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2025 at 11:13 AM
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
-- Table structure for table `accessories_equipment`
--

CREATE TABLE `accessories_equipment` (
  `spec` text NOT NULL,
  `lab` text NOT NULL,
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accessories_equipment`
--

INSERT INTO `accessories_equipment` (`spec`, `lab`, `id`, `name`) VALUES
('2', 'Justin (Cl3)', 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `computer_equipments`
--

CREATE TABLE `computer_equipments` (
  `specs` text NOT NULL,
  `assign` text NOT NULL,
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_equipments`
--

INSERT INTO `computer_equipments` (`specs`, `assign`, `id`, `name`) VALUES
('1', 'Justin (Cl3)', 1, '1');

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

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `category`, `name`, `lab`, `specs`, `quantity`, `status`) VALUES
(1, '1', '1', '1', '1', 0, '1'),
(2, '1', '1', '1', '1', 0, '1');

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
(1, 'Cl3', 'Cl3'),
(2, '1', '1'),
(3, 'Justin', 'Cl3');

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
  `lab` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` text DEFAULT NULL,
  `label` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `submitted_by` varchar(20) NOT NULL,
  `timestamp` text NOT NULL,
  `report_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `lab`, `item`, `quantity`, `status`, `notes`, `label`, `image_path`, `submitted_by`, `timestamp`, `report_status`) VALUES
(7, 'Computer Lab 2', 'Projector', 1, 'Missing', 'Reported to admin', 'Not Operational', 'images/projector1.jpg', 'AD-1234', '', 1),
(8, 'Computer Lab 3', 'Chair', 3, 'Damaged', 'Replace with new chairs', 'Operational', 'images/chair1.jpg', 'LA-5678', '', 0),
(10, 'Computer Lab 5', 'Mouse', 7, 'Missing', 'Check inventory logs', 'Not Operational', 'images/mouse1.jpg', 'AD-2345', '', 0),
(22, 'Computer Lab 1', 'damage test', 11, 'Damage', '1', 'Not Operational', NULL, 'natnat@gmail.com', '', 0),
(23, 'Computer Lab 1', 'damage test', 4, 'Missing', '5', 'Not Operational', NULL, 'natnat@gmail.com', '', 0);

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
('', 'Natalie Jenh Alarcon', 'natnat@gmail.com', 'Lab Assistant', '4th Year', '123'),
('AD-1001', 'Frank White', 'frank@example.com', 'Admin', NULL, 'adminpass'),
('AD-1234', 'Admin ', 'admin@example.com', 'Admin', '0', 'adminpass'),
('AD-123456789', 'Admin', 'admin.ui@phinmaed.com', 'Admin', NULL, 'Admin1234'),
('AD-2345', ' Admin', 'admin2@example.com', 'Admin', '0', 'admin2pass'),
('AS-0000', 'Lab Assistant', 'assistant2@example.com', ' Lab Assistant', '2', 'pass456'),
('LA-3001', 'Grace Kim', 'grace@example.com', 'Lab Adviser', NULL, 'grace303'),
('LA-5678', 'Lab Adviser', 'labadviser@example.com', 'Lab Adviser', '0', 'labpass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories_equipment`
--
ALTER TABLE `accessories_equipment`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `accessories_equipment`
--
ALTER TABLE `accessories_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `computer_equipments`
--
ALTER TABLE `computer_equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
