-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2024 at 02:22 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kt_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `caterogy`
--

DROP TABLE IF EXISTS `caterogy`;
CREATE TABLE IF NOT EXISTS `caterogy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `caterogy`
--

INSERT INTO `caterogy` (`id`, `name`) VALUES
(1, 'Giày'),
(2, 'Áo Thể Thao'),
(3, 'Phụ Kiện');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_price` int NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orderuser` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL,
  `id_size` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oder_detail` (`order_id`),
  KEY `fk_oderdetail_product` (`product_id`),
  KEY `fk_cart_detail` (`cart_id`),
  KEY `fk_oder_size` (`id_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  `payment_date` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_user` (`user_id`),
  KEY `fk_payment_oder` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `price`, `id_category`) VALUES
(89, 'Áo Mu 24/25', 'dep ', '08122024164920_mu_2425.avif', 10000, 2),
(90, 'Áo arsenal 24/25', 'dep', '08122024165022_ars_2425.avif', 10000, 2),
(96, 'bả', 'ngon', '10122024165529_admin.JPG', 10000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
CREATE TABLE IF NOT EXISTS `productimage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(255) DEFAULT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`id`, `imageurl`, `id_product`) VALUES
(242, '08122024164920_mu_2425.avif', 89),
(246, '08122024165022_ars_2425.avif', 90),
(248, '08122024165049_mu_2425.avif', 90),
(279, '10122024165529_admin.JPG', 96),
(280, '10122024165529_ars_2425.avif', 96);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
CREATE TABLE IF NOT EXISTS `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_size` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_size_product` (`id_size`),
  KEY `fk_product_size` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `id` int NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idrole` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `birthday`, `address`, `role`) VALUES
(5, 'admin', '$2a$10$x1NHRV4a4yOOQrmB.V8XJuoWGwF8Xlel6P4xpSxbuKj2Xsz4vFDsW', 'em@gmail.com', '2024-11-05', '18 Cao Lỗ Q8 HCM', 1),
(6, 'admin1', '$2a$10$V5GB1H1u.Z8MJMHo627fQ.0vhR7od6noCzmwE2H3Qrdko9w7XCKlW', 'trungbui512003@gmail.com', '2024-11-15', 'Đại Học Công Nghệ Sài Gòn', 1),
(7, 'user', '$2a$10$2Dqw1PtYftWBgl9u8TjIx./v.kRRnHXYcbG8EvoTZ3kNw2JirnSLa', 'user@gmail.com', '2024-11-02', 'Tô 1 Ấp 2 Xã Vĩnh Lộc A HCM', 0),
(20, 'trung cute de thuong', '$2a$10$M7jn35.4LVye2/Y8KN8vveT21c8d6/B//pTWy4mv2VFleAyYQ6NRa', 'trung@gmail.com', '2024-12-18', 'nhà mới ', 0),
(28, 'maihoa', '$2a$10$Bl6QLLlaG5r775sY9V4TZOEx8bg05QWJoSirqKZUdRzkBfA9BAqdS', 'hoa123@gmail.com', '2008-08-07', 'nhà', 0),
(33, 'mai hoa ', '$2a$10$Y1.NAGnb1A6DH6gwnHQw0Onw0P5EWYjNYsBQuVJvyA2UmlGNGXdle', 'hoanehehe@gmail.com', '2008-08-07', 'new mem ber', 0),
(36, 'test user', '$2a$10$FPj2.b37ypP.RB3xdc00wulyWkdVIvIe7aShxgd4mMFWAcBIn5xeK', 'trung@gmail.com', '2024-12-27', '123 nhà ', 0),
(37, 'king of code', '$2a$10$FyUmLTh4hTlJY5l/VvusS.4yA5frTgFCWjE2c6Cv2M/o2URge9biS', 'cute123@gmail.com', '2003-01-05', 'vinh loc tan phu', 0),
(38, 'nini', '$2a$10$GW1lwG9HvDWotZmKKWfp4epeMMlH0/lysFaDeUbfdmzopGIK0pFIK', '123@gmail.com', '2024-12-27', 'fdf', 0),
(40, 'dat', '$2a$10$sjgSItBVNzzvZPsVPe7tdOhnTVVlu8eb1KUj.cD2HlSxVXG98yg9y', 'dat123@gmail.com', '2024-12-11', 'tan phu ', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_orderuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_cart_detail` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_oder_detail` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_oder_size` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_oderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_oder` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `caterogy` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `fk_product_size` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_size_product` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
