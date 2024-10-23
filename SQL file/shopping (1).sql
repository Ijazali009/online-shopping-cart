-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 07:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '5ee1efe4dfd66296223c7730317f1761', '2024-04-02 16:21:18', '11-10-2024 12:21:33 AM'),
(2, 'employe', '5ee1efe4dfd66296223c7730317f1761', '2024-04-02 11:21:18', '11-10-2024 12:21:33 AM');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productQty` int(11) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Greeting Cards', 'A variety of greeting cards for all occasions, from birthdays to anniversaries and festivals.', '2024-04-18 19:17:37', '11-10-2024 03:09:37 AM'),
(4, 'Gift Articles', ' Creative and unique gift items perfect for all kinds of celebrations and special moments.', '2024-04-18 19:17:37', '11-10-2024 03:10:20 AM'),
(5, 'Dolls', 'A collection of dolls ranging from traditional designs to modern styles, catering to different tastes and preferences.', '2024-04-18 19:17:37', '11-10-2024 03:10:57 AM'),
(6, 'Hand Bags', ' Stylish and functional handbags suitable for daily use, special events, and gifting purposes.', '2024-04-18 19:17:37', '11-10-2024 03:11:38 AM'),
(8, 'Stationery', 'A range of quality stationery items like notebooks, pens, and art supplies for both personal and professional use.', '2024-10-10 21:42:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(12, 6, '2', 1, '2024-10-15 21:45:45', 'COD', 'Cancelled'),
(13, 6, '2', 5, '2024-10-15 21:50:16', 'Internet Banking', 'Cancelled'),
(14, 6, '3', 1, '2024-10-15 21:51:25', 'Internet Banking', 'Cancelled'),
(15, 6, '2', 1, '2024-10-15 21:58:29', 'Debit / Credit card', NULL),
(16, 6, '1', 1, '2024-10-15 22:00:12', 'Internet Banking', NULL),
(17, 6, '2', 1, '2024-10-20 18:51:29', 'Debit / Credit card', 'Cancelled'),
(18, 6, '2', 1, '2024-10-20 18:59:21', 'CreditCard', NULL),
(19, 6, '3', 1, '2024-10-20 19:10:58', 'VPP', 'in Process'),
(20, 6, '8', 1, '2024-10-20 19:12:16', 'VPP', NULL),
(21, 6, '8', 1, '2024-10-20 19:19:10', 'VPP', NULL),
(22, 6, '3', 1, '2024-10-20 19:28:01', 'Cheque', NULL),
(23, 6, '2', 1, '2024-10-20 19:38:44', 'CreditCard', NULL),
(24, 6, '3', 1, '2024-10-20 19:41:36', 'VPP', 'Cancelled'),
(25, 6, '2', 1, '2024-10-20 19:47:17', 'VPP', NULL),
(26, 7, '1', 1, '2024-10-20 19:57:51', 'VPP', 'Return Requested'),
(27, 1, '3', 1, '2024-10-20 20:08:06', 'VPP', 'Cancelled'),
(28, 1, '3', 1, '2024-10-20 20:10:15', 'Cheque', NULL),
(29, 7, '2', 1, '2024-10-20 20:12:29', 'VPP', NULL),
(30, 7, '3', 1, '2024-10-20 20:14:20', 'CreditCard', 'Return Requested'),
(31, 1, '4', 1, '2024-10-20 20:25:21', 'Cheque', NULL),
(32, 1, '2', 1, '2024-10-20 20:26:04', 'VPP', NULL),
(33, 7, '2', 1, '2024-10-20 20:28:22', 'CreditCard', NULL),
(34, 7, '2', 1, '2024-10-20 20:34:45', 'VPP', NULL),
(35, 1, '1', 1, '2024-10-20 20:38:11', 'VPP', NULL),
(36, 7, '4', 1, '2024-10-20 20:41:51', 'VPP', 'Delivered'),
(37, 6, '2', 1, '2024-10-21 04:31:27', 'VPP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(15, 19, 'in Process', 'fgrscsc', '2024-10-20 19:44:59'),
(16, 26, 'in Process', 'in process', '2024-10-20 19:58:47'),
(17, 26, 'Delivered', 'delivered yor oder', '2024-10-20 19:59:29'),
(18, 12, 'in Process', 'hiii', '2024-10-20 20:01:25'),
(19, 26, 'Return Requested', 'Return request submitted by user', '2024-10-20 17:04:34'),
(20, 30, 'in Process', 'rasty mn ha', '2024-10-20 20:17:47'),
(21, 30, 'Delivered', 'hoo gaya', '2024-10-20 20:18:04'),
(22, 30, 'Return Requested', 'Return request submitted by user', '2024-10-20 17:18:13'),
(23, 30, 'Delivered', 'hoo gaya', '2024-10-20 20:18:40'),
(24, 30, 'Return Requested', 'Return request submitted by user', '2024-10-20 17:20:31'),
(25, 36, 'in Process', 'gg', '2024-10-20 20:45:17'),
(26, 36, 'Delivered', 'sdsd', '2024-10-20 20:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 22, 1, 3, 3, 'fazal', 'wqew', 'good', '2024-10-10 21:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 3, 18, ' thank you card', 'AJ GLI', 600, 700, '&nbsp;thank you card 2024<br>', 'Free vector elegant thank you card.jpg', 'Free vector elegant thank you card.jpg', 'Free vector elegant thank you card.jpg', 100, 'In Stock', '2024-10-11 23:16:52', NULL),
(2, 4, 22, ' ME & YOU Birthday Gifts ', 'MUP', 850, 900, '&nbsp;ME &amp; YOU Birthday Gifts for Wife Girlfriend Sister Daughter&nbsp; Birthday Spacial Gift Pack.<br>', 'ME & YOU Birthday Gifts for Wife Girlfriend Sister Daughter  Birthday Spacial Gift Pack.jpg', 'ME & YOU Birthday Gifts for Wife Girlfriend Sister Daughter  Birthday Spacial Gift Pack.jpg', 'ME & YOU Birthday Gifts for Wife Girlfriend Sister Daughter  Birthday Spacial Gift Pack.jpg', 150, 'In Stock', '2024-10-12 21:07:38', NULL),
(3, 5, 26, 'Dool.Custom Blythe doll', 'PU', 900, 1000, 'Dool.Custom Blythe doll 2024<br>', 'Best Birthday Gift Ideas for Girls 2020.jpg', 'Best Birthday Gift Ideas for Girls 2020.jpg', 'Best Birthday Gift Ideas for Girls 2020.jpg', 100, 'In Stock', '2024-10-12 21:09:54', NULL),
(4, 8, 31, 'Diary Notebook ', 'new', 600, 800, 'Diary Notebook&nbsp; 2024<br>', 'diary.jpg', 'diary.jpg', 'diary.jpg', 120, 'In Stock', '2024-10-12 21:11:20', NULL),
(5, 5, 26, 'Dool girl', 'AJ GLI', 670, 700, 'Dool girl 2024<br>', 'dool.jpg', 'dool.jpg', 'dool.jpg', 120, 'In Stock', '2024-10-12 21:13:40', NULL),
(6, 4, 19, 'Best Gift for home', 'PU', 870, 990, 'Best Gift for home dcor<br>', 'gift a.webp', 'gift a.webp', 'gift a.webp', 120, 'In Stock', '2024-10-12 21:15:46', NULL),
(7, 3, 17, ' love card', 'new', 900, 1200, '&nbsp;love card for girls<br>', 'cards1.jpg', 'cards1.jpg', 'cards1.jpg', 150, 'In Stock', '2024-10-12 21:18:37', NULL),
(8, 4, 19, 'Best gold Gift ', 'MUP', 2600, 3000, 'Best gold Gift for boys<br>', 'gift a1.jpg', 'gift a1.jpg', 'gift a1.jpg', 150, 'In Stock', '2024-10-12 21:22:19', NULL),
(9, 4, 22, 'National day special gift', 'SSB', 3500, 4400, '&nbsp;Buy National day special romantic gift<br>', 'Buy National day special romantic gift.jpg', 'Buy National day special romantic gift.jpg', 'Buy National day special romantic gift.jpg', 120, 'In Stock', '2024-10-12 21:26:00', NULL),
(10, 3, 15, 'Birthday Greeting Card ', 'PU', 850, 900, 'Birthday Greeting Card With Name and Photo<br>', 'Create Birthday Greeting Card With Name and Photo.jpg', 'Create Birthday Greeting Card With Name and Photo.jpg', 'Create Birthday Greeting Card With Name and Photo.jpg', 100, 'In Stock', '2024-10-12 21:27:45', NULL),
(11, 3, 15, ' Wish You Happy Birthday ', 'PU', 600, 700, '&nbsp;Wish You Happy Birthday Cards With Name<br>', 'Wish You Happy Birthday Cards With Name.jpg', 'Wish You Happy Birthday Cards With Name.jpg', 'Wish You Happy Birthday Cards With Name.jpg', 120, 'In Stock', '2024-10-12 21:29:12', NULL),
(12, 4, 21, ' jewellery-gift for-wedding', 'MUP', 2800, 3000, '&nbsp;jewellery-gift-for-wedding-anniversary.<br>', 'jewellery-gift-ideas-for-wedding-anniversary.jpg', 'jewellery-gift-ideas-for-wedding-anniversary.jpg', 'jewellery-gift-ideas-for-wedding-anniversary.jpg', 300, 'In Stock', '2024-10-12 21:31:15', NULL),
(13, 4, 20, 'gifts for girls', 'PU', 850, 1000, '&nbsp;good birthday gifts for girls.<br>', 'good birthday gifts for girls..jpg', 'good birthday gifts for girls..jpg', 'good birthday gifts for girls..jpg', 150, 'In Stock', '2024-10-12 21:33:17', NULL),
(14, 3, 16, ' Romantic Name Customised  Card ', 'AJ GLI', 1500, 1700, 'I Love You Romantic Name Customised Greetings Card for Birthday Anniversary&nbsp;<br>', 'TheGiftShop I Love You Romantic Name Customised Greetings Card for Birthday Anniversary 16.jpg', 'TheGiftShop I Love You Romantic Name Customised Greetings Card for Birthday Anniversary 16.jpg', 'TheGiftShop I Love You Romantic Name Customised Greetings Card for Birthday Anniversary 16 - Copy.jpg', 200, 'In Stock', '2024-10-12 21:36:07', NULL),
(15, 3, 17, ' Desi Vastra Customised Image and Message,', 'NSST', 850, 900, '<div>&nbsp;Desi Vastra Customised Image and Message,<br></div>', 'Desi Vastra Customised Image and Message, Name Printed Happy Birthday Greeting Card with Envelope Gift for Girlfriend, Wife, Friend.jpg', 'Desi Vastra Customised Image and Message, Name Printed Happy Birthday Greeting Card with Envelope Gift for Girlfriend, Wife, Friend.jpg', 'Desi Vastra Customised Image and Message, Name Printed Happy Birthday Greeting Card with Envelope Gift for Girlfriend, Wife, Friend.jpg', 150, 'Out of Stock', '2024-10-12 21:38:24', NULL),
(16, 5, 25, ' Boutique Stylist Barbie ', 'PU', 850, 900, '&nbsp;Boutique Stylist Barbie (purple)<br>', 'Boutique Stylist Barbie (purple).jpg', 'Boutique Stylist Barbie (purple).jpg', 'Boutique Stylist Barbie (purple).jpg', 120, 'In Stock', '2024-10-12 21:40:54', NULL),
(17, 5, 23, 'DOOL Birthday Gift  for Girls ', 'PU', 600, 700, '&nbsp;Best Birthday Gift&nbsp; for Girls 2024.<br>', 'Baby Gift Dolls.jpg', 'Baby Gift Dolls.jpg', 'Baby Gift Dolls.jpg', 100, 'Out of Stock', '2024-10-12 21:42:54', NULL),
(18, 5, 24, ' dolls gift set New W Box', 'PU', 250, 300, '&nbsp;dolls gift set New W Box 2024<br>', 'Disney Princess 11” dolls gift set New W Box. 2017.jpg', 'Disney Princess 11” dolls gift set New W Box. 2017.jpg', 'Disney Princess 11” dolls gift set New W Box. 2017.jpg', 80, 'In Stock', '2024-10-12 21:47:30', NULL),
(19, 5, 23, ' New Barbie Doll ', 'MUP', 850, 900, '&nbsp;New Barbie Doll 2024<br>', 'New Barbie Doll Set with beautiful Neck less Set best gift for girls.jpeg', 'New Barbie Doll Set with beautiful Neck less Set best gift for girls.jpeg', 'New Barbie Doll Set with beautiful Neck less Set best gift for girls.jpeg', 150, 'In Stock', '2024-10-12 21:49:06', NULL),
(20, 6, 28, ' Branded Bags for Ladies', ' Br', 5800, 6000, '<br>', 'Ladies Bags, Totes & Crossbody Bags - ideas PRET - GulAhmed Shop.jpeg', 'Ladies Bags, Totes & Crossbody Bags - ideas PRET - GulAhmed Shop.jpeg', 'Ladies Bags, Totes & Crossbody Bags - ideas PRET - GulAhmed Shop.jpeg', 300, 'In Stock', '2024-10-12 22:03:51', NULL),
(21, 6, 27, ' Tote Bags in Pakistan', ' Branded', 3000, 4500, '&nbsp;Buy Ladies Handbags Online - Tote Bags in Pakistan&nbsp;<br>', 'Buy Ladies Handbags Online - Tote Bags in Pakistan – Stylo.jpeg', 'Buy Ladies Handbags Online - Tote Bags in Pakistan – Stylo.jpeg', 'Buy Ladies Handbags Online - Tote Bags in Pakistan – Stylo.jpeg', 600, 'In Stock', '2024-10-12 22:05:35', NULL),
(22, 6, 28, ' Designer Shopping Bag ', ' Branded', 3100, 3700, '&nbsp;Designer Shopping Bag&nbsp; 2024<br>', 'Designer Shopping Bag Shoulder Bags High Quality Ladies Brand Luxurys Designer Mother Handbag Fashion Handbags Clutch Tote Printing Cossbod.jpeg', 'Designer Shopping Bag Shoulder Bags High Quality Ladies Brand Luxurys Designer Mother Handbag Fashion Handbags Clutch Tote Printing Cossbod.jpeg', 'Designer Shopping Bag Shoulder Bags High Quality Ladies Brand Luxurys Designer Mother Handbag Fashion Handbags Clutch Tote Printing Cossbod.jpeg', 280, 'In Stock', '2024-10-12 22:07:06', NULL),
(23, 6, 29, ' Nylon Plain Hand Bag', ' Branded', 7800, 8000, '&nbsp;15 Inches Nylon Plain Hand Bag<br>', '15 Inches Nylon Plain Hand Bag.jpeg', '15 Inches Nylon Plain Hand Bag.jpeg', '15 Inches Nylon Plain Hand Bag.jpeg', 300, 'Out of Stock', '2024-10-12 22:08:33', NULL),
(24, 6, 28, ' Ladies Handbags – Lavie World', ' Branded', 4100, 5200, '&nbsp;Types of Handbags, Uses of Handbags, Purses, Names, Ladies Handbags – Lavie World.<br>', 'Types of Handbags, Uses of Handbags, Purses, Names, Ladies Handbags – Lavie World.jpg', 'Types of Handbags, Uses of Handbags, Purses, Names, Ladies Handbags – Lavie World.jpg', 'Types of Handbags, Uses of Handbags, Purses, Names, Ladies Handbags – Lavie World.jpg', 300, 'In Stock', '2024-10-12 22:10:23', NULL),
(25, 6, 30, ' Women Bags Collection', ' Branded', 9000, 9300, '&nbsp;Women Bags Collection 2024<br>', 'Women Bags Collection - Julké Official Online Store – JULKÉ.jpeg', 'Women Bags Collection - Julké Official Online Store – JULKÉ.jpeg', 'Women Bags Collection - Julké Official Online Store – JULKÉ.jpeg', 700, 'In Stock', '2024-10-12 22:12:27', NULL),
(26, 8, 33, ' Kids Stationery Set ', 'arts', 850, 900, '&nbsp;Kids Stationery Set For Boy &amp; Girls Gift Items For School.<br>', 'Kids Stationery Set For Boy & Girls Gift Items For School.jpg', 'Kids Stationery Set For Boy & Girls Gift Items For School.jpg', 'Kids Stationery Set For Boy & Girls Gift Items For School.jpg', 150, 'In Stock', '2024-10-12 22:19:17', NULL),
(27, 8, 34, ' Fancy Stationery Set Of 3 Items For Gifting -.jpeg', 'arts', 600, 700, '&nbsp;Fancy Stationery Set Of 3 Items For Gifting&nbsp;<br>', 'Fancy Stationery Set Of 3 Items For Gifting -.jpeg', 'Fancy Stationery Set Of 3 Items For Gifting -.jpeg', 'Fancy Stationery Set Of 3 Items For Gifting -.jpeg', 120, 'Out of Stock', '2024-10-12 22:20:23', NULL),
(28, 8, 32, ' 7 Pcs Happy Stationary ', 'arts', 850, 1000, '&nbsp;7 Pcs Happy Stationary Set for Kids School Stationery Set With Watch,<br>', '7 Pcs Happy Stationary Set for Kids School Stationery Set With Watch And.jpg', '7 Pcs Happy Stationary Set for Kids School Stationery Set With Watch And.jpg', '7 Pcs Happy Stationary Set for Kids School Stationery Set With Watch And.jpg', 150, 'In Stock', '2024-10-12 22:21:36', NULL),
(29, 8, 33, '240-Piece Art Set ', 'arts', 1150, 1200, '&nbsp;Art Supplies, 240-Piece Art Set Crafts Drawing Kits with Double Sided Trifold.<br>', 'Art Supplies, 240-Piece Art Set Crafts Drawing Kits with Double Sided Trifold.jpg', 'Art Supplies, 240-Piece Art Set Crafts Drawing Kits with Double Sided Trifold.jpg', 'Art Supplies, 240-Piece Art Set Crafts Drawing Kits with Double Sided Trifold.jpg', 100, 'In Stock', '2024-10-12 22:23:04', NULL),
(30, 8, 33, ' Party Propz Cute Pen ', 'art', 2800, 3000, '&nbsp;Party Propz Cute Pen With Character-4 Pcs Japanese Stationery.<br>', 'Party Propz Cute Pen With Character-4 Pcs Japanese Stationery.jpg', 'Party Propz Cute Pen With Character-4 Pcs Japanese Stationery.jpg', 'Party Propz Cute Pen With Character-4 Pcs Japanese Stationery.jpg', 300, 'In Stock', '2024-10-12 22:25:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(15, 3, 'Birthday Cards', '2024-10-10 21:45:31', NULL),
(16, 3, 'Anniversary Cards', '2024-10-10 21:45:51', NULL),
(17, 3, 'Festival Cards', '2024-10-10 21:46:13', NULL),
(18, 3, 'Personalized Cards', '2024-10-10 21:46:35', NULL),
(19, 4, 'Decorative Items', '2024-10-10 21:46:51', NULL),
(20, 4, 'Souvenirs', '2024-10-10 21:47:08', NULL),
(21, 4, 'Jewelry Boxes', '2024-10-10 21:47:21', NULL),
(22, 4, 'Collectibles', '2024-10-10 21:47:41', NULL),
(23, 5, 'Traditional Dolls', '2024-10-10 21:48:19', NULL),
(24, 5, 'Fashion Dolls', '2024-10-10 21:48:38', NULL),
(25, 5, 'Plush Dolls', '2024-10-10 21:48:50', NULL),
(26, 5, 'Character Dolls', '2024-10-10 21:49:08', NULL),
(27, 6, 'Tote Bags', '2024-10-10 21:49:42', NULL),
(28, 6, 'Clutch Bags', '2024-10-10 21:50:10', NULL),
(29, 6, 'Crossbody Bags', '2024-10-10 21:50:24', NULL),
(30, 6, 'Backpacks', '2024-10-10 21:50:38', NULL),
(31, 8, 'Notebooks and Diaries', '2024-10-10 21:51:28', NULL),
(32, 8, 'Writing Instruments', '2024-10-10 21:51:45', NULL),
(33, 8, 'Art Supplies', '2024-10-10 21:51:57', NULL),
(34, 8, 'Organizational Supplies', '2024-10-10 21:52:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(4, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-09 09:56:17', '09-10-2024 03:30:55 PM', 1),
(5, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-09 10:06:33', NULL, 1),
(6, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-10 19:05:08', '11-10-2024 02:40:45 AM', 1),
(7, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-10 21:11:14', NULL, 1),
(8, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-11 06:35:57', NULL, 1),
(9, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-12 22:26:12', '13-10-2024 04:24:55 AM', 1),
(10, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-12 22:55:07', NULL, 0),
(11, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-12 22:55:13', NULL, 1),
(12, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-15 21:45:30', '16-10-2024 03:39:58 AM', 1),
(13, '', 0x3a3a3100000000000000000000000000, '2024-10-15 22:51:29', NULL, 0),
(14, '', 0x3a3a3100000000000000000000000000, '2024-10-15 22:51:31', NULL, 0),
(15, '', 0x3a3a3100000000000000000000000000, '2024-10-15 22:52:14', NULL, 0),
(16, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-15 23:05:21', '16-10-2024 04:52:45 AM', 1),
(17, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 18:51:14', '21-10-2024 12:23:45 AM', 1),
(18, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 18:59:10', '21-10-2024 01:14:01 AM', 1),
(19, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 19:46:31', NULL, 0),
(20, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 19:46:36', '21-10-2024 01:26:16 AM', 1),
(21, 'ijaz@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 19:56:45', '21-10-2024 01:40:53 AM', 1),
(22, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 20:11:02', '21-10-2024 01:41:51 AM', 1),
(23, 'ijaz@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 20:11:58', '21-10-2024 01:57:04 AM', 1),
(24, 'ijaz@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 20:27:13', '21-10-2024 02:11:06 AM', 1),
(25, 'ijaz@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-20 20:41:20', '21-10-2024 03:59:53 AM', 1),
(26, 'fazal@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-21 04:31:07', '21-10-2024 10:02:38 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(6, 'FAZAL', 'fazal@gmail.com', 3495432343, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-09 09:56:09', NULL),
(7, 'ijaz ali', 'ijaz@gmail.com', 318483418, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-20 19:56:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 6, 15, '2024-10-10 21:11:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
