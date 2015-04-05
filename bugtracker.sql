-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2015 at 08:25 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bugtracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE IF NOT EXISTS `defect` (
`id` int(10) unsigned NOT NULL,
  `id_project` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `short_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `defect_assignee`
--

CREATE TABLE IF NOT EXISTS `defect_assignee` (
  `id_defect` int(10) unsigned NOT NULL,
  `id_assignator` int(10) unsigned NOT NULL,
  `id_assignee` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `defect_history`
--

CREATE TABLE IF NOT EXISTS `defect_history` (
  `id_defect` int(10) unsigned NOT NULL,
  `id_operation` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `defect_lc`
--

CREATE TABLE IF NOT EXISTS `defect_lc` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defect_lc`
--

INSERT INTO `defect_lc` (`id`, `name`) VALUES
(3, 'Создан'),
(4, 'Назначен'),
(5, 'Отсрочен'),
(7, 'Отклонен'),
(8, 'Исправлен'),
(9, 'Переоткрыт'),
(10, 'Закрыт');

-- --------------------------------------------------------

--
-- Table structure for table `defect_operation_access`
--

CREATE TABLE IF NOT EXISTS `defect_operation_access` (
  `id_operation` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `defect_operation_access`
--

INSERT INTO `defect_operation_access` (`id_operation`, `id_role`) VALUES
(2, 2),
(2, 4),
(3, 2),
(3, 2),
(3, 4),
(4, 2),
(4, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `defect_transition`
--

CREATE TABLE IF NOT EXISTS `defect_transition` (
  `id_current` int(11) unsigned DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defect_transition`
--

INSERT INTO `defect_transition` (`id_current`, `id_status`, `id`, `name`) VALUES
(NULL, 3, 2, 'Создать'),
(3, 4, 3, 'Назначить'),
(3, 5, 4, 'Отложить'),
(3, 7, 5, 'Отклонить'),
(4, 5, 6, 'Отсрочить '),
(4, 7, 7, 'Отклонить'),
(4, 8, 8, 'Исправить'),
(5, 4, 9, 'Открыть'),
(5, 10, 10, 'Закрыть'),
(7, 10, 11, 'Закрыть'),
(7, 9, 12, 'Переоткрыт'),
(8, 9, 13, 'Переоткрыть'),
(8, 10, 14, 'Закрыть'),
(9, 7, 15, 'Отклонить'),
(9, 5, 16, 'Отложить'),
(9, 8, 17, 'Исправлен');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `comments` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(2, 'Менеджер'),
(3, 'Девелопер'),
(4, 'Тестировщик'),
(6, 'Наблюдатель');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL COMMENT 'код користувача',
  `login` varchar(42) NOT NULL,
  `password` varchar(42) NOT NULL,
  `email` varchar(256) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `canAddProject` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `id_user` int(10) unsigned NOT NULL,
  `id_project` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
 ADD PRIMARY KEY (`id`), ADD KEY `id_project` (`id_project`);

--
-- Indexes for table `defect_assignee`
--
ALTER TABLE `defect_assignee`
 ADD KEY `id_defect` (`id_defect`,`id_assignator`,`id_assignee`), ADD KEY `id_assignator` (`id_assignator`), ADD KEY `id_assignee` (`id_assignee`);

--
-- Indexes for table `defect_history`
--
ALTER TABLE `defect_history`
 ADD KEY `id_defect` (`id_defect`,`id_operation`,`id_user`), ADD KEY `id_operation` (`id_operation`), ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `defect_lc`
--
ALTER TABLE `defect_lc`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `defect_operation_access`
--
ALTER TABLE `defect_operation_access`
 ADD KEY `id_operation` (`id_operation`,`id_role`), ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `defect_transition`
--
ALTER TABLE `defect_transition`
 ADD PRIMARY KEY (`id`), ADD KEY `id_current` (`id_current`,`id_status`), ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `login` (`login`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
 ADD KEY `id_user` (`id_user`,`id_project`,`id_role`), ADD KEY `id_project` (`id_project`), ADD KEY `id_role` (`id_role`), ADD KEY `id_user_2` (`id_user`,`id_project`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `defect`
--
ALTER TABLE `defect`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `defect_lc`
--
ALTER TABLE `defect_lc`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `defect_transition`
--
ALTER TABLE `defect_transition`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'код користувача';
--
-- Constraints for dumped tables
--

--
-- Constraints for table `defect`
--
ALTER TABLE `defect`
ADD CONSTRAINT `defect_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`);

--
-- Constraints for table `defect_assignee`
--
ALTER TABLE `defect_assignee`
ADD CONSTRAINT `defect_assignee_ibfk_1` FOREIGN KEY (`id_defect`) REFERENCES `defect` (`id`),
ADD CONSTRAINT `defect_assignee_ibfk_2` FOREIGN KEY (`id_assignator`) REFERENCES `users` (`id`),
ADD CONSTRAINT `defect_assignee_ibfk_3` FOREIGN KEY (`id_assignee`) REFERENCES `users` (`id`);

--
-- Constraints for table `defect_history`
--
ALTER TABLE `defect_history`
ADD CONSTRAINT `defect_history_ibfk_1` FOREIGN KEY (`id_defect`) REFERENCES `defect` (`id`),
ADD CONSTRAINT `defect_history_ibfk_2` FOREIGN KEY (`id_operation`) REFERENCES `defect_transition` (`id`),
ADD CONSTRAINT `defect_history_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `defect_operation_access`
--
ALTER TABLE `defect_operation_access`
ADD CONSTRAINT `defect_operation_access_ibfk_1` FOREIGN KEY (`id_operation`) REFERENCES `defect_transition` (`id`),
ADD CONSTRAINT `defect_operation_access_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `defect_transition`
--
ALTER TABLE `defect_transition`
ADD CONSTRAINT `defect_transition_ibfk_1` FOREIGN KEY (`id_current`) REFERENCES `defect_lc` (`id`),
ADD CONSTRAINT `defect_transition_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `defect_lc` (`id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
ADD CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
ADD CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`),
ADD CONSTRAINT `users_roles_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
