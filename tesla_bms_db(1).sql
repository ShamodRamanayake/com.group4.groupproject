-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 03:08 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesla_bms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_detail`
--

CREATE TABLE `category_detail` (
  `n_id` int NOT NULL,
  `v_description` varchar(255) NOT NULL,
  `v_status` enum('A','D') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_detail`
--

CREATE TABLE `customer_detail` (
  `n_id` int NOT NULL,
  `v_customer_name` varchar(255) NOT NULL,
  `n_contact` char(10) DEFAULT NULL,
  `v_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_detail`
--

INSERT INTO `customer_detail` (`n_id`, `v_customer_name`, `n_contact`, `v_status`) VALUES
(1, 'Saneth Ranaweera', '0773334678', 'A'),
(2, 'Kamesh Perara', '0712323678', 'I'),
(3, 'Bhagya Weerakoon', '0723473848', 'D'),
(4, 'Suranga Ramanayaka', '0774848384', 'A'),
(5, 'Kamal Gamage', '0772324556', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `n_id` int NOT NULL,
  `d_datetime` datetime NOT NULL,
  `n_customer_id` int NOT NULL,
  `n_discount` decimal(20,2) DEFAULT NULL,
  `n_total` decimal(20,2) DEFAULT NULL,
  `n_paid_amount` decimal(20,2) DEFAULT NULL,
  `n_credit_amount` decimal(20,2) DEFAULT NULL,
  `n_create_user_id` int NOT NULL,
  `v_status` enum('A','D') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_detail`
--

CREATE TABLE `customer_order_detail` (
  `n_id` int NOT NULL,
  `n_customer_order_id` int NOT NULL,
  `n_item_id` int NOT NULL,
  `n_quantity` int DEFAULT NULL,
  `n_unit_price` decimal(20,2) DEFAULT NULL,
  `n_discount_percentage` decimal(20,2) DEFAULT NULL,
  `n_discount_amount` decimal(20,2) DEFAULT NULL,
  `n_warrenty_period` int DEFAULT NULL,
  `v_is_warrenty_available` enum('Y','N') NOT NULL DEFAULT 'N',
  `v_is_warrenty_claimed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `n_id` int NOT NULL,
  `n_quantity` int NOT NULL,
  `n_category_id` int DEFAULT NULL,
  `n_quantity_threshold` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_detail`
--

CREATE TABLE `inventory_detail` (
  `n_id` int NOT NULL,
  `n_inventory_id` int NOT NULL,
  `v_description` varchar(255) DEFAULT NULL,
  `n_purchase_order_id` int DEFAULT NULL,
  `n_quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `n_id` int NOT NULL,
  `d_datetime` datetime NOT NULL,
  `n_supplier_id` int NOT NULL,
  `n_discount` decimal(20,2) DEFAULT NULL,
  `n_total` decimal(20,2) DEFAULT NULL,
  `n_paid_amount` decimal(20,2) DEFAULT NULL,
  `n_credit_amount` decimal(20,2) DEFAULT NULL,
  `n_create_user_id` int NOT NULL,
  `v_status` enum('A','D') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

CREATE TABLE `purchase_order_detail` (
  `n_id` int NOT NULL,
  `n_purchase_order_id` int NOT NULL,
  `n_item_id` int NOT NULL,
  `n_quantity` int DEFAULT NULL,
  `n_unit_price` decimal(20,2) DEFAULT NULL,
  `n_mrp` decimal(20,2) DEFAULT NULL,
  `n_discount_percentage` decimal(20,2) DEFAULT NULL,
  `n_discount_amount` decimal(20,2) DEFAULT NULL,
  `n_warrenty_period` int DEFAULT NULL,
  `v_is_warrenty_available` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_detail`
--

CREATE TABLE `supplier_detail` (
  `n_id` int NOT NULL,
  `v_supplier_name` varchar(255) NOT NULL,
  `n_contact` char(10) DEFAULT NULL,
  `v_email` varchar(100) DEFAULT NULL,
  `v_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `n_id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_password` varchar(255) NOT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tokenCreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`n_id`, `email`, `v_name`, `v_password`, `reset_token`, `tokenCreationDate`) VALUES
(1000, 'lunaticcr@gmail.com', 'chethana', '12345678', 'dust', '2021-03-09 14:22:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_detail`
--
ALTER TABLE `category_detail`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `customer_detail`
--
ALTER TABLE `customer_detail`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_customer_id` (`n_customer_id`),
  ADD KEY `n_create_user_id` (`n_create_user_id`);

--
-- Indexes for table `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_customer_order_id` (`n_customer_order_id`),
  ADD KEY `n_item_id` (`n_item_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_category_id` (`n_category_id`);

--
-- Indexes for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_purchase_order_id` (`n_purchase_order_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_supplier_id` (`n_supplier_id`),
  ADD KEY `n_create_user_id` (`n_create_user_id`);

--
-- Indexes for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `n_purchase_order_id` (`n_purchase_order_id`),
  ADD KEY `n_item_id` (`n_item_id`);

--
-- Indexes for table `supplier_detail`
--
ALTER TABLE `supplier_detail`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`n_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_detail`
--
ALTER TABLE `category_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_detail`
--
ALTER TABLE `customer_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_detail`
--
ALTER TABLE `supplier_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `n_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`n_customer_id`) REFERENCES `customer_detail` (`n_id`),
  ADD CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`n_create_user_id`) REFERENCES `user_detail` (`n_id`);

--
-- Constraints for table `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  ADD CONSTRAINT `customer_order_detail_ibfk_1` FOREIGN KEY (`n_customer_order_id`) REFERENCES `customer_order` (`n_id`),
  ADD CONSTRAINT `customer_order_detail_ibfk_2` FOREIGN KEY (`n_item_id`) REFERENCES `inventory_detail` (`n_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`n_category_id`) REFERENCES `category_detail` (`n_id`);

--
-- Constraints for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD CONSTRAINT `inventory_detail_ibfk_1` FOREIGN KEY (`n_purchase_order_id`) REFERENCES `purchase_order` (`n_id`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`n_supplier_id`) REFERENCES `supplier_detail` (`n_id`),
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`n_create_user_id`) REFERENCES `user_detail` (`n_id`);

--
-- Constraints for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  ADD CONSTRAINT `purchase_order_detail_ibfk_1` FOREIGN KEY (`n_purchase_order_id`) REFERENCES `purchase_order` (`n_id`),
  ADD CONSTRAINT `purchase_order_detail_ibfk_2` FOREIGN KEY (`n_item_id`) REFERENCES `inventory` (`n_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
