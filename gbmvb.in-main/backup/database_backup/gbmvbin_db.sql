-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2023 at 05:13 PM
-- Server version: 10.3.28-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gbmvbin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountants`
--

CREATE TABLE `accountants` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accountants`
--

INSERT INTO `accountants` (`id`, `name`, `email`, `password`, `address`, `dob`, `designation`, `sex`, `phone`, `father_name`, `department`, `image`, `is_active`, `created_at`) VALUES
(2, 'shailendra', 'shailendra@gmail.com', NULL, 'jhansi', '1990-10-01', NULL, 'Male', '9582582252', 'shiv', 'account', 'uploads/student_images/no_image.png', 'no', '2022-08-02 11:14:51'),
(4, 'Shailendra kumar', 'shailendrakumar1982bmu@gmail.com', NULL, 'bangarmu,unnao', '1982-01-01', NULL, 'Male', '9452099337', 'Mr. Kumar', 'CA', 'uploads/student_images/no_image.png', 'no', '2022-08-23 12:48:39'),
(5, 'Uday Yadav', 'abhisheksinghku23@gmail.com', NULL, 'bangarmau', '1990-01-01', NULL, 'Male', '8601109719', 'Mr.Yadav', 'CA', 'uploads/student_images/no_image.png', 'no', '2022-08-30 04:55:48'),
(6, 'mahek', '23hari.hari.85@gmail.com', NULL, 'D/1 Saraswatichawal 90 ft Road ,Mahatma Phule Nagar', '2023-03-17', NULL, 'Female', '9967932154', 'mr. manoj kumarbn', 'ca', 'uploads/accountant_images/6.jpg', 'no', '2023-03-23 06:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `role`, `email`, `password`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'abhisheksinghku5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'cklBQTZjYXdWRTNLZ3NDYkdSMTB4Q2h0U1NPUjN6QXkyZGRqejNNRUJ4Zz0=', 'yes', '2022-08-08 11:01:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `attendence_type`
--

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `book_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isbn_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rack_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `publish` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yes',
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 'GEN', 'no', '2022-07-13 05:38:13', '0000-00-00 00:00:00'),
(30, 'SC', 'no', '2022-07-24 10:22:02', '0000-00-00 00:00:00'),
(35, 'OBC', 'no', '2022-07-29 06:24:07', '0000-00-00 00:00:00'),
(36, 'other', 'no', '2022-07-29 06:38:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BA', 'no', '2022-07-02 06:15:06', '0000-00-00 00:00:00'),
(2, 'BSC', 'no', '2022-07-02 06:15:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'no', '2022-07-02 06:26:36', '0000-00-00 00:00:00'),
(2, 1, 2, 'no', '2022-07-02 06:26:36', '0000-00-00 00:00:00'),
(3, 1, 3, 'no', '2022-07-02 06:26:36', '0000-00-00 00:00:00'),
(4, 2, 1, 'no', '2022-07-02 06:27:04', '0000-00-00 00:00:00'),
(5, 2, 2, 'no', '2022-07-02 06:26:36', '0000-00-00 00:00:00'),
(6, 2, 3, 'no', '2022-07-02 06:27:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `file` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `type`, `is_public`, `class_id`, `file`, `note`, `is_active`, `created_at`, `updated_at`, `date`) VALUES
(1, '9th assin', 'Assignments', 'No', 9, 'uploads/school_content/material/1.pdf', '', 'no', '2020-12-28 16:15:53', '0000-00-00 00:00:00', '2020-12-28'),
(2, 'Java', 'Assignments', 'No', 21, 'uploads/school_content/material/2.pdf', 'Java exam ', 'no', '2021-03-15 07:57:17', '0000-00-00 00:00:00', '2021-03-15'),
(3, 'Test', 'Study Material', 'No', 8, 'uploads/school_content/material/3.jpg', 'Test', 'no', '2021-03-15 18:16:24', '0000-00-00 00:00:00', '2021-03-04'),
(4, 'Seconds', 'Other Download', 'No', 16, 'uploads/school_content/material/4.jpg', '', 'no', '2021-03-18 10:48:19', '0000-00-00 00:00:00', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES
(1, 'sendmail', '', '', '', '', '', 'yes', '2022-07-18 08:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `attendence` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `exam_schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `exp_head_id` int(11) DEFAULT NULL,
  `session_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'yes',
  `is_deleted` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `exp_head_id`, `session_id`, `name`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, '18', 'new', '2022-08-10', 500.00, NULL, 'hibvhfbdj', 'yes', 'no', '2022-08-18 04:50:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL,
  `exp_category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'yes',
  `is_deleted` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_head`
--

INSERT INTO `expense_head` (`id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Land and Buildings', '', 'yes', 'no', '2021-03-20 07:41:18', '0000-00-00 00:00:00'),
(3, 'Setting up laboratories', '', 'yes', 'no', '2021-03-20 07:41:49', '0000-00-00 00:00:00'),
(4, 'Setting up the library', '', 'yes', 'no', '2021-03-20 07:41:58', '0000-00-00 00:00:00'),
(5, 'Educational/instructional tools and aids', '', 'yes', 'no', '2021-03-20 07:42:07', '0000-00-00 00:00:00'),
(7, 'Teacher\'s salaries', '', 'yes', 'no', '2021-03-20 07:43:23', '0000-00-00 00:00:00'),
(8, 'Non-Teaching staff Salaries', '', 'yes', 'no', '2021-03-20 07:44:01', '0000-00-00 00:00:00'),
(9, 'Maintenance costs', '(cleaning, security, AMCs for equipment etc.)', 'yes', 'no', '2021-03-20 07:44:47', '0000-00-00 00:00:00'),
(10, 'Supplies', '(stationery, equipment etc.)', 'yes', 'no', '2021-03-20 07:45:13', '0000-00-00 00:00:00'),
(11, 'new book', 'hhhh', 'yes', 'no', '2022-03-04 12:59:18', '0000-00-00 00:00:00'),
(12, 'Vehicles', '(buses, vans etc.)', 'yes', 'no', '2022-07-01 10:08:15', '0000-00-00 00:00:00'),
(13, 'Computing facilities', 'fdghj', 'yes', 'no', '2022-07-02 07:12:28', '0000-00-00 00:00:00'),
(15, 'Computing facilities1', 'ab vgshdfgh', 'yes', 'no', '2022-07-13 06:43:30', '0000-00-00 00:00:00'),
(16, 'Computing facilities2bgnh', ' bn', 'yes', 'no', '2022-07-13 08:15:16', '0000-00-00 00:00:00'),
(17, 'LIGHT', '', 'yes', 'no', '2022-07-15 08:13:07', '0000-00-00 00:00:00'),
(18, 'Computing facilities1', 'bv', 'yes', 'no', '2022-07-16 08:18:30', '0000-00-00 00:00:00'),
(20, 'Computing facilities', 'ghj', 'yes', 'no', '2022-07-20 07:12:29', '0000-00-00 00:00:00'),
(21, 'Computing facilities', 'ghj', 'yes', 'no', '2022-07-25 04:30:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `feecategory`
--

CREATE TABLE `feecategory` (
  `id` int(11) NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feemasters`
--

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_discounts`
--

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feetype`
--

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feetype`
--

INSERT INTO `feetype` (`id`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES
(1, NULL, 'Admission', '23', 'no', '2022-08-09 15:01:19', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `description`, `is_active`, `created_at`) VALUES
(1, 'BA 1st Year', '', 'no', '2022-08-09 14:52:31'),
(2, 'BA 2nd Year', '', 'no', '2022-08-09 14:59:05'),
(3, 'BA 3rd Year', '', 'no', '2022-08-09 14:59:22'),
(4, 'Bsc 1st Year', '', 'no', '2022-08-09 15:00:05'),
(5, 'Bsc 2nd Year', '', 'no', '2022-08-09 15:00:23'),
(6, 'Bsc 3rd Year', '', 'no', '2022-08-09 15:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_feetype`
--

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups_feetype`
--

INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `due_date`, `amount`, `is_active`, `created_at`) VALUES
(1, 1, 1, 1, 18, '1970-01-01', '4500.00', 'no', '2022-08-09 15:01:36'),
(2, 2, 2, 1, 18, '1970-01-01', '5000.00', 'no', '2022-08-09 15:01:49'),
(3, 3, 3, 1, 18, '1970-01-01', '6500.00', 'no', '2022-08-09 15:02:06'),
(4, 4, 4, 1, 18, '1970-01-01', '7500.00', 'no', '2022-08-09 15:02:19'),
(5, 5, 5, 1, 18, '1970-01-01', '8000.00', 'no', '2022-08-09 15:02:33'),
(6, 6, 6, 1, 18, '1970-01-01', '9500.00', 'no', '2022-08-09 15:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `fee_receipt_no`
--

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fee_session_groups`
--

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_session_groups`
--

INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES
(1, 1, 18, 'no', '2022-08-09 15:01:36'),
(2, 2, 18, 'no', '2022-08-09 15:01:49'),
(3, 3, 18, 'no', '2022-08-09 15:02:06'),
(4, 4, 18, 'no', '2022-08-09 15:02:19'),
(5, 5, 18, 'no', '2022-08-09 15:02:33'),
(6, 6, 18, 'no', '2022-08-09 15:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `name`, `point`, `mark_from`, `mark_upto`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'A', NULL, 55.00, 65.00, 'good', 'no', '2020-12-30 09:07:39', '0000-00-00 00:00:00'),
(2, 'B', NULL, 45.00, 54.99, '', 'no', '2021-03-15 08:42:41', '0000-00-00 00:00:00'),
(3, 'A+', NULL, 65.01, 100.00, '', 'no', '2021-06-01 12:32:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `hostel_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_rooms`
--

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Azerbaijan', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(2, 'Albanian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(3, 'Amharic', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(4, 'English', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(5, 'Arabic', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(7, 'Afrikaans', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(8, 'Basque', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(11, 'Bengali', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(13, 'Bosnian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(14, 'Welsh', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(15, 'Hungarian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(16, 'Vietnamese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(17, 'Haitian (Creole)', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(18, 'Galician', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(19, 'Dutch', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(21, 'Greek', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(22, 'Georgian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(23, 'Gujarati', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(24, 'Danish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(25, 'Hebrew', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(26, 'Yiddish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(27, 'Indonesian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(28, 'Irish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(29, 'Italian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(30, 'Icelandic', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(31, 'Spanish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(33, 'Kannada', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(34, 'Catalan', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(36, 'Chinese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(37, 'Korean', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(38, 'Xhosa', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(39, 'Latin', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(40, 'Latvian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(41, 'Lithuanian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(43, 'Malagasy', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(44, 'Malay', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(45, 'Malayalam', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(46, 'Maltese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(47, 'Macedonian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(48, 'Maori', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(49, 'Marathi', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(51, 'Mongolian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(52, 'German', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(53, 'Nepali', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(54, 'Norwegian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(55, 'Punjabi', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(57, 'Persian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(59, 'Portuguese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(60, 'Romanian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(61, 'Russian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(62, 'Cebuano', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(64, 'Sinhala', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(65, 'Slovakian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(66, 'Slovenian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(67, 'Swahili', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(68, 'Sundanese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(70, 'Thai', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(71, 'Tagalog', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(72, 'Tamil', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(74, 'Telugu', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(75, 'Turkish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(77, 'Uzbek', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(79, 'Urdu', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(80, 'Finnish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(81, 'French', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(82, 'Hindi', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(84, 'Czech', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(85, 'Swedish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(86, 'Scottish', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(87, 'Estonian', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(88, 'Esperanto', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(89, 'Javanese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00'),
(90, 'Japanese', 'no', 'no', '2017-04-06 05:08:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lang_keys`
--

CREATE TABLE `lang_keys` (
  `id` int(11) NOT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lang_keys`
--

INSERT INTO `lang_keys` (`id`, `key`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'session', 'no', '2016-03-09 10:54:39', '0000-00-00 00:00:00'),
(2, 'school_name', 'no', '2016-03-09 11:04:28', '0000-00-00 00:00:00'),
(3, 'email', 'no', '2016-03-09 11:04:48', '0000-00-00 00:00:00'),
(6, 'roll_no', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(7, 'first_name', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(8, 'last_name', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(9, 'class', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(10, 'section', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(11, 'admission_date', 'no', '2017-04-01 19:37:35', '0000-00-00 00:00:00'),
(12, 'mobile_no', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(13, 'date_of_birth', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(15, 'religion', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(16, 'category', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(17, 'current_address', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(18, 'permanent_address', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(23, 'bank_account_no', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(24, 'bank_name', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(25, 'ifsc_code', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(27, 'guardian_name', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(28, 'guardian_relation', 'no', '2016-03-12 13:43:05', '0000-00-00 00:00:00'),
(29, 'guardian_phone', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(30, 'guardian_address', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(31, 'select_image', 'no', '2001-12-30 04:29:30', '0000-00-00 00:00:00'),
(32, 'import_excel', 'no', '2001-12-30 04:33:11', '0000-00-00 00:00:00'),
(33, 'export_format', 'no', '2001-12-30 04:33:11', '0000-00-00 00:00:00'),
(34, 'generate_pdf', 'no', '2001-12-30 04:33:11', '0000-00-00 00:00:00'),
(35, 'add_fees', 'no', '2016-06-24 08:04:31', '0000-00-00 00:00:00'),
(37, 'search', 'no', '2016-03-12 13:47:08', '0000-00-00 00:00:00'),
(39, 'fee_category', 'no', '2016-03-12 13:59:03', '0000-00-00 00:00:00'),
(40, 'fee_type', 'no', '2016-03-12 13:59:03', '0000-00-00 00:00:00'),
(43, 'add_fees_master', 'no', '2016-03-12 14:00:10', '0000-00-00 00:00:00'),
(44, 'fees_master_list', 'no', '2016-03-12 14:00:10', '0000-00-00 00:00:00'),
(45, 'add_fees_type', 'no', '2016-03-12 14:01:38', '0000-00-00 00:00:00'),
(46, 'fees_type_list', 'no', '2016-03-12 14:01:38', '0000-00-00 00:00:00'),
(48, 'edit', 'no', '2016-03-12 14:03:10', '0000-00-00 00:00:00'),
(50, 'category_list', 'no', '2016-03-12 14:04:32', '0000-00-00 00:00:00'),
(51, 'add_category', 'no', '2016-03-12 14:04:32', '0000-00-00 00:00:00'),
(52, 'session_list', 'no', '2016-03-12 14:05:15', '0000-00-00 00:00:00'),
(53, 'add_session', 'no', '2016-03-12 14:05:15', '0000-00-00 00:00:00'),
(54, 'class_list', 'no', '2016-03-12 14:05:53', '0000-00-00 00:00:00'),
(56, 'section_list', 'no', '2016-03-12 14:06:20', '0000-00-00 00:00:00'),
(57, 'add_section', 'no', '2016-03-12 14:06:20', '0000-00-00 00:00:00'),
(61, 'student', 'no', '2016-03-12 14:08:08', '0000-00-00 00:00:00'),
(63, 'language_list', 'no', '2016-03-12 14:09:44', '0000-00-00 00:00:00'),
(64, 'add_another_language', 'no', '2016-03-12 14:09:44', '0000-00-00 00:00:00'),
(65, 'created_at', 'no', '2016-03-12 14:45:20', '0000-00-00 00:00:00'),
(66, 'save', 'no', '2001-12-30 04:21:24', '0000-00-00 00:00:00'),
(68, 'select_logo', 'no', '2001-12-30 04:47:56', '0000-00-00 00:00:00'),
(69, 'school_logo', 'no', '2001-12-30 04:49:33', '0000-00-00 00:00:00'),
(70, 'manage', 'no', '2001-12-30 04:49:33', '0000-00-00 00:00:00'),
(72, 'edit_logo', 'no', '2001-12-30 04:53:28', '0000-00-00 00:00:00'),
(73, 'phone', 'no', '2001-12-30 05:00:49', '0000-00-00 00:00:00'),
(74, 'user_name', 'no', '2001-12-30 05:08:51', '0000-00-00 00:00:00'),
(76, 'sms_configuration', 'no', '2001-12-30 05:13:00', '0000-00-00 00:00:00'),
(77, 'sms_gateway_url', 'no', '2016-10-26 15:49:35', '0000-00-00 00:00:00'),
(78, 'status', 'no', '2001-12-30 05:13:52', '0000-00-00 00:00:00'),
(79, 'action', 'no', '2001-12-30 05:14:03', '0000-00-00 00:00:00'),
(80, 'change_status', 'no', '2001-12-30 05:15:19', '0000-00-00 00:00:00'),
(82, 'report', 'no', '2001-12-30 05:26:58', '0000-00-00 00:00:00'),
(84, 'select_criteria', 'no', '2001-12-30 05:27:36', '0000-00-00 00:00:00'),
(85, 'reset', 'no', '2001-12-30 05:28:39', '0000-00-00 00:00:00'),
(86, 'invoice_no', 'no', '2001-12-30 05:30:59', '0000-00-00 00:00:00'),
(87, 'fine', 'no', '2001-12-30 05:30:59', '0000-00-00 00:00:00'),
(88, 'type', 'no', '2001-12-30 05:31:20', '0000-00-00 00:00:00'),
(89, 'amount', 'no', '2001-12-30 05:31:20', '0000-00-00 00:00:00'),
(90, 'total', 'no', '2001-12-30 05:31:26', '0000-00-00 00:00:00'),
(91, 'discount', 'no', '2001-12-30 05:31:36', '0000-00-00 00:00:00'),
(92, 'balance_description', 'no', '2001-12-30 05:32:55', '0000-00-00 00:00:00'),
(94, 'no_search_record_found', 'no', '2001-12-30 05:36:37', '0000-00-00 00:00:00'),
(101, 'description', 'no', '2001-12-30 05:43:49', '0000-00-00 00:00:00'),
(102, 'fees_subtotal', 'no', '2001-12-30 05:44:34', '0000-00-00 00:00:00'),
(104, 'receipt_no', 'no', '2001-12-30 05:47:56', '0000-00-00 00:00:00'),
(106, 'grand_total', 'no', '2001-12-30 05:49:14', '0000-00-00 00:00:00'),
(107, 'deposit', 'no', '2001-12-30 05:56:50', '0000-00-00 00:00:00'),
(108, 'balance', 'no', '2001-12-30 05:56:50', '0000-00-00 00:00:00'),
(115, 'fee_master', 'no', '2001-12-30 07:36:09', '0000-00-00 00:00:00'),
(116, 'classes', 'no', '2001-12-30 07:36:44', '0000-00-00 00:00:00'),
(117, 'collection', 'no', '2001-12-30 07:37:14', '0000-00-00 00:00:00'),
(121, 'current_password', 'no', '2001-12-30 23:29:11', '0000-00-00 00:00:00'),
(122, 'new_password', 'no', '2001-12-30 23:29:11', '0000-00-00 00:00:00'),
(123, 'confirm_password', 'no', '2016-09-15 04:59:51', '0000-00-00 00:00:00'),
(125, 'date', 'no', '2016-04-07 10:47:39', '0000-00-00 00:00:00'),
(137, 'add_new_sms_configuration', 'no', '2001-12-31 01:09:13', '0000-00-00 00:00:00'),
(141, 'cancel', 'no', '2016-03-26 21:20:39', '0000-00-00 00:00:00'),
(142, 'exam_name', 'no', '2016-03-26 22:46:34', '0000-00-00 00:00:00'),
(143, 'subject_name', 'no', '2016-03-29 13:35:15', '0000-00-00 00:00:00'),
(144, 'subject_code', 'no', '2016-03-29 13:35:15', '0000-00-00 00:00:00'),
(145, 'grade_name', 'no', '2016-03-29 17:51:20', '0000-00-00 00:00:00'),
(147, 'percent', 'no', '2016-03-29 17:51:41', '0000-00-00 00:00:00'),
(149, 'percent_to', 'no', '2016-03-29 17:52:00', '0000-00-00 00:00:00'),
(150, 'note', 'no', '2016-03-29 17:52:00', '0000-00-00 00:00:00'),
(151, 'school_code', 'no', '2016-10-25 09:42:26', '0000-00-00 00:00:00'),
(152, 'sign_in', 'no', '2016-04-07 02:57:27', '0000-00-00 00:00:00'),
(153, 'name', 'no', '2016-04-07 10:46:19', '0000-00-00 00:00:00'),
(155, 'transport_fees', 'no', '2016-04-12 11:26:04', '0000-00-00 00:00:00'),
(156, 'fees_discount', 'no', '2016-04-12 12:03:36', '0000-00-00 00:00:00'),
(157, 'father_name', 'no', '2016-04-12 20:22:14', '0000-00-00 00:00:00'),
(158, 'father_phone', 'no', '2016-04-12 20:22:14', '0000-00-00 00:00:00'),
(159, 'father_occupation', 'no', '2016-04-12 20:22:45', '0000-00-00 00:00:00'),
(160, 'mother_name', 'no', '2016-04-12 20:22:45', '0000-00-00 00:00:00'),
(161, 'mother_phone', 'no', '2016-04-12 20:26:08', '0000-00-00 00:00:00'),
(162, 'mother_occupation', 'no', '2016-04-12 20:26:08', '0000-00-00 00:00:00'),
(163, 'guardian_occupation', 'no', '2016-04-12 20:39:51', '0000-00-00 00:00:00'),
(164, 'address', 'no', '2016-04-14 06:02:42', '0000-00-00 00:00:00'),
(165, 'language', 'no', '2016-04-14 06:03:38', '0000-00-00 00:00:00'),
(166, 'teacher_name', 'no', '2016-04-19 05:25:06', '0000-00-00 00:00:00'),
(167, 'password', 'no', '2016-04-19 05:25:06', '0000-00-00 00:00:00'),
(168, 'cast', 'no', '2016-04-19 05:56:10', '0000-00-00 00:00:00'),
(169, 'id', 'no', '2016-04-19 07:34:10', '0000-00-00 00:00:00'),
(170, 'admission_no', 'no', '2016-04-22 17:32:46', '0000-00-00 00:00:00'),
(171, 'enrollment_no', 'no', '2016-04-22 17:50:48', '0000-00-00 00:00:00'),
(180, 'total_paid_fees', 'no', '2016-04-22 18:39:01', '0000-00-00 00:00:00'),
(181, 'admission_discount', 'no', '2016-04-22 18:39:41', '0000-00-00 00:00:00'),
(182, 'total_balance', 'no', '2016-04-22 18:39:41', '0000-00-00 00:00:00'),
(183, 'student_name', 'no', '2016-04-23 21:07:56', '0000-00-00 00:00:00'),
(184, 'fees', 'no', '2016-04-23 21:14:06', '0000-00-00 00:00:00'),
(185, 'rte', 'no', '2016-04-23 23:13:46', '0000-00-00 00:00:00'),
(186, 'gender', 'no', '2016-04-24 07:47:59', '0000-00-00 00:00:00'),
(187, 'teacher_photo', 'no', '2016-04-28 23:26:01', '0000-00-00 00:00:00'),
(188, 'isbn', 'no', '2016-05-01 21:37:51', '0000-00-00 00:00:00'),
(189, 'publisher', 'no', '2016-10-23 02:58:28', '0000-00-00 00:00:00'),
(190, 'author', 'no', '2016-05-01 21:38:19', '0000-00-00 00:00:00'),
(191, 'qty', 'no', '2016-05-01 21:38:19', '0000-00-00 00:00:00'),
(192, 'bookprice', 'no', '2016-10-17 23:41:54', '0000-00-00 00:00:00'),
(193, 'postdate', 'no', '2016-05-01 21:38:38', '0000-00-00 00:00:00'),
(197, 'intake', 'no', '2016-05-04 19:36:45', '0000-00-00 00:00:00'),
(199, 'book_title', 'no', '2016-05-04 23:29:27', '0000-00-00 00:00:00'),
(201, 'no_of_vehicle', 'no', '2016-05-09 17:50:40', '0000-00-00 00:00:00'),
(202, 'fare', 'no', '2016-05-09 17:50:48', '0000-00-00 00:00:00'),
(203, 'content_type', 'no', '2016-05-10 06:54:51', '0000-00-00 00:00:00'),
(205, 'upload_date', 'no', '2016-05-10 06:55:21', '0000-00-00 00:00:00'),
(206, 'expenses', 'no', '2016-05-10 16:44:03', '0000-00-00 00:00:00'),
(207, 'student_information', 'no', '2016-05-10 16:54:31', '0000-00-00 00:00:00'),
(208, 'fees_collection', 'no', '2016-05-10 17:05:29', '0000-00-00 00:00:00'),
(210, 'examinations', 'no', '2016-05-10 17:33:55', '0000-00-00 00:00:00'),
(211, 'academics', 'no', '2016-05-10 17:47:28', '0000-00-00 00:00:00'),
(212, 'download_center', 'no', '2016-05-10 17:47:28', '0000-00-00 00:00:00'),
(214, 'library', 'no', '2016-05-10 18:04:05', '0000-00-00 00:00:00'),
(215, 'system_settings', 'no', '2016-05-10 18:08:32', '0000-00-00 00:00:00'),
(216, 'reports', 'no', '2016-05-10 18:21:38', '0000-00-00 00:00:00'),
(217, 'subject', 'no', '2016-05-12 21:52:44', '0000-00-00 00:00:00'),
(218, 'rack_no', 'no', '2016-05-12 21:52:44', '0000-00-00 00:00:00'),
(220, 'hostel', 'no', '2016-05-13 01:12:27', '0000-00-00 00:00:00'),
(221, 'hostel_name', 'no', '2016-05-13 01:18:07', '0000-00-00 00:00:00'),
(222, 'transport', 'no', '2016-05-13 01:21:25', '0000-00-00 00:00:00'),
(223, 'route_title', 'no', '2016-05-13 01:27:39', '0000-00-00 00:00:00'),
(225, 'date_to', 'no', '2016-05-13 04:06:18', '0000-00-00 00:00:00'),
(227, 'basic_information', 'no', '2016-05-13 04:27:25', '0000-00-00 00:00:00'),
(228, 'add', 'no', '2016-05-13 04:30:46', '0000-00-00 00:00:00'),
(229, 'list', 'no', '2016-05-13 04:33:14', '0000-00-00 00:00:00'),
(230, 'result', 'no', '2016-05-13 04:36:46', '0000-00-00 00:00:00'),
(231, 'pass', 'no', '2016-05-13 04:37:34', '0000-00-00 00:00:00'),
(232, 'fail', 'no', '2016-05-13 04:37:34', '0000-00-00 00:00:00'),
(233, 'continue', 'no', '2016-05-17 09:12:00', '0000-00-00 00:00:00'),
(234, 'leave', 'no', '2016-05-13 04:38:28', '0000-00-00 00:00:00'),
(235, 'exam_list', 'no', '2016-05-17 07:17:56', '0000-00-00 00:00:00'),
(236, 'exam', 'no', '2016-05-17 07:20:35', '0000-00-00 00:00:00'),
(237, 'start_time', 'no', '2016-05-17 07:25:08', '0000-00-00 00:00:00'),
(238, 'end_time', 'no', '2016-05-17 07:25:08', '0000-00-00 00:00:00'),
(239, 'room', 'no', '2016-05-17 07:25:08', '0000-00-00 00:00:00'),
(240, 'full_mark', 'no', '2016-05-17 07:25:08', '0000-00-00 00:00:00'),
(241, 'passing_marks', 'no', '2016-05-17 07:25:08', '0000-00-00 00:00:00'),
(242, 'room_no', 'no', '2016-05-17 07:35:25', '0000-00-00 00:00:00'),
(245, 'promote', 'no', '2016-05-17 08:33:52', '0000-00-00 00:00:00'),
(246, 'content_title', 'no', '2016-05-18 16:20:20', '0000-00-00 00:00:00'),
(251, 'teacher_list', 'no', '2016-05-20 22:59:17', '0000-00-00 00:00:00'),
(252, 'compose_new_message', 'no', '2016-05-24 21:52:49', '0000-00-00 00:00:00'),
(253, 'notice', 'no', '2016-05-24 21:56:56', '0000-00-00 00:00:00'),
(254, 'notice_date', 'no', '2016-05-24 21:57:53', '0000-00-00 00:00:00'),
(255, 'publish_on', 'no', '2016-05-24 21:58:56', '0000-00-00 00:00:00'),
(256, 'message_to', 'no', '2016-05-24 22:00:54', '0000-00-00 00:00:00'),
(257, 'parent', 'no', '2016-05-24 22:03:55', '0000-00-00 00:00:00'),
(258, 'teacher', 'no', '2016-05-24 22:04:21', '0000-00-00 00:00:00'),
(259, 'no_record_found', 'no', '2016-05-24 22:17:21', '0000-00-00 00:00:00'),
(260, 'teacher_detail', 'no', '2016-05-24 23:52:21', '0000-00-00 00:00:00'),
(261, 'subject_list', 'no', '2016-05-25 00:33:17', '0000-00-00 00:00:00'),
(263, 'create_category', 'no', '2016-05-25 06:29:13', '0000-00-00 00:00:00'),
(264, 'title', 'no', '2016-05-25 19:31:44', '0000-00-00 00:00:00'),
(265, 'message', 'no', '2016-05-25 19:32:36', '0000-00-00 00:00:00'),
(266, 'send', 'no', '2016-05-25 20:13:32', '0000-00-00 00:00:00'),
(267, 'previous_school_details', 'no', '2016-05-26 00:23:02', '0000-00-00 00:00:00'),
(268, 'upload_documents', 'no', '2016-05-26 00:24:00', '0000-00-00 00:00:00'),
(270, 'miscellaneous_details', 'no', '2016-05-26 00:28:10', '0000-00-00 00:00:00'),
(272, 'edit_notification', 'no', '2016-05-26 01:52:03', '0000-00-00 00:00:00'),
(273, 'guardian_details', 'no', '2016-05-26 02:06:45', '0000-00-00 00:00:00'),
(274, 'payment_id', 'no', '2016-05-26 02:10:03', '0000-00-00 00:00:00'),
(275, 'change_password', 'no', '2016-05-26 02:15:33', '0000-00-00 00:00:00'),
(278, 'notifications', 'no', '2016-05-29 22:12:06', '0000-00-00 00:00:00'),
(279, 'visible_to_all', 'no', '2016-05-29 22:35:26', '0000-00-00 00:00:00'),
(280, 'visibility', 'no', '2016-05-29 22:36:16', '0000-00-00 00:00:00'),
(284, 'communicate', 'no', '2016-05-29 22:49:53', '0000-00-00 00:00:00'),
(285, 'notice_board', 'no', '2016-05-29 22:51:47', '0000-00-00 00:00:00'),
(286, 'publish_date', 'no', '2016-05-29 23:31:41', '0000-00-00 00:00:00'),
(287, 'father', 'no', '2016-05-31 21:51:38', '0000-00-00 00:00:00'),
(288, 'mother', 'no', '2016-05-31 21:51:47', '0000-00-00 00:00:00'),
(290, 'not_scheduled', 'no', '2016-06-07 08:20:48', '0000-00-00 00:00:00'),
(291, 'import_student', 'no', '2016-06-09 22:26:51', '0000-00-00 00:00:00'),
(292, 'dl_sample_import', 'no', '2016-06-09 22:33:13', '0000-00-00 00:00:00'),
(293, 'select_csv_file', 'no', '2016-06-09 22:40:49', '0000-00-00 00:00:00'),
(294, 'date_format', 'no', '2016-06-21 22:19:07', '0000-00-00 00:00:00'),
(295, 'currency', 'no', '2016-06-21 22:19:28', '0000-00-00 00:00:00'),
(296, 'currency_symbol', 'no', '2016-06-21 22:19:28', '0000-00-00 00:00:00'),
(297, 'profile', 'no', '2016-06-22 13:16:28', '0000-00-00 00:00:00'),
(298, 'save_attendance', 'no', '2016-06-22 13:26:58', '0000-00-00 00:00:00'),
(299, 'full_marks', 'no', '2016-06-24 00:40:24', '0000-00-00 00:00:00'),
(300, 'obtain_marks', 'no', '2016-06-24 00:40:24', '0000-00-00 00:00:00'),
(301, 'total_marks', 'no', '2016-06-24 00:48:37', '0000-00-00 00:00:00'),
(302, 'current', 'no', '2016-07-11 20:56:07', '0000-00-00 00:00:00'),
(303, 'admission', 'no', '2016-07-21 02:10:45', '0000-00-00 00:00:00'),
(305, 'sibling', 'no', '2016-08-06 21:02:13', '0000-00-00 00:00:00'),
(306, 'details', 'no', '2016-08-06 21:09:19', '0000-00-00 00:00:00'),
(309, 'identification', 'no', '2016-08-06 21:13:16', '0000-00-00 00:00:00'),
(310, 'no', 'no', '2016-08-06 21:15:33', '0000-00-00 00:00:00'),
(311, 'delete', 'no', '2016-08-06 21:58:55', '0000-00-00 00:00:00'),
(312, 'documents', 'no', '2016-08-06 22:03:52', '0000-00-00 00:00:00'),
(313, 'payment', 'no', '2016-08-06 22:06:56', '0000-00-00 00:00:00'),
(317, 'no_transaction_found', 'no', '2016-08-10 03:02:10', '0000-00-00 00:00:00'),
(318, 'transport_fees_details', 'no', '2016-08-10 03:05:57', '0000-00-00 00:00:00'),
(319, 'collect_fees', 'no', '2016-08-10 03:15:47', '0000-00-00 00:00:00'),
(320, 'balance_details', 'no', '2016-08-10 03:18:55', '0000-00-00 00:00:00'),
(321, 'download_pdf', 'no', '2016-08-10 03:35:40', '0000-00-00 00:00:00'),
(322, 'student_fees_report', 'no', '2016-08-10 03:53:18', '0000-00-00 00:00:00'),
(323, 'total_fees', 'no', '2016-08-10 03:56:53', '0000-00-00 00:00:00'),
(324, 'paid_fees', 'no', '2016-08-10 03:56:53', '0000-00-00 00:00:00'),
(325, 'student_detail', 'no', '2016-08-10 04:12:55', '0000-00-00 00:00:00'),
(327, 'gross_fees', 'no', '2016-08-10 04:15:26', '0000-00-00 00:00:00'),
(328, 'balance_fees', 'no', '2016-08-10 04:18:31', '0000-00-00 00:00:00'),
(329, 'print_selected', 'no', '2016-08-10 04:20:32', '0000-00-00 00:00:00'),
(330, 'collect_transport_fees', 'no', '2016-08-10 04:33:34', '0000-00-00 00:00:00'),
(331, 'no_transport_fees_found', 'no', '2016-08-10 04:35:30', '0000-00-00 00:00:00'),
(332, 'total_transport_fees', 'no', '2016-08-10 04:45:54', '0000-00-00 00:00:00'),
(333, 'class_section', 'no', '2016-08-10 04:49:24', '0000-00-00 00:00:00'),
(335, 'other_discount', 'no', '2016-08-10 05:08:43', '0000-00-00 00:00:00'),
(336, 'search_transaction', 'no', '2016-10-17 23:49:17', '0000-00-00 00:00:00'),
(337, 'fees_collection_details', 'no', '2016-08-10 05:18:09', '0000-00-00 00:00:00'),
(338, 'expense_id', 'no', '2016-08-10 05:24:24', '0000-00-00 00:00:00'),
(339, 'expense_head', 'no', '2016-08-10 05:21:43', '0000-00-00 00:00:00'),
(340, 'expense_detail', 'no', '2016-08-10 05:25:17', '0000-00-00 00:00:00'),
(341, 'add_expense', 'no', '2016-08-10 05:58:20', '0000-00-00 00:00:00'),
(342, 'edit_expense', 'no', '2016-08-10 06:03:33', '0000-00-00 00:00:00'),
(343, 'expense_list', 'no', '2016-08-10 06:07:48', '0000-00-00 00:00:00'),
(344, 'expense_head_list', 'no', '2016-08-10 06:15:58', '0000-00-00 00:00:00'),
(345, 'edit_expense_head', 'no', '2016-08-10 06:19:02', '0000-00-00 00:00:00'),
(347, 'add_expense_head', 'no', '2016-08-10 06:25:17', '0000-00-00 00:00:00'),
(348, 'attendance_already_submitted_you_can_edit_record', 'no', '2017-04-01 19:46:00', '0000-00-00 00:00:00'),
(349, 'attendance_already_submitted_as_holiday', 'no', '2017-04-01 19:46:00', '0000-00-00 00:00:00'),
(350, 'you_can_edit_record', 'no', '2016-08-10 17:41:54', '0000-00-00 00:00:00'),
(351, 'attendance_saved_successfully', 'no', '2017-04-01 19:46:00', '0000-00-00 00:00:00'),
(352, 'holiday', 'no', '2016-08-10 17:48:21', '0000-00-00 00:00:00'),
(353, 'mark_as_holiday', 'no', '2016-08-10 17:52:15', '0000-00-00 00:00:00'),
(354, 'no_attendance_prepare', 'no', '2016-08-10 18:12:18', '0000-00-00 00:00:00'),
(355, 'add_exam', 'no', '2016-08-10 18:39:04', '0000-00-00 00:00:00'),
(356, 'view_status', 'no', '2016-08-10 18:40:56', '0000-00-00 00:00:00'),
(357, 'marks_register_prepared', 'no', '2016-08-10 18:46:51', '0000-00-00 00:00:00'),
(358, 'exam_scheduled', 'no', '2016-08-10 18:46:51', '0000-00-00 00:00:00'),
(359, 'submit', 'no', '2016-08-10 19:00:47', '0000-00-00 00:00:00'),
(360, 'edit_grade', 'no', '2016-08-10 19:04:55', '0000-00-00 00:00:00'),
(361, 'add_grade', 'no', '2016-08-10 19:04:55', '0000-00-00 00:00:00'),
(362, 'percent_upto', 'no', '2016-08-10 19:06:04', '0000-00-00 00:00:00'),
(363, 'percent_from', 'no', '2016-08-10 19:06:04', '0000-00-00 00:00:00'),
(364, 'grade_list', 'no', '2016-08-10 19:09:49', '0000-00-00 00:00:00'),
(366, 'assign_subject', 'no', '2016-08-10 19:32:21', '0000-00-00 00:00:00'),
(368, 'edit_teacher', 'no', '2016-08-10 19:35:57', '0000-00-00 00:00:00'),
(369, 'add_teacher', 'no', '2016-08-10 19:52:14', '0000-00-00 00:00:00'),
(370, 'add_subject', 'no', '2016-08-10 20:00:48', '0000-00-00 00:00:00'),
(374, 'edit_subject', 'no', '2016-08-10 20:13:33', '0000-00-00 00:00:00'),
(375, 'edit_class', 'no', '2016-08-10 20:13:50', '0000-00-00 00:00:00'),
(377, 'edit_section', 'no', '2016-08-10 20:24:27', '0000-00-00 00:00:00'),
(378, 'upload_content', 'no', '2016-08-10 20:36:54', '0000-00-00 00:00:00'),
(380, 'content_list', 'no', '2016-08-10 21:00:03', '0000-00-00 00:00:00'),
(382, 'available_for_all_classes', 'no', '2016-10-23 01:56:48', '0000-00-00 00:00:00'),
(384, 'content_file', 'no', '2016-08-12 03:39:02', '0000-00-00 00:00:00'),
(385, 'available_for', 'no', '2016-08-12 03:39:02', '0000-00-00 00:00:00'),
(386, 'my_children', 'no', '2016-09-16 19:36:30', '0000-00-00 00:00:00'),
(387, 'assignment_list', 'no', '2016-08-12 03:45:21', '0000-00-00 00:00:00'),
(388, 'study_material_list', 'no', '2016-08-12 03:45:21', '0000-00-00 00:00:00'),
(389, 'syllabus_list', 'no', '2016-08-12 03:45:21', '0000-00-00 00:00:00'),
(390, 'other_download_list', 'no', '2016-08-12 03:45:21', '0000-00-00 00:00:00'),
(391, 'book_details', 'no', '2016-08-12 04:04:18', '0000-00-00 00:00:00'),
(392, 'edit_book', 'no', '2016-08-12 04:04:18', '0000-00-00 00:00:00'),
(393, 'book_list', 'no', '2016-08-12 04:06:33', '0000-00-00 00:00:00'),
(394, 'route_list', 'no', '2016-08-12 04:18:15', '0000-00-00 00:00:00'),
(395, 'create_route', 'no', '2016-08-12 04:18:15', '0000-00-00 00:00:00'),
(396, 'edit_route', 'no', '2016-08-12 04:18:15', '0000-00-00 00:00:00'),
(397, 'add_hostel', 'no', '2016-08-12 04:35:23', '0000-00-00 00:00:00'),
(398, 'edit_hostel', 'no', '2016-08-12 04:35:23', '0000-00-00 00:00:00'),
(399, 'hostel_list', 'no', '2016-08-12 04:35:23', '0000-00-00 00:00:00'),
(400, 'print', 'no', '2016-08-12 04:38:26', '0000-00-00 00:00:00'),
(401, 'room_type', 'no', '2016-08-12 04:43:23', '0000-00-00 00:00:00'),
(402, 'add_room_type', 'no', '2016-08-12 04:43:23', '0000-00-00 00:00:00'),
(403, 'room_type_list', 'no', '2016-08-12 04:43:23', '0000-00-00 00:00:00'),
(404, 'edit_room_type', 'no', '2016-08-12 04:43:23', '0000-00-00 00:00:00'),
(406, 'edit_message', 'no', '2016-08-12 04:58:45', '0000-00-00 00:00:00'),
(407, 'select', 'no', '2016-08-12 05:02:17', '0000-00-00 00:00:00'),
(408, 'general_settings', 'no', '2016-08-12 05:33:50', '0000-00-00 00:00:00'),
(410, 'session_start_month', 'no', '2016-08-12 05:34:48', '0000-00-00 00:00:00'),
(411, 'edit_session', 'no', '2016-08-12 05:47:13', '0000-00-00 00:00:00'),
(414, 'paypal_setting', 'no', '2016-08-12 06:20:26', '0000-00-00 00:00:00'),
(415, 'paypal_username', 'no', '2016-08-12 06:20:26', '0000-00-00 00:00:00'),
(416, 'paypal_password', 'no', '2016-08-12 06:20:26', '0000-00-00 00:00:00'),
(417, 'paypal_signature', 'no', '2016-08-12 06:20:26', '0000-00-00 00:00:00'),
(418, 'paypal_email', 'no', '2016-08-12 06:20:26', '0000-00-00 00:00:00'),
(419, 'off', 'no', '2016-08-12 06:20:43', '0000-00-00 00:00:00'),
(420, 'on', 'no', '2016-08-12 06:20:43', '0000-00-00 00:00:00'),
(421, 'backup_history', 'no', '2016-08-12 06:29:15', '0000-00-00 00:00:00'),
(422, 'create_backup', 'no', '2016-08-12 06:29:15', '0000-00-00 00:00:00'),
(423, 'backup_files', 'no', '2016-10-25 10:17:36', '0000-00-00 00:00:00'),
(424, 'upload_from_local_directory', 'no', '2016-08-12 06:33:51', '0000-00-00 00:00:00'),
(427, 'restore', 'no', '2016-08-12 11:34:46', '0000-00-00 00:00:00'),
(429, 'class_fees_detail', 'no', '2016-08-12 12:07:20', '0000-00-00 00:00:00'),
(430, 'no_fees_found', 'no', '2016-08-12 12:08:56', '0000-00-00 00:00:00'),
(431, 'monthly_fees_collection', 'no', '2016-08-12 12:13:22', '0000-00-00 00:00:00'),
(432, 'monthly_expenses', 'no', '2016-08-12 12:13:22', '0000-00-00 00:00:00'),
(433, 'teachers', 'no', '2016-08-12 12:13:22', '0000-00-00 00:00:00'),
(434, 'students', 'no', '2016-08-12 12:13:22', '0000-00-00 00:00:00'),
(436, 'login_details', 'no', '2016-08-12 12:27:20', '0000-00-00 00:00:00'),
(437, 'academic_fees_detail', 'no', '2016-08-12 13:03:38', '0000-00-00 00:00:00'),
(438, 'document_list', 'no', '2016-08-12 13:12:01', '0000-00-00 00:00:00'),
(439, 'exam_timetable', 'no', '2016-08-12 13:30:36', '0000-00-00 00:00:00'),
(440, 'promote_in_session', 'no', '2016-08-12 14:21:51', '0000-00-00 00:00:00'),
(441, 'promote_students_in_next_session', 'no', '2016-08-12 14:21:51', '0000-00-00 00:00:00'),
(442, 'next_session_status', 'no', '2016-08-12 14:25:11', '0000-00-00 00:00:00'),
(443, 'no_result_prepare', 'no', '2016-08-12 06:56:40', '0000-00-00 00:00:00'),
(444, 'parent_guardian_detail', 'no', '2016-08-12 07:29:14', '0000-00-00 00:00:00'),
(445, 'add_more_details', 'no', '2016-08-12 07:31:21', '0000-00-00 00:00:00'),
(446, 'if_permanent_address_is_current_address', 'no', '2016-10-05 11:28:39', '0000-00-00 00:00:00'),
(447, 'address_details', 'no', '2016-08-12 07:37:38', '0000-00-00 00:00:00'),
(449, 'add_image', 'no', '2016-08-12 07:55:27', '0000-00-00 00:00:00'),
(450, 'payment_id_detail', 'no', '2016-08-12 08:03:44', '0000-00-00 00:00:00'),
(451, 'section_name', 'no', '2016-08-12 08:33:59', '0000-00-00 00:00:00'),
(452, 'fees_type', 'no', '2016-08-12 09:02:20', '0000-00-00 00:00:00'),
(453, 'edit_hostel_room', 'no', '2016-08-16 01:37:57', '0000-00-00 00:00:00'),
(454, 'room_no_name', 'no', '2016-08-16 01:41:43', '0000-00-00 00:00:00'),
(455, 'no_of_bed', 'no', '2016-08-16 01:41:43', '0000-00-00 00:00:00'),
(456, 'cost_per_bed', 'no', '2016-08-16 01:41:43', '0000-00-00 00:00:00'),
(457, 'hostel_room_list', 'no', '2016-08-16 01:41:43', '0000-00-00 00:00:00'),
(458, 'add_hostel_room', 'no', '2016-08-16 01:46:48', '0000-00-00 00:00:00'),
(459, 'mark_register', 'no', '2016-08-16 01:51:56', '0000-00-00 00:00:00'),
(462, 'fill_mark', 'no', '2016-08-16 02:02:20', '0000-00-00 00:00:00'),
(463, 'post_new_message', 'no', '2016-08-16 02:05:16', '0000-00-00 00:00:00'),
(464, 'by_date', 'no', '2016-08-16 02:11:44', '0000-00-00 00:00:00'),
(465, 'edit_category', 'no', '2016-08-16 02:20:25', '0000-00-00 00:00:00'),
(466, 'exam_not_allotted', 'no', '2016-10-23 01:53:46', '0000-00-00 00:00:00'),
(467, 'edit_exam', 'no', '2016-08-16 02:31:50', '0000-00-00 00:00:00'),
(468, 'add_class', 'no', '2016-08-16 02:36:27', '0000-00-00 00:00:00'),
(469, 'teacher_subject', 'no', '2016-08-16 04:18:06', '0000-00-00 00:00:00'),
(470, 'dd', 'no', '2016-08-16 17:35:12', '0000-00-00 00:00:00'),
(471, 'cash', 'no', '2016-08-16 17:35:12', '0000-00-00 00:00:00'),
(472, 'cheque', 'no', '2016-08-16 17:35:12', '0000-00-00 00:00:00'),
(473, 'revert', 'no', '2016-08-16 18:10:47', '0000-00-00 00:00:00'),
(474, 'view', 'no', '2016-08-16 19:46:56', '0000-00-00 00:00:00'),
(475, 'no_exam_prepare', 'no', '2016-10-23 02:30:25', '0000-00-00 00:00:00'),
(476, 'sms_setting', 'no', '2016-08-22 03:15:46', '0000-00-00 00:00:00'),
(477, 'smart_school', 'no', '2016-08-24 18:11:16', '0000-00-00 00:00:00'),
(478, 'user_login', 'no', '2016-08-24 18:46:22', '0000-00-00 00:00:00'),
(479, 'library_book', 'no', '2016-09-06 13:40:41', '0000-00-00 00:00:00'),
(480, 'transport_routes', 'no', '2016-09-06 13:44:00', '0000-00-00 00:00:00'),
(481, 'hostel_rooms', 'no', '2016-09-06 13:47:22', '0000-00-00 00:00:00'),
(482, 'exam_schedule', 'no', '2016-09-06 13:57:03', '0000-00-00 00:00:00'),
(483, 'subjects', 'no', '2016-09-06 14:05:20', '0000-00-00 00:00:00'),
(484, 'national_identification_no', 'no', '2016-09-14 22:30:04', '0000-00-00 00:00:00'),
(485, 'local_identification_no', 'no', '2016-09-14 22:31:16', '0000-00-00 00:00:00'),
(486, 'my_profile', 'no', '2016-09-15 03:14:58', '0000-00-00 00:00:00'),
(487, 'mode', 'no', '2016-09-15 03:17:39', '0000-00-00 00:00:00'),
(488, 'url', 'no', '2016-09-15 05:54:06', '0000-00-00 00:00:00'),
(489, 'month', 'no', '2016-09-15 06:07:30', '0000-00-00 00:00:00'),
(490, 'upload', 'no', '2016-09-15 06:16:34', '0000-00-00 00:00:00'),
(491, 'day', 'no', '2016-10-23 18:32:31', '0000-00-00 00:00:00'),
(492, 'class_timetable', 'no', '2016-10-05 11:10:38', '0000-00-00 00:00:00'),
(493, 'if_guardian_address_is_current_address', 'no', '2016-10-07 11:42:51', '0000-00-00 00:00:00'),
(494, 'admin_login', 'no', '2016-10-17 15:38:26', '0000-00-00 00:00:00'),
(495, 'date_from', 'no', '2016-10-19 00:37:28', '0000-00-00 00:00:00'),
(496, 'other', 'no', '2016-10-25 09:31:08', '0000-00-00 00:00:00'),
(497, 'search_by_keyword', 'no', '2016-10-25 10:25:46', '0000-00-00 00:00:00'),
(499, 'add_book', 'no', '2016-10-31 06:22:54', '0000-00-00 00:00:00'),
(500, 'edit_vehicle_on_route', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(501, 'assign_vehicle_on_route', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(502, 'vehicle_route_list', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(503, 'route', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(504, 'vehicle_routes', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(505, 'edit_vehicle', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(506, 'vehicle', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(507, 'vehicle_list', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(508, 'add_vehicle', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(509, 'driver_contact', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(510, 'driver_license', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(511, 'driver_name', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(512, 'vehicle_no', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(513, 'vehicle_model', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(514, 'logout', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(515, 'year_made', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(516, 'attendance', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(517, 'show', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(519, 'add_timetable', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(520, 'edit_setting', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(521, 'subject_type', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(522, 'view_detail', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(523, 'exam_status', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(524, 'books', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(525, 'report_card', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(526, 'library_books', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(527, 'no_vehicle_allotted_to_this_route', 'no', '2017-04-01 19:46:00', '0000-00-00 00:00:00'),
(528, 'Add/Edit', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(529, 'language_rtl_text_mode', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(530, 'clickatell_username', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(531, 'clickatell_password', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(532, 'clickatell_api_id', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(533, 'clickatell_sms_gateway', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(534, 'twilio_sms_gateway', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(535, 'custom_sms_gateway', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(536, 'twilio_account_sid', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(537, 'authentication_token', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(538, 'registered_phone_number', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(539, 'username', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(540, 'gateway_name', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(541, 'theory', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(542, 'practical', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(543, 'present', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(544, 'paid', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(545, 'yes', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(546, 'if_guardian_is', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(547, 'current_session', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(548, 'quick_links', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(549, 'student_details', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(550, 'student_admission', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(551, 'student_categories', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(552, 'promote_students', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(554, 'fees_master', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(555, 'search_fees_payment', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(556, 'search_due_fees', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(557, 'fees_statement', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(558, 'balance_fees_report', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(559, 'search_expense', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(560, 'student_attendance', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(561, 'attendance_by_date', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(562, 'attendance_report', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(563, 'marks_register', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(564, 'marks_grade', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(565, 'assign_subjects', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(566, 'sections', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(567, 'assignments', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(568, 'study_material', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(569, 'routes', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(570, 'vehicles', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(571, 'assign_vehicle', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(572, 'send_message', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(573, 'student_report', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(574, 'transaction_report', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(575, 'exam_marks_report', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(576, 'session_setting', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(577, 'backup / restore', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(578, 'languages', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(579, 'grade', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(580, 'percentage', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(581, 'fees_collection_&_expenses_for_session', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(582, 'fees_receipt', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(583, 'fees_category', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(584, 'fees_collection_&_expenses_for', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(585, 'library_-_books', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(586, 'transport_-_routes', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(587, 'hostel_-_rooms', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(588, 'search_by_name,_roll_no,_enroll_no,_national_identification_no,_local_identification_no_etc..', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(589, 'user_type', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(590, 'login_url', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(591, 'search_student', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(592, 'student_lists', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(593, 'detailed_view', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(595, 'active', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(596, 'syllabus', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(597, 'other_downloads', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(598, 'download', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(599, 'unpaid', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(600, 'enter_room_no', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(601, 'male', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(602, 'female', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(603, 'expense_result', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(604, 'view_schedule', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(605, 'pdf', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(606, 'not', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(607, 'scheduled', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(609, 'transaction_from', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(610, 'to', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(611, 'enabled', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(612, 'disabled', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(613, 'add_language', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(614, 'no_description', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(615, 'fees_category_list', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(616, 'add_fee_category', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(617, 'edit_fee_category', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(618, 'late_with_excuse', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(619, 'late', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(620, 'absent', 'no', '2017-04-01 18:09:09', '0000-00-00 00:00:00'),
(621, 'issue_book', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(622, 'member_type', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(623, 'issue', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(624, 'book', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(625, 'members', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(626, 'library_card_no', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(627, 'return_date', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(628, 'member_id', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(629, 'book_issued', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(630, 'timezone', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(631, 'accountants', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(632, 'librarians', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(633, 'add_librarian', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(634, 'librarian_photo', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(635, 'librarian_list', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(636, 'edit_librarian', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(637, 'current_username', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(638, 'new_username', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(639, 'confirm_username', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(640, 'change_username', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(641, 'add_accountant', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(642, 'accountant_list', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(643, 'accountant_photo', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(644, 'edit_accountant', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(645, 'book_no', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(646, 'users', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(647, 'isbn_no', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(648, 'issue_return', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(649, 'add_student', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(650, 'books_issue_return', 'no', '2017-05-19 11:33:58', '0000-00-00 00:00:00'),
(651, 'member_list', 'no', '2017-05-29 12:41:22', '0000-00-00 00:00:00'),
(652, 'issue_date', 'no', '2017-05-29 12:41:22', '0000-00-00 00:00:00'),
(653, 'surrender_membership', 'no', '2017-05-29 12:41:22', '0000-00-00 00:00:00'),
(654, 'fees_group', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(655, 'add_fees_group', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(656, 'fees_group_list', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(657, 'due_date', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(658, 'fees_code', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(659, 'fees_discount', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(660, 'edit_fees_discount', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(661, 'discount_code', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(662, 'fees_discount_list', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(663, 'add_fees_discount', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(664, 'all', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(665, 'assign_fees_discount', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(666, 'partial', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(667, 'applied', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(668, 'student_fees', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(669, 'confirmation', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(670, 'assign / view', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(671, 'edit_fees_group', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(672, 'edit_fees_type', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(673, 'edit_fees_master', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(674, 'apply_discount', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(675, 'discount_of', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(676, 'add_member', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(677, 'email_setting', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(678, 'email_engine', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(679, 'smtp_username', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(680, 'smtp_password', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(681, 'smtp_server', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(682, 'smtp_port', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(683, 'smtp_security', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(684, 'assigned', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(685, 'admin_users', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(686, 'add_admin_user', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(687, 'admin_name', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(688, 'admin_email', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(689, 'admin_password', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(690, 'forgot_password', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(691, 'assign_fees_group', 'no', '2017-08-02 08:19:55', '0000-00-00 00:00:00'),
(692, 'accountant', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(693, 'add_income', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(694, 'add_item_store', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(695, 'admin', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(696, 'attach_document', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(697, 'confirm_return', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(698, 'contact_person_email', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(699, 'contact_person_name', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(700, 'edit_income_head', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(701, 'edit_item_store', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(702, 'edit_item_category', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(703, 'group', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(704, 'guardians', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(705, 'income_head_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(706, 'income_head', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(707, 'income', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(708, 'individual', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(709, 'inventory', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(710, 'issue_by', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(711, 'issue_to', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(712, 'issue_item', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(713, 'item_store', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(714, 'item_category', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(715, 'item', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(716, 'item_stock_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(717, 'item_store_code', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(718, 'item_store_name', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(719, 'item_supplier_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(720, 'librarian', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(721, 'quantity', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(722, 'reset_password', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(723, 'return', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(724, 'returned', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(725, 'search_income', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(726, 'sms', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(727, 'store', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(728, 'supplier', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(729, 'add_item_category', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(730, 'add_item', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(731, 'add_item_stock', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(732, 'add_item_supplier', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(733, 'available_quantity', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(734, 'contact_person_phone', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(735, 'edit_item_supplier', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(736, 'edit_item', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(737, 'edit_income', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(738, 'expense_details', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(739, 'income_details', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(740, 'income_id', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(741, 'income_result', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(742, 'issued_by', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(743, 'item_category_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(744, 'item_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(745, 'item_store_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(746, 'item_supplier', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(747, 'contact_person', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(748, 'send_through', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(749, 'auth_Key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(750, 'current_theme', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(751, 'guardian_email', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(752, 'hash_key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(753, 'income_list', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(754, 'income_result', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(755, 'income_search', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(756, 'MSG_91', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(757, 'notification_setting', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(758, 'sender_id', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(759, 'SMS_country', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(760, 'Text_Local', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(761, 'user_log', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(762, 'send_email_/_sms', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(763, 'email_/_sms', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(764, 'email_/_sms_log', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(765, 'payment_methods', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(766, 'all_users', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(767, 'stripe_api_secret_key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(768, 'stripe_publishable_key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(769, 'payu_money_key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(770, 'payu_money_salt', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(771, 'merchant_id', 'no', '2017-12-14 06:54:50', '0000-00-00 00:00:00'),
(772, 'working_key', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(773, 'select_payment_gateway', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(774, 'exam_result', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(775, 'fees_submission', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(776, 'absent_student', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(777, 'login_credential', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(778, 'role', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(779, 'ip_address', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(780, 'login_time', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(781, 'user_agent', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00'),
(782, 'click_to_return', 'no', '2017-12-13 20:02:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lang_pharses`
--

CREATE TABLE `lang_pharses` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `key_id` int(11) DEFAULT NULL,
  `pharses` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `text` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lang_pharses`
--

INSERT INTO `lang_pharses` (`id`, `lang_id`, `key_id`, `pharses`, `text`, `is_active`, `created_at`, `updated_at`) VALUES
(997, 4, 620, 'Absent', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(998, 4, 437, 'Academic Fees Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(999, 4, 211, 'Academics', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1000, 4, 79, 'Action', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1001, 4, 595, 'Active', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1002, 4, 228, 'Add', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1003, 4, 64, 'Add Another Language', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1004, 4, 499, 'Add Book', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1005, 4, 51, 'Add Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1006, 4, 468, 'Add Class', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1007, 4, 355, 'Add Exam', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1008, 4, 341, 'Add Expense', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1009, 4, 347, 'Add Expense Head', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1010, 4, 616, 'Add Fee Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1011, 4, 35, 'Add Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1012, 4, 43, 'Add Fees Master', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1013, 4, 45, 'Add Fees Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1014, 4, 361, 'Add Grade', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1015, 4, 397, 'Add Hostel', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1016, 4, 458, 'Add Hostel Room', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1017, 4, 449, 'Add Image', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1018, 4, 613, 'Add Language', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1019, 4, 445, 'Add More Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1020, 4, 137, 'Add New SMS Configuration', NULL, 'no', '2017-04-10 03:10:03', '0000-00-00 00:00:00'),
(1021, 4, 402, 'Add Room Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1022, 4, 57, 'Add Section', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1023, 4, 53, 'Add Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1024, 4, 370, 'Add Subject', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1025, 4, 369, 'Add Teacher', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1026, 4, 519, 'Add Timetable', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1027, 4, 508, 'Add Vehicle', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1028, 4, 528, 'Add/Edit', NULL, 'no', '2017-04-10 03:10:22', '0000-00-00 00:00:00'),
(1029, 4, 164, 'Address', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1030, 4, 447, 'Address Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1031, 4, 494, 'Admin Login', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1032, 4, 303, 'Admission', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1033, 4, 11, 'Admission Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1034, 4, 181, 'Admission Discount', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1035, 4, 170, 'Admission Number', NULL, 'no', '2017-05-19 21:10:16', '0000-00-00 00:00:00'),
(1036, 4, 89, 'Amount', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1038, 4, 366, 'Assign Subject', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1039, 4, 565, 'Assign Subjects', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1040, 4, 571, 'Assign Vehicle', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1041, 4, 501, 'Assign Vehicle On Route', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1042, 4, 387, 'Assignment List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1043, 4, 567, 'Assignments', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1044, 4, 516, 'Attendance', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1045, 4, 349, 'Attendance Already Submitted As Holiday', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1046, 4, 348, 'Attendance Already Submitted You Can Edit Record', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1047, 4, 561, 'Attendance By Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1048, 4, 562, 'Attendance Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1049, 4, 351, 'Attendance Saved Successfully', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1050, 4, 537, 'Authentication Token', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1051, 4, 190, 'Author', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1052, 4, 385, 'Available For', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1053, 4, 382, 'Available For All Classes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1054, 4, 577, 'Backup / Restore', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1055, 4, 423, 'Backup Files', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1056, 4, 421, 'Backup History', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1057, 4, 108, 'Balance', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1058, 4, 92, 'Balance Description', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1059, 4, 320, 'Balance Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1060, 4, 328, 'Balance Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1061, 4, 558, 'Balance Fees Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1062, 4, 23, 'Bank Account Number', NULL, 'no', '2017-05-19 21:10:30', '0000-00-00 00:00:00'),
(1063, 4, 24, 'Bank Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1064, 4, 227, 'Basic Information', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1065, 4, 391, 'Book Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1066, 4, 393, 'Book List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1067, 4, 199, 'Book Title', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1068, 4, 192, 'Book Price', NULL, 'no', '2017-04-10 03:13:06', '0000-00-00 00:00:00'),
(1069, 4, 524, 'Books', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1070, 4, 464, 'By Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1071, 4, 141, 'Cancel', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1072, 4, 471, 'Cash', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1073, 4, 168, 'Cast', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1074, 4, 16, 'Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1075, 4, 50, 'Category List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1076, 4, 275, 'Change Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1077, 4, 80, 'Change Status', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1078, 4, 472, 'Cheque', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1079, 4, 9, 'Class', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1080, 4, 429, 'Class Fees Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1081, 4, 54, 'Class List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1082, 4, 333, 'Class Section', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1083, 4, 492, 'Class Timetable', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1084, 4, 116, 'Classes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1085, 4, 532, 'Clickatell Api Id', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1086, 4, 531, 'Clickatell Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1087, 4, 533, 'Clickatell SMS Gateway', NULL, 'no', '2017-04-10 03:14:20', '0000-00-00 00:00:00'),
(1088, 4, 530, 'Clickatell Username', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1089, 4, 319, 'Collect Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1090, 4, 330, 'Collect Transport Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1091, 4, 117, 'Collection', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1092, 4, 284, 'Communicate', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1093, 4, 252, 'Compose New Message', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1094, 4, 123, 'Confirm Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1095, 4, 384, 'Content File', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1096, 4, 380, 'Content List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1097, 4, 246, 'Content Title', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1098, 4, 203, 'Content Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1099, 4, 233, 'Continue', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1100, 4, 456, 'Cost Per Bed', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1101, 4, 422, 'Create Backup', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1102, 4, 263, 'Create Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1103, 4, 395, 'Create Route', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1104, 4, 65, 'Created At', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1105, 4, 295, 'Currency', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1106, 4, 296, 'Currency Symbol', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1107, 4, 302, 'Current', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1108, 4, 17, 'Current Address', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1109, 4, 121, 'Current Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1110, 4, 547, 'Current Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1111, 4, 535, 'Custom SMS Gateway', NULL, 'no', '2017-04-10 03:15:00', '0000-00-00 00:00:00'),
(1112, 4, 125, 'Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1113, 4, 294, 'Date Format', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1114, 4, 495, 'Date From', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1115, 4, 13, 'Date Of Birth', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1116, 4, 225, 'Date To', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1117, 4, 491, 'Day', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1118, 4, 470, 'DD', NULL, 'no', '2017-04-10 03:15:12', '0000-00-00 00:00:00'),
(1120, 4, 311, 'Delete', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1121, 4, 107, 'Deposit', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1122, 4, 101, 'Description', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1123, 4, 593, 'Detailed View', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1124, 4, 306, 'Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1125, 4, 612, 'Disabled', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1126, 4, 91, 'Discount', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1127, 4, 292, 'Download Sample Import File', NULL, 'no', '2017-04-10 03:16:06', '0000-00-00 00:00:00'),
(1128, 4, 438, 'Document List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1129, 4, 312, 'Documents', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1130, 4, 598, 'Download', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1131, 4, 212, 'Download Center', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1132, 4, 321, 'Download PDF', NULL, 'no', '2017-04-10 03:16:23', '0000-00-00 00:00:00'),
(1133, 4, 509, 'Driver Contact', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1134, 4, 510, 'Driver License', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1135, 4, 511, 'Driver Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1136, 4, 48, 'Edit', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1137, 4, 392, 'Edit Book', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1138, 4, 465, 'Edit Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1139, 4, 375, 'Edit Class', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1140, 4, 467, 'Edit Exam', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1141, 4, 342, 'Edit Expense', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1142, 4, 345, 'Edit Expense Head', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1143, 4, 617, 'Edit Fee Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1144, 4, 360, 'Edit Grade', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1145, 4, 398, 'Edit Hostel', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1146, 4, 453, 'Edit Hostel Room', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1147, 4, 72, 'Edit Logo', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1148, 4, 406, 'Edit Message', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1149, 4, 272, 'Edit Notification', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1150, 4, 404, 'Edit Room Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1151, 4, 396, 'Edit Route', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1152, 4, 377, 'Edit Section', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1153, 4, 411, 'Edit Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1154, 4, 520, 'Edit Setting', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1155, 4, 374, 'Edit Subject', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1156, 4, 368, 'Edit Teacher', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1157, 4, 505, 'Edit Vehicle', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1158, 4, 500, 'Edit Vehicle On Route', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1159, 4, 3, 'Email', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1160, 4, 611, 'Enabled', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1161, 4, 238, 'End Time', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1162, 4, 171, 'Enrollment Number', NULL, 'no', '2017-05-19 21:10:51', '0000-00-00 00:00:00'),
(1163, 4, 600, 'Enter Room Number', NULL, 'no', '2017-05-19 21:11:06', '0000-00-00 00:00:00'),
(1164, 4, 236, 'Exam', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1165, 4, 235, 'Exam List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1166, 4, 575, 'Exam Marks Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1167, 4, 142, 'Exam Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1168, 4, 466, 'Exam Not Allotted', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1169, 4, 482, 'Exam Schedule', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1170, 4, 358, 'Exam Scheduled', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1171, 4, 523, 'Exam Status', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1172, 4, 439, 'Exam Timetable', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1173, 4, 210, 'Examinations', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1174, 4, 340, 'Expense Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1175, 4, 339, 'Expense Head', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1176, 4, 344, 'Expense Head List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1177, 4, 338, 'Expense Id', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1178, 4, 343, 'Expense List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1179, 4, 603, 'Expense Result', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1180, 4, 206, 'Expenses', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1181, 4, 33, 'Export Format', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1182, 4, 232, 'Fail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1183, 4, 202, 'Fare', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1184, 4, 287, 'Father', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1185, 4, 157, 'Father Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1186, 4, 159, 'Father Occupation', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1187, 4, 158, 'Father Phone', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1188, 4, 39, 'Fee Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1189, 4, 115, 'Fees Master', NULL, 'no', '2017-04-10 03:18:52', '0000-00-00 00:00:00'),
(1190, 4, 40, 'Fees Type', NULL, 'no', '2017-04-10 03:18:56', '0000-00-00 00:00:00'),
(1191, 4, 184, 'Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1192, 4, 583, 'Fees Category', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1193, 4, 615, 'Fees Category List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1195, 4, 208, 'Fees Collection', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1196, 4, 584, 'Fees Collection & Expenses For', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1197, 4, 581, 'Fees Collection & Expenses For Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1198, 4, 337, 'Fees Collection Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1199, 4, 156, 'Fees Discount', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1200, 4, 554, 'Fees Master', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1201, 4, 44, 'Fees Master List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1202, 4, 582, 'Fees Receipt', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1203, 4, 557, 'Fees Statement', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1204, 4, 102, 'Fees Subtotal', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1205, 4, 452, 'Fees Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1206, 4, 46, 'Fees Type List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1207, 4, 602, 'Female', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1208, 4, 462, 'Fill Marks', NULL, 'no', '2017-12-08 19:17:41', '0000-00-00 00:00:00'),
(1209, 4, 87, 'Fine', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1210, 4, 7, 'First Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1211, 4, 240, 'Full Marks', NULL, 'no', '2017-12-08 19:18:08', '0000-00-00 00:00:00'),
(1212, 4, 299, 'Full Marks', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1213, 4, 540, 'Gateway Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1214, 4, 186, 'Gender', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1215, 4, 408, 'General Setting', NULL, 'no', '2017-12-14 08:16:34', '0000-00-00 00:00:00'),
(1216, 4, 34, 'Generate PDF', NULL, 'no', '2017-04-10 03:20:09', '0000-00-00 00:00:00'),
(1217, 4, 579, 'Grade', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1218, 4, 364, 'Grade List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1219, 4, 145, 'Grade Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1220, 4, 106, 'Grand Total', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1221, 4, 327, 'Gross Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1222, 4, 30, 'Guardian Address', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1223, 4, 273, 'Guardian Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1224, 4, 27, 'Guardian Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1225, 4, 163, 'Guardian Occupation', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1226, 4, 29, 'Guardian Phone', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1227, 4, 28, 'Guardian Relation', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1228, 4, 352, 'Holiday', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1229, 4, 220, 'Hostel', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1230, 4, 587, 'Hostel - Rooms', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1231, 4, 399, 'Hostel List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1232, 4, 221, 'Hostel Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1233, 4, 457, 'Hostel Room List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1234, 4, 481, 'Hostel Rooms', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1235, 4, 169, 'Id', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1236, 4, 309, 'Identification', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1237, 4, 493, 'If Guardian Address is Current Address', NULL, 'no', '2017-04-10 03:20:50', '0000-00-00 00:00:00'),
(1238, 4, 546, 'If Guardian Is', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1239, 4, 446, 'If Permanent Address is Current Address', NULL, 'no', '2017-04-10 03:20:57', '0000-00-00 00:00:00'),
(1240, 4, 25, 'IFSC Code', NULL, 'no', '2017-04-10 03:21:18', '0000-00-00 00:00:00'),
(1241, 4, 32, 'Import Excel', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1242, 4, 291, 'Import Student', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1243, 4, 197, 'Intake', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1244, 4, 86, 'Invoice Number', NULL, 'no', '2017-05-19 21:11:26', '0000-00-00 00:00:00'),
(1245, 4, 188, 'ISBN', NULL, 'no', '2017-04-10 03:21:32', '0000-00-00 00:00:00'),
(1246, 4, 165, 'Language', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1247, 4, 63, 'Language List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1248, 4, 529, 'Language RTL Text Mode', NULL, 'no', '2017-04-10 03:21:53', '0000-00-00 00:00:00'),
(1249, 4, 578, 'Languages', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1250, 4, 8, 'Last Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1251, 4, 619, 'Late', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1252, 4, 618, 'Late With Excuse', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1253, 4, 234, 'Leave', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1254, 4, 214, 'Library', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1255, 4, 585, 'Library - Books', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1256, 4, 479, 'Library Book', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1257, 4, 526, 'Library Books', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1258, 4, 229, 'List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1259, 4, 485, 'Local Identification Number', NULL, 'no', '2017-05-19 21:11:34', '0000-00-00 00:00:00'),
(1260, 4, 436, 'Login Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1261, 4, 590, 'Login Url', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1262, 4, 514, 'Logout', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1263, 4, 601, 'Male', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1264, 4, 70, 'Manage', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1265, 4, 353, 'Mark As Holiday', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1266, 4, 459, 'Marks Register', NULL, 'no', '2017-12-08 19:18:46', '0000-00-00 00:00:00'),
(1267, 4, 564, 'Marks Grade', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1268, 4, 563, 'Marks Register', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1269, 4, 357, 'Marks Register Prepared', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1270, 4, 265, 'Message', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1271, 4, 256, 'Message To', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1272, 4, 270, 'Miscellaneous Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1273, 4, 12, 'Mobile Number', NULL, 'no', '2017-05-19 21:11:39', '0000-00-00 00:00:00'),
(1274, 4, 487, 'Mode', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1275, 4, 489, 'Month', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1276, 4, 432, 'Monthly Expenses', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1277, 4, 431, 'Monthly Fees Collection', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1278, 4, 288, 'Mother', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1279, 4, 160, 'Mother Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1280, 4, 162, 'Mother Occupation', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1281, 4, 161, 'Mother Phone', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1282, 4, 386, 'My Children', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1283, 4, 486, 'My Profile', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1284, 4, 153, 'Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1285, 4, 484, 'National Identification Number', NULL, 'no', '2017-09-10 22:39:06', '0000-00-00 00:00:00'),
(1286, 4, 122, 'New Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1287, 4, 442, 'Next Session Status', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1288, 4, 310, 'No', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1289, 4, 354, 'No Attendance Prepared', NULL, 'no', '2017-04-10 03:23:26', '0000-00-00 00:00:00'),
(1290, 4, 614, 'No Description', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1291, 4, 475, 'No Exam Prepared', NULL, 'no', '2017-04-10 03:23:35', '0000-00-00 00:00:00'),
(1292, 4, 430, 'No Fees Found', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1293, 4, 455, 'Number Of Bed', NULL, 'no', '2017-05-19 17:13:42', '0000-00-00 00:00:00'),
(1294, 4, 201, 'Number Of Vehicle', NULL, 'no', '2017-05-19 17:13:54', '0000-00-00 00:00:00'),
(1295, 4, 259, 'No Record Found', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1296, 4, 443, 'No Result Prepared', NULL, 'no', '2017-04-10 03:23:47', '0000-00-00 00:00:00'),
(1297, 4, 94, 'No Search Record Found', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1298, 4, 317, 'No Transaction Found', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1299, 4, 331, 'No Transport Fees Found', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1300, 4, 527, 'No vehicle allotted to this route', NULL, 'no', '2017-04-10 03:24:28', '0000-00-00 00:00:00'),
(1301, 4, 606, 'Not', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1302, 4, 290, 'Not Scheduled', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1303, 4, 150, 'Note', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1304, 4, 253, 'Notice', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1305, 4, 285, 'Notice Board', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1306, 4, 254, 'Notice Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1307, 4, 278, 'Notifications', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1308, 4, 300, 'Obtain Marks', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1309, 4, 419, 'Off', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1310, 4, 420, 'On', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1311, 4, 496, 'Other', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1312, 4, 335, 'Other Discount', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1313, 4, 390, 'Other Download List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1314, 4, 597, 'Other Downloads', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1315, 4, 544, 'Paid', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1316, 4, 324, 'Paid Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1317, 4, 257, 'Parent', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1318, 4, 444, 'Parent Guardian Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1319, 4, 231, 'Pass', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1320, 4, 241, 'Passing Marks', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1321, 4, 167, 'Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1322, 4, 313, 'Payment', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1323, 4, 274, 'Payment Id', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1324, 4, 450, 'Payment Id Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1325, 4, 418, 'Paypal Email', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1326, 4, 416, 'Paypal Password', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1327, 4, 414, 'Paypal Setting', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1328, 4, 417, 'Paypal Signature', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1329, 4, 415, 'Paypal Username', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1330, 4, 605, 'PDF', NULL, 'no', '2017-04-10 03:25:16', '0000-00-00 00:00:00'),
(1331, 4, 147, 'Percent', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1332, 4, 363, 'Percent From', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1333, 4, 149, 'Percent To', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1334, 4, 362, 'Percent Upto', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1335, 4, 580, 'Percentage', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1336, 4, 18, 'Permanent Address', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1337, 4, 73, 'Phone', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1339, 4, 463, 'Post New Message', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1340, 4, 193, 'Post Date', NULL, 'no', '2017-04-10 03:25:57', '0000-00-00 00:00:00'),
(1341, 4, 542, 'Practical', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1342, 4, 543, 'Present', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1343, 4, 267, 'Previous School Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1344, 4, 400, 'Print', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1345, 4, 329, 'Print Selected', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1346, 4, 297, 'Profile', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1347, 4, 245, 'Promote', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1348, 4, 440, 'Promote In Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1349, 4, 552, 'Promote Students', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1350, 4, 441, 'Promote Students In Next Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1351, 4, 286, 'Publish Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1352, 4, 255, 'Publish On', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1353, 4, 189, 'Publisher', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1354, 4, 191, 'Qty', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1355, 4, 548, 'Quick Links', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1356, 4, 218, 'Rack Number', NULL, 'no', '2017-05-19 21:12:23', '0000-00-00 00:00:00'),
(1357, 4, 104, 'Receipt Number', NULL, 'no', '2017-05-19 21:12:19', '0000-00-00 00:00:00'),
(1358, 4, 538, 'Registered Phone Number', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1359, 4, 15, 'Religion', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1360, 4, 82, 'Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1361, 4, 525, 'Report Card', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1362, 4, 216, 'Reports', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1363, 4, 85, 'Reset', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1364, 4, 427, 'Restore', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1365, 4, 230, 'Result', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1366, 4, 473, 'Revert', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1367, 4, 6, 'Roll Number', NULL, 'no', '2017-05-19 21:12:27', '0000-00-00 00:00:00'),
(1368, 4, 239, 'Room', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1369, 4, 242, 'Room Number', NULL, 'no', '2017-05-19 21:12:33', '0000-00-00 00:00:00'),
(1370, 4, 454, 'Room Number / Name', NULL, 'no', '2017-05-19 17:15:35', '0000-00-00 00:00:00'),
(1371, 4, 401, 'Room Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1372, 4, 403, 'Room Type List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1373, 4, 503, 'Route', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1374, 4, 394, 'Route List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1375, 4, 223, 'Route Title', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1376, 4, 569, 'Routes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1377, 4, 185, 'RTE', NULL, 'no', '2017-04-10 03:27:10', '0000-00-00 00:00:00'),
(1378, 4, 66, 'Save', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1379, 4, 298, 'Save Attendance', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1380, 4, 607, 'Scheduled', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1381, 4, 151, 'School Code', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1383, 4, 69, 'School Logo', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1384, 4, 2, 'School Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1385, 4, 37, 'Search', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1386, 4, 497, 'Search By Keyword', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1387, 4, 588, 'Search By Name, Roll Number, Enroll Number, National Id, Local Id Etc..', NULL, 'no', '2017-05-19 21:12:47', '0000-00-00 00:00:00'),
(1388, 4, 556, 'Search Due Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1389, 4, 559, 'Search Expense', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1390, 4, 555, 'Search Fees Payment', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1391, 4, 591, 'Search Student', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1392, 4, 336, 'Search Transaction', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1393, 4, 10, 'Section', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1394, 4, 56, 'Section List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1395, 4, 451, 'Section Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1396, 4, 566, 'Sections', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1397, 4, 407, 'Select', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1398, 4, 84, 'Select Criteria', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1399, 4, 293, 'Select CSV File', NULL, 'no', '2017-04-10 03:28:35', '0000-00-00 00:00:00'),
(1400, 4, 31, 'Select Image', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1401, 4, 68, 'Select Logo', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1402, 4, 266, 'Send', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1403, 4, 572, 'Send Message', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1404, 4, 1, 'Session', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1405, 4, 52, 'Session List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1406, 4, 576, 'Session Setting', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1407, 4, 410, 'Session Start Month', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1408, 4, 517, 'Show', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1409, 4, 305, 'Sibling', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1411, 4, 152, 'Sign In', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1412, 4, 477, 'Smart School', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1413, 4, 76, 'SMS Configuration', NULL, 'no', '2017-04-10 03:29:11', '0000-00-00 00:00:00'),
(1414, 4, 77, 'SMS Gateway URL', NULL, 'no', '2017-05-19 17:17:13', '0000-00-00 00:00:00'),
(1415, 4, 476, 'SMS Setting', NULL, 'no', '2017-04-10 03:29:22', '0000-00-00 00:00:00'),
(1416, 4, 237, 'Start Time', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1417, 4, 78, 'Status', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1418, 4, 61, 'Student', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1419, 4, 550, 'Student Admission', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1420, 4, 560, 'Student Attendance', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1421, 4, 551, 'Student Categories', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1422, 4, 325, 'Student Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1423, 4, 549, 'Student Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1424, 4, 322, 'Student Fees Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1425, 4, 207, 'Student Information', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1426, 4, 592, 'Students List', NULL, 'no', '2017-04-10 03:29:55', '0000-00-00 00:00:00'),
(1427, 4, 183, 'Student Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1428, 4, 573, 'Student Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1429, 4, 434, 'Students', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1430, 4, 568, 'Study Material', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1431, 4, 388, 'Study Material List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1432, 4, 217, 'Subject', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1433, 4, 144, 'Subject Code', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1434, 4, 261, 'Subject List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1435, 4, 143, 'Subject Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1436, 4, 521, 'Subject Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1437, 4, 483, 'Subjects', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1438, 4, 359, 'Submit', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1439, 4, 596, 'Syllabus', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1440, 4, 389, 'Syllabus List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1441, 4, 215, 'System Settings', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1442, 4, 258, 'Teacher', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1443, 4, 260, 'Teacher Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1444, 4, 251, 'Teacher List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1445, 4, 166, 'Teacher Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1446, 4, 187, 'Teacher Photo', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1447, 4, 469, 'Teacher Subject', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1448, 4, 433, 'Teachers', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1449, 4, 541, 'Theory', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1450, 4, 264, 'Title', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1451, 4, 610, 'To', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1452, 4, 90, 'Total', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1453, 4, 182, 'Total Balance', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1454, 4, 323, 'Total Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1455, 4, 301, 'Total Marks', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1456, 4, 180, 'Total Paid Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1457, 4, 332, 'Total Transport Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1458, 4, 609, 'Transaction From', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1459, 4, 574, 'Transaction Report', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1460, 4, 222, 'Transport', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1461, 4, 586, 'Transport - Routes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1462, 4, 155, 'Transport Fees', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1463, 4, 318, 'Transport Fees Details', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1464, 4, 480, 'Transport Routes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1465, 4, 536, 'Twilio Account SID', NULL, 'no', '2017-04-10 03:31:04', '0000-00-00 00:00:00'),
(1466, 4, 534, 'Twilio SMS Gateway', NULL, 'no', '2017-04-10 03:31:10', '0000-00-00 00:00:00'),
(1467, 4, 88, 'Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1468, 4, 599, 'Unpaid', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1469, 4, 490, 'Upload', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1470, 4, 378, 'Upload Content', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1471, 4, 205, 'Upload Date', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1472, 4, 268, 'Upload Documents', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1473, 4, 424, 'Upload From Local Directory', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1474, 4, 488, 'URL', NULL, 'no', '2017-04-10 03:31:27', '0000-00-00 00:00:00'),
(1475, 4, 478, 'User Login', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1476, 4, 74, 'User Name', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1477, 4, 589, 'User Type', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1478, 4, 539, 'Username', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1479, 4, 506, 'Vehicle', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1480, 4, 507, 'Vehicle List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1481, 4, 513, 'Vehicle Model', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1482, 4, 512, 'Vehicle Number', NULL, 'no', '2017-05-19 21:12:56', '0000-00-00 00:00:00'),
(1483, 4, 502, 'Vehicle Route List', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1484, 4, 504, 'Vehicle Routes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1485, 4, 570, 'Vehicles', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1486, 4, 474, 'View', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1487, 4, 522, 'View Detail', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1488, 4, 604, 'View Schedule', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1489, 4, 356, 'View Status', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1490, 4, 280, 'Visibility', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1491, 4, 279, 'Visible To All', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1492, 4, 515, 'Year Made', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1493, 4, 545, 'Yes', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(1494, 4, 350, 'You Can Edit Record', NULL, 'no', '2017-04-06 05:18:39', '0000-00-00 00:00:00'),
(36671, 4, 642, 'Accountant List', NULL, 'no', '2017-05-19 17:03:47', '0000-00-00 00:00:00'),
(36672, 4, 643, 'Accountant Photo', NULL, 'no', '2017-05-19 17:03:56', '0000-00-00 00:00:00'),
(36673, 4, 631, 'Accountants', NULL, 'no', '2017-05-19 17:04:03', '0000-00-00 00:00:00'),
(36674, 4, 641, 'Add Accountant', NULL, 'no', '2017-05-19 17:04:14', '0000-00-00 00:00:00'),
(36675, 4, 633, 'Add Librarian', NULL, 'no', '2017-05-19 17:04:40', '0000-00-00 00:00:00'),
(36677, 4, 649, 'Add Student', NULL, 'no', '2017-05-19 17:05:41', '0000-00-00 00:00:00'),
(36678, 4, 624, 'Book', NULL, 'no', '2017-05-19 17:06:04', '0000-00-00 00:00:00'),
(36679, 4, 629, 'Book Issued', NULL, 'no', '2017-05-19 17:06:13', '0000-00-00 00:00:00'),
(36680, 4, 645, 'Book Number', NULL, 'no', '2017-05-19 17:06:30', '0000-00-00 00:00:00'),
(36681, 4, 650, 'Books Issue Retun', NULL, 'no', '2017-05-19 17:06:49', '0000-00-00 00:00:00'),
(36682, 4, 640, 'Change Username', NULL, 'no', '2017-05-19 17:07:05', '0000-00-00 00:00:00'),
(36683, 4, 639, 'Confirm Username', NULL, 'no', '2017-05-19 17:07:39', '0000-00-00 00:00:00'),
(36684, 4, 637, 'Current Username', NULL, 'no', '2017-05-19 17:08:06', '0000-00-00 00:00:00'),
(36685, 4, 644, 'Edit Accountant', NULL, 'no', '2017-05-19 17:08:44', '0000-00-00 00:00:00'),
(36686, 4, 636, 'Edit Librarian', NULL, 'no', '2017-05-19 17:09:30', '0000-00-00 00:00:00'),
(36687, 4, 647, 'ISBN Number', NULL, 'no', '2017-05-19 17:10:25', '0000-00-00 00:00:00'),
(36688, 4, 623, 'Issue', NULL, 'no', '2017-05-19 17:10:30', '0000-00-00 00:00:00'),
(36689, 4, 621, 'Issue Book', NULL, 'no', '2017-05-19 17:10:40', '0000-00-00 00:00:00'),
(36690, 4, 648, 'Issue Return', NULL, 'no', '2017-05-19 18:05:21', '0000-00-00 00:00:00'),
(36691, 4, 635, 'Librarian List', NULL, 'no', '2017-05-19 17:11:31', '0000-00-00 00:00:00'),
(36692, 4, 634, 'Librarian Photo', NULL, 'no', '2017-05-19 17:11:38', '0000-00-00 00:00:00'),
(36696, 4, 626, 'Library Card Number', NULL, 'no', '2017-05-19 17:12:23', '0000-00-00 00:00:00'),
(36697, 4, 628, 'Member Id', NULL, 'no', '2017-05-19 17:12:53', '0000-00-00 00:00:00'),
(36698, 4, 622, 'Member Type', NULL, 'no', '2017-05-19 17:13:01', '0000-00-00 00:00:00'),
(36699, 4, 625, 'Members', NULL, 'no', '2017-05-19 17:13:06', '0000-00-00 00:00:00'),
(36700, 4, 638, 'New Username', NULL, 'no', '2017-05-19 17:13:23', '0000-00-00 00:00:00'),
(36701, 4, 627, 'Return Date', NULL, 'no', '2017-05-19 17:15:06', '0000-00-00 00:00:00'),
(36702, 4, 630, 'Timezone', NULL, 'no', '2017-05-19 17:17:48', '0000-00-00 00:00:00'),
(36703, 4, 646, 'Users', NULL, 'no', '2017-05-19 17:18:21', '0000-00-00 00:00:00'),
(73979, 4, 653, 'Surrender Membership', NULL, 'no', '2017-05-29 07:26:46', '0000-00-00 00:00:00'),
(73980, 4, 651, 'Members List', NULL, 'no', '2017-05-29 07:27:05', '0000-00-00 00:00:00'),
(73981, 4, 651, 'Members List', NULL, 'no', '2017-05-29 07:27:18', '0000-00-00 00:00:00'),
(73982, 4, 652, 'Issue Date', NULL, 'no', '2017-05-29 07:27:35', '0000-00-00 00:00:00'),
(73983, 4, 686, 'Add Admin User', NULL, 'no', '2017-08-04 07:51:48', '0000-00-00 00:00:00'),
(73984, 4, 663, 'Add Fees Discount', NULL, 'no', '2017-08-04 07:52:03', '0000-00-00 00:00:00'),
(73985, 4, 663, 'Add Fees Discount', NULL, 'no', '2017-08-04 07:52:05', '0000-00-00 00:00:00'),
(73986, 4, 655, 'Add Fees Group', NULL, 'no', '2017-08-04 07:52:13', '0000-00-00 00:00:00'),
(73987, 4, 676, 'Add Member', NULL, 'no', '2017-08-04 07:52:26', '0000-00-00 00:00:00'),
(73988, 4, 688, 'Admin Email', NULL, 'no', '2017-08-04 07:52:39', '0000-00-00 00:00:00'),
(73989, 4, 687, 'Admin Name', NULL, 'no', '2017-08-04 07:52:47', '0000-00-00 00:00:00'),
(73990, 4, 689, 'Admin Password', NULL, 'no', '2017-08-04 07:52:57', '0000-00-00 00:00:00'),
(73991, 4, 685, 'Admin Users', NULL, 'no', '2017-08-04 07:53:04', '0000-00-00 00:00:00'),
(73992, 4, 664, 'All', NULL, 'no', '2017-08-04 07:53:10', '0000-00-00 00:00:00'),
(73993, 4, 667, 'Applied', NULL, 'no', '2017-08-04 07:53:20', '0000-00-00 00:00:00'),
(73994, 4, 674, 'Apply Discount', NULL, 'no', '2017-08-04 07:53:30', '0000-00-00 00:00:00'),
(73995, 4, 670, 'Assign / View', NULL, 'no', '2017-08-04 07:53:46', '0000-00-00 00:00:00'),
(73996, 4, 665, 'Assign Fees Discount', NULL, 'no', '2017-08-04 07:53:56', '0000-00-00 00:00:00'),
(73997, 4, 691, 'Assign Fees Group', NULL, 'no', '2017-08-04 07:54:20', '0000-00-00 00:00:00'),
(73998, 4, 684, 'Assigned', NULL, 'no', '2017-08-04 07:54:30', '0000-00-00 00:00:00'),
(73999, 4, 669, 'Confirmation', NULL, 'no', '2017-08-04 07:54:42', '0000-00-00 00:00:00'),
(74000, 4, 669, 'Confirmation', NULL, 'no', '2017-08-04 07:54:53', '0000-00-00 00:00:00'),
(74001, 4, 661, 'Discount Code', NULL, 'no', '2017-08-04 07:55:04', '0000-00-00 00:00:00'),
(74002, 4, 675, 'Discount of', NULL, 'no', '2017-08-04 07:55:19', '0000-00-00 00:00:00'),
(74003, 4, 657, 'Due Date', NULL, 'no', '2017-08-04 07:55:27', '0000-00-00 00:00:00'),
(74004, 4, 660, 'Edit Fees Discount', NULL, 'no', '2017-08-04 07:55:40', '0000-00-00 00:00:00'),
(74005, 4, 671, 'Edit Fees Group', NULL, 'no', '2017-08-04 07:55:48', '0000-00-00 00:00:00'),
(74006, 4, 673, 'Edit Fees Master', NULL, 'no', '2017-08-04 07:55:57', '0000-00-00 00:00:00'),
(74007, 4, 672, 'Edit Fees Type', NULL, 'no', '2017-08-04 07:56:09', '0000-00-00 00:00:00'),
(74008, 4, 678, 'Email Engine', NULL, 'no', '2017-08-04 07:56:20', '0000-00-00 00:00:00'),
(74009, 4, 677, 'Email Setting', NULL, 'no', '2017-08-04 07:56:32', '0000-00-00 00:00:00'),
(74010, 4, 658, 'Fees Code', NULL, 'no', '2017-08-04 07:56:42', '0000-00-00 00:00:00'),
(74011, 4, 659, 'Fees Discount', NULL, 'no', '2017-08-04 07:56:58', '0000-00-00 00:00:00'),
(74012, 4, 662, 'Fees Discount List', NULL, 'no', '2017-08-04 07:57:09', '0000-00-00 00:00:00'),
(74013, 4, 654, 'Fees Group', NULL, 'no', '2017-08-04 07:57:17', '0000-00-00 00:00:00'),
(74014, 4, 656, 'Fees Group List', NULL, 'no', '2017-08-04 07:57:25', '0000-00-00 00:00:00'),
(74015, 4, 690, 'Forgot Password', NULL, 'no', '2017-08-04 07:57:36', '0000-00-00 00:00:00'),
(74016, 4, 666, 'Partial', NULL, 'no', '2017-08-04 07:57:49', '0000-00-00 00:00:00'),
(74017, 4, 680, 'SMTP Password', NULL, 'no', '2017-08-04 07:58:04', '0000-00-00 00:00:00'),
(74018, 4, 682, 'SMTP Port', NULL, 'no', '2017-08-04 07:58:12', '0000-00-00 00:00:00'),
(74019, 4, 683, 'SMTP Security', NULL, 'no', '2017-08-04 07:58:27', '0000-00-00 00:00:00'),
(74020, 4, 681, 'SMTP Server', NULL, 'no', '2017-08-04 07:58:35', '0000-00-00 00:00:00'),
(74021, 4, 679, 'SMTP Username', NULL, 'no', '2017-08-04 07:58:43', '0000-00-00 00:00:00');
INSERT INTO `lang_pharses` (`id`, `lang_id`, `key_id`, `pharses`, `text`, `is_active`, `created_at`, `updated_at`) VALUES
(74022, 4, 668, 'Student Fees', NULL, 'no', '2017-08-04 07:58:51', '0000-00-00 00:00:00'),
(74023, 4, 692, 'Accountant', NULL, 'no', '2017-10-31 03:40:23', '0000-00-00 00:00:00'),
(74024, 4, 693, 'Add Income', NULL, 'no', '2017-10-31 03:40:40', '0000-00-00 00:00:00'),
(74025, 4, 732, 'Add Item Supplier', NULL, 'no', '2017-12-14 06:15:30', '0000-00-00 00:00:00'),
(74026, 4, 731, 'Add Item Stock', NULL, 'no', '2017-12-14 06:15:20', '0000-00-00 00:00:00'),
(74027, 4, 733, 'Available Quantity', NULL, 'no', '2017-12-14 06:19:22', '0000-00-00 00:00:00'),
(74028, 4, 694, 'Add Item Store', NULL, 'no', '2017-10-31 04:14:42', '0000-00-00 00:00:00'),
(74029, 4, 734, 'Contact Person Phone', NULL, 'no', '2017-10-31 04:14:52', '0000-00-00 00:00:00'),
(74030, 4, 695, 'Admin', NULL, 'no', '2017-10-31 04:15:16', '0000-00-00 00:00:00'),
(74031, 4, 696, 'Attach Docement', NULL, 'no', '2017-10-31 04:15:45', '0000-00-00 00:00:00'),
(74032, 4, 696, 'Attach Document', NULL, 'no', '2017-10-31 04:15:52', '0000-00-00 00:00:00'),
(74033, 4, 696, 'Attach Document', NULL, 'no', '2017-10-31 04:16:10', '0000-00-00 00:00:00'),
(74034, 4, 750, 'Current Theme', NULL, 'no', '2017-12-14 06:22:34', '0000-00-00 00:00:00'),
(74035, 4, 735, 'Edit Item Supplier', NULL, 'no', '2017-12-14 06:23:52', '0000-00-00 00:00:00'),
(74036, 4, 748, 'Send Through', NULL, 'no', '2017-12-14 07:03:14', '0000-00-00 00:00:00'),
(74037, 4, 698, 'Contact Person Email', NULL, 'no', '2017-10-31 04:17:12', '0000-00-00 00:00:00'),
(74038, 4, 699, 'Contact Person Name', NULL, 'no', '2017-10-31 04:17:26', '0000-00-00 00:00:00'),
(74039, 4, 736, 'Edit Item', NULL, 'no', '2017-12-14 06:23:35', '0000-00-00 00:00:00'),
(74040, 4, 751, 'Guardian Emal', NULL, 'no', '2017-12-14 06:29:33', '0000-00-00 00:00:00'),
(74041, 4, 700, 'Edit Income Head', NULL, 'no', '2017-10-31 04:18:04', '0000-00-00 00:00:00'),
(74042, 4, 738, 'Expense Details', NULL, 'no', '2017-12-14 06:27:52', '0000-00-00 00:00:00'),
(74043, 4, 702, 'Edit Item Category', NULL, 'no', '2017-10-31 04:18:20', '0000-00-00 00:00:00'),
(74044, 4, 701, 'Edit Item Store', NULL, 'no', '2017-10-31 04:18:29', '0000-00-00 00:00:00'),
(74045, 4, 737, 'Edit Income', NULL, 'no', '2017-12-14 06:24:17', '0000-00-00 00:00:00'),
(74046, 4, 703, 'Group', NULL, 'no', '2017-12-14 06:29:19', '0000-00-00 00:00:00'),
(74047, 4, 704, 'Guardians', NULL, 'no', '2017-12-14 06:29:53', '0000-00-00 00:00:00'),
(74048, 4, 752, 'Hash Key', NULL, 'no', '2017-12-14 06:30:04', '0000-00-00 00:00:00'),
(74049, 4, 705, 'Income Head List', NULL, 'no', '2017-12-14 06:31:36', '0000-00-00 00:00:00'),
(74050, 4, 753, 'Income List', NULL, 'no', '2017-12-14 06:32:19', '0000-00-00 00:00:00'),
(74051, 4, 708, 'Individual', NULL, 'no', '2017-12-14 06:33:41', '0000-00-00 00:00:00'),
(74052, 4, 740, 'Income Id', NULL, 'no', '2017-12-14 06:32:05', '0000-00-00 00:00:00'),
(74053, 4, 707, 'Income', NULL, 'no', '2017-12-14 06:31:27', '0000-00-00 00:00:00'),
(74054, 4, 706, 'Income Head', NULL, 'no', '2017-12-14 06:31:21', '0000-00-00 00:00:00'),
(74055, 4, 741, 'Income Result', NULL, 'no', '2017-12-14 06:32:50', '0000-00-00 00:00:00'),
(74056, 4, 754, 'Income Result', NULL, 'no', '2017-12-14 06:33:03', '0000-00-00 00:00:00'),
(74057, 4, 742, 'Issued By', NULL, 'no', '2017-12-14 06:45:24', '0000-00-00 00:00:00'),
(74058, 4, 755, 'Income Search', NULL, 'no', '2017-12-14 06:33:30', '0000-00-00 00:00:00'),
(74059, 4, 756, 'MSG91', NULL, 'no', '2017-12-14 06:55:55', '0000-00-00 00:00:00'),
(74060, 4, 709, 'Inventory', NULL, 'no', '2017-12-14 07:19:15', '0000-00-00 00:00:00'),
(74061, 4, 710, 'Issue By', NULL, 'no', '2017-12-14 06:34:36', '0000-00-00 00:00:00'),
(74062, 4, 765, 'Payment Methods', NULL, 'no', '2017-12-14 06:58:01', '0000-00-00 00:00:00'),
(74063, 4, 711, 'Issue To', NULL, 'no', '2017-12-14 06:34:55', '0000-00-00 00:00:00'),
(74064, 4, 713, 'Item Store', NULL, 'no', '2017-12-14 06:50:06', '0000-00-00 00:00:00'),
(74065, 4, 712, 'Issue Item', NULL, 'no', '2017-12-14 06:34:47', '0000-00-00 00:00:00'),
(74066, 4, 743, 'Item Category List', NULL, 'no', '2017-12-14 06:49:16', '0000-00-00 00:00:00'),
(74067, 4, 716, 'Item Stock List', NULL, 'no', '2017-12-14 06:49:00', '0000-00-00 00:00:00'),
(74068, 4, 715, 'Item', NULL, 'no', '2017-12-14 06:45:48', '0000-00-00 00:00:00'),
(74069, 4, 744, 'Item List', NULL, 'no', '2017-12-14 06:49:49', '0000-00-00 00:00:00'),
(74070, 4, 745, 'Item Store List', NULL, 'no', '2017-12-14 06:50:24', '0000-00-00 00:00:00'),
(74071, 4, 717, 'Item Stock Code', NULL, 'no', '2017-12-14 06:50:13', '0000-00-00 00:00:00'),
(74072, 4, 714, 'Item Category', NULL, 'no', '2017-12-14 06:49:39', '0000-00-00 00:00:00'),
(74073, 4, 718, 'Item Store Name', NULL, 'no', '2017-12-14 06:50:30', '0000-00-00 00:00:00'),
(74074, 4, 746, 'Item Supplier', NULL, 'no', '2017-12-14 06:50:41', '0000-00-00 00:00:00'),
(74075, 4, 719, 'Item Supplier List', NULL, 'no', '2017-12-14 06:51:00', '0000-00-00 00:00:00'),
(74076, 4, 747, 'Contact Person', NULL, 'no', '2017-12-14 06:20:53', '0000-00-00 00:00:00'),
(74077, 4, 720, 'Librarian', NULL, 'no', '2017-12-14 06:51:17', '0000-00-00 00:00:00'),
(74078, 4, 721, 'Quantity', NULL, 'no', '2017-12-14 06:59:46', '0000-00-00 00:00:00'),
(74079, 4, 632, 'Librarians', NULL, 'no', '2017-10-31 04:25:12', '0000-00-00 00:00:00'),
(74080, 4, 757, 'Notification Setting', NULL, 'no', '2017-12-14 06:57:15', '0000-00-00 00:00:00'),
(74081, 4, 757, 'Notification Setting', NULL, 'no', '2017-12-14 06:57:29', '0000-00-00 00:00:00'),
(74082, 4, 723, 'Return', NULL, 'no', '2017-12-14 07:01:11', '0000-00-00 00:00:00'),
(74083, 4, 724, 'Returned', NULL, 'no', '2017-12-14 07:01:23', '0000-00-00 00:00:00'),
(74084, 4, 725, 'Search Income', NULL, 'no', '2017-12-14 07:02:24', '0000-00-00 00:00:00'),
(74085, 4, 764, 'Email / SMS Log', NULL, 'no', '2017-12-14 06:26:52', '0000-00-00 00:00:00'),
(74086, 4, 763, 'Email / SMS', NULL, 'no', '2017-12-14 06:26:19', '0000-00-00 00:00:00'),
(74087, 4, 727, 'Store', NULL, 'no', '2017-12-14 07:04:11', '0000-00-00 00:00:00'),
(74088, 4, 749, 'Auth Key', NULL, 'no', '2017-12-14 06:18:27', '0000-00-00 00:00:00'),
(74089, 4, 759, 'SMS Country', NULL, 'no', '2017-12-14 07:03:50', '0000-00-00 00:00:00'),
(74090, 4, 728, 'Supplier', NULL, 'no', '2017-12-14 07:05:11', '0000-00-00 00:00:00'),
(74091, 4, 760, 'Test Local', NULL, 'no', '2017-12-14 07:05:44', '0000-00-00 00:00:00'),
(74092, 4, 730, 'Add Item', NULL, 'no', '2017-12-14 06:14:19', '0000-00-00 00:00:00'),
(74093, 4, 761, 'User Log', NULL, 'no', '2017-12-14 07:06:49', '0000-00-00 00:00:00'),
(74094, 4, 761, 'User Log', NULL, 'no', '2017-12-14 07:07:02', '0000-00-00 00:00:00'),
(74095, 4, 767, 'Stripe API Secret Key', NULL, 'no', '2017-12-14 07:04:28', '0000-00-00 00:00:00'),
(74096, 4, 762, 'Send Email / SMS', NULL, 'no', '2017-12-14 07:03:03', '0000-00-00 00:00:00'),
(74097, 4, 697, 'Confirm Return', NULL, 'no', '2017-10-31 04:31:22', '0000-00-00 00:00:00'),
(74098, 4, 739, 'Income Details', NULL, 'no', '2017-12-14 06:31:47', '0000-00-00 00:00:00'),
(74099, 4, 766, 'All Users', NULL, 'no', '2017-12-14 06:17:37', '0000-00-00 00:00:00'),
(74100, 4, 758, 'Sender ID', NULL, 'no', '2017-12-14 07:03:25', '0000-00-00 00:00:00'),
(74101, 4, 722, 'Reset Password', NULL, 'no', '2017-12-14 07:00:10', '0000-00-00 00:00:00'),
(74102, 4, 726, 'SMS', NULL, 'no', '2017-12-14 07:03:41', '0000-00-00 00:00:00'),
(74103, 4, 729, 'Add Item Category', NULL, 'no', '2017-12-14 06:14:42', '0000-00-00 00:00:00'),
(74104, 4, 768, 'Stripe Publishable Key', NULL, 'no', '2017-12-14 07:04:44', '0000-00-00 00:00:00'),
(74105, 4, 769, 'PayU Money Key', NULL, 'no', '2017-12-14 06:58:39', '0000-00-00 00:00:00'),
(74106, 4, 776, 'Absent Student', NULL, 'no', '2017-12-14 06:13:20', '0000-00-00 00:00:00'),
(74107, 4, 782, 'Click To Return', NULL, 'no', '2017-12-14 06:20:36', '0000-00-00 00:00:00'),
(74108, 4, 774, 'Exam Result', NULL, 'no', '2017-12-14 06:27:34', '0000-00-00 00:00:00'),
(74109, 4, 775, 'Fees Submission', NULL, 'no', '2017-12-14 06:28:38', '0000-00-00 00:00:00'),
(74110, 4, 779, 'IP Address', NULL, 'no', '2017-12-14 06:33:51', '0000-00-00 00:00:00'),
(74111, 4, 779, 'IP Address', NULL, 'no', '2017-12-14 06:34:16', '0000-00-00 00:00:00'),
(74112, 4, 777, 'Login Credential', NULL, 'no', '2017-12-14 06:51:47', '0000-00-00 00:00:00'),
(74113, 4, 780, 'Login Time', NULL, 'no', '2017-12-14 06:51:56', '0000-00-00 00:00:00'),
(74114, 4, 771, 'CCAvenue Merchant ID', NULL, 'no', '2017-12-14 07:24:55', '0000-00-00 00:00:00'),
(74115, 4, 770, 'PayU Money Salt', NULL, 'no', '2017-12-14 06:59:10', '0000-00-00 00:00:00'),
(74116, 4, 778, 'Role', NULL, 'no', '2017-12-14 07:01:40', '0000-00-00 00:00:00'),
(74117, 4, 773, 'Select Payment Gateway', NULL, 'no', '2017-12-14 07:02:49', '0000-00-00 00:00:00'),
(74118, 4, 781, 'User Agent', NULL, 'no', '2017-12-14 07:06:42', '0000-00-00 00:00:00'),
(74119, 4, 772, 'CCAvenue Working Key', NULL, 'no', '2017-12-14 07:25:13', '0000-00-00 00:00:00'),
(74120, 45, 620, ' ', NULL, 'no', '2021-03-19 05:43:57', '0000-00-00 00:00:00'),
(74121, 45, 620, ' ', NULL, 'no', '2021-03-19 05:44:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `libarary_members`
--

CREATE TABLE `libarary_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `librarians`
--

CREATE TABLE `librarians` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT 0,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(124);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `module_slug` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'Category', 'category', 1, '2022-07-11 12:16:56', '2022-07-11 12:16:56', 1, 1),
(2, 'Student_Details', 'student_details', 1, '2022-07-11 12:16:56', '2022-07-11 12:16:56', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `created_at`) VALUES
(5, 'student_admission', '1', '0', '2017-12-09 11:58:44'),
(6, 'exam_result', '1', '1', '2021-03-18 09:56:02'),
(7, 'fee_submission', '1', '1', '2021-03-18 09:56:02'),
(8, 'absent_attendence', '1', '1', '2021-03-18 09:56:02'),
(9, 'login_credential', '1', '1', '2021-03-18 09:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `operation_name` varchar(50) NOT NULL,
  `operation_slug` varchar(50) NOT NULL,
  `is_view_vissible` tinyint(1) DEFAULT 0,
  `is_add_vissible` tinyint(1) DEFAULT 0,
  `is_edit_vissible` tinyint(1) DEFAULT 0,
  `is_delete_vissible` tinyint(1) DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, 'Category', 'category', 1, 1, 1, NULL, 1, '2017-12-12 16:06:25', '2019-09-01 14:22:34', 1, 1),
(2, 1, 'Student_Details', 'student_details', 1, 1, 1, NULL, 1, '2017-12-12 16:06:25', '2019-09-01 14:22:34', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `api_username` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_secret_key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `api_publishable_key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `api_password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_signature` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_demo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `account_no` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(100) NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `module` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `value`, `module`) VALUES
(1, 'all', '1', 'category'),
(2, 'all', '0', 'course'),
(3, 'add', '1', 'course'),
(4, 'add', '1', 'category'),
(5, 'update', '1', 'category'),
(6, 'delete', '1', 'category'),
(7, 'update', '1', 'course'),
(8, 'delete', '1', 'course'),
(9, 'update_status', '1', 'course'),
(10, 'all', '1', 'section'),
(11, 'add', '0', 'section'),
(12, 'update', '0', 'section'),
(13, 'delete', '0', 'section'),
(14, 'all', '1', 'lesson'),
(15, 'add', '0', 'lesson'),
(16, 'update', '0', 'lesson'),
(17, 'delete', '0', 'lesson'),
(18, 'all', '0', 'quiz'),
(19, 'add', '0', 'quiz'),
(20, 'update', '0', 'quiz'),
(21, 'delete', '0', 'quiz'),
(22, 'all', '1', 'teacher'),
(23, 'add', '0', 'teacher'),
(24, 'update', '0', 'teacher'),
(25, 'delete', '1', 'teacher'),
(26, 'update_status', '1', 'teacher'),
(27, 'payout', '0', 'teacher'),
(28, 'setting', '0', 'teacher'),
(29, 'application', '0', 'teacher'),
(30, 'add', '0', 'enrol'),
(31, 'all', '1', 'enrol'),
(32, 'all', '1', 'purchase_history'),
(33, 'delete', '0', 'purchase_history'),
(34, 'all', '1', 'student'),
(35, 'add', '0', 'student'),
(36, 'update', '0', 'student'),
(37, 'delete', '1', 'student'),
(38, 'update_status', '1', 'student'),
(39, 'all', '0', 'message'),
(40, 'all', '0', 'coupon'),
(41, 'add', '0', 'coupon'),
(42, 'update', '0', 'coupon'),
(43, 'delete', '0', 'coupon'),
(44, 'all', '0', 'revenue'),
(45, 'admin', '0', 'revenue'),
(46, 'teacher', '0', 'revenue'),
(47, 'all', '0', 'gallary'),
(48, 'slider', '0', 'gallary'),
(49, 'banner', '0', 'gallary'),
(50, 'all', '1', 'assignment'),
(51, 'all', '1', 'submission'),
(52, 'all', '0', 'setting'),
(53, 'system_setting', '0', 'setting'),
(54, 'website_setting', '0', 'setting'),
(55, 'payment_setting', '0', 'setting'),
(56, 'language_setting', '0', 'setting'),
(57, 'smtp_setting', '0', 'setting'),
(58, 'theme', '0', 'setting'),
(59, 'about', '0', 'setting'),
(60, 'ceritificate_setting', '0', 'setting'),
(61, 's3_setting', '0', 'setting'),
(62, 'live_class_setting', '0', 'setting'),
(63, 'enquiry', '1', 'enquiry'),
(64, 'complain', '1', 'enquiry'),
(65, 'sms', '0', 'template'),
(66, 'email', '0', 'template'),
(67, 'all', '0', 'enquiry'),
(68, 'all', '0', 'template'),
(69, 'all', '0', 'test_series'),
(70, 'all', '1', 'manage_profile'),
(71, 'update_status', '1', 'lesson'),
(72, 'update_status', '0', 'complain'),
(73, 'update_status', '0', 'enquiry'),
(74, 'delete', '0', 'complain'),
(75, 'delete', '0', 'enquiry'),
(76, 'delete', '1', 'test'),
(77, 'delete', '1', 'sms'),
(78, 'delete', '1', 'email'),
(79, 'update_status', '1', 'sms'),
(80, 'update_status', '1', 'email'),
(81, 'delete', '0', 'banner'),
(82, 'delete', '0', 'slider'),
(83, 'update_status', '0', 'banner'),
(84, 'update_status', '0', 'slider'),
(85, 'delete', '1', 'video'),
(86, 'delete', '1', 'pdf'),
(87, 'update_status', '1', 'video'),
(88, 'update_status', '1', 'pdf'),
(89, 'all', '1', 'video'),
(90, 'all', '1', 'pdf'),
(91, 'delete', '0', 'coupon'),
(92, 'update_status', '0', 'coupon'),
(93, 'all', '0', 'test_subscription'),
(96, 'liveclass', '1', 'course'),
(97, 'all', '1', 'course_test'),
(98, 'all', '1', 'notification_add'),
(99, 'all', '1', 'attendance_list'),
(100, 'all', '1', 'Show_notification'),
(101, 'all', '1', 'teacher_revenue'),
(102, 'all', '1', 'school_list'),
(103, 'all', '1', 'show_student_list'),
(104, 'all', '1', 'show_indenpendent_tutor'),
(105, 'all', '1', 'Attendance'),
(106, 'all', '1', 'student_attendance'),
(107, 'all', '1', 'teacher_attendance'),
(108, 'all', '1', 'delete_school'),
(109, 'all', '1', 'teacher_list'),
(110, 'all', '1', 'class_list'),
(111, 'all', '1', 'student_list'),
(112, 'all', '1', 'section_list'),
(113, 'all', '1', 'subject_list'),
(114, 'all', '1', 'liveclasses'),
(115, 'all', '1', 'test_list'),
(116, 'all', '1', 'chapter_list'),
(117, 'all', '1', 'video_list'),
(118, 'all', '1', 'notes_list'),
(119, 'all', '1', 'teacher_added_by_student'),
(120, 'all', '1', 'school_added_by_student'),
(121, 'all', '1', 'delete_tutor'),
(122, 'all', '1', 'notice_list'),
(123, 'all', '1', 'leave_request'),
(124, 'all', '1', 'time_table'),
(125, 'all', '1', 'fees_list'),
(126, 'all', '1', 'update_school_status'),
(127, 'all', '1', 'update_tutor_status');

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '2020-06-20 14:51:49', '0000-00-00 00:00:00', 1, 0),
(2, 2, 1, 0, 0, 1, 0, 1, '2020-06-20 14:51:49', '0000-00-00 00:00:00', 1, 0),
(3, 1, 2, 1, 1, 1, 1, 1, '2020-06-20 14:51:49', '0000-00-00 00:00:00', 1, 0),
(4, 2, 2, 0, 0, 1, 0, 1, '2020-06-20 14:51:49', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) NOT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `read_notification`
--

INSERT INTO `read_notification` (`id`, `student_id`, `parent_id`, `notification_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 861, 0, 1, 'no', '2021-03-30 20:33:44', '0000-00-00 00:00:00'),
(2, NULL, 861, 1, 'no', '2021-03-30 20:52:49', '0000-00-00 00:00:00'),
(3, 859, 0, 1, 'no', '2021-04-30 10:36:13', '0000-00-00 00:00:00'),
(4, 875, 0, 1, 'no', '2021-06-22 11:25:52', '0000-00-00 00:00:00'),
(5, 876, 0, 2, 'no', '2021-09-14 06:10:38', '0000-00-00 00:00:00'),
(6, 876, 0, 1, 'no', '2021-09-14 06:10:40', '0000-00-00 00:00:00'),
(7, NULL, 876, 2, 'no', '2021-10-19 07:07:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `created_at`, `update_at`) VALUES
(1, 'admin', 1, '2022-07-11 13:31:17', '2022-07-11 13:31:17'),
(2, 'accountant', 1, '2022-07-11 13:31:17', '2022-07-11 13:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `room_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'BOYS', '', '2020-01-29 08:55:23', '0000-00-00 00:00:00'),
(2, 'GIRLS', '', '2020-01-29 08:55:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `dise_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_rtl` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'disabled',
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `start_month` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `lang_id`, `dise_code`, `date_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `session_id`, `start_month`, `image`, `theme`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Gautam Buddha Mahavidyalaya', 'gautambuddhamv@gmail.com', '9305928778', 'Bangarmau, Unnao, Uttar Pradesh', 4, 'UN 61', 'd/m/Y', 'INR', '₹', 'disabled', 'Asia/Kolkata', 18, '7', '1.jpg', 'red.jpg', 'no', '2022-08-09 14:57:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1st year', 'no', '2022-07-02 06:16:14', '0000-00-00 00:00:00'),
(2, '2nd year', 'no', '2022-07-02 06:16:14', '0000-00-00 00:00:00'),
(3, '3rd year', 'no', '2022-08-03 07:33:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible_student` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `visible_teacher` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_by` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `send_notification`
--

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_teacher`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Read More', '2021-08-11', '2021-08-03', '<p>dasdasdasdasdadasdasdasdas</p>', 'Yes', 'Yes', 'Yes', 'admin', 1, 'no', '2021-08-02 10:29:40', '0000-00-00 00:00:00'),
(3, 'Uwuw', '2021-10-29', '2021-10-29', '<p>Hii</p>', 'No', 'No', 'Yes', 'admin', 1, 'no', '2021-10-19 20:24:55', '0000-00-00 00:00:00'),
(4, 'Salary credit', '2022-01-22', '2022-01-22', '<p>hello Teacher your Salary is credit in your Saving Account.</p><p>(dec)2021.</p><p>thanks</p><p><b>Principal</b></p>', 'No', 'Yes', 'No', 'admin', 1, 'no', '2022-01-22 07:18:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES
(7, '2016-17', 'no', '2017-04-20 06:42:19', '0000-00-00 00:00:00'),
(11, '2017-18', 'no', '2017-04-20 06:41:37', '0000-00-00 00:00:00'),
(13, '2018-19', 'no', '2016-08-24 19:26:44', '0000-00-00 00:00:00'),
(14, '2019-20', 'no', '2016-08-24 19:26:55', '0000-00-00 00:00:00'),
(15, '2020-21', 'no', '2016-10-01 05:28:08', '0000-00-00 00:00:00'),
(16, '2021-22', 'no', '2016-10-01 05:28:20', '0000-00-00 00:00:00'),
(18, '2022-23', 'no', '2016-10-01 05:29:02', '0000-00-00 00:00:00'),
(19, '2023-24', 'no', '2016-10-01 05:29:10', '0000-00-00 00:00:00'),
(20, '2024-25', 'no', '2016-10-01 05:29:18', '0000-00-00 00:00:00'),
(21, '2025-26', 'no', '2016-10-01 05:30:10', '0000-00-00 00:00:00'),
(22, '2026-27', 'no', '2016-10-01 05:30:18', '0000-00-00 00:00:00'),
(23, '2027-28', 'no', '2016-10-01 05:30:24', '0000-00-00 00:00:00'),
(24, '2028-29', 'no', '2016-10-01 05:30:30', '0000-00-00 00:00:00'),
(25, '2029-30', 'no', '2016-10-01 05:30:37', '0000-00-00 00:00:00'),
(26, '2030-31', 'no', '2021-04-12 12:01:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `api_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `authkey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `senderid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_config`
--

INSERT INTO `sms_config` (`id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'msg_nineone', '', '', '', '', NULL, NULL, NULL, NULL, 'disabled', '2017-12-15 10:38:36', '0000-00-00 00:00:00'),
(2, 'clickatell', '', '', '', '', NULL, '', NULL, '', 'disabled', '2017-12-15 10:38:36', '0000-00-00 00:00:00'),
(3, 'smscountry', '', '', '', '', NULL, '', NULL, '', 'disabled', '2017-12-15 10:38:36', '0000-00-00 00:00:00'),
(4, 'text_local', '', '', '', '', NULL, '', NULL, '', 'disabled', '2017-12-15 10:38:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roll_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileno` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `religion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adhar_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `samagra_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_is` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_occupation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_occupation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_relation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_occupation` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `guardian_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `guardian_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `previous_school` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `is_active`, `previous_school`, `created_at`, `updated_at`) VALUES
(2, '1622259506', '', '2022-08-19', 'AJIT', 'SINGH', 'No', 'uploads/student_images/2.jpeg', '9415532964', 'jungbahadursingh3@gmail.com', NULL, NULL, NULL, 'HINDU', '', '2003-07-07', 'Male', '', '', '35', '', '', '', '', '', 'father', 'JANGBAHADUR SINGH', '9415532964', 'AG', 'ROOPRANI', '9450054058', 'H W', 'JANGBAHADUR SINGH', 'Father', '9415532964', 'AG', 'BANGARMAO ,UNNAO', '', 'no', '', '2023-03-25 16:47:12', '0000-00-00 00:00:00'),
(6, '010011198', '22183008669', '2023-03-05', 'Aarti', 'Devi', 'No', 'uploads/student_images/6.png', '9000000000', '', NULL, NULL, NULL, '', '', '1998-07-06', 'Female', '', '', '30', '', '', '', '', '', NULL, 'Sudarshan', '', '', '', '', '', '', '', '', '', 'Surseni , bangarmau', '', 'no', '', '2023-03-23 05:39:24', '0000-00-00 00:00:00'),
(7, '0004', '0004', '2023-03-05', 'Aadesh', 'Kumar', 'No', 'uploads/student_images/no_image.png', '9369836104', '', NULL, NULL, NULL, '', '', '2002-09-30', 'Male', '', '', '12', '', '', '', '', '', NULL, 'Santosh Kumar', '', '', '', '', '', '', '', '', '', 'Kamalapur, rajepur, UNNAO', '', 'no', '', '2023-03-05 20:13:02', '0000-00-00 00:00:00'),
(8, '0002', '220227066413', '2023-03-05', 'Abdul rehman', 'Khan', 'No', 'uploads/student_images/no_image.png', '7355197967', '', NULL, NULL, NULL, '', '', '2002-01-01', 'Male', '', '', '12', '', '', '', '', '', NULL, 'Rehan khan', '', '', '', '', '', '', '', '', '', 'Surseni, bangarmau', '', 'no', '', '2023-03-05 20:16:22', '0000-00-00 00:00:00'),
(9, '7863876', '', '2023-03-23', 'Rajneesh', 'Kumar', 'No', 'uploads/student_images/no_image.png', '9953622016', 'rajneshkumar287@gmail.com', NULL, NULL, NULL, 'Hindu', 'yadav', '2021-07-23', 'Female', '', '', '12', '', '', '', '', '', 'father', 'shivam', '9990551271', 'business', 'kjhfguh', '7406444844', 'teacher', 'shivam', 'Father', '9990551271', 'business', '15/99-1,Shrishail,Shriramnagar Ichalkaranji', 'pmkambare@gmail.com', 'no', '', '2023-03-23 07:09:27', '0000-00-00 00:00:00'),
(10, '2022-23', '22027066411', '2023-03-29', 'ADESH', 'KUMAR', 'No', 'uploads/student_images/no_image.png', '9369836104', '', NULL, NULL, NULL, 'HINDU', 'PANDIT', '2002-09-30', 'Male', '', '', '12', '', '', '', '', '', 'father', 'Santosh Kumar', '', '', 'UMA DEVI', '', '', 'Santosh Kumar', 'Father', '', '', 'Kamalapur, rajepur, UNNAO', '', 'no', '', '2023-03-29 06:56:16', '0000-00-00 00:00:00'),
(11, '03', '22027066413', '2023-03-29', 'abhinav', 'verma', 'No', 'uploads/student_images/no_image.png', '8726454289', '', NULL, NULL, NULL, 'hindu', 'pasi', '2005-05-20', 'Male', '', '', '30', '', '', '', '', '', 'father', 'bal govind verma', '', '', 'janki devi', '', '', 'bal govind verma', 'Father', '', '', 'lko', '', 'no', '', '2023-03-29 07:09:15', '0000-00-00 00:00:00'),
(12, '04', '22027066414', '2023-03-29', 'adarsh', 'kumar', 'No', 'uploads/student_images/no_image.png', '9219526245', '', NULL, NULL, NULL, 'hindu', 'kachi', '2006-04-23', 'Male', '', '', '35', '', '', '', '', '', 'father', 'vipin kumar', '', '', 'mamta', '', '', 'vipin kumar', 'Father', '', '', 'asat mohiddinpur', '', 'no', '', '2023-03-29 07:12:44', '0000-00-00 00:00:00'),
(13, '05', '22027066415', '2023-03-29', 'adarsh', 'sahu', 'No', 'uploads/student_images/no_image.png', '9794823606', '', NULL, NULL, NULL, 'hindu', 'pandit', '2002-07-01', 'Male', '', '', '12', '', '', '', '', '', 'father', 'ram naresh sahu', '', '', 'usha sahu', '', '', 'ram naresh sahu', 'Father', '', '', 'lko', '', 'no', '', '2023-03-29 08:53:25', '0000-00-00 00:00:00'),
(14, '06', '22027066416', '2023-03-29', 'adarsh', 'srivastav', 'No', 'uploads/student_images/no_image.png', '9450504861', '', NULL, NULL, NULL, 'hindu', 'lala', '2005-05-20', 'Male', '', '', '12', '', '', '', '', '', 'father', 'anil srivastav', '', '', '', '', '', 'anil srivastav', 'Father', '', '', 'gaura surseni bangarmau unnao', '', 'no', '', '2023-03-29 08:56:42', '0000-00-00 00:00:00'),
(15, '07', '22027066417', '2023-03-29', 'adeeba', 'bano', 'No', 'uploads/student_images/no_image.png', '9415919171', '', NULL, NULL, NULL, 'muslim', '', '2005-05-30', 'Female', '', '', '35', '', '', '', '', '', 'father', 'jumman khan', '', '', 'parveen begum', '', '', 'jumman khan', 'Father', '', '', 'surseni bangarmau', '', 'no', '', '2023-03-29 09:00:27', '0000-00-00 00:00:00'),
(16, '08', '22027066418', '2023-03-29', 'ahjam ahmad', 'khan', 'No', 'uploads/student_images/no_image.png', '9415919171', '', NULL, NULL, NULL, 'hindu', '', '2005-02-28', 'Male', '', '', '12', '', '', '', '', '', 'father', 'quloob ahmad khan', '', '', 'seema khan', '', '', 'quloob ahmad khan', 'Father', '', '', 'bangarmau unnao', '', 'no', '', '2023-03-29 09:30:36', '0000-00-00 00:00:00'),
(17, '09', '22027066419', '2023-04-12', 'AJAY', 'KUMAR', 'No', 'uploads/student_images/no_image.png', '8756907007', '', NULL, NULL, NULL, 'HINDU', 'MALLAH', '2006-12-09', 'Male', '', '', '35', '', '', '', '', '', 'father', 'RAJENDRA KUMAR', '', '', 'ANEETA DEVI', '', '', 'RAJENDRA KUMAR', 'Father', '', '', 'GAHARPURWA BHIKHARIPUR PATASIYA BANGARMAU UNNAO', '', 'no', '', '2023-04-12 05:30:34', '0000-00-00 00:00:00'),
(18, '10', '22027066421', '2023-04-12', 'AKANKSHA', 'D', 'No', 'uploads/student_images/no_image.png', '8840305719', '', NULL, NULL, NULL, 'HINDU', 'CHAMAR', '2006-07-08', 'Female', '', '', '30', '', '', '', '', '', 'father', 'RAM NATH', '', '', 'RAM BETI', '', '', 'RAM NATH', 'Father', '', '', 'PALIYA BANGARMAU UNNAO', '', 'no', '', '2023-04-12 05:36:17', '0000-00-00 00:00:00'),
(19, '12', '22027066422', '2023-04-12', 'AKANKSHA', 'DEVI', 'No', 'uploads/student_images/no_image.png', '6388125198', '', NULL, NULL, NULL, 'HINDU', 'KORI', '2006-07-17', 'Female', '', '', '30', '', '', '', '', '', 'father', 'ANOOP KUMAR', '', '', 'ANURADHA', '', '', 'ANOOP KUMAR', 'Father', '', '', 'BHAGWANTPUR GOTEPALI BANGARMAU UNNAO', '', 'no', '', '2023-04-12 05:50:30', '0000-00-00 00:00:00'),
(20, '13', '22027066423', '2023-04-12', 'AKASH', 'GAUTAM', 'No', 'uploads/student_images/no_image.png', '8299634103', '', NULL, NULL, NULL, 'HINDU', 'CHAMAR', '2005-01-07', 'Male', '', '', '30', '', '', '', '', '', 'father', 'BECHE LAL', '', '', 'KAUSHALYA DEVI', '', '', 'BECHE LAL', 'Father', '', '', 'ASAYAS BANGARMAU UNNAO', '', 'no', '', '2023-04-12 06:01:52', '0000-00-00 00:00:00'),
(21, '14', '22027066424', '2023-04-12', 'AKASH', 'KUMAR', 'No', 'uploads/student_images/no_image.png', '8115093310', '', NULL, NULL, NULL, 'HINDU', 'CHAMAR', '2005-05-02', 'Male', '', '', '30', '', '', '', '', '', 'father', 'KANHAYA LAL', '', '', 'BITOLI DEVI', '', '', 'KANHAYA LAL', 'Father', '', '', 'ASAYAS BANGARMAU UNNAO', '', 'no', '', '2023-04-12 06:51:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendences`
--

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_doc`
--

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT '0000-00-00',
  `payment_mode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_deposite`
--

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_deposite`
--

INSERT INTO `student_fees_deposite` (`id`, `student_fees_master_id`, `fee_groups_feetype_id`, `amount_detail`, `is_active`, `created_at`) VALUES
(4, 1, 1, '{\"1\":{\"amount\":\"300\",\"date\":\"2022-08-21\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Admin\",\"payment_mode\":\"Cash\",\"inv_no\":1},\"2\":{\"amount\":\"4200\",\"date\":\"2022-09-15\",\"amount_discount\":\"300\",\"amount_fine\":\"0\",\"description\":\" Collected By: Shailendra kumar\",\"payment_mode\":\"Cash\",\"inv_no\":2}}', 'no', '2022-09-15 08:12:55'),
(6, 2, 4, '{\"2\":{\"amount\":\"2000\",\"date\":\"2022-08-30\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Admin\",\"payment_mode\":\"Cash\",\"inv_no\":2},\"3\":{\"amount\":\"4000\",\"date\":\"2022-09-15\",\"amount_discount\":\"1500\",\"amount_fine\":\"0\",\"description\":\" Collected By: Shailendra kumar\",\"payment_mode\":\"Cash\",\"inv_no\":3}}', 'no', '2022-09-15 08:14:42'),
(7, 3, 1, '{\"2\":{\"amount\":\"1000\",\"date\":\"2023-03-06\",\"amount_discount\":\"1000\",\"amount_fine\":\"0\",\"description\":\" Collected By: Admin\",\"payment_mode\":\"Cash\",\"inv_no\":2},\"3\":{\"amount\":\"10\",\"date\":\"2023-03-23\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Admin\",\"payment_mode\":\"Cash\",\"inv_no\":3}}', 'no', '2023-03-23 07:11:08'),
(8, 4, 4, '{\"1\":{\"amount\":\"4000\",\"date\":\"2023-03-20\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Admin\",\"payment_mode\":\"Cash\",\"inv_no\":1},\"2\":{\"amount\":\"2000\",\"date\":\"2023-03-20\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Uday Yadav\",\"payment_mode\":\"Cash\",\"inv_no\":2}}', 'no', '2023-03-20 07:41:59'),
(9, 5, 4, '{\"1\":{\"amount\":\"3000\",\"date\":\"2023-03-20\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Uday Yadav\",\"payment_mode\":\"Cash\",\"inv_no\":1},\"2\":{\"amount\":\"3500\",\"date\":\"2023-03-20\",\"amount_discount\":\"1000\",\"amount_fine\":\"0\",\"description\":\" Collected By: Uday Yadav\",\"payment_mode\":\"Cash\",\"inv_no\":2}}', 'no', '2023-03-20 07:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_discounts`
--

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_master`
--

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_fees_master`
--

INSERT INTO `student_fees_master` (`id`, `student_session_id`, `fee_session_group_id`, `is_active`, `created_at`) VALUES
(1, 1, 1, 'no', '2022-08-10 13:52:47'),
(2, 2, 4, 'no', '2022-08-30 05:01:16'),
(3, 6, 1, 'no', '2023-03-05 19:49:17'),
(4, 7, 4, 'no', '2023-03-20 06:53:45'),
(5, 8, 4, 'no', '2023-03-20 06:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `student_session`
--

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_session`
--

INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `subject_id`, `route_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 18, 2, 2, 1, '16', 0, 0, 0.00, 0.00, 'no', '2023-03-25 16:47:12', '0000-00-00 00:00:00'),
(6, 18, 6, 1, 1, '', 0, 0, 0.00, 0.00, 'no', '2023-03-23 05:39:24', '0000-00-00 00:00:00'),
(7, 18, 7, 2, 1, '12', 0, 0, 0.00, 0.00, 'no', '2023-03-05 20:13:02', '0000-00-00 00:00:00'),
(8, 18, 8, 2, 1, '1', 0, 0, 0.00, 0.00, 'no', '2023-03-05 20:16:22', '0000-00-00 00:00:00'),
(9, 18, 9, 1, 1, '', 0, 0, 0.00, 0.00, 'no', '2023-03-23 07:11:43', '0000-00-00 00:00:00'),
(10, 18, 10, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 06:56:16', '0000-00-00 00:00:00'),
(11, 18, 11, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 07:09:15', '0000-00-00 00:00:00'),
(12, 18, 12, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 07:12:44', '0000-00-00 00:00:00'),
(13, 18, 13, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 08:53:25', '0000-00-00 00:00:00'),
(14, 18, 14, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 08:56:42', '0000-00-00 00:00:00'),
(15, 18, 15, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 09:00:27', '0000-00-00 00:00:00'),
(16, 18, 16, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-03-29 09:30:36', '0000-00-00 00:00:00'),
(17, 18, 17, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-04-12 05:30:34', '0000-00-00 00:00:00'),
(18, 18, 18, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-04-12 05:36:17', '0000-00-00 00:00:00'),
(19, 18, 19, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-04-12 05:50:30', '0000-00-00 00:00:00'),
(20, 18, 20, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-04-12 06:01:52', '0000-00-00 00:00:00'),
(21, 18, 21, 2, 1, '1', 0, NULL, 0.00, 0.00, 'no', '2023-04-12 06:51:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_sibling`
--

CREATE TABLE `student_sibling` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `sibling_student_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_transport_fees`
--

CREATE TABLE `student_transport_fees` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT '0000-00-00',
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `payment_mode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(13, 'Maths', '', 'Theory', 'no', '2023-03-18 11:07:45', '0000-00-00 00:00:00'),
(14, 'Physics', '', 'Theory', 'no', '2023-03-18 11:07:52', '0000-00-00 00:00:00'),
(15, 'Chemistry', '', 'Theory', 'no', '2023-03-18 11:07:59', '0000-00-00 00:00:00'),
(16, 'Botany', '', 'Theory', 'no', '2023-03-18 11:07:29', '0000-00-00 00:00:00'),
(17, 'Hindi', '', 'Theory', 'no', '2023-03-18 11:07:35', '0000-00-00 00:00:00'),
(18, 'English', '', 'Theory', 'no', '2023-03-18 11:07:13', '0000-00-00 00:00:00'),
(19, 'Zoology', '', 'Theory', 'no', '2023-03-18 11:08:09', '0000-00-00 00:00:00'),
(20, 'Sanskrit', '', 'Theory', 'no', '2023-03-18 11:08:27', '0000-00-00 00:00:00'),
(21, 'Economics', '', 'Theory', 'no', '2023-03-18 11:08:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL,
  `teacher_subject_id` int(20) DEFAULT NULL,
  `day_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `route_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `fare` float(10,2) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES
(1, 'abhisheksinghku5@gmail.com', 'admin', '45.118.158.153', 'Safari 604.1, iOS', '2022-08-08 11:02:35'),
(2, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Safari 604.1, iOS', '2022-08-09 07:12:30'),
(3, 'abhisheksinghku5@gmail.com', 'admin', '47.15.130.78', 'Chrome 99.0.4844.88, Android', '2022-08-09 08:42:05'),
(4, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-09 14:48:57'),
(5, 'abhisheksinghku5@gmail.com', 'admin', '47.15.143.30', 'Chrome 100.0.4896.127, Windows 10', '2022-08-09 14:58:31'),
(6, 'abhisheksinghku5@gmail.com', 'admin', '47.15.143.30', 'Chrome 100.0.4896.127, Windows 10', '2022-08-09 14:58:32'),
(7, 'abhisheksinghku5@gmail.com', 'admin', '47.9.147.122', 'Chrome 104.0.0.0, Android', '2022-08-09 15:22:12'),
(8, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Safari 604.1, iOS', '2022-08-09 15:25:23'),
(9, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Safari 604.1, iOS', '2022-08-09 15:26:15'),
(10, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-09 17:23:40'),
(11, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-10 13:45:00'),
(12, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-10 14:06:12'),
(13, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-10 14:07:46'),
(14, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-10 14:08:45'),
(15, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-10 14:12:27'),
(16, 'abhisheksinghku5@gmail.com', 'admin', '106.208.154.38', 'Chrome 104.0.0.0, Windows 10', '2022-08-12 16:09:28'),
(17, 'abhisheksinghku5@gmail.com', 'admin', '106.208.154.38', 'Chrome 104.0.0.0, Windows 10', '2022-08-12 16:11:31'),
(18, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-15 07:37:20'),
(19, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-16 09:43:43'),
(20, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-16 09:45:39'),
(21, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-16 09:54:12'),
(22, 'abhisheksinghku5@gmail.com', 'admin', '110.226.217.161', 'Chrome 104.0.0.0, Windows 10', '2022-08-17 10:56:00'),
(23, 'accountant3', 'accountant', '110.226.217.161', 'Chrome 104.0.0.0, Windows 10', '2022-08-17 11:00:12'),
(24, 'abhisheksinghku5@gmail.com', 'admin', '27.56.131.113', 'Chrome 104.0.0.0, Windows 10', '2022-08-17 12:41:38'),
(25, 'abhisheksinghku5@gmail.com', 'admin', '106.214.254.107', 'Chrome 104.0.0.0, Windows 10', '2022-08-18 04:35:49'),
(26, 'accountant3', 'accountant', '106.214.254.107', 'Chrome 104.0.0.0, Windows 10', '2022-08-18 05:03:24'),
(27, 'accountant3', 'accountant', '27.58.208.126', 'Chrome 104.0.0.0, Windows 10', '2022-08-18 06:14:21'),
(28, 'accountant3', 'accountant', '27.58.208.126', 'Chrome 104.0.0.0, Windows 10', '2022-08-18 06:48:39'),
(29, 'abhisheksinghku5@gmail.com', 'admin', '27.58.208.126', 'Chrome 104.0.0.0, Windows 10', '2022-08-18 07:11:08'),
(30, 'abhisheksinghku5@gmail.com', 'admin', '47.15.115.234', 'Chrome 104.0.0.0, Windows 10', '2022-08-19 07:11:46'),
(31, 'abhisheksinghku5@gmail.com', 'admin', '122.163.205.214', 'Chrome 104.0.0.0, Windows 10', '2022-08-20 14:46:51'),
(32, 'abhisheksinghku5@gmail.com', 'admin', '117.96.171.74', 'Chrome 104.0.0.0, Android', '2022-08-21 11:44:00'),
(33, 'abhisheksinghku5@gmail.com', 'admin', '106.202.147.193', 'Chrome 104.0.0.0, Windows 10', '2022-08-23 09:23:55'),
(34, 'accountant3', 'accountant', '106.202.147.193', 'Chrome 104.0.5112.102, Windows 10', '2022-08-23 09:29:21'),
(35, 'abhisheksinghku5@gmail.com', 'admin', '106.202.147.193', 'Chrome 104.0.0.0, Windows 10', '2022-08-23 09:54:16'),
(36, 'abhisheksinghku5@gmail.com', 'admin', '103.214.60.212', 'Chrome 104.0.0.0, Windows 10', '2022-08-23 12:41:55'),
(37, 'accountant4', 'accountant', '103.214.60.212', 'Chrome 104.0.0.0, Windows 10', '2022-08-23 12:51:23'),
(38, 'abhisheksinghku5@gmail.com', 'admin', '106.212.34.63', 'Chrome 104.0.0.0, Windows 10', '2022-08-24 04:34:15'),
(39, 'abhisheksinghku5@gmail.com', 'admin', '106.212.34.63', 'Chrome 104.0.0.0, Windows 10', '2022-08-24 04:35:52'),
(40, 'accountant4', 'accountant', '106.212.34.63', 'Chrome 104.0.5112.102, Windows 10', '2022-08-24 04:37:00'),
(41, 'abhisheksinghku5@gmail.com', 'admin', '103.92.43.213', 'Chrome 104.0.0.0, Windows 10', '2022-08-25 10:42:20'),
(42, 'abhisheksinghku5@gmail.com', 'admin', '103.92.43.213', 'Chrome 104.0.0.0, Windows 10', '2022-08-25 10:42:41'),
(43, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-30 04:51:48'),
(44, 'abhisheksinghku5@gmail.com', 'admin', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-30 04:51:49'),
(45, 'accountant4', 'accountant', '27.4.185.83', 'Chrome 104.0.0.0, Windows 10', '2022-08-30 04:57:38'),
(46, 'abhisheksinghku5@gmail.com', 'admin', '47.9.138.190', 'Chrome 100.0.4896.127, Windows 10', '2022-08-30 04:58:56'),
(47, 'accountant4', 'accountant', '91.134.244.97', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 08:09:43'),
(48, 'accountant4', 'accountant', '91.134.244.97', 'Chrome 105.0.0.0, Windows 10', '2022-09-15 08:21:41'),
(49, 'accountant4', 'accountant', '91.134.244.97', 'Chrome 105.0.0.0, Windows 10', '2022-09-16 10:06:47'),
(50, 'abhisheksinghku5@gmail.com', 'admin', '47.31.182.14', 'Safari 604.1, iOS', '2022-10-22 17:54:41'),
(51, 'abhisheksinghku5@gmail.com', 'admin', '47.31.182.14', 'Safari 604.1, iOS', '2022-10-22 17:54:42'),
(52, 'accountant4', 'accountant', '47.15.5.195', 'Chrome 107.0.0.0, Windows 10', '2022-11-26 06:09:46'),
(53, 'accountant4', 'accountant', '47.9.137.65', 'Chrome 108.0.0.0, Windows 10', '2022-12-06 08:02:21'),
(54, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.154', 'Chrome 110.0.0.0, Windows 10', '2023-02-26 04:27:08'),
(55, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.189', 'Safari 605.1.15, Mac OS X', '2023-02-26 08:06:03'),
(56, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.189', 'Safari 605.1.15, Mac OS X', '2023-02-26 08:08:24'),
(57, 'abhisheksinghku5@gmail.com', 'admin', '49.36.209.53', 'Safari 605.1.15, Mac OS X', '2023-03-05 13:49:41'),
(58, 'abhisheksinghku5@gmail.com', 'admin', '152.58.185.162', 'Safari 605.1.15, Mac OS X', '2023-03-05 19:46:19'),
(59, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.43', 'Chrome 110.0.0.0, Windows 10', '2023-03-05 20:01:42'),
(60, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.43', 'Chrome 110.0.0.0, Windows 10', '2023-03-05 20:02:09'),
(61, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.43', 'Chrome 110.0.0.0, Windows 10', '2023-03-05 20:02:10'),
(62, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.43', 'Chrome 110.0.0.0, Windows 10', '2023-03-05 20:02:10'),
(63, 'abhisheksinghku5@gmail.com', 'admin', '152.58.156.202', 'Safari 605.1.15, Mac OS X', '2023-03-06 06:21:29'),
(64, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.211', 'Safari 604.1, iOS', '2023-03-18 11:05:21'),
(65, 'abhisheksinghku5@gmail.com', 'admin', '152.58.130.211', 'Safari 604.1, iOS', '2023-03-18 11:05:24'),
(66, 'abhisheksinghku5@gmail.com', 'admin', '152.58.185.88', 'Chrome 111.0.0.0, Windows 10', '2023-03-20 06:47:00'),
(67, 'accountant5', 'accountant', '152.58.185.88', 'Chrome 111.0.0.0, Windows 10', '2023-03-20 06:51:17'),
(68, 'accountant5', 'accountant', '47.9.118.210', 'Chrome 111.0.0.0, Windows 10', '2023-03-20 07:33:40'),
(69, 'accountant5', 'accountant', '47.9.97.105', 'Chrome 111.0.0.0, Windows 10', '2023-03-20 09:40:37'),
(70, 'abhisheksinghku5@gmail.com', 'admin', '223.181.163.228', 'Chrome 111.0.0.0, Windows 10', '2023-03-23 05:29:15'),
(71, 'abhisheksinghku5@gmail.com', 'admin', '152.58.184.122', 'Chrome 111.0.0.0, Windows 10', '2023-03-23 05:30:38'),
(72, 'accountant6', 'accountant', '223.189.222.199', 'Chrome 111.0.0.0, Windows 10', '2023-03-23 06:18:07'),
(73, 'abhisheksinghku5@gmail.com', 'admin', '223.181.163.228', 'Chrome 111.0.0.0, Windows 10', '2023-03-23 07:04:03'),
(74, 'abhisheksinghku5@gmail.com', 'admin', '152.58.154.148', 'Safari 604.1, iOS', '2023-03-24 18:35:03'),
(75, 'abhisheksinghku5@gmail.com', 'admin', '152.58.155.14', 'Safari 604.1, iOS', '2023-03-25 16:46:19'),
(76, 'accountant5', 'accountant', '152.58.155.14', 'Safari 604.1, iOS', '2023-03-25 16:48:12'),
(77, 'accountant4', 'accountant', '47.9.170.153', 'Chrome 111.0.0.0, Windows 10', '2023-03-27 05:51:47'),
(78, 'accountant5', 'accountant', '47.15.4.54', 'Chrome 111.0.0.0, Windows 10', '2023-03-29 06:39:46'),
(79, 'accountant5', 'accountant', '47.15.4.149', 'Chrome 111.0.0.0, Windows 10', '2023-03-29 09:19:27'),
(80, 'abhisheksinghku5@gmail.com', 'admin', '152.58.129.162', 'Chrome 111.0.0.0, Windows 10', '2023-04-01 05:40:46'),
(81, 'accountant5', 'accountant', '152.58.129.161', 'Safari 604.1, iOS', '2023-04-12 05:09:42'),
(82, 'accountant5', 'accountant', '152.58.129.161', 'Safari 604.1, iOS', '2023-04-12 05:09:58'),
(83, 'accountant5', 'accountant', '152.58.129.161', 'Safari 604.1, iOS', '2023-04-12 05:10:31'),
(84, 'accountant5', 'accountant', '47.15.15.23', 'Chrome 112.0.0.0, Windows 10', '2023-04-12 05:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `childs` text COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `verification_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 3, 'accountant3', '2cpzdb', '', 'accountant', '', 'yes', '2022-08-17 10:59:58', '0000-00-00 00:00:00'),
(4, 2, 'std2', 'llcnxw', '', 'student', '', 'yes', '2022-08-19 07:28:32', '0000-00-00 00:00:00'),
(5, 2, 'parent2', 'kzybe1', '2', 'parent', '', 'yes', '2022-08-19 07:28:32', '0000-00-00 00:00:00'),
(6, 4, 'accountant4', 'gadxij', '', 'accountant', '', 'yes', '2022-08-23 12:48:39', '0000-00-00 00:00:00'),
(7, 5, 'accountant5', 'xhg9n5', '', 'accountant', '', 'yes', '2022-08-30 04:55:48', '0000-00-00 00:00:00'),
(14, 6, 'std6', '5u1e1t', '', 'student', '', 'yes', '2023-03-05 14:24:01', '0000-00-00 00:00:00'),
(15, 6, 'parent6', 'urrhsx', '6', 'parent', '', 'yes', '2023-03-05 14:24:12', '0000-00-00 00:00:00'),
(16, 7, 'std7', '1oc8ua', '', 'student', '', 'yes', '2023-03-05 14:44:06', '0000-00-00 00:00:00'),
(17, 7, 'parent7', 'laxfsb', '7,10', 'parent', '', 'yes', '2023-03-29 06:56:16', '0000-00-00 00:00:00'),
(18, 8, 'std8', 'pk3bi9', '', 'student', '', 'yes', '2023-03-05 14:48:34', '0000-00-00 00:00:00'),
(19, 8, 'parent8', '0rcbil', '8', 'parent', '', 'yes', '2023-03-05 14:48:34', '0000-00-00 00:00:00'),
(20, 6, 'accountant6', 'ivnpy9', '', 'accountant', '', 'yes', '2023-03-23 06:15:47', '0000-00-00 00:00:00'),
(21, 9, 'std9', 'r3uyrj', '', 'student', '', 'yes', '2023-03-23 07:09:27', '0000-00-00 00:00:00'),
(22, 9, 'parent9', 'tx8q1i', '9', 'parent', '', 'yes', '2023-03-23 07:09:27', '0000-00-00 00:00:00'),
(23, 10, 'std10', 'ax0c4a', '', 'student', '', 'yes', '2023-03-29 06:56:16', '0000-00-00 00:00:00'),
(24, 11, 'std11', 'eebnlb', '', 'student', '', 'yes', '2023-03-29 07:09:15', '0000-00-00 00:00:00'),
(25, 11, 'parent11', '8qnisx', '11', 'parent', '', 'yes', '2023-03-29 07:09:15', '0000-00-00 00:00:00'),
(26, 12, 'std12', 'uv2yuq', '', 'student', '', 'yes', '2023-03-29 07:12:44', '0000-00-00 00:00:00'),
(27, 12, 'parent12', 'sqhna1', '12', 'parent', '', 'yes', '2023-03-29 07:12:45', '0000-00-00 00:00:00'),
(28, 13, 'std13', 'zh5qgj', '', 'student', '', 'yes', '2023-03-29 08:53:25', '0000-00-00 00:00:00'),
(29, 13, 'parent13', 'b3kcxu', '13', 'parent', '', 'yes', '2023-03-29 08:53:25', '0000-00-00 00:00:00'),
(30, 14, 'std14', 'ocw5g8', '', 'student', '', 'yes', '2023-03-29 08:56:42', '0000-00-00 00:00:00'),
(31, 14, 'parent14', 'ckbnth', '14', 'parent', '', 'yes', '2023-03-29 08:56:42', '0000-00-00 00:00:00'),
(32, 15, 'std15', 'biexp9', '', 'student', '', 'yes', '2023-03-29 09:00:27', '0000-00-00 00:00:00'),
(33, 15, 'parent15', '92z2r0', '15', 'parent', '', 'yes', '2023-03-29 09:00:27', '0000-00-00 00:00:00'),
(34, 16, 'std16', 'pn3zcc', '', 'student', '', 'yes', '2023-03-29 09:30:36', '0000-00-00 00:00:00'),
(35, 16, 'parent16', 'kqzkrv', '16', 'parent', '', 'yes', '2023-03-29 09:30:36', '0000-00-00 00:00:00'),
(36, 17, 'std17', 'hzxdm6', '', 'student', '', 'yes', '2023-04-12 05:30:34', '0000-00-00 00:00:00'),
(37, 17, 'parent17', 'nnb2ba', '17', 'parent', '', 'yes', '2023-04-12 05:30:34', '0000-00-00 00:00:00'),
(38, 18, 'std18', 'owu7wi', '', 'student', '', 'yes', '2023-04-12 05:36:17', '0000-00-00 00:00:00'),
(39, 18, 'parent18', 'ek1yt0', '18', 'parent', '', 'yes', '2023-04-12 05:36:17', '0000-00-00 00:00:00'),
(40, 19, 'std19', '1j3250', '', 'student', '', 'yes', '2023-04-12 05:50:30', '0000-00-00 00:00:00'),
(41, 19, 'parent19', 'qd0ypp', '19', 'parent', '', 'yes', '2023-04-12 05:50:30', '0000-00-00 00:00:00'),
(42, 20, 'std20', 'xuarhw', '', 'student', '', 'yes', '2023-04-12 06:01:52', '0000-00-00 00:00:00'),
(43, 20, 'parent20', '1no6a2', '20', 'parent', '', 'yes', '2023-04-12 06:01:52', '0000-00-00 00:00:00'),
(44, 21, 'std21', 'bi4w1w', '', 'student', '', 'yes', '2023-04-12 06:51:09', '0000-00-00 00:00:00'),
(45, 21, 'parent21', 'biyx3i', '21', 'parent', '', 'yes', '2023-04-12 06:51:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_routes`
--

CREATE TABLE `vehicle_routes` (
  `id` int(11) UNSIGNED NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountants`
--
ALTER TABLE `accountants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendence_type`
--
ALTER TABLE `attendence_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_schedule_id` (`exam_schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_subject_id` (`teacher_subject_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feecategory`
--
ALTER TABLE `feecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feemasters`
--
ALTER TABLE `feemasters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `feetype`
--
ALTER TABLE `feetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_id` (`fee_groups_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang_keys`
--
ALTER TABLE `lang_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang_pharses`
--
ALTER TABLE `lang_pharses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `key_id` (`key_id`);

--
-- Indexes for table `libarary_members`
--
ALTER TABLE `libarary_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarians`
--
ALTER TABLE `librarians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `operation_id` (`operation_id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendences`
--
ALTER TABLE `student_attendences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `attendence_type_id` (`attendence_type_id`);

--
-- Indexes for table `student_doc`
--
ALTER TABLE `student_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`);

--
-- Indexes for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fees_discount_id` (`fees_discount_id`);

--
-- Indexes for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `fee_session_group_id` (`fee_session_group_id`);

--
-- Indexes for table `student_session`
--
ALTER TABLE `student_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_sibling`
--
ALTER TABLE `student_sibling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_transport_fees`
--
ALTER TABLE `student_transport_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountants`
--
ALTER TABLE `accountants`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attendence_type`
--
ALTER TABLE `attendence_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `feecategory`
--
ALTER TABLE `feecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feemasters`
--
ALTER TABLE `feemasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feetype`
--
ALTER TABLE `feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fee_groups_feetype`
--
ALTER TABLE `fee_groups_feetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fee_receipt_no`
--
ALTER TABLE `fee_receipt_no`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_session_groups`
--
ALTER TABLE `fee_session_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_rooms`
--
ALTER TABLE `hostel_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `lang_keys`
--
ALTER TABLE `lang_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=783;

--
-- AUTO_INCREMENT for table `lang_pharses`
--
ALTER TABLE `lang_pharses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74122;

--
-- AUTO_INCREMENT for table `libarary_members`
--
ALTER TABLE `libarary_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `librarians`
--
ALTER TABLE `librarians`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `student_attendences`
--
ALTER TABLE `student_attendences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_doc`
--
ALTER TABLE `student_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_deposite`
--
ALTER TABLE `student_fees_deposite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_fees_discounts`
--
ALTER TABLE `student_fees_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fees_master`
--
ALTER TABLE `student_fees_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_session`
--
ALTER TABLE `student_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `student_sibling`
--
ALTER TABLE `student_sibling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_transport_fees`
--
ALTER TABLE `student_transport_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_routes`
--
ALTER TABLE `vehicle_routes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fees_discounts`
--
ALTER TABLE `fees_discounts`
  ADD CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
