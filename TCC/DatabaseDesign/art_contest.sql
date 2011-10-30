-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 14, 2011 at 12:35 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `art_contest`
--

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE IF NOT EXISTS `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `name`, `description`) VALUES
(1, 'Silver', 'Second place!'),
(2, 'Gold', 'First place!');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `instructions` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `instructions`) VALUES
(1, 'Art', 'Not photographs', 'Don''t submit photographs here'),
(2, 'Photographs', 'Not art', 'Don''t submit art here.');

-- --------------------------------------------------------

--
-- Table structure for table `demographic_information`
--

CREATE TABLE IF NOT EXISTS `demographic_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `race` varchar(50) NOT NULL,
  `income` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `entry_awards`
--

CREATE TABLE IF NOT EXISTS `entry_awards` (
  `student_entry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  PRIMARY KEY (`student_entry_id`,`award_id`),
  KEY `award_id` (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `entry_scores`
--
CREATE TABLE IF NOT EXISTS `entry_scores` (
`title` varchar(100)
,`total_votes` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE IF NOT EXISTS `judges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `username`, `password`, `first_name`, `last_name`) VALUES
(1, 'george', 'password', 'George', 'Harrison'),
(2, 'ringo', 'password', 'Ringo', 'Starr');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `consent_signed` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photography_consents`
--

CREATE TABLE IF NOT EXISTS `photography_consents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_entry_id` int(11) NOT NULL,
  `date_signed` date NOT NULL,
  `name` varchar(200) NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_entry_id` (`student_entry_id`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `principals`
--

CREATE TABLE IF NOT EXISTS `principals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  KEY `title_id` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `street_address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `fax` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `type`, `street_address`, `city`, `state`, `zip`, `phone`, `fax`) VALUES
(1, 'Bartlesville High School', 'public', '1313 Mockingbird Lane', 'Bartlesville', 'OK', '74006', '9181112222', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `state` char(2) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state`, `state_name`) VALUES
('AK', 'Alaska'),
('AL', 'Alabama'),
('AR', 'Arkansas'),
('AZ', 'Arizona'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DC', 'District of Columbia'),
('DE', 'Delaware'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('IA', 'Iowa'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('MA', 'Massachusetts'),
('MD', 'Maryland'),
('ME', 'Maine'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MO', 'Missouri'),
('MS', 'Mississippi'),
('MT', 'Montana'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('NE', 'Nebraska'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NV', 'Nevada'),
('NY', 'New York'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VA', 'Virginia'),
('VT', 'Vermont'),
('WA', 'Washington'),
('WI', 'Wisconsin'),
('WV', 'West Virginia'),
('WY', 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `street_address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `grade` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `consent_signed` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `school_id` (`school_id`),
  KEY `state` (`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `password`, `school_id`, `first_name`, `last_name`, `street_address`, `city`, `state`, `zip`, `grade`, `age`, `email`, `phone`, `fax`, `consent_signed`) VALUES
(1, 'lala', 'password', 1, 'La', 'La', '1214 absdfae ewr', 'Tulsa', 'OK', '74127', 12, 18, 'blah@blah.com', '1922142523', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_entries`
--

CREATE TABLE IF NOT EXISTS `student_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `portfolio_id` int(11) DEFAULT NULL,
  `round_number` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `file` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `category_id` (`category_id`),
  KEY `portfolio_id` (`portfolio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student_entries`
--

INSERT INTO `student_entries` (`id`, `student_id`, `teacher_id`, `category_id`, `portfolio_id`, `round_number`, `title`, `description`, `file`) VALUES
(1, 1, 1, 1, NULL, 0, 'IT''S A PICTURE', 'IT IS PRETTY', 'blah.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `student_portfolios`
--

CREATE TABLE IF NOT EXISTS `student_portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dimension_length` float DEFAULT NULL,
  `dimension_width` float DEFAULT NULL,
  `dimension_height` float DEFAULT NULL,
  `length_minutes` int(11) DEFAULT NULL,
  `length_seconds` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `school_id` (`school_id`),
  KEY `title_id` (`title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `school_id`, `title_id`, `first_name`, `last_name`, `email`) VALUES
(1, 1, 2, 'Delia', 'Roberts', 'blah@blah.com');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `name`) VALUES
(1, 'Dr'),
(2, 'Mr'),
(3, 'Mrs'),
(4, 'Ms');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `judge_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  PRIMARY KEY (`judge_id`,`entry_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`judge_id`, `entry_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `winning_entries`
--
CREATE TABLE IF NOT EXISTS `winning_entries` (
`entry_title` varchar(100)
,`award_name` varchar(100)
);
-- --------------------------------------------------------

--
-- Structure for view `entry_scores`
--
DROP TABLE IF EXISTS `entry_scores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `entry_scores` AS select `student_entries`.`title` AS `title`,count(`votes`.`judge_id`) AS `total_votes` from (`student_entries` join `votes`) where (`student_entries`.`id` = `votes`.`entry_id`);

-- --------------------------------------------------------

--
-- Structure for view `winning_entries`
--
DROP TABLE IF EXISTS `winning_entries`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `winning_entries` AS select `student_entries`.`title` AS `entry_title`,`awards`.`name` AS `award_name` from ((`student_entries` join `entry_awards` on((`student_entries`.`id` = `entry_awards`.`student_entry_id`))) join `awards` on((`awards`.`id` = `entry_awards`.`award_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `demographic_information`
--
ALTER TABLE `demographic_information`
  ADD CONSTRAINT `demographic_information_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `entry_awards`
--
ALTER TABLE `entry_awards`
  ADD CONSTRAINT `entry_awards_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`),
  ADD CONSTRAINT `entry_awards_ibfk_1` FOREIGN KEY (`student_entry_id`) REFERENCES `student_entries` (`id`);

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `photography_consents`
--
ALTER TABLE `photography_consents`
  ADD CONSTRAINT `photography_consents_ibfk_2` FOREIGN KEY (`state`) REFERENCES `states` (`state`),
  ADD CONSTRAINT `photography_consents_ibfk_1` FOREIGN KEY (`student_entry_id`) REFERENCES `student_entries` (`id`);

--
-- Constraints for table `principals`
--
ALTER TABLE `principals`
  ADD CONSTRAINT `principals_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`),
  ADD CONSTRAINT `principals_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`state`) REFERENCES `states` (`state`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`state`) REFERENCES `states` (`state`);

--
-- Constraints for table `student_entries`
--
ALTER TABLE `student_entries`
  ADD CONSTRAINT `student_entries_ibfk_7` FOREIGN KEY (`portfolio_id`) REFERENCES `student_portfolios` (`id`),
  ADD CONSTRAINT `student_entries_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_entries_ibfk_5` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `student_entries_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `student_portfolios`
--
ALTER TABLE `student_portfolios`
  ADD CONSTRAINT `student_portfolios_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `student_portfolios_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`),
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`entry_id`) REFERENCES `student_entries` (`id`),
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
