-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 06:35 AM
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
-- Database: `db_hotel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_names` ()   BEGIN
    -- Variable to hold the concatenated names
    DECLARE customer_names VARCHAR(1000);
    
    -- Variables to hold the current employee data
    DECLARE done INT DEFAULT FALSE;
    DECLARE customer_id INT;
    DECLARE customer_name VARCHAR(255);

    -- Declare a cursor for the employees table
    DECLARE cur CURSOR FOR 
        SELECT customer_id, name
        FROM customer;

    -- Declare continue handler to exit loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Initialize the concatenated names
    SET customer_names = '';

    -- Open the cursor
    OPEN cur;

    -- Loop through the cursor data and concatenate names
    read_loop: LOOP
        FETCH cur INTO customer_id, customer_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Concatenate the current employee name with the existing names
        IF customer_names <> '' THEN
            SET customer_names = CONCAT(customer_names, ', ', customer_name);
        ELSE
            SET customer_names = customer_name;
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE cur;

    -- Return the concatenated names
    SELECT customer_names;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `count_customer_by_age` (`cust_age` INT) RETURNS INT(11)  BEGIN
	DECLARE total_customers INT; 
	SELECT COUNT(*) INTO total_customers FROM customer WHERE customer.age = cust_age;
    RETURN total_customers;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `age`, `address`, `email`, `phone_number`) VALUES
