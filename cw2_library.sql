-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 07:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cw2_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(12) NOT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `category_id` int(12) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `book_copies` varchar(12) DEFAULT NULL,
  `book_publisher` varchar(255) DEFAULT NULL,
  `publisher_city` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `copyright_year` int(12) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `status` enum('New','Archive','Damage','Lost','Old') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_title`, `category_id`, `author`, `book_copies`, `book_publisher`, `publisher_city`, `isbn`, `copyright_year`, `date_added`, `status`) VALUES
(15, 'Natural Resources', 8, 'Robin Kerrod', '15', 'Marshall Cavendish Corporation', 'Marshall', '1-85435-628-3', 1997, '2013-12-11 06:34:27', 'New'),
(16, 'Encyclopedia Americana', 5, 'Grolier', '20', 'Connecticut', 'Grolier Incorporation', '0-7172-0119-8', 1988, '2013-12-11 06:36:23', 'Archive'),
(17, 'Algebra 1', 3, 'Carolyn Bradshaw, Michael Seals', '35', 'Pearson Education, Inc', 'Prentice Hall, New Jersey', '0-13-125087-6', 2004, '2013-12-11 06:39:17', 'Damage'),
(18, 'The Philippine Daily Inquirer', 7, '..', '3', 'Pasay City', '..', '..', 2013, '2013-12-11 06:41:53', 'New'),
(19, 'Science in our World', 4, 'Brian Knapp', '25', 'Regency Publishing Group', 'Prentice Hall, Inc', '0-13-050841-1', 1996, '2013-12-11 06:44:44', 'Lost'),
(20, 'Literature', 9, 'Greg Glowka', '20', 'Regency Publishing Group', 'Prentice Hall, Inc', '0-13-050841-1', 2001, '2013-12-11 06:47:44', 'Old'),
(21, 'Lexicon Universal Encyclopedia', 5, 'Lexicon', '10', 'Lexicon Publication', 'Pulication Inc., Lexicon', '0-7172-2043-5', 1993, '2013-12-11 06:49:53', 'Old'),
(22, 'Science and Invention Encyclopedia', 5, 'Clarke Donald, Dartford Mark', '16', 'H.S. Stuttman inc. Publishing', 'Publisher , Westport Connecticut', '0-87475-450-x', 1992, '2013-12-11 06:52:58', 'New'),
(23, 'Integrated Science Textbook ', 4, 'Merde C. Tan', '15', 'Vibal Publishing House Inc.', '12536. Araneta Avenue Corner Ma. Clara St., Quezon City', '971-570-124-8', 2009, '2013-12-11 06:55:27', 'New'),
(24, 'Algebra 2', 3, 'Glencoe McGraw Hill', '15', 'The McGrawHill Companies Inc.', 'McGrawhill', '978-0-07-873830-2', 2008, '2013-12-11 06:57:35', 'New'),
(25, 'Wiki at Panitikan ', 7, 'Lorenza P. Avera', '28', 'JGM & S Corporation', 'JGM & S Corporation', '971-07-1574-7', 2000, '2013-12-11 06:59:24', 'Damage'),
(26, 'English Expressways TextBook for 4th year', 9, 'Virginia Bermudez Ed. O. et al', '23', 'SD Publications, Inc.', 'Gregorio Araneta Avenue, Quezon City', '978-971-0315-33-8', 2007, '2013-12-11 07:01:25', 'New'),
(27, 'Asya Pag-usbong Ng Kabihasnan ', 8, 'Ricardo T. Jose, Ph . D.', '21', 'Vibal Publishing House Inc.', 'Araneta Avenue . Cor. Maria Clara St., Quezon City', '971-07-2324-3', 2008, '2013-12-11 07:02:56', 'New'),
(28, 'Literature (the readers choice)', 9, 'Glencoe McGraw Hill', '20', '..', 'the McGrawHill Companies Inc', '0-02-817934-x', 2001, '2013-12-11 07:05:25', 'Damage'),
(29, 'Beloved a Novel', 9, 'Toni Morrison', '13', '..', 'Alfred A. Knoff, Inc', '0-394-53597-9', 1987, '2013-12-11 07:07:02', 'Old'),
(30, 'Silver Burdett Engish', 2, 'Judy Brim', '12', 'Silver Burdett Company', 'Silver', '0-382-03575-5', 1985, '2013-12-11 09:22:50', 'Old'),
(31, 'The Corporate Warriors (Six Classic Cases in American Business)', 8, 'Douglas K. Ramsey', '8', 'Houghton Miffin Company', '..', '0-395-35487-0', 1987, '2013-12-11 09:25:32', 'Old'),
(32, 'Introduction to Information System', 9, 'Cristine Redoblo', '10', 'CHMSC', 'Brian INC', '123-132', 2013, '2014-01-17 19:00:10', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `borrow_id` int(12) NOT NULL,
  `member_id` int(12) NOT NULL,
  `book_id` int(12) NOT NULL,
  `date_borrow` datetime NOT NULL,
  `due_date` date NOT NULL,
  `borrow_status` enum('Pending','Returned') NOT NULL,
  `date_return` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrow_id`, `member_id`, `book_id`, `date_borrow`, `due_date`, `borrow_status`, `date_return`) VALUES
