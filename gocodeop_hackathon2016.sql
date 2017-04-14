-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 28, 2016 at 06:15 AM
-- Server version: 5.5.48-37.8
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gocodeop_hackathon2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `favorite` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `favorite`, `created_date`) VALUES
(1, 1, 2, 0, '2016-08-27 03:23:41'),
(2, 1, 3, 0, '2016-08-27 03:24:06'),
(3, 1, 4, 1, '2016-08-27 03:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `sender_id`, `receiver_id`, `description`, `amount`, `status`, `created_date`) VALUES
(1, 1, 2, 'Ik moest hem wat geld geven voor zijn verjaardag', 0.5, 1, '2016-08-25 22:58:23'),
(2, 2, 1, '', 0.8, 1, '2016-08-26 21:01:44'),
(3, 3, 1, '', 2, 0, '2016-08-26 22:17:01'),
(4, 1, 2, 'Zijn zusje was jarig geworden!!!', 0.8, 1, '2016-08-27 00:03:13'),
(5, 2, 1, '', 6, 0, '2016-08-27 00:03:13'),
(6, 1, 2, 'just a test', 0.5, 1, '2016-08-28 00:38:34'),
(7, 1, 4, 'Ik heb Timothy gegeven', 0.05, 1, '2016-08-28 07:29:24'),
(8, 1, 6, 'Snoep', 0.06, 1, '2016-08-28 07:54:29'),
(9, 1, 4, 'XL hoef', 0.1, 1, '2016-08-28 07:55:49'),
(10, 1, 2, 'Hij wilt geld!', 0.05, 1, '2016-08-28 08:11:25'),
(11, 1, 3, 'Snoep', 0.03, 1, '2016-08-28 08:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `number` int(10) NOT NULL,
  `pin` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `firstname`, `lastname`, `number`, `pin`, `created_date`) VALUES
(1, 1, 'Mitchel', 'Pawirodinomo', 8781952, 1111, '2016-08-25 22:44:50'),
(2, 1, 'Jonathan', 'Tobi', 8987953, 2222, '2016-08-25 22:59:00'),
(3, 2, 'Supermarkt', 'Lieuw', 8967584, 2323, '2016-08-26 20:18:07'),
(4, 1, 'Timothy', 'Pocorni', 8987273, 864762, '2016-08-26 23:19:46'),
(5, 1, 'Emanuel', 'Agon', 8973563, 9472, '2016-08-26 23:22:17'),
(6, 2, 'Supermarkt', 'Oasis', 7678908, 1456, '2016-08-27 20:22:17'),
(7, 3, 'Admin', 'Telesur', 8781953, 9349, '2016-08-27 21:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `id` int(11) NOT NULL,
  `carriername` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` text COLLATE utf8_unicode_ci NOT NULL,
  `networktype` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id`, `carriername`, `phonenumber`, `networktype`, `latitude`, `longitude`, `created_date`) VALUES
(1, 'Android', '2147483647', 3, 22.492257, 16.171875, '2016-08-27 18:05:33'),
(2, '34', '34', 1, 234, 2343, '2016-08-27 21:28:30'),
(3, 'TeleG', '2147483647', 10, 5.8572036, -55.1043859, '2016-08-27 21:30:43'),
(4, 'TeleG', '+5978987273', 10, 5.8572, -55.1043848, '2016-08-27 21:31:39'),
(5, 'TeleG', '+5978987273', 10, 5.8572115, -55.1043764, '2016-08-27 21:48:27'),
(6, 'TeleG', '+5978987273', 10, 5.8572117, -55.1043581, '2016-08-27 21:51:14'),
(7, 'TeleG', '+5978987273', 10, 5.8572227, -55.1043566, '2016-08-27 21:51:43'),
(8, 'TeleG', '+5978987273', 10, 5.8572062, -55.1043723, '2016-08-27 21:51:54'),
(9, 'TeleG', '+5978987273', 10, 5.8572124, -55.1043782, '2016-08-27 21:55:02'),
(10, 'TeleG', '+5978987273', 10, 5.8572085, -55.1043761, '2016-08-27 22:12:57'),
(11, '', '', 0, 5.8572191, -55.1043849, '2016-08-27 23:02:51'),
(12, '', '', 0, 5.8572008, -55.1043842, '2016-08-27 23:07:42'),
(13, 'TeleG', '8888888', 1, 50.9959, 98.9898, '2016-08-28 01:23:05'),
(14, 'TeleG', '8645865', 1, 5.778429, -56.928406, '2016-08-28 01:48:57'),
(15, 'teleg', '115', 1, 50, 98.123, '2016-08-28 01:55:16'),
(16, 'TeleG', '8524505', 0, 5.88226, -56.955872, '2016-08-28 01:55:41'),
(17, 'TeleG', '8524505', 1, 5.88226, -56.955872, '2016-08-28 01:57:04'),
(18, 'TeleG', '8543538', 0, 5.898652, -56.829529, '2016-08-28 01:59:22'),
(19, 'teleg', '115', 1, 5.8571938, -55.1043679, '2016-08-28 02:00:03'),
(20, 'teleg', '115', 1, 5.8571662, -55.1043516, '2016-08-28 02:02:43'),
(21, 'teleg', '115', 1, 5.8571962, -55.1043732, '2016-08-28 02:04:03'),
(22, 'TeleG', '8735234', 1, 5.503137, -56.240387, '2016-08-28 02:06:50'),
(23, 'teleg', '8534953', 0, 5.593349, -56.017914, '2016-08-28 02:08:13'),
(24, 'teleg', '8435835', 1, 5.585149, -55.616913, '2016-08-28 02:10:01'),
(25, 'teleg', '8948437', 1, 5.735474, -55.237885, '2016-08-28 02:11:05'),
(26, 'teleg', '8685738', 0, 5.377363, -54.315033, '2016-08-28 02:12:23'),
(27, 'teleg', '8685738', 1, 5.377363, -54.315033, '2016-08-28 02:12:32'),
(28, 'teleg', '8535395', 0, 5.459392, -55.17746, '2016-08-28 02:14:48'),
(29, 'teleg', '8565678', 1, 5.289853, -55.910797, '2016-08-28 02:23:17'),
(30, 'teleg', '8646456', 1, 5.738207, -56.314545, '2016-08-28 02:24:41'),
(31, 'teleg', '8684537', 1, 5.464861, -56.138763, '2016-08-28 02:25:51'),
(32, 'teleg', '8954567', 0, 5.396504, -56.416168, '2016-08-28 02:26:55'),
(33, 'teleg', '8954576', 0, 5.661683, -55.622406, '2016-08-28 02:28:24'),
(34, 'teleg', '8838585', 1, 5.822918, -54.993439, '2016-08-28 02:34:18'),
(35, 'teleg', '8954574', 1, 5.486733, -56.188202, '2016-08-28 02:35:31'),
(36, 'teleg', '8856435', 1, 5.810583, -55.244252, '2016-08-28 04:04:10'),
(37, 'teleg', '8580344', 0, 5.575543, -55.645253, '2016-08-28 04:05:19'),
(38, 'teleg', '8904534', 1, 5.788723, -55.359609, '2016-08-28 04:06:15'),
(39, 'teleg', '8506543', 0, 5.690342, -55.046498, '2016-08-28 04:07:08'),
(40, 'teleg', '8645334', 1, 5.553673, -54.425771, '2016-08-28 04:08:38'),
(41, 'teleg', '8964563', 1, 5.411505, -54.87621, '2016-08-28 04:09:41'),
(42, 'teleg', '8945643', 1, 5.356815, -55.562856, '2016-08-28 04:13:01'),
(43, 'teleg', '8943234', 1, 5.936263, -56.930653, '2016-08-28 04:14:41'),
(44, 'teleg', '8534564', 0, 5.755931, -55.925404, '2016-08-28 04:16:05'),
(45, 'teleg', '8896446', 1, 5.876159, -55.524403, '2016-08-28 04:18:22'),
(46, 'teleg', '8678565', 1, 5.630212, -54.431264, '2016-08-28 04:20:11'),
(47, 'teleg', '8956435', 1, 5.799653, -55.90343, '2016-08-28 04:21:17'),
(48, 'teleg', '8956745', 1, 5.591944, -55.678211, '2016-08-28 04:23:38'),
(49, 'teleg', '8765664', 1, 5.668477, -57.095447, '2016-08-28 04:24:42'),
(50, 'teleg', '8645345', 1, 5.425735, -55.095438, '2016-08-28 04:26:08'),
(51, 'teleg', '8566466', 1, 5.392923, -55.172342, '2016-08-28 04:29:12'),
(52, 'teleg', '8967564', 0, 5.403861, -56.117166, '2016-08-28 04:30:21'),
(53, 'teleg', '8964563', 1, 5.447609, -57.06199, '2016-08-28 04:31:59'),
(54, 'teleg', '8987654', 1, 5.414798, -55.425028, '2016-08-28 04:33:48'),
(55, 'teleg', '8854564', 1, 5.513226, -56.007303, '2016-08-28 04:34:51'),
(56, 'teleg', '8975634', 1, 5.392923, -56.941141, '2016-08-28 04:35:50'),
(57, 'teleg', '8956533', 1, 5.11942, -55.77659, '2016-08-28 04:37:07'),
(58, 'teleg', '8565435', 1, 5.272597, -54.842752, '2016-08-28 04:37:58'),
(59, 'teleg', '8854533', 1, 5.458546, -56.875223, '2016-08-28 04:38:41'),
(60, 'teleg', '8566564', 1, 5.360109, -57.051004, '2016-08-28 04:39:32');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_friends`
--
CREATE TABLE IF NOT EXISTS `v_friends` (
`id` int(11)
,`user_id` int(11)
,`friend_id` int(11)
,`favorite` int(11)
,`created_date` timestamp
,`user_firstname` varchar(255)
,`user_lastname` varchar(255)
,`friend_firstname` varchar(255)
,`friend_lastname` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transactions`
--
CREATE TABLE IF NOT EXISTS `v_transactions` (
`id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
,`description` varchar(255)
,`amount` double
,`status` int(11)
,`created_date` timestamp
,`s_firstname` varchar(255)
,`s_lastname` varchar(255)
,`r_firstname` varchar(255)
,`r_lastname` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_friends`
--
DROP TABLE IF EXISTS `v_friends`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gocodeops`@`localhost` SQL SECURITY DEFINER VIEW `v_friends` AS select `u`.`id` AS `id`,`u`.`user_id` AS `user_id`,`u`.`friend_id` AS `friend_id`,`u`.`favorite` AS `favorite`,`u`.`created_date` AS `created_date`,`v`.`firstname` AS `user_firstname`,`v`.`lastname` AS `user_lastname`,`f`.`firstname` AS `friend_firstname`,`f`.`lastname` AS `friend_lastname` from ((`friends` `u` left join `users` `v` on((`v`.`id` = `u`.`user_id`))) left join `users` `f` on((`f`.`id` = `u`.`friend_id`)));

-- --------------------------------------------------------

--
-- Structure for view `v_transactions`
--
DROP TABLE IF EXISTS `v_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gocodeops`@`localhost` SQL SECURITY DEFINER VIEW `v_transactions` AS select `t`.`id` AS `id`,`t`.`sender_id` AS `sender_id`,`t`.`receiver_id` AS `receiver_id`,`t`.`description` AS `description`,`t`.`amount` AS `amount`,`t`.`status` AS `status`,`t`.`created_date` AS `created_date`,`s`.`firstname` AS `s_firstname`,`s`.`lastname` AS `s_lastname`,`r`.`firstname` AS `r_firstname`,`r`.`lastname` AS `r_lastname` from ((`transactions` `t` left join `users` `s` on((`t`.`sender_id` = `s`.`id`))) left join `users` `r` on((`t`.`receiver_id` = `r`.`id`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