(1, 'Doni Darko', 21, 'Semarang', 'DonDar@gmail.com', '087676542432'),
(2, 'Arie Untung', 32, 'Jakarta', 'Arie@gmail.com', '085835647525'),
(3, 'Aryo Wardhono', 23, 'Temanggung', 'Arwar@gmail.com', '085356485240'),
(4, 'Abu Dhahak', 40, 'Bekasi', 'Ahak@gmail.com', '082335844520'),
(5, 'Nathanael', 34, 'Magelang', 'nathanEl@gmail.com', '082346589452'),
(6, 'Wahyu Aini', 42, 'Muntilan', 'ainiW@gmail.com', '082745246578'),
(7, 'Adi', 25, 'Jakarta', 'adi@gmail.com', '081234567890'),
(8, 'Budi', 30, 'Bandung', 'budi@gmail.com', '082345678901'),
(9, 'Citra', 28, 'Surabaya', 'citra@gmail.com', '083456789012'),
(10, 'Dewi', 35, 'Yogyakarta', 'dewi@gmail.com', '084567890123'),
(11, 'Eka', 22, 'Semarang', 'eka@gmail.com', '085678901234'),
(12, 'Fajar', 27, 'Medan', 'fajar@gmail.com', '086789012345'),
(13, 'Gita', 33, 'Denpasar', 'gita@gmail.com', '087890123456'),
(14, 'Hadi', 29, 'Makassar', 'hadi@gmail.com', '088901234567'),
(15, 'Indra', 31, 'Palembang', 'indra@gmail.com', '089012345678'),
(16, 'Joko', 26, 'Surakarta', 'joko@gmail.com', '090123456789'),
(17, 'Kartika', 23, 'Malang', 'kartika@gmail.com', '091234567890'),
(18, 'Lina', 34, 'Padang', 'lina@gmail.com', '092345678901'),
(19, 'Mega', 31, 'Batam', 'mega@gmail.com', '093456789012'),
(20, 'Nina', 29, 'Pontianak', 'nina@gmail.com', '094567890123'),
(21, 'Oscar', 27, 'Bogor', 'oscar@gmail.com', '095678901234'),
(22, 'Putri', 24, 'Manado', 'putri@gmail.com', '096789012345'),
(23, 'Rudi', 32, 'Semarang', 'rudi@gmail.com', '097890123456'),
(24, 'Siska', 28, 'Bandung', 'siska@gmail.com', '098901234567'),
(25, 'Tika', 30, 'Jakarta', 'tika@gmail.com', '099012345678'),
(26, 'Umi', 33, 'Surabaya', 'umi@gmail.com', '100123456789'),
(27, 'Vina', 25, 'Yogyakarta', 'vina@gmail.com', '101234567890'),
(28, 'Wati', 27, 'Medan', 'wati@gmail.com', '102345678901'),
(29, 'Xavier', 32, 'Denpasar', 'xavier@gmail.com', '103456789012'),
(30, 'Yani', 29, 'Makassar', 'yani@gmail.com', '104567890123'),
(31, 'Zara', 26, 'Palembang', 'zara@gmail.com', '105678901234'),
(32, 'Alya', 30, 'Semarang', 'alya@gmail.com', '106789012345'),
(33, 'Bowo', 24, 'Medan', 'bowo@gmail.com', '107890123456'),
(34, 'Cindy', 27, 'Yogyakarta', 'cindy@gmail.com', '108901234567'),
(35, 'Denny', 33, 'Surabaya', 'denny@gmail.com', '109012345678'),
(36, 'Eva', 25, 'Bandung', 'eva@gmail.com', '110123456789'),
(37, 'Ferry', 28, 'Jakarta', 'ferry@gmail.com', '111234567890'),
(38, 'Gita', 31, 'Surakarta', 'gita@gmail.com', '112345678901'),
(39, 'Hendra', 26, 'Malang', 'hendra@gmail.com', '113456789012'),
(40, 'Indah', 29, 'Semarang', 'indah@gmail.com', '114567890123'),
(41, 'Jaya', 33, 'Bandung', 'jaya@gmail.com', '115678901234'),
(42, 'Krisna', 27, 'Jakarta', 'krisna@gmail.com', '116789012345'),
(43, 'Laras', 30, 'Surabaya', 'laras@gmail.com', '117890123456'),
(44, 'Adi', 25, 'Jakarta', 'adi@gmail.com', '081234567890'),
(45, 'Budi', 30, 'Bandung', 'budi@gmail.com', '082345678901'),
(46, 'Citra', 28, 'Surabaya', 'citra@gmail.com', '083456789012'),
(47, 'Dewi', 35, 'Yogyakarta', 'dewi@gmail.com', '084567890123'),
(48, 'Eka', 22, 'Semarang', 'eka@gmail.com', '085678901234'),
(49, 'Fajar', 27, 'Medan', 'fajar@gmail.com', '086789012345'),
(50, 'Gita', 33, 'Denpasar', 'gita@gmail.com', '087890123456'),
(51, 'Hadi', 29, 'Makassar', 'hadi@gmail.com', '088901234567'),
(52, 'Indra', 31, 'Palembang', 'indra@gmail.com', '089012345678'),
(53, 'Joko', 26, 'Surakarta', 'joko@gmail.com', '090123456789'),
(54, 'Kartika', 23, 'Malang', 'kartika@gmail.com', '091234567890'),
(55, 'Lina', 34, 'Padang', 'lina@gmail.com', '092345678901'),
(56, 'Mega', 31, 'Batam', 'mega@gmail.com', '093456789012'),
(57, 'Nina', 29, 'Pontianak', 'nina@gmail.com', '094567890123'),
(58, 'Oscar', 27, 'Bogor', 'oscar@gmail.com', '095678901234'),
(59, 'Putri', 24, 'Manado', 'putri@gmail.com', '096789012345'),
(60, 'Rudi', 32, 'Semarang', 'rudi@gmail.com', '097890123456'),
(61, 'Siska', 28, 'Bandung', 'siska@gmail.com', '098901234567'),
(62, 'Tika', 30, 'Jakarta', 'tika@gmail.com', '099012345678'),
(63, 'Umi', 33, 'Surabaya', 'umi@gmail.com', '100123456789'),
(64, 'Vina', 25, 'Yogyakarta', 'vina@gmail.com', '101234567890'),
(65, 'Wati', 27, 'Medan', 'wati@gmail.com', '102345678901'),
(66, 'Xavier', 32, 'Denpasar', 'xavier@gmail.com', '103456789012'),
(67, 'Yani', 29, 'Makassar', 'yani@gmail.com', '104567890123'),
(68, 'Zara', 26, 'Palembang', 'zara@gmail.com', '105678901234'),
(69, 'Alya', 30, 'Semarang', 'alya@gmail.com', '106789012345'),
(70, 'Bowo', 24, 'Medan', 'bowo@gmail.com', '107890123456'),
(71, 'Cindy', 27, 'Yogyakarta', 'cindy@gmail.com', '108901234567'),
(72, 'Denny', 33, 'Surabaya', 'denny@gmail.com', '109012345678'),
(73, 'Eva', 25, 'Bandung', 'eva@gmail.com', '110123456789'),
(74, 'Ferry', 28, 'Jakarta', 'ferry@gmail.com', '111234567890'),
(75, 'Gita', 31, 'Surakarta', 'gita@gmail.com', '112345678901'),
(76, 'Hendra', 26, 'Malang', 'hendra@gmail.com', '113456789012'),
(77, 'Indah', 29, 'Semarang', 'indah@gmail.com', '114567890123'),
(78, 'Jaya', 33, 'Bandung', 'jaya@gmail.com', '115678901234'),
(79, 'Krisna', 27, 'Jakarta', 'krisna@gmail.com', '116789012345'),
(80, 'Laras', 30, 'Surabaya', 'laras@gmail.com', '117890123456'),
(81, 'Mira', 25, 'Yogyakarta', 'mira@gmail.com', '118901234567'),
(82, 'Nanda', 28, 'Medan', 'nanda@gmail.com', '119012345678'),
(83, 'Oktavia', 32, 'Bandung', 'oktavia@gmail.com', '120123456789'),
(84, 'Prasetyo', 29, 'Surabaya', 'prasetyo@gmail.com', '121234567890'),
(85, 'Qori', 26, 'Jakarta', 'qori@gmail.com', '122345678901'),
(86, 'Rahma', 30, 'Yogyakarta', 'rahma@gmail.com', '123456789012'),
(87, 'Sandy', 27, 'Bandung', 'sandy@gmail.com', '124567890123'),
(88, 'Tari', 31, 'Surakarta', 'tari@gmail.com', '125678901234'),
(89, 'Ujang', 28, 'Semarang', 'ujang@gmail.com', '126789012345'),
(90, 'Vivi', 33, 'Jakarta', 'vivi@gmail.com', '127890123456'),
(91, 'Wawan', 29, 'Surabaya', 'wawan@gmail.com', '128901234567'),
(92, 'Xanthy', 32, 'Bandung', 'xanthy@gmail.com', '129012345678'),
(93, 'Yusuf', 26, 'Jakarta', 'yusuf@gmail.com', '130123456789'),
(94, 'Siapa Hayo', 30, 'Yogyakarta', 'zalfa@gmail.com', '131234567890');

