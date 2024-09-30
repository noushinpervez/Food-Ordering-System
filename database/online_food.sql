-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 02:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `email`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `sub_heading` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `link_txt` varchar(100) NOT NULL,
  `added_on` date NOT NULL,
  `status` int(10) NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `image`, `heading`, `sub_heading`, `link`, `link_txt`, `added_on`, `status`, `order_number`) VALUES
(2, '941177853_brgr2.jpg', 'Welcome to FancyTown Restaurant', 'Grab your food', 'shop.php', 'Order Now', '2023-04-11', 1, 1),
(3, '942574241_brger5.jpg', 'Get 10% Discount', 'Hurry up', 'shop.php', 'Order Now', '2023-04-11', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order_number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `order_number`, `status`, `added_on`) VALUES
(14, 'Platter ', 5, 1, '2023-03-24 10:17:44'),
(15, 'Appetizer ', 1, 1, '2023-03-24 16:01:25'),
(16, 'Pasta', 4, 1, '2023-03-24 10:09:46'),
(17, 'Sandwiches ', 3, 1, '2023-03-24 10:09:01'),
(18, 'Burgers', 2, 1, '2023-03-24 10:07:58'),
(19, 'Desserts ', 6, 1, '2023-03-24 10:07:27'),
(20, 'Drinks', 7, 1, '2023-03-21 08:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_type` enum('P','F') NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `expired_on` date NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupon_code`
--

INSERT INTO `coupon_code` (`id`, `coupon_code`, `coupon_type`, `coupon_value`, `cart_min_value`, `expired_on`, `status`, `added_on`) VALUES
(2, 'First10', 'F', 30, 200, '2023-03-22', 1, '2023-03-21 08:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `name`, `mobile`, `password`, `status`, `added_on`) VALUES
(1, 'X', '01234567890', '123456', 1, '2023-03-21 08:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `dish` varchar(100) NOT NULL,
  `dish_detail` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` enum('veg','non-veg') NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`id`, `category_id`, `dish`, `dish_detail`, `image`, `type`, `status`, `added_on`) VALUES
(16, 18, 'Crispy Chicken Burger', '', '876978350_Crispy-Chicken-Burger-t.jpg', 'non-veg', 1, '2023-04-11 05:56:35'),
(17, 16, 'Chicken Carbonara', '', '278931773_chicken_carbonara.jpg', 'veg', 1, '2023-04-11 07:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `dish_details`
--

CREATE TABLE `dish_details` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dish_details`
--

INSERT INTO `dish_details` (`id`, `dish_id`, `attribute`, `price`, `status`, `added_on`) VALUES
(1, 14, 'Medium', 200, 1, '2023-04-11 05:42:36'),
(2, 14, 'Large', 300, 1, '2023-04-11 05:42:36'),
(3, 14, 'Small', 150, 1, '2023-04-11 05:42:36'),
(4, 15, 'Large', 300, 1, '2023-04-11 05:44:12'),
(5, 15, 'Medium', 200, 1, '2023-04-11 05:44:12'),
(6, 16, 'Medium', 200, 1, '2023-04-11 05:56:35'),
(7, 16, 'Large', 400, 1, '2023-04-11 05:56:35'),
(8, 16, 'Small', 150, 1, '2023-04-11 05:56:35'),
(9, 17, 'Full', 300, 1, '2023-04-11 07:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_details_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `gst` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `total_price` float NOT NULL,
  `gst` float NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `email_verify` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobile`, `password`, `status`, `email_verify`, `added_on`) VALUES
(1, 'noushin', 'xicaxam386@momoshe.com', '12345', '12345', 0, 0, '2023-04-12 00:51:44'),
(2, 'n', 'noushin913@gmail.com', '123', '1234', 0, 0, '2023-04-12 01:10:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dish_details`
--
ALTER TABLE `dish_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
