-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2019 at 11:08 AM
-- Server version: 5.7.25
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aapbd_borakhdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Borakh Account', 'account@gmail.com', '1976653445', '$2y$10$yKr26RAHbpXphPHMVgG7q.a1z7GD40e6GpOu343mQOT656wYrh6eW', 'Ds8qFcfBlCKcEinAMGHWNlPqueKY1zX4boPlq38iX2DpvwgTFZDPUOHWLHTY', '2018-10-08 20:11:33', '2018-10-08 20:25:40'),
(3, 'Account Manager', 'account@demo.com', '1976653445', '$2y$10$XW6uPEiT9X6OmCAZSqkXPeyt.ra4.J9CN8kpzxoYtAKgo.MWzfoHe', 'ta7OMF5abnJcIAk8HXJCxhSy4opA0b362It1Z8KwgEUcNZrDVAzAkmmA5OTM', '2018-10-08 22:07:12', '2019-01-20 11:19:23'),
(4, 'Masuma Mahia', 'masuma.mahia@gmail.com', '01319785634', '$2y$10$Dr8upaBGinV9MKoQjUWM..efTUZdU/8avrUWSsN549e5i2vhOGHyG', NULL, '2018-11-15 05:16:38', '2018-11-15 05:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `account_password_resets`
--

CREATE TABLE `account_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Borakh', 'admin@aapbd.com', '$2y$10$YFv2zDh.EOAEMPg4TZqq7uWUOe/0e01N3M8synOFzL7eJlclT3f3m', 'admin/profile/e73afe32f1c7069178871d79621628b3.jpeg', 'J6pO15bJ4g3rsQODaTDvuEx12tlvb59wnL9yOlFosKKJgqA00BVGSddXDTCD', NULL, '2019-01-31 18:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('up','pu') COLLATE utf8_unicode_ci NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8_unicode_ci NOT NULL,
  `condition_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_pushes`
--

INSERT INTO `custom_pushes` (`id`, `send_to`, `condition`, `condition_data`, `message`, `sent_to`, `schedule_at`, `created_at`, `updated_at`) VALUES
(1, 'ALL', 'ACTIVE', NULL, 'Hi, welcome to Borakh', 0, NULL, '2018-09-22 15:26:49', '2018-09-22 15:26:49'),
(2, 'ALL', 'ACTIVE', NULL, 'test oush', 0, NULL, '2018-09-22 17:41:55', '2018-09-22 17:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dispatchers`
--

INSERT INTO `dispatchers` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Borakh Dispatcher', 'dispatcher@gmail.com', '1976653445', '$2y$10$jXns7/OE9yewQ8iAjadRBeeQqlj9Y3Mj7FT6f5pp16h6PnlqI9sSK', 'I8TgdkB7rZy30GeXqlqubyZ3FTw5md4rPvVby2MZOPTJ3rYYacWtadZNFclQ', '2018-10-08 20:10:08', '2018-11-03 21:03:25'),
(3, 'Dispatcher Demo', 'dispatcher@demo.com', '1976653445', '$2y$10$5mnFOav4R7eJVnWLxwoDueEotctixho2FEchifkbCUeFyJDXlAgbS', 'bSzk1N0QTYaxzIZDIQYeQj3ZEC4ZD8ct5seRBKf0HYicrTXxj3KA9bf50gQE', '2018-10-08 22:06:12', '2019-01-20 11:18:19'),
(4, 'test- mukul', 'admin@aapbd.com', '01670656335', '$2y$10$u5hRab0VcT6TQaTKiMgbru2.MbJU1C1bwKNPKbgxDh3XLbkU0iT.i', NULL, '2018-11-25 16:29:30', '2018-11-25 16:29:30');

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_password_resets`
--

CREATE TABLE `dispatcher_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Driving Licence', 'DRIVER', NULL, NULL),
(2, 'Bank Passbook', 'DRIVER', NULL, NULL),
(3, 'Joining Form', 'DRIVER', NULL, NULL),
(4, 'Work Permit', 'DRIVER', NULL, NULL),
(5, 'Registration Certificate', 'VEHICLE', NULL, NULL),
(6, 'Insurance Certificate', 'VEHICLE', NULL, NULL),
(7, 'Fitness Certificate', 'VEHICLE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourite_locations`
--

CREATE TABLE `favourite_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `type` enum('home','work','recent','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favourite_locations`
--

INSERT INTO `favourite_locations` (`id`, `user_id`, `address`, `latitude`, `longitude`, `type`, `created_at`, `updated_at`) VALUES
(1, 115, 'Banani, Dhaka, Bangladesh', 23.79399270, 90.40427190, 'home', '2018-09-22 16:19:58', '2018-09-22 16:19:58'),
(2, 117, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, 'work', '2018-10-06 21:24:52', '2018-10-06 21:24:52'),
(3, 117, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, 'home', '2018-10-06 21:28:01', '2018-10-06 21:28:01'),
(4, 134, 'Þingholtsstræti 2, Þingholtsstræti, 101 Reykjavík, Iceland', 64.14664430, -21.93469350, 'home', '2018-10-14 18:00:04', '2018-10-14 18:00:04'),
(5, 142, 'Nikunja 2, Dhaka, Bangladesh', 23.83188360, 90.41782010, 'home', '2018-10-31 08:25:47', '2018-10-31 08:25:47'),
(6, 152, 'House 47 Rd No 27, Dhaka 1213, Bangladesh', 23.79962980, 90.40401210, 'home', '2018-11-27 08:54:34', '2018-11-27 08:54:34'),
(9, 155, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 51.32373690, 'work', '2018-12-03 20:05:17', '2018-12-03 20:05:17'),
(10, 155, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 51.32373690, 'home', '2018-12-03 20:08:26', '2018-12-03 20:08:26'),
(11, 152, '333 Rd # 02, Dhaka, Bangladesh', 23.83558360, 90.36609720, 'work', '2018-12-05 06:47:01', '2018-12-05 06:47:01'),
(12, 134, 'Æsufell 6, Reykjavík, Iceland', 64.10239450, -21.82738120, 'work', '2018-12-24 16:30:19', '2018-12-24 16:30:19'),
(13, 172, 'Mirpur DOHS, Dhaka, Bangladesh', 23.83646800, 90.36953920, 'home', '2019-01-08 14:23:22', '2019-01-08 14:23:22'),
(14, 172, 'Azimpur Road, Dhaka, Bangladesh', 23.72388800, 90.38712280, 'work', '2019-01-08 14:23:32', '2019-01-08 14:23:32'),
(15, 174, 'Orlová, Czechia', 49.87013770, 18.42500780, 'home', '2019-01-08 20:29:39', '2019-01-08 20:29:39'),
(16, 174, 'Betula 55, 1424 LH De Kwakel, Netherlands', 52.25269250, 4.78999080, 'work', '2019-01-08 20:29:57', '2019-01-08 20:29:57'),
(17, 165, '179 New Line Road,Cherrybrook,(null)', -33.72233657, 151.03485695, 'home', '2019-01-18 07:12:08', '2019-01-18 07:12:08'),
(18, 179, 'Putalisadak, Kathmandu 44600, Nepal', 27.70437470, 85.32264570, 'work', '2019-01-25 07:18:00', '2019-01-25 07:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fleets`
--

INSERT INTO `fleets` (`id`, `name`, `email`, `password`, `company`, `mobile`, `logo`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Fleet Manager', 'fleet@gmail.com', '$2y$10$aHKJB0vPLLvGB5w9j08Bge7SLwvrwP/gCrEbheelM/70xwhhEgQie', 'Borakh Fleet', '1976653445', NULL, 'j1yB0X5CKcC2Wrm97NjGxtObIwl2MU4oeWtUqRH6citYBA9bPlCExlarxB7B', '2018-10-08 20:10:53', '2018-11-12 22:07:33'),
(3, 'Fleet Manager', 'fleet@demo.com', '$2y$10$j/FwcofUutq/9IPWTS1Qyeq9CCxOKPbNHGc2SoVTlrai4//uh7xqC', 'AAPBD', '1976653445', NULL, 'BicGMIzi3RVpr2CFmmNsD0Zixxl7Kis0SU1txyP3DLdwyjak0KyU4jQvEaoS', '2018-10-08 22:06:45', '2019-01-08 14:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `fleet_password_resets`
--

CREATE TABLE `fleet_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'api', 'user.incorrect_password', 'Incorrect Password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(2, 0, 'en', 'api', 'user.change_password', 'Required is new password should \nnot be same as old password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(3, 0, 'en', 'api', 'user.password_updated', 'Password Updated', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(4, 0, 'en', 'api', 'user.location_updated', 'Location Updated', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(5, 0, 'en', 'api', 'user.profile_updated', 'Profile Updated', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(6, 0, 'en', 'api', 'user.user_not_found', 'User Not Found', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(7, 0, 'en', 'api', 'user.not_paid', 'User Not Paid', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(8, 0, 'en', 'api', 'ride.request_inprogress', 'Already Request in Progress', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(9, 0, 'en', 'api', 'ride.no_providers_found', 'No Drivers Found', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(10, 0, 'en', 'api', 'ride.request_cancelled', 'Your Ride Cancelled', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(11, 0, 'en', 'api', 'ride.already_cancelled', 'Already Ride Cancelled', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(12, 0, 'en', 'api', 'ride.already_onride', 'Already You are Onride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(13, 0, 'en', 'api', 'ride.provider_rated', 'Driver Rated', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(14, 0, 'en', 'api', 'ride.request_scheduled', 'Ride Scheduled', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(15, 0, 'en', 'api', 'ride.request_already_scheduled', 'Ride Already Scheduled', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(16, 0, 'en', 'api', 'ride.request_modify_location', 'User Changed Destination Address', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(17, 0, 'en', 'api', 'something_went_wrong', 'Something Went Wrong', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(18, 0, 'en', 'api', 'logout_success', 'Logged out Successfully', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(19, 0, 'en', 'api', 'email_available', 'Email Available', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(20, 0, 'en', 'api', 'services_not_found', 'Services Not Found', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(21, 0, 'en', 'api', 'promocode_applied', 'Promocode Applied', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(22, 0, 'en', 'api', 'promocode_expired', 'Promocode Expired', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(23, 0, 'en', 'api', 'promocode_already_in_use', 'Promocode Already in Use', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(24, 0, 'en', 'api', 'paid', 'Paid', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(25, 0, 'en', 'api', 'added_to_your_wallet', 'Added to your Wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(26, 0, 'en', 'api', 'push.request_accepted', 'Your Ride Accepted by a Driver', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(27, 0, 'en', 'api', 'push.arrived', 'Driver Arrived at your Location', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(28, 0, 'en', 'api', 'push.dropped', 'Your ride is completed successfully. you have to pay', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(29, 0, 'en', 'api', 'push.incoming_request', 'New Incoming Ride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(30, 0, 'en', 'api', 'push.added_money_to_wallet', ' Added to your Wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(31, 0, 'en', 'api', 'push.charged_from_wallet', ' Charged from your Wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(32, 0, 'en', 'api', 'push.document_verfied', 'Your Documents are verified, Now you are ready to Start your Business', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(33, 0, 'en', 'api', 'push.provider_not_available', 'Sorry for inconvience time, Our partner or busy. Please try after some time', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(34, 0, 'en', 'api', 'push.user_cancelled', 'User Cancelled the Ride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(35, 0, 'en', 'api', 'push.provider_cancelled', 'Driver Cancelled the Ride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(36, 0, 'en', 'api', 'push.schedule_start', 'Your schedule ride has been started', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(37, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(38, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(39, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(40, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(41, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(42, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(43, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(44, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(45, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(46, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(47, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(48, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(49, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(50, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(51, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(52, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(53, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(54, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(55, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(56, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(57, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(58, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(59, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(60, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(61, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(62, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(63, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(64, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(65, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(66, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(67, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(68, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(69, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(70, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(71, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(72, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(73, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(74, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(75, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(76, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(77, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(78, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(79, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(80, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(81, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(82, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(83, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(84, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(85, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(86, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(87, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(88, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(89, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(90, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(91, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(92, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(93, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(94, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(95, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(96, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(97, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(98, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(99, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(100, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(101, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(102, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(103, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(104, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(105, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(106, 0, 'en', 'user', 'profile.old_password', 'Old Password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(107, 0, 'en', 'user', 'profile.password', 'Password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(108, 0, 'en', 'user', 'profile.confirm_password', 'Confirm Password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(109, 0, 'en', 'user', 'profile.first_name', 'First Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(110, 0, 'en', 'user', 'profile.last_name', 'Last Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(111, 0, 'en', 'user', 'profile.email', 'Email', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(112, 0, 'en', 'user', 'profile.mobile', 'Mobile', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(113, 0, 'en', 'user', 'profile.general_information', 'General Information', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(114, 0, 'en', 'user', 'profile.profile_picture', 'Profile Picture', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(115, 0, 'en', 'user', 'profile.wallet_balance', 'Wallet Balance', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(116, 0, 'en', 'user', 'profile.edit', 'Edit', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(117, 0, 'en', 'user', 'profile.save', 'Save', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(118, 0, 'en', 'user', 'profile.edit_information', 'Edit Information', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(119, 0, 'en', 'user', 'profile.change_password', 'Change Password', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(120, 0, 'en', 'user', 'profile.profile', 'Profile', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(121, 0, 'en', 'user', 'profile.logout', 'Logout', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(122, 0, 'en', 'user', 'profile.name', 'Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(123, 0, 'en', 'user', 'cash', 'CASH', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(124, 0, 'en', 'user', 'booking_id', 'Booking Id', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(125, 0, 'en', 'user', 'service_number', 'Car Number', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(126, 0, 'en', 'user', 'service_model', 'Car Model', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(127, 0, 'en', 'user', 'card.fullname', 'Full Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(128, 0, 'en', 'user', 'card.card_no', 'Card Number', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(129, 0, 'en', 'user', 'card.cvv', 'CVV', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(130, 0, 'en', 'user', 'card.add_card', 'Add Card', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(131, 0, 'en', 'user', 'card.delete', 'Delete', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(132, 0, 'en', 'user', 'card.month', 'Month', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(133, 0, 'en', 'user', 'card.year', 'Year', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(134, 0, 'en', 'user', 'card.default', 'Default', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(135, 0, 'en', 'user', 'fare_breakdown', 'FARE BREAKDOWN', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(136, 0, 'en', 'user', 'ride.finding_driver', 'Finding your Driver', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(137, 0, 'en', 'user', 'ride.accepted_ride', 'Accepted Your Ride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(138, 0, 'en', 'user', 'ride.arrived_ride', 'Arrived At your Location', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(139, 0, 'en', 'user', 'ride.onride', 'Enjoy your Ride', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(140, 0, 'en', 'user', 'ride.waiting_payment', 'Waiting for Payment', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(141, 0, 'en', 'user', 'ride.rate_and_review', 'Rate and Review', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(142, 0, 'en', 'user', 'ride.ride_now', 'Ride Now', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(143, 0, 'en', 'user', 'ride.cancel_request', 'Cancel Request', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(144, 0, 'en', 'user', 'ride.ride_status', 'Ride Status', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(145, 0, 'en', 'user', 'ride.dropped_ride', 'Your Ride is Completed', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(146, 0, 'en', 'user', 'ride.ride_details', 'Ride Details', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(147, 0, 'en', 'user', 'ride.invoice', 'Invoice', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(148, 0, 'en', 'user', 'ride.base_price', 'Base Fare', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(149, 0, 'en', 'user', 'ride.tax_price', 'Tax Fare', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(150, 0, 'en', 'user', 'ride.distance_price', 'Distance Fare', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(151, 0, 'en', 'user', 'ride.comment', 'Comment', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(152, 0, 'en', 'user', 'ride.detection_wallet', 'Wallet Detection', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(153, 0, 'en', 'user', 'ride.rating', 'Rating', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(154, 0, 'en', 'user', 'ride.km', 'Kilometer', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(155, 0, 'en', 'user', 'ride.total', 'Total', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(156, 0, 'en', 'user', 'ride.amount_paid', 'Amount to be Paid', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(157, 0, 'en', 'user', 'ride.promotion_applied', 'Promotion Applied', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(158, 0, 'en', 'user', 'ride.request_inprogress', 'Ride Already in Progress', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(159, 0, 'en', 'user', 'ride.request_scheduled', 'Ride Already Scheduled on this time', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(160, 0, 'en', 'user', 'ride.cancel_reason', 'Cancel Reason', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(161, 0, 'en', 'user', 'ride.wallet_deduction', 'Wallet Deduction', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(162, 0, 'en', 'user', 'dashboard', 'Dashboard', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(163, 0, 'en', 'user', 'payment', 'Payment', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(164, 0, 'en', 'user', 'wallet', 'Wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(165, 0, 'en', 'user', 'my_wallet', 'My Wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(166, 0, 'en', 'user', 'my_trips', 'My Trips', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(167, 0, 'en', 'user', 'in_your_wallet', 'in your wallet', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(168, 0, 'en', 'user', 'status', 'Status', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(169, 0, 'en', 'user', 'driver_name', 'Driver Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(170, 0, 'en', 'user', 'driver_rating', 'Driver Rating', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(171, 0, 'en', 'user', 'payment_mode', 'Payment Mode', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(172, 0, 'en', 'user', 'add_money', 'Add Money', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(173, 0, 'en', 'user', 'date', 'Date', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(174, 0, 'en', 'user', 'schedule_date', 'Scheduled Date', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(175, 0, 'en', 'user', 'amount', 'Total Amount', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(176, 0, 'en', 'user', 'type', 'Type', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(177, 0, 'en', 'user', 'time', 'Time', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(178, 0, 'en', 'user', 'request_id', 'Request ID', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(179, 0, 'en', 'user', 'paid_via', 'PAID VIA', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(180, 0, 'en', 'user', 'from', 'From', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(181, 0, 'en', 'user', 'total_distance', 'Total Distance', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(182, 0, 'en', 'user', 'eta', 'ETA', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(183, 0, 'en', 'user', 'to', 'To', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(184, 0, 'en', 'user', 'use_wallet_balance', 'Use Wallet Balance', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(185, 0, 'en', 'user', 'available_wallet_balance', 'Available Wallet Balance', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(186, 0, 'en', 'user', 'estimated_fare', 'Estimated Fare', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(187, 0, 'en', 'user', 'charged', 'CHARGED', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(188, 0, 'en', 'user', 'payment_method', 'Payment Methods', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(189, 0, 'en', 'user', 'promotion', 'Promotions', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(190, 0, 'en', 'user', 'add_promocode', 'Add Promocode', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(191, 0, 'en', 'user', 'upcoming_trips', 'Upcoming trips', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(192, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(193, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(194, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(195, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(196, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(197, 0, 'en', 'admin', 'name', 'Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(198, 0, 'en', 'admin', 'email', 'Email', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(199, 0, 'en', 'admin', 'first_name', 'First Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(200, 0, 'en', 'admin', 'last_name', 'Last Name', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(201, 0, 'en', 'admin', 'picture', 'Picture', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(202, 0, 'en', 'admin', 'password', 'Password ', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(203, 0, 'en', 'admin', 'mobile', 'Mobile', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(204, 0, 'en', 'admin', 'cancel', 'Cancel', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(205, 0, 'en', 'admin', 'back', 'Back', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(206, 0, 'en', 'admin', 'id', 'ID', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(207, 0, 'en', 'admin', 'edit', 'Edit', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(208, 0, 'en', 'admin', 'gender', 'Gender', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(209, 0, 'en', 'admin', 'address', 'Address', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(210, 0, 'en', 'admin', 'action', 'Action', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(211, 0, 'en', 'admin', 'Enable', 'Enable', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(212, 0, 'en', 'admin', 'Disable', 'Disable', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(213, 0, 'en', 'admin', 'type', 'Type', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(214, 0, 'en', 'admin', 'delete', 'Delete', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(215, 0, 'en', 'admin', 'help', 'Help', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(216, 0, 'en', 'admin', 'status', 'Status', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(217, 0, 'en', 'admin', 'message', 'Message', '2018-11-03 22:24:22', '2019-01-01 12:14:00'),
(218, 0, 'en', 'admin', 'History', 'History', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(219, 0, 'en', 'admin', 'Statements', 'Statements', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(220, 0, 'en', 'admin', 'amount', 'Amount', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(221, 0, 'en', 'admin', 'account.change_password', 'Change Password', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(222, 0, 'en', 'admin', 'account.old_password', 'Old Password', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(223, 0, 'en', 'admin', 'account.password', 'Password ', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(224, 0, 'en', 'admin', 'account.password_confirmation', 'Password Confirmation', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(225, 0, 'en', 'admin', 'account.update_profile', 'Update Profile', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(226, 0, 'en', 'admin', 'account-manager.add_account_manager', 'Add Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(227, 0, 'en', 'admin', 'account-manager.full_name', 'Full Name', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(228, 0, 'en', 'admin', 'account-manager.password_confirmation', 'Password Confirmation', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(229, 0, 'en', 'admin', 'account-manager.update_account_manager', 'Update Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(230, 0, 'en', 'admin', 'account-manager.account_manager', 'Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(231, 0, 'en', 'admin', 'account-manager.add_new_account_manager', 'Add New Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(232, 0, 'en', 'admin', 'auth.reset_password', 'Reset Password', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(233, 0, 'en', 'admin', 'auth.admin_login', 'Admin Login', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(234, 0, 'en', 'admin', 'auth.login_here', 'Login Here', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(235, 0, 'en', 'admin', 'auth.remember_me', 'Remember Me', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(236, 0, 'en', 'admin', 'auth.sign_in', 'Sign In', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(237, 0, 'en', 'admin', 'auth.forgot_your_password', 'Forgot Your Password', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(238, 0, 'en', 'admin', 'auth.request_scheduled', 'Ride Scheduled', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(239, 0, 'en', 'admin', 'auth.request_already_scheduled', 'Ride Already Scheduled', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(240, 0, 'en', 'admin', 'dispatcher.add_dispatcher', 'Add Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(241, 0, 'en', 'admin', 'dispatcher.update_dispatcher', 'Update Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(242, 0, 'en', 'admin', 'dispatcher.dispatcher', 'Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(243, 0, 'en', 'admin', 'dispatcher.add_new_dispatcher', 'Add New Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(244, 0, 'en', 'admin', 'document.add_Document', 'Add Document', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(245, 0, 'en', 'admin', 'document.document_name', 'Document Name', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(246, 0, 'en', 'admin', 'document.document_type', 'Document Type', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(247, 0, 'en', 'admin', 'document.driver_review', 'Driver Review', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(248, 0, 'en', 'admin', 'document.vehicle_review', 'Vehicle Review', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(249, 0, 'en', 'admin', 'document.update_document', 'Update Document', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(250, 0, 'en', 'admin', 'document.document', 'Document', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(251, 0, 'en', 'admin', 'fleet.add_fleet_owner', 'Add Fleet Owner', '2018-11-03 22:24:22', '2018-11-03 22:24:22'),
(252, 0, 'en', 'admin', 'fleet.company_name', 'Company Name', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(253, 0, 'en', 'admin', 'fleet.company_logo', 'Company Logo', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(254, 0, 'en', 'admin', 'fleet.update_fleet_owner', 'Update Fleet Owner', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(255, 0, 'en', 'admin', 'fleet.update_fleet', 'Update Fleet', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(256, 0, 'en', 'admin', 'fleet.fleet_owners', 'Fleet Owners', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(257, 0, 'en', 'admin', 'fleet.add_new_fleet_owner', 'Add New Fleet Owner', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(258, 0, 'en', 'admin', 'fleet.show_provider', 'Show Provider', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(259, 0, 'en', 'admin', 'include.profile', 'Profile', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(260, 0, 'en', 'admin', 'include.sign_out', 'Sign out', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(261, 0, 'en', 'admin', 'include.admin_dashboard', 'Admin Dashboard', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(262, 0, 'en', 'admin', 'include.dashboard', 'Dashboard', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(263, 0, 'en', 'admin', 'include.dispatcher_panel', 'Dispatcher Panel', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(264, 0, 'en', 'admin', 'include.heat_map', 'Heat Map', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(265, 0, 'en', 'admin', 'include.members', 'Members', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(266, 0, 'en', 'admin', 'include.users', 'Users', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(267, 0, 'en', 'admin', 'include.list_users', 'List Users', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(268, 0, 'en', 'admin', 'include.add_new_user', 'Add New User', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(269, 0, 'en', 'admin', 'include.providers', 'Providers', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(270, 0, 'en', 'admin', 'include.list_providers', 'List Providers', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(271, 0, 'en', 'admin', 'include.add_new_provider', 'Add New Provider', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(272, 0, 'en', 'admin', 'include.dispatcher', 'Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(273, 0, 'en', 'admin', 'include.list_dispatcher', 'List Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(274, 0, 'en', 'admin', 'include.add_new_dispatcher', 'Add New Dispatcher', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(275, 0, 'en', 'admin', 'include.fleet_owner', 'Fleet Owner', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(276, 0, 'en', 'admin', 'include.list_fleets', 'List Fleets', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(277, 0, 'en', 'admin', 'include.add_new_fleet_owner', 'Add New Fleet Owner', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(278, 0, 'en', 'admin', 'include.account_manager', 'Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(279, 0, 'en', 'admin', 'include.list_account_managers', 'List Account Managers', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(280, 0, 'en', 'admin', 'include.add_new_account_manager', 'Add New Account Manager', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(281, 0, 'en', 'admin', 'include.accounts', 'Accounts', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(282, 0, 'en', 'admin', 'include.statements', 'Statements', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(283, 0, 'en', 'admin', 'include.overall_ride_statments', 'Overall Ride Statments', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(284, 0, 'en', 'admin', 'include.provider_statement', 'Provider Statement', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(285, 0, 'en', 'admin', 'include.daily_statement', 'Daily Statement', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(286, 0, 'en', 'admin', 'include.monthly_statement', 'Monthly Statement', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(287, 0, 'en', 'admin', 'include.yearly_statement', 'Yearly Statement', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(288, 0, 'en', 'admin', 'include.details', 'Details', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(289, 0, 'en', 'admin', 'include.map', 'Map', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(290, 0, 'en', 'admin', 'include.ratings', 'Ratings', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(291, 0, 'en', 'admin', 'include.reviews', 'Reviews', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(292, 0, 'en', 'admin', 'include.user_ratings', 'User Ratings', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(293, 0, 'en', 'admin', 'include.provider_ratings', 'Provider Ratings', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(294, 0, 'en', 'admin', 'include.requests', 'Requests', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(295, 0, 'en', 'admin', 'include.request_history', 'Request History', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(296, 0, 'en', 'admin', 'include.scheduled_rides', 'Scheduled Rides', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(297, 0, 'en', 'admin', 'include.general', 'General', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(298, 0, 'en', 'admin', 'include.service_types', 'Service Types', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(299, 0, 'en', 'admin', 'include.list_service_types', 'List Service Types', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(300, 0, 'en', 'admin', 'include.add_new_service_type', 'Add New Service Type', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(301, 0, 'en', 'admin', 'include.documents', 'Documents', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(302, 0, 'en', 'admin', 'include.list_documents', 'List Documents', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(303, 0, 'en', 'admin', 'include.add_new_document', 'Add New Document', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(304, 0, 'en', 'admin', 'include.promocodes', 'Promocodes', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(305, 0, 'en', 'admin', 'include.list_promocodes', 'List Promocodes', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(306, 0, 'en', 'admin', 'include.add_new_promocode', 'Add New Promocode', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(307, 0, 'en', 'admin', 'include.payment_details', 'Payment Details', '2018-11-03 22:24:22', '2019-01-01 12:14:01'),
(308, 0, 'en', 'admin', 'include.payment_history', 'Payment History', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(309, 0, 'en', 'admin', 'include.payment_settings', 'Payment Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(310, 0, 'en', 'admin', 'include.settings', 'Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(311, 0, 'en', 'admin', 'include.site_settings', 'Site Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(312, 0, 'en', 'admin', 'include.others', 'Others', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(313, 0, 'en', 'admin', 'include.privacy_policy', 'Privacy Policy', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(314, 0, 'en', 'admin', 'include.help', 'Help', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(315, 0, 'en', 'admin', 'include.custom_push', 'Custom Push', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(316, 0, 'en', 'admin', 'include.translations', 'Translations', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(317, 0, 'en', 'admin', 'include.account', 'Account', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(318, 0, 'en', 'admin', 'include.account_settings', 'Account Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(319, 0, 'en', 'admin', 'include.change_password', 'Change Password', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(320, 0, 'en', 'admin', 'include.logout', 'Logout', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(321, 0, 'en', 'admin', 'pages.pages', 'Pages', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(322, 0, 'en', 'admin', 'payment.payment_history', 'Payment History', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(323, 0, 'en', 'admin', 'payment.request_id', 'Request ID', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(324, 0, 'en', 'admin', 'payment.transaction_id', 'Transaction ID', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(325, 0, 'en', 'admin', 'payment.from', 'From', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(326, 0, 'en', 'admin', 'payment.to', 'To', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(327, 0, 'en', 'admin', 'payment.total_amount', 'Total Amount', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(328, 0, 'en', 'admin', 'payment.provider_amount', 'Provider Amount', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(329, 0, 'en', 'admin', 'payment.payment_mode', 'Payment Mode', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(330, 0, 'en', 'admin', 'payment.payment_status', 'Payment Status', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(331, 0, 'en', 'admin', 'payment.payment_modes', 'Payment Modes', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(332, 0, 'en', 'admin', 'payment.card_payments', 'Stripe (Card Payments)', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(333, 0, 'en', 'admin', 'payment.stripe_secret_key', 'Stripe Secret key', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(334, 0, 'en', 'admin', 'payment.stripe_publishable_key', 'Stripe Publishable key', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(335, 0, 'en', 'admin', 'payment.cash_payments', 'Cash Payments', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(336, 0, 'en', 'admin', 'payment.payment_settings', 'Payment Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(337, 0, 'en', 'admin', 'payment.daily_target', 'Daily Target', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(338, 0, 'en', 'admin', 'payment.tax_percentage', 'Tax percentage(%)', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(339, 0, 'en', 'admin', 'payment.surge_trigger_point', 'Surge Trigger Point', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(340, 0, 'en', 'admin', 'payment.surge_percentage', 'Surge Percentage(%)', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(341, 0, 'en', 'admin', 'payment.commission_percentage', 'Commission Percentage(%)', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(342, 0, 'en', 'admin', 'payment.provider_commission_percentage', 'Provider Commission Percentage(%)', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(343, 0, 'en', 'admin', 'payment.booking_id_prefix', 'Booking ID Prefix', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(344, 0, 'en', 'admin', 'payment.currency', 'Currency', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(345, 0, 'en', 'admin', 'payment.update_site_settings', 'Update Site Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(346, 0, 'en', 'admin', 'promocode.add_promocode', 'Add Promocode', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(347, 0, 'en', 'admin', 'promocode.discount', 'Discount', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(348, 0, 'en', 'admin', 'promocode.expiration', 'Expiration', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(349, 0, 'en', 'admin', 'promocode.promocode', 'Promocode', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(350, 0, 'en', 'admin', 'promocode.update_promocode', 'Update Promocode', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(351, 0, 'en', 'admin', 'promocode.used_count', 'Used Count', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(352, 0, 'en', 'admin', 'promocode.promocodes', 'Promocodes', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(353, 0, 'en', 'admin', 'promocode.discount_type', 'Promocode Use ', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(354, 0, 'en', 'admin', 'provides.provider_name', 'Provider Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(355, 0, 'en', 'admin', 'provides.approve', 'Approve', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(356, 0, 'en', 'admin', 'provides.delete', 'Delete', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(357, 0, 'en', 'admin', 'provides.add_provider', 'Add Provider', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(358, 0, 'en', 'admin', 'provides.password_confirmation', 'Password Confirmation', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(359, 0, 'en', 'admin', 'provides.update_provider', 'Update Provider', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(360, 0, 'en', 'admin', 'provides.type_allocation', 'Provider Service Type Allocation', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(361, 0, 'en', 'admin', 'provides.service_name', 'Service Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(362, 0, 'en', 'admin', 'provides.service_number', 'Service Number', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(363, 0, 'en', 'admin', 'provides.service_model', 'Service Model', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(364, 0, 'en', 'admin', 'provides.provider_documents', 'Provider Documents', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(365, 0, 'en', 'admin', 'provides.document_type', 'Document Type', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(366, 0, 'en', 'admin', 'provides.providers', 'Providers', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(367, 0, 'en', 'admin', 'provides.add_new_provider', 'add New Provider', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(368, 0, 'en', 'admin', 'provides.total_requests', 'Total Requests', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(369, 0, 'en', 'admin', 'provides.full_name', 'Full Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(370, 0, 'en', 'admin', 'provides.accepted_requests', 'Accepted Requests', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(371, 0, 'en', 'admin', 'provides.cancelled_requests', 'Cancelled Requests', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(372, 0, 'en', 'admin', 'provides.service_type', 'Documents / Service Type', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(373, 0, 'en', 'admin', 'provides.online', 'Online', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(374, 0, 'en', 'admin', 'provides.Provider_Details', 'Provider Details', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(375, 0, 'en', 'admin', 'provides.Approved', 'Approved', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(376, 0, 'en', 'admin', 'provides.Not_Approved', 'Not Approved', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(377, 0, 'en', 'admin', 'provides.Total_Rides', 'Total Rides', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(378, 0, 'en', 'admin', 'provides.Total_Earning', 'Total Earning', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(379, 0, 'en', 'admin', 'provides.Commission', 'Commission', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(380, 0, 'en', 'admin', 'provides.Joined_at', 'Joined at', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(381, 0, 'en', 'admin', 'provides.Details', 'Details', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(382, 0, 'en', 'admin', 'request.Booking_ID', 'Booking ID', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(383, 0, 'en', 'admin', 'request.User_Name', 'User Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(384, 0, 'en', 'admin', 'request.Date_Time', 'Date &amp; Time', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(385, 0, 'en', 'admin', 'request.Provider_Name', 'Provider Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(386, 0, 'en', 'admin', 'request.Payment_Mode', 'Payment Mode', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(387, 0, 'en', 'admin', 'request.Payment_Status', 'Payment Status', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(388, 0, 'en', 'admin', 'request.Request_Id', 'Request Id', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(389, 0, 'en', 'admin', 'request.Scheduled_Date_Time', 'Scheduled Date & Time', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(390, 0, 'en', 'admin', 'review.Request_ID', 'Request ID', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(391, 0, 'en', 'admin', 'review.Rating', 'Rating', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(392, 0, 'en', 'admin', 'review.Comments', 'Comments', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(393, 0, 'en', 'admin', 'review.Provider_Reviews', 'Provider Reviews', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(394, 0, 'en', 'admin', 'review.User_Reviews', 'User Reviews', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(395, 0, 'en', 'admin', 'service.Add_Service_Type', 'Add Service Type', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(396, 0, 'en', 'admin', 'service.Service_Name', 'Service Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(397, 0, 'en', 'admin', 'service.Provider_Name', 'Provider Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(398, 0, 'en', 'admin', 'service.Service_Image', 'Service Image', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(399, 0, 'en', 'admin', 'service.Base_Price', 'Base Price', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(400, 0, 'en', 'admin', 'service.Base_Distance', 'Base Distance', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(401, 0, 'en', 'admin', 'service.unit_time', 'Unit Time Pricing (For Rental amount per hour / 60) ', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(402, 0, 'en', 'admin', 'service.unit', 'Unit Distance Price', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(403, 0, 'en', 'admin', 'service.Seat_Capacity', 'Seat Capacity', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(404, 0, 'en', 'admin', 'service.Pricing_Logic', 'Pricing Logic', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(405, 0, 'en', 'admin', 'service.Description', 'Description', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(406, 0, 'en', 'admin', 'service.Update_User', 'Update User', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(407, 0, 'en', 'admin', 'service.Update_Service_Type', 'Update Service Type', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(408, 0, 'en', 'admin', 'setting.Site_Settings', 'Site Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(409, 0, 'en', 'admin', 'setting.Site_Name', 'Site Name', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(410, 0, 'en', 'admin', 'setting.Site_Logo', 'Site Logo', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(411, 0, 'en', 'admin', 'setting.Site_Icon', 'Site Icon', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(412, 0, 'en', 'admin', 'setting.Copyright_Content', 'Copyright Content', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(413, 0, 'en', 'admin', 'setting.Playstore_link', 'Playstore link', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(414, 0, 'en', 'admin', 'setting.Appstore_Link', 'Appstore Link', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(415, 0, 'en', 'admin', 'setting.Provider_Accept_Timeout', 'Provider Accept Timeout', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(416, 0, 'en', 'admin', 'setting.Provider_Search_Radius', 'Provider Search Radius', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(417, 0, 'en', 'admin', 'setting.SOS_Number', 'SOS Number', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(418, 0, 'en', 'admin', 'setting.Contact_Number', 'Contact Number', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(419, 0, 'en', 'admin', 'setting.Contact_Email', 'Contact Email', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(420, 0, 'en', 'admin', 'setting.Social_Login', 'Social Login', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(421, 0, 'en', 'admin', 'setting.Update_Site_Settings', 'Update Site Settings', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(422, 0, 'en', 'admin', 'setting.map_key', 'Google Map Key', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(423, 0, 'en', 'admin', 'setting.fb_app_version', 'FB App Version', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(424, 0, 'en', 'admin', 'setting.fb_app_id', 'FB App ID', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(425, 0, 'en', 'admin', 'setting.fb_app_secret', 'FB App Secret', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(426, 0, 'en', 'admin', 'users.Add_User', 'Add User', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(427, 0, 'en', 'admin', 'users.Update_User', 'Update User', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(428, 0, 'en', 'admin', 'users.Users', 'Users', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(429, 0, 'en', 'admin', 'users.Rating', 'Rating', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(430, 0, 'en', 'admin', 'users.Wallet_Amount', 'Wallet Amount', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(431, 0, 'en', 'admin', 'users.User_Details', 'User Details', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(432, 0, 'en', 'admin', 'users.Wallet_Balance', 'Wallet Balance', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(433, 0, 'en', 'admin', 'dashboard.Rides', 'Total Cancelled Rides', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(434, 0, 'en', 'admin', 'dashboard.Revenue', 'Revenue', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(435, 0, 'en', 'admin', 'dashboard.service', 'No. of Service Types', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(436, 0, 'en', 'admin', 'dashboard.cancel_count', 'User Cancelled Count', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(437, 0, 'en', 'admin', 'dashboard.provider_cancel_count', 'Provider Cancelled Count', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(438, 0, 'en', 'admin', 'dashboard.fleets', 'No. of Fleets', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(439, 0, 'en', 'admin', 'dashboard.scheduled', 'No. of Scheduled Rides', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(440, 0, 'en', 'admin', 'dashboard.Recent_Rides', 'Recent Rides', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(441, 0, 'en', 'admin', 'dashboard.View_Ride_Details', 'View Ride Details', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(442, 0, 'en', 'admin', 'dashboard.No_Details_Found', 'No Details Found', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(443, 0, 'en', 'admin', 'heatmap.Ride_Heatmap', 'Ride Heatmap', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(444, 0, 'en', 'admin', 'push.Push_Notification', 'Push Notification', '2018-11-03 22:24:23', '2019-01-01 12:14:01');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(445, 0, 'en', 'admin', 'push.Sent_to', 'Sent to', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(446, 0, 'en', 'admin', 'push.Push_Now', 'Push Now', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(447, 0, 'en', 'admin', 'push.Schedule_Push', 'Schedule Push', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(448, 0, 'en', 'admin', 'push.Condition', 'Condition', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(449, 0, 'en', 'admin', 'push.Notification_History', 'Notification History', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(450, 0, 'en', 'admin', 'push.Sent_on', 'Sent on', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(451, 0, 'en', 'servicetypes', 'MIN', 'Per Minute Pricing', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(452, 0, 'en', 'servicetypes', 'HOUR', 'Per Hour Pricing', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(453, 0, 'en', 'servicetypes', 'DISTANCE', 'Distance Pricing', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(454, 0, 'en', 'servicetypes', 'DISTANCEMIN', 'Distance and Per Minute Pricing', '2018-11-03 22:24:23', '2019-01-01 12:14:01'),
(455, 0, 'en', 'servicetypes', 'DISTANCEHOUR', 'Distance and Per Hour Pricing', '2018-11-03 22:24:23', '2019-01-01 12:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_08_25_172600_create_settings_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2017_01_11_180503_create_admins_table', 1),
(11, '2017_01_11_180511_create_providers_table', 1),
(12, '2017_01_11_181312_create_cards_table', 1),
(13, '2017_01_11_181357_create_chats_table', 1),
(14, '2017_01_11_181558_create_promocodes_table', 1),
(15, '2017_01_11_182454_create_provider_documents_table', 1),
(16, '2017_01_11_182536_create_provider_services_table', 1),
(17, '2017_01_11_182649_create_user_requests_table', 1),
(18, '2017_01_11_182717_create_request_filters_table', 1),
(19, '2017_01_11_182738_create_service_types_table', 1),
(20, '2017_01_25_172422_create_documents_table', 1),
(21, '2017_01_31_122021_create_provider_devices_table', 1),
(22, '2017_02_02_192703_create_user_request_ratings_table', 1),
(23, '2017_02_06_080124_create_user_request_payments_table', 1),
(24, '2017_02_14_135859_create_provider_profiles_table', 1),
(25, '2017_02_21_131429_create_promocode_usages_table', 1),
(26, '2017_06_07_045207_add_social_login_to_providers_tables', 1),
(27, '2017_06_17_151030_create_dispatchers_table', 1),
(28, '2017_06_17_151031_create_dispatcher_password_resets_table', 1),
(29, '2017_06_17_151145_create_fleets_table', 1),
(30, '2017_06_17_151146_create_fleet_password_resets_table', 1),
(31, '2017_06_17_151150_add_fleet_to_providers_table', 1),
(32, '2017_06_19_130022_add_booking_id_to_user_request', 1),
(33, '2017_06_19_155736_add_cancel_reason_to_user_request', 1),
(34, '2017_06_20_154148_create_accounts_table', 1),
(35, '2017_06_20_154149_create_account_password_resets_table', 1),
(36, '2017_08_03_194354_create_custom_pushes_table', 1),
(37, '2017_09_01_190333_create_wallet_passbooks_table', 1),
(38, '2017_09_01_190355_create_promocode_passbooks_table', 1),
(39, '2017_09_15_145235_add_travel_tracking_distance_to_user_requests_table', 1),
(40, '2017_09_15_152718_add_provider_payments_to_user_request_payments_table', 1),
(41, '2017_09_19_104042_add_genders_to_providers_table', 1),
(42, '2017_09_19_104042_add_genders_to_users_table', 1),
(43, '2017_09_26_144027_add_travel_time_to_user_requests_table', 1),
(44, '2017_09_26_160101_create_favourite_locations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00874abf7eb91f73939721aa770f6a9d8bed074f411980d33e0113bee2385a8acebc92934bcaa437', 155, 2, NULL, '[]', 0, '2018-12-03 18:26:06', '2018-12-03 18:26:06', '2018-12-18 18:26:06'),
('0177431d6cbf8c0966d747016a51f361a6880eff86198395a674b452a150e81a2ec8675d9fcde845', 117, 2, NULL, '[]', 0, '2018-10-07 21:45:40', '2018-10-07 21:45:40', '2018-10-22 21:45:40'),
('02d41b088b1dd79d939e7c5a5b3befd8dcf99ab1b3ce6648919ace24bd9519322e112cb078bd2a32', 167, 2, NULL, '[]', 1, '2018-12-28 01:04:40', '2018-12-28 01:04:40', '2019-01-12 01:04:40'),
('04b3a774e4cee7e261df8e1f9dc66813241d21aae03ef25cabe943e8e27e5d490aed0d81e969ad94', 117, 2, NULL, '[]', 0, '2018-11-21 06:30:19', '2018-11-21 06:30:19', '2018-12-06 06:30:19'),
('04ddc6f40cad02de1b6ddbc275211b3bdb575aee93c4f703d02e681edce4dd628558fd0c7b52a43d', 181, 2, NULL, '[]', 0, '2019-01-28 06:55:02', '2019-01-28 06:55:02', '2019-02-12 06:55:02'),
('081542181b1d785d2f4e1876748799a17e85e93b5da9d08746bdc3fe7ba520e7c7dd07df665a8404', 125, 2, NULL, '[]', 0, '2018-10-12 05:58:34', '2018-10-12 05:58:34', '2018-10-27 05:58:34'),
('0a8ce91861b98d33d4b1c19f1620b9f174c1e6040d4b7d62e7c38843999496353b5651ec2fc771c0', 111, 2, NULL, '[]', 0, '2018-09-22 14:39:36', '2018-09-22 14:39:36', '2018-10-07 14:39:36'),
('0af42eccae1dcbd7e9278654550ea8a1fdd3f89b67f9912455272ca2216653fdbe08eef6b4345d81', 117, 2, NULL, '[]', 0, '2018-10-28 09:30:22', '2018-10-28 09:30:22', '2018-11-12 09:30:21'),
('0eb48113ff144de6ee464bde56276213fb7dec9e58ff223eaedc5fb5c388ad71cfa2876d640db5b7', 131, 2, NULL, '[]', 0, '2018-11-05 10:04:29', '2018-11-05 10:04:29', '2018-11-20 10:04:29'),
('0fb25d67a9651ba6c9a96be74134d6c93fee1ea1523e5ba489a12406a2ede7530b914ceb41d0a517', 180, 2, NULL, '[]', 0, '2019-01-27 07:36:27', '2019-01-27 07:36:27', '2019-02-11 07:36:27'),
('11ecbd75c41cc9f49c29d0723db269f78ccc25b1a083f8eca15552d9792916158c8833b437991fbf', 123, 1, 'socialLogin', '[]', 0, '2018-09-26 02:41:03', '2018-09-26 02:41:03', '2028-09-26 02:41:03'),
('13576737dafca8ef24593ec949bc7d1f1dbd0368c520d721a95dd6d8ebf2ac45940700e7523cfb49', 117, 2, NULL, '[]', 0, '2018-10-23 07:32:15', '2018-10-23 07:32:15', '2018-11-07 07:32:15'),
('14089ac1e14436a44d250fb7ea56bb85d8b6f0121adff59efa759496a5bc0e15955161cd95a2c826', 131, 2, NULL, '[]', 0, '2018-11-09 09:34:20', '2018-11-09 09:34:20', '2018-11-24 09:34:20'),
('1484f171fe702d40beb42f526d6ed9a8a63c7d79ba1f648082d635e428178491f540870d9f5bcda7', 134, 2, NULL, '[]', 1, '2018-10-14 17:57:54', '2018-10-14 17:57:54', '2018-10-29 17:57:54'),
('149ce549868543478b7a65d42a97aed7ebfb32cdd90a7f937ee1a1ada9210780770fdb09563c4b43', 117, 2, NULL, '[]', 0, '2019-01-28 09:01:02', '2019-01-28 09:01:02', '2019-02-12 09:01:02'),
('15b4e97e8dc047c2499d199eccbb78784782ce2efee6ce98c0a9882bb093afe6f5734ddcdb5beb24', 165, 2, NULL, '[]', 1, '2018-12-23 06:17:32', '2018-12-23 06:17:32', '2019-01-07 06:17:32'),
('172aff56d8bf0d7306976625601e09e8399c743e811f1e2d37d627e9e2927e44df9064e25ee4c820', 140, 1, 'socialLogin', '[]', 0, '2018-10-30 12:17:34', '2018-10-30 12:17:34', '2028-10-30 12:17:34'),
('18ca51ccbcf6fb71fcfb9f7e02041f22350ed91668e677064d12469014525aa68b0a1fbc3226e628', 120, 2, NULL, '[]', 0, '2018-09-24 18:27:40', '2018-09-24 18:27:40', '2018-10-09 18:27:40'),
('1aa99b938fb71cb1e653c6e722e3b5ebaee161ceb1e663cf20f3cc1d25e578926aec0584c8c8ff08', 117, 2, NULL, '[]', 0, '2018-10-16 08:35:22', '2018-10-16 08:35:22', '2018-10-31 08:35:22'),
('1be57b9c20b571c1bed916bee3a43f6f3034e613637b37f4c8b81c042b6d1b72497709ed9fae7896', 117, 2, NULL, '[]', 0, '2018-10-08 16:01:29', '2018-10-08 16:01:29', '2018-10-23 16:01:29'),
('1cc8939f0c46d345f3c5d5f202ccc12f1ecd44738085f346b9b1ab99971f7ae578232d2b0b2e76b7', 116, 2, NULL, '[]', 0, '2018-09-22 17:32:28', '2018-09-22 17:32:28', '2018-10-07 17:32:28'),
('1dc76b91f9e69e2d20f74837296cc63a1500bc06237ee1f8acae0f33e648ec508ce2d4f4b15992c7', 126, 2, NULL, '[]', 0, '2018-09-28 04:33:39', '2018-09-28 04:33:39', '2018-10-13 04:33:39'),
('1ecc8da5f1f840b34cce28a5c32f48f52daaa71aed5860e2bc4949462686e72d507da804cb7d0a2b', 165, 2, NULL, '[]', 0, '2019-01-07 08:24:41', '2019-01-07 08:24:41', '2019-01-22 08:24:41'),
('1ee7618cd94518f0160ca179c92b5edc39a5b2432847374814b0706c8bf36cdf9911e9ad670241c7', 122, 2, NULL, '[]', 0, '2018-09-25 18:10:29', '2018-09-25 18:10:29', '2018-10-10 18:10:29'),
('1fb9a6c30ec2d39d52fb2bc26c74b152ae50d4e6c5cfb330eddb3dd7fc0799ac22cca5e3b231038f', 111, 2, NULL, '[]', 0, '2018-09-24 18:03:17', '2018-09-24 18:03:17', '2018-10-09 18:03:17'),
('2089a14e5236c43585ebf5ebde194f7501d2b48ded6bc7d25876c4cd519192368a3d2d79f34cf1aa', 179, 1, 'socialLogin', '[]', 0, '2019-01-25 07:12:42', '2019-01-25 07:12:42', '2029-01-25 07:12:42'),
('2508b59075a2065312df090b81684dae464cf4acbb86aa6213dfb31c6e31de5a793f5e9485f15880', 183, 2, NULL, '[]', 0, '2019-01-30 15:56:34', '2019-01-30 15:56:34', '2019-02-14 15:56:34'),
('285c020fac9e2904c3d05042cc2b9b85190deb722aa0b02e7edd94aa5fde82293a600477d47a58e4', 129, 2, NULL, '[]', 0, '2018-10-03 10:51:45', '2018-10-03 10:51:45', '2018-10-18 10:51:45'),
('29c0eafbc8a7f5f78cd2f3568c9d90c44b22fdb3043abfd08001db2b853f66e6095a0db7bd1ea4f8', 117, 2, NULL, '[]', 0, '2019-01-24 11:04:48', '2019-01-24 11:04:48', '2019-02-08 11:04:48'),
('2ab5eef37174dd31fdf2657405ab9982ee3b9b0a9edf4942d5ac1b14692880fa9ef6625d255cfccb', 117, 2, NULL, '[]', 0, '2019-01-03 23:31:45', '2019-01-03 23:31:45', '2019-01-18 23:31:45'),
('2b2b61cf44abec5ea9d827f9fc2f091f1aa607f5ffc46be1f3b3e53dbb9981ebd51c806f63ee7328', 165, 2, NULL, '[]', 1, '2018-12-23 06:11:05', '2018-12-23 06:11:05', '2019-01-07 06:11:05'),
('2b72506f782e52b0fdf07e4641322c18a5abb9358274497bea603e43bce12ca68bef25495df2d95c', 117, 2, NULL, '[]', 0, '2019-01-14 21:15:47', '2019-01-14 21:15:47', '2019-01-29 21:15:47'),
('2d2e77870ab181f234b8f562ad3c744b0f51631de7810b92ed3aa74b577a3b7f5c822bb116adfe99', 165, 2, NULL, '[]', 0, '2019-01-18 07:11:06', '2019-01-18 07:11:06', '2019-02-02 07:11:06'),
('2d99384f57df32db77df3f209a92d299c643554755810f4c0882de4c89af6340bd08b2fe28319907', 125, 2, NULL, '[]', 0, '2018-10-31 13:29:15', '2018-10-31 13:29:15', '2018-11-15 13:29:15'),
('2dda42d2a8ee920d735421c3de2bcac7c3d318bfd10d092beef99614508d4bf5745cd95160f88eca', 170, 1, 'socialLogin', '[]', 0, '2019-01-06 10:57:06', '2019-01-06 10:57:06', '2029-01-06 10:57:06'),
('2e5210f82e7f2c116965be3f54c37939785bcff837af374571f57e13abf6c97e3f6437ef6ab66a23', 160, 2, NULL, '[]', 0, '2018-12-08 12:27:02', '2018-12-08 12:27:02', '2018-12-23 12:27:02'),
('30b0b8d10ff8a31a5d8332d46c8d0d82279e6cb7f534e1e7fccbf924aca2c11eee2699e8eb75fd56', 117, 2, NULL, '[]', 0, '2018-10-14 04:13:25', '2018-10-14 04:13:25', '2018-10-29 04:13:25'),
('3149acd5a4b277c1d4221a1fa4b16a991f2e9ed94ca3c391156e35425739b4f0677c444219f0abe1', 136, 2, NULL, '[]', 0, '2018-10-21 05:16:02', '2018-10-21 05:16:02', '2018-11-05 05:16:02'),
('327dc5cba8188c3dad115feef1b60e877f0e39f6c4a8b3ea04e5cf0856bee90f8230e643b2bfa3be', 117, 2, NULL, '[]', 0, '2018-12-20 06:19:51', '2018-12-20 06:19:51', '2019-01-04 06:19:51'),
('329610dfcaeb962fe3832db701b091549efffb68cb86f0ec28ceb58f4de07f701e5fdbde91d8b5ea', 117, 2, NULL, '[]', 0, '2018-11-05 16:21:53', '2018-11-05 16:21:53', '2018-11-20 16:21:53'),
('3302ca035fa5cf4311ef599f4102d385078731401cc40f82ad11654529ca1a9ad98e4fa04c385980', 158, 2, NULL, '[]', 0, '2018-12-14 16:50:37', '2018-12-14 16:50:37', '2018-12-29 16:50:37'),
('34872eda7c7a16216fbca50b777bc979ccbe7a71036456bf25c3a3d4c043805f2b402e5d5aaa62de', 114, 2, NULL, '[]', 0, '2018-09-26 13:10:29', '2018-09-26 13:10:29', '2018-10-11 13:10:29'),
('367d978e63e22f15aaeb0c1678d64df2439c40eff0843103a1a1356cf64af4072ad23db44c0bc10c', 161, 2, NULL, '[]', 0, '2018-12-09 15:55:33', '2018-12-09 15:55:33', '2018-12-24 15:55:33'),
('3699fd11292fbd91f9064ca2a3c1aca9d6ea806cc8dc78ff55a503989c2ed14b0381b0603683adcf', 151, 1, 'socialLogin', '[]', 0, '2018-11-25 11:25:48', '2018-11-25 11:25:48', '2028-11-25 11:25:48'),
('37778fb2c4d32cb0faf7dc3aecd8890d6fd28a89ad9d4905d3e0426a098b8606b66bb2a958cae7d0', 134, 2, NULL, '[]', 0, '2018-12-31 19:48:02', '2018-12-31 19:48:02', '2019-01-15 19:48:02'),
('384e665ad39d9702ce4c05e498077651587b7c909a351b0e358ab7c1b95b9a2083b27cb7888970e6', 154, 1, 'socialLogin', '[]', 0, '2018-11-30 17:50:10', '2018-11-30 17:50:10', '2028-11-30 17:50:10'),
('39839865ad46d42999e77c5d0f78bfaab068c57698a64cc6f56dd4c756cb49a8a0166fb65055e513', 155, 2, NULL, '[]', 0, '2018-11-30 22:23:41', '2018-11-30 22:23:41', '2018-12-15 22:23:41'),
('3d809dde8afeda6121530bbf93cafe1a127bbec9b7dc9c6096006efd768f0eb4000b61acb79d9b22', 152, 2, NULL, '[]', 0, '2018-11-27 07:35:39', '2018-11-27 07:35:39', '2018-12-12 07:35:39'),
('3e572ce8b2d086d5f04909d9cfbcb4a8104bc423c4f37905f808d37279e7ac22add1479383f0bc67', 131, 2, NULL, '[]', 0, '2018-11-05 10:48:41', '2018-11-05 10:48:41', '2018-11-20 10:48:41'),
('3f9b9f682126ff7d417920dddb9ed85425ddcd6aa28f32111b1c30fde048c11a3fc50f7f5de73eb8', 144, 2, NULL, '[]', 0, '2018-11-02 06:30:34', '2018-11-02 06:30:34', '2018-11-17 06:30:34'),
('415c1c632937b4a9c5ce1e5663d4ba994b24ce94cc40ee19d9824b5dd9e05090763ecc8cbef3a291', 155, 2, NULL, '[]', 0, '2018-12-01 09:54:53', '2018-12-01 09:54:53', '2018-12-16 09:54:53'),
('430ec1327baf203a732885ba549fa95e8c0b230f30bce4a4a40d2f0bd0512f9709f3564fa19bc0f2', 118, 2, NULL, '[]', 0, '2018-10-05 11:50:57', '2018-10-05 11:50:57', '2018-10-20 11:50:57'),
('47c339d2639e715538ccd5945f746227258df68d2845e8067065dc43eb2b8f7d95d29af75d8f37f7', 117, 2, NULL, '[]', 0, '2018-12-01 16:08:10', '2018-12-01 16:08:10', '2018-12-16 16:08:10'),
('47f642959de309e2e5d0099874907c1361f5b9eef286d3405c17f9641a524eca59ce1a2c0a50be09', 134, 2, NULL, '[]', 0, '2018-12-24 15:34:18', '2018-12-24 15:34:18', '2019-01-08 15:34:18'),
('48e67a929d2420229043fc2529e5946e1e9c8b162e2dd0c18007a4bfc0a75b6c83ac7757491f7067', 131, 2, NULL, '[]', 0, '2019-01-24 11:09:54', '2019-01-24 11:09:54', '2019-02-08 11:09:54'),
('4cecb086505e903674d431e7df0374f03d78b557fb063118a3fdad7cd89005e6d69b191be4f0e7fe', 167, 2, NULL, '[]', 1, '2019-01-20 05:01:21', '2019-01-20 05:01:21', '2019-02-04 05:01:21'),
('4d19ea288367dc920ffef11467516d11f44866912940f45cbbb25a5a2d3922dc3e4637d2c27f3d8b', 117, 2, NULL, '[]', 0, '2019-01-28 10:55:28', '2019-01-28 10:55:28', '2019-02-12 10:55:28'),
('4d7ebb99b3197c23e527483257f4039da24f5e04cb835684f0b8a75d0112703105cffced4c083c86', 134, 2, NULL, '[]', 1, '2018-10-31 07:31:05', '2018-10-31 07:31:05', '2018-11-15 07:31:05'),
('4e001f045da1c314a299cd9ff13367bd4e8a9af389e280ebbaf9da775c4561bcead51958078d36e5', 167, 2, NULL, '[]', 0, '2019-01-12 07:09:43', '2019-01-12 07:09:43', '2019-01-27 07:09:43'),
('4ecbb4777be42bbc4e9cb49ab20bf1c34c843840a71f4616c122940eda387276762bb10b1831c2b7', 174, 1, 'socialLogin', '[]', 0, '2019-01-08 20:28:12', '2019-01-08 20:28:12', '2029-01-08 20:28:12'),
('4faf2c0324f705d84aafe0323cef362d3482822fc2409aebe26955155a0c478706120542a5e100b4', 131, 1, 'socialLogin', '[]', 0, '2018-10-13 13:58:37', '2018-10-13 13:58:37', '2028-10-13 13:58:37'),
('51b7069812346dff4dbec4908bc5c5aa9ca20829ce8a2e467d9f75c788f620fc3fa8a7f580115ed1', 133, 2, NULL, '[]', 0, '2018-10-13 15:32:44', '2018-10-13 15:32:44', '2018-10-28 15:32:44'),
('520fa79ddbd4388c03138d4aa5aa00b97c27aacb11bcb3ca1affbd698d7910ffa98bade7d0caa6b7', 121, 2, NULL, '[]', 0, '2018-11-19 11:44:55', '2018-11-19 11:44:55', '2018-12-04 11:44:55'),
('53795d0c7d37dfa596b5cf17ccd24438f426139adf01fab5eb7d51c540747921b870144c06d4df57', 138, 2, NULL, '[]', 0, '2018-10-27 11:24:30', '2018-10-27 11:24:30', '2018-11-11 11:24:30'),
('542976acb17f3bb862d710ec782ebe76d851b6af4b25fd153edbb2a27de22f8b76381f110166eb37', 117, 2, NULL, '[]', 0, '2018-10-05 21:16:44', '2018-10-05 21:16:44', '2018-10-20 21:16:44'),
('552fb9bc7824c2dbdf3b10b81f265c6d865870208e9c942418c7e5d47dc248c836a5fcc2f316324b', 128, 2, NULL, '[]', 0, '2018-09-30 19:23:30', '2018-09-30 19:23:30', '2018-10-15 19:23:30'),
('56b3a9f4f8a4e0594d0a3367f0074581d3eaebbcf3dab872dab1dc527017009457f82324e0b8d3fd', 117, 2, NULL, '[]', 0, '2018-10-22 13:56:40', '2018-10-22 13:56:40', '2018-11-06 13:56:40'),
('59d66c68873fc09cd5ef48c0fa223feab0d95170d3f72580b4a7398570281bd11e0cc85980c1a9f5', 125, 2, NULL, '[]', 0, '2018-11-09 05:50:55', '2018-11-09 05:50:55', '2018-11-24 05:50:55'),
('5a36130106ac3043adacea5a6024ffe369991404caf1cd56bc400a1318b23d82d27f860928f0ec0a', 155, 2, NULL, '[]', 0, '2018-12-01 05:47:18', '2018-12-01 05:47:18', '2018-12-16 05:47:18'),
('5b99344a6ab63535f850c18f973aa360882348ac7135c1cb4a9bc375d13af55e5c364684b7aee69d', 131, 2, NULL, '[]', 0, '2018-11-05 08:25:26', '2018-11-05 08:25:26', '2018-11-20 08:25:26'),
('5c6a462080bb92b504b129b85acbd9df9322a7e57865264a7836b6557a637c5d52c45da067c4c96a', 114, 2, NULL, '[]', 0, '2018-09-26 13:09:21', '2018-09-26 13:09:21', '2018-10-11 13:09:21'),
('5cdf27c1e57ba9c2edc826b5e16d5f5ae76abb08e48d767383d51a53cf95d0218c7a8a63ac657de5', 117, 2, NULL, '[]', 0, '2019-01-24 11:56:40', '2019-01-24 11:56:40', '2019-02-08 11:56:40'),
('5dfd023c6a48d028adbbd28d3393c856f0fc3e4a3967da29448161940ca6c5f0052b247ea1ab7fdb', 117, 2, NULL, '[]', 0, '2019-01-03 22:20:24', '2019-01-03 22:20:24', '2019-01-18 22:20:24'),
('5ef4e5ab4596466bf2e2d497cccaef16cc133d4276cc2a14053d7f3b06400dd5141352b459f01d32', 167, 2, NULL, '[]', 0, '2019-01-20 05:01:21', '2019-01-20 05:01:21', '2019-02-04 05:01:21'),
('6029beec7c3e30eea5b214726ab8d8193fbcc0644cd7363c5c2507f1a0ca5ae6a2e680776b5070c8', 131, 2, NULL, '[]', 0, '2018-11-06 04:57:27', '2018-11-06 04:57:27', '2018-11-21 04:57:27'),
('62028763904d451a202e3b4454810ce3d75b360356f216de182ab41c38deadcf0076a57e903ed398', 117, 2, NULL, '[]', 0, '2018-12-03 13:12:00', '2018-12-03 13:12:00', '2018-12-18 13:12:00'),
('635707d566e06270140c2b6740e89df61f85b860725093b75338bbc8395908ccd295722e9e801617', 131, 2, NULL, '[]', 1, '2018-11-06 05:02:56', '2018-11-06 05:02:56', '2018-11-21 05:02:56'),
('6379eaf0c918a5dca6b7991c84fff9050d0e0d1807c03196674692b44ab7faa8b45210f8f690079b', 117, 2, NULL, '[]', 0, '2018-10-07 21:50:31', '2018-10-07 21:50:31', '2018-10-22 21:50:31'),
('63b15136e09d29050e72451fa47a4ed326516e475b34f2e27e8270341553679bfed66033f6c1357a', 117, 2, NULL, '[]', 0, '2019-01-13 10:26:22', '2019-01-13 10:26:22', '2019-01-28 10:26:22'),
('6579ec81a458db606dcc85e7cf1b0870252437e749dd0db196e7b9771f4c544796988c16f89b3865', 117, 2, NULL, '[]', 0, '2018-12-24 13:06:04', '2018-12-24 13:06:04', '2019-01-08 13:06:04'),
('65c68820a582919d70f302e60722db15ce2b54bc6061fb79eb7c7a3eb1c4a0d1d694591b87b77773', 118, 2, NULL, '[]', 0, '2018-11-13 07:31:47', '2018-11-13 07:31:47', '2018-11-28 07:31:47'),
('6691f2bba0f4c945c46916a5741861e9b8938c176e94a0056df1d7138c2a8f41003e27c8594a91bd', 175, 2, NULL, '[]', 0, '2019-01-09 14:28:34', '2019-01-09 14:28:34', '2019-01-24 14:28:34'),
('66dd85918962cc3b8844fa7f824c6bdb28e78a95371a671bd3521c9a13be0afab3dca5b0fa70be4a', 167, 2, NULL, '[]', 1, '2019-01-20 05:01:26', '2019-01-20 05:01:26', '2019-02-04 05:01:26'),
('68dafbecbc25f5bf9a15de7057e8e6b22ad827a7be2afd7937488f08bc7648cfb097ab8404a1aaad', 131, 2, NULL, '[]', 0, '2018-11-05 09:50:41', '2018-11-05 09:50:41', '2018-11-20 09:50:41'),
('6cf6039568e210b05105512f0e6c8e1e9c4d7b9471c2deb7b3dfdd98ea7608289e187cda81646a7a', 117, 2, NULL, '[]', 0, '2018-10-27 21:23:31', '2018-10-27 21:23:31', '2018-11-11 21:23:31'),
('6cfb33c86491a3d6430924aaeb2cfa74ef256bd596161b7d7a1a750522f1ffbde7d7d1e07bf61236', 117, 2, NULL, '[]', 0, '2018-12-18 10:52:43', '2018-12-18 10:52:43', '2019-01-02 10:52:43'),
('6d607dedc4b3e025cfffac663a94af001d87ab80c5ed3cb5d14b202c0a02ac0aadf003ac7986f13a', 131, 1, 'socialLogin', '[]', 0, '2018-10-13 13:01:49', '2018-10-13 13:01:49', '2028-10-13 13:01:49'),
('6ee01ea1273957f91471e5fb20daf804ffecd5653dcadec29e8f5d4943eeb4a63dcbb7842a63f734', 125, 2, NULL, '[]', 0, '2018-10-30 09:21:41', '2018-10-30 09:21:41', '2018-11-14 09:21:41'),
('6f17d011a4d40f21ad7c79d205b32f0d2c8dabc9cee7811b748996694360239e5f94169c1b655589', 117, 2, NULL, '[]', 0, '2019-01-13 10:26:16', '2019-01-13 10:26:16', '2019-01-28 10:26:16'),
('6f89466ce02e10f0ff8704649aef2b4f707c693c67f9809723a72ca1814e0a596dde95c7ad54f4e4', 125, 2, NULL, '[]', 0, '2018-09-26 15:49:23', '2018-09-26 15:49:23', '2018-10-11 15:49:23'),
('747ff215212da9cb4585972441bc948b42d59ed0ae3787d31493eef6107907feeb89296f80477c5f', 118, 2, NULL, '[]', 0, '2018-11-09 17:15:08', '2018-11-09 17:15:08', '2018-11-24 17:15:08'),
('7eaf125761ccf2f506fb8ad50fe6a330fc9f26637fa83324b6933e6020009118437f4fe007ff748b', 132, 2, NULL, '[]', 0, '2018-10-13 15:09:08', '2018-10-13 15:09:08', '2018-10-28 15:09:08'),
('7f8589e4e5e93c8cfb98ce8553dc0a5dac735a784891970a9e50b7b81ab7e4e1a5180ad4037376e8', 153, 2, NULL, '[]', 0, '2018-11-27 14:49:49', '2018-11-27 14:49:49', '2018-12-12 14:49:49'),
('8014c956725181a0c45248f44f026c69df005fc0177bed8a39b16dadd6173e9105aa5b71afe29e0c', 118, 2, NULL, '[]', 0, '2018-09-23 15:58:19', '2018-09-23 15:58:19', '2018-10-08 15:58:19'),
('80290e86761d167ab993eb51ba4475ce3c4a21edaa9d485febe6c0d0730620596b5368e67d743f10', 117, 2, NULL, '[]', 0, '2018-12-01 16:17:58', '2018-12-01 16:17:58', '2018-12-16 16:17:58'),
('80c3e48f27e93ed240aacd0a61899b4ac248454776c877c08b695cd845b515b1198937acf024c9c4', 164, 1, 'socialLogin', '[]', 0, '2019-01-29 00:05:22', '2019-01-29 00:05:22', '2029-01-29 00:05:22'),
('819f66dbd90c299d3410aa52998f161e3c73ce9c645627558480e9f58f819f09c9dd6ac971c40ed1', 150, 1, 'socialLogin', '[]', 0, '2018-11-25 04:20:37', '2018-11-25 04:20:37', '2028-11-25 04:20:37'),
('8479dd255027fbe0164302937549be5773636b2c1a933bd5862d5579c4acb328fc1ddad39b3c2906', 117, 2, NULL, '[]', 0, '2018-12-17 12:43:33', '2018-12-17 12:43:33', '2019-01-01 12:43:33'),
('85963c6cc4945cbc23ead88396b1a6ca4a99b3a17ecd7486a9570815dcab646aa15d5a29d640ca2d', 168, 2, NULL, '[]', 0, '2018-12-31 08:32:09', '2018-12-31 08:32:09', '2019-01-15 08:32:09'),
('87c8d30c11e0b2d9162b6c894868ae62de155295fb6f1ed39b0c0204482f156f28d9a3663d1be3ec', 111, 2, NULL, '[]', 0, '2018-09-22 14:30:02', '2018-09-22 14:30:02', '2018-10-07 14:30:02'),
('87d67abff265b535586bf8ae5dc922e748915ade6c6322f4533fe654391e4d47a54c6d19c899d85b', 118, 2, NULL, '[]', 0, '2018-09-24 19:21:45', '2018-09-24 19:21:45', '2018-10-09 19:21:45'),
('8848ae1fca3dec20c30095072320c00173886af3291cea4572455a1d2a0aba682d6c1c68cbab41d0', 164, 1, 'socialLogin', '[]', 0, '2018-12-26 09:25:17', '2018-12-26 09:25:17', '2028-12-26 09:25:17'),
('8c260f819ece5e31423879ce2d037bb18eccddf63f4d4d74021e2bce02ce73db59d035fd74c80184', 117, 2, NULL, '[]', 0, '2019-01-08 15:21:16', '2019-01-08 15:21:16', '2019-01-23 15:21:16'),
('8d8430e1e28195c8e25fbcaf11f5d16dce5a710d152a7cad658d0eebdbc04b5a9024ac8a27c7b9b7', 117, 2, NULL, '[]', 0, '2019-01-03 23:51:07', '2019-01-03 23:51:07', '2019-01-18 23:51:07'),
('8de19315e8e4f09b3f6be1f09b387880671707a3d9c3f94c1655c478e15873e17b63efea8a531cc0', 125, 2, NULL, '[]', 0, '2018-11-25 11:10:27', '2018-11-25 11:10:27', '2018-12-10 11:10:27'),
('8df741d89c1c4cde131debe862d26f262eef0edf1c49f0178863997f8c1810e05371949f1331fa49', 167, 2, NULL, '[]', 1, '2019-01-20 05:01:01', '2019-01-20 05:01:01', '2019-02-04 05:01:01'),
('8f21b8d70821390987a759821dfbfac54a521e15196d35e6133b8ef8fa8f95d51f6a4d724e9c74ce', 117, 2, NULL, '[]', 0, '2018-10-06 21:20:42', '2018-10-06 21:20:42', '2018-10-21 21:20:42'),
('8f6621fac8ab364a7f14ab8c647d7b5f84590d93babe47572cc622d02d69a4ec5de7363ebcf89db8', 125, 2, NULL, '[]', 0, '2018-09-30 14:00:03', '2018-09-30 14:00:03', '2018-10-15 14:00:03'),
('938874aa4143fde60e3633807dbb573c7ef70b7aa25d4140e3ee25b1c5df53430ccb31678c89d5d8', 121, 2, NULL, '[]', 0, '2018-09-25 03:50:04', '2018-09-25 03:50:04', '2018-10-10 03:50:04'),
('943184249dd8f29da14a0207074ec2b87243d21ec2954478eb1940c79c513bb1df9603099ebe05e6', 167, 2, NULL, '[]', 1, '2019-01-20 05:01:12', '2019-01-20 05:01:12', '2019-02-04 05:01:12'),
('95cef166c43b1a6833a030746f88fecfc4fe4317c9c6a31b5b2fb1f301b3fba9510fac22ea754834', 168, 2, NULL, '[]', 0, '2019-01-06 12:36:03', '2019-01-06 12:36:03', '2019-01-21 12:36:03'),
('968de2df0f7e5860e90dc3f7290b33ab9ffd3bf429c96038c260c462955528c4b6bdd6ee1d2a33ee', 164, 1, 'socialLogin', '[]', 0, '2018-12-24 13:06:49', '2018-12-24 13:06:49', '2028-12-24 13:06:49'),
('973556d1ba805e8c9d5fc7e9bb11fb6f8f82fc8028a162171650dc655ad24dc47b7d3c110f080083', 131, 2, NULL, '[]', 0, '2018-11-06 09:21:52', '2018-11-06 09:21:52', '2018-11-21 09:21:52'),
('976618e326d5c9fc8760af5e6cf2760f79d6f43889349e7601a01d969ef55cdac4632d4601056d17', 117, 2, NULL, '[]', 0, '2018-10-14 18:02:16', '2018-10-14 18:02:16', '2018-10-29 18:02:16'),
('98320c3e83130986db944b0050f85f2ebea4d69efd2963abfb62f1d006948f555bca763da8b2225e', 117, 2, NULL, '[]', 0, '2018-11-13 09:06:50', '2018-11-13 09:06:50', '2018-11-28 09:06:50'),
('9878bf6c29745c3a69e2130c4692191998a59b9a287ae9492d2d2339c85bbd073f9114b8aa3d0d42', 117, 2, NULL, '[]', 0, '2018-10-23 07:32:09', '2018-10-23 07:32:09', '2018-11-07 07:32:09'),
('9af738ec546e5996f983b1db9388f226e0590d98b07656ee1a3bd48e3faa29d5ce948c1fd49c6baf', 134, 2, NULL, '[]', 0, '2018-11-17 01:07:41', '2018-11-17 01:07:41', '2018-12-02 01:07:41'),
('9d56eaf10c9037194c70847835b950542048c810d4a00a47b238f0f628ce07b23ab66b9d2c5d353b', 125, 2, NULL, '[]', 0, '2018-11-27 14:46:05', '2018-11-27 14:46:05', '2018-12-12 14:46:05'),
('9dbb82ec880f2e776bae6422f73a945b492de898b029ec21a34554f91e6526f2bacc6f39de5e1d65', 117, 2, NULL, '[]', 0, '2019-01-24 11:56:42', '2019-01-24 11:56:42', '2019-02-08 11:56:42'),
('a275027084a9a1ae9d0ebe23ef85fd52e22c195ef67dfb1e84cb751151213b2ee4dff305292f0242', 117, 2, NULL, '[]', 1, '2018-11-28 15:22:34', '2018-11-28 15:22:34', '2018-12-13 15:22:34'),
('a2fbcafff078dcd02477201b9944916eedd602ba3171a56f78b445a225806e7b51aca3d36629ba73', 164, 2, NULL, '[]', 0, '2019-01-09 14:32:40', '2019-01-09 14:32:40', '2019-01-24 14:32:40'),
('a35777a04c515e9654b02f050f757138c0f246428c93721edbb93af11d08fc5dc5ca8d715badd2d3', 117, 2, NULL, '[]', 0, '2019-01-24 11:56:42', '2019-01-24 11:56:42', '2019-02-08 11:56:42'),
('a4aad1d1faafc6f8a32eb6b4940cbdb2f80eae1c53137a39e65771acb04dcfba739008b546a86a3d', 131, 2, NULL, '[]', 0, '2018-11-09 09:34:25', '2018-11-09 09:34:25', '2018-11-24 09:34:25'),
('a81a207f569f5acfdecbb6a48634dcf693e786eb6d3e56fd4d644b1c33d39b49d178a40d07887e52', 182, 2, NULL, '[]', 0, '2019-01-28 11:02:08', '2019-01-28 11:02:08', '2019-02-12 11:02:08'),
('a91635d1d16a05fdac3cc965cf82a6474f75be8eab6ff826bd7eecd1e21fc70db9038af72eeeae21', 117, 2, NULL, '[]', 0, '2018-09-28 00:01:17', '2018-09-28 00:01:17', '2018-10-13 00:01:17'),
('aaea502feff0c5772bf3753df2165e437a585c7e2acf3e147d44695ef8f3b4b20ffcdede4f2c04e3', 133, 2, NULL, '[]', 0, '2018-10-13 15:41:46', '2018-10-13 15:41:46', '2018-10-28 15:41:46'),
('acad8f4ccad31d964dd17fe2171d7ceac491328b26370324216c35d15b3dbd1ee7259f88439ea0bc', 131, 2, NULL, '[]', 0, '2018-11-05 11:59:36', '2018-11-05 11:59:36', '2018-11-20 11:59:36'),
('adb201bcc887ab3285e95914627e68468df60f747c346ce9771d10ca344b3ba1da1535a434c6cf6b', 117, 2, NULL, '[]', 0, '2019-01-08 12:43:26', '2019-01-08 12:43:26', '2019-01-23 12:43:26'),
('adb56701ba612c104bebbc4e0a7b5d1a92103f3520bcf8a9793f65bc565316c08decfb7a2f775f81', 118, 2, NULL, '[]', 1, '2018-10-05 14:17:30', '2018-10-05 14:17:30', '2018-10-20 14:17:30'),
('ae3637d315105845d99c181cfc0685b106df41504878913f9c58df26d62a26189c21549838be8387', 131, 2, NULL, '[]', 0, '2018-11-05 07:10:43', '2018-11-05 07:10:43', '2018-11-20 07:10:43'),
('ae995e5b5640de7302384b94e417dc45b5bc5e5f80e29849e538e86db44556bbe80ee935df19a459', 118, 2, NULL, '[]', 0, '2018-09-24 19:32:01', '2018-09-24 19:32:01', '2018-10-09 19:32:01'),
('b1879e8b98a05bd57f1c3c6a23222b20637bda47e4eecce618cb83c8b1deac63252f3fb1933ad6aa', 117, 2, NULL, '[]', 0, '2019-01-14 07:21:24', '2019-01-14 07:21:24', '2019-01-29 07:21:24'),
('b28a971f878c2871c0707b7290557f408aa69d9f96670672f5dca0b4ff2c08860cce00601478cc07', 170, 1, 'socialLogin', '[]', 0, '2019-01-08 05:33:45', '2019-01-08 05:33:45', '2029-01-08 05:33:45'),
('b5aa9e5e8bdb48352424763a10fba5c70c60b73a0621cdbba4940a3a27699eebbe00ce758c8aa85c', 114, 2, NULL, '[]', 0, '2018-09-26 09:07:09', '2018-09-26 09:07:09', '2018-10-11 09:07:09'),
('b6b0568c61611c5ca3eb2d97b6acd66b4ce94b1c72ac105704c708c18cd85e11296aaac5f7d2cfeb', 170, 1, 'socialLogin', '[]', 0, '2019-01-06 10:52:51', '2019-01-06 10:52:51', '2029-01-06 10:52:51'),
('b737a97409122e21dae503929071a7ac0f39cebb18851782edbf15b67d4995706d7ac3b603e44d71', 131, 2, NULL, '[]', 0, '2018-11-06 07:44:00', '2018-11-06 07:44:00', '2018-11-21 07:44:00'),
('bc76d6aacb4103b86487bbb371a09222894975e5b8bd177efe6012de02b531d35424969718af8f0c', 119, 2, NULL, '[]', 0, '2018-09-24 10:10:08', '2018-09-24 10:10:08', '2018-10-09 10:10:08'),
('bca95f7a90da0c4d61b48125ed0ef845ee23f001d86ebd06fbfcfc4b665fc65571a11eb2f6579e69', 167, 2, NULL, '[]', 1, '2019-01-12 07:09:43', '2019-01-12 07:09:43', '2019-01-27 07:09:43'),
('bdad2e018eaa1c5b2a166afe208f6a2056f827f0b0edf4e9136607e3dfdc2ec2c70a6c527236e5f4', 160, 2, NULL, '[]', 0, '2018-12-08 12:31:59', '2018-12-08 12:31:59', '2018-12-23 12:31:59'),
('beaf7cd1e8fe19ac37c28f5664edf1a73767832e3e704b454f1c1074ff0fafb783d0843eb8e34069', 158, 2, NULL, '[]', 0, '2018-12-02 20:29:49', '2018-12-02 20:29:49', '2018-12-17 20:29:49'),
('bf2e7ce0022e4de0bb216533183c0da326b3231dca9b4b986413cae90f97eb526792d46d4c396e9d', 159, 2, NULL, '[]', 0, '2018-12-05 18:25:06', '2018-12-05 18:25:06', '2018-12-20 18:25:06'),
('c0bc180b2258145b5ba6e7bb095de5a729a71fa77df6234f2696e1d00f859d2b7244916695ae4f4c', 117, 2, NULL, '[]', 0, '2019-01-24 11:56:42', '2019-01-24 11:56:42', '2019-02-08 11:56:42'),
('c1e70797edc2e073eca463052dc0df98138ce8aa62f091f1d045e2c1b3be805fadc743fb88b26c0a', 170, 1, 'socialLogin', '[]', 0, '2019-01-14 06:30:14', '2019-01-14 06:30:14', '2029-01-14 06:30:14'),
('c22f606eec836c3a129b5425e37ead276341e109bfa882e3f44fe19b9d1bf3a4cc3585b672cbbb67', 130, 2, NULL, '[]', 0, '2018-10-08 19:33:39', '2018-10-08 19:33:39', '2018-10-23 19:33:39'),
('c2ff1a571ff2342673b65c5a50a64c5d144a1b5dc15bf449aca0d785685ae01bd93140c2287f972f', 117, 2, NULL, '[]', 0, '2018-12-05 12:39:03', '2018-12-05 12:39:03', '2018-12-20 12:39:03'),
('c5e2df3e167dde0a6785b86c468a5bf1cb8f02d51ac08200475ce6d337ebc547ae0a28adc80b5477', 142, 2, NULL, '[]', 0, '2018-10-31 08:24:27', '2018-10-31 08:24:27', '2018-11-15 08:24:27'),
('c7e82e6060acc24f15589668c65ad4f75dc00b54358ab3c67041c4a2f22d35e361692db16e7810ec', 117, 2, NULL, '[]', 0, '2019-01-06 09:29:56', '2019-01-06 09:29:56', '2019-01-21 09:29:56'),
('c8e76301a35610f578edfc8d8555e8bc736d4837a6456743a9881415c3ecab7445aaa97ce420e472', 117, 2, NULL, '[]', 0, '2018-12-20 07:16:31', '2018-12-20 07:16:31', '2019-01-04 07:16:31'),
('ca1f641893c1e972b5dea7864b92e2996621b83888a215f78e8005cfb80e62417d80917be4839ba1', 118, 2, NULL, '[]', 0, '2018-11-13 07:38:45', '2018-11-13 07:38:45', '2018-11-28 07:38:45'),
('cb036983d8fef56c780644310182f24016c81c00b04f0cd218f21faa426bcd254c59d098e5aace74', 111, 2, NULL, '[]', 0, '2018-09-22 14:29:22', '2018-09-22 14:29:22', '2018-10-07 14:29:22'),
('cbae4f3e18dabde8a4118652e6a9799c9ddebf35815dcfabd9c1cc8af015437ffc08a68e74e1ad79', 147, 2, NULL, '[]', 0, '2018-11-06 14:41:52', '2018-11-06 14:41:52', '2018-11-21 14:41:52'),
('ccd2dd561293909d4521f97eb02ba3c6d4786893c0086ccb44e7c2ac8c7acf039f7c138019d17d85', 149, 2, NULL, '[]', 0, '2018-11-17 07:15:42', '2018-11-17 07:15:42', '2018-12-02 07:15:42'),
('cd771b3960dc4b6f9c09840a41cf2247b694c8e86d0a9eafaaa8bdc1a559986ca3719a0fe11052e1', 117, 2, NULL, '[]', 0, '2019-01-24 11:56:42', '2019-01-24 11:56:42', '2019-02-08 11:56:42'),
('cdde2589a6445e11d2fec91bc65b93d2ef14a10b70210f5e7957ec001c05ec5cf2fa7a052698b60e', 172, 2, NULL, '[]', 0, '2019-01-08 14:10:48', '2019-01-08 14:10:48', '2019-01-23 14:10:48'),
('ce22f75edec8cc886658ded7b50145dec552b15ce37deb3c9374d1318c068fe0829a0f818d570bfc', 117, 2, NULL, '[]', 0, '2018-10-05 12:14:36', '2018-10-05 12:14:36', '2018-10-20 12:14:36'),
('ceb06cc2e73d2fa17501323038076b0a23900d57b4620cef26bb9c0fb2235e1fdc3598520e3c6d1d', 118, 2, NULL, '[]', 0, '2018-09-24 18:48:32', '2018-09-24 18:48:32', '2018-10-09 18:48:32'),
('cf9ee37cece2195a522e4802a20896056ca577e951a373ebed92e4d01c1821ffd3cc28d55cabfbbf', 117, 2, NULL, '[]', 0, '2018-12-02 11:44:44', '2018-12-02 11:44:44', '2018-12-17 11:44:44'),
('d032bffc44fcecf6f77ce27f22b02e5e64fd6ff786825f08c3d2618ac6f7d7c1f254862f9a5c1ca5', 117, 2, NULL, '[]', 0, '2019-01-03 23:12:09', '2019-01-03 23:12:09', '2019-01-18 23:12:09'),
('d1b729901bab27c73ca29ae29965767e0ac5c4976a514ba612be9dca6b03cf59bb3c32dddaf6fa90', 117, 2, NULL, '[]', 0, '2018-10-07 20:29:07', '2018-10-07 20:29:07', '2018-10-22 20:29:07'),
('d1f641d00813b77d3e86663b38a6426730c05fa1da6b81d92daef6d0b7cac308123e922382f01ea2', 182, 2, NULL, '[]', 0, '2019-01-28 10:52:50', '2019-01-28 10:52:50', '2019-02-12 10:52:50'),
('d23e0d2c61b55bb8cccdca87e114edf5654196a2c6b1e05b0e88456705a6874925df24e24567ade0', 167, 2, NULL, '[]', 0, '2019-01-12 07:09:43', '2019-01-12 07:09:43', '2019-01-27 07:09:43'),
('d34d44f4107c3739dfd5aa8a3c2e589312579b521a756024a674bac634c28203fe58a1d34c669e83', 125, 2, NULL, '[]', 0, '2018-11-25 10:51:55', '2018-11-25 10:51:55', '2018-12-10 10:51:55'),
('d7463ad376c0b76cbc0687e366e14f43caba4115931c3fbd13d0601dac1e5833738bbcd6fbdcbc4e', 115, 2, NULL, '[]', 0, '2018-09-22 15:41:43', '2018-09-22 15:41:43', '2018-10-07 15:41:43'),
('daa11272224623e0bd04a7eb61681d128098e6d6b24a0ce42e101d0cc2a9e2a7def960f701f65623', 117, 2, NULL, '[]', 0, '2018-11-28 19:01:14', '2018-11-28 19:01:14', '2018-12-13 19:01:14'),
('dbec5d2faa014974cd6375b0248025d997690282de49f172c68b801f181ab90847c556a93e68a87f', 123, 1, 'socialLogin', '[]', 0, '2018-10-07 18:19:08', '2018-10-07 18:19:08', '2028-10-07 18:19:08'),
('dd5ffdd168c77837d1e22024a3e21e5cbfdeeb59fbf4ea4ae93a0f204b68e887fc5c17329cc7f0b2', 117, 2, NULL, '[]', 0, '2018-11-09 21:52:56', '2018-11-09 21:52:56', '2018-11-24 21:52:56'),
('dd748e0f21994b446cfa70168e1caaeed0d6fde1d431bad15736ee480586dece0f8a9c40e8d61160', 117, 2, NULL, '[]', 0, '2018-10-22 08:53:26', '2018-10-22 08:53:26', '2018-11-06 08:53:26'),
('dd9c6c13ae93043b47616f368e7ef9fb4aa9c4f4c2028f376fa2e1fc6e84367e7744917800795d29', 178, 2, NULL, '[]', 0, '2019-01-19 05:54:29', '2019-01-19 05:54:29', '2019-02-03 05:54:29'),
('ddf16ea7f4f40baeb749f0e2f9255960b40429f606d39f73797b48a09e6216f56dc0cf547a1e3304', 167, 2, NULL, '[]', 1, '2019-01-20 05:01:06', '2019-01-20 05:01:06', '2019-02-04 05:01:06'),
('dfd89ee6f5cfba1632ec8c40be52ff15e0e62c79c33b30f4febf9d0df42515cc7f3b950724b0a2d6', 156, 2, NULL, '[]', 0, '2018-12-01 15:31:44', '2018-12-01 15:31:44', '2018-12-16 15:31:44'),
('dffd9cedd79bdf7b6fbce6d2191b2dbabad6bcc697abd4d016834017f0013ab566cb01a5ac28ecb9', 125, 2, NULL, '[]', 0, '2019-01-09 16:30:09', '2019-01-09 16:30:09', '2019-01-24 16:30:09'),
('e084c4698902c2d49353fde51f25a2986f39553531e54bf8c165fc6f2679dcddbde84b82ba1bff3d', 117, 2, NULL, '[]', 0, '2018-12-18 20:58:13', '2018-12-18 20:58:13', '2019-01-02 20:58:13'),
('e0bbb69ef1aef9a94d097c27743874e67cc25e6ed13d61cd0de8bde2e6833277a2f643a26e6d6cd8', 173, 2, NULL, '[]', 0, '2019-01-08 15:29:48', '2019-01-08 15:29:48', '2019-01-23 15:29:48'),
('e270b98d9cf75b9817348a2e36bf2ea49423ce921378bf81b4e9e2f04ff6d9f398325d8643fdde00', 175, 2, NULL, '[]', 0, '2019-01-09 14:25:09', '2019-01-09 14:25:09', '2019-01-24 14:25:09'),
('e57c0c000d33603ee37379cc13d53f7486768f1451738f7c03b8c0cc51b7ae2e6b801ae080ecfccd', 117, 2, NULL, '[]', 0, '2018-09-27 23:43:47', '2018-09-27 23:43:47', '2018-10-12 23:43:47'),
('e598117d0fcd0c4bc7157d40afba4718b1bc96dd13f6d751a75d00a6731bccad769b3891fc54422b', 117, 2, NULL, '[]', 0, '2018-12-20 06:32:37', '2018-12-20 06:32:37', '2019-01-04 06:32:37'),
('e5f14a49f5dad3cb90ab6d83e6525d3b334b7865f2b4373a5653097b5f828eed503934ab9eedd500', 111, 2, NULL, '[]', 0, '2018-09-22 14:38:06', '2018-09-22 14:38:06', '2018-10-07 14:38:06'),
('e78cf5417011bb02da74f08284c90d73a3e096f7aaf1581f346cd8521bc732ecde09b0e282dff64f', 176, 2, NULL, '[]', 0, '2019-01-15 00:51:42', '2019-01-15 00:51:42', '2019-01-30 00:51:42'),
('e807e65143435da1d0babfa3c0d76d1f19cf962066d83b31718d46425c9078e00b0e261b7113f8a2', 160, 2, NULL, '[]', 0, '2018-12-08 06:53:33', '2018-12-08 06:53:33', '2018-12-23 06:53:33'),
('eb79a3acbd6bf241298681872be226c1be04b496d5506b4c1eb9b996494b2bd11b6e5aac7434f698', 117, 2, NULL, '[]', 0, '2019-01-08 12:53:49', '2019-01-08 12:53:49', '2019-01-23 12:53:49'),
('ebe55ee9441e110ed438bde953ccc754dbc7bc5e8c14ca842f403afee920f7e1ce206354f9ba639a', 164, 2, NULL, '[]', 0, '2019-01-09 14:31:45', '2019-01-09 14:31:45', '2019-01-24 14:31:45'),
('f088b60b32bf837d5b28360f153942aac468592e12e6f384b48a994b2d9ffa0f7594ed1f06563527', 167, 2, NULL, '[]', 0, '2019-01-20 05:01:29', '2019-01-20 05:01:29', '2019-02-04 05:01:29'),
('f2e5363d7e61ae701de3df675d5224085ffd16de898320405aa49f10b29b6bce88ab78073ed6f7d6', 184, 1, 'socialLogin', '[]', 0, '2019-01-31 21:30:27', '2019-01-31 21:30:27', '2029-01-31 21:30:27'),
('f4d8b5d20c41849e565f108eacb2a85c0f0314a8e0ff7c16393a1925dca69ab9e8018bd0a7b950fa', 131, 2, NULL, '[]', 0, '2018-11-21 08:27:27', '2018-11-21 08:27:27', '2018-12-06 08:27:27'),
('f4f88debe84d59c64b921110b3bb02bb45a37a55592484e84f72e92f0a25e3bdeab9e8b5fa9a1a35', 173, 2, NULL, '[]', 0, '2019-01-08 15:42:32', '2019-01-08 15:42:32', '2019-01-23 15:42:32'),
('f64a017c29324e996b1e3b3e7d28dfd5f5946cb49b3b1b055404ba00459f1eae3a81e812d964bc00', 155, 2, NULL, '[]', 0, '2018-12-01 15:15:33', '2018-12-01 15:15:33', '2018-12-16 15:15:33'),
('f69ede4fec9ba6cf4bc6226eb022316d51916a909c36f03473348285976372bb25d2af79531b77c7', 125, 2, NULL, '[]', 0, '2018-11-27 14:32:09', '2018-11-27 14:32:09', '2018-12-12 14:32:09'),
('f740f4a7e962cca442787e90577ed563aa3bda568f32daf90039a5789514ca9b94811f56dc830a42', 162, 2, NULL, '[]', 0, '2018-12-11 14:26:06', '2018-12-11 14:26:06', '2018-12-26 14:26:06'),
('f98beab119a1f47316bea59dbaf19b13d02508a6e019e81f94494a5f17d45f4b1af64a7fd73a8aaf', 125, 2, NULL, '[]', 0, '2019-01-17 13:28:31', '2019-01-17 13:28:31', '2019-02-01 13:28:31'),
('fbb28f28a7150e29269812f468840dfe0e8bcd4d341915a650a7c158ac8e4d1ba7178f2a83f0e0c7', 117, 2, NULL, '[]', 1, '2018-10-05 13:07:51', '2018-10-05 13:07:51', '2018-10-20 13:07:51'),
('fbe5f1389dc444e8ee6ba29dd19d1a17b3474acceb69c0c815e7997ed40a4eb272092eb5b5ac8b68', 167, 2, NULL, '[]', 0, '2019-01-20 05:01:21', '2019-01-20 05:01:21', '2019-02-04 05:01:21'),
('fd4fa4547f13dde79b34ec3de397f5ceac9ff95c3cd7dde6cd1d74a0f8839cb2dca79193ef94c483', 117, 2, NULL, '[]', 0, '2018-12-01 15:26:20', '2018-12-01 15:26:20', '2018-12-16 15:26:20'),
('fe3d6588de3c4df6277c01a36ea7c10892c6e5af13481549a003d582f0ba4a7d3ec790068b2391d3', 117, 2, NULL, '[]', 0, '2019-01-24 11:58:06', '2019-01-24 11:58:06', '2019-02-08 11:58:06'),
('fe450bfbe881d40c76da130f28e7ea038ec3baa203889390134ea182388c36fd3a92681f851334a1', 117, 2, NULL, '[]', 0, '2018-10-07 20:51:41', '2018-10-07 20:51:41', '2018-10-22 20:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Borakh Personal Access Client', 'IDQr8Iqbym1b3L8IXKCHsiL2m0aSRAYh0jENcwlp', 'http://localhost', 1, 0, 0, '2018-09-22 14:19:13', '2018-09-22 14:19:13'),
(2, NULL, 'Borakh Password Grant Client', '8bc8PVqMI5Yhjv6Tsi87gJ5pqQw0JgirSkx0F9SG', 'http://localhost', 0, 1, 0, '2018-09-22 14:19:13', '2018-09-22 14:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-09-22 14:19:13', '2018-09-22 14:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('00d88abb80cb4fd7a7029cf578c2e614cff8468d4f9fe59c02ee1c261974427b5ec1c76218efb634', 'dffd9cedd79bdf7b6fbce6d2191b2dbabad6bcc697abd4d016834017f0013ab566cb01a5ac28ecb9', 0, '2019-04-09 16:30:09'),
('0173d7f26a0db6957179b3c3ff73ad0d9524901a283426efff6f67f987360ed666209de4ecd15fb8', '3149acd5a4b277c1d4221a1fa4b16a991f2e9ed94ca3c391156e35425739b4f0677c444219f0abe1', 0, '2019-01-19 05:16:02'),
('017e13ee4173e694bc9d409be444c3fc1d90ffe6f20c4dccc17ec3d861b38722d935c55bcafa44aa', 'ceb06cc2e73d2fa17501323038076b0a23900d57b4620cef26bb9c0fb2235e1fdc3598520e3c6d1d', 0, '2018-12-23 18:48:32'),
('043e60d44e33709a77146b970925c328fd7439e7619105cbf1c166b5a9ed320943114b13fb7c44fd', '95cef166c43b1a6833a030746f88fecfc4fe4317c9c6a31b5b2fb1f301b3fba9510fac22ea754834', 0, '2019-04-06 12:36:03'),
('04d7cad31666aea50449e4427d7f0379cf48c660f51077b84ad7f95b67d3ce2e23b233811d4177ff', '1dc76b91f9e69e2d20f74837296cc63a1500bc06237ee1f8acae0f33e648ec508ce2d4f4b15992c7', 0, '2018-12-27 04:33:39'),
('051ca00e78e090a3e69e8f38d7027cba7e26c571e50e173a2f3c678da889ee9b78722f2762b9e086', 'adb56701ba612c104bebbc4e0a7b5d1a92103f3520bcf8a9793f65bc565316c08decfb7a2f775f81', 1, '2019-01-03 14:17:30'),
('0827efb037130c68e293ffb69b80555185e79712af15408b1387b123a6ae7456e8b73d1b3c5bf337', '0177431d6cbf8c0966d747016a51f361a6880eff86198395a674b452a150e81a2ec8675d9fcde845', 0, '2019-01-05 21:45:40'),
('084dc21f5fad8ade50670625793f76e68c27f3b744b8efc61d14b4d640d34ea73d0a45d8e5ef1e0d', '62028763904d451a202e3b4454810ce3d75b360356f216de182ab41c38deadcf0076a57e903ed398', 0, '2019-03-03 13:12:00'),
('09ec016c86e1d370a710cfd47fc46df373fe274eb47f5aee1956606c75699b1d21d0f27812905937', '66dd85918962cc3b8844fa7f824c6bdb28e78a95371a671bd3521c9a13be0afab3dca5b0fa70be4a', 1, '2019-04-20 05:01:26'),
('0c97358436416925403da1da6589afce8ae5948776563567c75991063b66d25e7ddf86b065e500ce', '943184249dd8f29da14a0207074ec2b87243d21ec2954478eb1940c79c513bb1df9603099ebe05e6', 1, '2019-04-20 05:01:12'),
('0cbdee7a0f285b45de1c5204e5197f767bbe33a8809eedafac17a05ee2c14deb2d4e74e0362068a2', 'ddf16ea7f4f40baeb749f0e2f9255960b40429f606d39f73797b48a09e6216f56dc0cf547a1e3304', 1, '2019-04-20 05:01:06'),
('0d078785a3173e589161b60abff320995a34c54ddedce057fab3ec78e780405ce074a8b2b3aebd92', '430ec1327baf203a732885ba549fa95e8c0b230f30bce4a4a40d2f0bd0512f9709f3564fa19bc0f2', 0, '2019-01-03 11:50:57'),
('0f7e493747f1c4c665dd206be30ab3fb7ec8d96ea7e3d91f340a4854d26e86e8465bc27190c2151d', 'c2ff1a571ff2342673b65c5a50a64c5d144a1b5dc15bf449aca0d785685ae01bd93140c2287f972f', 0, '2019-03-05 12:39:03'),
('0f913449e141fb0f8c4f332c001efe1b7c82c793b18a09db4f7fa72186f2a37a4811a6a234c5027b', '51b7069812346dff4dbec4908bc5c5aa9ca20829ce8a2e467d9f75c788f620fc3fa8a7f580115ed1', 0, '2019-01-11 15:32:44'),
('119a7224450f22ada21513b84dc2a8a794d0b72f8598bd7339f97886013546d774d6aecf9bc01f4f', 'f64a017c29324e996b1e3b3e7d28dfd5f5946cb49b3b1b055404ba00459f1eae3a81e812d964bc00', 0, '2019-03-01 15:15:33'),
('11f5e375c7a75af137b3d992c64988e3b78b339a663012ab20ecaa589eb1b1d623127e59d81f8334', '8014c956725181a0c45248f44f026c69df005fc0177bed8a39b16dadd6173e9105aa5b71afe29e0c', 0, '2018-12-22 15:58:19'),
('140f6ae274a6291535ee5bb708e35dd2ab6c79e590680247a80d4f4ba0eb43306f1cde45d6fd1a35', '5dfd023c6a48d028adbbd28d3393c856f0fc3e4a3967da29448161940ca6c5f0052b247ea1ab7fdb', 0, '2019-04-03 22:20:24'),
('14efc3e01440138b7437636bea35d3579c9b937bc03a47c39a86efb60a62712f2c596f40c0e92b0f', '0eb48113ff144de6ee464bde56276213fb7dec9e58ff223eaedc5fb5c388ad71cfa2876d640db5b7', 0, '2019-02-03 10:04:29'),
('15bf4511da2f6b1c8d5fafcc4c84052665a4f941ecb984f98fac276e2d82842f1d10868ecf47b0ff', '4e001f045da1c314a299cd9ff13367bd4e8a9af389e280ebbaf9da775c4561bcead51958078d36e5', 0, '2019-04-12 07:09:43'),
('162aadbe0dcec5d346d3405970a0e0e4355d9bb7913a62f06c8b34ccca7d2d46a07baaf4686dba67', '80290e86761d167ab993eb51ba4475ce3c4a21edaa9d485febe6c0d0730620596b5368e67d743f10', 0, '2019-03-01 16:17:58'),
('1dfd40207ebd04674ce01c3eddbaab31368635834972230a2e472ae496161f1aeae044f94568dcbb', 'bf2e7ce0022e4de0bb216533183c0da326b3231dca9b4b986413cae90f97eb526792d46d4c396e9d', 0, '2019-03-05 18:25:06'),
('1eca36eff14879f6d24318fcb6b877d468d37517f8d5d6beaa5d73d6742ea96d59a7f7b77ae41b47', 'a4aad1d1faafc6f8a32eb6b4940cbdb2f80eae1c53137a39e65771acb04dcfba739008b546a86a3d', 0, '2019-02-07 09:34:25'),
('1eddee46e9a74fbc3648f465882a39a2276f8bcd44775681e60848fb177a449df7271bb5d51ada32', 'c7e82e6060acc24f15589668c65ad4f75dc00b54358ab3c67041c4a2f22d35e361692db16e7810ec', 0, '2019-04-06 09:29:56'),
('225af87bbaccdc651dda11a4b0416a4b051b133397a040edeae72bb37de9926f008bca5817214f07', 'b737a97409122e21dae503929071a7ac0f39cebb18851782edbf15b67d4995706d7ac3b603e44d71', 0, '2019-02-04 07:44:00'),
('22e1b07e6358ffa6b48c106cc7b442d5b60bc3826b0e1c9476957055424aa5da1bb9274e37a4927d', 'a2fbcafff078dcd02477201b9944916eedd602ba3171a56f78b445a225806e7b51aca3d36629ba73', 0, '2019-04-09 14:32:40'),
('2306cd4ade01be5e1fc08ecee792ce6bdcbe09c26c2f1ea2bde5a81e3ee85649a28060bdd82b93b3', '2b72506f782e52b0fdf07e4641322c18a5abb9358274497bea603e43bce12ca68bef25495df2d95c', 0, '2019-04-14 21:15:47'),
('24bff5980a3c725f624bda5ce22b388095ba370b744ee59570330f3450ace33ef64d382248cf5564', '8f21b8d70821390987a759821dfbfac54a521e15196d35e6133b8ef8fa8f95d51f6a4d724e9c74ce', 0, '2019-01-04 21:20:42'),
('27956a3e00dd39fb2b8a266ee3903d680897387bfbeae38feccc1cba7e3f3c7e2a7e2c44a017614d', '30b0b8d10ff8a31a5d8332d46c8d0d82279e6cb7f534e1e7fccbf924aca2c11eee2699e8eb75fd56', 0, '2019-01-12 04:13:25'),
('285d08cb9784773f2a11f9c330bf80d08746a0ebb8c782834c5a3dc20219fc2f09828e7e09d53077', '18ca51ccbcf6fb71fcfb9f7e02041f22350ed91668e677064d12469014525aa68b0a1fbc3226e628', 0, '2018-12-23 18:27:40'),
('2959d710bf8822bbd763feef11d764734a055828a76f11da01717754f2a6b33ab75f4fbbd14d0322', '3f9b9f682126ff7d417920dddb9ed85425ddcd6aa28f32111b1c30fde048c11a3fc50f7f5de73eb8', 0, '2019-01-31 06:30:34'),
('29fc166d3586e6849f36db3ca0ee9a78a7a3cd670d8f1ad5ed99b18325f4842fd68747a44626c55b', '04b3a774e4cee7e261df8e1f9dc66813241d21aae03ef25cabe943e8e27e5d490aed0d81e969ad94', 0, '2019-02-19 06:30:19'),
('2a5cfa45cc2e824faf8c9349a44109f9640f63101fa98feb4d6a8a446479e00b9c850cc7cdf7cf67', '3d809dde8afeda6121530bbf93cafe1a127bbec9b7dc9c6096006efd768f0eb4000b61acb79d9b22', 0, '2019-02-25 07:35:39'),
('2c004ef80dbe23aaaa7f9b9f19a773eaf987d785d43cf4ab5d89ee443f74274a798fe741f0bc635d', 'c22f606eec836c3a129b5425e37ead276341e109bfa882e3f44fe19b9d1bf3a4cc3585b672cbbb67', 0, '2019-01-06 19:33:39'),
('2fbcd7dc66ff42f59b8d413653a82f0584847ee9c51a8c20aaeb789e0859891240a9f25107a4cadd', '552fb9bc7824c2dbdf3b10b81f265c6d865870208e9c942418c7e5d47dc248c836a5fcc2f316324b', 0, '2018-12-29 19:23:30'),
('304fc67277332fee258e0322f2a2680a3c0edc97a7b984e72800fb9b3c5d2c78b4c3aa94f36b4acc', '2508b59075a2065312df090b81684dae464cf4acbb86aa6213dfb31c6e31de5a793f5e9485f15880', 0, '2019-04-30 15:56:34'),
('31e001c969f08e526f2a691e01999f7359543ea330cf065a12ca68af75bc889cbd8e8c88dbf9482d', '37778fb2c4d32cb0faf7dc3aecd8890d6fd28a89ad9d4905d3e0426a098b8606b66bb2a958cae7d0', 0, '2019-03-31 19:48:02'),
('32595d869d1ace24736fc17f8f62f70e55037a7062efbc799cd9b369adc643e75642a8adcf9216f2', 'dd9c6c13ae93043b47616f368e7ef9fb4aa9c4f4c2028f376fa2e1fc6e84367e7744917800795d29', 0, '2019-04-19 05:54:29'),
('327a2f347cd98da62c53761156fa3dd4db6d04709d0448babe5a6fa5d06e4cb434b3d5314e863a31', '520fa79ddbd4388c03138d4aa5aa00b97c27aacb11bcb3ca1affbd698d7910ffa98bade7d0caa6b7', 0, '2019-02-17 11:44:55'),
('36cf55fc4742993acdb07612a4c0abc86896e908d76721197f09f3e2683a91f7da230c5e04476922', 'fe450bfbe881d40c76da130f28e7ea038ec3baa203889390134ea182388c36fd3a92681f851334a1', 0, '2019-01-05 20:51:41'),
('36d868d403241fa65b456b37b9eede7fdc62f2168f0749a8bb93af9368e176714cdbd3c92b32ac7b', '5c6a462080bb92b504b129b85acbd9df9322a7e57865264a7836b6557a637c5d52c45da067c4c96a', 0, '2018-12-25 13:09:21'),
('385b2d3325b7e9963a3410efe388a32a9b755a366578f4ce6daa186f393afba7b3059a7bbea23de1', 'fbb28f28a7150e29269812f468840dfe0e8bcd4d341915a650a7c158ac8e4d1ba7178f2a83f0e0c7', 1, '2019-01-03 13:07:51'),
('38a9ef12c4f13ae98c2e2dafdc8faa7abb195554de1844167028e53791631ad4a47522335f6e98b9', '47c339d2639e715538ccd5945f746227258df68d2845e8067065dc43eb2b8f7d95d29af75d8f37f7', 0, '2019-03-01 16:08:10'),
('3a0169c885f1cf5211348ca069aa1b33c4b73090755aff5c0de259a921a5720365cad705a8239c35', '6029beec7c3e30eea5b214726ab8d8193fbcc0644cd7363c5c2507f1a0ca5ae6a2e680776b5070c8', 0, '2019-02-04 04:57:27'),
('3af550a09d26c23f8c9341f7d2a387247b873d0d11ca130b366b2c387adb1c4dcae6c6387f998315', '4d19ea288367dc920ffef11467516d11f44866912940f45cbbb25a5a2d3922dc3e4637d2c27f3d8b', 0, '2019-04-28 10:55:28'),
('3b28df1907b3296a7b6ac53da2623a51d8def9c2318512bf4deaaad4f5690353b37728778c574931', 'ebe55ee9441e110ed438bde953ccc754dbc7bc5e8c14ca842f403afee920f7e1ce206354f9ba639a', 0, '2019-04-09 14:31:45'),
('3b4762bc5fecd8d7fb23cbf8838f1b27de20aff7303d1b17a0c11ad6c6f59b3d879c1acd2a540ceb', 'd23e0d2c61b55bb8cccdca87e114edf5654196a2c6b1e05b0e88456705a6874925df24e24567ade0', 0, '2019-04-12 07:09:43'),
('3beb40408e18f2e5bd686b06eb9e6bc740816fca390c1e8b684ae3e193d4b3f1b8f56b0bab9a7843', '65c68820a582919d70f302e60722db15ce2b54bc6061fb79eb7c7a3eb1c4a0d1d694591b87b77773', 0, '2019-02-11 07:31:47'),
('3caf0b8c4cd0b17e9bf6a8cbad4fafbd333b39d67faf00845fbb4093a7c2437359632d4a1b0e37ac', '87c8d30c11e0b2d9162b6c894868ae62de155295fb6f1ed39b0c0204482f156f28d9a3663d1be3ec', 0, '2018-12-21 14:30:02'),
('3e2189bb29ad0eefd9baa7ee8b7201baff5f5787f741d56d75f3f24b08ca0a97ed9828023d9354da', 'f088b60b32bf837d5b28360f153942aac468592e12e6f384b48a994b2d9ffa0f7594ed1f06563527', 0, '2019-04-20 05:01:29'),
('405655f2b3c0d2ed0b9c5de92920010e0408081f919bc4828f9ab3a3e3c6a32bbfbc9ca100dbd947', '9af738ec546e5996f983b1db9388f226e0590d98b07656ee1a3bd48e3faa29d5ce948c1fd49c6baf', 0, '2019-02-15 01:07:41'),
('40679caee0bba92f4d538de11015b4992095f6cc756e853eb3c5da69084f3cf51b32e040dfafae9d', '9d56eaf10c9037194c70847835b950542048c810d4a00a47b238f0f628ce07b23ab66b9d2c5d353b', 0, '2019-02-25 14:46:05'),
('413ea05761d26fc3e18e017d5996e9c617204d8e3006986632e57475165600d22e29b1d3d7b87955', '3e572ce8b2d086d5f04909d9cfbcb4a8104bc423c4f37905f808d37279e7ac22add1479383f0bc67', 0, '2019-02-03 10:48:41'),
('42893a05521ae8ec3f67a297b0f83640d7962edb5f3606db7f409db297914532e3a90a7ed65b27f2', '1ee7618cd94518f0160ca179c92b5edc39a5b2432847374814b0706c8bf36cdf9911e9ad670241c7', 0, '2018-12-24 18:10:29'),
('42c04405ba87c363fbfbce806e11f2763036b310c8889c6a1c7a61451b48a66be1db1d018b9ac5a7', 'e57c0c000d33603ee37379cc13d53f7486768f1451738f7c03b8c0cc51b7ae2e6b801ae080ecfccd', 0, '2018-12-26 23:43:47'),
('44342bdf1d347d06a4c04ebed9c4ac6abc4a5e1a92ba0f57c6d067439e764973a542cd32b5b1e8e5', '04ddc6f40cad02de1b6ddbc275211b3bdb575aee93c4f703d02e681edce4dd628558fd0c7b52a43d', 0, '2019-04-28 06:55:02'),
('448f72001cd1ae7f485adb5bfd68d6508fc29801077aa58cf183ec5f29a73a25e346a4cf636d8a50', '329610dfcaeb962fe3832db701b091549efffb68cb86f0ec28ceb58f4de07f701e5fdbde91d8b5ea', 0, '2019-02-03 16:21:53'),
('460ee86a9a057a45f3e61ee60fbddfff24418a02808f30a1cac35c9a6c1032eccbaa913c542ba053', '3302ca035fa5cf4311ef599f4102d385078731401cc40f82ad11654529ca1a9ad98e4fa04c385980', 0, '2019-03-14 16:50:37'),
('468a516e091b66dd45adf17854efd2a6da1e7948e6686d1bc7f7de8928c3f664527002a1e9e8be9e', '327dc5cba8188c3dad115feef1b60e877f0e39f6c4a8b3ea04e5cf0856bee90f8230e643b2bfa3be', 0, '2019-03-20 06:19:51'),
('49a76c82b7f57e66d6e04c5e7866bf114c5f67acb927caa4525e9d31398bb72a112d0d028524e562', '02d41b088b1dd79d939e7c5a5b3befd8dcf99ab1b3ce6648919ace24bd9519322e112cb078bd2a32', 1, '2019-03-28 01:04:40'),
('4a9fb7e4b724157f7462c1898e99d99d8c12a644f860f94671cd4cea37f8b42c43b82ef80dc071d0', 'a35777a04c515e9654b02f050f757138c0f246428c93721edbb93af11d08fc5dc5ca8d715badd2d3', 0, '2019-04-24 11:56:42'),
('4b44900d6d8bd132a69b0731e1655dfdda8e4d627ea639d0892cfdc0ad3a3a6aaf0fa3d598d6e7a7', 'd1b729901bab27c73ca29ae29965767e0ac5c4976a514ba612be9dca6b03cf59bb3c32dddaf6fa90', 0, '2019-01-05 20:29:07'),
('52ce2882aecaef8d2da91cede9abfb492ba005a8bdd788333c22829b08b54d15b8de37e7a9440234', '6691f2bba0f4c945c46916a5741861e9b8938c176e94a0056df1d7138c2a8f41003e27c8594a91bd', 0, '2019-04-09 14:28:34'),
('537b914bfbe44dd79ce9243373bdf08e2390da5d9e7610f0c275b96877fb98ae5046596dd5bb0a9c', '7eaf125761ccf2f506fb8ad50fe6a330fc9f26637fa83324b6933e6020009118437f4fe007ff748b', 0, '2019-01-11 15:09:08'),
('55412ffe8294eebc067ee7f758c12ee8acc0f94f175cd0503be9edad5cdeee800314f617aca52165', '1be57b9c20b571c1bed916bee3a43f6f3034e613637b37f4c8b81c042b6d1b72497709ed9fae7896', 0, '2019-01-06 16:01:29'),
('56ea32e27d0b67531e8cc38f1b71f9aa273acb3f81a57e1dfbfbd935ef0df6aff5150d224f1824b9', '14089ac1e14436a44d250fb7ea56bb85d8b6f0121adff59efa759496a5bc0e15955161cd95a2c826', 0, '2019-02-07 09:34:20'),
('58b84253723964903c698ef0342894c748acbbf602e4a4cec93b146c7ee52c344afaf1cccc178186', 'f69ede4fec9ba6cf4bc6226eb022316d51916a909c36f03473348285976372bb25d2af79531b77c7', 0, '2019-02-25 14:32:09'),
('5a1b2ee02185cde6cb219ec8d371382e04ce10dfb25d0dbc57f8ee961880cb6ecd9019a75af2f684', '47f642959de309e2e5d0099874907c1361f5b9eef286d3405c17f9641a524eca59ce1a2c0a50be09', 0, '2019-03-24 15:34:18'),
('5abeecc97c84036eaaf395bd8b9092ac1620687f3f75044e2955272d365b702ef07f751ad9ef8cb5', '8c260f819ece5e31423879ce2d037bb18eccddf63f4d4d74021e2bce02ce73db59d035fd74c80184', 0, '2019-04-08 15:21:16'),
('5af17a364fa6609f48f3412b9c878cf5e821b4237512bb181ef1c458fa35fd98ff93de412441fb16', '9878bf6c29745c3a69e2130c4692191998a59b9a287ae9492d2d2339c85bbd073f9114b8aa3d0d42', 0, '2019-01-21 07:32:09'),
('607fcc727282f945689e48e59239cf7979ad9c4d42c95a1c726ad6b1913149edce0bc2e723225be4', '938874aa4143fde60e3633807dbb573c7ef70b7aa25d4140e3ee25b1c5df53430ccb31678c89d5d8', 0, '2018-12-24 03:50:04'),
('60b89d6c10b6e5df184adfbd95768037748d0f58b8d0bbc7c097eb423be5f3cff62d1282db5f2880', 'ca1f641893c1e972b5dea7864b92e2996621b83888a215f78e8005cfb80e62417d80917be4839ba1', 0, '2019-02-11 07:38:45'),
('61385e7166380ef12aacd28988ecb2d2c3994d2cb0f93dd0972824616c74b384df835d3964b405d5', '2d99384f57df32db77df3f209a92d299c643554755810f4c0882de4c89af6340bd08b2fe28319907', 0, '2019-01-29 13:29:15'),
('62877a277d4483781d626eba5990d58d6b6242c7e01b2a97d9b62d9fee52dc1bd62560eb21772275', 'bdad2e018eaa1c5b2a166afe208f6a2056f827f0b0edf4e9136607e3dfdc2ec2c70a6c527236e5f4', 0, '2019-03-08 12:31:59'),
('63e9206d0216e2873cf86063cbc83a669287084a20ab1a181f6d94fae349994d80c7006ffb367925', 'eb79a3acbd6bf241298681872be226c1be04b496d5506b4c1eb9b996494b2bd11b6e5aac7434f698', 0, '2019-04-08 12:53:49'),
('63ffb998559e3b006f559eda835fc170f6cf500b5990847ea17d3dec9d5427007e072c8047627ec5', '1cc8939f0c46d345f3c5d5f202ccc12f1ecd44738085f346b9b1ab99971f7ae578232d2b0b2e76b7', 0, '2018-12-21 17:32:28'),
('64672bbdf30f08d737f071f353fdfa983e8623fe069131289050ffa35c71763c87508aa0b202d9b4', '00874abf7eb91f73939721aa770f6a9d8bed074f411980d33e0113bee2385a8acebc92934bcaa437', 0, '2019-03-03 18:26:06'),
('686201a55312a97000a229e15c130542ae35e6b0acdf57407eadfd706847b4bc5e22d71ec907bbdc', '747ff215212da9cb4585972441bc948b42d59ed0ae3787d31493eef6107907feeb89296f80477c5f', 0, '2019-02-07 17:15:08'),
('696a693870cdf6ef38cc93ec35a820a398a8630f2a685487865cfa354de7ec98c6063912f78633e8', 'f4d8b5d20c41849e565f108eacb2a85c0f0314a8e0ff7c16393a1925dca69ab9e8018bd0a7b950fa', 0, '2019-02-19 08:27:27'),
('6b0813cd2b3c5026ac902c05457f7bb23b7a7cdd7fa50694b67b1d7dc7d5196ab5659c9e6e5248d5', '542976acb17f3bb862d710ec782ebe76d851b6af4b25fd153edbb2a27de22f8b76381f110166eb37', 0, '2019-01-03 21:16:44'),
('6ce7e59cd48a85cd560c3e18c2fff99e2836b4f532172caf764b04cfb6a986e85b86ef793e478f0e', '2e5210f82e7f2c116965be3f54c37939785bcff837af374571f57e13abf6c97e3f6437ef6ab66a23', 0, '2019-03-08 12:27:02'),
('6e3cf3681540f9bbd68d0b9c32e252074dbf0b0f1e969c909f53f4a338040043f3a987848a7d671f', '976618e326d5c9fc8760af5e6cf2760f79d6f43889349e7601a01d969ef55cdac4632d4601056d17', 0, '2019-01-12 18:02:16'),
('707180aee0ce193dde5ed36a8a6bad018abcb145dbb81853a0369e2d475104b48ef0045ba574ea7d', 'd032bffc44fcecf6f77ce27f22b02e5e64fd6ff786825f08c3d2618ac6f7d7c1f254862f9a5c1ca5', 0, '2019-04-03 23:12:09'),
('7284d8e741f2940329ddf15f9265b0a9f6b02058c72d75cba411409d4af5e7b78b8aaf51d28a9ef2', 'c0bc180b2258145b5ba6e7bb095de5a729a71fa77df6234f2696e1d00f859d2b7244916695ae4f4c', 0, '2019-04-24 11:56:42'),
('746c9002ef8bc3b3be8c272bcda03f5a129ae6c0770e1db467d8dad2a2aa827de70929091a787323', '6cf6039568e210b05105512f0e6c8e1e9c4d7b9471c2deb7b3dfdd98ea7608289e187cda81646a7a', 0, '2019-01-25 21:23:31'),
('76f1785158f6e99e578ecb476843cbf68f67ed3252f752a720a8f9bc39e9837a2d6f9e55d332e523', '87d67abff265b535586bf8ae5dc922e748915ade6c6322f4533fe654391e4d47a54c6d19c899d85b', 0, '2018-12-23 19:21:45'),
('775b15b4d110fb955f635e4700d55ead6ef6a38820fd5e83904c171faa7688a15b738cb6d4ac6a0b', '59d66c68873fc09cd5ef48c0fa223feab0d95170d3f72580b4a7398570281bd11e0cc85980c1a9f5', 0, '2019-02-07 05:50:55'),
('78b581515ae77ef68f13f9576ae5cf8d357dffe33d6d8e6cfb1b398a3693b748e7afc193f75a640e', 'dd748e0f21994b446cfa70168e1caaeed0d6fde1d431bad15736ee480586dece0f8a9c40e8d61160', 0, '2019-01-20 08:53:26'),
('79207d8818921b33503574e848452ef37fbb69b4d70f2b59b47a44b9fd57c44133ec995ed535521a', '8df741d89c1c4cde131debe862d26f262eef0edf1c49f0178863997f8c1810e05371949f1331fa49', 1, '2019-04-20 05:01:01'),
('79528448cae14ef7a223183acc00b9b98d86244dc88628aadc838a0a657dd15c7ce3be999c0aeb6e', '1fb9a6c30ec2d39d52fb2bc26c74b152ae50d4e6c5cfb330eddb3dd7fc0799ac22cca5e3b231038f', 0, '2018-12-23 18:03:17'),
('79577e1cf2a7410d009ab7081fabe36f281d48fb4aa8145c7fb6e60dcfa5e7f5cfa76e1b4b677e26', 'a81a207f569f5acfdecbb6a48634dcf693e786eb6d3e56fd4d644b1c33d39b49d178a40d07887e52', 0, '2019-04-28 11:02:08'),
('7d4aae89518fb53948d48a3e48a6f042a7b41d40a65e76cd538666baea1142812eb02a686e49740e', '6f17d011a4d40f21ad7c79d205b32f0d2c8dabc9cee7811b748996694360239e5f94169c1b655589', 0, '2019-04-13 10:26:16'),
('7df006ec476d2c1ab7e00f5c16e9c4949778aa90a5593dc92447e938137e32673583f402dede0397', '415c1c632937b4a9c5ce1e5663d4ba994b24ce94cc40ee19d9824b5dd9e05090763ecc8cbef3a291', 0, '2019-03-01 09:54:53'),
('7e1853eae9679e3afe0d6ca369378c0c00b31aa705c2eb352249328bde6fbbcfb4a873df89f1a68f', '4cecb086505e903674d431e7df0374f03d78b557fb063118a3fdad7cd89005e6d69b191be4f0e7fe', 1, '2019-04-20 05:01:21'),
('823f323392ba08436ed8747497ab50fc0366211bde490bb3209977149a30312bff1260fed7971fa4', 'c8e76301a35610f578edfc8d8555e8bc736d4837a6456743a9881415c3ecab7445aaa97ce420e472', 0, '2019-03-20 07:16:31'),
('837ecab970974738258aeb19c98bdf06c55bf27304a92c87e308bf8835f5cf082723b0ab5a3ae3c8', '4d7ebb99b3197c23e527483257f4039da24f5e04cb835684f0b8a75d0112703105cffced4c083c86', 1, '2019-01-29 07:31:05'),
('85bc28a5cf047ecfd7ffa8dbf899247aa640e7c12c02325b8d3567805f57213f404e63d9aa01ee99', '973556d1ba805e8c9d5fc7e9bb11fb6f8f82fc8028a162171650dc655ad24dc47b7d3c110f080083', 0, '2019-02-04 09:21:52'),
('871f94c107e91a6ba6b38253935c0fa2df0d8a9995cb11111048ba27d1b1430c17b8c58bae405495', 'f98beab119a1f47316bea59dbaf19b13d02508a6e019e81f94494a5f17d45f4b1af64a7fd73a8aaf', 0, '2019-04-17 13:28:31'),
('887195e451c04e903454cbc1b227a04a88c0674f1dc5adb1675f59d0664f95c78b53c364a78d976e', 'bc76d6aacb4103b86487bbb371a09222894975e5b8bd177efe6012de02b531d35424969718af8f0c', 0, '2018-12-23 10:10:08'),
('88ffdbe1afe49212f05d64c6da1eb0f8f37200772b5085094ea8fd03ede4cc7cbfcd2b78302d34e6', '8f6621fac8ab364a7f14ab8c647d7b5f84590d93babe47572cc622d02d69a4ec5de7363ebcf89db8', 0, '2018-12-29 14:00:03'),
('89ea169964eb4fec88ec39ec7c01745c83a28d410b25576dd74e376f2a4aed515919ad0434182522', 'ce22f75edec8cc886658ded7b50145dec552b15ce37deb3c9374d1318c068fe0829a0f818d570bfc', 0, '2019-01-03 12:14:36'),
('8a81fa37a9e2ee3acda3bc9950f11d8fa27acb915ba7de8bed6c48ea15bbe0d131e99b1ec067ee48', 'd34d44f4107c3739dfd5aa8a3c2e589312579b521a756024a674bac634c28203fe58a1d34c669e83', 0, '2019-02-23 10:51:55'),
('8bbefc3777cafff61411004d7cade46263cac0ae72798b16c0a037bf64516648d4e3fcc3d56ae27c', '15b4e97e8dc047c2499d199eccbb78784782ce2efee6ce98c0a9882bb093afe6f5734ddcdb5beb24', 1, '2019-03-23 06:17:32'),
('8bf45793ec707d5f555d473c3c07c29a58ac746590370ed63b72c3ab05841f157cea40acbec7eec0', '5cdf27c1e57ba9c2edc826b5e16d5f5ae76abb08e48d767383d51a53cf95d0218c7a8a63ac657de5', 0, '2019-04-24 11:56:40'),
('8c056d42b703f0a4929d3d1945c93fc35dcfa5d1dd2b83720bf26ef2820d284b3ad1976f8ec61476', '13576737dafca8ef24593ec949bc7d1f1dbd0368c520d721a95dd6d8ebf2ac45940700e7523cfb49', 0, '2019-01-21 07:32:15'),
('90067c9e4322830cb78d20d200e15193b3724492aa56e2cd0a94f80f0fa6fdfeab1b835faa7624b6', '2b2b61cf44abec5ea9d827f9fc2f091f1aa607f5ffc46be1f3b3e53dbb9981ebd51c806f63ee7328', 1, '2019-03-23 06:11:05'),
('9040c1b21bb932743708f54252851f0aeac0daa7d3c10da8f5c52eb163420770255f1a114ce354dd', 'daa11272224623e0bd04a7eb61681d128098e6d6b24a0ce42e101d0cc2a9e2a7def960f701f65623', 0, '2019-02-26 19:01:14'),
('94b5937247e33d98479f9eaef82a3600dd95dd941cfea2092d2e7e2a29a60fa60f0c2cafe7eec6e0', '0af42eccae1dcbd7e9278654550ea8a1fdd3f89b67f9912455272ca2216653fdbe08eef6b4345d81', 0, '2019-01-26 09:30:21'),
('95339665d19eb848efea865b10a86dcf597cb5d321e872804a18e4a5a116438cb1065828c7978bb9', '34872eda7c7a16216fbca50b777bc979ccbe7a71036456bf25c3a3d4c043805f2b402e5d5aaa62de', 0, '2018-12-25 13:10:29'),
('9636246810174d9f30f2b5a189316b784a535120a0b894364f342ecebd0da7b69fd3d2f582537aa2', 'e270b98d9cf75b9817348a2e36bf2ea49423ce921378bf81b4e9e2f04ff6d9f398325d8643fdde00', 0, '2019-04-09 14:25:09'),
('966c554f3ff76c84208d378c18c134c54efa3ba30a749b3a415f1158e975d161a146a1cd825a86e4', 'd7463ad376c0b76cbc0687e366e14f43caba4115931c3fbd13d0601dac1e5833738bbcd6fbdcbc4e', 0, '2018-12-21 15:41:43'),
('9941ea926a6b4136fe7bcdb7e5734d6560ca32a72986a169f80fb3824f1f567af7d44953d609901b', '367d978e63e22f15aaeb0c1678d64df2439c40eff0843103a1a1356cf64af4072ad23db44c0bc10c', 0, '2019-03-09 15:55:33'),
('99c4978a07daa5bae015b6c60af33408cac1d35d1fe465dc931ef095f5636f505cb35a807bcac516', 'cd771b3960dc4b6f9c09840a41cf2247b694c8e86d0a9eafaaa8bdc1a559986ca3719a0fe11052e1', 0, '2019-04-24 11:56:42'),
('9bb83e510393858f02b0cc2cf13d4c41d960fcfac6a9e0f4ed15875e224a87e00eb58778c2b4fa30', 'ae995e5b5640de7302384b94e417dc45b5bc5e5f80e29849e538e86db44556bbe80ee935df19a459', 0, '2018-12-23 19:32:01'),
('9f1681d0e79d0f2eddf39703a86f9f25c53059ee0388d8d3f0699d52f272b6a14a5c9011a7c180c4', '53795d0c7d37dfa596b5cf17ccd24438f426139adf01fab5eb7d51c540747921b870144c06d4df57', 0, '2019-01-25 11:24:30'),
('9facfcc8df3567074403899c4fb29a6f6a507ef85a1498fbf5040b4e83883ae907ff41490f0a6002', '56b3a9f4f8a4e0594d0a3367f0074581d3eaebbcf3dab872dab1dc527017009457f82324e0b8d3fd', 0, '2019-01-20 13:56:40'),
('a0d671c023926a4e5c5cf968f494f7681fd714a1cfc033c2881a8a647abe64b6ae19258a3105e4e1', '6f89466ce02e10f0ff8704649aef2b4f707c693c67f9809723a72ca1814e0a596dde95c7ad54f4e4', 0, '2018-12-25 15:49:23'),
('a47f2632f811fb7b630d2f4b03408f2fe3ac493f24b4a5cebbdaacd8b68f46303189390d7cfb7156', '5ef4e5ab4596466bf2e2d497cccaef16cc133d4276cc2a14053d7f3b06400dd5141352b459f01d32', 0, '2019-04-20 05:01:21'),
('a723a789e6e0225e2b0fbc1ef0b4c6e95845fb6d8220f59a5e51a23c18e596f8b5b4ca44e3830f24', '2d2e77870ab181f234b8f562ad3c744b0f51631de7810b92ed3aa74b577a3b7f5c822bb116adfe99', 0, '2019-04-18 07:11:06'),
('a9de974beff22ff4a24fc8851c1370d34fb4a705751cb1edef1ff88b9d83ca20bb45eb5702205e4a', 'acad8f4ccad31d964dd17fe2171d7ceac491328b26370324216c35d15b3dbd1ee7259f88439ea0bc', 0, '2019-02-03 11:59:36'),
('aa925def55682455a4ea5490d90fdc0df71b0f6ec19364e769f5f27164aa9721e21e52e65be2fb8c', '8de19315e8e4f09b3f6be1f09b387880671707a3d9c3f94c1655c478e15873e17b63efea8a531cc0', 0, '2019-02-23 11:10:27'),
('ab64b0fec5793aa637854106f903653fe6a8c023df0aeef64033d67bdde371cfaee235c841d9a5d3', 'bca95f7a90da0c4d61b48125ed0ef845ee23f001d86ebd06fbfcfc4b665fc65571a11eb2f6579e69', 1, '2019-04-12 07:09:43'),
('ac1e301fee842229393e8ef4db986e8df46ac3f711ec3439d4a189001dbd43892663e6de81156f85', 'a275027084a9a1ae9d0ebe23ef85fd52e22c195ef67dfb1e84cb751151213b2ee4dff305292f0242', 1, '2019-02-26 15:22:34'),
('ac67d8358da8ba98765960ffc3d23b2630faef248aad2f0ed8878ad56bf49320709a970b91139921', 'e084c4698902c2d49353fde51f25a2986f39553531e54bf8c165fc6f2679dcddbde84b82ba1bff3d', 0, '2019-03-18 20:58:13'),
('ad0ff2954c524ef45111cb3900e80442f158dbaf56667db7fd3160eab4ea6b22c2763b13a1ad1cee', 'ccd2dd561293909d4521f97eb02ba3c6d4786893c0086ccb44e7c2ac8c7acf039f7c138019d17d85', 0, '2019-02-15 07:15:42'),
('ae1431ac156372a0302a966d2117f33b6f6be9726ccd6298570c5850e816c6d5cf44139468a2cdad', 'e0bbb69ef1aef9a94d097c27743874e67cc25e6ed13d61cd0de8bde2e6833277a2f643a26e6d6cd8', 0, '2019-04-08 15:29:48'),
('ae7f0de073544d8f7ddcd47a8dc2767c30bfcb6c97eaaeb4044ef78af5b70c9cea2578ed1d56ed7b', 'dd5ffdd168c77837d1e22024a3e21e5cbfdeeb59fbf4ea4ae93a0f204b68e887fc5c17329cc7f0b2', 0, '2019-02-07 21:52:56'),
('b142ae61b2ae0eda7511bdd96ec39a630cf7eab5c3f7f4e7064c9c1bc9d69cd87f2f4f867bf21c43', '8479dd255027fbe0164302937549be5773636b2c1a933bd5862d5579c4acb328fc1ddad39b3c2906', 0, '2019-03-17 12:43:33'),
('b8a7f28d5ca70ef2296b2059422d72ab821c68bdf680e7956351943aefb55ed2fb12e34cb8b89b7b', '0a8ce91861b98d33d4b1c19f1620b9f174c1e6040d4b7d62e7c38843999496353b5651ec2fc771c0', 0, '2018-12-21 14:39:36'),
('b8db7afac985fe35edd503ca31dbf73ca9e489242bdbfe46d9f05c5a8e23c34f062de15c0950c9a5', 'e807e65143435da1d0babfa3c0d76d1f19cf962066d83b31718d46425c9078e00b0e261b7113f8a2', 0, '2019-03-08 06:53:33'),
('b92382bab5576c6dc71a0c18b26ddd2812955b9d51e9e2d1f9f7c556a933c642ec5f7ac9d5182f4d', '081542181b1d785d2f4e1876748799a17e85e93b5da9d08746bdc3fe7ba520e7c7dd07df665a8404', 0, '2019-01-10 05:58:34'),
('ba43f43bd8cdb4949f1a2580181b04e1a4f19101aeaac88ddca0c133e95be999aa63846f6830c1c5', 'e598117d0fcd0c4bc7157d40afba4718b1bc96dd13f6d751a75d00a6731bccad769b3891fc54422b', 0, '2019-03-20 06:32:37'),
('bc3355f5b76da80e910857c7ae8d0df17f8f9c584d06687a2801ecde7a351de318ccc710028b8c40', 'fe3d6588de3c4df6277c01a36ea7c10892c6e5af13481549a003d582f0ba4a7d3ec790068b2391d3', 0, '2019-04-24 11:58:06'),
('bc46e20fe64018fa7b9c4ae279c19b496b98d747f7cc7d65c971a8661bfd8f25ceb175410c8ed15c', '68dafbecbc25f5bf9a15de7057e8e6b22ad827a7be2afd7937488f08bc7648cfb097ab8404a1aaad', 0, '2019-02-03 09:50:41'),
('bc6d86a7e72b5eebbce509f0c38ab9ba5b3c229721555df7309687d1647ecb8bd008955ac2babea0', 'aaea502feff0c5772bf3753df2165e437a585c7e2acf3e147d44695ef8f3b4b20ffcdede4f2c04e3', 0, '2019-01-11 15:41:46'),
('bf79a542c634e20c85a896d1ca79b65310ecd78ef0e93015bf85650f5a1db05a404c966aef8fe003', '7f8589e4e5e93c8cfb98ce8553dc0a5dac735a784891970a9e50b7b81ab7e4e1a5180ad4037376e8', 0, '2019-02-25 14:49:49'),
('bf8da8547f5c18a8af7ce11cca59f91386a5b6b0d9c012865ad2761b8909784c882dd40a07f9be34', '0fb25d67a9651ba6c9a96be74134d6c93fee1ea1523e5ba489a12406a2ede7530b914ceb41d0a517', 0, '2019-04-27 07:36:27'),
('bf97e93a6ae93e58c2ff26d810b5edd4714db5bd49c6c9712d13602b6a60b9789faf52680e2ade11', '85963c6cc4945cbc23ead88396b1a6ca4a99b3a17ecd7486a9570815dcab646aa15d5a29d640ca2d', 0, '2019-03-31 08:32:09'),
('bfd519adae8e4cf904993a22d150c3766da021d7f787a48eeacab8084cfa943dada4667d5148e2a7', '9dbb82ec880f2e776bae6422f73a945b492de898b029ec21a34554f91e6526f2bacc6f39de5e1d65', 0, '2019-04-24 11:56:42'),
('c5a009fd23f7674864b8e052a85f72d775b1babc852d137756c248f3d7c1931d7a17a892dbba4f62', '285c020fac9e2904c3d05042cc2b9b85190deb722aa0b02e7edd94aa5fde82293a600477d47a58e4', 0, '2019-01-01 10:51:45'),
('c74dd27f9e42f5445fca8744c6fccbef7063fd72fdca276d6d8f7900d453325062752264b01112c0', '1ecc8da5f1f840b34cce28a5c32f48f52daaa71aed5860e2bc4949462686e72d507da804cb7d0a2b', 0, '2019-04-07 08:24:41'),
('c7e9a71d6722620c5428d1d1d7c255ef4a1003ae31429cf9b5ac6c270e4619f91ca83d60c6f45628', 'cbae4f3e18dabde8a4118652e6a9799c9ddebf35815dcfabd9c1cc8af015437ffc08a68e74e1ad79', 0, '2019-02-04 14:41:52'),
('c8086f2da64cb90deac7cbd49814aad27c3e347aceb7095261921ed8034b3911ef87827528fc23b3', 'fd4fa4547f13dde79b34ec3de397f5ceac9ff95c3cd7dde6cd1d74a0f8839cb2dca79193ef94c483', 0, '2019-03-01 15:26:20'),
('c8d8b59d390b9aaa9c6ee8f90bbdb2aba8d90c9340a92658234e68230b3ba990d40dcff83a815ae6', 'cb036983d8fef56c780644310182f24016c81c00b04f0cd218f21faa426bcd254c59d098e5aace74', 0, '2018-12-21 14:29:22'),
('c930ac3f5ee1a12f3a2d01a7a4e54a647de7d0effd1feccc804c7e1501498390213e8b7941e6d139', '29c0eafbc8a7f5f78cd2f3568c9d90c44b22fdb3043abfd08001db2b853f66e6095a0db7bd1ea4f8', 0, '2019-04-24 11:04:48'),
('cbcd861d2bc5bad1733d339522b0db78b0b9543f5d2032f6095103339e44c2414a8aefdfcd385b0d', '149ce549868543478b7a65d42a97aed7ebfb32cdd90a7f937ee1a1ada9210780770fdb09563c4b43', 0, '2019-04-28 09:01:02'),
('cbd1ac388bebdf8754b6356a57d64d56c33cd6fb6f805d40221a2ae3f9bd7ed770cc65aa6a643175', '6379eaf0c918a5dca6b7991c84fff9050d0e0d1807c03196674692b44ab7faa8b45210f8f690079b', 0, '2019-01-05 21:50:31'),
('ce3be6ca957acdc7ce28f4ba7953cd9d9ff6116507484d4c03505a074c25330e8dcf8b79d2b78387', 'adb201bcc887ab3285e95914627e68468df60f747c346ce9771d10ca344b3ba1da1535a434c6cf6b', 0, '2019-04-08 12:43:26'),
('d08390490befeedebb96165ed71706cc1c35beee75f9197539a1f10d2e8420ba36480268d7e15cec', '98320c3e83130986db944b0050f85f2ebea4d69efd2963abfb62f1d006948f555bca763da8b2225e', 0, '2019-02-11 09:06:50'),
('d146b4d61d269e6a0d91f1285abdcb3ea49a171a5062d0936cce892d021353de5290b85d766d2473', 'ae3637d315105845d99c181cfc0685b106df41504878913f9c58df26d62a26189c21549838be8387', 0, '2019-02-03 07:10:43'),
('d42f2062eac51dcb19f5fc34c4726da4da355904c87f8828516f4a53bb084096b158d65bc79f55d2', '48e67a929d2420229043fc2529e5946e1e9c8b162e2dd0c18007a4bfc0a75b6c83ac7757491f7067', 0, '2019-04-24 11:09:54'),
('d490599bd1368cfbf55c968507fd7cabab399dc1021ed7a857eb9e4c3803b4e4f0bf984fd7fbac2e', '6cfb33c86491a3d6430924aaeb2cfa74ef256bd596161b7d7a1a750522f1ffbde7d7d1e07bf61236', 0, '2019-03-18 10:52:43'),
('d60628e6abdfada96bd89d599f14e624a9fd79202398b238f100790b0b281a9307360a9017cab281', 'e5f14a49f5dad3cb90ab6d83e6525d3b334b7865f2b4373a5653097b5f828eed503934ab9eedd500', 0, '2018-12-21 14:38:06'),
('d8cec0a4f61f364c951c3fbb93a4ba67e06da6463984b2304f50b1ee8c811ffaa0046cd89eef769a', 'fbe5f1389dc444e8ee6ba29dd19d1a17b3474acceb69c0c815e7997ed40a4eb272092eb5b5ac8b68', 0, '2019-04-20 05:01:21'),
('d97a7be4836173df36ba239ece0fcb30887261b3988b0adb17c72a5d0b5c43c76bfb535bd6214700', '39839865ad46d42999e77c5d0f78bfaab068c57698a64cc6f56dd4c756cb49a8a0166fb65055e513', 0, '2019-02-28 22:23:41'),
('d97ae1b8923d509eecd1dd767e85beb4e8c303dde9f5963c192179a6503c2cac5d45eb4458456a84', 'b1879e8b98a05bd57f1c3c6a23222b20637bda47e4eecce618cb83c8b1deac63252f3fb1933ad6aa', 0, '2019-04-14 07:21:24'),
('da068c5ddba749e060e90c2fd533ece62eb023ee52ba470d3b47a625bd61eeda39b9acb032ee2352', '5b99344a6ab63535f850c18f973aa360882348ac7135c1cb4a9bc375d13af55e5c364684b7aee69d', 0, '2019-02-03 08:25:26'),
('dad619053a58a1dad859c68e1ed7a075baf4b074923eab556e6c016882dad4a82069087f9fd25194', '635707d566e06270140c2b6740e89df61f85b860725093b75338bbc8395908ccd295722e9e801617', 1, '2019-02-04 05:02:56'),
('debdfc77688ffb2539861131e1643aafc9d74ed8f85f655cb0d17abae262f22cb3513a98e44fe363', '2ab5eef37174dd31fdf2657405ab9982ee3b9b0a9edf4942d5ac1b14692880fa9ef6625d255cfccb', 0, '2019-04-03 23:31:45'),
('e1e02a2b04e2c95f461ee0f98b880237ef32186fc3ce999b0f9d5ae7e6ef7f3918bf511541aad5df', '6579ec81a458db606dcc85e7cf1b0870252437e749dd0db196e7b9771f4c544796988c16f89b3865', 0, '2019-03-24 13:06:04'),
('e34a9b038844511310c34ea135b07f6aa00b289273032a4707d7b4897efa1914c4b4deba4a7b7bd1', 'cdde2589a6445e11d2fec91bc65b93d2ef14a10b70210f5e7957ec001c05ec5cf2fa7a052698b60e', 0, '2019-04-08 14:10:48'),
('e43fd6ae6e0e84c8d5307584a45adf7a997be95746e5debdaf1f9f7845c74fe0918b18dd1101eafc', '8d8430e1e28195c8e25fbcaf11f5d16dce5a710d152a7cad658d0eebdbc04b5a9024ac8a27c7b9b7', 0, '2019-04-03 23:51:07'),
('e49e326ee8b0e5de1de98b383f0b3345f0fa2398b53a514e95cb790d71bda9edb0139d80e267a250', 'f740f4a7e962cca442787e90577ed563aa3bda568f32daf90039a5789514ca9b94811f56dc830a42', 0, '2019-03-11 14:26:06'),
('e84b247901744dd9a21dcde63b099aaadde1b239c37df5b0c061e944ee5949d794654b61c3190b8f', 'e78cf5417011bb02da74f08284c90d73a3e096f7aaf1581f346cd8521bc732ecde09b0e282dff64f', 0, '2019-04-15 00:51:42'),
('e88f5c1aecd028855193d5f200a7e6c5488f4a2a419339380d78e0bcac7f7088393a8ec58dc293cc', 'c5e2df3e167dde0a6785b86c468a5bf1cb8f02d51ac08200475ce6d337ebc547ae0a28adc80b5477', 0, '2019-01-29 08:24:27'),
('ee985860b7de59f58416cad2d0e396a4795197d1ce76b6da1d626dccd25a3f34e80d08a9b3d391b8', 'a91635d1d16a05fdac3cc965cf82a6474f75be8eab6ff826bd7eecd1e21fc70db9038af72eeeae21', 0, '2018-12-27 00:01:17'),
('f135f2dbae589af5361beec39b8cf24e4c97461456f49848ee4e5c4910c98a0f49cdef2b8cb99b90', 'd1f641d00813b77d3e86663b38a6426730c05fa1da6b81d92daef6d0b7cac308123e922382f01ea2', 0, '2019-04-28 10:52:50'),
('f6eac8048104e502934107e0f75d1e2f617164879687cbe8cfc9d736909811987a8d2eb480a8585a', 'cf9ee37cece2195a522e4802a20896056ca577e951a373ebed92e4d01c1821ffd3cc28d55cabfbbf', 0, '2019-03-02 11:44:44'),
('f7001dbe4e06a7981f7ecfd118773797ded21c8e215bc7bfa384c9e24d875aab63bf5efed396082d', 'b5aa9e5e8bdb48352424763a10fba5c70c60b73a0621cdbba4940a3a27699eebbe00ce758c8aa85c', 0, '2018-12-25 09:07:09'),
('fa7367aa93667e1309fbe2652e23bdbc628617fce0f0a7b2453367da64b0517907effa5617b9e122', 'f4f88debe84d59c64b921110b3bb02bb45a37a55592484e84f72e92f0a25e3bdeab9e8b5fa9a1a35', 0, '2019-04-08 15:42:32'),
('faff7aaa923c23d6d51b56cbdca46a4d690dc869c106a74930d76d0b0962ea0912732fd50cf0211e', '63b15136e09d29050e72451fa47a4ed326516e475b34f2e27e8270341553679bfed66033f6c1357a', 0, '2019-04-13 10:26:22'),
('fb144d7b341949190c8287087ee4e00c716f9fd89274bae81031fc53b9f30af50ad566ebbca8d46e', '5a36130106ac3043adacea5a6024ffe369991404caf1cd56bc400a1318b23d82d27f860928f0ec0a', 0, '2019-03-01 05:47:18'),
('fc2283b8bddbe87293f2e30de6008ef8f8e665f68dbb496649880eb9f4d8ae0ecddf2801403e2938', '6ee01ea1273957f91471e5fb20daf804ffecd5653dcadec29e8f5d4943eeb4a63dcbb7842a63f734', 0, '2019-01-28 09:21:41'),
('fc374ac024db303f36c385dcf55a5543b84e0a700ff6c173174276c01ac51cdf1f507bd2f6374471', 'dfd89ee6f5cfba1632ec8c40be52ff15e0e62c79c33b30f4febf9d0df42515cc7f3b950724b0a2d6', 0, '2019-03-01 15:31:44'),
('fd7a2dc03a16485e9feeee7707b11e2780bd4a9af56ebfd60f25339295b5f0701ebc6513403682c3', 'beaf7cd1e8fe19ac37c28f5664edf1a73767832e3e704b454f1c1074ff0fafb783d0843eb8e34069', 0, '2019-03-02 20:29:49'),
('ff0e4129ce9f38328b59eed3b439582ae190fd351345971f2f2c93a78b427d23ec4ebd0bf551332c', '1484f171fe702d40beb42f526d6ed9a8a63c7d79ba1f648082d635e428178491f540870d9f5bcda7', 1, '2019-01-12 17:57:54'),
('ff0fe3e6b77e7d86e957b0929c290125702a18348a44ff3d0191258068bf3868b7a7843a1bfa55fd', '1aa99b938fb71cb1e653c6e722e3b5ebaee161ceb1e663cf20f3cc1d25e578926aec0584c8c8ff08', 0, '2019-01-14 08:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('percent','amount') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`id`, `promo_code`, `discount`, `discount_type`, `expiration`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'test', 10.00, 'amount', '2020-10-10 00:00:00', 'ADDED', NULL, '2018-09-22 17:42:31', '2018-09-22 17:42:31'),
(2, 'BAN2018', 70.00, 'percent', '2018-11-11 00:00:00', 'EXPIRED', NULL, '2018-11-06 08:23:28', '2018-11-13 10:34:50'),
(3, 'DIS50tk', 50.00, 'amount', '2018-11-22 00:00:00', 'EXPIRED', NULL, '2018-11-15 05:18:59', '2018-11-25 11:10:48'),
(4, 'newtest', 10.00, 'amount', '2019-12-12 00:00:00', 'ADDED', NULL, '2019-01-08 14:21:22', '2019-01-08 14:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_passbooks`
--

CREATE TABLE `promocode_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocode_passbooks`
--

INSERT INTO `promocode_passbooks` (`id`, `user_id`, `promocode_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 116, 1, 'ADDED', '2018-09-22 17:42:38', '2018-09-22 17:42:38'),
(2, 116, 1, 'ADDED', '2018-09-22 17:42:39', '2018-09-22 17:42:39'),
(3, 118, 1, 'ADDED', '2018-09-26 05:46:37', '2018-09-26 05:46:37'),
(4, 118, 1, 'ADDED', '2018-09-26 05:46:50', '2018-09-26 05:46:50'),
(5, 118, 1, 'ADDED', '2018-09-26 05:46:51', '2018-09-26 05:46:51'),
(6, 124, 1, 'ADDED', '2018-09-26 07:11:45', '2018-09-26 07:11:45'),
(7, 124, 1, 'ADDED', '2018-09-26 10:04:33', '2018-09-26 10:04:33'),
(8, 114, 1, 'ADDED', '2018-09-26 13:12:34', '2018-09-26 13:12:34'),
(9, 114, 1, 'ADDED', '2018-09-27 09:41:41', '2018-09-27 09:41:41'),
(10, 126, 1, 'ADDED', '2018-09-29 04:18:52', '2018-09-29 04:18:52'),
(11, 120, 1, 'USED', '2018-10-06 11:08:59', '2018-10-06 11:08:59'),
(12, 117, 1, 'ADDED', '2018-10-07 08:01:37', '2018-10-07 08:01:37'),
(13, 117, 1, 'ADDED', '2018-10-07 19:51:20', '2018-10-07 19:51:20'),
(14, 117, 1, 'ADDED', '2018-10-07 20:48:44', '2018-10-07 20:48:44'),
(15, 117, 1, 'ADDED', '2018-10-07 20:49:55', '2018-10-07 20:49:55'),
(16, 117, 1, 'ADDED', '2018-10-07 21:21:13', '2018-10-07 21:21:13'),
(17, 117, 1, 'ADDED', '2018-10-07 21:21:20', '2018-10-07 21:21:20'),
(18, 117, 1, 'ADDED', '2018-10-07 21:21:21', '2018-10-07 21:21:21'),
(19, 117, 1, 'ADDED', '2018-10-07 21:24:21', '2018-10-07 21:24:21'),
(20, 117, 1, 'ADDED', '2018-10-08 16:13:59', '2018-10-08 16:13:59'),
(21, 117, 1, 'ADDED', '2018-10-08 19:27:32', '2018-10-08 19:27:32'),
(22, 130, 1, 'ADDED', '2018-10-08 19:33:56', '2018-10-08 19:33:56'),
(23, 130, 1, 'ADDED', '2018-10-08 19:34:00', '2018-10-08 19:34:00'),
(24, 130, 1, 'ADDED', '2018-10-08 19:34:01', '2018-10-08 19:34:01'),
(25, 123, 1, 'ADDED', '2018-10-08 19:36:21', '2018-10-08 19:36:21'),
(26, 123, 1, 'ADDED', '2018-10-08 19:36:32', '2018-10-08 19:36:32'),
(27, 130, 1, 'ADDED', '2018-10-08 19:36:47', '2018-10-08 19:36:47'),
(28, 123, 1, 'ADDED', '2018-10-08 19:36:49', '2018-10-08 19:36:49'),
(29, 123, 1, 'ADDED', '2018-10-08 19:36:50', '2018-10-08 19:36:50'),
(30, 117, 1, 'ADDED', '2018-10-08 19:36:56', '2018-10-08 19:36:56'),
(31, 130, 1, 'ADDED', '2018-10-08 19:37:08', '2018-10-08 19:37:08'),
(32, 130, 1, 'ADDED', '2018-10-08 19:37:23', '2018-10-08 19:37:23'),
(33, 117, 1, 'ADDED', '2018-10-08 19:39:13', '2018-10-08 19:39:13'),
(34, 121, 1, 'USED', '2018-10-08 19:43:45', '2018-10-08 19:43:45'),
(35, 117, 1, 'ADDED', '2018-10-08 19:47:43', '2018-10-08 19:47:43'),
(36, 117, 1, 'ADDED', '2018-10-16 08:36:13', '2018-10-16 08:36:13'),
(37, 137, 1, 'ADDED', '2018-10-23 03:28:17', '2018-10-23 03:28:17'),
(38, 139, 1, 'ADDED', '2018-10-30 12:43:10', '2018-10-30 12:43:10'),
(39, 143, 1, 'ADDED', '2018-11-01 23:11:34', '2018-11-01 23:11:34'),
(40, 144, 1, 'ADDED', '2018-11-02 06:31:32', '2018-11-02 06:31:32'),
(41, 117, 1, 'ADDED', '2018-11-05 16:24:34', '2018-11-05 16:24:34'),
(42, 117, 1, 'ADDED', '2018-11-05 16:27:56', '2018-11-05 16:27:56'),
(43, 117, 1, 'ADDED', '2018-11-05 16:28:14', '2018-11-05 16:28:14'),
(44, 131, 1, 'ADDED', '2018-11-06 08:09:46', '2018-11-06 08:09:46'),
(45, 131, 1, 'ADDED', '2018-11-06 08:23:55', '2018-11-06 08:23:55'),
(46, 131, 2, 'ADDED', '2018-11-06 08:23:55', '2018-11-06 08:23:55'),
(47, 131, 2, 'ADDED', '2018-11-06 08:24:03', '2018-11-06 08:24:03'),
(48, 131, 1, 'ADDED', '2018-11-06 08:24:04', '2018-11-06 08:24:04'),
(49, 131, 2, 'ADDED', '2018-11-06 08:24:04', '2018-11-06 08:24:04'),
(50, 134, 2, 'USED', '2018-11-06 09:25:59', '2018-11-06 09:25:59'),
(51, 125, 1, 'ADDED', '2018-11-09 06:42:50', '2018-11-09 06:42:50'),
(52, 125, 2, 'ADDED', '2018-11-09 06:42:50', '2018-11-09 06:42:50'),
(53, 117, 1, 'ADDED', '2018-11-13 10:34:50', '2018-11-13 10:34:50'),
(54, 125, 1, 'ADDED', '2018-11-25 11:10:48', '2018-11-25 11:10:48'),
(55, 155, 1, 'ADDED', '2018-11-30 22:42:43', '2018-11-30 22:42:43'),
(56, 117, 1, 'ADDED', '2018-12-01 16:18:53', '2018-12-01 16:18:53'),
(57, 155, 1, 'ADDED', '2018-12-02 19:24:33', '2018-12-02 19:24:33'),
(58, 117, 1, 'ADDED', '2018-12-02 19:32:11', '2018-12-02 19:32:11'),
(59, 155, 1, 'ADDED', '2018-12-03 18:40:39', '2018-12-03 18:40:39'),
(60, 155, 1, 'ADDED', '2018-12-04 04:08:24', '2018-12-04 04:08:24'),
(61, 159, 1, 'ADDED', '2018-12-05 18:26:11', '2018-12-05 18:26:11'),
(62, 158, 1, 'ADDED', '2018-12-21 20:02:29', '2018-12-21 20:02:29'),
(63, 165, 1, 'ADDED', '2018-12-23 21:28:24', '2018-12-23 21:28:24'),
(64, 134, 1, 'ADDED', '2018-12-24 15:36:49', '2018-12-24 15:36:49'),
(65, 165, 1, 'ADDED', '2018-12-27 05:48:51', '2018-12-27 05:48:51'),
(66, 134, 1, 'ADDED', '2019-01-01 10:25:45', '2019-01-01 10:25:45'),
(67, 117, 1, 'ADDED', '2019-01-03 23:17:08', '2019-01-03 23:17:08'),
(68, 117, 1, 'ADDED', '2019-01-03 23:52:00', '2019-01-03 23:52:00'),
(69, 168, 1, 'ADDED', '2019-01-06 12:37:01', '2019-01-06 12:37:01'),
(70, 168, 1, 'ADDED', '2019-01-06 13:40:59', '2019-01-06 13:40:59'),
(71, 168, 1, 'ADDED', '2019-01-06 18:23:32', '2019-01-06 18:23:32'),
(72, 172, 1, 'ADDED', '2019-01-08 14:21:00', '2019-01-08 14:21:00'),
(73, 172, 4, 'ADDED', '2019-01-08 14:22:09', '2019-01-08 14:22:09'),
(74, 172, 1, 'ADDED', '2019-01-08 14:22:12', '2019-01-08 14:22:12'),
(75, 172, 4, 'ADDED', '2019-01-08 14:22:12', '2019-01-08 14:22:12'),
(76, 174, 1, 'ADDED', '2019-01-08 20:37:57', '2019-01-08 20:37:57'),
(77, 174, 4, 'ADDED', '2019-01-08 20:37:57', '2019-01-08 20:37:57'),
(78, 175, 1, 'ADDED', '2019-01-09 14:28:58', '2019-01-09 14:28:58'),
(79, 175, 4, 'ADDED', '2019-01-09 14:28:58', '2019-01-09 14:28:58'),
(80, 164, 1, 'ADDED', '2019-01-09 14:37:30', '2019-01-09 14:37:30'),
(81, 164, 4, 'ADDED', '2019-01-09 14:37:30', '2019-01-09 14:37:30'),
(82, 125, 1, 'ADDED', '2019-01-17 16:49:36', '2019-01-17 16:49:36'),
(83, 125, 4, 'ADDED', '2019-01-17 16:49:36', '2019-01-17 16:49:36'),
(84, 125, 1, 'ADDED', '2019-01-17 16:53:21', '2019-01-17 16:53:21'),
(85, 125, 4, 'ADDED', '2019-01-17 16:53:21', '2019-01-17 16:53:21'),
(86, 184, 1, 'ADDED', '2019-01-31 21:35:40', '2019-01-31 21:35:40'),
(87, 184, 4, 'ADDED', '2019-01-31 21:35:40', '2019-01-31 21:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocode_usages`
--

INSERT INTO `promocode_usages` (`id`, `user_id`, `promocode_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 116, 1, 'ADDED', '2018-09-22 17:42:38', '2019-01-31 21:35:40'),
(2, 118, 1, 'USED', '2018-09-26 05:46:50', '2018-10-06 11:08:59'),
(3, 117, 1, 'USED', '2018-10-07 21:21:20', '2018-10-08 19:43:45'),
(4, 130, 1, 'ADDED', '2018-10-08 19:34:00', '2019-01-31 21:35:40'),
(5, 123, 1, 'ADDED', '2018-10-08 19:36:49', '2019-01-31 21:35:40'),
(6, 131, 2, 'EXPIRED', '2018-11-06 08:24:03', '2019-01-31 21:35:40'),
(7, 172, 4, 'ADDED', '2019-01-08 14:22:09', '2019-01-31 21:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `status` enum('onboarding','approved','banned') COLLATE utf8_unicode_ci NOT NULL,
  `fleet` int(11) NOT NULL DEFAULT '0',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `first_name`, `last_name`, `email`, `gender`, `mobile`, `password`, `avatar`, `rating`, `status`, `fleet`, `latitude`, `longitude`, `otp`, `remember_token`, `created_at`, `updated_at`, `login_by`, `social_unique_id`) VALUES
(1, 'Appoets', 'Demo', 'demo@demo.com', 'MALE', '8465562222', '$2y$10$Zu.sOCi2XX2FuMnqOlxYAODvFA/ILo4gkAM7nq.IuirvBeQ6FFI3O', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(2, 'Thomas', 'Jenkins', 'thomas@demo.com', 'MALE', '8465562222', '$2y$10$KNxMw.qBYVBRMXAiRLaeBOJYBiPZq/7aWYZRob9BzCx0yBeopIzjG', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(3, 'Rachel', 'Burns', 'rachel@demo.com', 'MALE', '8465562222', '$2y$10$qEqjexcgdLHNrUT0s6D5YuWF3TCxLdLrV35oHO0I.Z0nMZLNeXrjy', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(4, 'Lorraine', 'Harris', 'lorraine@demo.com', 'MALE', '8465562222', '$2y$10$I7YfNi0L1WHtfIcdiumX5.45b21wODfKyzChXTNt3SUHvjifou2zG', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(5, 'Adam', 'Wagner', 'wagner@demo.com', 'MALE', '8465562222', '$2y$10$4mV2zVD2Qv2lyUGyNnwvbu0Ck8bEbbT5arpL6xV6HHfytM3HhGmHq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(6, 'Christine', 'Forshee', 'christine@demo.com', 'MALE', '8465562222', '$2y$10$nDACwme0LqIuDK2exr.ek.2dcqO6g94LpcbVwT9sUcCxhno4BdQeC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(7, 'Logan', 'Arce', 'logan@demo.com', 'MALE', '8465562222', '$2y$10$BVix.aKBC68Oh9z6gSj3hOwheh0X0E3Cz.Zsf0ph0csXBuxHto/5a', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(8, 'Joe', 'Demo', 'joe@demo.com', 'MALE', '8465562222', '$2y$10$6vvoGhCuaI/pNW9Cajj0M.EwxZwVLNKoFXgPrQz1cqU4bZB0NAEw.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(9, 'Price', 'Jett', 'price@demo.com', 'MALE', '8465562222', '$2y$10$KfIXJFXHMAnxWChPNP243.oPbiyJq.9RRT7orYwNA8aY7PyXsSi6.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:47', '2018-09-22 14:16:47', 'manual', NULL),
(10, 'Lloyd', 'Bradley', 'lloyd@demo.com', 'MALE', '8465562222', '$2y$10$VtGCoUa0E4xN7Y9jz3XzF.b8vlt2G0vhAm.oz.sCNv335n4CTseWK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(11, 'Evans', 'Thompson', 'evans@demo.com', 'MALE', '8465562222', '$2y$10$7nzzNuqwWgazBq01Pm7Zeui0agMj6JQXmBGpAw3kJjIOTL6d/u4/i', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(12, 'Jerry', 'Neely', 'jerry@demo.com', 'MALE', '8465562222', '$2y$10$XfKm0dwCdWiLjwBIDpipgud8sGEPlvgkh.G.pZnaOVhlgu9df5ch.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(13, 'Teresa', 'Vaughn', 'teresa@demo.com', 'MALE', '8465562222', '$2y$10$pnBqsinUhYktNIChlDF7LOPj5j0P/Cc7GIni1j23KvP540GSX/Nji', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(14, 'Sarah', 'Gibson', 'sarah@demo.com', 'MALE', '8465562222', '$2y$10$lxCDqjnwoH42t4Y0lX1vBOdbhR.b3STt83PkfNHcGxq3QASiq9YBq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(15, 'Regina', 'Delacruz', 'regina@demo.com', 'MALE', '8465562222', '$2y$10$.61DouUgV/aCsxYh0qYq..yXlZ6firHI7tlP6v5NNDtedWj4lUCzi', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(16, 'Anthony', 'Ferguson', 'anthony@demo.com', 'MALE', '8465562222', '$2y$10$mdSCLsUZCCZ7ifmY4Cbv.uVDrzF6LCjNfsp1Gj6PVSOjlXQ0ydTsO', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(17, 'Gary', 'Maple', 'rasheed@demo.com', 'MALE', '8465562222', '$2y$10$Y26KkbxPfrkJpxkhEW32.OpM.p3fhO4tcInSpoR3CUAB58ween/aS', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(18, 'Robert', 'Ferguson', 'jack@demo.com', 'MALE', '8465562222', '$2y$10$A.XDNIoFu2yqz8P4aHKuAuAxK/eim1V/dNkwPHW6wFIg8zAB489xC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:48', '2018-09-22 14:16:48', 'manual', NULL),
(19, 'Charles', 'Ferguson', 'bobby@demo.com', 'MALE', '8465562222', '$2y$10$kkaUzkgsrsWK2PwQFNnu6O/iQKiGZVjG.fL2J0n493tJpuB6siV0q', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(20, 'Michael', 'Ferguson', 'chunky@demo.com', 'MALE', '8465562222', '$2y$10$1pGyigPNcDX3B4i7Qr6ejus3XIVxQw75RatQKXALzKFsewr0yxOU6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(21, 'Patrick', 'Ferguson', 'silk@demo.com', 'MALE', '8465562222', '$2y$10$8IMiZwZmXi32ZYZYK5rXYee4L6xfzVCGpV63MCcqW0RGXS8JZw712', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(22, 'Arturo', 'Arturo', 'gil@demo.com', 'MALE', '8465562222', '$2y$10$8U9gnhn03zajKr/7JYeeAuFl5XIpMCFxsTCH.kb/EU4YT2Flsdik2', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(23, 'Anthony', 'Ken', 'stego@demo.com', 'MALE', '8465562222', '$2y$10$O7ipJPdjyj5fKEZ.C3mc4e/Ulk9JPz2hwk5rqYRomzbi3LQ8b3H3.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(24, 'Anthony', 'Clinton', 'rodney@demo.com', 'MALE', '8465562222', '$2y$10$CmOKiE5q6tJyD1sGcYwZGu1jFCjj.yaXSlmSAcRmbO8yJNl3wxRjK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(25, 'Gabriel', 'Ferguson', 'spork@demo.com', 'MALE', '8465562222', '$2y$10$tFl..GIuABsmHryiyeWWROE8it6MSiCO1Y0UCoICOruLZ.KtHaJey', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(26, 'Paul', 'Ferguson', 'paul@demo.com', 'MALE', '8465562222', '$2y$10$Vi7jMhM5dlsUhUFm2EVG5ezOyalTRqUrSIvVotAdRdZM0emW58R36', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(27, 'Gabriel', 'Giuseppe', 'giuseppe@demo.com', 'MALE', '8465562222', '$2y$10$1J5f8emkOjRPtEs762oRHO7Jm/3SZJvJ9QjvWTPO.9FxNpowuQITW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(28, 'Pog', 'Ferguson', 'pog@demo.com', 'MALE', '8465562222', '$2y$10$yccXGJagM6bO8mqi9fOKfuaiGCgDGwzlS0TVUO2Gcx3Q7VG/tRvQq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:49', '2018-09-22 14:16:49', 'manual', NULL),
(29, 'Steve', 'Ferguson', 'steve@demo.com ', 'MALE', '8465562222', '$2y$10$NSYxJp6HFFnwtZWtwIfiGey2Munt9S6Pzb6iENGSjyUlWYIKU0YOG', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(30, 'Beauregard', 'Asscan', 'beauregard@demo.com', 'MALE', '8465562222', '$2y$10$aSXNTpVWiUCmQI7Oex.aQuNhd714u1MHJ.m9jtuwMXWhDjaBHBDmq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(31, 'Tex', 'Montreal', 'tex@demo.com', 'MALE', '8465562222', '$2y$10$JRZtR5HBl49W5BK9jnlfkOHPQqqVvdAInTZBTLWS2LTQVWUYhwoti', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(32, 'Ambassador', 'Nikolai', 'ambassador@demo.com', 'MALE', '8465562222', '$2y$10$LbGfYj1GART9vB2UdXn0oeXgJzUwEgJfwGZ7.53xHcnhk0IDqt9J6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(33, 'Yolo', 'Pepperoni', 'yolo@demo.com', 'MALE', '8465562222', '$2y$10$kVzVF1deKkgQNBWemWLNiehiFLf0o.OawRkLTai2hSJ6YjEt857uW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(34, 'Hank', 'Fracas', 'hank@demo.com', 'MALE', '8465562222', '$2y$10$FUsgXNyJiwQYNFP0TXxYGeHsyIqpSxaRGCzQ/Q9I58dSWB2mNLkUi', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(35, 'Magellan', 'Lasagna', 'lasagna@demo.com', 'MALE', '8465562222', '$2y$10$sCEAqlByVNstvxCDxB5rSOIvXlIeDQxqgLXl3hay94HFhjYgsj6g.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(36, 'Bonezone', 'VanLandingham', 'vanlandingham@demo.com', 'MALE', '8465562222', '$2y$10$np1YrMAYkn9BspdgpAsbcO1n8mUINX84acGbbf2lJQWXWowAW.n6.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(37, 'Carl', 'Discotheque', 'discotheque@demo.com', 'MALE', '8465562222', '$2y$10$R/9b3/w9luwAYXuf6II.F.071VvlINJOdccYOrfliON3BPo3DNWmO', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(38, 'Teddy', 'Nuggets', 'nuggets@demo.com', 'MALE', '8465562222', '$2y$10$4SaOgwkfCCNy3tfDuay4Uu61xJ77ZCx7lJVBacfcjg.8V6JRP6mma', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:50', '2018-09-22 14:16:50', 'manual', NULL),
(39, 'Kid', 'Lupus', 'lupus@demo.com', 'MALE', '8465562222', '$2y$10$DJSqtn5cjlhPMq6Sek6DB.oXnoxizz7LQr9neRizLQqCy1Ovificu', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(40, 'Kale', 'Arugula', 'arugula@demo.com', 'MALE', '8465562222', '$2y$10$59s4tyq14F77U2lopujbKekiM98DMtixls2Pp5LOcSJ3jCpXkTQ6m', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(41, 'Luke', 'Sexgator', 'sexgato@demo.com', 'MALE', '8465562222', '$2y$10$kiOotrvBuITi8nREvYD19e4p1WMPADSgHzmxa1MJ.glCVeI5WD9si', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(42, 'Ludwig', 'Instagram', 'instagram@demo.com', 'MALE', '8465562222', '$2y$10$ZIsISNVyIUHyUmStbu/Boeq/u7qfw94ip.TgBBr44AbGLfJZI635a', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(43, 'Hector', 'McHector', 'mchecto@demo.com', 'MALE', '8465562222', '$2y$10$qOCw9R/LeLJlVEhDo9G0huTCtMjkec3HkrvQMsPnjUl.twDjcFVSK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(44, 'Max', 'Colorado', 'colorado@demo.com', 'MALE', '8465562222', '$2y$10$PiwWbaN8zOmAvOQGtqJlJutUGTtEjuwp7M/qTF2TMg6RlHHXcuPsm', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(45, 'Champ', 'Champagne', 'champagne@demo.com', 'MALE', '8465562222', '$2y$10$W59ZCen123GucUcWmcVDvuaI7vAuMP5FN45ftqpLgJihDKfGeTWY2', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(46, 'Samuel', 'Lockjaw', 'lockjaw@demo.com', 'MALE', '8465562222', '$2y$10$fJbc8x9H6ZauWeHfxb8Ys.4QEm22p.COaQv3kCevn9MBdDwITzrE6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(47, 'Jacques', 'Hollandaise', 'hollandaise@demo.com', 'MALE', '8465562222', '$2y$10$AjcGkdm9cPZPoL1PhzHwleq0jm.yeHNCzBWbgoT9doz3qEC3yNPz.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:51', '2018-09-22 14:16:51', 'manual', NULL),
(48, 'Christian', 'Buddha', 'buddha@demo.com', 'MALE', '8465562222', '$2y$10$6Z9APjpx.vfh1aAXRY3Vduccd0TrAYr5L5B6MgAZZHNkwnNsr1D/a', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(49, 'Carlos', 'Waterslide', 'waterslide@demo.com', 'MALE', '8465562222', '$2y$10$1aLI1dEKQPRRLK0Ep29kQ.cUoxkwz94UNFygSs2XTkkqqNg2eVWtC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(50, 'Colorado', 'Hollandaise', 'samve@demo.com', 'MALE', '8465562222', '$2y$10$ZQaY5glYOU4qlLmBV4p68uWbvwU2pzlPmRcg9Iwidw9Y3DvcYQS8m', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(51, 'Edgar', 'Hollandaise', 'edgar@demo.com', 'MALE', '8465562222', '$2y$10$sdBEq8wS35JWanp78CrRO.FOLrtJHHCU0d8By2nc493oFpjEJ.//i', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(52, 'Omar', 'Buddha', 'omar@demo.com', 'MALE', '8465562222', '$2y$10$kw/L5o351UIt8eJA0CGgLOLHyKUzl2IBd.7DNji11Mwlj35ta6GPy', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(53, 'Derrick', 'Hollandaise', 'derrick@demo.com', 'MALE', '8465562222', '$2y$10$7/XjlfQR85udfdQg9P76a.98vop7Ce.1rRdhxwLtMex1VLycN/Kaq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(54, 'Hector', 'Hollandaise', 'hector@demo.com', 'MALE', '8465562222', '$2y$10$f6Va6cHsk9EJnfYK5OTh1ORcsfQGI0mMV1kGmO2ynjbCaKMRjk..y', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(55, 'Douglas', 'Hollandaise', 'douglas@demo.com', 'MALE', '8465562222', '$2y$10$YSB4dcqBfSpe1bva62QzhOaFpxzFG3RC/Mq7D3DD.utEwtVhZ1EL.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(56, 'Frank', 'Buddha', 'frank@demo.com', 'MALE', '8465562222', '$2y$10$UpIGP2aeGCLIa9aHstKSu.DoClg7E7hGRWiB7MWpfwwKO53KTv6ZC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(57, 'Tristan', 'Hollandaise', 'tristan@demo.com', 'MALE', '8465562222', '$2y$10$KFPy3AYPq3LsF3jfcnzrdOYWIZS8DGImq47iyGZr0fS3Cy.9Zu41C', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:52', '2018-09-22 14:16:52', 'manual', NULL),
(58, 'Collin', 'Ken', 'collin@demo.com', 'MALE', '8465562222', '$2y$10$qqAQGkfkRrGOnq9c7auNx.drCydEbG/lLnwCRLPA/7YkAr7R9/6Ie', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(59, 'Troy', 'Hollandaise', 'troy@demo.com', 'MALE', '8465562222', '$2y$10$M/DpzcBcSimO6PZaxnzl6O6wqd8snw6m..I1GNUVcMG.7ReeP5QJG', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(60, 'Roberto', 'Hollandaise', 'roberto@demo.com', 'MALE', '8465562222', '$2y$10$UQEGMQcsk6L./ixQkctz2.hWQUZQQWeIDSWwUPoB98TnidBjmskD6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(61, 'Jeremiah', 'Buddha', 'jeremiah@demo.com', 'MALE', '8465562222', '$2y$10$5nSRT8EOaejZxjcjo0KR4e4ajg2cMTM7w7Kjj3PYhykyT8yRFfmvy', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(62, 'Jonathon', 'Ken', 'jonathon@demo.com', 'MALE', '8465562222', '$2y$10$KLmdN5DhYxCw2vdWRNnSIOBCei472pb0UbHM2jq5V12tMSynUXqpW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(63, 'Sergio', 'Hollandaise', 'sergio@demo.com', 'MALE', '8465562222', '$2y$10$x92PvHtLHDndNOCZY22PSOThghfcHRlUVa/gmFFWz6PI32xq495kO', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(64, 'Fernando', 'Hollandaise', 'fernando@demo.com', 'MALE', '8465562222', '$2y$10$IwwcvvY89ygRzB3Ja5Nyo.oGjbWA3YwMAsVKH4ZbAhi58NhOmOooK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(65, 'Philip', 'Buddha', 'philip@demo.com', 'MALE', '8465562222', '$2y$10$XTb5R6JBsLukU3BuGxtzdudQLfhDqWEDcLoLgq/WvzKFPXHz/qB0y', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(66, 'Andre', 'Hollandaise', 'andre@demo.com', 'MALE', '8465562222', '$2y$10$jgkJ0LhPZeXcIgFag6gSv.ZjKHhvuvh8x3oKf2TUXlNGvqX0mBABu', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(67, 'Johnny', 'Hollandaise', 'johnny@demo.com', 'MALE', '8465562222', '$2y$10$oe51DPdq6v1dGu2fKEZsCOea4EVK1Qqthzd9ocJfs5VVw6UuCv8oe', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:53', '2018-09-22 14:16:53', 'manual', NULL),
(68, 'Edwin', 'Ken', 'edwin@demo.com', 'MALE', '8465562222', '$2y$10$3/R0TulIDdC2cAIM7bm4muV5LXEpVcwoEdx/cXrJeOfUMBgv.9BFi', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(69, 'Ivan', 'Hollandaise', 'ivan@demo.com', 'MALE', '8465562222', '$2y$10$nTq5TiKTZQ8dItJmuQThVOCGkHyXYsfEsb2OLCGSuw3VUqKArYbNu', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(70, 'Cristian', 'Buddha', 'cristian@demo.com', 'MALE', '8465562222', '$2y$10$yULAeZzSh2KKHLIqTYKyYuYSsGHrYxMw4tGrGwdaAqwLFPWrfqO6.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(71, 'Clayton', 'Ferguson', 'clayton@demo.com', 'MALE', '8465562222', '$2y$10$Fb3bkhSdiWKRkWQJMwu7pOySedUrKnTKh6Nhh1iwpBWUWp9O2K/li', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(72, 'Levi', 'Hollandaise', 'levi@demo.com', 'MALE', '8465562222', '$2y$10$7ywP6BaLVK2AGpWYqICD4eShB6dKuJTPZg0pNmggTC.jMsnpONBlW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(73, 'Curtis', 'Hollandaise', 'curtis@demo.com', 'MALE', '8465562222', '$2y$10$ARGTnVLkS7Mm30Veo2AtHe.Br9cVYEp0Tp.zadi40ws5zo4DZSXjK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(74, 'Gary', 'Ken', 'gary@demo.com', 'MALE', '8465562222', '$2y$10$0uLbQ9rALCvtob7WFPpHe.fq6QV2oCtUaUbI0IBXOvpNZcvbQyglO', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(75, 'Darius', 'Ferguson', 'darius@demo.com', 'MALE', '8465562222', '$2y$10$A3poNFz5uCGzbmHjo/hPN.xIcFzdw11wNfbBs2Sz6.7Nn1NmZUVMO', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(76, 'Nicolas', 'Buddha', 'nicolas@demo.com', 'MALE', '8465562222', '$2y$10$YOz7ikzc912Pn78ely.o7.70mdDwEtcAYd0mzqBmfZ1RpgmdNj4M6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:54', '2018-09-22 14:16:54', 'manual', NULL),
(77, 'Dennis', 'Hollandaise', 'dennis@demo.com', 'MALE', '8465562222', '$2y$10$vDXZHdfCfFnL8dZqp6Foi.crHKMDX4y0FoaVPzz849cdJnJ0VwyJK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(78, 'Andres', 'Ken', 'andres@demo.com', 'MALE', '8465562222', '$2y$10$u6J80AZW.rGsXmApH6MVpuY09nBPID2sTNoEasIpPna7b6Pk0TLXa', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(79, 'Jackson', 'Ferguson', 'jackson@demo.com', 'MALE', '8465562222', '$2y$10$gEKodYyLc4pUO2LnDLCR9uJadxtOvHwxBadoLGZWt/5IpEjePqP.G', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(80, 'Maxwell', 'Hollandaise', 'maxwell@demo.com', 'MALE', '8465562222', '$2y$10$chiP.pxZFeSvqArSL0Tro.DlndIaf/UHjCRpH2Z5Py17rpddFWaaW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(81, 'Cesar', 'Hollandaise', 'cesar@demo.com', 'MALE', '8465562222', '$2y$10$zDnGwBS1OHPsNeeKVtVQG.aJpM7yMUX.nBin0OWdp8romgyz9gIGq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(82, 'Drew', 'Ken', 'drew@demo.com', 'MALE', '8465562222', '$2y$10$FIGscy8xOgr1fsGyEDoPau/z1zdHS818I8pPsz1ZuVBCUwfIhXiGW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(83, 'Randy', 'Ferguson', 'randy@demo.com', 'MALE', '8465562222', '$2y$10$EHTc42N6sf0SX4WMaXZb.eS53Idm8LkA5faAt8aPY4xzk/q1O5mxa', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(84, 'Pedro', 'Hollandaise', 'pedro@demo.com', 'MALE', '8465562222', '$2y$10$.rEEaXVYoW6gkal/MfgJ9.cgi5oEcU1pMF0WCf05KF8Qna9B6UxNG', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(85, 'Ruben', 'Ken', 'ruben@demo.com', 'MALE', '8465562222', '$2y$10$NhF7/GvxBYlDXCtHEf6LjutyIFrJ5LKIYlJfBZ4ZhGYWDJRqJf5YK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:55', '2018-09-22 14:16:55', 'manual', NULL),
(86, 'Alexis', 'Ferguson', 'alexis@demo.com', 'MALE', '8465562222', '$2y$10$VwTPFpYWIdnWrEQeLDZDKe50rKtyB3wFI1XNArbFzVB5W9nD3sKOy', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(87, 'Adam', 'Ferguson', 'adam@demo.com', 'MALE', '8465562222', '$2y$10$XFyp6WFMMfXUq2cqnbdQLOXhRyVR8QnUzcMFIFSA85dTAA6iTEb1O', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(88, 'Nathan', 'Ferguson', 'nathan@demo.com', 'MALE', '8465562222', '$2y$10$VYeQlOvCtV2SpRS8kg459u3bVfFp1ANrVf3LjSrsJw4QzI0M1mfrq', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(89, 'Richard', 'Ferguson', 'richard@demo.com', 'MALE', '8465562222', '$2y$10$k0WIKLQuR/QxjtbGDpq8ae0RVhSMCNXDCPFa4lzyoOEwtvr1mKWgK', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(90, 'Sean', 'Ferguson', 'sean@demo.com', 'MALE', '8465562222', '$2y$10$DTQQqnNaKS.3zeNrYgrMneaXEpB5MRuhXDq/djBSSzZKLEmaadqAe', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(91, 'Charles', 'Ferguson', 'charles@demo.com', 'MALE', '8465562222', '$2y$10$3R2pi/eM3QFWv0ewwYybMOvyh/1wNBe.F49xUdS.SoANjNQ0q4MU.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(92, 'Patrick', 'Ferguson', 'patrick@demo.com', 'MALE', '8465562222', '$2y$10$MzAVmnA4R1GFUnZSCHT0NOcld7rtT69MOeZHFWM9KM3Jc2ksEHGle', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(93, 'Jason', 'Ferguson', 'jason@demo.com', 'MALE', '8465562222', '$2y$10$aIuCIAQlgQZvoGtYkxnZ6OtAe8kWRTG3qXZIkMivtSrc5UXDpHDj6', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(94, 'Luis', 'Ferguson', 'luis@demo.com', 'MALE', '8465562222', '$2y$10$YJUxP5YfhTPDHdC2zVx46u9RCOKduAS7/eFvlweV8uWq0HDt4wZXa', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:56', '2018-09-22 14:16:56', 'manual', NULL),
(95, 'Jeremy', 'Ferguson', 'jeremy@demo.com', 'MALE', '8465562222', '$2y$10$gZcfrKNRNYJ5x//OA3WNue4dIPOk5RdDsoWKabU3ALwjHgrEZgURy', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(96, 'Stephen', 'Ferguson', 'stephen@demo.com', 'MALE', '8465562222', '$2y$10$OiN0WUPU2tocVu6Fh5LwouB.xLrv7VfVa8VSxrrD1mCXiw.B2o3D.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(97, 'Mark', 'Ferguson', 'mark@demo.com', 'MALE', '8465562222', '$2y$10$Y.1BDoe6aYvpMpUv2uz06.7uZ7YjNHkpc98V.A.uBncetcxx/UWVa', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(98, 'Jesse', 'Ferguson', 'jesse@demo.com', 'MALE', '8465562222', '$2y$10$6QxCxE1jpeh34hOUazSPK..pZowODGuc24nUgO6.D050OIzaF624m', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(99, 'Juan', 'Ferguson', 'juan@demo.com', 'MALE', '8465562222', '$2y$10$/Xp6YQedYX9ze9uO1NtUCOFxcDkDAiQ3oq26xLtDa9xSi9E3AoA0m', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(100, 'Alex', 'Ferguson', 'alex@demo.com', 'MALE', '8465562222', '$2y$10$.Dw1XIVv1FzXCNF8T4MMYeLUVcekPPI7gH3tA8FPZFslFon7ICidW', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(101, 'Cameron', 'Ferguson', 'cameron@demo.com', 'MALE', '8465562222', '$2y$10$vhlfHPGexMUlj9rna8.JfOLWspFz20mewPClbnnCUbQBausAhZL0G', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(102, 'Travis', 'Ferguson', 'travis@demo.com', 'MALE', '8465562222', '$2y$10$8sX.J4oEJFO.8YgN9RmgMOKZGoQwCfO9w8YuuXd1E3lxgDKHvRbrC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(103, 'Jeffrey', 'Ferguson', 'jeffrey@demo.com', 'MALE', '8465562222', '$2y$10$19syKklzjK4cAoXlwMOiTuA9SAkBGcd6wUpfVBV/PfZRRbqjLCiu.', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(104, 'Bryan', 'Ferguson', 'bryan@demo.com', 'MALE', '8465562222', '$2y$10$EBC0hn53lKSDzz9qNGJ3xOrDqh5gbHD4D99ZtN.eZ/439ogF4qw..', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:57', '2018-09-22 14:16:57', 'manual', NULL),
(105, 'Caleb', 'Ferguson', 'caleb@demo.com', 'MALE', '8465562222', '$2y$10$p5EwzAnlSxFkcFa6IVU6vel6j.NAXSAKHEEAvTV1vh4EjX97vZ64W', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(106, 'Carlos', 'Ferguson', 'carlos@demo.com', 'MALE', '8465562222', '$2y$10$YD2R.jPWdNgwdvXEtunnH.Jqx8o.2EvRZjh74gxrqkXFpvs/QAOtC', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(107, 'Jared', 'Ferguson', 'jared@demo.com', 'MALE', '8465562222', '$2y$10$BXP.h31JdUlaqJtQBrIkfewqj8CNOYyWCuQwBUFTl9jKz4N52LJfa', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(108, 'Ethan', 'Ferguson', 'ethan@demo.com', 'MALE', '8465562222', '$2y$10$6RMZk/1aUPRcnlmiBfgSEu.6ouviFDkVhLXbUYQa2IEPFBk1in2Vi', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(109, 'Kenneth', 'Ferguson', 'kenneth@demo.com', 'MALE', '8465562222', '$2y$10$wMnF7S9MourjPLEMhZalXOd7a9H4CCZr..TCnXSRm4NsUNlTiAhza', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(110, 'Taylor', 'Ferguson', 'taylor@demo.com', 'MALE', '8465562222', '$2y$10$SkfFhIYC61ZIgqeHgz8XIugjBRF2vOxYirdVT4FLkUVrxBwTzIBpe', 'http://lorempixel.com/512/512/business/Tranxit', '5.00', 'approved', 0, 13.00000000, 80.00000000, 0, NULL, '2018-09-22 14:16:58', '2018-09-22 14:16:58', 'manual', NULL),
(111, 'Aapbd', 'Driver', 'driver@aapbd.com', 'MALE', '+8801976653445', '$2y$10$K6fQnP3GgVjcAxHt.H8V4OiBx49Xftxz/jJvbHmA/WDaa1NduzwVa', NULL, '5.00', 'approved', 0, 23.83551890, 90.36611570, 0, NULL, '2018-09-22 14:49:29', '2018-09-22 14:55:14', 'manual', NULL),
(112, 'Driver', 'One', 'd1@aapbd.com', 'MALE', '+8801717653445', '$2y$10$7pV7A6QgDUOC2Bk6oL3VYeoZ0BVsXFnKvym2qGJDIUum0NllZi4oi', NULL, '5.00', 'approved', 0, 23.83551600, 90.36611760, 0, NULL, '2018-09-22 14:58:40', '2018-09-22 16:11:58', 'manual', NULL),
(113, 'browser', 'driver', 'browser@aapbd.com', 'MALE', '1976653445', '$2y$10$BHrzXGV3vXiPFHVMbLUAue8d7nfx9Qv77H4oenWNmaS4jWwt4ZRa6', 'provider/profile/afa82a22f83d3b6b0bbae4b31cf5fe79.png', '3.00', 'approved', 0, 23.83551690, 90.36611760, 0, 're1czAa0MEUXQLu1uJhjMlLfRNxOxfWXFLABmptUMuiwWgCYYxCE17a9TL5y', '2018-09-22 15:03:29', '2018-09-22 16:37:20', 'manual', NULL),
(114, 'শফিউল', 'আলম বিপ্লব', 'javaorjava@gmail.com', 'MALE', NULL, '$2y$10$/d9Du5hpdcpN950/AvY06O0sHqj03VuhwU03nSDuvEz1B8HxbwRqi', 'https://graph.facebook.com/v2.8/10217455114954292/picture?type=normal', '5.00', 'onboarding', 0, 23.83555890, 90.36620000, 0, 'ln82JmxKEltOzIgkVKm2vsi6L9p6Qx9CYHQ53orfBOjgYgU0PMPo3REB1MUt', '2018-09-22 15:37:54', '2018-09-22 15:38:06', 'facebook', '10217455114954292'),
(115, 'Final', 'Driver', 'finaltest@gmail.com', 'MALE', '+8801717653445', '$2y$10$gK0sHsQX4OSfn.MYRrlL/e2Gg5MzOVZeRZah8IuyYtG17G6kK76xW', NULL, '5.00', 'approved', 0, 23.83551810, 90.36611740, 0, NULL, '2018-09-22 16:43:09', '2018-09-22 16:46:56', 'manual', NULL),
(116, 'Driver', 'AAPBD', 'driver1@aapbd.com', 'MALE', '+8801717653445', '$2y$10$puyCLABY9Dk974wXto/3g.Cz/S0/lGXJoKEGvszJiF6ufU7Y.E4ea', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2018-09-22 16:56:39', '2018-09-22 16:56:39', 'manual', NULL),
(117, 'Faysal', 'Ahmed', 'fsfoysal15@gmail.com', 'MALE', '+8801902987011', '$2y$10$fNMGs46BHNQk8Elao/VvYOeL7nr7Eu1bwULxw6i5Q465vFcz7jF8y', NULL, '5.00', 'onboarding', 0, 24.01427960, 90.41935920, 366543, NULL, '2018-09-22 17:13:41', '2018-09-24 16:35:23', 'manual', NULL),
(118, 'Abu', 'Khalid', 'khalid01735024490@gmail.com', 'MALE', '+8801918254274', '$2y$10$2PMvrjBdcJ6WSwwbptz24.6.S7A8pQQgPRcPpzJJboniaF3jSed.C', NULL, '3.00', 'approved', 0, 23.83573400, 90.36607520, 0, NULL, '2018-09-22 17:19:54', '2018-09-22 20:00:49', 'manual', NULL),
(119, 'Sakib', 'Hasan', 'mdmosharof567@gmail.com', 'MALE', '+8801763553147', '$2y$10$JM9cvGtxN3lWbOg5C.CJWOfmAQNE0boxkF2Pjj0I6rZPZ1uCdmy0W', NULL, '5.00', 'approved', 0, NULL, NULL, 0, NULL, '2018-09-22 17:25:23', '2018-09-22 17:35:46', 'manual', NULL),
(120, 'asm', 'salah uddin', 'atha.java@gmail.com', 'MALE', '+8801710444457', '$2y$10$uIFItFQ/5HII3yDfvX5c1eyhoKt5KVEXiimkshYXlOBilFopv1Ovu', NULL, '3.09', 'approved', 0, 23.83405360, 90.36850940, 914119, NULL, '2018-09-22 17:34:39', '2019-01-24 11:49:32', 'manual', '1898290646927834'),
(121, 'Borakh', 'Driver', 'driver@borakh.com', 'MALE', '1976653445', '$2y$10$rg8WDJ9MMYkmNS5SUOJxNOi2AsrjW6//SMtDrFnqi6qYulOqzEdMa', 'provider/profile/afa82a22f83d3b6b0bbae4b31cf5fe79.png', '4.14', 'approved', 0, -1.22195987, 36.87096291, 0, '001RmGyvxi03NBUtol4OHWdljtrhcqyK3ucNCRzgwsvzYNBo7t7pvDK0pAJE', '2018-09-22 18:43:51', '2019-02-01 10:45:27', 'manual', NULL),
(122, 'Faysal', 'Ahmed', 'foysalhasan768@gmail.com', 'MALE', '+8801902987011', '$2y$10$TgJr7nQt1zgNgOQUCl/.uuVIPQctpLghuDE0sHhlpHIalrWSkTfbi', NULL, '5.00', 'approved', 0, NULL, NULL, 0, NULL, '2018-09-24 16:36:54', '2018-09-24 16:43:18', 'manual', NULL),
(123, 'Faysal', 'Ahmed', 'foysaladmob@gmail.com', 'MALE', '+8801902987011', '$2y$10$ULMUfZywazuAVlHSsetc7OC765ZrV5u06LzEkV2IsDGBD0dqekIvS', NULL, '5.00', 'approved', 0, 24.01702830, 90.41547500, 0, NULL, '2018-09-25 07:33:40', '2019-01-09 17:55:23', 'manual', NULL),
(124, 'Shaiful', 'Sujohn', 'shaiful@brainstation-23.com', 'MALE', '+8801671573089', '$2y$10$8xpTB0.sfBxd9eoeyz0QDeyycjAM.xPn0kqZrI8wxg2aQZdndK/CW', NULL, '5.00', 'approved', 0, 13.16001210, 77.63618850, 0, NULL, '2018-09-27 20:29:50', '2018-10-07 18:44:37', 'manual', NULL),
(125, 'Farhana', 'Afroze', 'evanice.parlour@gmail.com', 'MALE', NULL, '$2y$10$p8B3Dg0i.1VoBJTRTCXMjO7wm6uqCSH6DIIhwe2xgufqmsH0EzHXO', 'https://graph.facebook.com/v2.8/1699485293496986/picture?type=normal', '5.00', 'onboarding', 0, 23.84017310, 90.37013690, 0, 'WAF3TZM4DDRNAwTFqJJyrxADK4eNhBt1HZX3JQtt8oYGkgnuiry1cGoREdZF', '2018-09-28 11:29:45', '2018-09-28 11:30:52', 'facebook', '1699485293496986'),
(126, 'Alfredo ', 'Zevallos ', 'gananciasonlineinfo@gmail.com', 'MALE', '+51921141833', '$2y$10$RnK.OZSHIOV0f5mRGS/Du.2d.ao7K9H3.VvqwssrvewR9qDwhT28S', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2018-09-29 04:30:41', '2018-09-29 04:30:41', 'manual', NULL),
(127, 'Tareq', 'M', '882737@gmail.com', 'MALE', '+8801670656335', '$2y$10$teX4MF96NJ/0dbOsLJ56zuXCDhJ9fUiSRkmN6wNzrP6ZuCXvzLEJe', NULL, '5.00', 'approved', 0, 23.85996350, 90.41425740, 0, NULL, '2018-09-30 20:45:55', '2018-10-03 12:50:14', 'manual', NULL),
(128, 'jewel', 'rana', 'tonu@gmail.com', 'MALE', '+8801744960015', '$2y$10$I4aOqyOLM0gzQqWJOevkfum.geVynoPpLfY3nqzl.67F06AkZ8Yf.', NULL, '5.00', 'approved', 0, 23.83552240, 90.36613080, 0, NULL, '2018-10-03 12:50:36', '2018-10-03 12:53:36', 'manual', NULL),
(129, 'App', 'Genius ', 'appgenius2014@gmail.com', 'MALE', '+254723839664', '$2y$10$s9CqaSaqkvrI7JJ0y9OYs.cbqnULjW8nkvPbVFunnqUBkTvLjPjg2', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2018-10-12 13:53:29', '2018-10-12 13:53:29', 'manual', NULL),
(130, 'Balayet', 'Hossen', 'nti@dhaka.net', 'MALE', NULL, '$2y$10$cmoFTolufRMKvHPGTCjesOa9418pYWzEIDdsMuyoEta/DecNWIdci', 'https://graph.facebook.com/v2.8/1883446088370401/picture?type=normal', '5.00', 'onboarding', 0, 23.70543613, 90.42392651, 0, NULL, '2018-10-16 18:43:30', '2018-10-16 18:44:22', 'facebook', '1883446088370401'),
(131, 'Quaviur', 'Rahman', 'quavy.shah@gmail.com', 'MALE', '+8801678242965', '$2y$10$3L6ve6uqhoJ0zqFg5L180u.DzoxyYW682y.pTf1Iiys5pFC7AcIFW', NULL, '5.00', 'approved', 0, 23.78976889, 90.41960728, 0, NULL, '2018-10-23 13:36:42', '2018-11-06 09:19:16', 'manual', NULL),
(132, 'Sa', 'Sam', 'almarinz90@gmail.com', 'MALE', '+3547805746', '$2y$10$FvQ3Wk0shVsPNc38UcUaxOueVaSk/fsiqfxoodoeUE8zRKONl9QdW', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2018-10-26 07:54:33', '2018-10-26 07:54:33', 'manual', NULL),
(133, 'Krunal', 'Dabhi', 'krunaldabhi@gmail.com', 'MALE', '+917622023454', '$2y$10$RdiW1V00ggrO03yFhAQgz.f.aXCgD69rIoXkLHbBTKR2rAKdjJC7S', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2018-10-30 12:19:26', '2018-10-30 12:19:26', 'manual', NULL),
(134, 'Jewel', 'Rana', 'devjewelrana@gmail.com', 'MALE', '8801615960015', '$2y$10$xRmIKMDgXUq2AF4gfrlP2.aZj.icYKXP/hoQsoSrA5bT4TPpfjuj2', 'provider/profile/a8738241f377dc2f5440b5cbbafea2c5.jpeg', '5.00', 'approved', 0, 23.83522940, 90.36609830, 0, NULL, '2018-11-05 08:50:16', '2018-11-11 12:46:11', 'manual', NULL),
(135, 'Tareq', 'M', 'tareqsfs@gmail.com', 'MALE', '+8801670656335', '$2y$10$2NGlQTO/PwkdWXtF8JzLn.tYWCED7p2W.WgSoFhFbJwTeCswu1Voy', NULL, '1.00', 'approved', 0, 23.86013640, 90.41390940, 0, NULL, '2018-11-20 08:03:30', '2018-11-20 08:13:16', 'manual', NULL),
(136, 'Farhan', 'Ahmed', 'farhan@gmail.com', 'MALE', '+8801627160340', '$2y$10$m9hw93ndtg2P13Z9GWbbCeVS0em8cs0UPcii.VWNBhhJS3WsF9ux.', NULL, '5.00', 'approved', 0, 24.01780000, 90.41819830, 0, NULL, '2018-11-27 14:53:20', '2018-11-29 11:43:16', 'manual', NULL),
(137, 'Fatemeh', 'Kheiri', 'kheiri62@gmail.com', 'MALE', '+989122598911', '$2y$10$bL9VTe5Jy6VlA7B0bWsZ8ejUo5m3Xz/zQkn5H3gJP6Eo4O4r0Hlp6', NULL, '3.00', 'approved', 0, 35.63923920, 51.48856650, 0, NULL, '2018-11-30 22:30:09', '2018-12-14 17:01:11', 'manual', NULL),
(138, 'Mehdi', 'Azimi', 'azimi891@gmail.com', 'MALE', '+989123722396', '$2y$10$qkCKuP9328if.iZWqAKvCedZiU/5729qLCIzNkjy3dUif2P6pz5kW', NULL, '5.00', 'approved', 0, 35.72601680, 51.32416110, 0, NULL, '2018-12-05 13:47:46', '2018-12-05 14:22:10', 'manual', NULL),
(140, 'Ekramul', 'hoque', 'ekramramu@gmail.com', 'MALE', '+8801760606288', '$2y$10$GIDrbpud21oXA8HtFybT2OWw23ZMU7ZvxlpHkoVSjbB0ggL2IWBEW', NULL, '1.00', 'approved', 0, 23.81033100, 90.41252100, 0, NULL, '2018-12-08 06:16:16', '2018-12-10 11:29:48', 'manual', NULL),
(141, 'Demo', 'Demo', 'rashed@aapbd.com', 'MALE', '+8801922549551', '$2y$10$i5GCCSnklPjWjgLtbgNpCeQdewYEDpysOAxe7dKAmcg91BlWWwX.2', NULL, '5.00', 'onboarding', 0, 23.81033100, 90.41252100, 0, NULL, '2018-12-19 12:54:53', '2018-12-20 05:15:03', 'manual', NULL),
(142, 'rosik', 'itagob', 'test@test.com', 'MALE', '402020300', '$2y$10$1ZxdtAZRLaokqEh054KwautWL48iZiutLwog/6P7blz6T0GtMCIPK', NULL, '4.50', 'approved', 0, -33.87025198, 151.20833025, 0, NULL, '2018-12-26 10:47:12', '2018-12-27 05:52:56', 'manual', NULL),
(143, 'Mr', 'Mr', '16469mr@gmail.com', 'MALE', '+919148569694', '$2y$10$8vjURLQEVok9vLmy7cEgae55g6KCcY.P7t2JX1xP5iS2Xz2N9t1ne', NULL, '5.00', 'onboarding', 0, NULL, NULL, 0, NULL, '2019-01-01 12:24:35', '2019-01-01 12:24:35', 'manual', NULL),
(144, 'Sunhera', 'Jara', 'sunherajarabest@gmail.com', 'MALE', '+8801922549551', '$2y$10$oN/zlQaEvwt1bhgjihFZ4OasmUrE/b6Tv/qT9xQLtvU.MGNNj6vl2', 'https://graph.facebook.com/v2.8/761158504218333/picture?type=normal', '5.00', 'onboarding', 0, 23.81033100, 90.41252100, 0, NULL, '2019-01-08 09:48:56', '2019-01-08 09:54:24', 'manual', '761158504218333'),
(145, 'Manoj', 'Randeniya', 'manoj.randeniya@nexeyo.com', 'MALE', '+94710812785', '$2y$10$JP3f7aFiXgb9bITN5.dCfu5Yap/simBtjyeGtzvXoxXj4M84.dRFe', NULL, '5.00', 'onboarding', 0, 6.87566763, 79.92111108, 0, NULL, '2019-01-08 15:37:08', '2019-01-08 15:39:16', 'manual', NULL),
(146, 'Marian', 'Kmosek', 'nairamomk@gmail.com', 'MALE', NULL, '$2y$10$vKU/2pnMqAV3zgeE/mRunutlaZY/.86y4Uv1LNl1Rp5QoPGWQHhCW', 'https://graph.facebook.com/v2.8/2174630739532269/picture?type=normal', '5.00', 'onboarding', 0, 49.86999360, 18.42054870, 0, NULL, '2019-01-08 19:56:52', '2019-01-08 20:20:06', 'facebook', '2174630739532269'),
(147, 'Niraj', 'Mishra', 'niraj.flpg@gmail.com', 'MALE', '+918789384727', '$2y$10$3ySDl71tJB1CODcenJswleKc3nSNwuvj7jbDdmwj.qGg/6JjoGBXy', NULL, '5.00', 'onboarding', 0, NULL, NULL, 264856, NULL, '2019-01-17 16:29:55', '2019-01-17 16:40:54', 'manual', NULL),
(148, 'rohsik', 'test', 'testing@test.com', 'MALE', '0404040405', '$2y$10$f7kZ7mn4xUGKOs9yeKv5R.bU4t1fdh1FZGTYeOD2WP4xtmqENv7Sy', NULL, '5.00', 'approved', 0, 0.00000000, 0.00000000, 0, NULL, '2019-01-19 05:45:39', '2019-01-19 09:06:48', 'manual', NULL),
(149, 'Biplov', 'Gautam', 'biplov.collegesearch@gmail.com', 'MALE', '+9779841168924', '$2y$10$GyUJx73rELVbP/BVz2H7vu7saOenOL52AAHh3.rDjLYAo2VH5ee5u', NULL, '5.00', 'approved', 0, 27.70436730, 85.32267060, 0, NULL, '2019-01-25 07:24:25', '2019-01-29 07:30:05', 'manual', NULL),
(150, 'Omar', 'Yerden', 'omaryer@hotmail.com', 'MALE', '+541134808209', '$2y$10$kV2hhqmxGqXBRLPi.nfwn.e3co7/cqwmrF/TBVfnRtD2K3RRLT4qG', NULL, '5.00', 'approved', 0, -34.61264240, -58.43151610, 0, NULL, '2019-01-29 01:00:54', '2019-01-30 15:33:14', 'manual', NULL),
(151, 'Omar', 'Yerden', 'omaryer87@gmail.com', 'MALE', '+541134808209', '$2y$10$fx9Fn6FCYCSIzfMUydFNEeVJVHYlUdWvyFluk4mutTa.PUa9ZkcnO', NULL, '5.00', 'approved', 0, NULL, NULL, 0, NULL, '2019-01-29 01:05:28', '2019-01-30 15:33:00', 'manual', NULL),
(152, 'Ivan', 'Cami', 'ivancami@hotmail.com', 'MALE', '+5492994091443', '$2y$10$JBC9EDei1ZdNM0VbFJ4yWez6bO5PK3/54U7h91kZEcSbF.Xi0jME2', NULL, '5.00', 'approved', 0, -38.94972503, -68.06007758, 0, NULL, '2019-01-29 01:47:05', '2019-01-31 21:47:11', 'manual', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_devices`
--

CREATE TABLE `provider_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_devices`
--

INSERT INTO `provider_devices` (`id`, `provider_id`, `udid`, `token`, `sns_arn`, `type`, `created_at`, `updated_at`) VALUES
(1, 111, '', '', NULL, 'android', '2018-09-22 14:49:29', '2018-09-22 14:55:39'),
(2, 112, '', '', NULL, 'android', '2018-09-22 14:58:40', '2018-09-22 16:12:39'),
(3, 113, '3058a54f323bff22', 'cQTYSuqk3Rw:APA91bHdMAnDwvl86HjfFH084E87XymTs3bgfZpD-gMK6PckDQIDP-opFjfIATPx164Nq2HxUNe65EMGO8OyY6UbUD1r6jxDqKSTRJ1iigWatxtN-3lAhaz3g4fXVgZtZMbaLG7Rccvm', NULL, 'android', '2018-09-22 16:19:25', '2018-09-22 16:23:31'),
(4, 115, '3058a54f323bff22', 'cPIPWJGXz58:APA91bFKhnhcT5_s2ZKznfQAwppzkrJLs60xwVJdaQZjkXaYegd6qzDm4b4E4J38B7QwYHfF1fKcfjIv7bbooiSD9UKrer4_oaDpWuxxu6LC6B5fjUfHgafj1q79Iu5EOXiQhN6mJbgS', NULL, 'android', '2018-09-22 16:43:09', '2018-09-22 16:43:09'),
(5, 116, '', '', NULL, 'android', '2018-09-22 16:56:39', '2018-09-22 17:16:14'),
(6, 117, 'a8899bed713cae7c', 'ekK8w9f-btM:APA91bFC863aLAcaHj2c6I7ct47WjFpSXmnZnDi7ldmyNRCXOsH2xSwm8Jp4c3ASbVBzZpQ2_5nSa0keoqlqH7HF_9wjByJmY26anqi9RVkt6aXX-TNM4Tbw34e3kk1tbAyxoDKn4g-X', NULL, 'android', '2018-09-22 17:13:41', '2018-09-30 08:07:05'),
(7, 118, '912ef98b577685a4', 'dg-DpGNyjXo:APA91bHjYpSwKSxNuOLIQC6JvcYKAmgy4aSlG5tNeujtOE7NnokvqBtVXaPd0Ywov0WJ1Ws26bzJY9oAIe4nQhmXyl9cGjwtpVnDRuUwheFABfxNQuroEPdRIjrRXWPVEMzndPUWd7L1', NULL, 'android', '2018-09-22 17:19:54', '2018-09-22 18:57:19'),
(8, 119, 'a000b13772daa931', 'c9qqy4meK5I:APA91bE13OPJJZl1Zm22tU1PbYaA0mJhUWF_NcgIdujHjZqAOBL3B_bT-ww2lzQ2b4Tt6CgBN-mj5UBNxQI1mEycrzzmAdQ0l_eBoKifvRwG9xyBkUDOdcbcXKaT5hlWz7H--DcaDykA', NULL, 'android', '2018-09-22 17:25:23', '2018-09-22 17:25:24'),
(9, 120, '63e0a778cefbe01', 'c2rQCceinIo:APA91bH6XV7xpg9VaACsvGk97dQbw188mQ6XDM0IwX5YYFJYAlRiKvEzLIzz_nrJTunegPZ162wvs1tuJSW3GPn64qFVvi8PCjsh5l0CJN04rLqXBVIF1OJGwD8RvRC2FoXGzhgaT-kw', NULL, 'android', '2018-09-22 17:34:39', '2019-01-24 11:15:16'),
(10, 122, '2e533656606530f5', 'null', NULL, 'android', '2018-09-24 16:36:54', '2018-09-24 16:36:55'),
(11, 123, 'c0ac296604faf8a9', 'fm6A1kSGlrA:APA91bHHoviyFa6ghxqku0CGPBXgJ8UjmNZ6rVWjsc8zgByNR-K1NFUyJGVzY8VTemnvx-m2_amM1uw1XlQYg_KT_GOCHvdul-DzRY4HaKNetYYedmSb0QHu_v_jpeWMjkU49ea5G_QW', NULL, 'android', '2018-09-25 07:33:40', '2019-01-13 16:42:36'),
(12, 124, '609A42C3-6F9C-4683-80F3-995F1DADDCAC', 'No Device', NULL, 'ios', '2018-09-27 20:29:50', '2018-09-27 20:35:25'),
(13, 121, 'F14A0264-733D-4005-A894-DF0300663B3C', 'No Device', NULL, 'ios', '2018-09-27 23:59:04', '2019-01-30 12:00:22'),
(14, 126, 'b60c7f4577c8a9dc', 'cXLIMpvRwuQ:APA91bHYJzLnUsd-OuIp0_C2dbf8S79ChOntOe-yndnaSyCg8O6bDGNAhqYMaJs_W9IM7oxgm5cYdprrRFMRQBYTC8wM0ROW7gKubVdglmjjT5ndZhYLPTC-Rsb19zsV0R_mBU97mPPS', NULL, 'android', '2018-09-29 04:30:41', '2018-10-01 22:37:42'),
(15, 127, '7ac751774126a791', 'dKlUa-j7pqM:APA91bGeMGlkuvheS-Rl5sDf2JdTTxwsmf8zef2Qjd5xAoYOcXnXeNbW1JKPFbvHLF86mca_c3HdebNPSIMK47sJOe05DCPyHGD1GCE4yzuCkxJZ0NHfKixyfBjbqF7Eao8fGxOX_QIZ', NULL, 'android', '2018-09-30 20:45:55', '2018-09-30 20:45:55'),
(16, 128, '', '', NULL, 'android', '2018-10-03 12:50:36', '2018-10-03 12:53:50'),
(17, 129, '47fd8a676d5e2c8b', 'fxg5FNQmLQY:APA91bHdKtWfHxd4vfG3tqc3i75aPZ05utWpR0oKl-4w6ZQZ4X5P9SmaYejCvOdoQ6cGPx7T2Vs8q6IiDHy_pkZe6Tl6_O20CWxz8Wa-XNZdCuw0lQMjJxjQzj8N8DezmOftmP3y4PY5', NULL, 'android', '2018-10-12 13:53:29', '2018-10-12 13:53:30'),
(18, 132, '4759c03f745a5eba', 'ebPBSwdt7I8:APA91bEY5PoRdsJBF2HXlLNqGZx3BceNgSCDw37hU66YcnGXpzPH0JlSr7CxrU4-BpZJ5fzXxH8oM5a1Urczm-oWtvuXEP1zvDHxERc0GEjrZiq06M2chSQETlDQ29z0hHnxo-pBREOm', NULL, 'android', '2018-10-26 07:54:33', '2018-10-26 07:54:33'),
(19, 133, '383f8c138333228a', 'd-YMjHxvYvI:APA91bG7NdrsgSNDRfj2pDIGGwo-a0aXuQTBXklT9cVUwKP1x2YNisFknT17Rk37pRmD8l0ROc4uzMS9Ebqcckb3VKfTHno0jZNoGyEm5Hg49wbM68DxBWmBvacn7tGRILg6gbWNliba', NULL, 'android', '2018-10-30 12:19:26', '2018-10-30 12:19:27'),
(20, 134, '78022681aef3ff90', 'eBX6eFGu_wE:APA91bGpD9CIlg1oEnHYNE-k9O3Rw9Zf0655TSV12aCaHbJaAtGq4T77q_g9dfbP4uaIHFKvJXiggVNxhaCQFsrb-LDrbalE6ahDShB7O0h3bgm035KCOsp650w9yGqS7H8_nBkLlgcE', NULL, 'android', '2018-11-05 08:50:55', '2018-11-06 07:42:29'),
(21, 135, '7ac751774126a791', 'dz1pTeajwZE:APA91bFQbIMYADUESVlZgvrRDg1jIP1_gIHs9sgsQX1WHCyGJbE7Nm5wjnE7Z0gc3eLPI2ycTk_BiwLbPi3RpCMN3Ww86-HIpFZ0Uwfw05npa6GimbQkNG2Vvm9eEnmqLT1IUYuH_At_', NULL, 'android', '2018-11-20 08:03:30', '2018-11-20 08:03:31'),
(22, 136, 'c6affbabd08da350', 'eASQ7lMY8pk:APA91bGy5_UPCacDMW4fo3bEHDOhswytBj9Vy5MV0Xu1FEFew5YdUEfBOO0SwGJ9rcri9Dh9ieA9Zlv08ApVN1aOVKK8pB_JfEnWtYWl9YD4CLzHSvzHIoEqA6_cP1wlkQg5NbTdSTLK', NULL, 'android', '2018-11-27 14:53:20', '2018-11-27 14:53:20'),
(23, 137, 'a3def2e6d722c627', 'fvDcpcFXzac:APA91bHp7Rx8807dwUw6IQnhwcYNNwqyVL_krnIX9uHVKm-b-gvlrtcWoyszRLd8NiitFSr27c5V2vv7GyXpzlM-exnIUfyaCCFFsYOAyG_VbRGr1T5pQMfH9ANlH8nXzuAwYHqJ0o1c', NULL, 'android', '2018-11-30 22:30:09', '2018-12-14 16:55:15'),
(24, 138, '', '', NULL, 'android', '2018-12-05 13:47:46', '2018-12-05 14:22:11'),
(25, 139, '', '', NULL, 'ios', '2018-12-08 06:09:37', '2018-12-08 06:10:49'),
(26, 140, '', '', NULL, 'ios', '2018-12-08 06:16:16', '2018-12-10 11:29:55'),
(27, 141, '', '', NULL, 'ios', '2018-12-19 12:54:53', '2018-12-20 05:15:03'),
(28, 142, '7A2BDBAD-F220-4E5D-AC98-EF5378E0CDE5', 'No Device', NULL, 'ios', '2018-12-26 10:49:01', '2018-12-26 10:49:01'),
(29, 143, '9f577377020e3b77', 'dXMiUDNNYhc:APA91bHRD1d7zVJ0UFA34Wqd6emReZYyKn74vLvvgw0s0xVILBTCLhERLxQyCLUsbqoz1tAN7JK7PKm4pvbpk4IbOj6CCi6Ny0_KDajPcDcjEErNwJV4vrT159m-7H9uWMp52ObcYOty', NULL, 'android', '2019-01-01 12:24:35', '2019-01-01 12:24:36'),
(30, 144, 'B4D67930-AC50-4CC8-993F-D6CD358C0744', 'no device', NULL, 'ios', '2019-01-08 09:48:56', '2019-01-08 09:48:56'),
(31, 145, '', '', NULL, 'ios', '2019-01-08 15:37:08', '2019-01-08 15:39:17'),
(32, 147, '4cde49936f9078a1', 'cqZOpWCotbU:APA91bHm9duBAlL9eSnAAotOV3Xyrb3u_ylL0EtqUQPpLhMJcgpF-ZYrHgWZfO4urJRpu0D8LHS9-oiZ4qKcxRPFs3xvuv6jaKPR3sEeaCqEOgGcstXkr_3SJQASSiCH4XLUwUB6CF1Y', NULL, 'android', '2019-01-17 16:29:55', '2019-01-17 16:29:55'),
(33, 148, '7A2BDBAD-F220-4E5D-AC98-EF5378E0CDE5', 'No Device', NULL, 'ios', '2019-01-19 05:46:06', '2019-01-19 05:59:15'),
(34, 149, '80a115f6b26d8f55', 'c2NhF0s0UAk:APA91bGMJzbFyQAeD-tEk-wXyoFLAGaWhXlLMLGctt3x-sCBRs-wJSgzpOkptEyvdjVXF20M6AncUKt2DWE3ai2hioSKOC5UrnXINMoWBNQhBT1rC8xeVJ4T_2lKB-TynGxDA7hbZfzd', NULL, 'android', '2019-01-25 07:24:25', '2019-01-25 07:29:40'),
(35, 150, 'e7c1d2f3d06f7b88', 'cUuyGsETejc:APA91bFCdemGfmTto3Iy4XlFPKVQUkALt7NQZqvec6n-sH0tFhdN_ZNp3UACXL_ryIn7eNF1qfoToqvLaAEQFEKoULj6feelIKjji_6V7ON4VyHWMq-RZ0E6P555TL8Jzbo3NrZivKHR', NULL, 'android', '2019-01-29 01:00:54', '2019-01-29 01:00:55'),
(36, 151, 'e7c1d2f3d06f7b88', 'cUuyGsETejc:APA91bFCdemGfmTto3Iy4XlFPKVQUkALt7NQZqvec6n-sH0tFhdN_ZNp3UACXL_ryIn7eNF1qfoToqvLaAEQFEKoULj6feelIKjji_6V7ON4VyHWMq-RZ0E6P555TL8Jzbo3NrZivKHR', NULL, 'android', '2019-01-29 01:05:28', '2019-01-29 01:13:33'),
(37, 152, 'C92180CE-75ED-4DFC-8E32-4A077C05B2CE', 'no device', NULL, 'ios', '2019-01-29 01:47:05', '2019-01-29 01:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `provider_documents`
--

CREATE TABLE `provider_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_profiles`
--

CREATE TABLE `provider_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_profiles`
--

INSERT INTO `provider_profiles` (`id`, `provider_id`, `language`, `address`, `address_secondary`, `city`, `country`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 134, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06 07:49:50', '2018-11-06 07:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('active','offline','riding') COLLATE utf8_unicode_ci NOT NULL,
  `service_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_services`
--

INSERT INTO `provider_services` (`id`, `provider_id`, `service_type_id`, `status`, `service_number`, `service_model`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'riding', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-11-13 07:36:04'),
(2, 2, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(3, 3, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(4, 4, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(5, 5, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(6, 6, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(7, 7, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(8, 8, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(9, 9, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(10, 10, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(11, 11, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(12, 12, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(13, 13, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(14, 14, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(15, 15, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(16, 16, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(17, 17, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(18, 18, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(19, 19, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(20, 20, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(21, 21, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(22, 22, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(23, 23, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(24, 24, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(25, 25, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(26, 26, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(27, 27, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(28, 28, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(29, 29, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(30, 30, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(31, 31, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(32, 32, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(33, 33, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(34, 34, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(35, 35, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(36, 36, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(37, 37, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(38, 38, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(39, 39, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(40, 40, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(41, 41, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(42, 42, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(43, 43, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(44, 44, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(45, 45, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(46, 46, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(47, 47, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(48, 48, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(49, 49, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(50, 50, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(51, 51, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(52, 52, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(53, 53, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(54, 54, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(55, 55, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(56, 56, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(57, 57, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(58, 58, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(59, 59, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(60, 60, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(61, 61, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(62, 62, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(63, 63, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(64, 64, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(65, 65, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(66, 66, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(67, 67, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(68, 68, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(69, 69, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(70, 70, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(71, 71, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(72, 72, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(73, 73, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(74, 74, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(75, 75, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(76, 76, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(77, 77, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(78, 78, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(79, 79, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(80, 80, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(81, 81, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(82, 82, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(83, 83, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(84, 84, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(85, 85, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(86, 86, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(87, 87, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(88, 88, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(89, 89, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(90, 90, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(91, 91, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(92, 92, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(93, 93, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(94, 94, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(95, 95, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(96, 96, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(97, 97, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(98, 98, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(99, 99, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(100, 100, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(101, 101, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(102, 102, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(103, 103, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(104, 104, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(105, 105, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(106, 106, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(107, 107, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(108, 108, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(109, 109, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(110, 110, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(111, 110, 1, 'active', '4ppo3ts', 'Audi R8', '2018-09-22 14:16:58', '2018-09-22 14:16:58'),
(112, 111, 1, 'offline', '11111', 'audi', '2018-09-22 14:52:02', '2018-09-22 14:55:39'),
(113, 112, 1, 'offline', '111', 'audi', '2018-09-22 14:59:06', '2018-09-22 16:12:39'),
(114, 113, 1, 'riding', '1211', 'audi', '2018-09-22 15:03:48', '2018-12-05 14:49:52'),
(115, 115, 1, 'active', '222', 'audi', '2018-09-22 16:46:19', '2018-09-22 16:46:35'),
(116, 118, 1, 'active', '111', 'audi', '2018-09-22 17:20:31', '2018-09-22 17:50:40'),
(117, 120, 1, 'active', '111', 'audi', '2018-09-22 17:35:10', '2019-01-24 11:49:33'),
(118, 119, 1, 'offline', '1111', '444', '2018-09-22 17:35:25', '2018-09-22 17:35:25'),
(119, 122, 1, 'active', '45645665', 'au', '2018-09-24 16:42:47', '2018-09-24 16:44:54'),
(120, 121, 1, 'riding', '345', 'ju', '2018-09-24 16:44:10', '2019-01-31 15:19:52'),
(121, 123, 1, 'active', '324234', 'wer', '2018-09-25 07:35:28', '2019-01-13 16:43:06'),
(122, 126, 2, 'offline', '67558775', 'gb5', '2018-09-30 19:42:35', '2018-09-30 19:42:35'),
(123, 127, 1, 'offline', '+8801976653445', 'audi', '2018-10-03 12:50:05', '2018-10-03 12:50:05'),
(124, 128, 1, 'offline', '222', 'audi', '2018-10-03 12:51:09', '2018-10-03 12:53:50'),
(125, 124, 1, 'offline', 'CY 98769', 'Sedan R8', '2018-10-05 18:59:57', '2018-10-05 18:59:57'),
(126, 129, 1, 'offline', 'kak380u', 'Scddd', '2018-10-12 13:59:54', '2018-10-12 13:59:54'),
(127, 131, 5, 'active', 'ae101231', 'Harley', '2018-10-23 13:36:42', '2018-10-23 13:36:42'),
(128, 134, 1, 'offline', 'cy1236', 'audi9877', '2018-11-05 08:53:30', '2018-11-08 07:38:19'),
(129, 135, 1, 'active', '544', 'lance', '2018-11-20 08:05:21', '2018-11-20 08:08:44'),
(131, 136, 1, 'riding', '4234234', 'Palcer DSd', '2018-11-29 11:43:39', '2018-11-29 11:50:32'),
(132, 137, 1, 'riding', '12345', 'Toyota Yaris', '2018-11-30 22:34:48', '2018-12-14 16:58:03'),
(133, 138, 1, 'active', '35336', 'Benz', '2018-12-05 13:50:24', '2018-12-05 18:26:13'),
(134, 140, 1, 'offline', 'DA 8080', 'audi 100', '2018-12-08 06:17:30', '2018-12-10 11:29:55'),
(135, 142, 5, 'active', 'abc423', 'honda cg', '2018-12-26 10:48:15', '2018-12-27 05:52:56'),
(136, 148, 5, 'active', '23456', 'honda', '2019-01-19 05:46:57', '2019-01-19 09:06:44'),
(137, 149, 5, 'active', 'ba 12k 111', 'yamaha', '2019-01-25 07:27:22', '2019-01-29 07:29:54'),
(138, 152, 1, 'active', '1111', 'premio', '2019-01-30 15:31:04', '2019-01-31 21:47:07'),
(139, 151, 1, 'offline', '333', 'premio', '2019-01-30 15:31:22', '2019-01-30 15:31:22'),
(140, 150, 1, 'offline', '3333', 'premio', '2019-01-30 15:31:43', '2019-01-30 15:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_filters`
--

INSERT INTO `request_filters` (`id`, `request_id`, `provider_id`, `status`, `created_at`, `updated_at`) VALUES
(536, 73, 1, 0, '2018-11-13 07:36:04', '2018-11-13 07:36:04'),
(577, 81, 120, 2, '2018-11-19 12:24:15', '2018-11-19 12:24:22'),
(578, 81, 118, 0, '2018-11-19 12:24:15', '2018-11-19 12:24:15'),
(579, 81, 115, 0, '2018-11-19 12:24:15', '2018-11-19 12:24:15'),
(580, 81, 113, 0, '2018-11-19 12:24:15', '2018-11-19 12:24:15'),
(581, 81, 121, 0, '2018-11-19 12:24:15', '2018-11-19 12:24:15'),
(593, 84, 135, 2, '2018-11-20 08:09:24', '2018-11-20 08:09:34'),
(594, 84, 120, 0, '2018-11-20 08:09:24', '2018-11-20 08:09:24'),
(595, 84, 121, 0, '2018-11-20 08:09:24', '2018-11-20 08:09:24'),
(596, 84, 118, 0, '2018-11-20 08:09:24', '2018-11-20 08:09:24'),
(597, 84, 115, 0, '2018-11-20 08:09:24', '2018-11-20 08:09:24'),
(598, 84, 113, 0, '2018-11-20 08:09:24', '2018-11-20 08:09:24'),
(643, 92, 136, 0, '2018-11-29 11:50:24', '2018-11-29 11:50:24'),
(769, 149, 137, 0, '2018-12-14 16:57:59', '2018-12-14 16:57:59'),
(820, 204, 131, 0, '2019-01-28 04:06:19', '2019-01-28 04:06:19'),
(862, 212, 120, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(863, 212, 115, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(864, 212, 118, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(865, 212, 135, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(866, 212, 123, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(867, 212, 3, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(868, 212, 6, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(869, 212, 7, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(870, 212, 9, 0, '2019-01-30 12:19:06', '2019-01-30 12:19:06'),
(873, 215, 121, 0, '2019-01-31 15:19:21', '2019-01-31 15:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `fixed` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `calculator` enum('MIN','HOUR','DISTANCE','DISTANCEMIN','DISTANCEHOUR') COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `name`, `provider_name`, `image`, `capacity`, `fixed`, `price`, `minute`, `distance`, `calculator`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sedan', 'Driver', 'http://borakh.aapbd.com/asset/img/cars/sedan.png', 4, 50, 20, 3, 0, 'DISTANCEMIN', NULL, 1, '2018-09-22 14:16:35', '2018-11-13 09:29:44'),
(2, 'Hatchback', 'Driver', 'http://borakh.aapbd.com/asset/img/cars/hatchback.png', 0, 20, 10, 0, 1, 'DISTANCE', NULL, 1, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(3, 'SUV', 'Driver', 'http://borakh.aapbd.com/asset/img/cars/suv.png', 0, 20, 10, 0, 1, 'DISTANCE', NULL, 1, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(4, 'Limousine', 'Driver', 'http://borakh.aapbd.com/asset/img/cars/limo.png', 0, 20, 10, 0, 1, 'DISTANCE', NULL, 1, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(5, 'MotorBike', 'driver', 'https://borakh.aapbd.com/uploads/ff10b7312155b24132aac10ca7863b976d47d1ee.png', 1, 10, 10, 10, 10, 'DISTANCEHOUR', 'Bike ', 0, '2018-09-22 18:38:23', '2019-01-07 11:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_title', 'Borakh'),
(2, 'site_logo', 'https://borakh.aapbd.com/uploads/1e784c715a9bbc7d9bb7877423c678a19efc6b03.png'),
(3, 'site_email_logo', 'http://borakh.aapbd.com/logo-white.png'),
(4, 'site_icon', 'https://borakh.aapbd.com/uploads/fac0a8905536dd0decafb9f64232d373a47407ca.png'),
(5, 'site_copyright', '© 2018 AAPBD'),
(6, 'provider_select_timeout', '60'),
(7, 'provider_search_radius', '4000'),
(8, 'base_price', '50'),
(9, 'price_per_minute', '50'),
(10, 'tax_percentage', '5'),
(11, 'stripe_secret_key', 'sk_test_NyGUkMuROdFzHfTWG84l3P6X'),
(12, 'stripe_publishable_key', 'pk_test_AHZrWSgVaPpycFBlE6S6awzz'),
(13, 'CASH', '1'),
(14, 'CARD', '1'),
(15, 'manual_request', '0'),
(16, 'default_lang', 'en'),
(17, 'currency', '$'),
(18, 'distance', 'Km'),
(19, 'scheduled_cancel_time_exceed', '10'),
(20, 'price_per_kilometer', '10'),
(21, 'commission_percentage', '10'),
(22, 'store_link_android', 'https://play.google.com/store/apps/details?id=com.aapbd.borakh'),
(23, 'store_link_ios', ''),
(24, 'daily_target', '100'),
(25, 'surge_percentage', '10'),
(26, 'surge_trigger', '200'),
(27, 'demo_mode', '0'),
(28, 'booking_prefix', 'BRK'),
(29, 'sos_number', '999'),
(30, 'contact_number', '8801717653445'),
(31, 'contact_email', 'contact@aapbd.com'),
(32, 'social_login', '1'),
(33, 'map_key', 'AIzaSyDOldkEUFbXFvHM2k5dq54Q1ow7icrMYhE'),
(34, 'fb_app_version', 'v1.1'),
(35, 'fb_app_id', '663942590650623'),
(36, 'fb_app_secret', 'c4259f2acdc9c54db52606f41c801d05'),
(37, 'broadcast_request', '1'),
(38, 'track_distance', '1'),
(39, 'page_privacy', '<h2>We, at Borakh, ensure to maintain the highest standards of transactional security and quality so that your information and details are secure. To know more about our policies please read the following to learn about our information gathering and dissemination practices.</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>Note: Kindly note that our privacy policy is subject to change at any time without prior notice. To ensure that you are aware of any changes, please review this policy at regular intervals.</p>\r\n\r\n<p>By visiting this website you agree to be bound by the terms and conditions of this Privacy Policy. Any disagreement will be subject to the jurisdiction of Dhaka, Bangladesh.</p>\r\n\r\n<p>By mere use of the Website, you express consent to our use and disclosure of your personal information in accordance with this Privacy Policy. This Privacy Policy is incorporated into and subject to the Terms of Use</p>\r\n\r\n<h3><strong>1. Collection of Personally Identifiable Information and other Information</strong></h3>\r\n\r\n<p>When you use our Website, we store your browsing information so that we canprovide services and features that meet your needs,.</p>\r\n\r\n<p>In general, you can browse the Website without telling us who you are or revealing any personal information about yourself. Once you give us your personal information, you are not anonymous to us. You always have the option to not provide information by choosing not to use a particular service or feature on the Website. We compile your usage behaviour and personal information and the information on an aggregate basus to internal research to better enhance our product offerings to serve you better.. This information may include the URL that you just came from (whether this URL is on our Website or not), which URL you next go to (whether this URL is on our Website or not), your computer browser information, and your IP address.</p>\r\n\r\n<p>We use data collection devices such as &quot;cookies (small file stored on your computer)&quot; on certain pages of the Website to help analyse our web page flow, measure promotional effectiveness, and promote trust and safety. We offer certain features that are only available through the use of a &quot;cookie&quot;.</p>\r\n\r\n<p>Additionally, third parties may also place cookies or similar devices on our website, which we cannot control. If you choose to buy on the Website, we collect information about your buying behaviour.</p>\r\n\r\n<p>If you transact with us, we collect some additional information, such as a billing address, a credit / debit card number and a credit / debit card expiration date and/ or other payment instrument details.If you post messages or leave a feedback for us, we will collect that information you provide to us. We retain this information as necessary to resolve disputes, provide customer support and troubleshoot problems as permitted by law.</p>\r\n\r\n<p>If you send us personal correspondence, such as emails or letters, or if other users or third parties send us correspondence about your activities or postings on the Website, we may collect such information into a file specific to you.</p>\r\n\r\n<p>We collect personally identifiable information (email address, name, phone number.) from you when you set up a free account with us. We do use your contact information to send you offers based on your previous orders and your interests. However, data protection is a matter of trust and your privacy is important to us. We shall therefore use your name and other information which relates to you in the manner set out in this Privacy Policy. We will only collect information where it is necessary for us to do so and we will only collect information</p>\r\n\r\n<h3><strong>2. Sharing of personal information</strong></h3>\r\n\r\n<p>We will only share personal information with companies, organizations or individuals outside the periphery of Borakh if we have a good-faith and believe that access, use, preservation or disclosure of the information is reasonably necessary to:</p>\r\n\r\n<ul>\r\n	<li>meet any applicable law, regulation, legal process or enforceable governmental request.</li>\r\n	<li>enforce applicable Terms of Service, including investigation of potential violations.</li>\r\n	<li>detect, prevent, or otherwise address fraud, security or technical issues.</li>\r\n	<li>protect against harm to the rights, property or safety of Borakh, our users or the public as required or permitted by law.</li>\r\n</ul>\r\n\r\n<p>We may share aggregated, non-personally identifiable information publicly and with our partners &ndash; like bus operators, agents or connected sites. For example, we may share information publicly to show trends about the general use of our services. We may also share consolidated information provided by like-minded users with bus operators without ever taking individual names, email ids or other contact details.</p>\r\n\r\n<p>If Borakh is involved in a merger, acquisition or asset sale, we will continue to ensure the confidentiality of your personal information and give notice before personal information is transferred or becomes subject to a different privacy policy.</p>\r\n\r\n<h3><strong>3. Security Precautions</strong></h3>\r\n\r\n<p>Our Website has stringent security measures in place to protect the loss, misuse, and alteration of the information under our control. Whenever you change or access your account information, we offer the use of a secure server. As informed earlier in this policy, once we receive your information we ensure strict security guidelines to protect it against unauthorized access. For example, we use SSL security to protect users against identity theft &amp; spyware.</p>\r\n\r\n<h3><strong>4. Your Consent</strong></h3>\r\n\r\n<p>By using the Website and/ or by providing your information, you consent to the collection and use of the information you disclose on the Website in accordance with this Privacy Policy, including but not limited to your consent for sharing your information as per this privacy policy.</p>\r\n\r\n<p>We may decide to make amends to this privacy policy without prior information, therefore, it is suggested you review this page at regular intervals. This ensures you are up-to-date with the details of the information we collect, how we use it, and under what circumstances we disclose it.</p>\r\n'),
(40, 'provider_commission_percentage', '20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `email`, `gender`, `mobile`, `password`, `picture`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `rating`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Appoets', 'Demo', 'CASH', 'demo@demo.com', 'MALE', '9258632148', '$2y$10$eRJrEt3kIJUBdVRHjZ4PTeoRDEsyeC0YKgHeQtxr8P.aaRVUqYQme', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(2, 'Emilia', 'Epps', 'CASH', 'emilia@demo.com', 'MALE', '9258632856', '$2y$10$5qc3xGC7ByINinDtciG3.u4D0p2GbJHTcb4ChhsFbthdDmrepauWS', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(3, 'Perry', 'Kingsley', 'CASH', 'perry@demo.com', 'MALE', '9258632179', '$2y$10$SoIjWRgriQ8joq/4jCOVVOtPheH7gA06Mq/G5nEhMrvRRDbf.J1AW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:35', '2018-09-22 14:16:35'),
(4, 'Joseph', 'Garrison', 'CASH', 'joseph@demo.com', 'MALE', '9258635689', '$2y$10$QRTjuzIRQfNy7pTCLwSQfOfIltwJ78VTOems70A.Tga9zqb9P05hO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(5, 'Ella', 'Morrissey', 'CASH', 'morrissey@demo.com', 'MALE', '9258678452', '$2y$10$CjHYrDcruQa2UiWw97aMMO.z1galmyjKsQJQOmz54RihICy2aVsQ2', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(6, 'Elizabeth', 'Forshee', 'CASH', 'elizabeth@demo.com', 'MALE', '9258678458', '$2y$10$osiBwbOKy9wrPP2uNyqb0elUWt.2iH3vA.Xx9fAAqX1yzbZtp.2d2', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(7, 'Douglas', 'Arce', 'CASH', 'douglas@demo.com', 'MALE', '9258924548', '$2y$10$EQigAOfgS5hEQJRnNqLsdeVW/L4xMc5j7St.pscZEW.ancpe1mRzy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(8, 'Sara', 'Nixon', 'CASH', 'sara@demo.com', 'MALE', '9258256268', '$2y$10$wYeq.4Ronh.dnQXK6B0hremlVU7ebj3JB6HMwDca3YB8ovDVxpT2e', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(9, 'Edward', 'Jett', 'CASH', 'edward@demo.com', 'MALE', '9292451648', '$2y$10$gIMLoz2X0EGUJtWl4WrfaeaIFKDl.Q3Buqt4hAHprji0wK3adRH3.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(10, 'Marilyn', 'Bradley', 'CASH', 'marilyn@demo.com', 'MALE', '9253128488', '$2y$10$swbYsFBbuxrTLum59I5rnORDMgPZ6.qhjfEwUQsgGNEYejKu.ukJi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(11, 'Herman', 'Thompson', 'CASH', 'herman@demo.com', 'MALE', '7845924516', '$2y$10$w.D45ESx3lLYMDEPEiCu/.RZwEjff9tFlLTCeqbyw57HKjv2lGCm.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(12, 'Darrin', 'Neely', 'CASH', 'darrin@demo.com', 'MALE', '9123456788', '$2y$10$V6Y9UPk8bUaSVLV2y13cXu4jwGuU5XNHiweb2mJhl8NFcbL2Sv1m.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(13, 'Ralph', 'Vaughn', 'CASH', 'ralph@demo.com', 'MALE', '9258944312', '$2y$10$CMzrR2UvUMnl45SncrV3POhKyILJHOSjAsKfPJIUarmpwqy9c.3yG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:36', '2018-09-22 14:16:36'),
(14, 'Arturo', 'Gibson', 'CASH', 'arturo@demo.com', 'MALE', '9867892848', '$2y$10$4CxXsRMVNxDSxuPc.7.0vOOPeCb1mGIcumEa/mQX..gK94ayE44Qi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(15, 'Kevin', 'Delacruz', 'CASH', 'kevin@demo.com', 'MALE', '9282569656', '$2y$10$QC2YY2EL2H0uSUNMNhfJpuZSbGLOIcaaMdHJlIWvXBLbozR7EvxDq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(16, 'Catherine', 'Ferguson', 'CASH', 'catherine@demo.com', 'MALE', '9856556871', '$2y$10$s/3PwPf5w2EMB.sCDeKkaefr94xx/QatP5FjmY8PPeuQlAVCRMTpq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(17, 'Gary', 'Maple', 'CASH', 'gary@demo.com', 'MALE', '8695432568', '$2y$10$a0v35TGm2AeIJgxrUiW8EO6wjRPyKmrhfPFwpBje59Ie3Ws1wQ3Oq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(18, 'Robert', 'Ferguson', 'CASH', 'robert@demo.com', 'MALE', '7826954862', '$2y$10$UkS1axYWWiBB8EX1Bnrqe.Yc.d6VjBtdBbZfar2b8Gvu9Ap7yM3bi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(19, 'Charles', 'Ferguson', 'CASH', 'charles@demo.com', 'MALE', '9278459632', '$2y$10$55lIeOarW8/BoSn9/UN4uuecY0jNj39pX/SW5mlsJKzuYMIjeBP1O', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(20, 'Michael', 'Ferguson', 'CASH', 'michael@demo.com', 'MALE', '9288218558', '$2y$10$FbwO2gvuoVX.Zp/JByG74.iIi5OXi7k8.APDye0Ytb.SaMLT7yAam', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(21, 'Patrick', 'Ferguson', 'CASH', 'patrick@demo.com', 'MALE', '9285285282', '$2y$10$vYaifHVjXk7CxvSTePwCBuavzpleNAhve3kX.gVLlqPT/a1fqNZ2u', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(22, 'Arturo', 'Arturo', 'CASH', 'arturon@demo.com', 'MALE', '9288554115', '$2y$10$QYgh5XPuTwKVIfKQiN8truB70sFvsZ6tAh54iMUWzAYholAWUbBOu', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:37', '2018-09-22 14:16:37'),
(23, 'Anthony', 'Ken', 'CASH', 'ken@demo.com', 'MALE', '9285659551', '$2y$10$Y4EJbFkizIAHhtxkmN6PiOw6wvlqDYan48e.yKcaRLzooSHPtfiKq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(24, 'Anthony', 'Clinton', 'CASH', 'clinton@demo.com', 'MALE', '9848522228', '$2y$10$L9fZKejmc0qimQLAlDXMDOe46UZnpcZqirJdgf0cOaEpo5aHVpObi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(25, 'Gabriel', 'Ferguson', 'CASH', 'gabriel@demo.com', 'MALE', '9287941656', '$2y$10$kcDFIvJDdfR4OPIbu038Ee.U1DIBt84IDbAojLJtyJEqRfmhhilYG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(26, 'Gabriel', 'Scott', 'CASH', 'scott@demo.com', 'MALE', '9289489615', '$2y$10$fhMw4u/f/JJQZkvo0qapeOVWIXBk5N341SQle2f8IIuL00A6c3GES', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(27, 'Raymon', 'Ferguson', 'CASH', 'raymon@demo.com', 'MALE', '9894865851', '$2y$10$i6Pa8fgZrJKapr1s6kCadujDmjJqZtWUH6Ik6bztYlTL.dg8seOO.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(28, 'Shon', 'Ferguson', 'CASH', 'shon@demo.com', 'MALE', '9289489661', '$2y$10$XtF/xb9iCanXrqe/DecMe.4e4Co6LBg6Os.lKBI1QHE0/RdciPaSu', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(29, 'Dennis', 'Ferguson', 'CASH', 'dennis@demo.com', 'MALE', '8974861266', '$2y$10$D4d07wxUfvirRB/GHTGoCug6b.cORtvEZeykNOx16NAt5vEvvlLwW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(30, 'Wayne', 'Ferguson', 'CASH', 'wayne@demo.com', 'MALE', '9895481862', '$2y$10$00a3ShlV2hLTSe6U87b/kuYzygetxCqjtWCBMkmlHhrYJjrJGRbDq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(31, 'Daniel', 'Fuller', 'CASH', 'daniel@demo.com', 'MALE', '9289456286', '$2y$10$0t0T4f9PkgZyLWO3oUNffenLVbDqMjJkTwg57IzlL9TZtqZHIvzwu', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(32, 'Buster', 'White', 'CASH', 'buster@demo.com', 'MALE', '9652626583', '$2y$10$8pBnhTH1BTXL4HSD3ZzWKuguKJj8yfItNHa8ygQIsLRrm7Dnu6zsq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:38', '2018-09-22 14:16:38'),
(33, 'Scott', 'Markham', 'CASH', 'scot@demo.com', 'MALE', '9446287233', '$2y$10$oB522iTtE1RL6K1KnJbeReRQAW6OKflL3c0n4DaVFlKrQjv93s2Dm', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(34, 'Millard ', 'Brooks', 'CASH', 'millard@demo.com', 'MALE', '8952826252', '$2y$10$sJhoXMIT2Xxx3er72daM.eVRz0C/YoLozppyjSPmKqrBACv0EGPPe', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(35, 'Terry', 'Burress', 'CASH', 'terry@demo.com', 'MALE', '9222564163', '$2y$10$N0CtF5HzJwHsy1KCBS0MzO06TAdCS35YKUQ5IloOIkwFedoJBJZrO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(36, 'John', 'Edwards', 'CASH', 'john@demo.com', 'MALE', '9845626423', '$2y$10$xJGSXhu0qaZjX1zvgl5pQuKxDZ6rKKGdMXaUsg16n5RfGRK45aFKq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(37, 'Edwar', 'Warner', 'CASH', 'edwar@demo.com', 'MALE', '7845652482', '$2y$10$8Qnc5sWlbXSCduyAOBBaXuMW/udgWZAtdSlyj/AgtdjXhnu1p2n7K', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(38, 'Thomas', 'Joseph', 'CASH', 'thomas@demo.com', 'MALE', '7845651821', '$2y$10$NIXmtw2FPuabsT0xEO/iXe.WJYr1dWSB4kQdlSDc7tJQixva0br1m', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(39, 'Sally', 'Skateboard', 'CASH', 'sally@demo.com', 'MALE', '7845621825', '$2y$10$jOJnw7kEWsdH5X1GODE8..YMm7E5Y5BnKF9nVChlPE/x.qIGsoUZy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(40, 'Dolly', 'Unicycle', 'CASH', 'dolly@demo.com', 'MALE', '9841118646', '$2y$10$k3YnqimOedWlVGi0pHT2ZudFqmTHL.AE4MUN.247zWLSR7vHAvWH.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(41, 'Peggy', 'Hoverboard', 'CASH', 'peggy@demo.com', 'MALE', '8416384611', '$2y$10$z/..nKRU4LXpqk4sz4KKweATUGxVVo9JdkvO83IyjurCL.v1UWTPi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(42, 'Louise', 'Dazzle', 'CASH', 'louise@demo.com', 'MALE', '9255897816', '$2y$10$9FTiBDANjV7Me4f/vcDKv.AVw0J7Q8tY2EBI45QnxBdOpFd8WvdYy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:39', '2018-09-22 14:16:39'),
(43, 'Carmella', 'Pizzazz', 'CASH', 'carmella@demo.com', 'MALE', '9528974115', '$2y$10$IpMjHUZ.pYwzn9.hqxie.uYYXwR7OpdkE1ioZLg9.yJBoMwX6r82y', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(44, 'Erin', 'Barkeep', 'CASH', 'Erin@demo.com', 'MALE', '9289851872', '$2y$10$3UgbApAJVwEIzrK.1bvAruM5X1K0NCMj.4ATCpRlFyBbmJl.b3Z1y', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(45, 'Becky', 'Nitrogen', 'CASH', 'becky@demo.com', 'MALE', '8941632325', '$2y$10$gSn6DbWlrBZsKOoMcpvcrO/qPjktAeGe5hHZxewfU2sQS.0izNXNe', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(46, 'Allie', 'Starfeet', 'CASH', 'allie@demo.com', 'MALE', '9897261522', '$2y$10$jlGfCiXfydl46h2jNGoWTOdkd7KLjQhcbqb0MjhVs5sR02SXpmEOy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(47, 'Lindsay', 'Marti', 'CASH', 'lindsay@demo.com', 'MALE', '8974126521', '$2y$10$txx9qWPXansnjx5Z.PmJDOT3OnlnDlshLJeNUP..WNFWGx9aEH7EG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(48, 'Mirandella', 'Houndstooth', 'CASH', 'mirandella@demo.com', 'MALE', '9894263136', '$2y$10$Sd3tb7Ies9FYiEL0oltiResyERwGPIunxB29P2uBlMB0rdcBex8vS', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(49, 'Zooey', 'Camembert', 'CASH', 'zooey@demo.com', 'MALE', '7845853251', '$2y$10$xX7gz2yIbqlOd6ypt1Ecpe5pJunn7NkzedpS1/10kBn94JsNKC0Dy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(50, 'Shirley', 'Hurley', 'CASH', 'shirley@demo.com', 'MALE', '9879413521', '$2y$10$T1C8HdvNdifMCy09JzmOb.WPDPcpZrJ9eu6/3HSmPiLi06.0poNcO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(51, 'Mary', 'Epps', 'CASH', 'mary@demo.com', 'MALE', '9258632856', '$2y$10$DVjPK0tDhRI0nO2lbUE6FeRkJDRlf4z2XV2UNg1Tk6R5O/3O4EyAm', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:40', '2018-09-22 14:16:40'),
(52, 'Patricia', 'Kingsley', 'CASH', 'patricia@demo.com', 'MALE', '9258632179', '$2y$10$iA86rLdIP7oeVGwp.QogoeceInP0NrKmeiQfcmlJqN/QaaqPrVCyO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(53, 'Linda', 'Garrison', 'CASH', 'linda@demo.com', 'MALE', '9258635689', '$2y$10$t4X5X2QvVlvkrXKoW5lfJeCa1vNnavGcvGX3XZW1BM6Kgp6pn76Ni', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(54, 'Barbara', 'Morrissey', 'CASH', 'barbara@demo.com', 'MALE', '9258678452', '$2y$10$/zzszmTuhuCf4JQOYAzeWO0CCFqYGNOtwzfDRIXiStJzA.T8w5YAG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(55, 'Jennifer', 'Arce', 'CASH', 'jennifer@demo.com', 'MALE', '9258924548', '$2y$10$s1YaIlXC4Vh6cHyHFtC8LukFp6avRxVLNRxRQmyUYQmKkKu39GGza', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(56, 'Maria', 'Nixon', 'CASH', 'maria@demo.com', 'MALE', '9258256268', '$2y$10$4j.F1RzIg/cd5Qv.SSmtdORlko0u2dq0iwE41.vY3sUcXfGgM6oFS', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(57, 'Susan', 'Jett', 'CASH', 'susan@demo.com', 'MALE', '9292451648', '$2y$10$y6SrS7Yw/MXdIF0whsDHwuvJoBSvufqvVbmI0lRXumURnH9ijvNvq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(58, 'Margaret', 'Bradley', 'CASH', 'margaret@demo.com', 'MALE', '9253128488', '$2y$10$vTAX6XQCrDmHES9aYH36oO7XdbSgSXnBK1gMM1yqrAaOKO0bQfYwS', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(59, 'Dorothy', 'Thompson', 'CASH', 'dorothy@demo.com', 'MALE', '7845924516', '$2y$10$YdbFQjHbkBhu6l1nQtAJZ.dsLg1bTUhFaFH5GRJekuRZ.9TviJ.e6', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(60, 'Lisa', 'Neely', 'CASH', 'lisa@demo.com', 'MALE', '9123456788', '$2y$10$oa6dMYhXLOQmLRbYVzOzHu90hpdh7o8BzdMDbYchhBm/HHaOdvSOW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(61, 'Nancy', 'Vaughn', 'CASH', 'nancy@demo.com', 'MALE', '9258944312', '$2y$10$jEQcVnXh5SD9gHwaiml6j.9IhFvMuPD8/GRu4ZHJZaACZki6eS7kq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:41', '2018-09-22 14:16:41'),
(62, 'Karen', 'Gibson', 'CASH', 'karen@demo.com', 'MALE', '9867892848', '$2y$10$vjcTn.z.BysHQChlggsxyOOR3I1QkzpZKCMdLoXaKDfS6zhdQBrFe', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(63, 'Betty', 'Delacruz', 'CASH', 'betty@demo.com', 'MALE', '9282569656', '$2y$10$Df.Ea6zl7z3BNlI0ZaZfJOjzuZ/XA4qZnHVC8wf29pPeRLmBd2kxi', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(64, 'Helen', 'Ferguson', 'CASH', 'helen@demo.com', 'MALE', '9856556871', '$2y$10$lJex7J6i9fRn2MsNzPuXC.ZfF4yHP2Hzegp3d4lqH3RNy1NOn1JOm', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(65, 'Sandra', 'Maple', 'CASH', 'sandra@demo.com', 'MALE', '8695432568', '$2y$10$1nU1IeY6iLhZwf7qSFFpzuiYiCFCxS2iTA0VrHzPBxUh3yQgdaETq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(66, 'Donna', 'Ferguson', 'CASH', 'donna@demo.com', 'MALE', '7826954862', '$2y$10$zNKqqtB5LSs4r4eJGN0Hw..1C0H1yMYch131fGnqPchP7lvnzHgw.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(67, 'Carol', 'Ferguson', 'CASH', 'carol@demo.com', 'MALE', '9278459632', '$2y$10$DfENNATsDhw5JzvJmywHEOVW.i1PUhvzlQPVmyEF43JSBbRyZfXbK', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(68, 'Ruth', 'Ferguson', 'CASH', 'ruth@demo.com', 'MALE', '9288218558', '$2y$10$FWXNTvtALXpk6sNtDC7LouHAMtdZt9nXYQdAJWBKVcYSMAdipDiuW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(69, 'Sharon', 'Ferguson', 'CASH', 'sharon@demo.com', 'MALE', '9285285282', '$2y$10$aZ7bQL8jgNAOxUwZjvyer.LV8atQz8islysXo9I1eWEAV.KOqOTPW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(70, 'Michelle', 'Arturo', 'CASH', 'michelle@demo.com', 'MALE', '9288554115', '$2y$10$DwdN9Xtvw.lUpZ/EOOwrM.Rim37XeNJD9dUU/W.aB1JOl5Neq4OWW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(71, 'Laura', 'Ken', 'CASH', 'laura@demo.com', 'MALE', '9285659551', '$2y$10$xhyXWiw8KNZyYzE7CSQ1muylZUTpMSaFyg0QtW6tn.mbHwf1w4.AK', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:42', '2018-09-22 14:16:42'),
(72, 'Sarah', 'Clinton', 'CASH', 'sarah@demo.com', 'MALE', '9848522228', '$2y$10$aTDMG4dMyeA/LdvGdkMZ3OfrguuVzOUWB9YFPR5LDqFBgtOty/aWy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(73, 'kimberly', 'Ken', 'CASH', 'kimberly@demo.com', 'MALE', '9285659551', '$2y$10$/yAUjtJ9OcbaPwksiHT6CekCk94.wpQkyKZ16//bF1bEYL2IUHa.C', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(74, 'Deborah', 'Clinton', 'CASH', 'deborah@demo.com', 'MALE', '9848522228', '$2y$10$2ovJHijemVksYBc3XL520ujnR4s8EjD2WGro3YikxXufIjMQSh7l6', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(75, 'Jessica', 'Ken', 'CASH', 'jessica@demo.com', 'MALE', '9285659551', '$2y$10$zvz4/QJENe4wVaktkbg6seKAj9odPVJ26.4/jgrNFj8CFBBsbrYkC', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(76, 'Cynthia', 'Ken', 'CASH', 'cynthia@demo.com', 'MALE', '9285659551', '$2y$10$q811FHGZ71Rddz81YO7v6O0JNrcN0hUvTl6Og7atyzRwPbdqOkTfy', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(77, 'Angela', 'Clinton', 'CASH', 'angela@demo.com', 'MALE', '9848522228', '$2y$10$dHjy00aUBMiUj/8ara1rVuJEt//IHnPD7pQnBp5NRYlCh7RrnN5zq', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(78, 'Melissa', 'Ken', 'CASH', 'melissa@demo.com', 'MALE', '9285659551', '$2y$10$pynsyUvb6qoPu35m.m2vr.5VDlQHoCtWGqxqDDWQbwFwDM.a/lcXO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(79, 'Brenda', 'Ferguson', 'CASH', 'brenda@demo.com', 'MALE', '9848522228', '$2y$10$kmjZowBUpBHsdSxKjIJyR.dAU2Q0t7IYuvXE4sIF88C7EpQf2ZK0a', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(80, 'Amy', 'Ken', 'CASH', 'amy@demo.com', 'MALE', '9285659551', '$2y$10$y/4UCRoWf3V.U88fHOEIAOwUpUgalLGAim7XDz4ujgr/xiq7VMjPe', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:43', '2018-09-22 14:16:43'),
(81, 'Anna', 'Ferguson', 'CASH', 'anna@demo.com', 'MALE', '9848522228', '$2y$10$sdKnKPtwpxUgTrd831jKo.dU.fP1/hN6ueBsWuvRfnuAl4Y3XfcbO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(82, 'Rebecca', 'Ken', 'CASH', 'rebecca@demo.com', 'MALE', '9285659551', '$2y$10$tc/ljfgjVhTE8A8T5xL3aObZr6YU5u0qliiJm51wu12ipQg0bCJI.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(83, 'virginia', 'Clinton', 'CASH', 'virginia@demo.com', 'MALE', '9848522228', '$2y$10$3RfYFLSPY.JQfTaGk4W5C.t/mxvBDpvIaev9nPwKB/IQkSE9biFv6', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(84, 'Kathleen', 'Ken', 'CASH', 'kathleen@demo.com', 'MALE', '9285659551', '$2y$10$mWOZ6MvzG68msORq4MTp5ODoSXGxKjn2rz6HOfA6tLqzFYrFCNc3e', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(85, 'Pamela', 'Clinton', 'CASH', 'pamela@demo.com', 'MALE', '9848522228', '$2y$10$bNxvlaU5u6S6.yN6VdUPOeqEn0v7roUh9n8ufTuVELO0BCTZJGtDG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(86, 'Martha', 'Ken', 'CASH', 'martha@demo.com', 'MALE', '9285659551', '$2y$10$eVgHlO55SvD7NoLAKqi/ROBaVSOHBc7ShL791znwqnpfPxb6yAl8S', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(87, 'Debra', 'Clinton', 'CASH', 'debra@demo.com', 'MALE', '9848522228', '$2y$10$74Ma77evCrZTGzGTH/IoUe0mpD.N9Mdq/u9IcB9tu697Hpj9YXbVm', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(88, 'Amanda', 'Ken', 'CASH', 'amanda@demo.com', 'MALE', '9285659551', '$2y$10$mtYQGq.kw7kX4JdfpangpO/k1fB6Tj6T.q.NSEVWoh34a.PiIMIda', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(89, 'Stephanie', 'Clinton', 'CASH', 'stephanie@demo.com', 'MALE', '9848522228', '$2y$10$bDUO7SV4x3LI1Q96JRrN4.ycyGxrWWA/7nEJ.YFpKYd1Budz8m3hu', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(90, 'Carolyn', 'Ken', 'CASH', 'carolyn@demo.com', 'MALE', '9285659551', '$2y$10$bY126cJvHtcQwaY31sMAQuWv4MTSTl3rTkeNhq6PtnX4z94ygoT1W', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:44', '2018-09-22 14:16:44'),
(91, 'Christine', 'Clinton', 'CASH', 'christine@demo.com', 'MALE', '9848522228', '$2y$10$G1ALKOx4YQNCj7bAC2mp.u3JsZBZn4Wayy0LmwsVHNtqnztVnlATC', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(92, 'Marie', 'Ken', 'CASH', 'marie@demo.com', 'MALE', '9285659551', '$2y$10$U1BmtNG0Qhffh./9MyMgeuiku3zgdAeUgQ8IveOXL6kTvL93Qteo.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(93, 'Janet', 'Clinton', 'CASH', 'janet@demo.com', 'MALE', '9848522228', '$2y$10$OVN6RwJkb5uoVjEWAixAO.VibZNzNgICJCh/O7n53fcOxWTsPSCxe', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(94, 'Frances', 'Clinton', 'CASH', 'frances@demo.com', 'MALE', '9848522228', '$2y$10$0DVfbEj/BnZUptTRaPTiI.rJCM7IGLimwtqGDR1AVPX29TGCK8/LC', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(95, 'Ann', 'Ken', 'CASH', 'ann@demo.com', 'MALE', '9285659551', '$2y$10$z1N3sbApexoaBus0rYKgCOt06zw1sGQeBx8p7itXf2FxxNDXEfSFW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(96, 'Joyce', 'Ferguson', 'CASH', 'joyce@demo.com', 'MALE', '9848522228', '$2y$10$vlBIJxt69d6BDttJaU1PzOUnqekLyBW6t4lzcdE5wQKf2Xi.wolwG', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(97, 'Diane', 'Ken', 'CASH', 'diane@demo.com', 'MALE', '9285659551', '$2y$10$F6LJokkoRwGYhHNO2XOAaO9DA2EasmXv1KQI0hyicWkGZfYWHVcOO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(98, 'Alice', 'Clinton', 'CASH', 'alice@demo.com', 'MALE', '9848522228', '$2y$10$Iv2iwY0sLn1haGKgdDutT.WvQIQ5ijYAyD0cqxJN3Pvz7PskMVfk.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(99, 'Julie', 'Ken', 'CASH', 'julie@demo.com', 'MALE', '9285659551', '$2y$10$zIkvD.jcq3a.U2P6vHkHvODae3CG/IxKdlpYhXXaL5sG/iNg2kX5G', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(100, 'Heather', 'Clinton', 'CASH', 'heather@demo.com', 'MALE', '9848522228', '$2y$10$CsqO3mVx87tl0p8JBi.2BuE4L0i74AOv8bxJ8ZVCalUiApJnL9j.a', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:45', '2018-09-22 14:16:45'),
(101, 'Teresa', 'Ken', 'CASH', 'teresa@demo.com', 'MALE', '9285659551', '$2y$10$2RMj8VG4ZyqPVbFVHnlo0OKlvQd2XUnSKXPa07jMxAqKHg4QlXTfW', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(102, 'Doris', 'Clinton', 'CASH', 'doris@demo.com', 'MALE', '9848522228', '$2y$10$./bfEbEnOs7YMrg53MVr0eWtx85iuvhSlw7olKfTYsY/Ou5Jgof6.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(103, 'Gloria', 'Ken', 'CASH', 'gloria@demo.com', 'MALE', '9285659551', '$2y$10$dk.iGY63NAXnT/bK1ZHdDeN9W6CY7oj5409C6YNyFkPjekdMZCu32', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(104, 'Evelyn', 'Ferguson', 'CASH', 'evelyn@demo.com', 'MALE', '9848522228', '$2y$10$6v4z0wfElL.Vsqv7jOH8WOclBa11wX8eDSHuFMxpGH3hEIqajiqU.', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(105, 'Christian', 'Ferguson', 'CASH', 'christian@demo.com', 'MALE', '9848522228', '$2y$10$3C3f.4cocIF2lfoQbJzJtOq5Qar/LJb56fCtk6nw3uFmsZIGt7rEO', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(106, 'Steven', 'Ferguson', 'CASH', 'steven@demo.com', 'MALE', '9848522228', '$2y$10$5hbsHATWcEY5bAL7iAFn7epCzTvUhQwFTcFX5YPeWuhJ7lgEPHG1W', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(107, 'Samuel', 'Ferguson', 'CASH', 'samuel@demo.com', 'MALE', '9848522228', '$2y$10$rJqurlbIOIEoGQH0VMzrjOt6ATU.owV.zu2LReQljidCmnmnjze7m', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(108, 'Brian', 'Ferguson', 'CASH', 'brian@demo.com', 'MALE', '9848522228', '$2y$10$1F64Ff2.GTKlPziXR/n2QOfRJaAKe9Fxt9s86MRJKB3iLBfZcy0zm', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(109, 'Dylan', 'Ferguson', 'CASH', 'dylan@demo.com', 'MALE', '9848522228', '$2y$10$Z1Zg2K7AJMwq2G7L97mlHOfxPjXZsbXbPwsJvpT5HJ0N8DXd1OKHC', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(110, 'Timothy', 'Ferguson', 'CASH', 'timothy@demo.com', 'MALE', '9848522228', '$2y$10$nHU7Mxi7wzDT5vpHjKKetuuByWW1MbGDKl/L3w.jiZ93KkubmGEGS', 'http://lorempixel.com/512/512/business/Tranxit', NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 14:16:46', '2018-09-22 14:16:46'),
(111, 'user', 'biplob', 'CASH', 'user@aapbd.com', 'MALE', '+8801717653445', '$2y$10$mVx1OLtgH9RbWEOOUyWNe.eu894I2GNZ0S8czSET1IQRWAsB/ZJ1S', '', 'c2si7e-J8Qo:APA91bGm-pYNtTDrSGFlp7nkpbI9gXS_08AQpTbu_0gTyJ-_pHiizlv01w9gHf6fl1pUEa6Zr6GiK_SJKPjNN80d4SG8Avok3glQal0M-G4jQdw2JKvwvKwT6zwOYiFtwzMrT__AnJbl', '5ff01ed1f178b8ba', 'android', 'manual', '', 23.83556900, 90.36620150, NULL, 0.00, '5.00', 0, 'pCPXlhUply9ROsyUW0fSFwkWoztVIMUo8sdutYqJrdjnVODwQwpBEUMlkj54', '2018-09-22 14:29:21', '2018-10-04 21:24:37'),
(112, 'Mamun.', 'Hoque', 'CASH', 'mamun3137@gmail.com', 'MALE', '1726703137', '$2y$10$SMuABj3HW9Ir1lnPtB6F3OWHc3zexrlwoEDVYJ4OvVX07cmoQq68W', NULL, NULL, NULL, 'android', 'manual', NULL, 23.82312580, 90.36717860, NULL, 0.00, '5.00', 0, 'nTERahZPxjdR1wFkbzQgvFl47b8XFg0g5tsv0EeR187obrJ1nYU0OQcBJ1aL', '2018-09-22 14:44:38', '2018-09-22 17:29:14'),
(113, 'Mamun', 'Hoque', 'CASH', 'banglatips37@gmail.com', 'MALE', NULL, '$2y$10$Y.PrtkZz9zOn4yA5veb/U.bYoUKDA9pDBXwR73WA/DS7XzfTprpUu', 'https://graph.facebook.com/v2.8/10216358787952591/picture?type=normal', NULL, NULL, 'android', 'facebook', '10216358787952591', NULL, NULL, NULL, 0.00, '5.00', 0, 'VSibmm4I3tUk0S74plIZll2Kz4G0WGzeFpbapCXEI8mSjcAgigXsehpdTV88', '2018-09-22 15:15:19', '2019-01-16 09:04:05'),
(115, 'user', 'user', 'CASH', 'aapbdltd@gmail.com', 'MALE', '+8801717653445', '$2y$10$CYo7WwnyuRaXOKM8sNeZb.WVEIHcKnAGkb1Bt45QM2YQdFw1JR/Pm', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 15:41:43', '2018-09-22 16:37:10'),
(116, 'Final Test', 'Twts', 'CASH', 'finaltest@gmail.com', 'MALE', '+8801717653445', '$2y$10$03oTOHP6Vu35v0DskiNGfOY4XOKupLTt.pnh36hHq0Y08cV3EQK6a', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-22 17:32:28', '2018-09-24 15:42:30'),
(117, 'Borakh', 'User', 'CASH', 'user@borakh.com', 'MALE', '1976653445', '$2y$10$gsjZ5mTYWigykn9buWbiDun88JYjRHltZjh.f1OqD0vv4DLHjwmdm', 'user/profile/ae114f1e3e595379c91442310c1a2ce2.png', 'no device', '430E5B34-0FD3-41C9-B678-3971E5CA394F', 'ios', 'manual', NULL, 23.81033100, 90.41252100, 'cus_DkZxEFqd4eKIUL', 0.00, '5.00', 0, 'KKUL93fpB6GXCGS93ZZwgCTly4kfaLyEhUGjnoa1lRCypgUcI0cvBfZb97n9', '2018-09-22 18:42:14', '2019-01-30 12:19:06'),
(118, 'asm', 'salah uddin', 'CASH', 'atha.android@gmail.com', 'MALE', '+8801710444457', '$2y$10$kY3c.8LOAQ3qkDdVD.RjZ.qLCQdzi8wWZWKG5PqnQHP.6DEiZJHOy', '', 'faohdS98yao:APA91bFYQuH_d0v78yyaNP-mYwi--vyleqmfU16Koq0b4VVfbPbcXP2xWSKhOCdqgtdoYxY06Lb15QNjjcttkRKiu27BXQlwc6sFpKjMmOeNxyI5go9ixfRymRAF5IXhtWaeF6bDmX5Q', '751b8b9b52099d4e', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-23 15:58:18', '2018-11-13 07:46:40'),
(119, 'Jewel', 'Rana', 'CASH', 'e3418808@nwytg.net', 'MALE', '+8801744960015', '$2y$10$hzDdXVIbir7Q5XPQ9ftNNO/Q6WzQF/6qZcN9epKjGiar5pjQeXez2', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-24 10:10:07', '2018-09-24 11:06:08'),
(120, 'asm', 'salah uddin', 'CASH', 'atha.atha@gmail.com', 'MALE', '+8801710444457', '$2y$10$9tOmmasSWlsg3sdu7Tv8dOovjkOSAEkD/30s3HNjBMSoZJ0iOIFq.', '', 'e2UXwQy4RC4:APA91bGqiPUo36GUki9TxELrn-5b_MZbqhLj6pXuxCa8DYz-Ssn3Qlue9CT1kJluNMaPszaCKXLU7aAQqYpz8LFdqmnd8Tfr4Gym9U_XyS2_cpaQBtlfnpkAgCri9P43rq3pdOsmGfbo', '751b8b9b52099d4e', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-24 18:27:39', '2018-09-24 18:27:39'),
(121, 'Tareq', '.', 'CASH', '882737@gmail.com', 'MALE', '+8801670656335', '$2y$10$yiLV8nlRnrsWkWSIDdfL0u7tHtFGkpAOMYStTsjmb6yNggKmNbeS6', '', 'c4eWIkasK3w:APA91bFTf9aK6K4X4HlQfB2OcToK6LJTn3q_MHUtfzmc3dk_fxQSz49_pDvcov1ZxwmNas_dHNzQcNU22goMEmg-m0X-eLzyDYnxQe1WJLU0uADa6yeVtOT7eu0MjZgjGfzOwUcerJly', '98f9b738f2edc388', 'android', 'manual', '', 23.86384880, 90.41724020, NULL, 0.00, '5.00', 928942, NULL, '2018-09-25 03:50:03', '2018-11-20 08:13:06'),
(122, 'kamrul', 'hasan', 'CASH', 'kamrul@gmail.com', 'MALE', '+8801940517643', '$2y$10$25xz7OAbmHaLP/FaumwRJe72MP8xWJtDa711e3tUme1UIXDHq1XG.', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-25 18:09:53', '2018-09-25 18:39:40'),
(123, 'Imon', 'Nipa', 'CASH', 'sujohn_cse@hotmail.com', 'MALE', '+8801722953073', '$2y$10$EG4J4GOZOK7Pk.qvQkv17OGOJwXd3G.PbIA.ETBvsNfuI1kapHUUS', 'https://graph.facebook.com/v2.8/1865610590182180/picture?type=normal', 'no device', '609A42C3-6F9C-4683-80F3-995F1DADDCAC', 'ios', 'facebook', '1865610590182180', 23.79400600, 90.37585600, NULL, 0.00, '5.00', 0, NULL, '2018-09-26 02:41:03', '2018-10-13 16:34:12'),
(124, 'ASM', 'Salah Uddin', 'CASH', 'atha.java@gmail.com', 'MALE', '1710444457', '$2y$10$nnmnWGh25JJZ64WOyU9ZjefOaAt724CcZ1NHhPdSVRgJsdPGWzmoW', 'user/profile/cb7715ec6b97e0ee578b9c6e22fd02f5.png', NULL, NULL, 'android', 'facebook', '1898290646927834', 23.84017310, 90.37013690, NULL, 0.00, '5.00', 0, '0KA2M0yvZZddZKozGX4tp6KLYMpp370fTYFNRoRL1FPXJ1J48MgTLLl4dSlV', '2018-09-26 07:06:37', '2018-09-28 11:25:09'),
(125, 'Faysal', 'Ahmed', 'CASH', 'foysaladmob@gmail.com', 'MALE', '+8801706684553', '$2y$10$uBCXCl.19Jye0rlRycy9/.S9ifQtrjPF3Ifxeruek2tO7nKHAeWuS', 'user/profile/5a64ba272adb9319d35caa83ef9bab31.jpeg', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-26 15:49:23', '2019-01-17 16:53:54'),
(126, 'Alfredo ', 'Pinedo Zevallos', 'CASH', 'gananciasonlineinfo@gmail.com', 'MALE', '+51921141833', '$2y$10$sydamwtJZIPdRBFBpJx18ugy/dY8maH7/pwsQVvFPLF/gHL9RAxz.', '', 'eD2WcEQNq7g:APA91bGUOi-HqOC-zIEpW0BuA7SDEAUmhjHrrRFArICLliPro4SQXT9DI40IQbPPblqI3DSrJemepX1lr6KkIgkJw4GA9ONg6iU2xdIA4OyhB4ZpUclMjDchvHAybeiXpwxyhq3T-Kjt', 'b60c7f4577c8a9dc', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-28 04:33:39', '2018-09-28 04:33:39'),
(127, 'Farhana', 'Afroze', 'CASH', 'evanice.parlour@gmail.com', 'MALE', NULL, '$2y$10$zpIASdftWVdYx0NC0fpvq.I/m5Sgbp34rVht2QwX.sqKoLgHfBPZ2', 'https://graph.facebook.com/v2.8/1699485293496986/picture?type=normal', NULL, NULL, 'android', 'facebook', '1699485293496986', 23.84017310, 90.37013690, NULL, 0.00, '5.00', 0, NULL, '2018-09-28 11:31:03', '2018-09-28 11:32:21'),
(128, 'Mingli', 'Tech', 'CASH', 'mingli.technologies@gmail.com', 'MALE', '+254723839664', '$2y$10$9QyCplcivFm8DzgtuxsJZuOfx8/tABAPnUYdHpwHmiv4FBp1Odn1u', '', 'dZExhDuixQg:APA91bHA4j-w1Exsr1rVrKLGx5Z8HpebD9SPPOzpHnUdfo33vUYoXibF-V49wZHJkeUbflLcs7KXPq3F6nsJ4DV3YMP1DN1QxaXQALzuC3QE2U8fF2G8F0TAk-Vt75-0cDBoBuqIE4kD', '47fd8a676d5e2c8b', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-09-30 19:23:29', '2018-09-30 19:23:29'),
(129, 'V', 'M', 'CASH', 'vikmagg25@gmail.com', 'MALE', '+254798609979', '$2y$10$589ZsNtAVf2BgDie5CdgdOuZ49p3irawIF5EFn8bcg14Eaw5xoezO', '', 'fWnOYeUXy-s:APA91bG8T0qAe-3R4gEZ3U_hJwV3ZPmvpTil-lMroY6QwnodkSwYhmiVFI9aJECsKyXrv43R7rQ4RoFYMJGTDlTYgZvTPdHiTW9D43GzofIbH2xhCTWNJ1PlsEv81zziU5GK1-3CunT2', '0f5f90a73942e20b', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-03 10:51:45', '2018-10-03 10:51:45'),
(130, 'AAPBD', 'Test', 'CASH', 'test100@aapbd.com', 'MALE', '1976653445', '$2y$10$T6mJBCvc79XiSv7zvbTNA.owVwaEz/eDGLoqtulkXak4cRySivgZq', NULL, 'No Device', '34182AA9-5979-4AEC-8B6B-A1303F528818', 'ios', 'manual', NULL, 23.84018470, 90.36137300, NULL, 0.00, '5.00', 0, NULL, '2018-10-08 19:33:13', '2018-10-08 19:39:06'),
(131, 'Tonu', 'Jewel', 'CASH', 'tonujewel@gmail.com', 'MALE', '+8801744960015', '$2y$10$aRPzGWuHjyR/SuMiGGWr0OHtARkjWUtnXzZeINWAkFC25iSBJgPJ.', 'https://graph.facebook.com/v2.8/1876375215786663/picture?type=normal', 'dfD2pcGXFlM:APA91bH5e1fnlTZWNg3isQ2W0XQ1_7ahWpU5XtL_QoxWw3YCOck8I7RBnnrNwqMQHLuW_mnlZBryKNCOdthuewQWUtBNzZvW7kobi_oVB5a9P1OGqlOUSP_fOgZMGOdJJyedyocQ1TzR', '1f0d543442f62940', 'android', 'facebook', '1876375215786663', NULL, NULL, NULL, 0.00, '5.00', 839985, 'X70X7jDSjZVidKWtQ15YEa0V1vpX4qK4hEn5X8mS67YHgDHivJ2kHaY1bYxz', '2018-10-13 13:01:49', '2019-01-24 11:48:51'),
(132, 'Jewel', 'Rana', 'CASH', 'tonujewel1@gmail.com', 'MALE', '+8801615960015', '$2y$10$xq8a7WLW0agnDptL2A1FUuwtjI8re1Sd7AeqhIzwfDHgyesGh9eK.', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-13 15:09:07', '2018-10-13 15:41:20'),
(133, 'jewel', 'rana', 'CASH', 'tonujewel2@gmail.com', 'MALE', '+8801615960015', '$2y$10$ohq.jgMhQ2VV4QdsWSeEfuTanVWMV29WyO2RqD/ASUnBsLiBcjEjq', '', 'dTUzQSe2Sy8:APA91bHJGOD11ue5J5DzlLcCSBelfhnj46RSC2Ow59B4Py-ghvfEkfCO7kcBzQG9VmS-wgPW10KkwjY-mevTHEP62apk8HgtHTC2as4tzMb2cwknG9Eq5mZEyeTm2Z0jIwSLdugBwVIF', '78022681aef3ff90', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-13 15:32:43', '2018-10-13 16:14:20'),
(134, 'Saad', 'Tlh', 'CASH', 'saadtlh@gmail.com', 'MALE', '+3547805746', '$2y$10$sjGBPQtmXZ6Qrq4dfW6qY.vZGLNrwLAUiAuvufIH6pp.DKnPFhjDa', '', 'faYZBlux2Uo:APA91bGFuG5oakeKQvLUIGWbjYoOl8RxxYh2tuai3kfn_1c81Z3fs5Lw7EK9GwFU4Kg6cq54rexK25yXmReguFNnhN6um-_JSx-J3ELxx67YSdaBItt3mqDm3x9DTbkWv2QPGEye7zcH', '4759c03f745a5eba', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 525419, NULL, '2018-10-14 17:57:53', '2018-12-31 19:48:03'),
(135, 'Balayet', 'Hossen', 'CASH', 'nti@dhaka.net', 'MALE', NULL, '$2y$10$WF9FYNcBkRVT5.yttcAKFuaDVNm45bvmaTrGZjzCXonmkD8DJPdfu', 'https://graph.facebook.com/v2.8/1883446088370401/picture?type=normal', NULL, NULL, 'android', 'facebook', '1883446088370401', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-16 18:41:23', '2018-10-16 18:41:23'),
(136, 'Kumar', 'Lalam', 'CASH', 'vijaykumar107184@gmail.com', 'MALE', '+919441178486', '$2y$10$3Re0AxjN9Ip3vaMmXQocROvxtsRlmbTQwoCt1FYTBHcMBEj4qSAnK', '', 'fOrtvrlb1qU:APA91bFdq3p6kasRo9rFpTbmuBfNxtjbKqWKV32etQreHcnth0LpMNYmBZZd-Lq1z0IA4lTcCOTPe4L1M1DrVvvLAGwC0umiVSYcVn6iAkzsjRylto1l6jiAFfqxNS68wQQtEVw1c_29', 'c91427b03469e0ab', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-21 05:16:02', '2018-10-21 05:17:52'),
(137, 'james', 'lansdown', 'CASH', 'jameslansdown@hotmail.com', 'MALE', '+4407561111141', '$2y$10$hq86Ue.uTEIpXqIxIFxlC.kBBei0KU8ZKfr.aKfUvbFoqyDOoSgZu', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, 'kZUlMC5sklQdOpU4Bg1QE2n6KqAdQemrHYMAaE9WuDGtOIOVcy20KQfV9aBT', '2018-10-23 03:27:48', '2018-10-23 03:28:20'),
(138, 'Quaviur', 'Rahman', 'CASH', 'quavy.shah@gmail.com', 'MALE', '+8801678242965', '$2y$10$YgnPcNAPkKndQpzpuWQ3y.6yYe218WgSPjPOLrshiny5I.vK53HKe', NULL, 'dFwJAtQN84A:APA91bHHCY0RGobT93VCOD7Xlnsrza9Waron5_2jumVNdUWfmzzkXPRrRyBTIfrU1fRU71GK9Qh9ki5-bXKFQi0fEhz2ucBOdjpFSWMt4LbRJNVW87EpItR2yXH842z0rDDSsOvvjGaK', 'a2b53fa5df143554', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 795675, NULL, '2018-10-23 13:40:14', '2018-10-27 11:29:17'),
(139, 'Kanchan', 'Yadav', 'CASH', 'asterisminfosoft@gmail.com', 'MALE', NULL, '$2y$10$l8SVJARfiUr138e3vDORw.vP.5NbHYHa66N4fx23y49EeMdENzNYW', 'https://graph.facebook.com/v2.8/181045286107535/picture?type=normal', NULL, NULL, 'android', 'facebook', '181045286107535', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-30 11:08:28', '2018-10-30 11:08:28'),
(140, 'Krunal', 'Dabhi', 'CASH', 'krunaldabhi@outlook.com', 'MALE', '+917622023454', '$2y$10$kVIZqFA2GxdZYFkcxOSp3.2.kwX.XRB7aiRmgR8IMvHeAo6v4Yv.C', 'https://graph.facebook.com/v2.8/2218889815059970/picture?type=normal', 'f6cMvcwoue8:APA91bEvwx6-Orsblik5uDv978AvkbpgFC2yZzHjGhnC72bVkQOBajJ1YFy7lFTwNXtrnL4WKqXW5UUqTC1WpsXljx9vQe3CCLNHQtp5SbwWZOU8yr0z0286CkCF_uYOic8XbvXLJDc_', '383f8c138333228a', 'android', 'facebook', '2218889815059970', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-30 12:17:34', '2018-10-30 12:17:34'),
(141, 'Mamun', 'Hoque', 'CASH', 'mamun@aapbd.com', 'MALE', '+8801617703137', '$2y$10$BaOIg24BW1gForlIY/mLzO3qH0qcwttValT9D0fkL946AtN2A7TxG', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-30 16:28:36', '2018-10-30 16:28:36'),
(142, 'Romman', 'Sabbir', 'CASH', 'misterxero96@gmail.com', 'MALE', '+8801681588062', '$2y$10$fiiRmdb/UpwlZlMxd44dVeqMdcjmIVUVp4522MVC0C3cbVo9NHEUG', '', 'fVBMWVutgqQ:APA91bEnJttvvNgg4f6SP2YyahQcOCOxPGM8JkYyJibr1VDtCCiJ_aNq8hpSttSDRziJSmJIGKrbK51ypnNt9tE4bi69NrymutZ_BSqmjOSGVeNuoGw3lkQx2IVeTRz8kgFNQtlAOHna', '5b4d4599d85d01dd', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-10-31 08:24:26', '2018-10-31 08:24:26'),
(143, 'Mahi', 'Khan', 'CASH', 'ahikmahin@gmail.com', 'MALE', '+610411386344', '$2y$10$QM9UOWeNWs7y/lJJNIt6TOw1eKj337hQnTLOdPYCFAVGKJCJj5YQq', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, 'CqG4QIXXWw76xx6kzPOGu7SJwzlSsrKFMCdA1UzvGTLIPUsPkH5kCTbKBZMk', '2018-11-01 23:10:01', '2018-11-01 23:11:46'),
(144, 'Shazid', 'Khan', 'CASH', 'shazid@gmail.com', 'MALE', '+8801758339722', '$2y$10$5ANBibIIwaTBgzpXywElGuO7ts1ezmLL6aEYOu3XLZsxTYtAUeiKS', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-02 06:30:34', '2018-11-04 09:07:43'),
(145, 'test', 'test', 'CASH', 'kfdjf@test.com', 'MALE', '123', '$2y$10$Qywfe2M9qxJ3COEPh/rMweLIRF.4vdGgYHCy.0jmFMhlPiI6o9lw6', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-03 20:36:01', '2018-11-03 20:36:01'),
(147, 'Imran', 'Chowdhury', 'CASH', 'shazid12@gmail.com', 'MALE', '+8801758339722', '$2y$10$VzngEaBAoAU2oweJnvGS9ugo8TPSQRpeDfzKOzP8F/eYEY5l8iBlC', '', '', '', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-06 14:41:52', '2018-11-07 19:01:25'),
(148, 'shojib', 'islam', 'CASH', 'shojib@gmail.com', 'MALE', '1553717992', '$2y$10$qhH59ADF70dBaMgYxx5wmu5e/2ACFH537Al0PUrBI2vN61PdpPU5m', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-13 07:34:42', '2018-11-13 07:34:42'),
(149, 'Obydul Islam Khan', 'Shazid', 'CASH', 'nebir@gmail.com', 'MALE', '+8801758339722', '$2y$10$4o4BSYyCZ/19tWX2BuLoFeS9RPP.YAHogOSaqWlLJ3QV1xItDRmgm', '', 'eBFuI3pPMo8:APA91bFt1lAZeMPQc8GW1DcRRbqwIGo8NvhQp9Gnh5hT0ozoTn8vbLpAMC9LGN5OxB2D3BcSAP_oeflO8eOoy5__s5dfmPmlJPOvCxRF4xfPr-x4PtvOS_57j1rxPc5l1VwDpT78EQqW', '300d75af77665360', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-17 07:15:13', '2018-11-17 07:15:13'),
(150, 'Md.Masud', 'Parvez', 'CASH', 'pavel_cep@yahoo.com', 'MALE', '+8801672428433', '$2y$10$nYxV0dW1RjHCkmD1x3BY5uA.BEvUoWywhLqGrxPEL8s6Y.C5pYKYS', 'https://graph.facebook.com/v2.8/947057358824469/picture?type=normal', 'eQgIlkpC8RQ:APA91bGEBhXh0_8pEfJ02ZxN5EFraljTQVOXwWFy4gyQTMBlyW8oEHeREM5UgndWZu_6o1yt8OwtYvpn_o-25FyryGabroBcElyBUnBIEmXlJezjoIW9vYxQAi0N4HFET2M-P-vHr2hR', 'e695390a70cedfaa', 'android', 'facebook', '947057358824469', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-25 04:20:37', '2018-11-25 04:21:24'),
(151, 'Sanjida', 'Khandoker', 'CASH', 'waterandshadow@rocketmail.com', 'MALE', '+8801797470670', '$2y$10$Vptvd.8Gz0yoF2e8aiJo2uGdotYGA4h6avb3tPVENEKeb6nhHn8Ta', 'https://graph.facebook.com/v2.8/1795482807229143/picture?type=normal', 'fu3nzjPoORs:APA91bHElhviuIKBgnfVye2T4eCKK7NZWh0TgXZwcIJsWHk2f2fyGkPD1q3yTlhXS5LSH7qGcI6OKoPS025zrblLBOrNR6mavOZjKDJfzqac_Yy5EdO5dirZrpE0gsPHfrrNb5htHpOK', 'fab52522822b0b6c', 'android', 'facebook', '1795482807229143', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-25 11:25:48', '2018-11-25 11:25:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `email`, `gender`, `mobile`, `password`, `picture`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `rating`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(152, 'Jewel', 'Rana', 'CASH', 'tonu@gmail.com', 'MALE', '+8801615960015', '$2y$10$at6k9tMN.0JLG4p9MUSOq.CBX4oCkbovmWWluo39Da8V.DYSy.bo2', '', 'c3KRFPweT_M:APA91bEhlOI0VWa57P1IQRN7vqYeaPgXXWfVw_I2vE4ge5cshOVf3Jdpsbt3VTvmCiKMVIhmS-qpaGm-Jpe20hSGVkfsfDKTADDTXTiF0QcabC7Dd8Nhfx9qq42seVmftDE35L8xKT0S', '92de30dc1823021b', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-27 07:35:38', '2018-12-05 06:47:32'),
(153, 'Afsan', 'Ahmed', 'CASH', 'afsan@gmail.com', 'MALE', '+8801627160340', '$2y$10$NkhNg2S3Ok1VjDuKBGvrwekdnzq8Gno.iG8ldnK4hytzjX.MuS.7C', '', 'ftv4te2xpdw:APA91bEUhIEVv5DUl7rlDzH9Pwm-y3yUd8C5nDyJimVQlPtZR-B46kGM9_mHPkH73r3h4zZh5_4jgQPxT1lEHQVLPYamiN_eBpaevXgaLerlyojf7bbHLuSxsy77j_Sb-pW3iO0u_R_E', 'c6affbabd08da350', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-27 14:49:49', '2018-11-27 14:49:49'),
(154, 'Patrik', 'Maruzs', 'CASH', 'maruzspatrik@freemail.hu', 'MALE', '+34658833206', '$2y$10$X34JJSWSn8WdlaqGvupMKOv0FcTEkpJ4vvrseJx.o4CRm6XY8Payy', 'https://graph.facebook.com/v2.8/2076921792369397/picture?type=normal', 'd0XJ6ZlTQDg:APA91bFl0_e1Ae7nicSXE7-TG85fzJtNWNI7ELlcwmyOVqcbHblv_wqmfs8haq6utAbCsGEs-8KKmu6xdYXqGSuz76HvYSMjuBGz6ZEZJ0wjqSgB3FXtlq3zl0G29bKYWp7nbrPyK1bP', '7ac39ec3a44be0f9', 'android', 'facebook', '2076921792369397', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-30 17:50:10', '2018-12-10 16:53:40'),
(155, 'Reza', 'Esmaeili', 'CASH', 'reza@sarian.ir', 'MALE', '+989122444875', '$2y$10$hBzQS./U9CSvYeO9wb/HoeSLJsLWpDU1zXtMdDY0zrCGTfFSD5VjK', '', 'feN1Qde1uZg:APA91bEx0ZCpJjuxqG8_3-9jDLAA--zLuK_fxxCDgT1kGCfxaGsMO0yhfpSLYudpwu2Y8G2fxZkQmKOU1oVi6EUu-O74i9Wq9lRMMyFsJw4HkWaQRpfZELBYa8aVM6Y1lgDVvZ3VyVO6', '42dce490dfbdfad8', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-11-30 22:23:40', '2018-12-05 18:36:18'),
(156, 'Borakh ', 'User One', 'CASH', 'user1@borakh.com', 'MALE', '+8801717653445', '$2y$10$gfTgvjqnk5UayhAyESOU5uloqPQp3/NB/mq2Rihqz9NcFwTQpx0j6', NULL, 'no device', '847D8D8B-C42D-4779-8827-ADA2386B7162', 'ios', 'manual', NULL, 23.84018470, 90.36137300, NULL, 0.00, '5.00', 0, NULL, '2018-12-01 15:31:42', '2018-12-01 15:59:56'),
(157, 'Shanto', 'Tft', 'CASH', 'islamshojib@gmail.com', 'MALE', NULL, '$2y$10$AjBKSzmSZnSJWTO.9YX/xuS0S2hvBzw2I4P/CAgMeAbtsuo4AprWq', 'https://graph.facebook.com/v2.8/1938336439618299/picture?type=normal', NULL, NULL, 'android', 'facebook', '1938336439618299', NULL, NULL, NULL, 0.00, '5.00', 0, 'DXmAAktdCdYHmXKfyewJNptlHlMr9xATf7ZTzmk5PlTOqhY8eSEkcSwzAOAg', '2018-12-02 11:59:42', '2019-01-10 06:18:04'),
(158, 'Fatemeh', 'Kheiri', 'CASH', 'kheiri62@gmail.com', 'MALE', '+989122598911', '$2y$10$rI5Mt.OHGUVv4L5jT3s4wOlmjHaVT.x9fXzs7n9pD3YQm6kI8sSIe', '', 'fwvrx47PmS4:APA91bFrYMhNypbF_5HEdpDfIo9j2QosTYN4ZhBeG0ey_KAlOXdhVv575rPyp6auI3E8BjD5ujI0lSvn9G35aKKo44q4MM1voV4lcdFiyHSA3TRSk1a1verFaIxclK3b7XIsOve34Jt_', '42dce490dfbdfad8', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-02 20:29:49', '2018-12-14 16:57:59'),
(159, 'Newaz', 'Akbar', 'CASH', 'newaz.akbar@gmail.com', 'MALE', '+34637168885', '$2y$10$x7h.ap8pnCAJJfi83X7IG.TZ6oQO0n09YdLmBcAdde2gO.4eyUSei', '', 'cBqgv2ldh1I:APA91bHYJ3kZLhuMICC4VxrnBC9-dsQMAue_e8a6FZAbCTm-x4aRv7lcbVcXEzodK7_12VGFedqJrvAzYglgiGJDBQJdXx84kKrCO2ieNHB0TFU1hvpr504wXLbGPJ9NqqXtSq2cUHKo', '7441534157b26e63', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-05 18:25:05', '2018-12-05 18:25:05'),
(160, 'Ekramul', 'Hoque', 'CASH', 'ekramramu@gmail.com', 'MALE', '+8801760606288', '$2y$10$nT/1lwqpo0NLMHEt0SfxIue9KGL/7CDxKx6BsQEog9Y5J8P0MTqHG', NULL, 'No Device', 'F7FB38A0-3DED-4AD7-8FC6-CE6FAF53E5ED', 'ios', 'manual', NULL, 23.81033100, 90.41252100, NULL, 0.00, '5.00', 0, NULL, '2018-12-08 06:53:29', '2018-12-08 12:35:16'),
(161, 'Newaz', 'Akbar', 'CASH', 'awesome@newazakbar.com', 'MALE', '+41793738758', '$2y$10$gO0Y9X9taZWrFSOjbiMdXuihH4PjQxhou4IqkVQMN9XqKKm.770YO', '', 'eBOzylOoXEw:APA91bE5GZZIIbluAjuVbsRu66dUlKVFatFJQfdYvlkS4fJHgq0N8qDDADS9Nq2fT40i5C2Cy_nMiedQP8ti9NNWiXPANLdMsSPGaDM0Wjv-24nN5lvlpX0Z9GSJ-l0uHtUpix1S8CIg', '6989d4fb0caab20b', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-09 15:55:32', '2018-12-09 15:56:18'),
(162, 'Daf', 'Vanae', 'CASH', 'dafvanae@gmail.com', 'MALE', '+34722477000', '$2y$10$pHc7JqLCTQiBqpGEtOlFJ.ZZl9e5FUWRGROWNqbhj3RVDxcuju3LG', '', 'dFsOwpejYSc:APA91bEdweNXJXVQj2sFKI0foSzWKB6oxX0VeTt_SvVTiGRroyxR3K3yztiSMEnExLTCjzmFhOjoqQTH3sxjynQ7nwA77zrTirc8175HwSLQy3dbKMT-RbiozRdnM3K_tU-f-ws5q86x', '2228bafca63cd654', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-11 14:26:05', '2018-12-11 16:11:37'),
(163, 'Zahid', 'Hasan', 'CASH', 'topuit.com@gmail.com', 'MALE', '+8801625773202', '$2y$10$Gu93/.AnIT2QRmLJG3cgRuLEDj41Sp11agr/b.TQObIM42CVeJydG', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-18 08:45:00', '2018-12-18 08:45:00'),
(164, 'শফিউল', 'আলম বিপ্লব', 'CASH', 'javaorjava@gmail.com', 'MALE', '+8801717653445', '$2y$10$hHjlRbfYB6wdiDPUhlHpgO9lSQEE4xZdQFjTjk8ZC4QyTQwisveZy', 'https://graph.facebook.com/v2.8/10217455114954292/picture?type=normal', '', '', 'android', 'facebook', '10217455114954292', 23.84018500, 90.36137300, NULL, 0.00, '5.00', 678981, 'RGiEwuntKKfI4iJ8G5fkVRgiKklHiwUCNPbrjEVisC12ghw3wfJToFghqRBo', '2018-12-18 21:33:07', '2019-01-29 00:10:03'),
(165, 'Amrit', 'Tewari', 'CASH', 'sakurapty@gmail.com', 'MALE', '+61466487884', '$2y$10$peowte0MRafP/3VRVV3jp.vCTIM6w7bWtjKMVGrwU9nOWzp4EFtfe', '', 'emkI-X1rIJM:APA91bEMMzn99oaHCsm5pywv9Oon89kWvLVEQS2u1hxc_PoZFAdOfnsPB1_p8Sf1maMkypMkyQSV8kK8_RvYm4nStBK_npAyJyk8jn0zl7lwbw8Jmhn3uf-TDg4XmRGZvKgdOmfh7w2W', '3c799ab129073008', 'android', 'manual', '', -33.87363740, 151.20778300, NULL, 0.00, '5.00', 0, NULL, '2018-12-23 06:11:05', '2019-01-18 09:37:01'),
(166, 'Quaviur', 'Rahman', 'CASH', 'revive.five@hotmail.com', 'MALE', NULL, '$2y$10$Dd8fAIUkBWb3iyJ.ZTeYnu1gxkFA.tlaEkqalfUwEduQzJwCBGoIC', 'https://graph.facebook.com/v2.8/10155641642751431/picture?type=normal', NULL, NULL, 'android', 'facebook', '10155641642751431', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2018-12-23 10:01:35', '2018-12-23 10:01:35'),
(168, 'Asm', 'Salah', 'CASH', 'hellojava.com@gmail.com', 'MALE', '+8801913142024', '$2y$10$/cQjrWwhTBXgobHHTn/fSuQjW8mLPqd2jYeU15gORgvZg/0cTxL6a', '', 'cHbVsj6PKTk:APA91bELzjUJYXvHhlmh7B6QIjGxlwtdASUeE7AydDFRqicWxoyXFp0ISCMlPLnRaYz678CQ41onrj50KNOgPpzNkNN2Jgttn5JvHy885Mk1io3Lkra38OZ_p1Y9YVfkB_g51LtPQlBz', '63e0a778cefbe01', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 627488, NULL, '2018-12-31 08:32:08', '2019-01-06 12:36:03'),
(169, 'Shahab', 'Hoseini', 'CASH', 'shahab.hoseini68@yahoo.com', 'MALE', NULL, '$2y$10$f2LXGzYpZFbe1ssnJmcU0egl3nxO2hfOOoGmNWOd9A.txUS.Bipvy', 'https://graph.facebook.com/v2.8/1924211184355146/picture?type=normal', NULL, NULL, 'android', 'facebook', '1924211184355146', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-05 19:14:37', '2019-01-05 19:14:37'),
(170, 'Sunhera', 'Jara', 'CASH', 'sunherajarabest@gmail.com', 'MALE', '', '$2y$10$Y5Fm6G99laaBNwjkirgZ.OzdFXbx6432DCjauEjyXBeaJUkLn/JsK', 'https://graph.facebook.com/v2.8/761158504218333/picture?type=normal', '', '', 'ios', 'facebook', '761158504218333', 23.81033100, 90.41252100, NULL, 0.00, '5.00', 0, NULL, '2019-01-06 10:52:51', '2019-01-14 06:30:30'),
(171, 'Karrie', 'Tan', 'CASH', 'revhqglerz_1543819442@tfbnw.net', 'MALE', NULL, '$2y$10$rMvbVEUXAFX4rrh5JwlZFOGDTo0F7Lad5oU5ICMGNu4diU6aJKWQu', 'https://graph.facebook.com/v2.8/10150053883157353/picture?type=normal', NULL, NULL, 'android', 'facebook', '10150053883157353', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-07 02:38:40', '2019-01-07 02:38:40'),
(172, 'test', 'acc', 'CASH', 'testacc@gmail.com', 'MALE', '+8801717653445', '$2y$10$jzn2Rf91QOCgkHjxS93TJu08F6S62WW/YNrmgqLNIU9t1hr6QbepO', '', 'cBZH4ISv6pc:APA91bEMJk9Bsz9XC1Eqrx7C3D-ou1BNDZXqimq36CaIcABUuDmUC7x8lTWjMB-ai8TMTV2Y-DHjgdnpWQVe7ohAo03XNYaqFTVxyCC8RMuJ8MCshq1YIbszMEtKo9GawoLq0p5cbm_7', '01c36b1b7a73bedf', 'android', 'manual', '', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-08 14:10:47', '2019-01-08 14:17:36'),
(173, 'Manoj', 'Randeniya', 'CASH', 'manoj.randeniya@nexeyo.com', 'MALE', '+94710812785', '$2y$10$SGAf/GjRgQS5J3rq0bv7ouHcoLZBThESFbNBiMlKa24UUBxHEJCPC', NULL, 'no device', '1AC10466-7452-4770-8C25-A8ED162F3C7D', 'ios', 'manual', NULL, 6.87562532, 79.92109491, NULL, 0.00, '5.00', 0, NULL, '2019-01-08 15:29:46', '2019-01-15 00:46:21'),
(174, 'Marian', 'Kmosek', 'CASH', 'nairamomk@gmail.com', 'MALE', '+420735867347', '$2y$10$Efe9wjEVovr3HIUTXvTEruprsI8H4Pn81vADnJUTe2WsROmfrOZWC', 'https://graph.facebook.com/v2.8/2174630739532269/picture?type=normal', '', '', 'android', 'facebook', '2174630739532269', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-08 20:28:12', '2019-01-08 20:39:33'),
(175, 'Biplob', 'Driver', 'CASH', 'biplob@borakh.com', 'MALE', '+8801717653445', '$2y$10$FX83Uh0iFB21mvS3AETqx.agJo7PW.Oei9FS5axkc.no.8drLgPV.', NULL, 'no device', '58F37E98-CD56-4ED6-AD6F-22027FA0BE6C', 'ios', 'manual', NULL, 23.84018500, 90.36137300, NULL, 0.00, '5.00', 0, NULL, '2019-01-09 14:25:07', '2019-01-09 14:38:02'),
(176, 'Test', 'User', 'CASH', 'nexeyo@gmail.com', 'MALE', '+94710812785', '$2y$10$FjzlX3CQ9wcfv0.biQS/3eDmFlWHuicAcjtISVKkG7YOd3lmmovmu', NULL, 'no device', '90CD6959-4F67-467B-8DB7-9CE449159511', 'ios', 'manual', NULL, 6.87563043, 79.92109835, NULL, 0.00, '5.00', 0, NULL, '2019-01-15 00:51:40', '2019-01-18 00:57:46'),
(177, 'Nishantha', 'Eka', 'CASH', 'nishantha1226@gmail.com', 'MALE', '94773234624', '$2y$10$HXzqO6c8R5D.GhxhOj2p3.sUYZDuvqONwv21rtmnt3cwmB2cJvCaW', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-15 06:54:54', '2019-01-15 06:54:54'),
(178, 'triple', 'zzz', 'CASH', 'triplez@test.com', 'MALE', '4205354567', '$2y$10$Z4jpf8cK7hVrV0V7LcMy/Oruzyr/zSRLXR6UmP1NXUgxcRk8Ovg.K', NULL, 'No Device', '7A2BDBAD-F220-4E5D-AC98-EF5378E0CDE5', 'ios', 'manual', NULL, -33.87363149, 151.20783906, NULL, 0.00, '5.00', 0, NULL, '2019-01-19 05:53:15', '2019-01-19 05:55:04'),
(179, 'Biplov', 'Gautam', 'CASH', 'biplovs@hotmail.com', 'MALE', '+9779849326016', '$2y$10$C9JkzZuQi8wbcV3R.Zygg.kY1pNEosVkfhXDedwwuy315RqK/rjQ6', 'https://graph.facebook.com/v2.8/10156602563626690/picture?type=normal', 'd_TfEVX2DmA:APA91bGX5p8Ga8_vMVb_uGY3CB7ZmUoKmmfgkwjEPz__k-6lsVt6GG5RO6AHzcl9NRRrlWyGBnSxOuzrp7fKQ-xkhmLt6MuzAIqE1N55o2rYflExyVHCN20J1nznGwh3slFoAKnffHt0', '80a115f6b26d8f55', 'android', 'facebook', '10156602563626690', NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-01-25 07:12:42', '2019-01-28 04:06:19'),
(180, 'Puspa', 'Karki', 'CASH', 'puspakarki25@gmail.com', 'MALE', '+9779841168924', '$2y$10$vYvN.zWyf3PsAm0cmfpGn.mRFGcE4/N2gvuypva0T/KhFI5VCzflS', NULL, 'no device', '6AFFE8FE-CEA7-417E-B618-5588F193890A', 'ios', 'manual', NULL, 27.70428454, 85.32256016, NULL, 0.00, '5.00', 0, NULL, '2019-01-27 07:36:26', '2019-01-29 07:32:11'),
(181, 'Ernest', 'Lagat', 'CASH', 'lagat522@gmail.com', 'MALE', '+254710433876', '$2y$10$plymZ7/AHeBLsQmsotnVfuwXevu8/LjcLrIW06vco.Jg7Htp5c5wK', NULL, '', '', 'ios', 'manual', NULL, -1.28498494, 36.82679575, NULL, 0.00, '5.00', 0, NULL, '2019-01-28 06:55:00', '2019-01-28 10:48:23'),
(182, 'Eric', 'Omari', 'CASH', 'sawatibandkenya@gmail.com', 'MALE', '+254721254202', '$2y$10$CRO7AeCdHb79hzAekUaIf.iMp0yEIgZROusSMJJqz8c8baW9kUZKK', NULL, 'no device', '24CF2953-771E-42EB-A4D3-8F9977807235', 'ios', 'manual', NULL, -1.23907415, 36.72720161, NULL, 0.00, '5.00', 0, NULL, '2019-01-28 10:52:48', '2019-01-31 15:19:21'),
(183, 'Juan', 'Cami', 'CASH', 'juancruz.nqn@hotmail.com', 'MALE', '+5492995099396', '$2y$10$QPoCNAieDC41p3/ISi1d7.gBhzv61n3OQi9bTK7QnLvpAT/LPImvu', NULL, 'no device', 'E6082F38-0E9D-4A73-8548-FD86E7023925', 'ios', 'manual', NULL, -38.94963103, -68.06006745, NULL, 0.00, '5.00', 0, NULL, '2019-01-30 15:56:34', '2019-01-30 16:46:56'),
(184, 'Yiyo', 'Camiloni', 'CASH', 'yiyocamiloni@hotmail.com', 'MALE', '+542994091442', '$2y$10$8j7Ppmto6fEPvnQAY476SuCMF/dSfzXOTr4PW1/epvUKKf9KCM8fW', 'https://graph.facebook.com/v2.8/10218941911885100/picture?type=normal', 'no device', '1AF72836-253A-4798-9595-BD61639A1C92', 'ios', 'facebook', '10218941911885100', -38.94971803, -68.06008974, NULL, 0.00, '5.00', 0, NULL, '2019-01-31 21:30:27', '2019-01-31 21:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `current_provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('SEARCHING','CANCELLED','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED','COMPLETED','SCHEDULED') COLLATE utf8_unicode_ci NOT NULL,
  `cancelled_by` enum('NONE','USER','PROVIDER') COLLATE utf8_unicode_ci NOT NULL,
  `cancel_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL') COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_track` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NO',
  `distance` double(15,8) NOT NULL,
  `travel_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_latitude` double(15,8) NOT NULL,
  `s_longitude` double(15,8) NOT NULL,
  `d_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_latitude` double(15,8) NOT NULL,
  `track_distance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_longitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `d_longitude` double(15,8) NOT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `user_rated` tinyint(1) NOT NULL DEFAULT '0',
  `provider_rated` tinyint(1) NOT NULL DEFAULT '0',
  `use_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `surge` tinyint(1) NOT NULL DEFAULT '0',
  `route_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `provider_id`, `current_provider_id`, `service_type_id`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `is_track`, `distance`, `travel_time`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `track_distance`, `track_latitude`, `track_longitude`, `d_longitude`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'TRNX876652', 111, 111, 111, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'NO', 9.00000000, '0', '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 14:53:23', NULL, '2018-09-22 14:54:44', '2018-09-22 14:54:49', 1, 1, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 14:53:23', '2018-09-22 14:55:14'),
(2, 'TRNX536795', 111, 112, 112, 1, 'CANCELLED', 'PROVIDER', 'bbj', 'CASH', 0, 'NO', 5.00000000, NULL, 'Mirpur Road, ঢাকা, বাংলাদেশ', 23.80668070, 90.36648790, 'Banani, ঢাকা, বাংলাদেশ', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 15:09:44', NULL, NULL, NULL, 0, 0, 0, 0, 'wvhpCqupfPgAeIGu@IAMGGKCO?MFOFGOo@M_A@uARmB~@wHz@eGZ}BTuA^oA^w@`AeBlDaFfAsAn@{@lCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qB|AgFtDcMd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTzB@rAKl@KFEFGDSIgCO_DCy@?OlAkHJk@BSCuBGwA]sDQ{BHwFHq@VyAFe@BeAAeHAmGEwB}CYeHk@_Fi@{AQKABSd@oHp@_J', NULL, '2018-09-22 15:09:44', '2018-09-22 15:10:31'),
(3, 'TRNX480092', 111, 0, 112, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'NO', 9.00000000, NULL, 'Mirpur DOHS, ঢাকা, বাংলাদেশ', 23.83646800, 90.36953920, 'Banani, ঢাকা, বাংলাদেশ', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 15:11:02', NULL, NULL, NULL, 0, 0, 0, 0, 'ypnpCcgqfPzAGKwEEsBCaACCEAK}GK@G[eAuGuAHyB@C{@Aw@LoA`@kAj@aAr@u@d@U^IfAA~@CDEhDK|GOtHCxFKn@C|@M@EBAFCHANBz@?nEYxBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMCAEIAIBKNKB?l@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDDYB]VuAb@mAp@sBD_@AQGYGKMKSKWC_@JUTKXAZJd@h@pA^b@x@n@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@xJ`A~LjArBVrBN|CXPuCd@kG^mF', NULL, '2018-09-22 15:11:02', '2018-09-22 15:11:10'),
(4, 'TRNX186377', 111, 0, 112, 1, 'CANCELLED', 'USER', 'fs', 'CASH', 0, 'NO', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 15:13:18', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 15:13:18', '2018-09-22 15:13:33'),
(5, 'TRNX964870', 115, 0, 0, 1, 'CANCELLED', 'USER', 'kkn', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 15:48:26', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 15:48:26', '2018-09-22 15:49:15'),
(6, 'TRNX213593', 115, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 15:49:38', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 15:49:38', '2018-09-22 15:50:41'),
(7, 'TRNX572243', 115, 0, 0, 1, 'CANCELLED', 'USER', 'lln', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 16:11:30', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 16:11:30', '2018-09-22 16:11:49'),
(8, 'TRNX522953', 115, 0, 0, 1, 'CANCELLED', 'USER', 'm,b,b,mb', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 16:12:11', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 16:12:11', '2018-09-22 16:12:48'),
(9, 'TRNX434545', 115, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 16:21:21', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 16:21:21', '2018-09-22 16:22:23'),
(10, 'TRNX382805', 115, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 16:24:12', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 16:24:12', '2018-09-22 16:25:14'),
(11, 'TRNX871149', 115, 113, 113, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 23.83563590, 90.36609380, 90.40427190, '2018-09-22 16:25:30', NULL, '2018-09-22 16:26:31', '2018-09-22 16:26:41', 1, 1, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 16:25:30', '2018-09-22 16:26:54'),
(12, 'TRNX640336', 116, 118, 118, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', '333 Rd # 02, Dhaka, Bangladesh', 23.83554650, 90.36609790, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 23.83551840, 90.36611780, 90.40427190, '2018-09-22 17:37:57', NULL, '2018-09-22 17:39:02', '2018-09-22 17:40:15', 1, 1, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 17:37:57', '2018-09-22 17:40:39'),
(13, 'TRNX192050', 116, 120, 120, 1, 'CANCELLED', 'USER', 'hhj', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83552600, 90.36610820, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 17:44:15', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCgspfPImFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 17:44:15', '2018-09-22 17:45:10'),
(14, 'TRNX886797', 116, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83551730, 90.36611640, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 17:45:55', '2018-09-22 23:47:00', NULL, NULL, 0, 0, 0, 0, 'ejnpCgspfPImFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 17:45:55', '2018-09-22 17:46:13'),
(15, 'TRNX447718', 116, 120, 120, 1, 'CANCELLED', 'USER', 'cxc', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83551820, 90.36611710, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 17:46:27', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCgspfPImFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCRbJ|@hIx@pMnAvIv@d@oHp@_J', NULL, '2018-09-22 17:46:27', '2018-09-22 17:46:59'),
(16, 'TRNX222051', 114, 118, 118, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Mirpur Road, ঢাকা, বাংলাদেশ', 23.80668070, 90.36648790, 'Banani, ঢাকা, বাংলাদেশ', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-22 17:49:44', NULL, '2018-09-22 17:50:23', '2018-09-22 17:50:27', 1, 1, 0, 0, 'wvhpCqupfPgAeIGu@IAMGGKCO?MFOFGOo@M_A@uARmB~@wHz@eGZ}BTuA^oA^w@`AeBlDaFfAsAn@{@lCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qB|AgFtDcMd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTzB@rAKl@KFEFGDSIgCO_DCy@?OlAkHJk@BSCuBGwA]sDQ{BHwFHq@VyAFe@BeAAeHAmGEwB}CYeHk@_Fi@{AQKABSd@oHp@_J', NULL, '2018-09-22 17:49:44', '2018-09-22 17:50:42'),
(17, 'TRNX184242', 116, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 1.00000000, NULL, 'Barun Bhaban, Kemal Ataturk Ave, Dhaka 1212, Bangladesh', 23.79458580, 90.41368030, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-09-23 12:24:02', NULL, NULL, NULL, 0, 0, 0, 0, 'ikfpCm|yfPw@iBRULXZl@VpA\\bBfCvMf@xDF~A?lCq@~J_AxM', NULL, '2018-09-23 12:24:02', '2018-09-23 12:24:29'),
(18, 'TRNX548243', 119, 0, 0, 1, 'CANCELLED', 'USER', 'driver not found', 'CASH', 0, 'YES', 16.00000000, NULL, 'Main Road, Dhaka, Bangladesh', 23.83571410, 90.36608500, 'Mohammadpur, Dhaka, Bangladesh', 23.76584440, 0.00000000, 0.00000000, 0.00000000, 90.35836060, '2018-09-24 10:10:56', NULL, NULL, NULL, 0, 0, 0, 0, 'emnpC_spfPGsFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCRpP`BhLhArHr@jHj@xOzAhSlBxP~AjC\\`CRfQzA`Hr@~@Ph@PbAr@b@b@`@j@Vh@zA`E|EtKpBtDZr@Pn@Nr@LfAVfDh@rHBNZA|AShBMjCKbA@xCXvCf@zBV~BVnBTx@@lDb@jAPnGTjHLfEBFl@Ep@}@dK_AxJOlA@r@HbAAXCn@CVIVX~I~Axf@d@fNRzHCl@jAdF`CrLv@hE@l@CTKRa@Ny@RmDx@`@zBpBrKzAvHdBjJ\\|ADLk@FkBJgGXuHRAR', NULL, '2018-09-24 10:10:56', '2018-09-24 10:11:28'),
(19, 'TRNX214236', 122, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 1.00000000, NULL, '25/D, Dhaka 1207, Bangladesh', 23.75403770, 90.37966330, 'Dhanmondi Lake Bridge, Dhaka 1205, Bangladesh', 23.75162810, 0.00000000, 0.00000000, 0.00000000, 90.37784950, '2018-09-25 18:11:48', NULL, NULL, NULL, 0, 0, 0, 0, 'km~oC_hsfPCIIECI@_@CIGO@e@pEDBg@jAJHBFDx@JUaAGYRBXlAj@tBZnAXn@P\\BDf@~@p@pAcB|@', NULL, '2018-09-25 18:11:48', '2018-09-25 18:11:57'),
(20, 'TRNX464393', 124, 0, 8, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 9.00000000, NULL, 'Mirpur Road, Dhaka, Bangladesh', 23.80668070, 90.36648790, 'Dhanmondi 32 Bus Stop, Mirpur Road, Dhaka, Bangladesh', 23.75162810, 0.00000000, 0.00000000, 0.00000000, 90.37784950, '2018-09-26 10:15:21', NULL, NULL, NULL, 0, 0, 0, 0, 'wvhpCqupfPgAeIGu@IAMGGKCO?MFOLKLCLBJHFNlASVI|IgDjAc@hFoBpFeBhC{@nAc@nIeCzCgAhDgAzAg@jLsDdEoAnGqBbF}A|QkGtIuC|IsCxFyA|FsAhE{@xAUrB_@bEy@pFiAbGyAlL}BpGkAhJiBjDm@JzBRtGFjBbBrQx@~HP\\xBpBLXLh@d@dGTAPFBFTpB|AR|BZ~@JPA\\hD^vEF`@HCtLoD`Cu@zHoD~FwCvDiBbGqCx@i@x@c@jCuAxAw@`HiDrDqBvAm@`DyAjBu@nE{BvDiB~KuFx@_@bCmAFViHpDkHlDqB~@cB|@', NULL, '2018-09-26 07:10:05', '2018-09-26 10:16:26'),
(21, 'TRNX710481', 114, 0, 120, 1, 'CANCELLED', 'USER', 'bnn', 'CASH', 0, 'YES', 14.00000000, NULL, 'House - 7 Road - 5 Sector - 4, Dhaka 1230, Bangladesh', 23.86008220, 90.40366330, 'Mirpur Rd, Dhaka 1216, Bangladesh', 23.80668070, 0.00000000, 0.00000000, 0.00000000, 90.36648790, '2018-09-26 12:56:58', NULL, NULL, NULL, 0, 0, 0, 0, 'mcspC{}wfPBtJH~CHPzAkAjA{@tB{AfG}EbMuJ`As@nBaBvEqDlLoJBMJQJEvBsAnGsE|MoKbBoAnJuHjPgMdBkAfCyAlDeB~Ao@xBo@dCi@zBg@|B_@bI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@Dv@@z@S~IUbKPf@Vf@X`@XP^H`AHTF^ZNd@B\\CRM`@uA|DKl@IjAIbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@fAG\\CRA@R\\vG`@`EVxCv@jIdB~SrAhOFv@dBQnASbDa@hDo@hAOtC_@dAjGxB_@`HoAzBc@vCg@hEw@~GmALABTXlDH`B@~@FfD?|BEzAIbAMn@QdAEr@BzBDh@`@vDRArAQ`AMjAQvCc@~Aa@xAq@dDuBpGaE_EkIm@sAu@qBSoA', NULL, '2018-09-26 12:55:57', '2018-09-26 12:57:06'),
(22, 'TRNX865536', 114, 0, 0, 1, 'CANCELLED', 'USER', 'bn', 'CASH', 0, 'YES', 14.00000000, NULL, 'Road-05, Dhaka 1230, Bangladesh', 23.86002370, 90.40366660, 'Mirpur Rd, Dhaka 1216, Bangladesh', 23.80668070, 0.00000000, 0.00000000, 0.00000000, 90.36648790, '2018-09-26 12:57:22', NULL, NULL, NULL, 0, 0, 0, 0, 'mcspC}}wfPBvJH~CHPzAkAjA{@tB{AfG}EbMuJ`As@nBaBvEqDlLoJBMJQJEvBsAnGsE|MoKbBoAnJuHjPgMdBkAfCyAlDeB~Ao@xBo@dCi@zBg@|B_@bI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@Dv@@z@S~IUbKPf@Vf@X`@XP^H`AHTF^ZNd@B\\CRM`@uA|DKl@IjAIbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@fAG\\CRA@R\\vG`@`EVxCv@jIdB~SrAhOFv@dBQnASbDa@hDo@hAOtC_@dAjGxB_@`HoAzBc@vCg@hEw@~GmALABTXlDH`B@~@FfD?|BEzAIbAMn@QdAEr@BzBDh@`@vDRArAQ`AMjAQvCc@~Aa@xAq@dDuBpGaE_EkIm@sAu@qBSoA', NULL, '2018-09-26 12:57:22', '2018-09-26 12:57:55'),
(23, 'TRNX254502', 114, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Road-05, Dhaka 1230, Bangladesh', 23.85976220, 90.40349600, 'Mirpur Rd, Dhaka 1216, Bangladesh', 23.80668070, 0.00000000, 23.85975190, 90.40344310, 90.36648790, '2018-09-26 13:16:06', NULL, '2018-09-26 13:17:39', '2018-09-26 13:18:22', 1, 1, 0, 0, 'mcspC{|wfPBtIH~CHPzAkAjA{@tB{AfG}EbMuJ`As@nBaBvEqDlLoJBMJQJEvBsAnGsE|MoKbBoAnJuHjPgMdBkAfCyAlDeB~Ao@xBo@dCi@zBg@|B_@bI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@Dv@@z@S~IUbKPf@Vf@X`@XP^H`AHTF^ZNd@B\\CRM`@uA|DKl@IjAIbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@fAG\\CRA@R\\vG`@`EVxCv@jIdB~SrAhOFv@dBQnASbDa@hDo@hAOtC_@dAjGxB_@`HoAzBc@vCg@hEw@~GmALABTXlDH`B@~@FfD?|BEzAIbAMn@QdAEr@BzBDh@`@vDRArAQ`AMjAQvCc@~Aa@xAq@dDuBpGaE_EkIm@sAu@qBSoA', NULL, '2018-09-26 13:16:06', '2018-09-26 13:18:45'),
(24, 'TRNX475820', 114, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Shaheed Tajuddin Ahmed Ave, Dhaka 1212, Bangladesh', 23.77611420, 90.39939570, 'Mirpur Rd, Dhaka 1216, Bangladesh', 23.80668070, 0.00000000, 23.77592160, 90.39903570, 90.36648790, '2018-09-27 09:37:59', NULL, '2018-09-27 09:40:01', '2018-09-27 09:40:12', 1, 1, 0, 0, 'ixbpCucwfPaClEhEk@d@KlA_@nCiAtE{CbEuCl@]x@UDRWDm@XiEzCsBnA}BtAq@VgBr@wAb@eANkC`@eBPo@Fs@JaBCuBO}@BqJcAuFc@yFm@WMoZqCcNsACxA?jF?|KU|AS`AEn@CxBAvADbAd@lFLhBBzBOr@mAfHAv@RvDLtCANGHSL{BTc@@{@?oBIcCKyAC{AFcDXqDXkBRmBR]FYJk@H_AFeCAQ`Aa@pBaCpImAfEeAjDk@fB[t@uAjC}BzDoG`ImGzHiDrEkCrD_ArBg@bBi@vD}@nGq@tF[dDCnA@^Jl@H\\NBHJFN?PGPGDz@xHRjAXpA\\bA~@rB~@nBvCfGNX|@|ASN{@aBOYqC{FuBqEu@qBSoA', NULL, '2018-09-27 09:37:59', '2018-09-28 10:59:35'),
(25, 'TRNX283058', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', '333 Rd # 02, Dhaka, Bangladesh', 23.83548480, 90.36615310, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 23.83550860, 90.36614360, 90.37954380, '2018-09-28 00:01:38', NULL, '2018-09-28 00:02:01', '2018-09-28 00:02:08', 1, 1, 0, 0, 'ejnpCospfPIeFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-09-28 00:01:38', '2018-10-05 12:14:53'),
(26, 'TRNX116364', 124, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Dhanmondi Lake Road, Dhaka, Bangladesh', 23.74493560, 90.37702200, 'Mirpur DOHS Shopping Complex, Dhaka, Bangladesh', 23.83791430, 0.00000000, 23.83565280, 90.36606640, 90.37552540, '2018-09-28 11:00:54', NULL, '2018-09-28 11:01:58', '2018-09-28 11:03:26', 1, 1, 0, 0, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@Wb@i@Wc@K', NULL, '2018-09-28 11:00:54', '2018-09-28 11:04:19'),
(27, 'TRNX795154', 124, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhanmondi Lake Road, Dhaka, Bangladesh', 23.74493560, 90.37702200, 'Mirpur DOHS Shopping Complex, Dhaka, Bangladesh', 23.83791430, 0.00000000, 23.83565280, 90.36606640, 90.37552540, '2018-09-28 11:04:09', NULL, '2018-09-28 11:05:24', '2018-09-28 11:05:34', 1, 1, 0, 0, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@Wb@i@Wc@K', NULL, '2018-09-28 11:04:09', '2018-09-28 11:09:55'),
(28, 'TRNX492925', 124, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhanmondi 32 Bus Stop, Mirpur Road, Dhaka, Bangladesh', 23.75162810, 90.37784950, 'Mirpur DOHS, Dhaka, Bangladesh', 23.83646800, 0.00000000, 23.83567970, 90.36605520, 90.36953920, '2018-09-28 11:11:27', NULL, '2018-09-28 11:14:07', '2018-09-28 11:14:54', 0, 1, 0, 0, '__~oCu|rfPgD~Ai@\\kBt@sAn@q@Ry@Xe@V]RMLcJvEeBz@_DxAsAt@Qe@K]Ku@ImA[aOMqIQgMO{AQsFGUOUOOwFNkL`@kOb@WcAA[?g@~A}QAOLiBNeB@{@CcAIQIIiL[}EQkBOeEc@mDc@eCWkCYuASuB[aAGeACsBJuEZg@?OCEGa@}FSuCYwC]wAcJsSoAiDi@iAa@i@aAy@]S_Ba@gAMcQ}AyDYmQcBeLeAyJ_AcMeA{H{@_CIkCUuBWkc@gEsCU{BW}SoBuT_CeCUyAHm@?oBQaNsAcAO}@UuAi@U?WDSPUj@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGCEACACW?iIJoFDqDDwCLy@D}BBOACC_A?gA@_@He@Ts@t@k@`Aa@jAMnADrBH|BLpFXrR~DE', NULL, '2018-09-28 11:11:27', '2018-09-28 11:32:03'),
(29, 'TRNX309966', 127, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhanmondi 32 Bus Stop, Mirpur Road, Dhaka, Bangladesh', 23.75162810, 90.37784950, 'Mirpur DOHS, Dhaka, Bangladesh', 23.83646800, 0.00000000, 0.00000000, 0.00000000, 90.36953920, '2018-09-28 11:32:21', NULL, '2018-09-28 11:34:13', '2018-09-28 11:34:27', 0, 1, 0, 0, '__~oCu|rfPgD~Ai@\\kBt@sAn@q@Ry@Xe@V]RMLcJvEeBz@_DxAsAt@Qe@K]Ku@ImA[aOMqIQgMO{AQsFGUOUOOwFNkL`@kOb@WcAA[?g@~A}QAOLiBNeB@{@CcAIQIIiL[}EQkBOeEc@mDc@eCWkCYuASuB[aAGeACsBJuEZg@?OCEGa@}FSuCYwC]wAcJsSoAiDi@iAa@i@aAy@]S_Ba@gAMcQ}AyDYmQcBeLeAyJ_AcMeA{H{@_CIkCUuBWkc@gEsCU{BW}SoBuT_CeCUyAHm@?oBQaNsAcAO}@UuAi@U?WDSPUj@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGCEACACW?iIJoFDqDDwCLy@D}BBOACC_A?gA@_@He@Ts@t@k@`Aa@jAMnADrBH|BLpFXrR~DE', NULL, '2018-09-28 11:32:21', '2018-09-28 11:35:06'),
(30, 'TRNX427741', 111, 0, 5, 1, 'CANCELLED', 'USER', 'mnvn', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-02 21:31:43', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-02 21:21:57', '2018-10-02 21:32:18'),
(31, 'TRNX969697', 111, 0, 0, 1, 'CANCELLED', 'USER', 'te', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-02 21:38:34', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCR~Iz@pHt@~LjArBVrBN|CXPuCd@kG^mF', NULL, '2018-10-02 21:38:34', '2018-10-02 21:39:20'),
(32, 'TRNX655090', 111, 0, 0, 1, 'CANCELLED', 'USER', 'efdsfsd', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-02 21:39:55', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-02 21:39:55', '2018-10-02 21:40:56'),
(33, 'TRNX670266', 111, 0, 3, 1, 'CANCELLED', 'USER', 'gjgjkk', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-04 21:23:17', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-02 21:53:19', '2018-10-04 21:23:44'),
(34, 'TRNX745693', 118, 0, 118, 1, 'CANCELLED', 'USER', 'vgg', 'CASH', 0, 'YES', 9.00000000, NULL, 'Main Road, Dhaka, Bangladesh', 23.83564810, 90.36608610, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-05 12:07:14', NULL, NULL, NULL, 0, 0, 0, 0, 'emnpC_spfPGsFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCRvLjAbGn@hOxArBN|CXPuCd@kG^mF', NULL, '2018-10-05 12:06:11', '2018-10-05 12:07:30'),
(35, 'TRNX663241', 117, 0, 0, 1, 'CANCELLED', 'USER', 'nnj', 'CASH', 0, 'YES', 9.00000000, NULL, 'House 5th floor, 179 Rd # 02, ঢাকা, Bangladesh', 23.83538980, 90.36615010, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-05 12:15:14', NULL, NULL, NULL, 0, 0, 0, 0, 'ejnpCmspfPIgFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCR~Iz@pHt@~LjArBVrBN|CXPuCd@kG^mF', NULL, '2018-10-05 12:15:14', '2018-10-05 12:15:43'),
(36, 'TRNX890077', 117, 0, 115, 1, 'CANCELLED', 'USER', 'bnn', 'CASH', 0, 'YES', 9.00000000, NULL, 'House No. 326(GF),Road No. 5, ঢাকা 1216, Bangladesh', 23.83536470, 90.36603990, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-05 12:20:34', NULL, NULL, NULL, 0, 0, 0, 0, 'cjnpCwrpfPK}Fk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCR~Iz@pHt@~LjArBVrBN|CXPuCd@kG^mF', NULL, '2018-10-05 12:18:29', '2018-10-05 12:21:18'),
(37, 'TRNX861191', 117, 0, 120, 1, 'CANCELLED', 'USER', 'hhh', 'CASH', 0, 'YES', 7.00000000, NULL, 'Shagufta New Rd, Dhaka 1216, Bangladesh', 23.83146110, 90.37661160, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-05 12:25:32', NULL, NULL, NULL, 0, 0, 0, 0, 'sqmpC{trfPtBEn@C|@M@EBAFCDAJ?FBz@?nEYxBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDDYB]VuAb@mAp@sBD_@AQGYGKMKSKWC_@JUTKXAZJd@h@pA^b@x@n@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@xGp@hLhArHr@fE^d@oHp@_J', NULL, '2018-10-05 12:24:31', '2018-10-05 12:26:12'),
(38, 'TRNX904685', 117, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 23.82048830, 90.39204530, 90.40427190, '2018-10-05 12:27:07', NULL, '2018-10-05 12:30:32', '2018-10-05 12:32:47', 1, 1, 0, 0, 'w`mpCwvrfPtBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDDYB]VuAb@mAp@sBD_@AQGYGKMKSKWC_@JUTKXAZJd@h@pA^b@x@n@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@xGp@hLhArHr@fE^d@oHp@_J', NULL, '2018-10-05 12:27:07', '2018-10-05 12:32:59'),
(39, 'TRNX983757', 118, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Mostafa Center (Ground Floor & 1st Floor), House No. 59 Road No. 27, Block - K, Dhaka 1213, Bangladesh', 23.79456690, 90.40869760, '523 Rd Number 21, Dhaka, Bangladesh', 23.83646800, 0.00000000, 23.79455910, 90.40869910, 90.36953920, '2018-10-06 11:06:51', NULL, '2018-10-06 11:08:49', '2018-10-06 11:08:59', 1, 1, 0, 0, 'ujfpC}{xfPoAZuA`@}Aj@cF|BuAx@mA~@k@f@S\\cBvEc@~B_@rDg@bKA\\}QiBsCUaQcBgP_BkNyAyAHm@?uKeA{D_@cAO}@UaA_@SIU?WDSPUj@KpA[pM?vECpAa@fCe@|B]`AILYZm@`@mDjCoAdAuCbCyBnB}H~GiClCQJWLAD?BRv@Tt@rAnCp@nAb@r@b@j@rBxBx@`APXPn@`@nCHtA?zAGnAcAjJOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHmCR{BRADAFCFMHQ?MICEACW?iIJaLJqERkCBCACEeCBq@PSLYXo@x@i@jAMb@In@C^@v@LxDLpFH`FNpKfBAvAC', NULL, '2018-10-06 11:06:51', '2018-10-06 11:10:05'),
(40, 'TRNX671403', 117, 0, 0, 1, 'CANCELLED', 'USER', 'no', 'CASH', 0, 'YES', 7.00000000, NULL, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, '', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-06 21:25:43', NULL, NULL, NULL, 0, 0, 0, 0, 'w`mpCwvrfPtBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDDYB]VuAb@mAp@sBD_@AQGYGKMKSKWC_@JUTKXAZJd@h@pA^b@x@n@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@xGp@hLhArHr@fE^d@oHp@_J', NULL, '2018-10-06 21:25:43', '2018-10-06 21:26:36'),
(41, 'BRK874722', 117, 0, 123, 1, 'CANCELLED', 'USER', 'Test reason', 'CASH', 0, 'YES', 4.00000000, NULL, 'Dhaka,(null),(null)', 23.79400600, 90.37585600, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-07 21:17:36', NULL, NULL, NULL, 0, 0, 0, 0, '}ffpCiprfPEUG]Sc@_AoBg@iAg@k@Oo@QuCAm@ZSf@[DCFi@Fm@D]@iC?qFD_AHi@NqALwBI_B?UCUEUSi@a@_AIm@?a@Ns@`@iBXw@P[Pc@Js@v@iHsKx@E@AWjHi@fDMrDPjCHj@?jAG`AKJGLW@MCw@YaG?o@rA}HHm@EuCMmB_@mDGkABuCBgABk@RoAP_ADk@A_GAqI?aAEaAkCUq@GeGg@}C]mBS{@KTiDd@kG^mF', NULL, '2018-10-07 21:06:55', '2018-10-07 21:18:28'),
(42, 'BRK998061', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, '1218/2, East Shewrapara, Mirpur, Dhaka 1216, Bangladesh', 23.79491720, 90.37828830, 'Kemal Ataturk Ave, Dhaka 1213, Bangladesh', 23.79358700, 0.00000000, 0.00000000, 0.00000000, 90.40626780, '2018-10-07 21:51:49', NULL, NULL, NULL, 0, 0, 0, 0, 'mmfpCg_sfPEsAhAs@R_BBu@?mDAaDBq@XoBP}CIkBGi@Ka@c@_AMg@Em@B]XeALs@Nk@h@eALc@n@cFPoBcAFcDXqDXAW`CQzGc@t@AdABzDTzB@rAKl@KFEFGDSIgCO_DCy@?OlAkHJk@BSCuBGwA]sDQ{BHwFHq@VyAFe@BeAAeHAmGEwB}CYeHk@_Fi@{AQKABSd@oHv@kKb@{GRqCL@IfA', NULL, '2018-10-07 21:51:49', '2018-10-07 21:52:18'),
(43, 'BRK846296', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '38', 'Road-05, Dhaka 1230, Bangladesh', 23.85987500, 90.40353700, 'Kemal Ataturk Ave, Dhaka 1213, Bangladesh', 23.79358700, 0.00000000, 23.85980310, 90.40343030, 90.40626780, '2018-10-08 16:03:28', NULL, '2018-10-08 16:04:47', '2018-10-08 19:43:45', 1, 1, 0, 0, 'mcspCc}wfPB|IH~CHPzAkAjA{@tB{AfG}EbMuJ`As@nBaBvEqDlLoJBMJQJEvBsAnGsE|MoKbBoAnJuHjPgMdBkAfCyAlDeB~Ao@xBo@dCi@zBg@|B_@bI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@Dv@@z@S~IUbKFpADl@Nl@Z|@Zr@f@v@p@r@p@n@t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCRvLjAxBTDy@\\eHRkCZaCViA^eAnAcD^a@dCkBrDgBhAg@xAk@x@YfBe@`B_@bAExAFq@~JIfA', NULL, '2018-10-08 16:03:28', '2018-10-08 19:44:10'),
(44, 'BRK737240', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka, বাংলাদেশ', 23.81033200, 90.41251810, 'Banani, ঢাকা, বাংলাদেশ', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-08 20:06:13', NULL, '2018-10-08 20:06:36', '2018-10-08 20:06:41', 1, 1, 0, 1, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@jHx@fIx@LNBHbCPdCV|D^lLhAfCRvLjAbGn@hOxArBN|CXPuCd@kG^mF', NULL, '2018-10-08 20:06:13', '2018-10-08 20:06:56'),
(45, 'BRK682284', 117, 0, 113, 1, 'CANCELLED', 'USER', 'bbb', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83553120, 90.36611950, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-08 20:19:18', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCispfPIkFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-08 20:17:11', '2018-10-08 20:19:31'),
(46, 'BRK782393', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', '333 Rd # 02, Dhaka, Bangladesh', 23.83552400, 90.36614460, 'Road-05, Dhaka 1230, Bangladesh', 23.85987500, 0.00000000, 0.00000000, 0.00000000, 90.40353700, '2018-10-08 20:19:50', NULL, '2018-10-08 20:20:10', '2018-10-08 20:21:08', 1, 1, 0, 1, 'ejnpCmspfPIgFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QKIKCMBYMU[RoAbAoCzBsDvCoBlBeA~@uC|BgEhD}PzM_An@{AdAcCpBI_DC}I', NULL, '2018-10-08 20:19:50', '2018-10-08 20:21:16'),
(47, 'BRK494720', 117, 0, 113, 1, 'CANCELLED', 'USER', 'hhh', 'CASH', 0, 'YES', 3.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83553110, 90.36611910, 'Uttara,7 Lakdrive Road, Dhaka 1230, Bangladesh', 23.82237220, 0.00000000, 0.00000000, 0.00000000, 90.37812790, '2018-10-08 20:38:37', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCispfPIkFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@jFe@fAG\\Cn@?bBGIiCqA@uAD', NULL, '2018-10-08 20:36:20', '2018-10-08 20:39:14'),
(48, 'BRK159063', 133, 0, 113, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'YES', 5.00000000, NULL, 'House -2, 13/B Ave No. 1, ঢাকা 1216, Bangladesh', 23.80978730, 90.37714610, '24 Kemal Ataturk Avenue, Dhaka 1212, Bangladesh', 23.79399270, 0.00000000, 0.00000000, 0.00000000, 90.40427190, '2018-10-13 16:15:21', NULL, NULL, NULL, 0, 0, 0, 1, 'wjipCoxrfPzBsF~@{BZN`Ab@~@d@~CdB~BlAxBlA|FrCvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BDmDBiAHq@^_CBeAAqA?_MGyCcMeA{H{@KABSd@oHp@_J', NULL, '2018-10-13 16:14:20', '2018-10-29 17:48:14'),
(49, 'BRK357527', 117, 0, 0, 1, 'CANCELLED', 'USER', 'sdfsdfsdfsd', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83559830, 90.36610000, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-14 04:14:37', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-14 04:14:37', '2018-10-14 04:14:46'),
(50, 'BRK635658', 134, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'Æsufell 6, Reykjavík, Iceland', 64.10239560, -21.82738010, 'Asparfell 10, Reykjavík, Iceland', 64.10198830, 0.00000000, 64.10239570, -21.82738050, -21.82567120, '2018-10-14 18:09:41', NULL, '2018-10-14 18:12:21', '2018-10-14 18:14:40', 1, 1, 0, 1, 'g_gfKfdfdCAaAq@A?vHATUj@AEEICIIUIUQaA?i@Dw@`@iEPq@Rq@tBkEPn@@b@', NULL, '2018-10-14 18:09:41', '2018-10-14 18:15:48'),
(51, 'BRK923017', 134, 0, 121, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 11.00000000, NULL, 'Æsufell 6, Reykjavík, Iceland', 64.10239450, -21.82738120, 'Þingholtsstræti 2, Þingholtsstræti, Reykjavík, Iceland', 64.14664430, 0.00000000, 0.00000000, 0.00000000, -21.93469350, '2018-10-16 12:42:31', NULL, NULL, NULL, 0, 0, 0, 1, 'g_gfKfdfdCAaAq@A?vHATUj@BDBHDJHTHRRh@Td@T`@JPd@^b@X`@F^HVXj@xCyDdGsCjEiEzGwA~B_BdDmAjDeAhE_AhFu@jGYfEs@pTYnDSzDIl@Qh@OLMFM?[MgA{AgA_BiCeDoCoCq@M}@s@aBaA{Ai@uGkBmCo@sAWeBSuAAuA@cAFa@F_@H_Bd@yAl@cB`Aw@d@uAdAuGdFiAz@_Ah@mB~@yAh@_D~@kQfEkB\\aFdAkInAyBPgMt@uR|@uA@sU`AmPf@aAHeBb@aBt@k@\\e@f@y@z@}@nAk@|@k@nAe@pAaKvZ{GvRaB~EkA|DkA`FsAvGsDzVqFh`@[vCsAdRw@pLQfEWfJAlAH~D`@|Dp@dDl@bBdA`C`JlQjB`E|@dCh@vBb@vCVlB\\jENvFRpPz@bt@RhFh@pGl@xEv@bFl@jFPpCDfB@pCErFUfEQhBUhBs@lEsAdGsK|d@]|AJV`@t@l@|@k@nCsBnI@d@r@dA~AfBnAnA|FtF~@z@hC|B]hCmBuA', NULL, '2018-10-16 12:41:30', '2018-10-16 12:43:33'),
(52, 'BRK797990', 136, 0, 0, 1, 'CANCELLED', 'USER', 'ntng', 'CASH', 0, 'YES', 21.00000000, NULL, 'Vuda Colony Rd, Karmika Nagar, Pendurthi, Visakhapatnam, Andhra Pradesh 531173, India', 17.80591580, 83.21312060, '54-11-7/1 OPP AKSARA SCHOOL, Isukathota, Visakhapatnam, Andhra Pradesh 530022, India', 17.74126230, 0.00000000, 0.00000000, 0.00000000, 83.32482750, '2018-10-21 05:17:52', NULL, NULL, NULL, 0, 0, 0, 1, 'kwtkBkl{zNLJTpARhA@h@@bB\\pBXrAf@vCtF_AbJaBnHmAhCi@`AQzASxCi@lKmBnJcBrLqBhGaA`F}@|ASrGgAlF{@zI}AdDo@~HoAfNyBdImAzHiAn@?jESRABGLa@d@sAx@gC\\wAJo@XsCVkFD_Az@iGP}ALkBDgCA}C?oBNcGLkEJuCH}@VwBpAiHd@aCPs@f@qAPc@x@qAjAeBn@cBb@{BRuANy@pAkEPi@^}@FWAISqAK{@Gm@M}@i@iB_@kD_@wCm@uG[}D[{EKiCEQ[S[GGEY_@e@}Ay@cCw@sBg@gAMWW{@Y_Am@cBq@kB_@q@[c@mAgAuAeAkAs@eCaB{BsAyAaA_Ao@kCgBcEoCYOa@M{@AGcBe@_Hw@mHGiAQ]SaCWyAU}@s@yBo@wA_BuCs@gBk@eCYuBQyCGkBJsBXwARq@h@iAZi@r@w@l@c@tBkAz@e@z@k@|@y@`@i@dAwAxA_D^gAVcAd@{BLk@V_@lEkGjA_Bp@{@tByCp@aA~@iAhAwAtCoEpFuJtCqFrAqCrAuChAeCh@gA|BqDvLwP|@qAx@sA~A{C|BsFdAmCdAwBxPy_@xIoSb@wARwADwAAy@Gy@u@yDEi@u@mK[qG]wFAiBDyAj@qEN{BHoCJkDR_GZmHVyBv@mE`A}Fl@{C\\mCl@cGdA_IXsBNaCn@iGdDiSn@yDp@uCx@yCjAyEbAiDx@aD^}@~@sBfCkE`AmAT_@Rw@E[EMs@q@_Ca@aCg@sAUaC[wB[aLoAmASFSp@LpBXzHv@xDb@`Dh@~EdAzB^vIx@zOdAvBJhCHpBFx@FfAXr@Zj@d@^`@`@h@^|@TtALdBNrAJb@Tl@^Zr@VfBT~Fj@xC\\|Db@CPIAEADLHLHJHBl@HA~E?jIfDDpAA', NULL, '2018-10-21 05:17:52', '2018-10-21 05:18:16'),
(53, 'BRK433621', 138, 0, 120, 1, 'CANCELLED', 'USER', ':)', 'CASH', 0, 'YES', 15.00000000, NULL, 'Rob Super Market, Dhaka 1212, Bangladesh', 23.79694270, 90.41369620, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-27 11:28:12', NULL, NULL, NULL, 0, 0, 0, 1, '_zfpCo~yfPnDOLpArBe@~@Yj@i@RULXZl@VpA\\bBfCvMf@xDF~A?lCyAGcADaB^gBd@y@XyAj@iAf@sDfBeCjB_@`@oAbD_@dAWhA[`CSjCu@pJmTiB{AQcTqBoQkBuFk@gPuAoHs@cAYmAi@w@i@iAaAq@cAc@aA_@eAQiAGy@?mA`@yQDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{IaAeB_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAEyCBySjBiYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCoDrC{EtDoKnIiF~DaK~HeAx@uFxEALCLIJKFM@OCGG}ApAaQzMkJnHmIrG{GfFcFrD{Ax@u@Zk@JcALwCXsBDyGOqDG{Pe@j@pMLfDZjJNtC@rBQF_@DwJ??d@D~JDvGPjb@?xBuOReMFAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAeDiA{Ak@d@kAB@J@BADE@G', NULL, '2018-10-27 11:26:08', '2018-10-27 11:28:46'),
(54, 'BRK922405', 138, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Niloy Mansion, Plot 11 Rd No 113/A, Dhaka 1212, Bangladesh', 23.78968030, 90.41961160, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-27 11:29:17', NULL, '2018-10-27 11:30:05', '2018-10-27 11:30:11', 1, 1, 0, 1, 'mlepC}`{fPu@BD~@DjAmAJmDNPpEd@lIFXaEfAqF~AqEnA{Af@@PA^IVCFVpA\\bBfCvMTzAP|AF~A?lCw@Ea@AcADaB^gBd@aBj@mD|AaCjAkAx@y@p@_@`@oAbD_@dAWhA[`CM|Ao@lIKpAmTiBqLkAcQeBoQiBgPuAoHs@cAYmAi@w@i@i@c@_@]q@cAc@aA_@eAQiAGy@?mAPcITmJCaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDSAKI}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdIBlFHzUHrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAH@DAFE@G', NULL, '2018-10-27 11:29:17', '2018-10-27 11:31:42'),
(55, 'BRK690831', 117, 0, 0, 1, 'CANCELLED', 'USER', 'bjjkb.kjb', 'CASH', 0, 'YES', 11.00000000, NULL, 'Shagufta New Rd, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, '22/1 Adarsh Nagar Rd, Dhaka 1212, Bangladesh', 23.78054620, 0.00000000, 0.00000000, 0.00000000, 90.42665840, '2018-10-27 21:24:48', NULL, NULL, NULL, 0, 0, 0, 1, 'w`mpCwvrfPtBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAaAuBQq@W{BCu@@gADgABYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuG_EkHkGsK]OGK{AiCyB}CsAkAMWIm@@a@J_ANiAPe@NM^SXEZ@t@PnAf@t@`@LIn@t@LDN@LAbH{BxB]rCQdC@zA?tBCrEI`C?pFGhBGhIOzFKbBGbCQhLcAhG{@`JsA`PkBxFo@fBM|C_@jD_@`Gk@tFq@dEe@bEa@vH}@bLgAnNoAv@GhCQrCKzDC\\?BaAbBJlD\\j@@l@EpAUd@Id@HN@GWOm@?IBCFE?M?A', NULL, '2018-10-27 21:24:48', '2018-10-27 21:25:07'),
(56, 'BRK905630', 117, 0, 0, 1, 'CANCELLED', 'USER', 'bnn', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83546260, 90.36613100, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-10-28 09:31:05', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCispfPIkFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-10-28 09:31:05', '2018-10-28 09:31:12'),
(57, 'BRK164316', 145, 0, 0, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'NO', 23.94600000, NULL, 'Birmingham Airport (BHX), Birmingham, UK', 52.45238210, -1.74350710, 'Birmingham, UK', 52.48624300, 0.00000000, 0.00000000, 0.00000000, -1.89040100, '2018-11-03 20:36:02', '2018-11-03 20:35:00', NULL, NULL, 0, 0, 0, 0, 'cyb_InbtIKpACp@CnAJNvBz@LrBRTLVEv@Ah@?FNP\\JZLWrCO~AUZ{@nAc@l@fAnEXz@NRz@Ur@uEh@eE`BaQtAcNZuB^aBd@}Aj@yAx@wAv@gAlAmAxAiAfAu@jAcA|@aA|@sAl@qAn@iBf@sB`@eCPoBJgC?sBEwBS_C_@aCg@uBg@}Ak@qAs@iAaDgEq@_Aa@u@o@{A[gAYwAUkBK_CCwCAqJg@o]_@{KKwEE{FG_GEcBIe@GsACmAQsCIgAImAUeBYkBm@u@aAgBGS[My@yAq@u@_@UyBq@yCm@uAQyAQo@e@iCCeA@aENgBPiC^iDr@}FrA_Cb@gDj@gD`@iDT_DHcB?qCEoBGeIi@}CSiESeCGeB?oCDoAFiDRiCX_BTiGdAkCh@oDl@kCXsET_A^gCFqBJoAR}A`@yAr@wAbAqArAwAjB}BrDsCdFeCpF_@r@sB~EwB`FcBfDeAlBa@ZKPkB`DoEvGiGzH}Xh^{BjC{DdEwGlGiA`AmCxB}CxBoCfBsC`BcT`MsHjE}[fRqHlEaD|BmD~CeCnC_AhAqAbBkC`EmBjDyBtEgCnG_BbFeAxDeAbEs@fDsAnHe@hDe@`Ei@lG_@rGWzGMhI?pC@hDJvH\\fJh@jIt@jHl@`Fh@bDzAfIrB~IzBxJvD`Qr@rDv@nFl@tEr@`Hd@zFl@fMJpFBvC@dFItNKxKE`I@tIHxJX|Ll@zOb@vHj@tHj@nGxAlOhB|QjB`Sb@tHL`GLpHRjI\\vGjAnLdArJ|@~JZtH^jT\\bUD|FCfEMjEQbD[hDYfCyCvSs@lEeA|F}E`TuBfJ_@vBIR]lAcB`HGz@Op@kAtEk@dDSfBMhCEtA@hDJxB\\xC~@dG`@xCp@tEHd@Dl@\\xAhChKdBlHzC~Lv@zBbAbC\\p@fA`B~@fAzFrHfAvA`EfFjCdDn@r@dA~@dCfB~Av@vAh@jEpAvHtBfARb@XbGdBfIbCtNdEnCx@~@`@dBfAbBdARBz@b@fE`C~Bx@jDjAz@ZLB`@LdAB`@EDA?]Em@c@wAeAkCQ[MEIAADg@`A', NULL, '2018-11-03 20:36:02', '2018-11-03 21:09:27'),
(58, 'BRK944117', 146, 0, 0, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'NO', 19.19300000, NULL, 'Charter Avenue, Coventry, UK', 52.39251460, -1.57066770, 'Birmingham Airport (BHX), Birmingham, UK', 52.45238210, 0.00000000, 0.00000000, 0.00000000, -1.74350710, '2018-11-03 21:10:30', '2018-11-03 21:10:00', NULL, NULL, 0, 0, 0, 0, 'e|w~HtwqHHuCDi@EGIW?WHYNIvAsQf@iGlCyZfA{NPcCFkBDkFDeAKGISCSOIAA_CiHq@kBo@eAyAaBw@Gg@Be@LYNw@~@{@lAq@pAs@hAqBpC}BlCk@n@{AtAqCvBsDnBuAt@cCrAkB|@}CnAmA^}A^kAR}BT_CJ}@HoCHaCFeBJkFNgD@W?ADABCFIDMEIIw@GmAAcAN}AZ}Ah@}@`@uAz@]ToBdBoAxA_ArAy@vAw@~AoA~C_DlIyAzDmAdCy@rAoAxAmAfA_An@y@b@iAb@}TfFiK`CcEbA{Af@iClAaCdB}AtA}BlCiA|A{BhDiAfBcApBaAnCw@hDm@hDS`Bm@xFqAzMu@zFcDpRaBdJo@fDy@vDuA|FcBlHoAxHuAnIaBvI}@hE{BpJkI`^wEdSwBjJ}ArHwBrLoAtIm@rE_AhIi@`Gc@pF{@tMo@pK}Bta@kCrd@sBj^m@fL[|HQlEOpCc@|Mu@dUW`Hu@vUy@d^WfIi@bJ_@rEW|BqAjL_A~IoA|NeAxMOnCU`HC`CAzEJdGZ|G^xGThFLlG@jB?zEMvHa@hKOnFE`G`@hW^tQZ`Lh@dWl@|UTpLPtGPzJFdDv@jf@PtKDtBPvHV`DZlBXhA`@lAf@dAr@fA|ApBbAvAp@hAf@lAh@bBd@lBXhBPtBJrBBfBC`CM|BW|B]pBg@fBi@~Ai@jAq@fAu@|@aA|@w@j@kCfB}@x@y@bAo@fAc@|@e@pA_@rA_@fBWjBaAzJgAzLi@hFY~Bm@bEk@~C_A[UOMMOg@]qAu@qC`@o@bBcCf@sFu@YQMAc@FiAYe@GGEs@G_AKEqB{@CG?o@H{BFi@', NULL, '2018-11-03 21:10:30', '2018-11-03 22:08:02');
INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `provider_id`, `current_provider_id`, `service_type_id`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `is_track`, `distance`, `travel_time`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `track_distance`, `track_latitude`, `track_longitude`, `d_longitude`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(59, 'BRK316422', 117, 0, 0, 1, 'CANCELLED', 'USER', 'hdjdj', 'CASH', 0, 'YES', 2.00000000, NULL, 'Pallabi Bus Stand, Begum Rokeya Avenue, Dhaka 1216, Bangladesh', 23.82049150, 90.36498240, '', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2018-11-05 15:27:22', NULL, NULL, NULL, 0, 0, 0, 1, '_mkpCykpfPd@Is@uHm@}GoAyOMiBo@oGaA}JYgEWuCc@wGo@BmAFqHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGIQ@QJOJCL?FBlCG~BQ', NULL, '2018-11-05 15:27:22', '2018-11-05 15:27:33'),
(60, 'BRK557875', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 5.00000000, NULL, 'House -2, 13/B Ave No. 1, ঢাকা 1216, Bangladesh', 23.80979030, 90.37719380, 'Kemal Ataturk Ave, Dhaka 1213, Bangladesh', 23.79358700, 0.00000000, 0.00000000, 0.00000000, 90.40626780, '2018-11-06 04:58:08', NULL, NULL, NULL, 0, 0, 0, 1, 'sjipCwxrfPvBkF~@{BZN`Ab@~@d@~CdB~BlAxBlA|FrCvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BAoDHsBXeBJuAAuHGeID_AuCYc@CeGg@}C]mBS{@KTiDd@kG|AgUL@IfA', NULL, '2018-11-06 04:58:08', '2018-11-06 04:58:44'),
(61, 'BRK290408', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 5.00000000, NULL, 'House -2, 13/B Ave No. 1, ঢাকা 1216, Bangladesh', 23.80979130, 90.37719610, 'Kemal Ataturk Ave, Dhaka 1213, Bangladesh', 23.79358700, 0.00000000, 0.00000000, 0.00000000, 90.40626780, '2018-11-06 05:03:29', NULL, NULL, NULL, 0, 0, 0, 1, 'sjipCwxrfPvBkF~@{BZN`Ab@~@d@~CdB~BlAxBlA|FrCvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BAoDHsBXeBJuAAuHGeID_AuCYc@CeGg@}C]mBS{@KTiDd@kG|AgUL@IfA', NULL, '2018-11-06 05:03:29', '2018-11-06 05:04:16'),
(62, 'BRK381778', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, 'Bir Muktijhoddha Abdus Salam Sarak, Dhaka, Bangladesh', 23.73297240, 90.41723100, '', 23.79358700, 0.00000000, 0.00000000, 0.00000000, 90.40626780, '2018-11-06 07:51:23', NULL, NULL, NULL, 0, 0, 0, 1, 'wizoCmszfPeAe@KKQW]_@e@Qo@Sk@[kA~AaA|A]t@}@`Bq@xAGPY~@WfAe@vDa@rCw@|Dw@`EU|A[~CEv@g@dDQzAE~@KvD@fCB`HCj@@B@B?DAJEHIDI@KEEGCK}AUeCK{ASeB]WEgCBiDC}CWyAFoAHs@HwAb@e@Xm@p@i@t@{@`A_@^i@Zk@L}DT_CBmCH_ADw@L_@H}M~GmBbAoFjC}C`BwA|@cCfA_Bp@o@RkAXi@R{CnAo@R_@F[?qAGkBO{@Ei@ACBCBWCyEe@uOsAcE_@q@Km@IuKcAqOqAgGq@mCUmBB_@B{BZi@NoAr@uCvBc@TmEnCiCbAsAd@eFv@aCT_ANg@?o@A{BQi@?_@B[EwGq@wHq@uFk@WMoZqCmNuAmE_@eGg@}C]mBS{@KTiDd@kG`AaOZeEL@IfA', NULL, '2018-11-06 07:51:23', '2018-11-06 07:51:45'),
(63, 'BRK517215', 131, 0, 120, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Mirpur Rd, Dhaka 1216, Bangladesh', 23.80410280, 90.37630670, '15 Rd No 128, Dhaka 1212, Bangladesh', 23.78206240, 0.00000000, 0.00000000, 0.00000000, 90.41605270, '2018-11-06 07:54:32', NULL, NULL, NULL, 0, 0, 0, 1, 'cghpC_srfPU?EBGFAb@CVKJMBSCsA_@oBnCcAfBWn@YK^w@`AeBlDaFvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BAoDHsBXeBJuAAuHGeID_AuCYQA@YxCXnXhCdLlAPGLAfBLtOrAF@Bs@LyERkLR_JHmBBmAJ}Aj@{G^{F@o@@mBSsO?{ACkAEU@gADuDBmDwB@qA?_CACcCAcC', NULL, '2018-11-06 07:53:30', '2018-11-06 07:54:39'),
(64, 'BRK829554', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 12.00000000, NULL, 'Plot # 29 & 30, 01 Ave Society Rd, Dhaka 1216, Bangladesh', 23.80990060, 90.37747040, 'Bir Muktijhoddha Abdus Salam Sarak, Dhaka, Bangladesh', 23.73297240, 0.00000000, 0.00000000, 0.00000000, 90.41723100, '2018-11-06 07:56:22', NULL, NULL, NULL, 0, 0, 0, 1, 'cjipCwyrfPfBkE~@{BZN`Ab@~@d@~CdB~BlAxBlA|FrCvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BAoDHsBXeBJuAAuHGeID_AuCYQA@YxCXnXhCdLlAPGLAfBLfPtAnHp@hCZvCThC?pAOlDc@|@Mf@[|@YrAe@x@[v@e@dAm@jE{CfBkAn@YbC_@r@MlAEtABz@J~Gt@bIn@tCXjANdCVrDV|@JhQzAjGp@zE`@hHj@v@?PCv@YxB}@dBs@RAn@OZKbBy@dD_BrAw@rGgDvLgGnCsAj@_@|@]^InAI~BKr@MrBDxBOnBSj@c@hAkAhA{Av@o@bA]jAUbAM`AEr@@fFV`BCvDHlBb@hAJjCNjANBADA?eLHsDRsCp@sGVwCf@eDl@sCz@uDh@qELeANiAn@{Bz@eB|@_BJURN|A`BlAhAtA`A|@b@x@^xAd@Dm@@]Aq@Fi@N]H{@@O]CGyAu@Y', NULL, '2018-11-06 07:56:22', '2018-11-06 07:56:44'),
(65, 'BRK637248', 131, 0, 120, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 12.00000000, NULL, 'House 26, Avenue 1/1, Block B, Section 13 , Haji Ali Hossen Road, Mirpur, Dhaka 1216, Bangladesh', 23.80977690, 90.37765650, 'Bir Muktijhoddha Abdus Salam Sarak, Dhaka, Bangladesh', 23.73297240, 0.00000000, 0.00000000, 0.00000000, 90.41723100, '2018-11-06 08:01:00', NULL, NULL, NULL, 0, 0, 0, 1, 'oiipC_{rfPrAcD~@{BZN`Ab@~@d@~CdB~BlAxBlA|FrCvBoClCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qBpDsL`BwFd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTrA@|@A|@Il@KNMDS?YYmGCy@?OlAkHJk@BSCuBGwA]sDQ{BAoDHsBXeBJuAAuHGeID_AuCYQA@YxCXnXhCdLlAPGLAfBLfPtAnHp@hCZvCThC?pAOlDc@|@Mf@[|@YrAe@x@[v@e@dAm@jE{CfBkAn@YbC_@r@MlAEtABz@J~Gt@bIn@tCXjANdCVrDV|@JhQzAjGp@zE`@hHj@v@?PCv@YxB}@dBs@RAn@OZKbBy@dD_BrAw@rGgDvLgGnCsAj@_@|@]^InAI~BKr@MrBDxBOnBSj@c@hAkAhA{Av@o@bA]jAUbAM`AEr@@fFV`BCvDHlBb@hAJjCNjANBADA?eLHsDRsCp@sGVwCf@eDl@sCz@uDh@qELeANiAn@{Bz@eB|@_BJURN|A`BlAhAtA`A|@b@x@^xAd@Dm@@]Aq@Fi@N]H{@@O]CGyAu@Y', NULL, '2018-11-06 07:59:58', '2018-11-06 08:01:33'),
(66, 'BRK656556', 131, 0, 113, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 6.00000000, NULL, 'House -2, 13/B Ave No. 1, ঢাকা 1216, Bangladesh', 23.80978970, 90.37720700, 'সংসদ ভবন এভিনিউ, Dhaka, Bangladesh', 23.76249030, 0.00000000, 0.00000000, 0.00000000, 90.38119420, '2018-11-06 08:05:20', NULL, NULL, NULL, 0, 0, 0, 1, 'sjipCyxrfP]z@z@b@fAj@dD~AlGfDlCtAnAj@pCrAbAh@Re@hCgErCiEd@u@DFPl@lAa@PCvA?xBO|AKf@Cv@Eh@Mx@Cz@@n@GlAOv@Cp@Fl@FN?j@M~@ArAKtBaAAsBrAKl@SrBaA|CuBf@[DCbAAr@ArACvCA@x@@h@VjBNdA@^G`AJ@rABdBe@z@Et@B?~@?DEl@Hn@B@|@MHBDBD\\Bf@XtAbLyDtIuC|IsCxFyA|FsAhE{@xAUrB_@bEy@`Do@fGwA|Aa@pJiBfGiA~FkArI_BvDi@dM_AlGe@|DW\\ACVIVDrAlDO~AIVFFLFfBtBKbACB@BBNfE', NULL, '2018-11-06 08:03:16', '2018-11-06 08:05:38'),
(67, 'BRK769470', 131, 134, 134, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'House -2, 13/B Ave No. 1, ঢাকা 1216, Bangladesh', 23.80978970, 90.37720700, 'সংসদ ভবন এভিনিউ, Dhaka, Bangladesh', 23.76249030, 0.00000000, 23.80980010, 90.37718620, 90.38119420, '2018-11-06 09:22:56', NULL, '2018-11-06 09:23:32', '2018-11-06 09:25:59', 1, 1, 0, 1, 'sjipCyxrfP]z@z@b@fAj@dD~AlGfDlCtAnAj@pCrAbAh@Re@hCgErCiEd@u@DFPl@lAa@PCvA?xBO|AKf@Cv@Eh@Mx@Cz@@n@GlAOv@Cp@Fl@FN?j@M~@ArAKtBaAAsBrAKl@SrBaA|CuBf@[DCbAAr@ArACvCA@x@@h@VjBNdA@^G`AJ@rABdBe@z@Et@B?~@?DEl@Hn@B@|@MHBDBD\\Bf@XtAbLyDtIuC|IsCxFyA|FsAhE{@xAUrB_@bEy@`Do@fGwA|Aa@pJiBfGiA~FkArI_BvDi@dM_AlGe@|DW\\ACVIVDrAlDO~AIVFFLFfBtBKbACB@BBNfE', NULL, '2018-11-06 09:22:56', '2018-11-08 07:02:01'),
(68, 'BRK529321', 131, 134, 134, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '4', '351 Road No 7, Dhaka, Bangladesh', 23.83554230, 90.36792100, 'Bir Muktijhoddha Abdus Salam Sarak, Dhaka, Bangladesh', 23.73297240, 0.00000000, 23.83553950, 90.36610920, 90.41723100, '2018-11-08 07:03:01', NULL, '2018-11-08 07:03:49', '2018-11-08 07:07:55', 1, 1, 0, 1, 'sjnpCq~pfPK_H}ADOcHCeBCEGCK}GK@[qBq@_EuAHyB@AMC{AFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEJAL@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWCCEGASFIFEB?ZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCR~Iz@vAHhBNhBVn@LhOxA~Gh@zCTrLjA~NtAhMlAdLlA^I|R`B`Ir@hCZvCThC?pAOlDc@|@Mf@[`Bi@n@Ux@[v@e@dAm@jE{CfBkAn@YvDm@lAEtABhBRbGn@pHl@tCXdBVjBNrDVhCV|NnAzBXjJx@hHj@V?p@CzB{@dBw@t@WRAn@OLEr@[zCyAfAi@r@c@tAs@tHyDrEcCzGeDj@_@|@]^InAI`AE|@Er@MrBDxBOnBSj@c@hAkAhA{Av@o@bA]jAUbAM`AEr@@|AHhCL`BCvDHlBb@hAJjCNlALDA@??_H?eCBgADkBHoAp@cH`@kEf@eDl@sCz@uDh@qE\\oCn@{Bz@eB|@_BJURN|A`BlAhAtA`A|@b@x@^xAd@Dm@@w@?o@L_@FODUBe@@O]CGyAu@Y', NULL, '2018-11-08 07:03:01', '2018-11-08 07:09:30'),
(69, 'BRK814261', 131, 134, 134, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'House-319 Rd:02, Adabar,Baitul Aman Housing Society, ঢাকা 1207, Bangladesh', 23.83539420, 90.36589600, 'Aminbazar Bus Station, Dhaka - Aricha Hwy, Aminbazar, Bangladesh', 23.78612390, 0.00000000, 23.83571480, 90.36610190, 90.32990510, '2018-11-08 07:19:06', NULL, '2018-11-08 07:19:41', '2018-11-08 07:22:11', 1, 1, 0, 1, 'cjnpC{qpfPBdBvAEhDO|ABFDFDDRDd@FvGxFBh@E~MSl@CnE_@nAa@TE|AEdE?dC@fJOpFQlBOhB]pCi@xAUhGkAjSoD`HoAzBc@vCg@hEw@~GmAbF}@jE{@xEaABQJMJEN?JDJLBNAPINCBD\\|@|Hd@zB\\bAb@|@h@jA~AdDrBjEbAfBdDjGxChFvG~LlAtBnEbIX`@VHTXFX?V?D\\n@|DlHr@vAtBvDjDlH|@zBp@xBPPPHZDlDTxDV|Gb@tIn@~CN`FZtMbAtJ`Av@JxDXlDZs@zJQhCI|BCbBB|@r@`QDbC[tDMdAYbBmAhEqBjHcApDmCfL_CnK{@zCiAdCoAtBoAdByFnHwAtBgAtBa@lAc@|A[bBQbBGbB?`ADjBTbFRbFLbEDpFGvIGhCO~Cc@hG}ApMyF|d@yAjMiB|K_DhQqBhL_B`Jc@`Da@hD]fEWnGErCAhC?jBFhFPvJRrIR|DJzAZxCjBjPZnCl@EH?\\LJB`AAPBDDLf@JPP@|BOxAO^CN|A\\xAT~@Xx@Rn@B~@CrDA~AMpA}@fFGXMFWBKLWh@KHOBYDWF}AgAYMI@[RGBMk@SG@WCqAEuAYyC}@aImDa[u@_H[yDI{AM{EWaLMyJB{HRyFXqETiCd@aEnBgL~CuQfAcGnAkHlA}HvAqLpBoPx@sHr@sF^iDz@mGd@yDZcFRyFDgC@kECyEK}E]{HSkFA{@B}AP_C`@}Bt@kCr@aBbAcBvK{N|@wA~@sBd@wA', NULL, '2018-11-08 07:19:06', '2018-11-08 07:23:30'),
(70, 'BRK766400', 131, 134, 134, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83577390, 90.36603680, '22/1 Adarsh Nagar Rd, Dhaka 1212, Bangladesh', 23.78054620, 0.00000000, 23.83565930, 90.36611950, 90.42665840, '2018-11-08 07:23:57', NULL, '2018-11-08 07:25:10', '2018-11-08 07:25:37', 1, 1, 0, 1, 'emnpCurpfPG}FaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHKqAMgASkAa@eAa@{@Ws@UqAMgB?u@JeCX{ADeBNuGDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{I]k@QIICIKu@wAwCgEm@m@c@]OQOe@?y@TuBPm@LSPM`@MXCj@HjA`@tAr@JKRXRRLJNBZA|G{Bp@MfAOrCQfE@zAAfDGlECbHIrFMlJQrCInNiApGy@pHmAlR{BjJaAtC[fBOtFo@zGs@fGs@bEa@vH}@bLgArFe@rHq@hCQrCKzDC\\?BaAbBJhALbBNj@@l@EpAUd@Id@HN@GWOm@?G?CLKAK', NULL, '2018-11-08 07:23:57', '2018-11-08 07:30:50'),
(71, 'BRK918141', 131, 134, 134, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83579310, 90.36606720, '331 (Old), 227 (New),, Outer Circular Rd, Dhaka 1217, Bangladesh', 23.74940720, 0.00000000, 23.83569220, 90.36606530, 90.40659100, '2018-11-08 07:32:23', NULL, '2018-11-08 07:33:31', '2018-11-08 07:33:55', 1, 1, 0, 1, 'emnpC{rpfPGwFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRp@n@t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCR~Iz@vAHhBNhBVn@LhOxA~Gh@zCTrLjA~NtAhMlAdLlA^I|R`B`Ir@hCZvCThC?pAOlDc@|@Mf@[`Bi@n@Ux@[v@e@dAm@jE{CfBkAn@YvDm@lAEtABhBRbGn@pHl@tCXdBVjBNrDVhCV|NnAzBXjJx@hHj@V?p@CzB{@dBw@hA_@XIbCkAlCoAx@a@tIqEjCqAdMoGRKCKe@eCm@{BScB?iCBcA', NULL, '2018-11-08 07:32:23', '2018-11-11 12:46:11'),
(72, 'BRK650287', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'NO', 13.24800000, NULL, 'Dhaka, বাংলাদেশ', 23.81033200, 90.41251810, 'Uttara, ঢাকা, বাংলাদেশ', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-11-13 06:37:11', '2018-11-13 12:35:00', NULL, NULL, 0, 0, 0, 0, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@tBTMxAcBDw@EuBW}@Ig@k@MGMCkEc@cKcAYIq@UgA_@eAk@q@g@k@i@e@m@e@y@c@eAWeAMkAA}@JcGTmKD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2018-11-13 06:37:11', '2018-11-13 09:06:53'),
(73, 'BRK673784', 148, 1, 1, 1, 'STARTED', 'NONE', NULL, 'CASH', 0, 'NO', 13.24800000, NULL, 'Dhaka, Bangladesh', 23.81033200, 90.41251810, 'Uttara, Dhaka, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-11-13 07:34:42', '2018-11-13 13:34:00', NULL, NULL, 0, 0, 0, 0, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@tBTMxAcBDw@EuBW}@Ig@k@MGMCkEc@cKcAYIq@UgA_@eAk@q@g@k@i@e@m@e@y@c@eAWeAMkAA}@JcGTmKD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2018-11-13 07:34:42', '2018-11-13 07:36:04'),
(74, 'BRK609853', 118, 0, 115, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83555830, 90.36615980, 'House 47 Rd No 27, banani 1213, Bangladesh', 23.79456690, 0.00000000, 0.00000000, 0.00000000, 90.40869760, '2018-11-13 07:46:18', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCqspfPIcFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@jAL|DVXuC\\aF^sDb@_CbBwER]j@g@lA_AtAy@pCqApAk@|Ak@tAa@nA[', NULL, '2018-11-13 07:45:16', '2018-11-13 07:46:28'),
(75, 'BRK927230', 118, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83567120, 90.36596800, 'House 47 Rd No 27, banani 1213, Bangladesh', 23.79456690, 0.00000000, 23.83549980, 90.36612540, 90.40869760, '2018-11-13 07:46:40', NULL, '2018-11-13 07:47:31', '2018-11-13 07:47:52', 1, 1, 0, 1, 'cmnpCgrpfPIkGaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvCVjSbBrEh@hIx@hDXlE`@bE^nJ`AdEZxJ`A|DVXuCd@{GVyBb@_CbBwER]j@g@lA_AtAy@hBy@hAg@~Aq@bCw@nA[', NULL, '2018-11-13 07:46:40', '2018-11-13 07:48:06'),
(76, 'BRK759907', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '4', '7 Kalshi Rd, Dhaka 1216, Bangladesh', 23.82146810, 90.37238040, 'Rob Super Market, Dhaka 1212, Bangladesh', 23.79694270, 0.00000000, 23.82257700, 90.37753450, 90.41369620, '2018-11-13 09:14:10', NULL, '2018-11-13 09:15:09', '2018-11-13 09:19:37', 1, 1, 0, 1, 'cskpCkzqfPy@sI_AgLc@wGK?yAHW@?QKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMCAEIAIBKDGHCB?l@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDDYB]VuAb@mAp@sBD_@AQGYGKMKSKWC_@JUTKXAZJd@h@pA^b@b@^t@b@nAb@xA\\nJv@pNlA`KhApGj@bCPdCV|D^lLhAfCR~Iz@vAHhBNHs@h@_HRkCZaCViA^eAnAcD^a@dCkBrDgBhAg@xAk@x@YfBe@`B_@bAE`@@f@D@iACqBKaBa@gC}Hb@cELyKf@EiIWyBQm@zEsAbHkBMqAoDN', NULL, '2018-11-13 09:14:10', '2018-11-13 09:20:13'),
(77, 'BRK803772', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '5', 'Bir Shoptok, MES Zia Colony Road, Dhaka 1206, Bangladesh', 23.81640000, 90.40609840, 'Rob Super Market, Dhaka 1212, Bangladesh', 23.79694270, 0.00000000, 23.81425590, 90.40500810, 90.41369620, '2018-11-13 09:21:12', NULL, '2018-11-13 09:21:38', '2018-11-13 09:26:39', 1, 1, 0, 1, 'gsjpC}lxfPGRAZJd@h@pAbAbAt@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCR~Iz@vAHhBNHs@h@_HDm@L}AZaCViA^eAnAcD^a@x@q@jAy@`CkApAk@zAq@`Bk@fBe@`B_@bAE`@@f@D@iACqBKaBa@gC}Hb@cELyKf@EiIWyBQm@zEsAbHkBMqAoDN', NULL, '2018-11-13 09:21:12', '2018-11-13 09:27:10'),
(78, 'BRK142249', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '15', '126, 4 Rd No 27, Dhaka 1212, Bangladesh', 23.79932800, 90.40187920, 'Rd No 113/A, Dhaka 1212, Bangladesh', 23.78933870, 0.00000000, 23.79905370, 90.40230650, 90.42000780, '2018-11-13 09:30:43', NULL, '2018-11-13 09:31:14', '2018-11-13 09:46:53', 1, 1, 0, 1, 'yhgpCurwfPVBHs@h@_HRkCZaCViA^eAnAcD^a@dCkBrDgBhAg@xAk@x@YfBe@`B_@bAE`@@f@D@iACqBKaBa@gCcCgM]eBY_A_@{@OWRUn@g@fAYfLaDpF_BjAYzKkBSiEIyDOcEGiBaCF', NULL, '2018-11-13 09:30:43', '2018-11-13 09:47:39'),
(79, 'BRK221429', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Gulshan 2, Dhaka, Bangladesh', 23.79694270, 90.41369620, 'Mirpur DOHS, Dhaka, Bangladesh', 23.83646800, 0.00000000, 23.78989090, 90.41935080, 90.36953920, '2018-11-13 10:38:02', NULL, '2018-11-13 10:38:51', '2018-11-13 10:39:00', 1, 1, 0, 1, '_zfpCo~yfPnDOLpArBe@~@Yj@i@RULXZl@VpA\\bBfCvMf@xDF~A?lCyAGcADaB^gBd@y@XyAj@iAf@sDfBeCjB_@`@oAbD_@dAWhA[`CSjCu@pJmTiB{AQcTqBoQkBuFk@cAK[DsABy@EwNuA_BSy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBcA~EYj@WX]\\}@j@wDvC{@t@uC`CyChCyFdFiBjBm@j@SNMFABAD\\jAh@tAvAjCb@z@`@h@fDrDb@j@N\\^vBRjBB|@AhASfCi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@sAvDkAxCEj@Bh@Lr@^pA^bDNrABv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BAFEFMFQ?MICIuOP}FFkFRcB@CCAAQAsA@q@Fg@NYV[Zm@~@c@fAKh@Ej@@pBR|FVxOFxEbBAzAC', NULL, '2018-11-13 10:38:02', '2018-11-13 10:39:33'),
(80, 'BRK216156', 121, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83568010, 90.36607800, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 23.83568840, 90.36607820, 90.37954380, '2018-11-19 12:22:19', NULL, '2018-11-19 12:22:43', '2018-11-19 12:23:32', 1, 1, 0, 1, 'emnpC}rpfPGuFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHKqAMgASkAa@eAa@{@Ws@UqAMgB?u@JeCX{ADeBNuGDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{IaAeB_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAEyCBwE`@aMhAiYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCoDrC{EtDoKnIiF~DaK~HeAx@uFxEALCLIJKFU?GAGG}ApAaQzMkJnHmIrG{GfFcFrD{Ax@u@Zk@JcALwCXsBDyGOqDG{Pe@j@pMLfDZjJNtC@rBQF_@DwJ??d@D~JVbk@?xBuOReMFAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAeDiA{Ak@d@kAB@D@F?DEBI', NULL, '2018-11-19 12:22:19', '2018-11-19 12:23:48'),
(81, 'BRK364950', 121, 120, 120, 1, 'SCHEDULED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83566050, 90.36607460, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-11-19 12:24:15', '2018-11-19 21:24:00', NULL, NULL, 0, 0, 0, 1, 'emnpC}rpfPGuFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHKqAMgASkAa@eAa@{@Ws@UqAMgB?u@JeCX{ADeBNuGDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{IaAeB_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAEyCBwE`@aMhAiYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCoDrC{EtDoKnIiF~DaK~HeAx@uFxEALCLIJKFU?GAGG}ApAaQzMkJnHmIrG{GfFcFrD{Ax@u@Zk@JcALwCXsBDyGOqDG{Pe@j@pMLfDZjJNtC@rBQF_@DwJ??d@D~JVbk@?xBuOReMFAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAeDiA{Ak@d@kAB@D@F?DEBI', NULL, '2018-11-19 12:24:15', '2018-11-19 12:24:22'),
(82, 'BRK713155', 131, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Plot-374 (1st Floor), Main Road, Dhaka 1216, Bangladesh', 23.83567870, 90.36606440, 'Rob Super Market, Dhaka 1212, Bangladesh', 23.79694270, 0.00000000, 23.83442750, 90.36762680, 90.41369620, '2018-11-20 06:23:05', NULL, '2018-11-20 06:24:25', '2018-11-20 06:25:16', 1, 1, 0, 1, 'emnpC{rpfPGwFaBDaEA_@eXO{IM{DI}CFaAJi@Pe@h@eAp@w@XWPITEp@GdBCBCz@EtHU`DCbMIrAG~@Q@AFEDAJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCG?KBKNGZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHFi@L{@XgA`AsCH[@[EWGOWWYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvCVjSbBrEh@hIx@hDXlE`@bE^nJ`AdEZxJ`A|DVXuCd@{GVyBb@_CbBwER]j@g@lA_AtAy@hBy@hAg@~Aq@bCw@nA[`AS`@Cz@?n@D@eCGkBKcA]oB}Hb@{Lb@aDPAqECwBMsAIe@K[EQzAa@bL}CMqAoDN', NULL, '2018-11-20 06:23:05', '2019-01-24 11:10:11'),
(83, 'BRK120876', 121, 135, 135, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Gawair Madrasha Pukur, Dhaka, Bangladesh', 23.86135660, 90.41509540, 'Jamuna Future Park, Dhaka, Bangladesh', 23.81356730, 0.00000000, 23.86006840, 90.41407740, 90.42434020, '2018-11-20 08:07:36', NULL, '2018-11-20 08:08:10', '2018-11-20 08:08:33', 1, 1, 0, 1, 'mlspCefzfPz@Jn@AhAGvAO^GdBOp@KJHNPJZ?HGpAAd@D|@HjBBf@Hn@t@bC\\fCXxCNx@PbB?XKxBMbAGx@Jz@XtBJxB@n@FjAFr@D`A@XMDgCFJpEF~CR~KFTfBsArC_CbNqKxGkFjG_FdDqCvAkA@GBGFGHIj@Y`EoChKgI|H_GfKkIhQ_NfC_BnDiBzBeAbBk@`Ck@xFkAlCa@~OyApTqB|BWlAMZMZMRCjEa@pGs@p@O\\S\\c@Pa@ZYb@Sv@G~AFnG\\dAFvAXpD`Aj@Zb@h@`@^NBN?JA|G{Bp@MfAOrCQfE@zAAfDG~AC@g@CmB?cAHYFIl@QDKBKE_@sA{K@KLG`Dg@', NULL, '2018-11-20 08:07:36', '2018-11-20 08:08:47'),
(84, 'BRK952654', 121, 135, 135, 1, 'SCHEDULED', 'NONE', NULL, 'CASH', 0, 'YES', 15.00000000, NULL, 'Gawair Bazar গাওয়াইর বাজার, Shahid Latif Road, Dhaka, Bangladesh', 23.85917980, 90.41622550, 'Mirpur Road, Dhaka, Bangladesh', 23.80668070, 0.00000000, 0.00000000, 0.00000000, 90.36648790, '2018-11-20 08:09:24', '2018-11-20 02:12:00', NULL, NULL, 0, 0, 0, 1, 'q_spCelzfPb@|BPXNPJZ?HGpAAd@D|@HjBBf@Hn@t@bC\\fCXxCNx@PbB?XKxBMbAGx@Jz@XtBJxB@n@FjAFr@D`A@XMDgCFJpEF~CR~KFTfBsArC_CbNqKxGkFjG_FdDqCvAkA@GBGFGHIj@Y`EoChKgI|H_GfKkIhQ_NfC_BnDiBzBeAbBk@`Ck@xFkAlCa@~OyApTqBlMqAbHm@r@EzCFhBNbBZvBn@nCrAtA|@~@~@dB`Cp@hAdIvNl@hA|EpIhCzEr@tBNr@H`BMnHMnDMbHh@nAX`@XP^H`AHTFPLLLNd@B\\CRy@`Ci@|AKl@SnDIzEK~G@xCShBcA~EYj@WX]\\}@j@wDvC{@t@uC`CyChCyFdFiBjBm@j@SNMFCH\\jAh@tAvAjCb@z@`@h@fDrDb@j@N\\^vBRjBB|@Ap@?VSfCi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@sAvDkAxCEj@Bh@Lr@^pA^bDNrABv@dBKRA@R\\vG`@`EVxC^~DlAhNxApQh@xFFv@dBQnASvASjAMhDo@zCa@bAMdAjGhEu@zGoAhEu@zJiBlB[LABTXlDH`B@~@F|A@hCCfBCp@IbA_@tBEr@?hAHzA`@vDRArAQfBWhBW`Cc@zAg@n@[`BeAnCcBdEmCwBmEuBqEu@qBSoA', NULL, '2018-11-20 08:09:24', '2018-11-20 08:09:34'),
(85, 'BRK270688', 150, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, '16 Bashundhara Rd, Dhaka, Bangladesh', 23.81279710, 90.42883260, 'Rampura, Dhaka 1234, Bangladesh', 23.76122560, 0.00000000, 0.00000000, 0.00000000, 90.42076600, '2018-11-25 04:21:24', NULL, NULL, NULL, 0, 0, 0, 1, 'o}ipCc{|fPv@hTNdAzAfINjBX~HlGKzFKbBGbCQhLcAhG{@`JsA`PkBxFo@fBM|C_@jD_@`Gk@nNaBtI}@xLqAxPyA|@IrAIvCSfCEnC?lDDjCLpENlABtBD~BArEUz@?tEKZCpA[\\Cx@Kx@@lA@p@Hh@T~BTbAFbCPhBT|@N~@TvBt@lDzAhDbBdEzB`JlE|Az@hBv@hAj@pAj@nFdCjGzCTJFGx@q@BACKbA[@KGu@NAh@C', NULL, '2018-11-25 04:21:24', '2018-11-25 04:21:35'),
(86, 'BRK372542', 117, 0, 115, 1, 'CANCELLED', 'USER', 'test', 'CASH', 0, 'YES', 2.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83558400, 90.36609430, 'Shagufta New Rd, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2018-11-28 15:22:37', '2018-11-27 17:04:00', NULL, NULL, 0, 0, 0, 1, 'ejnpCcspfPIqFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCG~BQ', NULL, '2018-11-27 07:04:43', '2018-11-28 15:22:57'),
(87, 'BRK867269', 152, 0, 115, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 10.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83558360, 90.36609720, 'Kemal Ataturk Ave, Dhaka 1213, Bangladesh', 23.79358700, 0.00000000, 0.00000000, 0.00000000, 90.40626780, '2018-11-27 08:52:18', '2018-11-29 22:30:00', NULL, NULL, 0, 0, 0, 1, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@jAL|DVXuC\\aF^sDb@_CbBwER]j@g@lA_AtAy@pCqApAk@|Ak@tAa@nA[`AS`@Cz@?n@DN?AZ[rE]vE', NULL, '2018-11-27 08:51:15', '2018-11-27 08:52:53'),
(88, 'BRK257190', 125, 0, 121, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 40.00000000, NULL, 'Academic Building, DUET, Gazipur 1700, Bangladesh', 24.01784830, 90.41818670, 'BUET, BUET Central Road, Dhaka 1000, Bangladesh', 23.72654030, 0.00000000, 0.00000000, 0.00000000, 90.39146170, '2018-11-27 14:56:27', NULL, NULL, NULL, 0, 0, 0, 1, 'a}qqCyxzfPDRHLfA\\ZJ{@fEhGjBbH`CvA\\bGH~HX~Pt@dCLjDDjAA|@IpC_@~BMtEW~Hs@fHs@rB_@hCo@hEaAtEoAbA]Nb@d@pARh@|@~BtAbDr@hB^bBt@nFVtBlApHz@lExBdL~@`Fh@~CNbBX~Dt@dKfA|Kz@jJpBp]LnB@VRj@^zGj@pGX|BpAjLx@pHJdCXbBV|DLlAj@hDB@BBBDf@D~GTjJb@`TfA|Kf@`Vz@~Tt@pTf@|QNfDAtEOfGa@fCGvJm@l]sAbFOxTO`MWx@CbDa@lFuAbL}C|PyExEuApNyEpO{E~PmF|\\cKdM{DjR_GhK}ChNoE~CiApIsCvGaCtGyBhOuFfIyCpBu@pBi@fCa@vG}@v@KjFg@~@EnENvFXjFPdCHbD@lDEvCIfAShCiAfCwAlAy@tEaEtCwBz@_@l@Ox@G|@BzGbAjDf@bC\\bARz@XjEjArCv@nAT~AHdBA`DWbP_BbHo@rD[xAMz@AvBHrKdBjDl@xABpBGfEOtCD`HTxHXvFNzSh@bJTlCBr@AnAMjDk@tBy@`Ak@xB_B`EwCfG}EdOiLfIsGlLoJFUROvBsAnGsE|MoKbBoAz[}VdBkAfCyAlDeB~Ao@xBo@dCi@xFgAbI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@FrBS~IIlCI`HF`AJf@t@xBXf@v@~@bAbAt@b@nAb@xA\\rBP`QvAlPdBtK|@pV`CfNnAvAHhBNhBVn@LtK`AfFf@fIn@lQdBnXhCdLlAPGLAfBLfPtA`K`ApDZ\\DhC?dBQhEk@^OTOp@Sj@SZMpAe@dBaAtHiFl@]x@UbC_@`AGrA?r@DtAN~Fn@pF`@dGl@pARxGf@rJz@tKdAvJx@pGf@^?ZA\\OzB}@hBu@ZMZ?t@UpFkChE}B|H_EtMyGzAs@bAOrCKh@G`@InADvCMx@Iz@KNQp@e@fB{Bn@q@t@c@hAWpB[|AEtDRnBFpDA`ADhAZjAL|BLxANd@DBAL?HDFTCJABl@fC`@x@d@Rl@Nx@LjAH|DA|DFxADXEZKb@_@nA{@hAe@jAU~BU~C]dAW\\UR[XIT@NLt@d@nBbBn@n@ZRn@Rn@CU`@EXTrOHzALh@HFJXEZKJC@Fd@vBpMoEfEIF|@lA|@nAFN?r@H?nFAQdBOtAy@tDaAbH@lA|ABf@E', NULL, '2018-11-27 14:50:15', '2018-11-27 14:57:29'),
(89, 'BRK840447', 125, 0, 121, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 33.00000000, NULL, 'Academic Building, DUET, Gazipur 1700, Bangladesh', 24.01784830, 90.41818670, 'Rd No. 2, Dhaka 1216, Bangladesh', 23.82234860, 0.00000000, 0.00000000, 0.00000000, 90.36542040, '2018-11-27 15:14:47', NULL, NULL, NULL, 0, 0, 0, 1, 'a}qqCyxzfPDRHLfA\\ZJ@B}@bE`Ct@fCt@jDnAvBp@hAXLBbGH~HXzDNbKd@dCLjDDjAA|@IpC_@~BMtEW~Hs@fHs@d@ElAYhCo@hEaAtEoAbA]Nb@d@pARh@|@~BtAbDf@hAJ^^bBt@nFVtBh@rDb@|Bz@lExBdL~@`Fh@~CNbBX~Dt@dKfA|KJz@n@nHpBp]LnB@VRj@^zGj@pGX|BpAjLx@pHJdCXbBV|DLlAj@hDB@BBBD?Bf@@~GTjJb@`TfA|Kf@fFRxNf@~Tt@pTf@|QNfDAtEOfGa@fCGvJm@l]sAbFOvGG`LGjHMtCIx@CbDa@lFuAbL}ChGgBrHqBxEuApNyEpO{E~PmF|\\cKdM{DjR_GhK}C`EmAfHaC~CiArDsA|C_AvCeA~B{@tGyBhOuFpEeBtBs@pBu@pBi@fCa@vG}@v@KjFg@~@EnENvFXjFPdCHbD@lDEvCIfASx@[nAm@fCwAlAy@tEaEbBqAp@e@z@_@l@Ox@G|@BzDh@~AXjDf@bC\\bARz@XjEjArCv@nAT~AHdBA`DWbP_BbHo@rD[xAMz@AvBHrKdBjDl@xABpBGfEOtCD`HTxHXvFNzSh@bJTlCBr@AnAMjDk@tBy@`Ak@xB_B`EwCfG}EbMuJ`As@nBaBvEqDlLoJFUROvBsAnGsE|MoKbBoAnJuHjPgMdBkAfCyAlDeB~Ao@xBo@dCi@zBg@|B_@bI{@zLiAjReBxPaB`CQ~A?~CN`ALrCp@nBz@nBfAj@^p@n@bApAn@`AnEzHjDjGbAfB~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDADABj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`ACjAi@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@f@t@Ed@E\\A^jHl@bGz@rJrAbPXjDSBeBZiCRGFkBXcBPE@NlB\\pDHfAXvCdBQ^hE', NULL, '2018-11-27 15:08:30', '2018-11-27 15:15:50'),
(90, 'BRK666316', 125, 136, 136, 1, 'CANCELLED', 'USER', 'AMni', 'CASH', 0, 'YES', 0.00000000, NULL, 'Academic Building, DUET, Gazipur 1700, Bangladesh', 24.01780000, 90.41819830, 'Academic Building, DUET, Gazipur 1700, Bangladesh', 24.01784830, 0.00000000, 0.00000000, 0.00000000, 90.41818670, '2018-11-29 11:44:06', NULL, NULL, NULL, 0, 0, 0, 1, 'a}qqC{xzfP?@', NULL, '2018-11-29 11:44:06', '2018-11-29 11:45:40'),
(91, 'BRK322179', 125, 0, 136, 1, 'CANCELLED', 'USER', 'AMni', 'CASH', 0, 'YES', 9.00000000, NULL, 'Academic Building, DUET, Gazipur 1700, Bangladesh', 24.01850170, 90.41819830, 'M. H Tower 21, Vogra, Gazipur Sadar, Gazipur, 21 Dhaka - Mymensingh Hwy, 1700, Bangladesh', 23.98128760, 0.00000000, 0.00000000, 0.00000000, 90.38080390, '2018-11-29 11:47:11', NULL, NULL, NULL, 0, 0, 0, 1, 'sbrqCoxzfPf@PZJw@tCfI~B|Br@tFnB|Bp@`@H|EHhFNnHXxG\\xERhDHfCCjDc@~@K`CI`COvGk@dGm@pCWtCq@nFoAvDcA|Bs@hAzCdBtEtAzCV|@n@vDVpBTpBl@bEf@fCxB`LxA`Ix@jEZlCXzDp@rJt@~HhAjL^rFv@nNr@zLRj@^zGj@pGPjA^jDTrBbDP|CL|BDrBHF?|ATLJb@?ZBXFdBFNMLAhA@p@BLAD_@XIpBo@RI~@En@Kt@OLMHaAJa@HA~@QdAOvAYhAWlAa@hAIrBWr@CNJNDdAPp@JNFd@@x@UdAGNEFDtBEp@?XHb@\\PA\\MJGHCT@`D`@nABf@B[dA{@zCaAdDwB`Ho@fCKh@[vCUrCG|AGrKkV_A', NULL, '2018-11-29 11:47:05', '2018-11-29 11:47:23'),
(92, 'BRK395841', 125, 136, 136, 1, 'DROPPED', 'NONE', NULL, 'CASH', 0, 'YES', 0.00000000, '0', 'DUET, Gazipur 1700, Bangladesh', 24.01850170, 90.41819830, '523 Rd Number 21, Dhaka, Bangladesh', 23.83646800, 0.00000000, 0.00000000, 0.00000000, 90.36953920, '2018-11-29 11:50:24', NULL, '2018-11-29 11:51:50', '2018-11-29 11:52:02', 0, 0, 0, 1, 'sbrqCoxzfPf@PZJw@tCfI~B|Br@tFnB|Bp@`@H|EHhFNnHXxG\\xERhDHfCCjDc@~@K`CI`COvGk@dGm@pCWtCq@nFoAvDcA|Bs@hAzCdBtEtAzCV|@n@vDVpBTpBl@bEf@fCxB`LxA`Ix@jEZlCXzDp@rJt@~HhAjL^rFv@nNr@zLRj@^zGj@pGPjA^jDTrB|AnNJdCXbBd@jGl@jDDBDHdIVl[zAtMp@dl@rBtVj@nTNrDG~Ha@fBKp@?jJm@~Sw@zKe@jDKrROtECtEMjBEzAIhDm@dPkEtK{C~F}AzKoDnMeElEsAvT_Hng@oOd\\aK|EwAxFgB|HkCvFsBnFgBlC_AfC}@dDgArI_D|DyAj@QhG_C~@[zAk@pBi@rK}Ad@GzBWfE[lBDtH^jFR`CHpDBrDCzCIh@E^Gf@OfBy@fDkB~AmAvBoBbCqBt@g@bAi@p@Sv@Gt@?`@BzEt@fEn@dCZx@Nr@RtEpAzCz@jATnALrB@jCQxO}AnIu@hD[nAMbAChBBf@BbG|@rHrAfADtBEdDOzB?jFNvFRlL^`Th@hJRvDDb@CnEm@f@OjAe@z@a@~@k@jGsElGcFbNqKxGkFjG_FdDqCvAkA@GBGPQj@Y`EoChKgI|H_GfKkIhQ_NfC_BnDiBzBeAbBk@`Ck@xFkAlCa@~OyApTqBlMqAbHm@r@EzCFhBNbBZvBn@nCrAtA|@~@~@dB`Cp@hAdIvNl@hA|EpIhCzEr@tBNr@H`BMnHMnDMbHh@nAX`@XP^H`AHTFPLLLNd@B\\CRy@`Ci@|AKl@SnDIzEK~G@xCShBcA~EYj@WX]\\}@j@wDvC{@t@uC`CyChCyFdFiBjBm@j@SNMFABAD\\jAh@tAvAjCb@z@`@h@fDrDb@j@N\\^vBRjBB|@AhASfCi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@sAvDkAxCEj@Bh@Lr@^pA^bDNrABv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BAFEFMFQ?MICIuOP}FFkFRcB@CCAAQAsA@q@Fg@NYV[Zm@~@c@fAKh@Ej@@pBR|FVxOFxEbBAzAC', NULL, '2018-11-29 11:50:24', '2018-11-29 11:52:02'),
(93, 'BRK861048', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71767650, 51.35533810, 'Tehran Province, Tehran, 4th Boostan St, Iran', 35.72719613, 0.00000000, 35.71703880, 51.35602800, 51.32663168, '2018-11-30 22:38:18', NULL, '2018-11-30 22:39:42', '2018-11-30 22:40:00', 1, 1, 0, 1, 'ib_yEugmxH{AJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDDt@Ir@AnE@nAIhAWlCy@dD{A~EUj@Yh@[`@a@\\_@V]N[H{BTcCQ}@Mw@Ec@?e@D}DTe@A{AFa@@sAJaERcAFcB@wBRgAJm@?wBWICU@UFm@\\aAXe@D_AHkBLJvBD`@@HWx@gCrIoDxLeC~HsCfKu@S', NULL, '2018-11-30 22:38:18', '2018-11-30 22:40:26'),
(94, 'BRK471185', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, کوچه رئیسی، Iran', 35.72159857, 0.00000000, 35.71703880, 51.35602800, 51.35696545, '2018-11-30 22:41:21', NULL, '2018-11-30 22:42:00', '2018-11-30 22:42:24', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLXoDp@qLRyCHg@X_@j@o@jA_AvC_DlAoA`C}BcCwHgASQC?LZpE^`Fm@j@m@^{B|BiCbCSb@ATsApT_@~Gm@`JeCi@mC]Fk@', NULL, '2018-11-30 22:41:21', '2018-11-30 22:42:36'),
(95, 'BRK263161', 155, 0, 0, 1, 'CANCELLED', 'USER', 'sorry', 'CASH', 0, 'YES', 8.00000000, NULL, 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-11-30 22:49:09', NULL, NULL, NULL, 0, 0, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-11-30 22:49:09', '2018-11-30 22:49:34'),
(96, 'BRK728514', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Negahban St, Iran', 35.73047419, 0.00000000, 35.71703880, 51.35602800, 51.30814288, '2018-11-30 22:52:09', NULL, '2018-11-30 22:52:55', '2018-11-30 22:54:24', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-11-30 22:52:09', '2018-11-30 22:54:44'),
(97, 'BRK584684', 155, 137, 137, 1, 'CANCELLED', 'USER', 'no', 'CASH', 0, 'YES', 8.00000000, NULL, 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71763670, 51.35532900, '', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-11-30 22:55:05', NULL, NULL, NULL, 0, 0, 0, 1, 'ab_yEugmxHcBJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-11-30 22:55:05', '2018-11-30 22:55:22'),
(98, 'BRK399319', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71764940, 51.35532700, 'Tehran Province, Tehran, North Shahran, 5th, Iran', 35.76830392, 0.00000000, 35.71703880, 51.35602800, 51.28817953, '2018-11-30 22:55:40', NULL, '2018-11-30 22:56:46', '2018-11-30 22:59:44', 1, 1, 0, 1, 'cb_yEugmxHaBJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-11-30 22:55:40', '2018-11-30 23:00:01'),
(99, 'BRK480881', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Tehran, District 2, Kashani Pour، Iran', 35.71793469, 51.35525521, 'مسجد شهدا، District 2, Tehran, Tehran Province, Iran', 35.72593212, 0.00000000, 35.71763210, 51.35529870, 51.35509931, '2018-12-01 10:03:35', NULL, '2018-12-01 10:04:39', '2018-12-01 10:05:52', 1, 1, 0, 1, '{d_yEoimxHIdA}AH_DF}ADgCJbAwN\\qFLoBb@b@hBjBx@bAhBjBbClC`BrBnErEDBFHFHLT^h@NTFHXl@Dd@?`@Gd@M\\]l@S|@Kl@Wh@[Xe@VmBh@iBr@aAp@s@r@uCrDKNeA`A{Az@uA^gBLcCEwR[cD?iD?wD@c@@SI{@I_@Cy@QsGyB\\wDl@y@hAqBdCeFI]IGm@QwBm@}@YvBiFTS\\QJBnATtCb@tCVJ@AWCqBDw@L}@H[`C~@{@xD@HJDD?', NULL, '2018-12-01 10:03:35', '2018-12-01 10:06:32'),
(100, 'BRK399269', 155, 0, 137, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 2.00000000, NULL, 'Tehran Province, Tehran, Sheikh Fazlollah Nuri Expy, Iran', 35.71703880, 51.35602800, 'Tehran Province, Tehran, مجاهد، Iran', 35.71770113, 0.00000000, 0.00000000, 0.00000000, 51.35573868, '2018-12-01 10:24:51', NULL, NULL, NULL, 0, 0, 0, 1, 'k~~xEinmxHtAtAzAbBxB~CdBpDvApDlAdE`A|EbAdHrAfJCtBE\\CNGNe@h@gAdAW@O?QO[o@S_@UYyEiC{Aw@Wg@QcAyAo@YQOCU?Ci@k@a@s@IO?MMOYq@e@IGOHINcAeA?OESGGQGQB}@cFDOCSZg@Nc@X_Cf@cF`@wEZoDb@CrBOLuB[AGCCCAI', NULL, '2018-12-01 10:24:42', '2018-12-01 10:25:54'),
(101, 'BRK290465', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '5', 'Tehran Province, Tehran, بهرام مطهری، Iran', 35.71728640, 51.35547340, 'Tehran Province, Tehran, Sheikh Fazlollah Nuri Expy, Iran', 35.71703884, 0.00000000, 35.71776260, 51.35518220, 51.35602802, '2018-12-01 10:26:34', NULL, '2018-12-01 10:30:16', '2018-12-01 10:35:38', 1, 1, 0, 1, 'c`_yEwjmxHIxAsBNaCL}FLgCJl@qIr@wKLoBb@b@hBjBx@bAhBjBbClC`BrBlEnEDDFFFJLR^h@\\h@Tf@Dd@?`@Gd@M\\]l@S|@Kl@Wh@[Xe@VmBh@iBr@aAp@s@r@uCrDKNeA`A{Az@uA^gBLcCEwR[cD?iD?eA?qB@c@@SI{@I_@Cy@QsGyB\\wDl@y@hAqBdCeFI]IGm@QwBm@}@YvBiFTS\\QJBnATtCb@tCVJ@AWCqBDw@L}@|@cEnAgFdA}DhBcJF]Ca@SuBBkAP{@t@gBZa@VOR?THp@^hApAtAxA`GlG`EnErCzCfCrC`LzLl@l@', NULL, '2018-12-01 10:26:34', '2018-12-01 15:15:40'),
(102, 'BRK150052', 117, 0, 0, 1, 'CANCELLED', 'USER', 'sdfsdfsdf', 'CASH', 0, 'YES', 11.00000000, NULL, 'Dhaka,(null),(null)', 23.84018470, 90.36137300, 'Gulshan 2, Dhaka, Bangladesh', 23.79694270, 0.00000000, 0.00000000, 0.00000000, 90.41369620, '2018-12-01 15:27:00', NULL, NULL, NULL, 0, 0, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDDYB]VuAz@eCX{@D_@AQGYUWSKWC_@JUTKXAZJd@h@pAbAbAt@b@nAb@xA\\rBP`QvAjDZ`KhAtK|@pV`CfCR~Iz@vAHhBNHs@h@_HDm@L}AZaCViA^eAnAcD^a@x@q@jAy@`CkApAk@zAq@`Bk@fBe@`B_@bAE`@@f@D@iACqBKaBa@gC}Hb@cELyKf@EiIWyBQm@zEsAbHkBMqAoDN', NULL, '2018-12-01 15:27:00', '2018-12-01 15:27:12'),
(103, 'BRK956858', 156, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, 'Dhaka,(null),(null)', 23.84018470, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2018-12-01 15:45:28', NULL, NULL, NULL, 0, 0, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2018-12-01 15:45:28', '2018-12-01 15:46:29'),
(104, 'BRK388476', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, '293 Rd # 02, Dhaka, Bangladesh', 23.83561350, 90.36660100, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-12-01 15:56:05', NULL, NULL, NULL, 0, 0, 0, 1, 'ijnpCivpfPEkCk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-12-01 15:56:05', '2018-12-01 15:57:06'),
(105, 'BRK563002', 156, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka,(null),(null)', 23.84018470, 90.36137300, 'Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.84018470, 90.36137300, 90.37954400, '2018-12-01 15:58:37', NULL, '2018-12-01 15:59:12', '2018-12-01 15:59:23', 1, 1, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2018-12-01 15:58:37', '2018-12-01 15:59:53'),
(106, 'BRK716790', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka,(null),(null)', 23.84018470, 90.36137300, 'Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.84018470, 90.36137300, 90.37954400, '2018-12-01 16:22:55', NULL, '2018-12-01 16:23:48', '2018-12-01 16:24:10', 1, 1, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2018-12-01 16:22:55', '2018-12-01 16:24:58'),
(107, 'BRK209324', 155, 0, 137, 1, 'CANCELLED', 'USER', 'test', 'CASH', 0, 'YES', 8.00000000, NULL, 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-02 21:08:19', NULL, NULL, NULL, 0, 0, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-02 21:07:19', '2018-12-02 21:08:38'),
(108, 'BRK707105', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 35.71691460, 51.35570020, 51.32373690, '2018-12-02 21:08:54', NULL, '2018-12-02 21:09:25', '2018-12-02 21:09:32', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-02 21:08:54', '2018-12-02 21:09:55'),
(109, 'BRK415874', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-02 21:10:35', NULL, '2018-12-02 21:10:48', '2018-12-02 21:10:53', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-02 21:10:35', '2018-12-02 21:11:14'),
(110, 'BRK448604', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766300, 51.35532130, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 35.71691460, 51.35570020, 51.32373690, '2018-12-02 21:11:27', NULL, '2018-12-02 21:11:43', '2018-12-02 21:12:36', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-02 21:11:27', '2018-12-02 21:12:47'),
(111, 'BRK353278', 155, 0, 0, 1, 'CANCELLED', 'USER', 'اارز', 'CASH', 0, 'YES', 0.00000000, NULL, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 51.32373690, '', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-03 19:17:25', NULL, NULL, NULL, 0, 0, 0, 1, 'qv`yEqegxH', NULL, '2018-12-03 19:17:25', '2018-12-03 19:17:36'),
(112, 'BRK582182', 155, 0, 137, 1, 'CANCELLED', 'USER', 'ررد', 'CASH', 0, 'YES', 9.00000000, NULL, 'Tehran Province, Tehran, الجواد، Iran', 35.71651740, 51.35278760, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-03 19:21:46', NULL, NULL, NULL, 0, 0, 0, 1, 'k{~xE}ylxHQnAEH}AFFUHaA`@aFb@mFcCDwCRqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBBBFJFHNTLR^j@FHLThBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-03 19:20:43', '2018-12-03 19:22:12'),
(113, 'BRK703231', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71766180, 51.35530460, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 35.71691460, 51.35570020, 51.32373690, '2018-12-03 19:22:26', NULL, '2018-12-03 19:22:53', '2018-12-03 19:22:59', 1, 1, 0, 1, 'eb_yEugmxH_BJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-03 19:22:26', '2018-12-03 19:23:08'),
(114, 'BRK408689', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Mallorca-Rogent, 08026 Barcelona, Spain', 41.41029560, 2.18444700, 'Carrer de les Escoles, 3, 08018 Barcelona, Spain', 41.40970370, 0.00000000, 41.41032120, 2.18443390, 2.18923660, '2018-12-04 12:47:18', NULL, '2018-12-04 12:47:56', '2018-12-04 12:48:00', 1, 1, 0, 1, 'c}v{FatiLnMnRd@r@jD}EvBqDp@{@|AkBnAiBoDmFeBgCw@iAg@aAm@?kB?wD?CSQ_@aBgCoAoBqAaBJWdAmEJSHGn@VNNI^k@~C', NULL, '2018-12-04 12:47:18', '2018-12-04 12:48:21'),
(115, 'BRK454893', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Mokhtari, Iran', 35.65262920, 51.46375780, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 35.65276960, 51.46374710, 51.32373690, '2018-12-04 17:48:21', NULL, '2018-12-04 17:48:52', '2018-12-04 17:49:32', 1, 1, 0, 1, 'wkrxEmobyHi@`Dm@MGBMFEDeAaA_@tB[`Bm@xCWp@qAHm@H{AJaCBuC?sADQBMHyBM{BQgC]mCa@wD}@aCu@{CiAsCmAqHmDsJsEkAa@kAYmASkAMoAGiBFq@FkAVmBd@qBt@mAn@eAt@iBdB{BnCwDvEaCpCaAbAcBnA}BjAoAd@}@T}@N_BNw@DgA@gCK_BUkDi@}AYwCs@uCc@qBMwBBkE`@kBd@o@TiAj@wCbByCpBuA`Aw@^iDrAqB`@yBVcFFeDFcER{KbAiCJi@?wAGsDc@uAK[EiCUuP_A_Kc@qDSoDMeDGwGb@{Jx@oBL_E`@eIv@wCVcBHqAAkAG}AQyA_@eA]o@Yk@WwAaAsDwDcCsCeBgCuC}FuCqGeAmC}CwG}C_Ha@m@}Ni\\iAyBm@w@kDeFkH{HyDqEiIqJiB{A_KwIm@g@iC_C{EyEyAiAgB}@wEo@kBYmAa@}Aq@gBo@[UWUGQE[Aa@Ja@TWTKRAXDVTN^F`BYhEg@vHsA`Kw@vGq@lGoAvJcA~Jk@rFc@xGqAnQWxDQpD?^BrB@nAIbAYpBg@hCm@xC]rBKfBB`DTpFRvDCxAIpAiAjXKtBMfB[vJShEAfDKdFOjCUdCiAhGETIvA?hCOrWD|HH|ENxADTZrBjA|Dv@lBlAnCb@pAJZb@|ARlARvANpB\\rI@fGBtKPfLDx@LpIDxGLbIAvCEt@Kx@Qt@Sj@w@~BsCbFkB~C_@t@cAxBeAxCg@bC{@pF{A|L]|COjCIdCA~B?bAJnCNfBJdAZlBr@|CRl@pAvBf@x@jA`CfBjEVbA\\nBj@fDLjADn@JlCC|COjB_@jDa@hC]tA}AfGkAhEgAjEWnAQhA]~DGxCFjEb@bEx@|Gf@nCjBxLj@lDLjBdDf]tB|P~@dH`@pB`BnJd@rC\\zCJ~Ab@dGNxI?vGMpEk@bJq@pGwBtTcAfKWtCk@|Gc@xHG~BBfEJzAL`F\\~H@rDJhDCxFM~HIfHJ|CFp@HjBLbCd@zIHnA`@`Ev@rFTrA|@xF|AfKJz@`BjLvBxOpA`K|@dGx@~Ej@hDnAfI\\hAVbAb@vAbAbCvApC`AjBzBtEf@dBP\\Vt@t@hCJ~@Bh@G^GPURUHQBUAQEQOOUISEY@q@Tw@Zi@`@c@T]`A}@vAsAbB}A|@eAPUn@}@rC{CfA}AT]BYtAiDzAeF~AmFhBsGz@qDx@mCtAyEfDiLpBaH', NULL, '2018-12-04 17:48:21', '2018-12-04 17:50:55');
INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `provider_id`, `current_provider_id`, `service_type_id`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `is_track`, `distance`, `travel_time`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `track_distance`, `track_latitude`, `track_longitude`, `d_longitude`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(116, 'BRK613445', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Khorsand, Iran', 35.65282510, 51.46366300, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 35.65261950, 51.46347760, 51.32373690, '2018-12-04 17:54:07', NULL, '2018-12-04 17:54:44', '2018-12-04 17:55:00', 1, 1, 0, 1, 'umrxEcobyH_@tBDROFKHeAaA_@tB[`Bm@xCWp@qAHm@H{AJaCBuC?sADQBMHyBMwD_@yEq@wD}@aCu@{CiAsCmA}PeIgB{@kAa@kAYmASkAMoAGu@@eBLyD|@qBt@mAn@eAt@iBdBsHfJaCpCaAbAcBnA}BjAoAd@}@T}@N_BNw@DgA@gCKkG_A}AYwCs@uCc@qBMwBBkE`@kBd@o@TiAj@wCbByCpBuA`Aw@^iDrAqB`@yBVsABuHJcERgGh@sCXiCJi@?wAGsDc@qBQiCUmDUgWmAqDSoDMeDGwGb@{Jx@oBL_E`@eIv@wCVcBHqAAkAG}AQyA_@eA]o@Yk@WwAaAsDwDcCsCeBgCuC}FuCqGeAmC}CwG}C_Ha@m@}Ni\\iAyBm@w@kDeFkH{HyDqEiIqJiB{A_KwI}@w@yBoB{EyEyAiAgB}@wEo@kBYmAa@}Aq@gBo@[UWUGQE[Aa@Ja@TWTKRAXDVTN^F`BaA`OsA`Kw@vGq@lGc@lDk@hEcA~Jk@rFc@xGqAnQWxDQpD?^BrB@nAIbAYpBg@hCm@xC]rBKfBB`Dh@hLCxAIpAuA`\\MfBKzCOzEShEAfDCvBGlBOjCUdCi@lCe@pCIvA?hCOrWD|HH|ENxA`@hCjA|Dv@lBlAnCb@pAJZb@|ARlARvANpB\\rI@fGBtKPfLDx@?f@LhHDxGLbIAvCEt@Kx@Qt@Sj@w@~BsCbFkB~CcBnDeAxCYpAq@zDWfB{@xG_@bD]|COjCIdCAbEJnCNfBJdAZlBr@|CRl@pAvBf@x@jA`CfBjEVbA\\nBj@fDRzBJlCC|COjB_@jDa@hC]tAk@xBqA|EoA~Ec@dBWnA]lCQzBGxCFjE\\zCTrB`@bDFl@ZbBh@dDxBlNLjB|@pJfBtQn@fFdAtI~@dHhB|JXbBd@rC\\zCJ~AZnEFt@NxI?vGMpEk@bJkCxW]lDcAfKcArLc@xHG~BBfEJzAL`F\\~H@rDJhDCxFM~HIfHJ|CFp@HjBLbCd@zIBh@Dd@`@`Ev@rFTrAPdAhCzPJz@`BjLfC~Q`AzH|@dGdBhKnAfI\\hAVbAb@vAbAbCxBfE^t@zBtEf@dBP\\Vt@t@hCJ~@Bh@G^GPURUHg@@QEQOYi@EYAWBYH]Xq@n@u@T]`A}@vAsAbB}At@}@X]n@}@fBiBj@q@fA}AT]BYtAiDtCwJnCoJz@qDx@mCtAyExGkU', NULL, '2018-12-04 17:54:07', '2018-12-05 18:24:01'),
(117, 'BRK640843', 152, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83558940, 90.36609390, 'House 47 Rd No 27, Dhaka 1213, Bangladesh', 23.79962980, 0.00000000, 0.00000000, 0.00000000, 90.40401210, '2018-12-05 06:47:32', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCcspfPIqFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@jAL|DVXuC\\aFB]', NULL, '2018-12-05 06:47:32', '2018-12-05 06:47:40'),
(118, 'BRK499678', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83547830, 90.36614310, '532/4 Road No 11, Dhaka 1212, Bangladesh', 23.81033200, 0.00000000, 0.00000000, 0.00000000, 90.41251810, '2018-12-05 12:39:34', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCmspfPIgFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@j@Gx@@xHx@fE\\`AMr@@b@FIYuA_B{@aA{AqBqAqB_@u@u@kBu@gBe@y@{AuBUg@Sm@g@eB]{@q@}A{@_BuEyIi@iA]YbGQdEEbEKxJS`EKBnB', NULL, '2018-12-05 12:39:34', '2018-12-05 12:39:40'),
(119, 'BRK734122', 155, 138, 138, 1, 'CANCELLED', 'USER', 'fhjc', 'CASH', 0, 'YES', 10.00000000, NULL, 'Tehran Province, Tehran, بلوار آیت الله کاشانی،استان تبزرگراه کاشانی نرسیده به بالاتر از پمپ بنزین پلاک 6۳هران، تهران، فردوس، 2nd Sadeghiyeh Square, Iran', 35.72605440, 51.32425170, 'Tehran Province, Tehran, Rahmani, Shahid، Bozorgrah-e-Tehran- Parchin، Meydan-e Azadi, Iran', 35.70116400, 0.00000000, 0.00000000, 0.00000000, 51.33325620, '2018-12-05 13:52:58', NULL, NULL, NULL, 0, 0, 0, 1, 'qv`yEkggxHsHjWc@tAs@bCo@|Bg@zAgBpGm@rBsAlEeBxFMl@}@|BuCzDm@n@oBnB]\\wAzAeC`C{DtDuLtJ}BbBq@n@_ChBoDzCQRCNDBNKLCTQ~BsBxAqA~AeAv@s@xAeAzBiBlC{Bz@w@jByAb@YfDuCzDqDx@YPAh@Jr@NzALpC\\hFfAVKfBd@`B\\nGx@lF`AfARxMrCdJzAvC`@rJnBbADpBAr@AlDF`GAjBMl@a@p@Iv@S^SxA{@zB}AjCqBdBaAl@YZGnAYt@GjAIhCEnQOlBAtBT|Aj@\\NZRdBbAhAp@nDrBhAb@~@VhAThBJxBCr@Ed@Ix@a@jAyAb@o@l@gANeA?g@aA{JOsBCeDQkSCoFSgFEeCKkMG{LAuCFqFCgEAgGW{EKaMAkF@{I?MAkBC]EEE?GBCH?n@C~ABnMQx@c@n@sCB[YYOsB?NgI', NULL, '2018-12-05 13:52:58', '2018-12-05 13:54:59'),
(120, 'BRK557299', 155, 138, 138, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Tehran Province, Tehran, بلوار آیت الله کاشانی،استان تبزرگراه کاشانی نرسیده به بالاتر از پمپ بنزین پلاک 6۳هران، تهران، فردوس، 2nd Sadeghiyeh Square, Iran', 35.72626010, 51.32434870, 'Tehran Province, Tehran, خیابان فرهنگیان، Iran', 35.73254536, 0.00000000, 35.72604500, 51.32371480, 51.31984301, '2018-12-05 13:55:52', NULL, '2018-12-05 13:56:40', '2018-12-05 13:58:10', 1, 1, 0, 1, 'qv`yEgggxHsHfWQHSFaC[eLsAqDc@_C[WACFwAnD]bAh@F', NULL, '2018-12-05 13:55:52', '2018-12-05 13:58:48'),
(121, 'BRK911949', 155, 138, 138, 1, 'CANCELLED', 'PROVIDER', 'dd', 'CASH', 0, 'YES', 5.00000000, NULL, 'Tehran Province, Tehran, District 5, استان تهران، تهران، بلوار کاشانی بین اباذر و مهران پلاک ۵۹ ساختمان بادبادک طبقه،،، 2nd St, Iran', 35.72618850, 51.32436080, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-05 14:04:57', NULL, NULL, NULL, 0, 0, 0, 1, 'ov`yEqggxHuHpWc@tAs@bCo@|Bg@zAgBpGm@rBsAlEeBxFMl@}@|BuCzDm@n@oBnB]\\wAzAeC`C{DtDuLtJ}BbBq@n@_ChBoDzCQRCNDBNKLCTQ~BsBxAqA~AeAv@s@xAeAzBiBlC{Bz@w@jByAlBoB`G{Fz@_AxC{CrA}Af@u@z@qAtAiDzAeF~AmFhBsGz@qDx@mCtAyEfDiLpBaH', NULL, '2018-12-05 14:04:57', '2018-12-05 14:06:53'),
(122, 'BRK219529', 155, 138, 138, 1, 'CANCELLED', 'PROVIDER', 'ghuu', 'CASH', 0, 'YES', 3.00000000, NULL, 'Tehran Province, Tehran, District 5, استان تهران، تهران، بلوار کاشانی بین اباذر و مهران پلاک ۵۹ ساختمان بادبادک طبقه،،، 2nd St, Iran', 35.72619070, 51.32442350, 'Tehran Province, Tehran, باغ فیض، پلاک ٢٧, Iran', 35.74086516, 0.00000000, 0.00000000, 0.00000000, 51.31887540, '2018-12-05 14:07:36', NULL, NULL, NULL, 0, 0, 0, 1, 'kv`yE{ggxHyHzWc@tAs@bCo@|Bg@zAgBpGm@rBsAlEeBxFMl@}@|BmBlC_@Fm@j@}@|@[V]L]Bq@G}ASuAQO@M@y@C{Ai@qAYkBe@kDw@qI}Ac@{@GY?i@\\uKiFe@{BWE~@qB[iCQt@kRq@?', NULL, '2018-12-05 14:07:36', '2018-12-05 14:08:22'),
(123, 'BRK330872', 155, 138, 138, 1, 'CANCELLED', 'USER', 'cvh', 'CASH', 0, 'YES', 7.00000000, NULL, 'Shaghayegh Bus Terminal, South Sazman Barnameh, Tehran, Tehran Province, Iran', 35.71936732, 51.30016800, 'Tehran Province, Tehran, Rahmani, Shahid، Bozorgrah-e-Tehran- Parchin، Meydan-e Azadi, Iran', 35.70116400, 0.00000000, 0.00000000, 0.00000000, 51.33325620, '2018-12-05 14:09:44', NULL, NULL, NULL, 0, 0, 0, 1, '{l_yEaqbxHFLD@FCDMGOA?n@wH@G\\Fj@HFg@_Ca@iJaBoB[|@_K@GYIt@oGbAuJvC`@rJnBbADpBAr@AlDF`GAjBMl@a@p@Iv@S^SxA{@zB}AjCqBdBaAl@YZGnAYt@GjAIhCEnQOlBAtBT|Aj@\\NZRdBbAhAp@nDrBhAb@~@VhAThBJxBCr@Ed@Ix@a@jAyAb@o@l@gANeA?g@aA{JOsBCeDQkSCoFSgFEeCKkMIqQFqFCgEAgGW{EKaMAkF@{I?MAkBC]EEE?GBCH?n@C~ABnMQx@c@n@sCB[YYOsB?NgI', NULL, '2018-12-05 14:09:44', '2018-12-05 14:11:43'),
(124, 'BRK450670', 155, 138, 138, 1, 'CANCELLED', 'PROVIDER', 'dfgg', 'CASH', 0, 'YES', 4.00000000, NULL, 'Tehran Province, Tehran, 2nd Sadeghiyeh Square, No. 511, Iran', 35.72188329, 51.33523051, 'Tehran Province, Tehran, Rahmani, Shahid، Bozorgrah-e-Tehran- Parchin، Meydan-e Azadi, Iran', 35.70116400, 0.00000000, 0.00000000, 0.00000000, 51.33325620, '2018-12-05 14:12:46', NULL, NULL, NULL, 0, 0, 0, 1, 'e|_yEglixHE_@KSQOQIUAUFUNOZE`@BTFXTVVJP@NCVOHIDIh@Kj@Yp@QtB[~BOfBGtCIrBOn@C`CCfAMlBKl@?n@ChADxAh@lATp@T|@Nx@Nl@Rd@\\Zj@Lf@Fl@?t@EdBErAcA|J]fCa@|Dm@rFMZO`@MPOJSDSASIOKGQEQBg@Nq@Xe@b@]b@Mb@IjAQfBm@p@_@l@g@l@q@X]h@aANQTKP?r@Zx@l@l@LVCVE`@Sd@aAf@m@^MhFCrGOxBCrEGbVOzLQ?SGG{@@wA@[YYOsB?NgI', NULL, '2018-12-05 14:12:46', '2018-12-05 14:14:32'),
(125, 'BRK979626', 155, 138, 138, 1, 'CANCELLED', 'USER', 'ددتددر', 'CASH', 0, 'YES', 4.00000000, NULL, 'No 7 , Goldis Tower , Sadeghie Square, Iran', 35.72166798, 51.33518893, 'Tehran Province, Tehran, Azadi walk road, Iran', 35.69911344, 0.00000000, 0.00000000, 0.00000000, 51.33797374, '2018-12-05 14:15:14', NULL, NULL, NULL, 0, 0, 0, 1, 'uz_yEilixHJJNBp@QtB[~BOfBGtCIrBOn@C`CCfAMlBKl@?n@ChADfC\\dC@fCOzBa@vF}@t@GnAQfDe@xPqA~AStAGbCQjM}@|@@d@HPLXNlA`At@x@\\v@Lv@X`Ap@~AZj@f@n@z@z@pApAh@|@Rh@Pt@XxALz@BtBDbIBvFCzEFVLRL?JQJ[Eu@QeDEsFGyL@gJAIHsAHc@HSN]R[Z[T]Ri@Jk@PsB@gBE}C', NULL, '2018-12-05 14:15:14', '2018-12-05 18:26:13'),
(126, 'BRK318085', 117, 0, 113, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'NO', 17.95700000, NULL, 'Mirpur Road, ঢাকা, বাংলাদেশ', 23.80668070, 90.36648790, 'Uttara, ঢাকা, বাংলাদেশ', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-12-05 14:49:52', '2018-12-05 22:00:00', NULL, NULL, 0, 0, 0, 0, 'wvhpCqupfPgAeIGu@IAMGGKCO?MFOFGOo@M_A@uARmB~@wHz@eGZ}BTuA^oA^w@`AeBlDaFfAsAn@{@lCuDt@_Ap@q@v@cAnDgEr@aA|AgCdBeDx@qB|AgFtDcMd@iBh@sCD[VBbC?x@Eb@Gx@SrBSlFe@zGc@t@AdABzDTzB@rAKl@KFEFGDSIgCO_DCy@?OlAkHJk@iCq@w@KqEc@mD_@yAQ{Cc@aDk@eDe@kKiBuBe@_Fw@oBo@uDoAa@Qq@c@c@g@gBoBoEaFyAgB[WqBcAcCqA}@c@{Ac@gBWaAGoDUqDSe@Im@EqF]eBWmIsBcFo@iJAwCCc@ABOFyJNkFCiBGuCCUNADCDCDSEk@C_@]g@e@y@c@eAWeAMkAA}@VyMHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBG?A', NULL, '2018-12-05 14:49:52', '2018-12-05 14:51:57'),
(127, 'BRK517834', 155, 137, 137, 1, 'CANCELLED', 'USER', 'رلا', 'CASH', 0, 'YES', 8.00000000, NULL, 'Tehran Province, Tehran, Kashani Pour, Iran', 35.71768210, 51.35532690, 'Tehran Province, Tehran, Ferdows, Ayatollah Kashani Blvd, Iran', 35.72570050, 0.00000000, 0.00000000, 0.00000000, 51.32373690, '2018-12-05 18:28:04', NULL, NULL, NULL, 0, 0, 0, 1, 'ib_yEugmxH{AJqDLgEHiBJf@eHRqCr@aLlCnCx@bAdAfAzB~Bx@~@rAdBfAdAfCjCBBFHFHNT\\h@h@z@hBxDz@lBn@hBjApDr@lDZbBhAbHVp@fAlIPxAf@vCnAjJ^lDPfDZtH@fFIpDa@zEeAtIc@fDiAlLw@nGc@fEg@bFo@jFuAvK_CxP[hC_@zByDvZmAzKg@nHMrBYtAYfCUvDO|EGl@IPo@j@g@Zg@Ti@x@Yp@Yz@Or@M^QNm@H{LuBqBm@}AQ}Bg@{GcAwA_@m@KkCo@sHwASG_Em@_@Eo@Mk@a@}Dq@c@QYa@s@_GEo@?WT]BYjAwCrAkEdAkD`CiInAiFdCoIjGiTVy@', NULL, '2018-12-05 18:28:04', '2018-12-05 18:28:49'),
(128, 'BRK339889', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Tehran Province, Tehran, Sattar Khan St, No. 503, Iran', 35.72066546, 51.35666873, 'Tehran Province, Tehran, Pardis 5, Iran', 35.72653419, 0.00000000, 35.71649940, 51.35537250, 51.35873973, '2018-12-05 18:29:50', NULL, '2018-12-05 18:32:42', '2018-12-05 18:32:48', 1, 1, 0, 1, 'ku_yEeqmxHkAWmC]gB]eBS_B_@MEuAe@s@Os@Ok@Sk@~BW~@s@xCG\\@r@Z`CXvBC?cEb@{ATQs@Ce@GaCy@KKMI[GgBIqAd@cCrBcI', NULL, '2018-12-05 18:29:50', '2018-12-05 18:33:02'),
(129, 'BRK119880', 155, 137, 137, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '15', 'Tehran Province, Tehran, 4th St, Iran', 35.71678650, 51.34976640, 'Tehran Province, Tehran, 1st St, Iran', 35.72438256, 0.00000000, 35.71649940, 51.35537250, 51.34707179, '2018-12-05 18:36:18', NULL, '2018-12-05 18:42:14', '2018-12-07 09:57:57', 1, 1, 0, 1, '}{~xEwflxHWvBQlBSd@k@a@s@IO?MMOYq@e@IGOHINcAeA?OESQMOAIBKHENALJVNHN?F?^Xw@zEaAfGOdAgBc@sBq@_Cs@wEuAmBc@cEsAi@OUASAQHMVC^GPc@JGYm@nB', NULL, '2018-12-05 18:36:18', '2018-12-07 09:58:05'),
(130, 'BRK129343', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Carrer de Pelai, 11, 08001 Barcelona, Spain', 41.38586280, 2.16685200, 'Plaça d\'Urquinaona, 11, 08010 Barcelona, Spain', 41.38845939, 0.00000000, 41.38586600, 2.16685220, 2.17306338, '2018-12-06 16:12:53', NULL, '2018-12-06 16:13:28', '2018-12-06 16:13:36', 1, 1, 0, 1, '}cr{FwefLh@}NA_@Ku@e@aAwAqAw@o@o@k@UWWs@Q_@k@g@UQIOeAy@OIqBgBS[', NULL, '2018-12-06 16:12:53', '2018-12-06 16:13:51'),
(131, 'BRK848083', 117, 0, 118, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'YES', 17.00000000, NULL, '253 Rd 9, Dhaka, Bangladesh', 23.83479870, 90.36792100, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-12-08 12:05:18', '2018-12-09 18:02:00', NULL, NULL, 0, 0, 0, 1, 'eenpCq~pfPKeHwA@sDHSiKKIK}GK@[qBq@_EuAHyB@AMC{A@UDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEJCL?FBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCAGGASDKFCHAVMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDSAKI}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@Jb@?R?jAE~@Et@GjB_@vEi@fIe@`IcCA}KPsEDuGFwBGS@KJQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2018-12-08 12:02:10', '2018-12-08 12:05:43'),
(132, 'BRK506214', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83555480, 90.36610290, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-12-08 12:06:01', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCespfPIoFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@Jb@?R?jAE~@Et@GjB_@vEi@fIe@`IcCA}KPsEDuGFwBGS@KJQF_@DwJ?DdIBlFHzUHrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAH@DAFE@G', NULL, '2018-12-08 12:06:01', '2018-12-08 12:07:03'),
(133, 'BRK937177', 160, 140, 140, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Lane 11 West, Bangladesh', 23.81256100, 0.00000000, 23.81033100, 90.41252100, 90.41310700, '2018-12-08 12:32:56', NULL, '2018-12-08 12:33:48', '2018-12-08 12:34:02', 1, 1, 0, 1, 'ymipCguyfPCoB}ADcEHoCF', NULL, '2018-12-08 12:32:56', '2018-12-08 12:35:06'),
(134, 'BRK806670', 117, 0, 140, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83554040, 90.36611190, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2018-12-09 07:20:19', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCgspfPImFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@Jb@?R?jAE~@Et@GjB_@vEi@fIe@`IcCA}KPsEDuGFwBGS@KJQF_@DwJ?DdIBlFHzUHrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAH@DAFE@G', NULL, '2018-12-08 13:07:36', '2018-12-09 07:20:28'),
(135, 'BRK711695', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Carrer del Lleó, 5, 08001 Barcelona, Spain', 41.38200020, 2.16482570, 'Carrer de Fontanella, 2B, 08010 Barcelona, Spain', 41.38831249, 0.00000000, 41.38368520, 2.16460660, 2.17291620, '2018-12-09 14:42:17', NULL, '2018-12-09 14:42:54', '2018-12-09 14:43:09', 1, 1, 0, 1, 'amq{FczeLeBbBk@j@`A`CgDQaDY_DS_CbDoIeMkEkGe@[s@}@oBoCYe@?CB?DCJMBQ?MGOKIA?Wo@cCmDq@aAOWbD{EzCuExAsBV_@', NULL, '2018-12-09 14:42:17', '2018-12-09 14:43:30'),
(136, 'BRK858355', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '11', 'Carrer de Joaquín Costa, 57, 08001 Barcelona, Spain', 41.38359710, 2.16451290, 'Carrer Comte d\'Urgell, 55, 08011 Barcelona, Spain', 41.38162195, 0.00000000, 41.38311620, 2.16520940, 2.15892009, '2018-12-09 14:52:37', NULL, '2018-12-09 14:57:06', '2018-12-09 15:08:53', 1, 1, 0, 1, 'yvq{F}weLVWf@e@bAtA`@p@`A`CgDQaDY_DS_ApAa@j@sCaEt@iApAhBf@XdAHvCRDJLRhF|HrI~LkBtC', NULL, '2018-12-09 14:52:37', '2018-12-09 15:09:38'),
(137, 'BRK298620', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '4', 'Carrer Comte d\'Urgell, 57, 08011 Barcelona, Spain', 41.38182550, 2.15893500, 'Ronda de la Universitat, 8, 08007 Barcelona, Spain', 41.38653710, 0.00000000, 41.38184000, 2.15893750, 2.16624353, '2018-12-09 15:12:28', NULL, '2018-12-09 15:13:08', '2018-12-09 15:17:59', 1, 1, 0, 1, 'qkq{FotdLw@hAuIaMkDeFoD_FsCgE{D}FXa@rBwCBJ', NULL, '2018-12-09 15:12:28', '2018-12-09 15:19:42'),
(138, 'BRK887481', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '22', 'Carrer de Balmes, 14, 08007 Barcelona, Spain', 41.38674980, 2.16622470, 'Sagrada Familia, Barcelona, Spain', 41.40420835, 0.00000000, 41.38663450, 2.16626720, 2.17484236, '2018-12-09 15:20:18', NULL, '2018-12-09 15:21:53', '2018-12-09 15:43:56', 1, 1, 0, 1, 'wir{FkafLXa@h@nBZjAP`AJZ\\r@pAhBj@bAN\\MR_ApAoIeMkEkGe@[s@}@cCkDEI?CFADCHO@QAKGOKGI?MDC@{E}GgDiFo@w@}B_DgDaFqCeE]a@QYOg@Ss@S}@BSCw@Qq@Wa@c@WOAO@MH}@a@SKc@[UWWc@k@y@{LoQ_DcF[b@sIrLq@f@k@j@QZm@z@cClDcAxAoDxEcAzAm@~@', NULL, '2018-12-09 15:20:18', '2018-12-09 15:52:16'),
(139, 'BRK512645', 161, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '5', 'Carrer de Provença, 15, 08025 Barcelona, Spain', 41.40334170, 2.17289210, 'Carrer de Sardenya, 312, 08013 Barcelona, Spain', 41.40255964, 0.00000000, 41.40342880, 2.17306730, 2.17441220, '2018-12-09 15:56:18', NULL, '2018-12-09 15:58:11', '2018-12-09 16:03:20', 1, 1, 0, 1, 'wqu{FwkgLzBdDDHgDzEeD}EpAsBpByC~CkE', NULL, '2018-12-09 15:56:18', '2018-12-09 16:03:48'),
(140, 'BRK670100', 154, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '10', 'Carrer de Berlín, 67, 08029 Barcelona, Spain', 41.38373760, 2.13952900, 'Carrer de Nicaragua, 37, 08029 Barcelona, Spain', 41.38287523, 0.00000000, 41.38341570, 2.13905490, 2.14115884, '2018-12-10 16:02:34', NULL, '2018-12-10 16:03:47', '2018-12-10 16:14:39', 1, 1, 0, 1, 'kvq{Fa|`LkAgCm@eA_FeHi@w@r@@fFR~@DdGFyB|C', NULL, '2018-12-10 16:02:34', '2018-12-10 16:50:17'),
(141, 'BRK612109', 154, 121, 121, 1, 'CANCELLED', 'PROVIDER', NULL, 'CASH', 0, 'YES', 1.00000000, NULL, 'Carrer de Nicaragua, 58I, 08029 Barcelona, Spain', 41.38400600, 2.14118800, 'Av. de Josep Tarradellas, 138, 08029 Barcelona, Spain', 41.39197782, 0.00000000, 0.00000000, 0.00000000, 2.14444555, '2018-12-10 16:50:48', '2018-12-11 18:30:00', NULL, NULL, 0, 0, 0, 1, 'uzq{FecaLoEoGi@w@o@cAwFg@}De@sCc@gFu@eFaAgAUUMiBe@', NULL, '2018-12-10 16:50:48', '2018-12-10 16:51:53'),
(142, 'BRK832124', 154, 121, 121, 1, 'CANCELLED', 'PROVIDER', '', 'CASH', 0, 'YES', 6.00000000, NULL, 'Carrer de Nicaragua, 58I, 08029 Barcelona, Spain', 41.38400600, 2.14118800, 'Carrer de Felip II, 162, 08027 Barcelona, Spain', 41.42443962, 0.00000000, 0.00000000, 0.00000000, 2.18195658, '2018-12-10 16:53:40', NULL, NULL, NULL, 0, 0, 0, 1, 'uzq{FecaLoEoGi@w@o@cA}HcLoBwC_FaHgDgFsDeFgDiFuI_MsDpFk@|@kA}GQiAqA}Hk@iEaAoFaA{FYeBOaA?QIeBK[Dg@?_@CWiAmGa@eCq@gAuAmBkC_EqI}LeDsEc@m@eCkEiD_FqIcMgEuFwCqEYa@{CiEaD}EqFqIwBcDmAe@q@_@gFoCoE{BiAe@mAm@GAS?SL{EbA_F~@_CRoBDq@?cEOiBOoC_@yAUw@Ai@Ja@VIFOWIIQGe@M{BUuJcA}AUy@cBQW', NULL, '2018-12-10 16:53:40', '2018-12-10 16:54:00'),
(143, 'BRK775142', 162, 121, 121, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, 'Avinguda Diagonal, 648B, 08017 Barcelona, Spain', 41.39033120, 2.13295110, 'Pl. de Catalunya - Bergara, 08002 Barcelona, Spain', 41.38662230, 0.00000000, 0.00000000, 0.00000000, 2.16938430, '2018-12-11 14:27:30', NULL, NULL, NULL, 0, 0, 0, 1, 'm_s{Fmr_Lh@bD|@}@qAsHyAeJq@eEqB_M}BwN}BeNJINQLa@B]Ek@Qc@YS]Ey@wEiAuH}@gFi@mD?_@Ca@a@kCmAoHgCwORUvDqF`OcTvI_MrE}GvBmD~CkEjDcFtAkBPa@T_@HW^?BkA\\gI?g@EYGa@K[S]_@XiCvB', NULL, '2018-12-11 14:27:30', '2018-12-11 14:28:11'),
(144, 'BRK250304', 162, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Avinguda Diagonal, 648B, 08017 Barcelona, Spain', 41.39032860, 2.13295280, 'Pl. de Catalunya - Bergara, 08002 Barcelona, Spain', 41.38662230, 0.00000000, 41.39031880, 2.13296660, 2.16938430, '2018-12-11 14:28:42', NULL, '2018-12-11 14:28:53', '2018-12-11 14:29:17', 1, 1, 0, 1, 'm_s{Fmr_Lh@bD|@}@qAsHyAeJq@eEqB_M}BwN}BeNJINQLa@B]Ek@Qc@YS]Ey@wEiAuH}@gFi@mD?_@Ca@a@kCmAoHgCwORUvDqF`OcTvI_MrE}GvBmD~CkEjDcFtAkBPa@T_@HW^?BkA\\gI?g@EYGa@K[S]_@XiCvB', NULL, '2018-12-11 14:28:42', '2018-12-11 14:29:42'),
(145, 'BRK756547', 162, 121, 121, 1, 'CANCELLED', 'PROVIDER', NULL, 'CASH', 0, 'YES', 3.00000000, NULL, 'Avinguda Diagonal, 648B, 08017 Barcelona, Spain', 41.39033410, 2.13293810, 'Carrer de Regàs, 16, 08006 Barcelona, Spain', 41.39896608, 0.00000000, 0.00000000, 0.00000000, 2.15186790, '2018-12-11 14:32:14', '2018-12-12 22:01:00', NULL, NULL, 0, 0, 0, 1, 'm_s{Fkr_Lh@`D|@}@qAsHyAeJq@eEqB_M}BwN}BeNJINQLa@B]Ek@Qc@dDuEoFiIcBiCu@jAqBnCo@bAc@y@uB}DwCsFiIeOuBqDiCpE', NULL, '2018-12-11 14:32:14', '2019-01-31 15:15:06'),
(146, 'BRK610492', 162, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Avinguda Diagonal, 577, 08029 Barcelona, Spain', 41.38954220, 2.13338510, 'Avinguda Diagonal, 557, 08029 Barcelona, Spain', 41.38995452, 0.00000000, 41.38945860, 2.13333500, 2.13600196, '2018-12-11 15:55:15', NULL, '2018-12-11 15:56:00', '2018-12-11 15:56:07', 1, 1, 0, 1, 'c|r{Fmt_L_CwN', NULL, '2018-12-11 15:55:15', '2018-12-11 15:56:18'),
(147, 'BRK167602', 162, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '6', 'Avinguda Diagonal, 587, 08017 Barcelona, Spain', 41.38931640, 2.13326810, 'Av. de Pau Casals, 12, 08021 Barcelona, Spain', 41.39360969, 0.00000000, 41.38950160, 2.13337720, 2.14328047, '2018-12-11 16:11:37', NULL, '2018-12-11 16:15:59', '2018-12-11 16:22:07', 1, 1, 0, 1, 'y{r{Fes_L{DiVYyAk@kDaAkGiAsGaCqOe@eCH]@a@Gi@S_@]QYAK@WLQRM^Cb@Bb@FR_@z@gAdC', NULL, '2018-12-11 16:11:37', '2018-12-11 16:23:34'),
(148, 'BRK438850', 158, 0, 137, 1, 'CANCELLED', 'USER', 'زردوو', 'CASH', 0, 'YES', 0.00000000, NULL, 'Tehran Province, Unnamed Road، Iran', 35.64123178, 51.48919165, '', 35.64123178, 0.00000000, 0.00000000, 0.00000000, 51.48919165, '2018-12-14 16:57:27', NULL, NULL, NULL, 0, 0, 0, 1, 'idpxEkngyH', NULL, '2018-12-14 16:57:04', '2018-12-14 16:57:43'),
(149, 'BRK623012', 158, 137, 137, 1, 'STARTED', 'NONE', NULL, 'CASH', 0, 'YES', 0.00000000, NULL, 'Tehran Province, Unnamed Road، Iran', 35.64123178, 51.48919165, 'Tehran Province, Unnamed Road، Iran', 35.64123178, 0.00000000, 0.00000000, 0.00000000, 51.48919165, '2018-12-14 16:57:59', NULL, NULL, NULL, 0, 0, 0, 1, 'idpxEkngyH', NULL, '2018-12-14 16:57:59', '2018-12-14 16:58:03'),
(150, 'BRK912769', 117, 0, 0, 1, 'CANCELLED', 'USER', 'y', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2018-12-20 06:24:09', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2018-12-20 06:24:09', '2018-12-20 06:24:22'),
(151, 'BRK839627', 165, 121, 121, 1, 'CANCELLED', 'USER', 'raining', 'CASH', 0, 'YES', 31.00000000, NULL, '4 Kay Cl, Cherrybrook NSW 2126, Australia', -33.72627860, 151.05352160, '250 Pitt St, Sydney NSW 2000, Australia', -33.87265840, 0.00000000, 0.00000000, 0.00000000, 151.20842710, '2018-12-23 06:23:47', NULL, NULL, NULL, 0, 0, 0, 1, 'jezlE_t}x[W_AQQ]Tg@\\kA~BiAbCl@f@fAdBnDlHjBvBr@x@\\p@r@nBPh@DD@F?H\\~@l@nBTnAFpAGfFAfBFf@Rt@^h@XVz@b@O`AQdBOdA]hCBF?VJt@BPd@Bd@E`@OrBwAhA}@vAyA|AsBt@m@dAi@rDaAlD_Bh@Ux@S|A]jAg@|F_E~BwAvCqAlGgC^KtAUj@GBCHCBB@?h@@fAKv@AbALtLtBVZv@y@hCsB~A{@~Cw@|@[tAUrA]rAo@nBmA|@Y~@CvAVtAZrEb@hBPv@Zb@LtBlAbCvAxAj@dATpAH|BO|JsCfFcAhAQDO@ADC|@ONMH[O}Bw@oJ_@iEsAyN@a@uAiM]cFE}FDeBb@}FfAmGrBuGjCmFjI_MxAaCbBaEf@kBh@}CPuB^}Hn@iNl@iGl@oEfC}NbBiK^kDJkB?c`@BiRP{Cz@}FfB_I^_DPqCBqDGoCuAcN{@cI[qFEwC@mCLuEb@qFrAaIbAwD~@oChB{DtDkGb@w@pBmClDcDzAgAdHqEnBcBpBcC~AsC`BuE~AsGrB_F`F}HnPeW`JkN`FyHvBsCtBmBfAs@bB}@dAa@dA_@j@KtAUjBKdGIhIMxC[PGZ?zCu@vF}AxCa@bIm@pC[nCi@fCu@|DiBjD_CtAoAnDiEnBeDpAwCxCkJ|@eCvCsFlC{D~IgMvAmCfBcEvD{L~@iCbBwD`BwClEkH`B_DhBmE|AcF`BwHxA}L|BkSdCePnC{O`@eFJiGGuDMmD]}DI_CCcEN}Ep@wGvEwZ^yEJqECeFMqDc@{Fm@sEuCeMq@cFI}AAwCXuDl@uCbAoCvAaCbAmAtAmAlEgCjH}DjI{EfBsAhDwC~E{DtCyBfB_BdBsBbAaBv@gBbA}C~@sEdAoGXsA`AsChAoBj@u@hAuAzBeBhCmAdD}@nDW~BF~ANh@JlDlA|DzBxEhCrBz@|CdAtEfAjCXzGl@tJZlHJbAGzCa@`GgAdYmIjD{@bCWvMYz_@gAdP_@rA?fEFhABnGRpAT`@Fp@VnAf@f@RpAXrA?rAW`Ak@^_@dA_Bf@mAfAaD`AaETcBFc@d@kAZi@hAmAbCcBVQTIREBLJXHRPRbAGlA?|@Pn@XjB|Bl@z@XJH?FFBJL`@rArA\\h@ZdBa@r@G^G`@Ub@}Ax@q@v@w@pBg@pAF~@]Vs@p@Wb@Kh@GtDJz@Xt@l@bAHRrAD@tCzHd@tDRQvE}AC', NULL, '2018-12-23 06:23:47', '2018-12-23 06:25:43'),
(152, 'BRK765781', 165, 121, 121, 1, 'CANCELLED', 'PROVIDER', 'yyhh', 'CASH', 0, 'YES', 5.00000000, NULL, '179 New Line Road,Cherrybrook,(null)', -33.72225694, 151.03481808, '4 Kay Cl, Cherrybrook NSW 2126, Australia', -33.72627900, 0.00000000, 0.00000000, 0.00000000, 151.05352200, '2018-12-23 20:58:37', NULL, NULL, NULL, 0, 0, 0, 1, '~iylEg_zx[wArBM@s@`AU`@c@bAu@zBq@bBo@lAcAlAuBhCaCrCaAr@cAh@oC|@oAf@e@Vm@f@g@f@{AjBc@j@gAdAa@gAGK_@YcAk@{AkAqA_ASWa@{@[cAII[{@EAGGAODIFED@NIFEFAVYZ_@FMjAaCrAwCVk@@QJ[?A?A?A@EBEDCJF@@`@Vl@j@p@d@nCnBj@x@\\\\fCzBhA`AlAbAj@\\`@SZSlAcArG_I^g@l@oAt@qBp@qB`@{@Vc@f@o@?IBGHMbAyAXi@fBwDtAiCdBuD~@yAh@m@Xe@HKDSFIJGJAD@HEj@Kf@INB|B]p@Kr@OpAa@f@S|@i@tAiA|CyCVW@KDETm@BKFE?E?EBICKNsADEVaCCI?ADa@J_BFo@COCUIWESAIGEIIQQYi@Qq@Go@DuCD}DKqAYsAm@gBOKS[A?C?CACGAIBI@QEc@]aAYs@_@o@{BaCc@u@eAwBcC_FY_@a@_@UQt@aBdA_C`@g@h@_@RMJHJRPr@', NULL, '2018-12-23 20:58:37', '2018-12-23 20:59:55'),
(153, 'BRK770735', 165, 121, 121, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 6.00000000, NULL, '502 Princes Hwy, Rockdale NSW 2216, Australia', -33.95241490, 151.13793250, 'Sydney Airport (SYD), Sydney NSW 2020, Australia', -33.93992280, 0.00000000, 0.00000000, 0.00000000, 151.17527640, '2018-12-24 00:33:06', NULL, NULL, NULL, 0, 0, 0, 1, 'lifnEqbny[xAh@JBHe@Ty@vBsGvGeSvCuIiMyAcI_AEBG?c@EA@EBGAEGBQDCDm@FWz@mLHeAcAUqH{AwAY^_F`@cFx@eFTqALsAB]?YAi@AIACAE@GDGHYFKBa@t@{JVkDl@{ITqDVwDRqCUYW[yAgCiEgHoGyKwA}Ba@g@}@{AiAkBM[k@aAeAeCWk@Oq@s@gFYkCKuAG}CBa@DYAgAGcUC_SAsHE_COaC[}B{@wFw@iF[i@QKQ?s@H{Dl@iARa@@O@YB]LOJENHl@`AlG]Hm@RHh@Lv@gFtABLaB`@PfA\\|BxArJ', NULL, '2018-12-24 00:33:06', '2018-12-24 00:36:06'),
(154, 'BRK163782', 165, 142, 142, 5, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', '179 New Line Road,Cherrybrook,(null)', -33.72233657, 151.03485695, '32-34 Macquarie Place, Mortdale NSW 2223, Australia', -33.93538500, 0.00000000, -33.97184029, 151.07750511, 151.16558000, '2018-12-26 11:00:46', NULL, '2018-12-26 11:03:05', '2018-12-26 11:04:54', 1, 1, 0, 1, 'pjylEi`zx[aBqAaH}EYOC@C@E?EEAOHKLDzBnB|ElDXBl@FrCyFnDeHlA{AXo@v@UtAKdEo@vDsAtF}Et@_ATe@Pc@?KJMP?d@Jd@?v@[bE{CnCiD|AoArDkAdGeCjD{@vMkIrIkDfBk@nB[HEf@@jCIhMrBt@PHJFLJKZ[Z]p@k@~B_BvF_BxBe@vAc@xD{BbAS`A?~Cr@|Hx@bAZtC~AfCxA|Af@~@NjBD|B[xDgA~EuAjF}@ZWt@QJMD{@U}Co@mHwAyOaA_Lm@wFa@sG?}Fv@yJzAcHpBwFpBwD~FyItDeG~AmE`@eBt@aHx@iRhAoMrFm\\z@oHH_L?cd@DkETwC|@iFnBiJ`@{GIuHmBgQm@}GSsJFqDRkE`@{D|AmItBsGvC_GbDsFtEoFzD{C~GmEv@q@bCiCnAoB~AuDlBmH~AwEpDiGpLyQnIoMrJcOhC}DlB{BnDmCpDaBrEw@`OUnFUrAQvAWrJgCrOuAjH}AdCaAvBiA`D}B`EgE|DuG`BeEpBuGvAqDxDyGfKqNpCeFnB}EnBsGbCaHlCsFjGiK~BaFdB}EfBeHfA_HdCmUbCmQbDqQt@eHPqECmFImDg@_GKwFDmDf@kHlDiUdAuHXcEJgGGkEaA}MqA}G{BeKa@}FBwC\\mDt@}C`A_C|CiEtAkAdCuA~EkC`JeFnFuDvK}ItF{EbD_FlByFjC_OfBaFr@aApCeDpBsApCmApDw@|CM~E^bBb@hClAjEbChI|D~Cz@vDr@fC\\vIp@dRZ|C]nDk@lJeC~TwGxFm@`|@}BdPPbDPnAXzCbAbCj@tACzAe@vAsAlB}DjC}Jt@sBv@oAvCcCbCaAhAMtABxLlB|Eh@bRlAd\\fBnOyAfKeB|ISjBNtQvBjDt@vPjBvP~B`RxBnIrAhKlBpL~AjKdAjJ|@~CF|H\\|E`@bXjEzMxAjCN|BKpBe@|BiArBmBjGgJzC}B`C{@|BYbBCdD`@lBp@|]rTrGhEpBnCr@jBr@vCz@~DVbC@xGUhHJjK`AlKrAxGdCrI|AbFxCpIx@fAhClBvAf@dBNhDClCZtBx@rCbCz@zApB~HnBvMpE`]PlCDxMJjh@VbGhA|JXdDD|C]dF}@xDuEnLwQr_@sCjF{B~CqEhFeChD}AxBgCxCiAb@gHkMoEiIcA_CcAiDo@aDoAuLq@cGYi@q@i@oCs@k@o@Gw@ZaCj@cBb@k@Ja@r@m@nBw@pDc@T@dDpA', NULL, '2018-12-26 11:00:46', '2018-12-26 11:06:15'),
(155, 'BRK164696', 165, 142, 142, 5, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Westfield Sydney,Sydney,(null)', -33.87023918, 151.20834815, 'Westfield Sydney, 182 Pitt Street, Sydney NSW 2000, Australia', -33.72240600, 0.00000000, -33.87026345, 151.20831757, 151.03480900, '2018-12-27 05:43:37', NULL, '2018-12-27 05:44:36', '2018-12-27 05:45:11', 1, 1, 0, 1, 'dkvmEmz{y[FpHRjFNdCAzA@hCLr@RZb@Rl@?|DWbAJd@J~@d@nAjA`@t@h@vA\\jBNlBVlGTpC`@hDj@bDJxAEjA[`B[p@u@|@}EnDiGhE}ArAy@xA[fAQdA[zD}@|CsAbEy@hDcAdGqFv[s@hEWfCBzBd@dCtC~KZnB?\\Ml@yAZuAXiAb@mChBuAjBq@tAQf@WdBIpAYhAeEjG_DtEgBvCiC`F{AlCmAnCmA~D{BfGyB~FoAvBiBfC{BbCqEjDcBjA_BfAcDxCyX`WoEnEoB|AeNrHqAz@e@R{H~DwBtAcDfC_MvJ{H|Hc@^s@t@qAdAyAr@w@TuAPoBBiA?gIIsAMmCk@{Dy@oBWeGS_IWqIQaBWy@[eAw@}@iAwAmDq@sC[eAu@qAa@a@aAi@uBi@_BQu@H}@VcAV{ATmDNiD]aD]]Ka@[_@c@m@{@i@g@s@U_AO}Cc@aAUoBYcH{@u@Es@Yc@[]k@uAuE_BiFWoAK[_BsFqJk\\_C{Hu@cCIAKAI@IBCTYjC[jCQ`Bw@`JuA`Pi@tBs@xAo@v@o@j@cF~CaCbBaBbBqA|BuAvD{@~D[hEMbFO~B]fBc@jAi@bAwAvAyAv@{DjA{@p@kAjAwBzCwAhCkAfCwB|G}AnFiAlCwAbC}BnC_ChC{CvB}BbCqCvDiClDU`@]q@Sa@]w@q@cCaANqAJ}FZqCTsBXiEfA_APIAaC\\oBRaMP}CD_DVcCh@}CnAgBhAwCrCuEdHiQlXgQlX{ArCa@`AsAnEk@~BeArDkBvDwBrCcBzA}DnCgEnC}BnBw@v@cCxCmB|CiChEsAvCs@rBm@nBsApGs@dGUbDIxCAzDZ~HnAtLn@fF\\lE@fGQpD[hCy@jEuAvGS|BMtD?t_@?|LQhFc@bFo@dEsA`HkClPe@lEWtD{@hQYdF[|B]~AcA`D_CrEiC|DkGtJkBdEkArD{@~Du@pGO~FJlFR`Db@vD|AtMNP@Lz@|FbA~Ix@rKKn@E`A}@BgBNcDf@oDp@mI~BeCVoBIyA[wAq@gD}BqAq@cASaBM{F_@sA[SIKHE@_@Io@K[@sDlBaBh@oARa@DaAL_Dv@_Bz@iCrBw@x@W[uLuBcAMw@@gAJGF_@DAB?@EBC?EAAAk@BMCiAJ_@JqAh@sInD}E|C_DxBkAf@}A\\y@Ri@TmD~A{A`@wA^eAh@sAlA_ArAwAxA}DtC[ZOFmARGNs@n@K?s@r@cDzCqA`AyAn@}Ab@eEn@i@XWPS`@QVQBGAu@Ve@b@s@fAuD`IwBlE', NULL, '2018-12-27 05:43:37', '2018-12-27 05:46:27'),
(156, 'BRK159412', 117, 0, 115, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'YES', 17.00000000, NULL, 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2019-01-03 23:15:51', NULL, NULL, NULL, 0, 0, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-03 23:13:44', '2019-01-03 23:16:32'),
(157, 'BRK315944', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.83554370, 90.36612110, 90.37954400, '2019-01-03 23:21:32', NULL, '2019-01-03 23:22:30', '2019-01-03 23:22:36', 1, 1, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-03 23:21:32', '2019-01-03 23:23:09'),
(158, 'BRK962255', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.84018500, 90.36137300, 90.37954400, '2019-01-03 23:34:45', NULL, '2019-01-03 23:36:25', '2019-01-03 23:36:53', 1, 1, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-03 23:34:45', '2019-01-03 23:37:21'),
(159, 'BRK126761', 117, 0, 0, 1, 'CANCELLED', 'USER', 'Cancel', 'CASH', 0, 'YES', 17.00000000, NULL, 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2019-01-03 23:37:40', NULL, NULL, NULL, 0, 0, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-03 23:37:40', '2019-01-03 23:37:53'),
(160, 'BRK864401', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, 'Uttara, Dhaka, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-03 23:53:18', NULL, '2019-01-03 23:54:15', '2019-01-03 23:54:20', 1, 1, 0, 1, 'w`mpCwvrfPtBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAaAuBQq@W{BCu@@gADgABYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2019-01-03 23:53:18', '2019-01-03 23:54:36'),
(161, 'BRK788164', 117, 0, 115, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'YES', 13.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2019-01-06 09:37:17', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@tBTMxAcBDw@EuBW}@Ig@k@MGMCkEc@cKcAYIq@UgA_@eAk@q@g@k@i@e@m@e@y@c@eAWeAMkAA}@JcGTmKD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2019-01-06 09:35:07', '2019-01-06 09:37:30'),
(162, 'BRK716559', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.83561340, 90.36607380, 90.37954400, '2019-01-06 09:37:45', NULL, '2019-01-06 09:38:20', '2019-01-06 09:38:31', 1, 1, 0, 1, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@tBTMxAcBDw@EuBW}@Ig@k@MGMCkEc@cKcAYIq@UgA_@eAk@q@g@k@i@e@m@e@y@c@eAWeAMkAA}@JcGTmKD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2019-01-06 09:37:45', '2019-01-06 09:38:48'),
(163, 'BRK682417', 170, 0, 120, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'YES', 13.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2019-01-06 11:02:10', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB|AElAEj@@TMJj@G`AI^k@x@y@r@m@\\cA`@e@?}AJkA^q@`BeBjBKD_El@aALY^aAv@}AbAf@dBRl@Tf@^l@z@fAd@x@jBrEdAlBfCjDz@`AtA~AHXjCf@tBTMxAcBDw@EuBW}@Ig@k@MGMCkEc@cKcAYIq@UgA_@eAk@q@g@k@i@e@m@e@y@c@eAWeAMkAA}@JcGTmKD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2019-01-06 11:01:08', '2019-01-07 16:47:35'),
(164, 'BRK578760', 172, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Unnamed Road, Dhaka 1205, Bangladesh', 23.73416980, 90.39275020, 'Azimpur Road, Dhaka, Bangladesh', 23.72388800, 0.00000000, 0.00000000, 0.00000000, 90.38712280, '2019-01-08 14:17:36', NULL, '2019-01-08 14:18:40', '2019-01-08 14:18:52', 1, 1, 0, 1, 'sozoCuyufP@nGrBFPCVABDLPNNn@b@ZOZOpAeAdA{@l@WfALl@@dADl@AlBMf@Ml@Yr@i@ZUn@h@X\\^l@DTzCzKJCJBHFBLANGJl@fDPjANjBT`GNClFgAzBk@~@QVBvBc@', NULL, '2019-01-08 14:17:36', '2019-01-08 14:19:25'),
(165, 'BRK869513', 173, 0, 2, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 9.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87541748, 79.92120492, 'Park Ln, Colombo 00500, Sri Lanka', 6.88752100, 0.00000000, 0.00000000, 0.00000000, 79.86814500, '2019-01-08 15:54:53', NULL, NULL, NULL, 0, 0, 0, 1, 'ex}h@}oxfNs@j@y@|@w@~@a@l@QPtDrDh@\\nAh@hBr@ZZP^Tl@Zh@RVVRf@Tj@Pf@T^ZNZRrARh@v@tAFRBx@?tAD`ABXB`@FRVr@h@lAPPf@Xp@Pv@Dp@LnAf@fAh@l@ZNPZdAtAdDZp@b@p@f@d@~@\\|@R\\LKPiAhBy@lA}@fAi@j@sApAoCnBiB~AgBtBeBlBuApAw@j@}A`Am@v@a@|@YvAq@rBWh@e@p@c@n@w@z@mBnB}AbBS`@@?B@BF@FA@XHXLZPZZ`AbA|@|@d@Vn@TtDvApEvA~@Z|Al@zAn@zA^pAVfCp@rAXbALhD`@c@`DIb@Id@c@nBKh@Br@Sd@s@xACVC|@Kl@UhAQ~@h@RrA`@d@V_@\\eAtAo@pAo@dB]lAW`ASb@e@`Bc@rAwA`F}@xCq@zA}CtGqBhE}DzIu@jAq@t@o@f@aBz@sC`AuE|AuB~@o@\\ILOL[Xi@n@q@hAWh@]vA{@fG_AhFa@xCg@nFMdBA`ABv@\\vCJ`A@TAVOp@GJi@x@a@d@QJaA\\cDvAgA`@gC`Ag@XWLKLGXAJML_@?q@@m@`@oB`BmDvCgAv@{ApAm@r@_@n@gAyA}ByE_AyA[LQPgB~D', NULL, '2019-01-08 15:43:10', '2019-01-08 15:55:41'),
(166, 'BRK888691', 173, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 8.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87560867, 79.92108200, 'Kirulapone, Colombo 00500, Sri Lanka', 6.88165800, 0.00000000, 0.00000000, 0.00000000, 79.87868300, '2019-01-08 15:59:38', NULL, NULL, NULL, 0, 0, 0, 1, '}}}h@mpxfNn@rAXd@w@~@a@l@QPtDrDh@\\nAh@hBr@ZZP^Tl@Zh@RVVRf@Tj@Pf@T^ZNZRrARh@v@tAFRBx@?tAD`ABXB`@FRVr@h@lAPPf@Xp@Pv@Dp@LnAf@fAh@l@ZNPZdAtAdDZp@b@p@f@d@~@\\|@R\\LKPiAhBy@lA}@fAi@j@sApAoCnBiB~AgBtBeBlBuApAw@j@}A`Am@v@a@|@YvAq@rBWh@e@p@c@n@w@z@mBnB}AbBS`@@?B@BF@FA@XHXLZPZZ`AbA|@|@d@Vn@TtDvApEvA~@Z|Al@zAn@zA^pAVfCp@rAXbALhD`@c@`DIb@Id@c@nBKh@Br@Sd@s@xACVC|@Kl@UhAQ~@h@RrA`@d@V_@\\eAtAo@pAo@dB]lAW`ASb@e@`Bc@rAwA`F}@xCq@zA}CtGqBhE}DzIu@jAq@t@o@f@aBz@sC`AuE|AuB~@o@\\ILOL[Xi@n@q@hAWh@]vA{@fG_AhFERO?sBFgJToC@?i@Dg@?k@Cs@DuB@YFYZo@DQAOMa@KSWGm@H', NULL, '2019-01-08 15:59:38', '2019-01-08 16:00:01'),
(167, 'BRK959887', 173, 121, 121, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87560864, 79.92108120, 'kotte Road B120, Sri Jayawardenepura Kotte 10100, Sri Lanka', 6.89525200, 0.00000000, 0.00000000, 0.00000000, 79.90596800, '2019-01-08 16:01:58', NULL, NULL, NULL, 0, 0, 0, 1, '}}}h@mpxfNn@rAXd@w@~@a@l@QPqCiDeA{@wAmAsB_AcCgASv@Q~@MpAOpBKr@Uv@}@|A{AfCU`@[XuAx@k@h@Yn@ETGv@AhAEnAGf@Qn@Ud@e@x@a@h@aApAa@x@q@rCGh@GhAOvBMlAa@pBg@`C]zBKbA[`A{@jB_@t@]hAEf@KXm@jAMXE\\H|CDl@HXNb@\\n@p@bBJd@Hn@?rAGpAOpBSfBCx@?tDgCCmA?yAIy@M{BMSE}FmAcB]gBc@yB_@]OUIaGgCuBm@oCw@k@[eBu@iA_@wC_AwBq@oA[', NULL, '2019-01-08 16:01:58', '2019-01-08 16:04:04'),
(168, 'BRK413377', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Mirpur DOHS, Dhaka, Bangladesh', 23.83646800, 90.36953920, 'Uttara, Dhaka, Bangladesh', 23.87585470, 0.00000000, 23.83548500, 90.36612000, 90.37954380, '2019-01-09 06:41:29', NULL, '2019-01-09 06:42:00', '2019-01-09 06:42:05', 1, 1, 0, 1, 'ypnpCcgqfPzAGKwEEsBCaACCEAK}GK@G[eAuGuAHyB@C{@Aw@LoA`@kAj@aAr@u@d@U^IfAA~@CDEhDK|GOtHCxFKn@C|@M@EBAFCHANBz@?nEYxBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMCAEIAIBKNKB?l@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAaAuBQq@W{BCu@@gADgABYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDM@QECEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJFvQLvY?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBH?FEBG?A', NULL, '2019-01-09 06:41:29', '2019-01-13 10:26:32'),
(169, 'BRK638021', 164, 0, 118, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 17.00000000, NULL, 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 0.00000000, 0.00000000, 90.37954400, '2019-01-09 14:34:33', '2019-01-09 20:41:00', NULL, NULL, 0, 0, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-09 14:33:29', '2019-01-09 14:34:48'),
(170, 'BRK256923', 175, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Dhaka,(null),(null)', 23.84018500, 90.36137300, 'Uttara, Dhaka, Bangladesh', 23.87585500, 0.00000000, 23.83548550, 90.36612060, 90.37954400, '2019-01-09 14:35:38', NULL, '2019-01-09 14:36:28', '2019-01-09 14:36:51', 1, 1, 0, 1, 'qgopCe|ofPNARGREVDZLP?FCDIDQJERCHE@GA[@MFGt@S|@Gh@Ij@SjBi@h@ERENCIcAQgJEaCg@a^IaFMqFMyDAw@B_@Ho@Lc@h@kAn@y@XYRMp@QdCCBCNE|CI|GOtHCxFKn@C|@M@EFCDCJ?F@B@z@?nEYxBKrCGlHYdE[xKcAKmBMgA]_CU{@QiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@VcBZcETwBZcCL{ABo@AqAKqA_@gCKc@MUwA{AaBmBc@k@gDgGk@mAKc@GECI?IBKNIB?j@Yt@k@bF}EtBaBbB{Ap@a@nAiA~AsAvEwDjAu@ZY^i@Tq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAa@w@_@}@Qq@W{BCu@FoCBYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuGeCkEy@_BaBqCkHiMaByBqAgAiAq@yBgAk@Sm@QoAWcAKeBMsC?aAFmBNuIx@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBqFfEoNzKkG~E_MnJyGnFqBhB?FCLGLKFW@GAEACEQR}C`CsHzFqKlIaTpPwGzEuA|@]PuAj@}Dd@kBJcA@}BEaEI}@CwJUqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@DzFBvFP``@@`G?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@CbAAn@oAASCaBm@iC_AKEFO^{@@@B@H?DEBI', NULL, '2019-01-09 14:35:38', '2019-01-09 14:37:02'),
(171, 'BRK197874', 173, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Pita Kotte,Pita Kotte,(null)', 6.87580123, 79.92139250, 'Pita Kotte, Sri Lanka', 6.89525200, 0.00000000, 6.87580192, 79.92123844, 79.90596800, '2019-01-11 04:24:07', NULL, '2019-01-11 04:24:40', '2019-01-11 04:25:59', 1, 1, 0, 1, 'e}}h@ivxfNwA?eELMDIHs@bBYKsAo@qAm@w@]IXSz@OfAQ`CIx@On@e@hAm@bAgBvC_@Z{A~@[ZSXOf@ETCj@A~AInAYhAWf@k@|@[`@eAxAIPUl@WfAUfAEb@IjBKrAEb@QhAa@nBIb@e@tBOrAKx@e@rA{@dB_@|@Oh@A^GROZm@jAITAj@HpCHj@J^Zn@b@`Ab@nAFVDz@CtAMhCQnAMtA?lA?bCGA{@AcB?u@?mBQwBMyAU_Ds@gCe@eA[qDo@iDwAaDsA}Bo@_Cs@i@YmCgAq@SyDoAgCq@A?', NULL, '2019-01-11 04:24:07', '2019-01-11 04:27:01'),
(172, 'BRK354232', 173, 0, 4, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 0.00000000, NULL, 'Pita Kotte,Pita Kotte,(null)', 6.87580005, 79.92139137, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87560864, 0.00000000, 0.00000000, 0.00000000, 79.92108120, '2019-01-11 15:10:23', NULL, NULL, NULL, 0, 0, 0, 1, '}~}h@crxfN^t@', NULL, '2019-01-11 04:29:38', '2019-01-11 15:10:43'),
(173, 'BRK394281', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-14 05:30:26', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-14 05:30:26', '2019-01-14 05:30:33'),
(174, 'BRK267798', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-14 05:45:11', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-14 05:45:11', '2019-01-14 05:45:21'),
(175, 'BRK767449', 117, 121, 121, 1, 'CANCELLED', 'USER', 'no', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-14 07:23:38', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-14 07:23:38', '2019-01-14 07:24:23'),
(176, 'BRK865979', 117, 0, 9, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-14 07:42:42', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-14 07:31:03', '2019-01-14 07:43:50');
INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `provider_id`, `current_provider_id`, `service_type_id`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `is_track`, `distance`, `travel_time`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `track_distance`, `track_latitude`, `track_longitude`, `d_longitude`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `deleted_at`, `created_at`, `updated_at`) VALUES
(177, 'BRK235847', 176, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '2', 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87560155, 79.92108036, 'Thissa Mawatha, Sri Lanka', 6.89047100, 0.00000000, 6.83730318, 79.96244404, 79.90348600, '2019-01-15 02:54:22', NULL, '2019-01-15 02:56:04', '2019-01-15 02:58:36', 1, 1, 0, 1, '}}}h@kpxfNn@pAXd@w@~@a@l@QPqCiDeA{@wAmAsB_AcCgASv@Q~@MpAOpBKr@Uv@}@|A{AfCU`@[XuAx@k@h@Yn@ETGv@AhAEnAGf@Qn@Ud@e@x@a@h@aApAa@x@q@rCGh@GhAOvBMlAa@pBg@`C]zBKbA[`A{@jB_@t@]hAEf@KXm@jAMXE\\H|CDl@HXNb@\\n@p@bBJd@Hn@?rAGpAOpBSfBCx@?tDgCCmA?yAIy@M{BMSE}FmAcB]gBc@yB_@]OUIuB}@', NULL, '2019-01-15 02:54:22', '2019-01-15 02:59:49'),
(178, 'BRK363204', 176, 0, 0, 5, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87569795, 79.92112945, 'Kotte Rd, Sri Jayawardenepura Kotte, Sri Lanka', 6.89047100, 0.00000000, 0.00000000, 0.00000000, 79.90348600, '2019-01-15 05:46:47', NULL, NULL, NULL, 0, 0, 0, 1, 'e~}h@{pxfNv@`BXd@w@~@a@l@QPqCiDeA{@wAmAsB_AcCgASv@Q~@MpAOpBKr@Uv@}@|A{AfCU`@[XuAx@k@h@Yn@ETGv@AhAEnAGf@Qn@Ud@e@x@a@h@aApAa@x@q@rCGh@GhAOvBMlAa@pBg@`C]zBKbA[`A{@jB_@t@]hAEf@KXm@jAMXE\\H|CDl@HXNb@\\n@p@bBJd@Hn@?rAGpAOpBSfBCx@?tDgCCmA?yAIy@M{BMSE}FmAcB]gBc@yB_@]OUIuB}@', NULL, '2019-01-15 05:46:47', '2019-01-15 05:47:17'),
(179, 'BRK802538', 177, 0, 0, 1, 'CANCELLED', 'NONE', 'Cancelled by Admin', 'CASH', 0, 'NO', 4.36700000, NULL, 'Mirihana Police Grounds, Nugegoda, Sri Lanka', 6.87309370, 79.89976630, 'Maharagama, Sri Lanka', 6.85221480, 0.00000000, 0.00000000, 0.00000000, 79.92486690, '2019-01-15 06:54:54', '2019-01-16 15:00:00', NULL, NULL, 0, 0, 0, 0, 'ql}h@}jtfNwBw@i@Wo@e@_CcCi@Ye@MA@CBE@GAEEAGFMF?@?Ra@|AcBlBoBv@{@b@o@d@q@Vi@p@sBXwA`@}@l@w@f@]t@c@v@k@tAqA~@cAjAwA`AgAhB_BnCoBrAqA`AeA~A{BhAiBh@w@rA{AfCwBhAs@nB}@zBy@b@MhC}@dKeD`@Ox@_@j@Uf@KbBWTI~@y@fD}CvFaFfDaCpBmAj@WzBo@h@Or@WzCgBbDiAzCaAv@SLE?SNm@Nm@B]A_@_@aC?k@@g@Ha@Pi@Zo@v@y@hAcBd@q@~@gALMiA}AEQPq@AG{@oAgAqAGI', NULL, '2019-01-15 06:54:54', '2019-01-15 06:56:39'),
(180, 'BRK493314', 164, 0, 0, 1, 'CANCELLED', 'USER', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, 'Mirpur Road, Bangladesh', 23.80663940, 90.36630460, 'Uttara, Dhaka, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-15 16:35:38', NULL, NULL, NULL, 0, 0, 0, 1, 'ovhpCktpfPiAsIIk@Ca@E?GCECIIEO?MDOJMLCL@LFHL@PCPKLz@xHRjAXpA\\bA~@rB~@nB|BvEh@hAdClE|AzC`A|A~@dBv@xAvFjKjEvHjBbDVHTXFX?V?D\\n@|DlHr@vAtBvDjDlH|@zBp@xBPPPHZDlDTN@?JCj@K|@Sx@WXaBx@qCz@iA^mAf@qB`AWTSVUb@[nAIfABlK@FGJM?UEcDaAg@MqBc@wAKoBBkAFmBP_F`@gBN_C\\yA\\oAf@oAr@o@b@y@p@{CzCkE~D_@Pe@NaAPuANsBLiCNkAJ}DL}@?w@I_De@{Cc@}A[eAYoBe@_Dq@eEkA_B]a@GcAIoAAq@Dq@NeDr@oBVmBD}BCgAMk@Qq@]wDoBkBwAkBsB{AaBm@i@yCqBkC_Bg@Q}Bc@o@EY?cAPk@Ta@XWXWh@K`@Eb@InBKv@Yp@c@f@_BhA_@X[ZoAnBi@v@a@d@qAxAq@b@i@RaAVsBX{EZkENgDDeEH{BIsCWYIi@Y_CwB{DsDkBoBc@_@w@c@_A]{A_@q@CwAFkAVoBt@mD~BwF|DwEhDg@Xi@Vg@Lm@Ha@?g@CkGiAcAS{CcAyHmCq@]oCqBiKkIcFaEwAqAoCaCsCyBeGoFmB_B_BcAq@[jBeEZqAZyDhDah@HcCRoCNaBqSeBQABS\\mFrAeRRcDC?EEIIGQ?GqAOcKy@oCS}AE}AOe@IwAYo@KSGk@a@USyBeB]SmA_@g@AGFKFY@KCIIGKAO@OFOLMHCHYLkBx@iLAYCCCIBSDGBAXoD~@aOXmDMoAOq@EEYMoBe@gCaAaAe@aAw@iAkA{@aAe@s@e@y@Sg@Ki@Eu@?sADi@Aq@_@?eMHqCDu@Ea@@e@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?@ADG@E', NULL, '2019-01-15 16:35:38', '2019-01-15 16:36:14'),
(181, 'BRK298197', 176, 0, 3, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87563060, 79.92109789, '185 N J V Cooray Rd, Sri Jayawardenepura Kotte 10100, Sri Lanka', 6.90284800, 0.00000000, 0.00000000, 0.00000000, 79.89975800, '2019-01-16 02:53:40', '2019-01-16 08:22:00', NULL, NULL, 0, 0, 0, 1, '_~}h@qpxfNg@}@IQIa@EuCCuB}ASS?gAP[?e@CMCIE]c@SOk@Uq@ArAaFt@_BpBwD^}@H_@BOEM@c@@o@JkBPaBBOCWISIIQGiAK{BIyBAmEDcBFaAJeCh@gA^eAf@iAl@sA|@i@d@k@n@{ItKs@x@o@h@kClB{OrLmCrB_AXkALcAE}@QcAo@a@_@]e@cAgBUKKAOA_@@e@^}@b@u@`@]d@Of@UjAo@vC_@jBGv@@x@VhEAv@Ej@Ih@]jAi@lBC^?d@ARMLgD`AeF`B}D~AiI~DsS`K{BpAiAp@_@r@U^KfBC^D~@Lp@v@bCDRDj@?j@ERO`@iA`BeB~AyArA}CrC}@bAW\\g@v@Wh@Up@_@pB]zC[jBEZt@L`Bf@nA^^RlBn@TH?L_@bARtBDRDAPCrE]Z?LBd@Pj@FF@B^BNONOJG@', NULL, '2019-01-16 02:50:32', '2019-01-16 02:53:46'),
(182, 'BRK308833', 176, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87562942, 79.92109729, '185 N J V Cooray Rd, Sri Jayawardenepura Kotte 10100, Sri Lanka', 6.90284800, 0.00000000, 0.00000000, 0.00000000, 79.89975800, '2019-01-16 02:55:35', NULL, NULL, NULL, 0, 0, 0, 1, '_~}h@qpxfNg@}@IQIa@EuCCuB}ASS?gAP[?e@CMCIE]c@SOk@Uq@ArAaFt@_BpBwD^}@H_@BOEM@c@@o@JkBPaBBOCWISIIQGiAK{BIyBAmEDcBFaAJeCh@gA^eAf@iAl@sA|@i@d@k@n@{ItKs@x@o@h@kClB{OrLmCrB_AXkALcAE}@QcAo@a@_@]e@cAgBUKKAOA_@@e@^}@b@u@`@]d@Of@UjAo@vC_@jBGv@@x@VhEAv@Ej@Ih@]jAi@lBC^?d@ARMLgD`AeF`B}D~AiI~DsS`K{BpAiAp@_@r@U^KfBC^D~@Lp@v@bCDRDj@?j@ERO`@iA`BeB~AyArA}CrC}@bAW\\g@v@Wh@Up@_@pB]zC[jBEZt@L`Bf@nA^^RlBn@TH?L_@bARtBDRDAPCrE]Z?LBd@Pj@FF@B^BNONOJG@', NULL, '2019-01-16 02:55:35', '2019-01-16 02:56:17'),
(183, 'BRK137468', 176, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87562806, 79.92109650, 'kotte Road B120, Sri Jayawardenepura Kotte 10100, Sri Lanka', 6.89525200, 0.00000000, 0.00000000, 0.00000000, 79.90596800, '2019-01-16 03:02:14', NULL, NULL, NULL, 0, 0, 0, 1, '_~}h@qpxfNp@vAXd@w@~@a@l@QPqCiDeA{@wAmAsB_AcCgASv@Q~@MpAOpBKr@Uv@}@|A{AfCU`@[XuAx@k@h@Yn@ETGv@AhAEnAGf@Qn@Ud@e@x@a@h@aApAa@x@q@rCGh@GhAOvBMlAa@pBg@`C]zBKbA[`A{@jB_@t@]hAEf@KXm@jAMXE\\H|CDl@HXNb@\\n@p@bBJd@Hn@?rAGpAOpBSfBCx@?tDgCCmA?yAIy@M{BMSE}FmAcB]gBc@yB_@]OUIaGgCuBm@oCw@k@[eBu@iA_@wC_AwBq@oA[', NULL, '2019-01-16 03:02:14', '2019-01-16 03:03:15'),
(184, 'BRK993637', 176, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '1', 'Dharmaratana Mawatha,Pita Kotte,(null)', 6.87566813, 79.92101633, 'Pita Kotte, Sri Lanka', 6.89047100, 0.00000000, 6.87620349, 79.92023101, 79.90348600, '2019-01-16 03:06:19', NULL, '2019-01-16 03:38:00', '2019-01-16 03:39:54', 1, 1, 0, 1, '{}}h@gpxfNl@lAXd@w@~@a@l@QPqCiDeA{@wAmAsB_AcCgASv@Q~@MpAOpBKr@Uv@}@|A{AfCU`@[XuAx@k@h@Yn@ETGv@AhAEnAGf@Qn@Ud@e@x@a@h@aApAa@x@q@rCGh@GhAOvBMlAa@pBg@`C]zBKbA[`A{@jB_@t@]hAEf@KXm@jAMXE\\H|CDl@HXNb@\\n@p@bBJd@Hn@?rAGpAOpBSfBCx@?tDgCCmA?yAIy@M{BMSE}FmAcB]gBc@yB_@]OUIuB}@', NULL, '2019-01-16 03:06:19', '2019-01-16 03:40:35'),
(185, 'BRK702098', 165, 0, 0, 5, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 30.00000000, NULL, '307 Pitt St, Sydney NSW 2000, Australia', -33.87366350, 151.20796090, '179 New Line Rd, Cherrybrook NSW 2126, Australia', -33.72233657, 0.00000000, 0.00000000, 0.00000000, 151.03485695, '2019-01-18 07:13:10', NULL, NULL, NULL, 0, 0, 0, 1, 'l}vmEmy{y[mBG`@gJ`@eFp@sHd@}FPgBy@LQBUCiCeBcA_@qAuAWWKa@Sm@e@u@aBoBIIEGDUSOY_@S[kB}Bo@Y}@QmA?_@DSJeB`@c@NmAl@_@^{@hAe@`A_@lA}@bEi@fBi@~Am@lAe@d@cAjAo@f@mAf@gANs@A{AWsBu@iBq@_AOuAGwA@eG?qF?}DNsKVgNZ{T`@sCFiBPwEhA_NxDwTjGqAVaAPqCTsB?iEW}BYeJ{@oEi@mCg@{DaAaEcBoCwAwBoAyDuAaCi@qCWwCAeCTqCl@}B~@qBnAkBhBmAdBWZg@lA_@tA[nAiAdHg@bCi@nBaAvBkB`D}AjByEfEsAfAUHaJfHqDzBgE`CsHfEwC`BqBrAkBpB}AfCWl@u@|Bg@rCUpD@~AFxAZzCt@zDvAhG`@vBr@tF\\vFHpD@lCGrD]zFu@vFuBlMq@dFc@tFItFFpDX`FL~BJ~BDxECtBO|DY~C{@bGiCdNgAjHeCrTsAlLm@hDq@tCaBnFwBjFcBbDiChEmCrEyB|EuAzDcBxFmAnDmApCoAbCyA~B_BxB}DvEqAfBc@n@mCxEgAhCmBdGiBfFkBpDsApB}BnCeA`AgBvAoAx@eCrAoDnAsBh@kDd@kKx@sBXeB^iD`A}@VUP_BX}@JuALsMNyCFwCXoCn@}Al@u@`@eBhAmAfAgArAgA|AaD~EmPfWcI`MyBfDoD|F_BlDwAdFgAhEe@pAs@~Ay@tAuAhB]^wBhBsGfEmCnB{ArAeBpB}AxByCtEoBxDm@xAw@~Bg@bBi@`Cg@rCs@pGYzGA|@FdGXvE~A~Np@tGFvA@tCEbCUbDs@zE_AzDs@dES|BI|F?`]@nGCrEUhFc@hE_AtFkBpKcBnKg@hFUpD{@hQWfE]~B_@~AeA~C{@fBoB~CoBzC}CxE}AfCqBvEqArEo@jDa@lDMdBI|FRxGlCpUNRJv@~@nGd@`En@lHXpEOp@Cr@aCNiATuFdBuCv@}Er@uAH_ABoBIyA[wAq@gD}BqAq@cASaBM{F_@sA[SIKHE@_@Io@K[@i@TiCvAaBh@oARa@DUAk@NmCp@QDw@\\g@\\iCrBw@x@W[uLuBcAMw@@gAJGF_@DABCBC@ICk@BMCiAJ_@JqAh@{D|AwCpA_CvA}AdA_DxBkAf@}A\\y@Ri@TmD~A{A`@wA^eAh@sAlA_ArAwAxA}DtC[ZOFs@PY@GNs@n@K?s@r@cDzCqA`AyAn@}Ab@eEn@i@XWPQVAHQVQBGAu@Ve@b@s@fAuD`IwBlE', NULL, '2019-01-18 07:13:10', '2019-01-18 07:14:10'),
(186, 'BRK326587', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 1.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Plot 15 Rd No 71, Dhaka 1212, Bangladesh', 23.80462400, 0.00000000, 0.00000000, 0.00000000, 90.41547200, '2019-01-21 05:29:39', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB|AElAEj@@TMlCqChCeDh@s@j@g@`@WVIlA]JOFKh@d@TNV?fC]N@FL@TNFTN^DjAD', NULL, '2019-01-21 05:29:39', '2019-01-21 05:30:41'),
(187, 'BRK162659', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83548500, 90.36611990, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:02:39', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCgspfPImFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2019-01-24 11:02:39', '2019-01-24 11:03:43'),
(188, 'BRK259826', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83547890, 90.36612870, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:04:03', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCispfPIkFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2019-01-24 11:04:03', '2019-01-24 11:04:30'),
(189, 'BRK829180', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 15.00000000, NULL, 'Shagufta New Rd, Dhaka 1216, Bangladesh', 23.82876310, 90.37697230, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:05:03', NULL, NULL, NULL, 0, 0, 0, 1, 'w`mpCwvrfPtBKrCGlHYdE[xKcAKmB]yCc@iBQiAAa@Dk@X{@p@_Bn@gBv@yBzDkGnBiDh@eARw@P_A`@gFp@{FL{ABo@AqAKqA_@gCKc@MUW]_A}@aBmBc@k@kAyBqBqD_@aACMEECSDKDEHAl@Yt@k@pAoApCmCtBaBbB{Ap@a@nAiA~AsAz@s@zCcCjAu@ZYTWHQTq@hA_GF{@CqCRcLDqDG{@MiAKw@[oAaAuBQq@W{BCu@@gADgABYX{AJuEHwDD{BIiAO{@c@sAi@iAmDuG_EkHkGsKaCgE}@qAc@g@qAgAiAq@yBgAyAe@oAWcAKeBMcB?o@?aAFaFd@aFb@_]dD}Gh@mIz@kCf@_FfAoCv@cCbAiE~B}CpBmIpG_R|NgIhGaHrFoDtCqBhBANELIHKDU?ICCEQR}C`CwS~O}KzIgLzIaD~BuA|@kAh@g@Rm@HoCZkBJcA@}BEaEIaDIsGOqGS@XPxD\\bIJ|DX~GLdC@bB?NKDQDaD?iF@?\\?x@FfJTnl@?r@K?wTT_E@wABArADbMFdGDh@TPBDYFYNY`@M`@ErBoAASCkFmBKEFO^{@BBD?DABABG@C', NULL, '2019-01-24 11:05:03', '2019-01-24 11:06:24'),
(190, 'BRK604358', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 17.00000000, NULL, '168 Rd No # 05, Dhaka, Bangladesh', 23.83405340, 90.36498680, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:16:22', NULL, NULL, NULL, 0, 0, 0, 1, 'wanpCqipfP?pAFpAb@?nABxFBVCx@C~MUD?@q@CeAEKAcFEuIA}SAaDGyAA_BE}@w@{FOiAq@qHUoBC?GCIOASHOLGJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCSBKFEFAZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHKqAMgASkAa@eAa@{@Ws@UqAMgB?u@JeCX{ADeBNuGDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{IaAeB_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAEyCBwE`@aMhAiYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCoDrC{EtDoKnIiF~DaK~HeAx@uFxEALCLIJKFU?GAGG}ApAaQzMkJnHmIrG{GfFcFrD{Ax@u@Zk@JcALwCXsBDyGOqDG{Pe@j@pMLfDZjJNtC@rBQF_@DwJ??d@D~JVbk@?xBuOReMFAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAeDiA{Ak@d@kAB@D@F?BCBE@E', NULL, '2019-01-24 11:16:22', '2019-01-24 11:16:55'),
(191, 'BRK794202', 131, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 21.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83551510, 90.36604970, 'Dhaka - Demra Hwy, Dhaka, Bangladesh', 23.71061020, 0.00000000, 0.00000000, 0.00000000, 90.43490920, '2019-01-24 11:17:14', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpC{rpfPIyFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@jAL|DVhC^nHt@rHr@jHj@`NrAh@BvSpBxP~AjC\\JEHAPA|RbBnJ|@rANvCThC?pAOlDc@|@Mf@[`Bi@n@Ux@[v@e@dAm@jE{CfBkAn@YvDm@lAEtABhBRbGn@pHl@tCXdBVjBNrDVhCV|NnAzBXjJx@hHj@V?p@CzB{@dBw@t@WRAn@OLEr@[zCyAfAi@r@c@tAs@tHyDrEcCzGeDj@_@|@]^InAI`AE|@Er@MrBDxBOnBSj@c@hAkAhA{Av@o@bA]jAUbAM`AEr@@|AHhCL`BCvDHlBb@hAJjCNlALDAJ?HBFH@JAJCDR~@^vAZh@PHf@Nt@PbALvCBzBA`BD|BDZCXI`@Y~@s@lAo@r@QdAObGm@z@Sd@WR[XMT?PJDFZPl@`@v@n@~AzAZPZHP@|@EjBMrDk@nBSpBU|ASZMJWF[Dy@fCMxBQ?A@C@A@a@TaRZgRGsCI}CPoEN}@f@iB~@kC\\]jAqBlAmBhAwAlAiA`As@pBmAnBaAlGwC|Ay@pAm@v@g@p@w@NUVw@TeAPgBHy@R{@Pi@Xi@d@y@Ne@Te@b@_ARo@dBeGp@uAzCgF`F}HtAwCd@s@~@kBn@qBf@cBXmA^_C~@{F^aBPkAICIGc@qBk@R', NULL, '2019-01-24 11:17:14', '2019-01-24 11:18:11'),
(192, 'BRK898796', 131, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83552330, 90.36604800, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:19:20', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpC{rpfPIyFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2019-01-24 11:19:20', '2019-01-24 11:20:25'),
(193, 'BRK544173', 131, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 17.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83551490, 90.36604730, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 0.00000000, 0.00000000, 90.37954380, '2019-01-24 11:20:54', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpCyrpfPI{Fk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHYyCSkAa@eAa@{@Ws@UqAMgBD}BD}@X{ADeBNuGDwACaBKy@U_Ao@aBmAaCyEmI}AyCiHaM_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAE_B?y@BwAJiE`@wJ|@iYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCkKhIoKnIqAbAcJbH{FpEuFxE?DANGJIHMDM?QK}ApAmEhDeP`MgOrLoIpGoDhCcAj@mAh@k@JcALwCXsBD{IQyIUqIUJbCl@tNZjJNtC@rBQF_@DwJ?DdILh]HrSuORkGByDBAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAkA_@uDuAf@iAB@J?DEBG?A', NULL, '2019-01-24 11:20:54', '2019-01-24 11:21:55'),
(194, 'BRK327584', 131, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 21.00000000, NULL, '333 Rd # 02, Dhaka, Bangladesh', 23.83553420, 90.36604990, 'Dhaka - Demra Hwy, Dhaka, Bangladesh', 23.71061020, 0.00000000, 0.00000000, 0.00000000, 90.43490920, '2019-01-24 11:30:15', NULL, NULL, NULL, 0, 0, 0, 1, 'ejnpC{rpfPIyFk@@sCDaEAWgRWyOS}FAqBDk@Ji@b@gAl@_AZ[XWf@Op@GrAAPA@AFCjJYdRMrAG~@QDEDCJ?NBlCGzDYvGObFUnCSzFg@rEc@As@Q_B]iCg@aCGm@@i@Ha@l@{Ar@iBl@mB\\y@j@{@xFoJb@{@Rg@TeAL{@b@yFn@mFHaB@e@EaB[yB]_BaAkAqC}C_@m@iCwEk@eAUm@CWCACCEG?I@MNID?VMn@c@v@m@bDcDnEwDj@e@p@a@bCuBlEsDvCsB\\a@Pc@lA_GL}@?qAA{ALiHJkHTeBXgAVu@r@yB@[EWQ[MKYGY@QFOLKRGZB^Pf@^|@PRXXl@d@x@^pBl@fALvMhAjIp@rEh@hIx@hDXxFf@fOzAdEZlHr@jAL|DVhC^nHt@rHr@jHj@`NrAh@BvSpBxP~AjC\\JEHAPA|RbBnJ|@rANvCThC?pAOlDc@|@Mf@[`Bi@n@Ux@[v@e@dAm@jE{CfBkAn@YvDm@lAEtABhBRbGn@pHl@tCXdBVjBNrDVhCV|NnAzBXjJx@hHj@V?p@CzB{@dBw@t@WRAn@OLEr@[zCyAfAi@r@c@tAs@tHyDrEcCzGeDj@_@|@]^InAI`AE|@Er@MrBDxBOnBSj@c@hAkAhA{Av@o@bA]jAUbAM`AEr@@|AHhCL`BCvDHlBb@hAJjCNlALDAJ?HBFH@JAJCDR~@^vAZh@PHf@Nt@PbALvCBzBA`BD|BDZCXI`@Y~@s@lAo@r@QdAObGm@z@Sd@WR[XMT?PJDFZPl@`@v@n@~AzAZPZHP@|@EjBMrDk@nBSpBU|ASZMJWF[Dy@fCMxBQ?A@C@A@a@TaRZgRGsCI}CPoEN}@f@iB~@kC\\]jAqBlAmBhAwAlAiA`As@pBmAnBaAlGwC|Ay@pAm@v@g@p@w@NUVw@TeAPgBHy@R{@Pi@Xi@d@y@Ne@Te@b@_ARo@dBeGp@uAzCgF`F}HtAwCd@s@~@kBn@qBf@cBXmA^_C~@{F^aBPkAICIGc@qBk@R', NULL, '2019-01-24 11:30:15', '2019-01-24 11:31:44'),
(195, 'BRK553665', 131, 120, 120, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', '220 Avenue 1, Dhaka, Bangladesh', 23.83413300, 90.36494630, 'Unnamed Road, Dhaka 1230, Bangladesh', 23.87585470, 0.00000000, 23.83405360, 90.36850940, 90.37954380, '2019-01-24 11:48:51', NULL, '2019-01-24 11:49:12', '2019-01-24 11:49:22', 1, 1, 0, 1, 'wanpCqipfP?pAFpAb@?nABxFBVCx@C~MUD?@q@CeAEKAcFEuIA}SAaDGyAA_BE}@w@{FOiAq@qHUoBC?GCIOASHOLGJ?F@B@lCGzDYdCGpCGbFUnCSzFg@rEc@As@Q_BMmAO{@Ou@WkAGm@@i@Ha@`BeEl@mB\\y@j@{@xFoJb@{@Rg@TeA\\cDRqC^_DNmAHaB@e@EaB[yBSkAWg@}CiDg@k@_@m@gDeGc@eAEWGGCSBKFEFAZMn@c@v@m@bDcDjAaAbCuBj@e@p@a@bCuBvAmAtBeBfBmAn@e@NQ^s@lA_GL}@?qAA{ALiHJkHKqAMgASkAa@eAa@{@Ws@UqAMgB?u@JeCX{ADeBNuGDwACaBKy@U_Ao@aBmAaCeGqKq@uAgF{IaAeB_C{Dq@{@q@q@{AeAcB{@iAg@i@SaASeAQ_BMgAEyCBwE`@aMhAiYpC{E^{Gn@{B\\kFjAeCn@_Cx@sDhBeDlBgEzCoDrC{EtDoKnIiF~DaK~HeAx@uFxEALCLIJKFU?GAGG}ApAaQzMkJnHmIrG{GfFcFrD{Ax@u@Zk@JcALwCXsBDyGOqDG{Pe@j@pMLfDZjJNtC@rBQF_@DwJ??d@D~JVbk@?xBuOReMFAvBJzP@hBD\\?JJFLNe@L[XSb@Gb@ClA?P_AAYAeDiA{Ak@d@kAB@D@F?BCBE@E', NULL, '2019-01-24 11:48:51', '2019-01-24 11:49:33'),
(196, 'BRK365379', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-24 12:37:47', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-24 12:37:47', '2019-01-24 12:38:18'),
(197, 'BRK527169', 117, 0, 0, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-24 12:38:29', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-24 12:38:29', '2019-01-24 12:41:11'),
(198, 'BRK486974', 179, 0, 131, 5, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 4.00000000, NULL, 'Putalisadak, Kathmandu 44600, Nepal', 27.70437470, 85.32264570, 'Pashupati Nath Road 44621, Kathmandu 44600, Nepal', 27.71046050, 0.00000000, 0.00000000, 0.00000000, 85.34870830, '2019-01-25 07:17:20', '2019-01-26 15:30:00', NULL, NULL, 0, 0, 0, 1, 'i_bhDuqwgOeCUqAKe@FkBAgAAo@F]LqC~Ba@\\YP[@i@Cm@CeFe@w@Kk@CM@GBAKCW@]RqDLkCJaETiEPwAd@yAnAcJh@qE\\gDDa@X}A^}A@c@sCgBoD}BmFwCgEcCOMEK@OzBaKJgAEO?o@RiCBk@GYMWa@_AUu@]yB@m@RiAR_Ai@k@}@gBa@y@OY[]q@k@eAuAQOPc@L_@Jg@NwAXuEJ_AJw@p@sB^kAPyBJmDvBbA`@HXFDV\\?\\UHcA?s@Bq@f@{A', NULL, '2019-01-25 07:13:59', '2019-01-25 07:17:31'),
(199, 'BRK292558', 179, 149, 149, 5, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Putalisadak, Kathmandu 44600, Nepal', 27.70437490, 85.32267930, 'Milan Chowk Bus Stop, Budhanilkantha 44600, Nepal', 27.72981130, 0.00000000, 27.70438540, 85.32267090, 85.35512640, '2019-01-25 07:36:43', NULL, '2019-01-25 07:38:41', '2019-01-25 07:38:52', 1, 1, 0, 1, 'k_bhDuqwgOcCUqAKe@FkBAgAAo@F]LqC~Ba@\\YP[@i@Cm@CeFe@w@Kk@CM@GBAKCW@]RqDLkCJaETiEPwAd@yAnAcJh@qE\\gDDa@X}A^}A@c@sCgBoD}BmFwCgEcCOMEK@OzBaKJgAEO?o@RiCBk@GYGMCj@G^GTMJU?QEc@Se@Wu@W{Cm@a@Ec@Gq@CgCYmBe@m@Os@Es@Gw@Q{A[eAQsBy@IGw@q@Y_@_@i@kAwBS]Qg@[kB[i@][c@YaCsA]Oy@YWIoBu@WKSSMUMuAAu@HeA@{@CcAC[UaASm@e@CeAKz@uCT}C`@oCCEEIKSYe@Ye@EImAk@oAm@k@Mi@GiE[A_@?OI?g@Ei@I{@Q}@_@i@SwAe@WEgBUCSMa@e@Y_Am@oAaAg@o@MKa@MEGEGKOYc@Se@Qg@]oACI]mAOq@gB_GMg@', NULL, '2019-01-25 07:36:43', '2019-01-25 07:39:17'),
(200, 'BRK670304', 179, 0, 131, 5, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 5.00000000, NULL, 'Putalisadak, Kathmandu 44600, Nepal', 27.70436980, 85.32266780, 'Jana Marg2, Kathmandu 44600, Nepal', 27.71921030, 0.00000000, 0.00000000, 0.00000000, 85.29552420, '2019-01-25 08:09:04', NULL, NULL, NULL, 0, 0, 0, 1, 'i_bhDuqwgOeCUqAKe@FkBAgAAo@F]LqC~Ba@\\YP[@i@Cm@CeFe@w@Kk@CM@KJUPUF]?w@O}@Um@GeENuEV?@?@ABCBA@CvIF|BtA|HB@DBFNCNKHUnAk@zFWbBBD?F?JEJIFK@ICGICKsCa@gLcAS@KDMLMX]xAGHsCtMYhAUpAKtAAnA@xBTjBDf@a@ReBXg@Dc@@k@XeGjDeCzAoDpByRnLoCxA_A`@mAb@a@N?@?BBRnAzBh@dA^bAZfAj@`DvBdNt@jFb@bCN`@DHf@FxAj@tCrAxFhCbDbBp@ZhBt@bElAXcAP[RK', NULL, '2019-01-25 08:07:00', '2019-01-25 08:10:06'),
(201, 'BRK909479', 180, 0, 149, 5, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 1.00000000, NULL, 'Ram Shah Path,Kathmandu,(null)', 27.70441286, 85.32262914, 'कमलादी, Kathmandu, Nepal', 27.70787800, 0.00000000, 0.00000000, 0.00000000, 85.31888700, '2019-01-27 07:48:35', '2019-01-27 14:02:00', NULL, NULL, 0, 0, 0, 1, 'q_bhDuqwgO}BUqAKe@FkBAgAAo@F]LqC~Ba@\\YP?tFChC@lAA|B', NULL, '2019-01-27 07:47:32', '2019-01-27 07:49:10'),
(202, 'BRK972478', 180, 0, 0, 5, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 1.00000000, NULL, 'Ram Shah Path,Kathmandu,(null)', 27.70441286, 85.32262914, 'कमलादी, Kathmandu, Nepal', 27.70787800, 0.00000000, 0.00000000, 0.00000000, 85.31888700, '2019-01-27 07:49:48', NULL, NULL, NULL, 0, 0, 0, 1, 'q_bhDuqwgO}BUqAKe@FkBAgAAo@F]LqC~Ba@\\YP?tFChC@lAA|B', NULL, '2019-01-27 07:49:48', '2019-01-27 07:50:05'),
(203, 'BRK308084', 180, 0, 118, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 2.00000000, NULL, 'Ram Shah Path,Kathmandu,(null)', 27.70441286, 85.32262914, 'Durbar Marg, Kathmandu, Nepal', 27.71073000, 0.00000000, 0.00000000, 0.00000000, 85.31762300, '2019-01-27 07:54:14', '2019-01-27 14:40:00', NULL, NULL, 0, 0, 0, 1, 'q_bhDuqwgO}BUqAKe@FkBAgAAo@F]LqC~Ba@\\YP[@i@Cm@CeFe@w@Kk@CM@KJUPUF]?w@O}@Um@GeENuEV?@?@ABCBA@CvIF|BtA|HB@DBB@fFl@~ARlCN', NULL, '2019-01-27 07:52:09', '2019-01-27 07:55:01'),
(204, 'BRK311787', 179, 0, 149, 5, 'SEARCHING', 'NONE', NULL, 'CASH', 0, 'YES', 6.00000000, NULL, 'Unnamed Road, Budhanilkantha 44600, Nepal', 27.73860490, 85.35782540, '', 27.70437470, 0.00000000, 0.00000000, 0.00000000, 85.32264570, '2019-01-28 04:07:20', NULL, NULL, NULL, 0, 0, 0, 1, 'iuhhDwl~gO`@?ZAd@DN^LV`@l@LHd@TTTXj@TFh@KNBHJL`@HPRLn@?^DVJ\\PLADMHgAdAjAFPL|@Ln@?ZMt@WIc@MaAK[h@QTG@KTgAvCAHBHbAnBZt@Rt@SRCL_@|BM~@B^AV?l@GzAI^Qb@EZ?p@GlAAh@TjANXBNPvELN^z@PPJH`Bt@JHBDvAjArA|@~@t@JFr@Zr@@TBdBj@JDPTl@dANLNFvA~@`Ax@PIVJj@TbBVj@@xG]h@@x@Rh@T`@ZX\\Nj@P~@TnCVn@f@nBVd@V\\z@h@l@Z|Av@rBtAzAj@dEfB`@VH@H@dDxAdChAnA^xAVZ@N?D@JHDNzB^bAh@d@Vz@\\fBnApBn@x@h@v@d@fAf@NFbARlD`Ad@PNJ@D?F|AHDBDHbAXnA@pANb@BTCPATBtBp@L]FC|Bj@`AXKb@ANDJNLfEbClFvCbIdFAb@I^U|@Y|AQdBzHrBhA\\BJQj@@JNHZJRPvGxGDnEErBWvCUbEEvF@Fd@JpAJdCT', NULL, '2019-01-28 04:06:19', '2019-01-28 04:07:20'),
(205, 'BRK155856', 181, 0, 121, 1, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 11.00000000, NULL, 'Kabete,Kabete,(null)', -1.23952373, 36.72228170, 'Westlands, Nairobi, Kenya', -1.26826400, 0.00000000, 0.00000000, 0.00000000, 36.81112100, '2019-01-28 07:16:29', NULL, NULL, NULL, 0, 0, 0, 1, 't}pFwpc_F@QECg@Q?GDWEIc@OIEDWNy@Bc@?e@Ju@J{ABgAFmBYDDmARwEN_Fb@qMz@{Tx@eTXoHL_FCk@]sBOeAEg@@kAFeAN_Ap@{BNw@NcA\\}D^uClAiFd@uBDc@Aq@E]q@iBg@iBCo@Dc@Pw@ZyA\\kAPeAj@sB`@oBNsARuBD}BAwDC_A?kCHgCH}@ZmBJ[p@mA|@gBhAoB~@{A~@gBl@_Ah@cAZ_AX{Al@yEdAqI\\kEh@yHHiBRcDZmGBo@HoAd@uBf@}C`@gB@O@wA@w@Do@Pw@t@kCh@cBf@mAv@eAz@cATaA@W@i@?QGcAGgBAeCE}A?UBQDMPYZg@`AqCXcAb@wAjBmFv@wB\\iAbBqGPe@T]\\YdDwBBG\\M@GDER]DGHIDsADeALoARaE`@cDLc@Xm@xAmB`BwBx@uAn@oArAaDfAsC`@mAXgBf@mE^aB`@oAHu@BU?w@PoBF]Xy@Rw@Pm@AC@G@ENGB?^g@\\UNe@n@eCd@oBd@_Bl@mAh@u@x@_Al@c@ZKb@ItA?VOf@Ut@_@LK?C?A@E@EHEJ?BBVCL@vE}B|BmAr@k@VW@WBMFK^GlCuC^[Xo@h@OfAy@fAgApAeAv@m@PGz@S`@QvBiB`K}IbJgIoDiE', NULL, '2019-01-28 07:15:24', '2019-01-28 10:48:00'),
(206, 'BRK674243', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Lane 11 West, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-28 10:57:47', NULL, '2019-01-28 10:58:19', '2019-01-28 10:58:24', 1, 1, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-28 10:57:47', '2019-01-28 10:58:51'),
(207, 'BRK242788', 180, 149, 149, 5, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Ram Shah Path,Kathmandu,(null)', 27.70448910, 85.32265755, 'Swayambhu, Kathmandu 44600, Nepal', 27.71921000, 0.00000000, 27.70436730, 85.32267060, 85.29552400, '2019-01-29 07:28:40', NULL, '2019-01-29 07:29:29', '2019-01-29 07:29:38', 1, 1, 0, 1, 'a`bhDyqwgOmBQqAKe@FkBAgAAo@F]LqC~Ba@\\YP[@i@Cm@CeFe@w@Kk@CM@KJUPUF]?w@O}@Um@GeENuEV?@?@ABCBA@CvIF|BtA|HB@DBFNCNKHUnAk@zFWbBBD?F?JEJIFK@ICGICKsCa@gLcAS@KDMLMX]xAGHsCtMYhAUpAKtAAnA@xBTjBDf@a@ReBXg@Dc@@k@XeGjDeCzAoDpByRnLoCxA_A`@mAb@a@N?@?BBRnAzBh@dA^bAZfAj@`DvBdNt@jFb@bCN`@DHf@FxAj@tCrAxFhCbDbBp@ZhBt@bElAXcAP[RK', NULL, '2019-01-29 07:28:40', '2019-01-29 07:30:05'),
(208, 'BRK278170', 117, 121, 121, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'Lane 11 West, Bangladesh', 23.82876310, 0.00000000, 23.81033100, 90.41252100, 90.37697230, '2019-01-30 12:09:50', NULL, '2019-01-30 12:10:27', '2019-01-30 12:10:33', 1, 1, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-30 12:09:50', '2019-01-30 12:11:02'),
(209, 'BRK277941', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-30 12:12:15', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-30 12:12:15', '2019-01-30 12:12:25'),
(210, 'BRK317221', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-30 12:13:57', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-30 12:13:57', '2019-01-30 12:14:06'),
(211, 'BRK364609', 117, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-30 12:16:00', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-30 12:16:00', '2019-01-30 12:16:17'),
(212, 'BRK561539', 117, 0, 120, 1, 'SEARCHING', 'NONE', NULL, 'CASH', 0, 'YES', 7.00000000, NULL, 'Lane 11 West,(null),(null)', 23.81033100, 90.41252100, 'House No-54, Road No-3, Natun Rasta, Kalapani, Mirpur-12/D, Dhaka 1216, Bangladesh', 23.82876310, 0.00000000, 0.00000000, 0.00000000, 90.37697230, '2019-01-30 12:20:18', NULL, NULL, NULL, 0, 0, 0, 1, 'ymipCguyfPCoB}ADcEH}JVcKNeDJ{AyBiFeHo@mAm@b@_@V~HnNh@rAZbALv@Dv@@z@S~IIlCKtFHRRj@Xb@VT\\N|APb@VJPLh@AXEXsAnDSz@En@KpAIhCQfI?vECpAa@fCe@|B]`Ac@h@m@`@mDjCuCdCaCrBqJlI}C~Cc@TEDCHj@jBrAnCp@nAfA~ArBxBx@`APXPn@`@nCH|@@`AAf@Ab@i@rF_@lDOxBOdAWhASh@mC~EqCrEo@`AWl@m@hB{AxDK`@?l@Db@\\xATdA`@vDDh@@x@iIt@oGf@oDNiGRqCHiGf@EPKJQBOGIQ@QHOLEJ?FBz@?nEYB?', NULL, '2019-01-30 12:19:06', '2019-01-30 12:20:18'),
(213, 'BRK336395', 183, 152, 152, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Calle Gobernador Eduardo Elordi 1–99,Neuquén,(null)', -38.94967612, -68.06015898, 'Calle Gobernador Eduardo Elordi 1–99, Neuquén, Neuquén, Argentina', -38.96749300, 0.00000000, -38.94948755, -68.06014131, -68.05950700, '2019-01-30 15:59:18', NULL, '2019-01-30 16:00:10', '2019-01-30 16:00:36', 1, 1, 0, 1, 'tjvlF~~k~K?jAPPRWbDeENM@[pEJl@A|E@dC?pFBxAA|CD`KBtE?pBAhHAhFJnMCvF@`DDpBB', NULL, '2019-01-30 15:59:18', '2019-01-30 16:41:45'),
(214, 'BRK162100', 183, 152, 152, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Calle Gobernador Eduardo Elordi 1–99,Neuquén,(null)', -38.94968203, -68.06007793, 'Calle Gobernador Eduardo Elordi 1–99, Neuquén, Neuquén, Argentina', -38.94950700, 0.00000000, -38.94938854, -68.05986279, -68.06648100, '2019-01-30 16:44:20', NULL, '2019-01-30 16:45:19', '2019-01-30 16:45:29', 1, 1, 0, 1, 'tjvlFn~k~K?zASVRPAzFAtGBtCCtG?|D', NULL, '2019-01-30 16:44:20', '2019-01-30 16:46:54'),
(215, 'BRK499126', 182, 121, 121, 1, 'PICKEDUP', 'NONE', NULL, 'CASH', 0, 'YES', 0.00000000, NULL, 'E1511,Kabete,(null)', -1.23907415, 36.72720161, 'Westlands, Nairobi, Kenya', -1.26826400, 0.00000000, -1.23909745, 36.72713183, 36.81112100, '2019-01-31 15:19:21', NULL, '2019-01-31 15:20:11', NULL, 0, 0, 0, 1, 'v`qF_id_Fo@eAWWWE]??KDaAFmBBgARyFh@uNd@aMhAyYPqFAk@I{@YiBOeAAm@@u@FeAN_At@cCPcAJgAZeD^uCp@uC`AiEDo@Ew@Qo@a@iAg@eBCc@Ba@ReAZyA\\kA^gBf@sBVmANsATyCBeDEkDA_BBgAFkBJeANcAHa@J[h@aAj@iAfB{CbByCf@{@\\k@b@{@Tg@`@gB^qC^mDd@kDRaBL{ATyC^qFJyBRcDb@qJHk@R{@VmAT_Bb@qBHe@?qA@}@Bc@Ha@VcAf@cBh@cB^_AVa@T[x@}@R[L_@Hy@@{@MqBCkDEqB?UBQHSb@o@To@l@aBXcAj@mBhAaDtAyDv@qClAuELYX_@rAcAvA}@TQBEZK@GDEb@o@DaBFeAJgADgAJiBLgAPwAPq@d@}@^e@~B{Cv@oA^q@n@qAn@_BxAuDRc@V_Ab@cDRoBP_Af@cBNo@De@Dk@?u@H}@L{@Xy@Li@Vy@AC?GHMFABAHIb@e@PKLa@XaAVgAbA{Df@gAv@oAx@_Al@c@h@QTCp@?b@?VOPI`Ac@VU?A?EBEFGJ?B@XAL@^S~Aw@nDeB~@m@p@o@@]HOLGRCp@s@tA{Ad@a@HON_@NCXKTOp@i@|@{@`Ay@pAeAn@Q\\Ih@YtD_DrDaDfJkIlAgAt@q@SUgAqAkAwAGI', NULL, '2019-01-31 15:19:21', '2019-01-31 15:20:18'),
(216, 'BRK291191', 184, 0, 0, 1, 'CANCELLED', 'USER', '', 'CASH', 0, 'YES', 1.00000000, NULL, 'Calle Gobernador Eduardo Elordi 2–100,Neuquén,(null)', -38.94969192, -68.06006277, 'Juan Bautista Alberdi 398-300, Q8300HLH Q8300HLH, Neuquén, Argentina', -38.95302800, 0.00000000, 0.00000000, 0.00000000, -68.05439200, '2019-01-31 21:31:22', '2019-01-31 18:33:00', NULL, NULL, 0, 0, 0, 1, 'tjvlFj~k~K?~APPRWbDeENM@[C}@Bk@AoFD{GAkGvE?xE@?wA', NULL, '2019-01-31 21:31:22', '2019-01-31 21:31:46'),
(217, 'BRK327590', 184, 152, 152, 1, 'COMPLETED', 'NONE', NULL, 'CASH', 1, 'YES', 0.00000000, '0', 'Calle Gobernador Eduardo Elordi 2–100,Neuquén,(null)', -38.94969694, -68.06010885, 'Calle Gobernador Eduardo Elordi 2–100, Neuquén, Neuquén, Argentina', -38.95302800, 0.00000000, -38.94976203, -68.06014825, -68.05439200, '2019-01-31 21:44:47', NULL, '2019-01-31 21:45:35', '2019-01-31 21:45:43', 1, 1, 0, 1, 'tjvlFt~k~K?tAPPRWbDeENM@[C}@Bk@AoFD{GAkGvE?xE@?wA', NULL, '2019-01-31 21:44:47', '2019-01-31 21:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_payments`
--

CREATE TABLE `user_request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed` double(10,2) NOT NULL DEFAULT '0.00',
  `distance` double(10,2) NOT NULL DEFAULT '0.00',
  `commision` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet` double(10,2) NOT NULL DEFAULT '0.00',
  `surge` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_commission` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_pay` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_payments`
--

INSERT INTO `user_request_payments` (`id`, `request_id`, `promocode_id`, `payment_id`, `payment_mode`, `fixed`, `distance`, `commision`, `discount`, `tax`, `wallet`, `surge`, `total`, `payable`, `provider_commission`, `provider_pay`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 20.00, 90.00, 0.00, 0.00, 0.00, 0.00, 0.00, 110.00, 110.00, 11.00, 99.00, '2018-09-22 14:54:49', '2018-09-22 14:54:49'),
(2, 11, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-22 16:26:41', '2018-09-22 16:26:41'),
(3, 12, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-22 17:40:15', '2018-09-22 17:40:15'),
(4, 16, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-22 17:50:27', '2018-09-22 17:50:27'),
(5, 23, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-26 13:18:22', '2018-09-26 13:18:22'),
(6, 24, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-27 09:40:12', '2018-09-27 09:40:12'),
(7, 25, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-28 00:02:08', '2018-09-28 00:02:08'),
(8, 26, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-28 11:03:26', '2018-09-28 11:03:26'),
(9, 27, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-28 11:05:34', '2018-09-28 11:05:34'),
(10, 28, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-28 11:14:54', '2018-09-28 11:14:54'),
(11, 29, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-09-28 11:34:27', '2018-09-28 11:34:27'),
(12, 38, NULL, NULL, NULL, 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 20.00, 2.00, 18.00, '2018-10-05 12:32:47', '2018-10-05 12:32:47'),
(13, 39, 1, NULL, NULL, 20.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, 10.00, 10.00, 2.00, 18.00, '2018-10-06 11:08:59', '2018-10-06 11:08:59'),
(14, 43, 1, NULL, NULL, 20.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, 10.00, 10.00, 0.00, 20.00, '2018-10-08 19:43:45', '2018-10-08 19:43:45'),
(15, 44, NULL, NULL, NULL, 22.10, 0.00, 2.00, 0.00, 1.00, 0.00, 2.10, 23.10, 23.10, 4.00, 16.00, '2018-10-08 20:06:41', '2018-10-08 20:06:41'),
(16, 46, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-10-08 20:21:08', '2018-10-08 20:21:08'),
(17, 50, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-10-14 18:14:40', '2018-10-14 18:14:40'),
(18, 54, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-10-27 11:30:11', '2018-10-27 11:30:11'),
(19, 67, 2, NULL, NULL, 51.58, 0.00, 5.00, 36.75, 2.50, 0.00, 1.58, 17.32, 17.32, 10.00, 40.00, '2018-11-06 09:25:59', '2018-11-06 09:25:59'),
(20, 68, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-08 07:07:55', '2018-11-08 07:07:55'),
(21, 69, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-08 07:22:11', '2018-11-08 07:22:11'),
(22, 70, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-08 07:25:30', '2018-11-08 07:25:30'),
(23, 70, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-08 07:25:37', '2018-11-08 07:25:37'),
(24, 71, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-08 07:33:55', '2018-11-08 07:33:55'),
(25, 75, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-13 07:47:52', '2018-11-13 07:47:52'),
(26, 76, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-13 09:19:37', '2018-11-13 09:19:37'),
(27, 77, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-13 09:26:39', '2018-11-13 09:26:39'),
(28, 78, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-13 09:46:53', '2018-11-13 09:46:53'),
(29, 79, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-13 10:39:00', '2018-11-13 10:39:00'),
(30, 80, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-19 12:23:32', '2018-11-19 12:23:32'),
(31, 82, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-20 06:25:07', '2018-11-20 06:25:07'),
(32, 82, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-20 06:25:16', '2018-11-20 06:25:16'),
(33, 83, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-20 08:08:33', '2018-11-20 08:08:33'),
(34, 92, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-29 11:52:02', '2018-11-29 11:52:02'),
(35, 93, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-30 22:40:00', '2018-11-30 22:40:00'),
(36, 94, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-30 22:42:24', '2018-11-30 22:42:24'),
(37, 96, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-30 22:54:24', '2018-11-30 22:54:24'),
(38, 98, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-11-30 22:59:44', '2018-11-30 22:59:44'),
(39, 99, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-01 10:05:52', '2018-12-01 10:05:52'),
(40, 101, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-01 10:35:38', '2018-12-01 10:35:38'),
(41, 105, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-01 15:59:23', '2018-12-01 15:59:23'),
(42, 106, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-01 16:24:10', '2018-12-01 16:24:10'),
(43, 108, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-02 21:09:32', '2018-12-02 21:09:32'),
(44, 109, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-02 21:10:53', '2018-12-02 21:10:53'),
(45, 110, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-02 21:12:36', '2018-12-02 21:12:36'),
(46, 113, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-03 19:22:59', '2018-12-03 19:22:59'),
(47, 114, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-04 12:48:00', '2018-12-04 12:48:00'),
(48, 115, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-04 17:49:32', '2018-12-04 17:49:32'),
(49, 116, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-04 17:55:00', '2018-12-04 17:55:00'),
(50, 120, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-05 13:58:05', '2018-12-05 13:58:05'),
(51, 120, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-05 13:58:10', '2018-12-05 13:58:10'),
(52, 128, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-05 18:32:48', '2018-12-05 18:32:48'),
(53, 130, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-06 16:13:36', '2018-12-06 16:13:36'),
(54, 129, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-07 09:57:57', '2018-12-07 09:57:57'),
(55, 133, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-08 12:34:02', '2018-12-08 12:34:02'),
(56, 135, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-09 14:43:09', '2018-12-09 14:43:09'),
(57, 136, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-09 15:08:53', '2018-12-09 15:08:53'),
(58, 137, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-09 15:17:59', '2018-12-09 15:17:59'),
(59, 138, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-09 15:43:56', '2018-12-09 15:43:56'),
(60, 139, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-09 16:03:20', '2018-12-09 16:03:20'),
(61, 140, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-10 16:14:39', '2018-12-10 16:14:39'),
(62, 144, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-11 14:29:17', '2018-12-11 14:29:17'),
(63, 146, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-11 15:56:07', '2018-12-11 15:56:07'),
(64, 147, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2018-12-11 16:22:07', '2018-12-11 16:22:07'),
(65, 154, NULL, NULL, NULL, 11.05, 0.00, 1.00, 0.00, 0.50, 0.00, 1.05, 11.55, 11.55, 2.00, 8.00, '2018-12-26 11:04:54', '2018-12-26 11:04:54'),
(66, 155, NULL, NULL, NULL, 11.05, 0.00, 1.00, 0.00, 0.50, 0.00, 1.05, 11.55, 11.55, 2.00, 8.00, '2018-12-27 05:45:11', '2018-12-27 05:45:11'),
(67, 157, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-03 23:22:36', '2019-01-03 23:22:36'),
(68, 158, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-03 23:36:53', '2019-01-03 23:36:53'),
(69, 160, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-03 23:54:20', '2019-01-03 23:54:20'),
(70, 162, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-06 09:38:31', '2019-01-06 09:38:31'),
(71, 164, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-08 14:18:52', '2019-01-08 14:18:52'),
(72, 168, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-09 06:42:05', '2019-01-09 06:42:05'),
(73, 170, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-09 14:36:36', '2019-01-09 14:36:36'),
(74, 170, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-09 14:36:46', '2019-01-09 14:36:46'),
(75, 170, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-09 14:36:51', '2019-01-09 14:36:51'),
(76, 171, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-11 04:25:59', '2019-01-11 04:25:59'),
(77, 177, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-15 02:58:36', '2019-01-15 02:58:36'),
(78, 184, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-16 03:39:54', '2019-01-16 03:39:54'),
(79, 195, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-24 11:49:22', '2019-01-24 11:49:22'),
(80, 199, NULL, NULL, NULL, 11.05, 0.00, 1.00, 0.00, 0.50, 0.00, 1.05, 11.55, 11.55, 2.00, 8.00, '2019-01-25 07:38:52', '2019-01-25 07:38:52'),
(81, 206, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-28 10:58:24', '2019-01-28 10:58:24'),
(82, 207, NULL, NULL, NULL, 11.05, 0.00, 1.00, 0.00, 0.50, 0.00, 1.05, 11.55, 11.55, 2.00, 8.00, '2019-01-29 07:29:38', '2019-01-29 07:29:38'),
(83, 208, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-30 12:10:33', '2019-01-30 12:10:33'),
(84, 213, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-30 16:00:36', '2019-01-30 16:00:36'),
(85, 214, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-30 16:45:29', '2019-01-30 16:45:29'),
(86, 217, NULL, NULL, NULL, 55.25, 0.00, 5.00, 0.00, 2.50, 0.00, 5.25, 57.75, 57.75, 10.00, 40.00, '2019-01-31 21:45:43', '2019-01-31 21:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_ratings`
--

CREATE TABLE `user_request_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL DEFAULT '0',
  `provider_rating` int(11) NOT NULL DEFAULT '0',
  `user_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_ratings`
--

INSERT INTO `user_request_ratings` (`id`, `request_id`, `user_id`, `provider_id`, `user_rating`, `provider_rating`, `user_comment`, `provider_comment`, `created_at`, `updated_at`) VALUES
(1, 1, 111, 111, 5, 5, 'sdsdfsdsdfds', 'bbjj', '2018-09-22 14:55:07', '2018-09-22 14:55:14'),
(2, 11, 115, 113, 3, 5, 'g', '', '2018-09-22 16:26:49', '2018-09-22 16:26:54'),
(3, 12, 116, 118, 5, 5, 'hjjjjj', '', '2018-09-22 17:40:38', '2018-09-22 17:40:39'),
(4, 16, 114, 118, 1, 5, 'fdsfsds', '', '2018-09-22 17:50:40', '2018-09-22 17:50:42'),
(5, 23, 114, 120, 2, 5, '', '', '2018-09-26 13:18:43', '2018-09-26 13:18:45'),
(6, 24, 114, 120, 5, 1, 'huu', '', '2018-09-27 09:40:35', '2018-09-28 10:59:35'),
(7, 25, 117, 121, 5, 5, 'bnnn', '', '2018-09-28 00:02:17', '2018-10-05 12:14:53'),
(8, 26, 124, 120, 1, 5, '', '', '2018-09-28 11:03:43', '2018-09-28 11:04:19'),
(9, 27, 124, 120, 1, 5, '', '', '2018-09-28 11:05:52', '2018-09-28 11:09:55'),
(10, 28, 124, 120, 0, 1, NULL, '', '2018-09-28 11:32:03', '2018-09-28 11:32:03'),
(11, 29, 127, 120, 0, 1, NULL, '', '2018-09-28 11:35:06', '2018-09-28 11:35:06'),
(12, 38, 117, 120, 5, 5, '', '', '2018-10-05 12:32:57', '2018-10-05 12:32:59'),
(13, 39, 118, 120, 5, 5, '', '', '2018-10-06 11:09:11', '2018-10-06 11:10:05'),
(14, 43, 117, 121, 5, 1, '', 'sfsdfsd', '2018-10-08 19:43:53', '2018-10-08 19:44:10'),
(15, 44, 117, 121, 1, 1, '', '', '2018-10-08 20:06:53', '2018-10-08 20:06:56'),
(16, 46, 117, 121, 1, 1, '', '', '2018-10-08 20:21:15', '2018-10-08 20:21:16'),
(17, 50, 134, 121, 5, 5, 'لا باس', 'لا باس', '2018-10-14 18:15:13', '2018-10-14 18:15:48'),
(18, 54, 138, 121, 1, 1, '', '', '2018-10-27 11:30:21', '2018-10-27 11:31:42'),
(19, 67, 131, 134, 5, 5, '', '', '2018-11-08 07:01:44', '2018-11-08 07:02:01'),
(20, 68, 131, 134, 5, 5, '', '', '2018-11-08 07:09:24', '2018-11-08 07:09:30'),
(21, 69, 131, 134, 5, 1, '', '', '2018-11-08 07:22:18', '2018-11-08 07:23:30'),
(22, 70, 131, 134, 5, 5, '', '', '2018-11-08 07:26:15', '2018-11-08 07:30:50'),
(23, 71, 131, 134, 5, 1, '', '', '2018-11-08 07:38:16', '2018-11-11 12:46:11'),
(24, 75, 118, 121, 5, 5, '', '', '2018-11-13 07:48:06', '2018-11-13 07:48:06'),
(25, 76, 117, 121, 5, 5, '', '', '2018-11-13 09:20:13', '2018-11-13 09:20:13'),
(26, 77, 117, 121, 5, 5, '', '', '2018-11-13 09:27:07', '2018-11-13 09:27:10'),
(27, 78, 117, 121, 5, 5, '', '', '2018-11-13 09:47:08', '2018-11-13 09:47:39'),
(28, 79, 117, 121, 1, 1, 'test', 'test', '2018-11-13 10:39:12', '2018-11-13 10:39:33'),
(29, 80, 121, 120, 5, 5, '', '', '2018-11-19 12:23:44', '2018-11-19 12:23:48'),
(30, 82, 131, 120, 5, 5, '', '', '2018-11-20 06:25:27', '2019-01-24 11:10:11'),
(31, 83, 121, 135, 1, 5, '', '', '2018-11-20 08:08:44', '2018-11-20 08:08:47'),
(32, 93, 155, 137, 5, 5, 'nice', 'good', '2018-11-30 22:40:20', '2018-11-30 22:40:26'),
(33, 94, 155, 137, 5, 5, '', '', '2018-11-30 22:42:35', '2018-11-30 22:42:36'),
(34, 96, 155, 137, 1, 1, '', '', '2018-11-30 22:54:43', '2018-11-30 22:54:44'),
(35, 98, 155, 137, 1, 1, '', '', '2018-11-30 23:00:00', '2018-11-30 23:00:01'),
(36, 99, 155, 137, 5, 5, 'خوب', '', '2018-12-01 10:06:29', '2018-12-01 10:06:32'),
(37, 101, 155, 137, 1, 1, '', '', '2018-12-01 10:35:54', '2018-12-01 15:15:40'),
(38, 105, 156, 121, 5, 5, 'test', 'test', '2018-12-01 15:59:48', '2018-12-01 15:59:53'),
(39, 106, 117, 121, 5, 1, 'good driver', 'test', '2018-12-01 16:24:42', '2018-12-01 16:24:58'),
(40, 108, 155, 137, 1, 1, '', '', '2018-12-02 21:09:53', '2018-12-02 21:09:55'),
(41, 109, 155, 137, 1, 1, '', '', '2018-12-02 21:11:07', '2018-12-02 21:11:14'),
(42, 110, 155, 137, 1, 1, '', '', '2018-12-02 21:12:46', '2018-12-02 21:12:47'),
(43, 113, 155, 137, 1, 1, '', '', '2018-12-03 19:23:05', '2018-12-03 19:23:08'),
(44, 114, 154, 121, 5, 5, 'Cool', 'cool', '2018-12-04 12:48:19', '2018-12-04 12:48:21'),
(45, 115, 155, 137, 5, 2, '', '', '2018-12-04 17:50:33', '2018-12-04 17:50:55'),
(46, 116, 155, 137, 5, 5, '', '', '2018-12-05 13:51:33', '2018-12-05 18:24:01'),
(47, 120, 155, 138, 5, 5, 'dgh', '', '2018-12-05 13:58:39', '2018-12-05 13:58:48'),
(48, 128, 155, 137, 5, 5, '', '', '2018-12-05 18:32:58', '2018-12-05 18:33:02'),
(49, 130, 154, 121, 4, 5, '', '', '2018-12-06 16:13:49', '2018-12-06 16:13:51'),
(50, 129, 155, 137, 5, 5, '', '', '2018-12-07 09:58:04', '2018-12-07 09:58:05'),
(51, 133, 160, 140, 1, 5, '', '', '2018-12-08 12:34:43', '2018-12-08 12:35:06'),
(52, 135, 154, 121, 5, 5, '', '', '2018-12-09 14:43:30', '2018-12-09 14:43:30'),
(53, 136, 154, 121, 5, 5, '', '', '2018-12-09 15:09:37', '2018-12-09 15:09:38'),
(54, 137, 154, 121, 5, 5, '', '', '2018-12-09 15:18:51', '2018-12-09 15:19:42'),
(55, 138, 154, 121, 1, 5, '', '', '2018-12-09 15:44:09', '2018-12-09 15:52:16'),
(56, 139, 161, 121, 5, 5, '', '', '2018-12-09 16:03:30', '2018-12-09 16:03:48'),
(57, 140, 154, 121, 1, 1, '', '', '2018-12-10 16:14:58', '2018-12-10 16:50:17'),
(58, 144, 162, 121, 5, 5, '', '', '2018-12-11 14:29:40', '2018-12-11 14:29:42'),
(59, 146, 162, 121, 5, 1, '', '', '2018-12-11 15:56:12', '2018-12-11 15:56:18'),
(60, 147, 162, 121, 5, 5, '', '', '2018-12-11 16:22:36', '2018-12-11 16:23:34'),
(61, 154, 165, 142, 5, 5, '1', '5', '2018-12-26 11:05:24', '2018-12-26 11:06:15'),
(62, 155, 165, 142, 4, 5, '4', '', '2018-12-27 05:45:39', '2018-12-27 05:46:27'),
(63, 157, 117, 121, 5, 5, 'jbjkbk', 'hjjj', '2019-01-03 23:23:03', '2019-01-03 23:23:09'),
(64, 158, 117, 121, 4, 5, 'good', 'good', '2019-01-03 23:37:18', '2019-01-03 23:37:21'),
(65, 160, 117, 121, 5, 5, 'vdsfsfsd', '', '2019-01-03 23:54:29', '2019-01-03 23:54:36'),
(66, 162, 117, 121, 5, 5, '', '', '2019-01-06 09:38:41', '2019-01-06 09:38:48'),
(67, 164, 172, 121, 5, 1, 'sdfsd ', 'sdfsdfsdfsdfsdf', '2019-01-08 14:19:11', '2019-01-08 14:19:25'),
(68, 168, 117, 121, 5, 5, '', 'bbhh', '2019-01-09 06:42:21', '2019-01-13 10:26:32'),
(69, 170, 175, 121, 1, 5, '', '', '2019-01-09 14:37:01', '2019-01-09 14:37:02'),
(70, 171, 173, 121, 5, 3, 'great', '', '2019-01-11 04:26:57', '2019-01-11 04:27:01'),
(71, 177, 176, 121, 4, 5, '', '', '2019-01-15 02:59:10', '2019-01-15 02:59:49'),
(72, 184, 176, 121, 5, 3, '', '', '2019-01-16 03:40:14', '2019-01-16 03:40:35'),
(73, 195, 131, 120, 5, 5, '', '', '2019-01-24 11:49:32', '2019-01-24 11:49:33'),
(74, 199, 179, 149, 5, 5, '', '', '2019-01-25 07:39:05', '2019-01-25 07:39:17'),
(75, 206, 117, 121, 5, 5, '', '', '2019-01-28 10:58:41', '2019-01-28 10:58:51'),
(76, 207, 180, 149, 5, 5, '', '', '2019-01-29 07:29:54', '2019-01-29 07:30:05'),
(77, 208, 117, 121, 5, 5, '', '', '2019-01-30 12:10:52', '2019-01-30 12:11:02'),
(78, 213, 183, 152, 5, 5, '', '', '2019-01-30 16:41:40', '2019-01-30 16:41:45'),
(79, 214, 183, 152, 5, 5, 'fine', '', '2019-01-30 16:46:29', '2019-01-30 16:46:54'),
(80, 217, 184, 152, 5, 1, '', '', '2019-01-31 21:46:30', '2019-01-31 21:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `account_password_resets`
--
ALTER TABLE `account_password_resets`
  ADD KEY `account_password_resets_email_index` (`email`),
  ADD KEY `account_password_resets_token_index` (`token`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispatchers_email_unique` (`email`);

--
-- Indexes for table `dispatcher_password_resets`
--
ALTER TABLE `dispatcher_password_resets`
  ADD KEY `dispatcher_password_resets_email_index` (`email`),
  ADD KEY `dispatcher_password_resets_token_index` (`token`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fleets_email_unique` (`email`);

--
-- Indexes for table `fleet_password_resets`
--
ALTER TABLE `fleet_password_resets`
  ADD KEY `fleet_password_resets_email_index` (`email`),
  ADD KEY `fleet_password_resets_token_index` (`token`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`);

--
-- Indexes for table `provider_devices`
--
ALTER TABLE `provider_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_documents`
--
ALTER TABLE `provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dispatchers`
--
ALTER TABLE `dispatchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `provider_devices`
--
ALTER TABLE `provider_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `provider_documents`
--
ALTER TABLE `provider_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=876;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
