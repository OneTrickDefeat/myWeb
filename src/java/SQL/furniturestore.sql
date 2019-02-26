-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2019 at 06:30 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

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
(7, 4, 'Furniture Kingston Game Table', 'Black & Brown', 931.00, 2, 'kingstontable.jpg', 'The Kingston Game Set and Bar Stool are a distinguished addition to any home. The light cherry finished wood, black leather and felt, and nail-head trim give this grouping a stately presence. Its true grandness can be found in the ornate details on the tables base and felt. Not only is this set handsome but it is practical as well, with a reversible table top, casters on the chairs, and the stool swivels 360 degrees.'),
(9, 4, 'Lavoie Furniture Mitchell 3 in 1 Game Table in Oak', 'Blue & Brown', 1139.99, 12, 'lavoietable.jpg', 'With highly functional and fun designs this three-in-one game table will make a great addition to your home. Relaxed style is demonstrated with delicate curves and charming carved detail in the pedestal base. The finished table top allows you to enjoy a casual meal or sip on your morning cup of coffee. Flip the top around and you will find a 42 inch dark green felt lined card table with cup holders and chip trays. The Chairs are not included (sold separately). '),
(11, 4, 'Nassau Game Table\r\n', 'Brown & Black', 599.99, 15, 'nassautable.jpg', 'The Nassau game set is distinguished and regal. The classic lines and nail head trim on the chairs along with the lift mechanism that allows them to adjust to different heights and swivels, make them elegant and practical. The table only adds to the magnificence of this set and can transition from a game table with a black felt to a solid top for dining. Chairs can be sold separately. \r\n'),
(12, 4, 'Palm Springs Game Table', 'Brown & Black', 789.99, 17, 'palmspringstable.jpg', 'Add panche to your game room with Hillsdale Furniture’s Palm Springs Game table and chairs. Finished in a medium brown cherry with brown bonded leather seat cushions, this set combines comfort with casual living and functionality. With a transitional half sphere base and a clean rectangle chair back chair with arms, this multi-function table offers a dining surface on one side, a bonded leather topped game surface on the other. Composed of solid woods, climate controlled wood composites, and veneers, this ensemble can find a home in your game room, den, or kitchen. Complete your game room décor with the matching bistro table and barstools. '),
(13, 1, 'Amber King Bed \r\n', 'White & Brown', 299.99, 5, 'amberbed.jpg', 'The Amber bed is both fashionable and comfortable.  An impressive square headboard is complimented by nail-head trim, both on the outer edge and the center.  The fabric covered side rails and footboard continue the soft, luxurious theme.  Available in your choice of three colors, the Amber bed is a fantastic addition to any home.  Fabric Color Choices: Buckwheat, Chocolate, and Pewter \r\n'),
(14, 1, 'Casselton Queen Bed\r\n', 'White & Blue', 249.99, 7, 'casseltonbed.jpg', 'Add elegant, traditional style with flourish to your bedroom with the Casselton Metal Queen Bed by Hillsdale Furniture. This bed features a classic spindle silhouette enhanced by dramatic interlocking arched scroll designs in the headboard and footboard. A black pewter finish completes the look.\r\n'),
(15, 1, 'Churchill Cal King Bed - Onyx Fabric\r\n', 'Black & Grey', 599.99, 11, 'churchillbed.jpg', 'Modern design. Timeless style. The Churchill Bed boasts the best of both worlds. This king-size bed features a simple streamlined silhouette with an elegant tufted upholstered headboard and button accents. Its Onyx Linen matches most color palettes; and its sturdy wood frame construction holds up to everyday use. This set contains everything you need to bring elevated style into your bedroom. Includes headboard and footboard and side rails.\r\n\r\n'),
(16, 1, 'Cole Full Bed\r\n', 'Black & White', 399.99, 18, 'colebed.jpg', 'A traditional silhouette is enhanced by unique and whimsical accents in Hillsdale Furniture’s Cole bed.  Classic ball finials are accentuated by sweeping scrollwork and intricate castings.  The black twinkle finish offers a great base, intensifying your décor and color scheme.  All of these wonderful details culminate with the sturdy steel construction.  Some assembly required. \r\n'),
(17, 2, 'Tynon Sofa\r\n', 'Gray', 999.99, 4, 'tynonsofa.jpg', 'The Tynon sofabed is compact enough for any living space but opens into a generous sofabed with minimum effort and when open, the bed sports a sprung mattress for extra snoozing comfort.\r\n'),
(18, 2, 'Stan Sofa\r\n', 'Cream', 1085.00, 3, 'stansofa.jpg', 'The Stan Collection is a beautiful, contemporary design. The deep luxurious high density foam seats offer sumptuous comfort with the support of high quality blown fibre and super soft foam filled arms. This stunning range is available in a wide selection of textures and colour ways.\r\n'),
(19, 2, 'Sebastian Large Sofa\r\n', 'Cream', 1429.00, 7, 'sebastiansofa.jpg', 'The Sebastian Large Sofa is a stunning addition to add to your living space! In a beautiful plush fabric with a soft,comfortable seat, the clean lines of the Sebastian and compact shape allow the sofa to fit beautifully in both smaller and large, open living areas. \r\n\r\n'),
(20, 2, 'Nevada Leather Sofa', 'Brown', 479.00, 6, 'nevadasofa.jpg', 'The Nevada sofas are part of our Luxe collection.\r\nIt comes in either leather of fabric with loads of different colors to choose from!\r\nPriced in fabric cat 20 and leather cat 10. Price varies depending on the grade of fabric chosen. '),
(21, 3, 'Solano Desk Set\r\n', 'Brown', 349.99, 6, 'solanodesk.jpg', 'Need a space to pay bills, do homework, or work on your laptop, but you don\'t have the room? Hillsdale Furniture\'s Solano desk is the perfect solution for your living room, kitchen, bedroom or den. Utilizing a small corner of your home, this desk fits unobtrusively into your space to create an ideal small workspace. Available in a rich oak or deep cherry finish, the Solano desk doubles as a lamp table or display table. Composed of solids and wood composites. Some assembly required. \r\n'),
(22, 3, 'MICKE  Desk', 'White', 199.99, 16, 'mickedesk.jpg', 'It’s easy to keep sockets and cables out of sight but close at hand with the cable outlet at the back.'),
(23, 3, 'MALM  Desk with pull-out panel\r\n', 'Light Brown', 110.00, 21, 'malmdesk.jpg', 'The pull-out panel gives you an extra work surface.\r\nYou can collect cables and extension leads on the shelf under the table top, so they’re hidden but still close at hand.\r\nYou can mount the pull-out panel to the left or right according to your needs.\r\nCan be placed in the middle of a room because the back is finished.'),
(24, 3, 'HEMNES  Storage combination w doors/drawers\r\n', 'Brown', 899.99, 14, 'hemnesstorage.jpg', 'Solid wood has a natural feel.\r\nThe concealed drawer runners ensure that drawers run smoothly even when heavily loaded.\r\nThe door\'s integrated dampers enable it to close slowly, silently and softly.\r\nThe shelves are adjustable so you can customise your storage as needed.\r\nThe small drawer is perfect for small items such as pens and cutlery.\r\nYou can hide multiple sockets under the removable bottom shelf, for instance.'),
(30, 5, 'Danny Dining Set\r\n', 'Brown & Black', 999.99, 9, 'dannydining.jpg', 'The Danny Dining set is the perfect addition to any modern kitchen or dining room. The angular metal legs and hard wood top contributes to the contemporary look of the faux leather and suede mix of the dining chairs.\r\n\r\nThe extendable element of the Danny table is a great feature which allows you to remove the white panel seen in the photographs to reduce the full size of 200.5 CM X 90 CM to 160.5CM  X 90 CM.'),
(31, 5, 'Monet Dining Table\r\n', 'Black', 1079.99, 23, 'monetdining.jpg', 'Turn your dinning into a truly elegant experience for all your guests, family and friends to enjoy with this real show stopper guaranteed to be a focal point in any dinning room. This table simply oozes character with its clean elegant lines, uniquely kidney shaped end design, natural warm rustic tones and beautifully crafted solid legs complete this table making for a real stunning centre piece in your dinning room..\r\n\r\n'),
(32, 5, 'Twist Dining Table\r\n', 'Black', 879.99, 22, 'twistdining.jpg', 'This twist dining set features a modern take on a classic design that will never date and works in almost any space. Sturdy and durable, it is suitable for home and business use. Beautiful MDF top comes with a column of interwoven chrome steel wires set into a black lacquered base and four chairs.\r\n'),
(33, 5, 'Robbie Dining Table Set\r\n', 'Multicolor', 799.99, 17, 'robbiedining.jpg', 'Modern dining table with gorgeous faux leather chairs.\r\n\r\nTable: 160 CM\r\n\r\nTable + 4 chairs available only with grey chairs\r\n\r\nTable + 6 chairs available only as set with four grey chairs and two mustard chairs.'),
(34, 6, 'Lagunitas Entertainment Console\r\n', 'Black', 600.00, 12, 'lagunitasHF.jpg', 'Enjoy clutter-free entertainment with our attractive, organized TV consoles.\r\n\r\nFinish Construction: This Piece of Furniture utilizes a multiple-step finish process of up to 16 finish steps. This results in an unsurpassed clarity, depth and color richness and durability to our finishes. Through hand-craftsmanship such as rubbing and padding, our finishes feel as good as they look, with a smoothness that is delightful to the touch.\r\n\r\n'),
(35, 6, 'Melange Classic Credenza\r\n', 'Gray & Black', 789.00, 10, 'melangeHF.jpg', 'Come closer to Melange, and you will discover something unexpected, an eclectic blending of colors, textures and materials in a vibrant collection of one-of-a-kind artistic pieces.\r\n\r\nFeatures: Four doors with decorative glass\r\nOne adjustable shelf behind each door\r\nVentilated back panel\r\nLevelers'),
(36, 6, 'Sanctuary Two Piece Entertainment', 'White', 1078.00, 7, 'sanctuaryHF.jpg', 'Pursue serenity at home. Create your own personal sanctuary, a special place where you can experience comfort within.\r\n\r\nEntertainment Console: One center channel speaker area, two drawers, two wood doors with adjustable shelf behind each, one wood-framed glass door with one adjustable shelf'),
(37, 6, 'Sorella Four Piece Wall Group', 'Light Brown', 1200.00, 3, 'sorellaHF.jpg', 'There are many comfortable ways to spend quality time with family and friends. We invite you to make our Sorella collection part of your home. When you add their ingredients of style, grace and comfort you are in for a true experience.\r\n\r\nFinish: A taupe-colored antique finish with a light washed white undertone. Water spots and other finish techniques are used to create a natural, reclaimed wood look.');

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
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
