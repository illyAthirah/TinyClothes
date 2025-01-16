-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 03:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiny_clothes`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `quantity`, `user_id`) VALUES
(3, 2, 3, 0),
(4, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `address`, `payment_method`, `created_at`, `order_date`, `user_id`) VALUES
(1, 'athirah', 'athirah@gmail.com', 'sfsfas', 'creditCard', '2025-01-16 01:44:23', '2025-01-16 02:10:29', 0),
(2, 'athirah', 'athirah@gmail.com', 'sfsfas', 'creditCard', '2025-01-16 01:45:30', '2025-01-16 02:10:29', 0),
(3, 'athirah', 'athirah@gmail.com', 'fasdfds', 'creditCard', '2025-01-16 02:25:12', '2025-01-16 02:25:12', 0),
(4, 'athirah', 'athirah@gmail.com', 'dasd', 'creditCard', '2025-01-16 02:30:29', '2025-01-16 02:30:29', 11),
(5, 'athirah', 'athirah@gmail.com', 'cghvh', 'creditCard', '2025-01-16 02:31:18', '2025-01-16 02:31:18', 11),
(6, 'athirah', 'athirah@gmail.com', 'cghvh', 'creditCard', '2025-01-16 02:32:17', '2025-01-16 02:32:17', 11),
(7, 'athirah', 'athirah@gmail.com', 'bjkjn', 'creditCard', '2025-01-16 02:32:38', '2025-01-16 02:32:38', 11),
(8, 'athirah', 'athirah@gmail.com', 'hjnkj', 'creditCard', '2025-01-16 02:36:23', '2025-01-16 02:36:23', 11);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 2, 2, 1, 0.00),
(2, 3, 2, 1, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category`, `price`, `image`, `is_featured`, `created_at`) VALUES
(1, 'Twinnies Set', 'Clothes', 34.20, 'item1.png', 1, '2025-01-03 14:17:57'),
(2, 'Girly Set', 'Clothes', 39.90, 'item2.png', 1, '2025-01-03 15:44:57'),
(3, 'Twinnies Couple Set', 'Clothes', 65.00, 'item3.png', 1, '2025-01-03 15:44:57'),
(4, 'Summer Set Outfit', 'Clothes', 40.00, 'item4.png', 1, '2025-01-03 15:44:57'),
(5, 'Shower Kiddo', 'Best', 49.90, 'item5.jpg', 1, '2025-01-03 16:22:30'),
(6, 'Daisy Dummies', 'Best', 19.90, 'item6.jpg', 1, '2025-01-03 16:22:30'),
(7, 'Milkies Cup', 'Best', 24.90, 'item7.jpg', 1, '2025-01-03 16:22:30'),
(8, 'Beach Toy Set', 'Best', 39.90, 'item8.jpg', 1, '2025-01-03 16:22:30'),
(9, 'Pureen Baby Shampoo', 'Bath', 27.90, 'bath1.jpg', 0, '2025-01-03 16:48:20'),
(10, 'Baby Grooming Kit', 'Bath', 45.99, 'bath2.jpg', 0, '2025-01-03 16:48:20'),
(11, 'Baby Bathtub', 'Bath', 89.90, 'bath3.jpg', 0, '2025-01-03 16:48:20'),
(12, 'Pureen Baby Lotion', 'Bath', 29.90, 'bath4.jpg', 1, '2025-01-03 16:48:20'),
(13, 'Teething Toy', 'Toys', 19.90, 'toys1.jpeg', 1, '2025-01-04 03:52:27'),
(14, 'Block Learning Toy', 'Toys', 29.99, 'toys2.jpg', 0, '2025-01-04 03:52:27'),
(15, 'Cuddly Penguin', 'Toys', 39.90, 'toys3.jpeg', 0, '2025-01-04 03:52:27'),
(16, 'Baby Piano Raffles', 'Toys', 49.90, 'toys4.jpg', 1, '2025-01-04 03:52:27'),
(17, 'Baby Stroller', 'Travel', 499.90, 'travel1.png', 1, '2025-01-04 04:16:33'),
(18, 'Baby Car Seat', 'Travel', 399.90, 'travel2.jpg', 0, '2025-01-04 04:16:33'),
(19, 'Baby Carrier', 'Travel', 150.90, 'travel3.png', 0, '2025-01-04 04:16:33'),
(20, 'Baby Carrier Wrap', 'Travel', 59.90, 'travel4.png', 1, '2025-01-04 04:16:33'),
(21, 'Feeding Cup', 'Fav', 24.50, 'item9.jpg', 1, '2025-01-04 07:59:00'),
(22, 'Feeding Spoon', 'Fav', 12.90, 'item10.jpg', 0, '2025-01-04 07:59:00'),
(23, 'Feeding Fork', 'Fav', 13.90, 'item11.jpg', 1, '2025-01-04 07:59:00'),
(24, 'Training Cup', 'Fav', 19.90, 'item12.jpg', 0, '2025-01-04 07:59:00'),
(25, 'Simulation Medical Box', 'Fav', 45.90, 'item13.jpg', 0, '2025-01-04 07:59:00'),
(26, 'Puzzle Box', 'Fav', 29.90, 'item14.jpg', 1, '2025-01-04 07:59:00'),
(27, 'First Bite Gift Set', 'Fav', 59.90, 'item15.jpg', 0, '2025-01-04 07:59:00'),
(28, 'Sippy Cup', 'Fav', 22.90, 'item16.jpg', 1, '2025-01-04 07:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`variant_id`, `product_id`, `variant_name`, `price`) VALUES
(1, 9, '250ml', 27.90),
(2, 9, '500ml', 45.50),
(3, 9, '750ml', 65.80),
(4, 15, 'Small (12\")', 39.90),
(5, 15, 'Medium (18\")', 49.90),
(6, 15, 'Large (24\")', 59.90),
(7, 16, 'Small', 49.90),
(8, 16, 'Medium', 69.90),
(9, 16, 'Large', 89.90),
(10, 17, 'Compact (RM499.90)', 499.90),
(11, 17, 'Standard (RM599.90)', 599.90),
(12, 17, 'Deluxe (RM799.90)', 799.90),
(13, 18, 'Infant (RM399.90)', 399.90),
(14, 18, 'Toddler (RM499.90)', 499.90),
(15, 18, 'Convertible (RM599.90)', 599.90),
(16, 19, 'Standard', 150.90),
(17, 19, 'Premium', 219.90),
(18, 20, 'Standard', 26.90),
(19, 20, 'Premium', 59.90);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `valid_until` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `loyalty_points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `created_at`, `address`, `phone`, `loyalty_points`) VALUES
(1, '', '', '$2y$10$0Q/eF7quWYmWPKg2iLsCDeJPuMULkQgpDy2LXn.7aX2wwiFlofDaG', '2024-12-26 09:51:03', '', '', 0),
(4, 'testing', 'test123@gmail.com', '$2y$10$exueJfHCwAQI5ggeJZy/GO80C0fB7MWk.VWrk8NMVDpQ2R3tXPXjK', '2024-12-26 10:00:48', 'no 12,jalan abc', '01122334455', 0),
(5, 'test2', 'test2@gmail.com', '$2y$10$NmCyhoNUCrxANtNTupqRLO0qvrkG1yCRIooezD3zzUTseVLUTixa.', '2024-12-26 14:14:22', '', '', 0),
(7, 'test123', 'test@gmail.com', '$2y$10$0aUuufR7RLsXGrw/eUWXQu0gb.96PGD3owGBHw7AaAaqlCCWlTfEW', '2024-12-27 15:42:22', '', '', 0),
(8, 'test', 'test3@gmail.com', '$2y$10$.ap9ep/QVTtDGb4SRHt39uaOfX3u58TmxSlsuWjtKWa78zy.CWxNq', '2024-12-27 15:51:04', '', '', 0),
(9, 'Aqilah', 'aqilahj@gmail.com', '$2y$10$B0GPfA2FbTolOXNiRAVIzemCOgiTJSujckaB3HesjyRZhIKSa3fFq', '2024-12-31 15:56:35', '', '', 0),
(10, 'illy', 'illy@gmail.com', '$2y$10$s1VLoP6BYFb0JXx1LdxRz.a/iik5yxwVT9nr0DdDlczAj5LpIUh2O', '2025-01-14 21:25:31', '', '', 0),
(11, 'athirah', 'athirah@gmail.com', '$2y$10$E1QXA.h/ZF1p5CMjqv2QdOdt2cQHNLBu8bPCWydpUG0hVp8iCYP46', '2025-01-15 11:07:29', 'puteri indah, bidor, malaysia', '01135020792', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `id` (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
