-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 27, 2016 at 03:16 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeops_hackathon2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `favorite` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `sender_id`, `receiver_id`, `amount`, `status`, `created_date`) VALUES
(1, 1, 2, 0.5, 1, '2016-08-25 22:58:23'),
(2, 2, 1, 0.8, 1, '2016-08-26 21:01:44'),
(3, 3, 1, 2, 0, '2016-08-26 22:17:01'),
(4, 1, 2, 0.8, 1, '2016-08-27 00:03:13'),
(5, 2, 1, 6, 0, '2016-08-27 00:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `number` int(10) NOT NULL,
  `pin` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `firstname`, `lastname`, `number`, `pin`, `created_date`) VALUES
(1, 1, 'Mitchel', 'Pawirodinomo', 8781953, 9349, '2016-08-25 22:44:50'),
(2, 1, 'Jonathan', 'Tobi', 8987953, 3737, '2016-08-25 22:59:00'),
(3, 2, 'Supermarkt', 'Lieuw', 8967584, 2323, '2016-08-26 20:18:07'),
(4, 1, 'Timothy', 'Pocorni', 8987273, 864762, '2016-08-26 23:19:46'),
(5, 1, 'Emanuel', 'Agon', 8973563, 9472, '2016-08-26 23:22:17');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_friends`
-- (See below for the actual view)
--
CREATE TABLE `v_friends` (
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
-- (See below for the actual view)
--
CREATE TABLE `v_transactions` (
`id` int(11)
,`sender_id` int(11)
,`receiver_id` int(11)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`gocodeop_hack`@`localhost` SQL SECURITY DEFINER VIEW `v_friends`  AS  select `u`.`id` AS `id`,`u`.`user_id` AS `user_id`,`u`.`friend_id` AS `friend_id`,`u`.`favorite` AS `favorite`,`u`.`created_date` AS `created_date`,`v`.`firstname` AS `user_firstname`,`v`.`lastname` AS `user_lastname`,`f`.`firstname` AS `friend_firstname`,`f`.`lastname` AS `friend_lastname` from ((`friends` `u` left join `users` `v` on((`v`.`id` = `u`.`user_id`))) left join `users` `f` on((`f`.`id` = `u`.`friend_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_transactions`
--
DROP TABLE IF EXISTS `v_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gocodeop_hack`@`localhost` SQL SECURITY DEFINER VIEW `v_transactions`  AS  select `t`.`id` AS `id`,`t`.`sender_id` AS `sender_id`,`t`.`receiver_id` AS `receiver_id`,`t`.`amount` AS `amount`,`t`.`status` AS `status`,`t`.`created_date` AS `created_date`,`s`.`firstname` AS `s_firstname`,`s`.`lastname` AS `s_lastname`,`r`.`firstname` AS `r_firstname`,`r`.`lastname` AS `r_lastname` from ((`transactions` `t` left join `users` `s` on((`t`.`sender_id` = `s`.`id`))) left join `users` `r` on((`t`.`receiver_id` = `r`.`id`))) ;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
