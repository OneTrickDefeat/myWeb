-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2019 at 12:34 PM
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
  `catName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`) VALUES
(1, 'Chairs'),
(4, 'Tables'),
(5, 'Beds');

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `userAddressId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
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
(1, 1, 'Percy Chair - Satchel Latte', 'Brown', 659.00, 15, NULL, 'Beautiful vintage leathers and warm fabrics are blended to give the distinctive textures and tones of this manufacturer\'s furniture. Projecting an image of desirability and class without compromising the key values of quality and comfort, this manufacturer\'s products really are as good as they look.'),
(2, 1, 'Walter Chair', 'White', 449.00, 12, NULL, 'Scandinavian design heritage with an international twist is the distinctive appeal of this manufacturer, whose stylish products are made to match the trends of today\'s market. Marrying the eclectic sensibility of Nordic craft with a more restrained European style, these diverse designs will inflect the home with modernist masterpieces.'),
(3, 1, 'Percy Chair - Satchel Nutmeg', 'Brown', 659.00, 9, NULL, 'Beautiful vintage leathers and warm fabrics are blended to give the distinctive textures and tones of this manufacturer\'s furniture. Projecting an image of desirability and class without compromising the key values of quality and comfort, this manufacturer\'s products really are as good as they look.'),
(4, 1, 'Amuro Chair', 'Yellow', 599.00, 3, NULL, 'Lounge in style with the Amuro cahir. The dimple detail and the relaxed style of the chair give it an ultra modern feel. Finished with metal legs the Amuro chair is a perfect additon to any contmeporary home.'),
(5, 1, 'Giorgia Arm Chair', 'Light Blue', 729.00, 8, NULL, 'One of the leading upholstery manufacturers. The very finest raw materials are sourced from around the world, to ensure consistency of supply. Leather is imported from the finest tanneries in Italy and Brazil. Timber is procured from Argentina, Australia and New Zealand. State of the art machinery is used during production and Durkopff Adler sewing machines ensure a consistently high standard of finish.'),
(6, 4, 'Some Table', 'White', 200.00, 12, NULL, 'Very good table');

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
('test@gmail.com', '$2a$12$R9FqfJtkUMA0QFJICh6tzOekCd.5eVz8fufldmMmvTTLpKey0nE4i', 'Test', 'Project', 0);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `userAddressId` (`userAddressId`,`productId`),
  ADD KEY `productId` (`productId`);

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
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `userAddressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userAddressId`) REFERENCES `useraddress` (`userAddressId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

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
