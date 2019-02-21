-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 01:00 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniturestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `houseNo` int(11) NOT NULL,
  `street line 1` varchar(60) NOT NULL,
  `street ine 2` varchar(60) NOT NULL,
  `town` varchar(60) NOT NULL,
  `county` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `postcode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`) VALUES
(1, 'Bedroom'),
(2, 'Living Room'),
(3, 'Home Office'),
(4, 'Game Room & Bar'),
(5, 'Kitchen & Dinning'),
(6, 'Home Entertainment');

-- --------------------------------------------------------

--
-- Table structure for table `giftcard`
--

CREATE TABLE `giftcard` (
  `cardNumber` int(16) NOT NULL,
  `balance` double(4,2) NOT NULL,
  `expirary` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `userAddressId` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `colour` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL,
  `stockQuantity` int(3) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `catId`, `name`, `colour`, `price`, `stockQuantity`, `image`, `description`) VALUES
(7, 4, 'Furniture Kingston Game Table', 'Black & Brown', 931.00, 2, NULL, 'The Kingston Game Set and Bar Stool are a distinguished addition to any home. The light cherry finished wood, black leather and felt, and nail-head trim give this grouping a stately presence. It\'s true grandness can be found in the ornate details on the table\'s base and felt. Not only is this set handsome but it is practical as well, with a reversible table top, casters on the chairs, and the stool swivels 360 degrees.'),
(9, 4, 'Lavoie Furniture Mitchell 3 in 1 Game Table in Oak', 'Blue & Brown', 1139.99, 12, NULL, 'With highly functional and fun designs this three-in-one game table will make a great addition to your home. Relaxed style is demonstrated with delicate curves and charming carved detail in the pedestal base. The finished table top allows you to enjoy a casual meal or sip on your morning cup of coffee. Flip the top around and you will find a 42 inch dark green felt lined card table with cup holders and chip trays. If poker isn\'t your game, the piece transforms into bumper pool table and includes pool sticks and balls!Create a game room your guests will admire with the Mitchell collection. Featuring unique game tables comfortable game chairs, bars, and bar stools, this collection will establish a fun and inviting environment. With solid oak construction for durability, this group is available in either a Merlot or Amber finish to accommodate your stylistic needs.Create a game room your guests will admire with the Mitchell collection.The Chair are not included (sold separately). ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `firstname`, `lastname`, `isAdmin`) VALUES
('ahmed@gmail.com', '$2a$12$poAs7GSphNN/KnXFyrndFer1UMDObvilyiCNzMddIvcA4.g4jBtMm', 'ahmed', 'khan', 0),
('audrius@gmail.com', '$2a$12$LQOo75r2y0amxd1mksKMgu/6./DsktqMSEObTq8hVdwYVA5XixFi2', 'audrius', 'senkus', 1),
('test@gmail.com', '$2a$12$R9FqfJtkUMA0QFJICh6tzOekCd.5eVz8fufldmMmvTTLpKey0nE4i', '12', '12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `useraddress`
--

CREATE TABLE `useraddress` (
  `userAddressId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `addressId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD KEY `productId` (`productId`,`orderId`,`email`),
  ADD KEY `email` (`email`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `userAddressId` (`userAddressId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catId` (`catId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD PRIMARY KEY (`userAddressId`),
  ADD KEY `userId` (`email`,`addressId`),
  ADD KEY `addressId` (`addressId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `userAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `orderproduct_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userAddressId`) REFERENCES `useraddress` (`userAddressId`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`);

--
-- Constraints for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD CONSTRAINT `useraddress_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`),
  ADD CONSTRAINT `useraddress_ibfk_3` FOREIGN KEY (`email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
