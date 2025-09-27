-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2025 at 03:38 AM
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
('1', '1', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '65390972'),
('2', '1', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '82343103'),
(NULL, '1', '{\"monitor\": 1, \"systemUnit\": 4, \"keyboard\": 1, \"mouse\": 4, \"headphone\": 12, \"hdmi\": 9, \"power\": 12, \"wifi\": 1}', ''),
(NULL, '1', '{\"monitor\": 2, \"systemUnit\": 5, \"keyboard\": 23, \"mouse\": 4, \"headphone\": 23, \"hdmi\": 2, \"power\": 11, \"wifi\": 1}', ''),
(NULL, '1', '{\"monitor\": 3, \"systemUnit\": 67, \"keyboard\": 3, \"mouse\": 5, \"headphone\": 2, \"hdmi\": 4, \"power\": 11, \"wifi\": 1}', ''),
(NULL, '1', '{\"monitor\": 4, \"systemUnit\": 7, \"keyboard\": 5, \"mouse\": 5, \"headphone\": 2, \"hdmi\": 5, \"power\": 11, \"wifi\": 1}', ''),
('3', '1', '{\"monitor\":\"1\",\"systemUnit\":\"1\",\"keyboard\":\"1\",\"mouse\":\"1\",\"headphone\":\"1\",\"hdmi\":\"1\",\"power\":\"1\",\"wifi\":\"1\"}', '25665167'),
('', '2', '{\"monitor\":1,\"systemUnit\":4,\"keyboard\":1,\"mouse\":4,\"headphone\":12,\"hdmi\":9,\"power\":12,\"wifi\":1}', '62652481'),
('', '2', '{\"monitor\":2,\"systemUnit\":5,\"keyboard\":23,\"mouse\":4,\"headphone\":23,\"hdmi\":2,\"power\":11,\"wifi\":1}', '39752205'),
('', '2', '{\"monitor\":3,\"systemUnit\":67,\"keyboard\":3,\"mouse\":5,\"headphone\":2,\"hdmi\":4,\"power\":11,\"wifi\":1}', '52743813'),
('', '2', '{\"monitor\":4,\"systemUnit\":7,\"keyboard\":5,\"mouse\":5,\"headphone\":2,\"hdmi\":5,\"power\":11,\"wifi\":1}', '11732555');

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
('65390972', 'notOperational', 'damaged', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 82216361),
('82343103', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 'missing', 'operational', 19832848),
('0', 'operational', 'damaged', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', NULL),
('0', 'operational', 'damaged', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', NULL),
('0', 'operational', 'damaged', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', NULL),
('0', 'operational', 'damaged', 'operational', 'notOperational', 'operational', 'operational', 'operational', 'operational', NULL),
('25665167', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 42682442),
('62652481', 'notOperational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 55449927),
('39752205', 'operational', 'damaged', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 58632107),
('52743813', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 19465583),
('11732555', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 'operational', 46864958);

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `lab_name` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`lab_name`, `location`) VALUES
('1', 'EL Building'),
('2', 'EL Building'),
('4', 'EL Building'),
('3', 'EL Building'),
('6', 'EL Building'),
('5', 'EL Building'),
('8', 'EL Building'),
('7', 'EL Building');

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
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:52:16'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:52:17'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:52:20'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:52:20'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:56:39'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 10:56:40'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 12:00:41'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 12:00:45'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 12:00:45'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:09:33'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:09:33'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:09:35'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:09:35'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:11:36'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:11:36'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:11:36'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:11:36'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:26:51'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:26:51'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:26:51'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-24 14:26:51'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:27:18'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:27:18'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:27:18'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:27:18'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:27:19'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:27:19'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:27:19'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:27:19'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:23'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:29:23'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:23'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:29:23'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:24'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:29:24'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:24'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:29:24'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:38'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:29:38'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:38'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:29:38'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:38'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-25 07:29:38'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-25 07:29:38'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-25 07:29:38'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:24:23'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:24:23'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:24:23'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:24:23'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:24:24'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:24:24'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:24:24'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:24:24'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:10'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:10'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:10'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:10'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:12'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:12'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:12'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:12'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:12'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:12'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:12'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:12'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:13'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:13'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:13'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:13'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:13'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:13'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:13'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:13'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:14'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:14'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:14'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:14'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:14'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:50:14'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:50:14'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:50:14'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:52:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:52:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:41'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:58:41'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:41'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:58:41'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:41'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:58:41'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:41'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:58:41'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:42'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:58:42'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:58:42'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:58:42'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:34'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:34'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 10:59:51'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 10:59:51'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:00:11'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:00:11'),
(0, '1', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:02:28'),
(0, '1', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:02:28'),
(0, '2', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:02:28'),
(0, '2', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:02:28'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:04:44'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:04:44'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:04:44'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:04:44'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:04:44'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:04:44'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:04:44'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:04:44'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:10:41'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:10:41'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:10:41'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:10:41'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:10:41'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:10:41'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:10:41'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:10:41'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:11:29'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:11:29'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:11:29'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:11:29'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:11:29'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:11:29'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:11:29'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:11:29'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:54'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:20:54'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:54'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:20:54'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:54'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:55'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:20:55'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:55'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:20:55'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:20:55'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:00'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:00'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:00'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:00'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:00'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:01'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:01'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:44'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:44'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 11:51:44'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:44'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:44'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:44'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 11:51:44'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:47'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:47'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 11:51:47'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 11:51:47'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 11:51:47'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 11:51:47'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 11:51:47'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 12:48:25'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 12:48:25'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 12:48:25'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 12:48:25'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:25'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 12:48:25'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 12:48:26'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 12:48:26'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 12:48:26'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:44'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 14:34:44'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:44'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 14:34:44'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:44'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 14:34:44'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 14:34:44'),
(0, '65390972', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:45'),
(0, '65390972', NULL, 'Damaged', '1', 'System', 'headphone issue detected', '2025-09-26 14:34:45'),
(0, '82343103', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:45'),
(0, '82343103', NULL, 'Missing', '1', 'System', 'systemUnit issue detected', '2025-09-26 14:34:45'),
(0, '25665167', NULL, 'Notoperational', '1', 'System', 'hdmi issue detected', '2025-09-26 14:34:45'),
(0, '62652481', NULL, 'Notoperational', '2', 'System', 'hdmi issue detected', '2025-09-26 14:34:45'),
(0, '39752205', NULL, 'Damaged', '2', 'System', 'headphone issue detected', '2025-09-26 14:34:45');

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
('AD-123456789', 'Admin', 'admin.ui@phinmaed.com', 'Admin', NULL, 'Admin1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
