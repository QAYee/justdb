-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 08, 2025 at 02:36 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `justify_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `contentType` varchar(50) DEFAULT 'announcement',
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_all` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `contentType`, `image`, `created_at`, `updated_at`, `target_all`) VALUES
(14, 'welcome', 'barangay', 'announcement', 'http://127.0.0.1/justify/uploads/announcements/announcement_67f4ade2dfdf7.jpg', '2025-04-08 05:02:26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `announcement_recipients`
--

CREATE TABLE `announcement_recipients` (
  `id` int NOT NULL,
  `announcement_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `announcement_recipients`
--

INSERT INTO `announcement_recipients` (`id`, `announcement_id`, `user_id`, `is_read`, `read_at`) VALUES
(70, 14, 1, 0, NULL),
(71, 14, 2, 0, NULL),
(72, 14, 3, 0, NULL),
(73, 14, 4, 1, '2025-04-08 08:29:12'),
(74, 14, 5, 0, NULL),
(75, 14, 6, 0, NULL),
(76, 14, 8, 0, NULL),
(77, 14, 9, 0, NULL),
(78, 14, 10, 0, NULL),
(79, 14, 14, 0, NULL),
(80, 14, 15, 1, '2025-04-08 05:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int NOT NULL,
  `complaint_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `sender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `complaint_id`, `user_id`, `message`, `timestamp`, `sender`) VALUES
(59, 36, 2, 'hello', '2025-04-08 03:59:06', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `complainant` varchar(255) NOT NULL,
  `respondent` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `incident_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complaint_type` varchar(255) NOT NULL DEFAULT '',
  `status` enum('New','Under review','In progress','Resolved','Closed','Rejected') NOT NULL DEFAULT 'New',
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `user_id`, `complainant`, `respondent`, `details`, `incident_date`, `created_at`, `updated_at`, `complaint_type`, `status`, `image`) VALUES
(25, 1, 'jooo', 'Barangay Officials', 'hinabol ako ng pagmamahal', '2025-04-05 16:00:00', '2025-04-05 16:59:35', '2025-04-06 01:26:04', 'violence', 'Rejected', NULL),
(26, 1, 'jooo', 'Barangay Officials', 'sinira niya puso ko boss ', '2025-04-05 16:00:00', '2025-04-05 17:00:06', '2025-04-06 01:26:01', 'Property Dispute', 'Under review', NULL),
(27, 1, 'jooo', 'Barangay Officials', 'nilolokoa ako', '2025-04-05 16:00:00', '2025-04-05 17:44:24', '2025-04-06 05:59:43', 'bully', 'In progress', NULL),
(28, 1, 'jooo', 'Barangay Officials', 'asdadasda', '2025-04-06 16:00:00', '2025-04-05 17:45:25', '2025-04-06 07:35:11', 'malupet', 'In progress', NULL),
(29, 1, 'jooo', 'Barangay Officials', 'eto goods ba', '2025-04-01 16:00:00', '2025-04-05 17:45:46', '2025-04-06 01:51:45', 'Utility Issue', 'Rejected', NULL),
(30, 1, 'jooo', 'Barangay Officials', 'blue', '2025-04-05 16:00:00', '2025-04-05 23:39:06', '2025-04-06 12:58:37', 'violencce', 'Under review', 'complaint_67f22f9a04d29.jpg'),
(31, 1, 'jooo', 'Barangay Officials', 'maingay mga aso', '2025-04-06 16:00:00', '2025-04-06 14:40:23', '2025-04-06 22:42:04', 'Animal Complaint', 'In progress', 'complaint_67f302d745b1e.jpg'),
(32, 1, 'jooo', 'Barangay Officials', 'eto try', '2025-04-06 22:15:00', '2025-04-06 14:48:00', '2025-04-06 22:52:47', 'Illegal Construction', 'Closed', 'complaint_67f304a06e7b9.jpg'),
(33, 1, 'jooo', 'Barangay Officials', 'adasd', '2025-04-08 22:45:00', '2025-04-06 14:59:30', '2025-04-07 00:47:42', 'Property Dispute', 'In progress', NULL),
(34, 1, 'jooo', 'Barangay Officials', 'magulo', '2025-04-06 23:00:00', '2025-04-06 15:02:26', '2025-04-07 13:38:35', 'Environmental Concern', 'In progress', NULL),
(35, 1, 'jooo', 'Barangay Officials', 'asdasd', '2021-05-06 23:15:00', '2025-04-06 15:09:04', '2025-04-08 13:14:47', 'Noise Complaint', 'Resolved', NULL),
(36, 1, 'jooo', 'Barangay Officials', 'asd', '2025-04-07 01:30:00', '2025-04-06 17:34:36', '2025-04-08 08:26:56', 'Illegal Construction', 'Rejected', NULL),
(37, 4, 'biboy', 'Barangay Officials', 'ang kulit ni biboy', '2025-04-18 08:30:00', '2025-04-08 00:33:03', '2025-04-08 08:33:51', 'Illegal Construction', 'Under review', 'complaint_67f4df3f298fc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, '2025-04-01 23:35:32', '2025-04-08 07:25:19'),
(2, 1, '2025-04-02 02:52:01', '2025-04-08 11:58:14'),
(3, 2, '2025-04-02 14:29:00', '2025-04-07 07:27:04'),
(4, 9, '2025-04-02 14:29:06', '2025-04-02 14:29:06'),
(5, 3, '2025-04-02 14:34:34', '2025-04-02 14:34:38'),
(6, 6, '2025-04-02 14:35:20', '2025-04-06 15:12:13'),
(7, 10, '2025-04-02 15:14:01', '2025-04-07 07:53:01'),
(8, 4, '2025-04-02 23:12:12', '2025-04-08 16:29:01'),
(9, 12, '2025-04-06 07:08:16', '2025-04-06 07:08:16'),
(10, 13, '2025-04-06 07:08:19', '2025-04-06 07:08:19'),
(11, 8, '2025-04-06 13:52:19', '2025-04-06 13:52:19'),
(12, 14, '2025-04-06 14:33:50', '2025-04-06 14:33:50'),
(13, 15, '2025-04-08 05:00:54', '2025-04-08 13:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `conversation_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` enum('sent','delivered','read') NOT NULL DEFAULT 'sent',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `is_admin`, `message`, `status`, `timestamp`) VALUES
(50, 2, 1, 1, 'hello', 'sent', '2025-04-08 11:58:14'),
(51, 13, 15, 0, 'dasda', 'read', '2025-04-08 13:00:59'),
(52, 13, 15, 1, 'Thank you for your message. An admin will respond to you shortly. Your inquiry is important to us.', 'sent', '2025-04-08 13:01:01'),
(53, 13, 15, 0, '12214124', 'sent', '2025-04-08 13:01:24'),
(54, 8, 4, 1, 'hello', 'sent', '2025-04-08 16:28:15'),
(55, 8, 4, 0, 'hello asdgfads', 'read', '2025-04-08 16:28:59'),
(56, 8, 4, 1, 'Thank you for your message. An admin will respond to you shortly. Your inquiry is important to us.', 'sent', '2025-04-08 16:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(12, 'Welcome', 'barangay', '1744084401_484047080_1189132989377892_4341475959018011382_n.jpg', '2025-04-08 03:53:21', '2025-04-08 03:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(3) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` tinyint(1) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `image` text,
  `verification_code` int DEFAULT NULL,
  `verified` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `birthdate`, `email`, `address`, `password`, `created_at`, `admin`, `phone`, `image`, `verification_code`, `verified`) VALUES
(1, 'joahnna', '7', '2018-01-12', 'jooos@gmail.com', 'tagaditos', '$2y$10$C6igzEIkdt3/VvCtk1EoUOF.Y5MvDOaf.Y0VWskr13pTzSiM2Bv0e', '2025-03-24 15:51:36', 0, '0929666318', NULL, NULL, NULL),
(2, 'admin', '11', '2014-03-25', 'admin@gmail.com', 'admin', '$2y$10$w9tHGyQmaIEUeXEROumDA./Jt264bShkiJpd3ocL3M6Puo.usH2ea', '2025-03-24 15:52:17', 1, NULL, NULL, NULL, NULL),
(3, 'biboy', '28', '1997-01-25', 'biboy123@gmail.com', 'biboy', '$2y$10$VhOa0ho/Bscyd6r3Z.Qj7u3GqoAzyLnWIKiG2uin9IOotWW00RYVa', '2025-03-25 06:36:22', 0, '1415611', NULL, NULL, NULL),
(4, 'michael angelo ', '28', '1997-01-25', 'biboy@gmail.com', 'biboy', '$2y$10$QaBqjzUtwRwxU.QsO.WhoetyTQwsG0ar6ya6A/nDF5mWc7KOaa8Ye', '2025-03-25 06:39:57', 0, '1415611414', NULL, NULL, NULL),
(5, 'tae', '12', '2013-03-21', 'tae@g.com', '622', '$2y$10$AWpqMM44MPsGNb3BG6.QxeM2T.7nZ3F8eY7WsT1ylacnE.P7PR5MW', '2025-03-26 05:46:22', 0, '31215', NULL, NULL, NULL),
(6, '6224', '12', '2013-01-26', '6224@gmail.com', '6224', '$2y$10$2yWRCXNo5zTYYS2GsBcR9u1wCG0cG3XTmXzbtPJdV2R8eq9bcIaXe', '2025-03-29 15:01:56', 0, '6224', NULL, NULL, NULL),
(8, 'yowbib', '21', '2003-04-30', 'yowbib@gmail.com', '622', '$2y$10$q3oWUkp.uwscfmehEUQMBeNHyGl5EHTSKlfzKuxVmMTXePmFPK8Ay', '2025-03-29 20:35:27', 0, '20222', NULL, NULL, NULL),
(9, 'yow', '16', '2009-02-28', 'yow@gmail.com', 'yow', '$2y$10$bzjVfc/ULC.EsQhox9vpueBjVF0F9nlBtDrP22Fng4UhM.BMhcREu', '2025-03-29 21:07:50', 0, '1313', 'profile_67e8d1a6c4db4.jpg', NULL, NULL),
(10, 'edmin', '21', '2004-03-30', 'edmin@gmail.com', '622', '$2y$10$GiUDARwid0aEyjfORw9VDOArV6DlBbXX6jKdHQ3Z8PosLiq/oLdQG', '2025-03-29 21:43:50', 1, '225621', 'profile_67e8da167c0b0.png', NULL, NULL),
(14, 'sdada', '19', '2005-11-29', 'smichaelangelo27@gmail.com', '123', '$2y$10$aVkZJYnAcvACgwmIG.L/0esRQ8paGr.K.WOuMZn09hakY50Zaz7wO', '2025-04-06 00:13:05', 0, '1231231233', 'profile_67f2379167066.jpg', 388312, 1),
(15, 'lian mj', '23', '2001-04-17', 'liankarlo.majerano@sdca.edu.ph', 'dasdasdasf', '$2y$10$OeqDZIWeeU4jSVRswBo6peRQmlyvcHQ79uTtORJYMApqP8RO2RfuC', '2025-04-07 07:18:11', 0, '01239141415', 'profile_67f3ecb322626.jpg', 374273, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement_recipients`
--
ALTER TABLE `announcement_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chat_user` (`user_id`),
  ADD KEY `fk_chat_complaint` (`complaint_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `complaint_type` (`complaint_type`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `announcement_recipients`
--
ALTER TABLE `announcement_recipients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement_recipients`
--
ALTER TABLE `announcement_recipients`
  ADD CONSTRAINT `fk_announcement_recipient_announcement` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_announcement_recipient_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `fk_chat_complaint` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_chat_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