-- --------------------------------------------------------

--
-- Table structure for table `customer_log`
--

CREATE TABLE `customer_log` (
  `log_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_log`
--

INSERT INTO `customer_log` (`log_id`, `customer_id`, `name`, `age`, `address`, `email`, `phone_number`, `updated_at`) VALUES
(1, 94, 'Zalfa', 30, 'Yogyakarta', 'zalfa@gmail.com', '131234567890', '2023-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `floor_id` int(11) NOT NULL,
  `floor` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floor_id`, `floor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `date_check_in` date DEFAULT NULL,
  `date_check_out` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `customer_id`, `room_id`, `date_check_in`, `date_check_out`) VALUES
(1, 2, 6, '2023-05-06', '2023-05-07'),
(3, 5, 3, '2023-05-06', '2023-05-07'),
(4, 1, 1, '2023-07-06', '2023-07-07'),
(5, 6, 10, '2023-12-06', '2023-12-07'),
(6, 4, 8, '2023-07-06', '2023-07-07'),
(7, 3, 2, '2023-06-06', '2023-06-08'),
(57, 2, 6, '2023-05-06', '2023-05-07'),
(58, 5, 3, '2023-05-06', '2023-05-07'),
(59, 1, 1, '2023-07-06', '2023-07-07'),
(60, 6, 10, '2023-12-06', '2023-12-07'),
(61, 4, 8, '2023-07-06', '2023-07-07'),
(62, 3, 2, '2023-06-06', '2023-06-08'),
(63, 2, 5, '2023-08-06', '2023-08-07'),
(64, 5, 9, '2023-09-06', '2023-09-07'),
(65, 1, 3, '2023-10-06', '2023-10-07'),
(66, 6, 7, '2023-11-06', '2023-11-07'),
(67, 4, 5, '2023-05-06', '2023-05-07'),
(68, 3, 1, '2023-06-06', '2023-06-08'),
(69, 2, 4, '2023-07-06', '2023-07-07'),
(70, 5, 10, '2023-08-06', '2023-08-07'),
(71, 1, 8, '2023-09-06', '2023-09-07'),
(72, 6, 2, '2023-10-06', '2023-10-07'),
(73, 4, 6, '2023-11-06', '2023-11-07'),
(74, 3, 9, '2023-12-06', '2023-12-07'),
(75, 2, 3, '2023-05-06', '2023-05-07'),
(76, 5, 7, '2023-06-06', '2023-06-08'),
(77, 1, 5, '2023-07-06', '2023-07-07'),
(78, 6, 1, '2023-08-06', '2023-08-07'),
(79, 4, 10, '2023-09-06', '2023-09-07'),
(80, 3, 8, '2023-10-06', '2023-10-07'),
(81, 2, 2, '2023-11-06', '2023-11-07'),
(82, 5, 6, '2023-12-06', '2023-12-07'),
(83, 1, 9, '2023-05-06', '2023-05-07'),
(84, 6, 3, '2023-06-06', '2023-06-08'),
(85, 4, 7, '2023-07-06', '2023-07-07'),
(86, 3, 5, '2023-08-06', '2023-08-07'),
(87, 2, 1, '2023-09-06', '2023-09-07'),
(88, 5, 10, '2023-10-06', '2023-10-07'),
(89, 1, 8, '2023-11-06', '2023-11-07'),
(90, 6, 2, '2023-12-06', '2023-12-07'),
(91, 4, 6, '2023-05-06', '2023-05-07'),
(92, 3, 9, '2023-06-06', '2023-06-08'),
(93, 2, 3, '2023-07-06', '2023-07-07'),
(94, 5, 7, '2023-08-06', '2023-08-07'),
(95, 1, 5, '2023-09-06', '2023-09-07'),
(96, 6, 1, '2023-10-06', '2023-10-07'),
(97, 4, 10, '2023-11-06', '2023-11-07'),
(98, 3, 8, '2023-12-06', '2023-12-07'),
(99, 2, 2, '2023-05-06', '2023-05-07'),
(100, 5, 6, '2023-06-06', '2023-06-08'),
(101, 1, 9, '2023-07-06', '2023-07-07'),
(102, 6, 3, '2023-08-06', '2023-08-07'),
(103, 4, 7, '2023-09-06', '2023-09-07'),
(104, 3, 5, '2023-10-06', '2023-10-07');

--
-- Triggers `reservation`
--
DELIMITER $$
CREATE TRIGGER `before_delete_reservation` BEFORE DELETE ON `reservation` FOR EACH ROW INSERT INTO reservation_log (reservation_id, customer_id, room_id, date_check_in, date_check_out, date_log)
    VALUES (OLD.reservation_id, OLD.customer_id, OLD.room_id, OLD.date_check_in, OLD.date_check_out, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_log`
--

CREATE TABLE `reservation_log` (
  `log_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `date_check_in` date NOT NULL,
  `date_check_out` date NOT NULL,
  `date_log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation_log`
--

INSERT INTO `reservation_log` (`log_id`, `reservation_id`, `customer_id`, `room_id`, `date_check_in`, `date_check_out`, `date_log`) VALUES
(1, 105, 2, 1, '2023-11-06', '2023-11-07', '2023-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `price_per_night` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_number`, `room_type_id`, `floor_id`, `price_per_night`) VALUES
(1, '100', 1, 1, 10000),
(2, '101', 1, 1, 100000),
(3, '102', 1, 1, 100000),
(4, '103', 1, 1, 100000),
(5, '104', 1, 1, 100000),
(6, '105', 1, 1, 100000),
(7, '201', 2, 2, 200000),
(8, '202', 2, 2, 200000),
(9, '203', 3, 2, 400000),
(10, '204', 4, 2, 450000),
(11, '205', 5, 2, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`type_id`, `name`) VALUES
(1, 'Regular'),
(2, 'Luxurious'),
(3, 'VIP'),
(4, 'VVIP'),
(5, 'Private');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_reservation`
-- (See below for the actual view)
--
CREATE TABLE `v_reservation` (
`reservation_id` int(11)
,`name` varchar(255)
,`room_number` varchar(10)
,`date_check_in` date
,`date_check_out` date
);

-- --------------------------------------------------------

--
-- Structure for view `v_reservation`
--
DROP TABLE IF EXISTS `v_reservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reservation`  AS SELECT `reservation`.`reservation_id` AS `reservation_id`, `customer`.`name` AS `name`, `room`.`room_number` AS `room_number`, `reservation`.`date_check_in` AS `date_check_in`, `reservation`.`date_check_out` AS `date_check_out` FROM ((`reservation` join `customer` on(`customer`.`customer_id` = `reservation`.`customer_id`)) join `room` on(`room`.`room_id` = `reservation`.`room_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_log`
--
ALTER TABLE `customer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `reservation_log`
--
ALTER TABLE `reservation_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `floor_id` (`floor_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `customer_log`
--
ALTER TABLE `customer_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `floor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `reservation_log`
--
ALTER TABLE `reservation_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`type_id`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`floor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