(482, 52, 15, '2014-03-20 23:38:00', '2014-03-21', 'Returned', '2014-03-21 00:30:00'),
(483, 55, 15, '2014-03-20 23:49:00', '2014-03-21', 'Pending', NULL),
(484, 55, 16, '2014-03-20 23:50:11', '2014-03-21', 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(12) NOT NULL,
  `classname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `classname`) VALUES
(1, 'Periodical'),
(2, 'English'),
(3, 'Math'),
(4, 'Science'),
(5, 'Encyclopaedia'),
(6, 'Filipinia'),
(7, 'Newspaper'),
(8, 'General'),
(9, 'References');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(12) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` enum('Female','Male') DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `contact` int(12) NOT NULL,
  `type_id` int(12) NOT NULL,
  `year_level` varchar(255) NOT NULL,
  `status` enum('Active','Banned') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `firstname`, `lastname`, `gender`, `address`, `contact`, `type_id`, `year_level`, `status`) VALUES
(52, 'Mark', 'Sanchez', 'Male', 'Talisay', 212010, 2, 'Faculty', 'Active'),
(53, 'April Joy', 'Aguilar', 'Female', 'E.B. Magalona', 0, 22, 'Second Year', 'Banned'),
(54, 'Alfonso', 'Pancho', 'Male', 'E.B. Magalona', 9, 22, 'First Year', 'Active'),
(55, 'Jonathan', 'Antanilla', 'Male', 'E.B. Magalona', 32, 22, 'Fourth Year', 'Active'),
(56, 'Renzo Bryan', 'Pedroso', 'Male', 'Silay City', 3030, 22, 'Third Year', 'Active'),
(57, 'Eleazar', 'Duterte', 'Male', 'E.B. Magalona', 90902, 22, 'Second Year', 'Active'),
(58, 'Ellen Mae', 'Espino', 'Female', 'E.B. Magalona', 123, 22, 'First Year', 'Active'),
(59, 'Ruth', 'Magbanua', 'Female', 'E.B. Magalona', 9340, 22, 'Second Year', 'Active'),
(60, 'Shaina Marie', 'Gabino', 'Female', 'Silay City', 132134, 22, 'Second Year', 'Active'),
(62, 'Chairty Joy', 'Punzalan', 'Female', 'E.B. Magalona', 12423, 2, 'Faculty', 'Active'),
(63, 'Kristine May', 'Dela Rosa', 'Female', 'Silay City', 1321, 22, 'Second Year', 'Active'),
(64, 'Chinie marie', 'Laborosa', 'Female', 'E.B. Magalona', 902101, 22, 'Second Year', 'Active'),
(65, 'Ruby\r\n', 'Morante', 'Female', 'E.B. Magalona', 0, 2, 'Faculty', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(12) NOT NULL,
  `borrower_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `borrower_type`) VALUES
(2, 'Teacher'),
(20, 'Employee'),
(21, 'Non-Teaching'),
(22, 'Student'),
(32, 'Construction');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `firstname`, `lastname`) VALUES
('admin', 'admin', 'john', 'smith');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `borrow_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
