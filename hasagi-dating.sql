-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for hasagi-dating
CREATE DATABASE IF NOT EXISTS `hasagi-dating` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hasagi-dating`;

-- Dumping structure for table hasagi-dating.connect
CREATE TABLE IF NOT EXISTS `connect` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `object` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_connect_likes` (`id_user`),
  KEY `FK_connect_likes_2` (`object`),
  CONSTRAINT `FK_connect_likes` FOREIGN KEY (`id_user`) REFERENCES `likes` (`id_user`),
  CONSTRAINT `FK_connect_likes_2` FOREIGN KEY (`object`) REFERENCES `likes` (`user_like`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hasagi-dating.connect: ~2 rows (approximately)
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
REPLACE INTO `connect` (`id`, `id_user`, `object`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, '2019-10-13 19:21:24', '2019-10-13 19:21:24'),
	(2, 2, 1, NULL, NULL);
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hasagi-dating.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `images_url` varchar(255) NOT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_mess` bigint(20) unsigned DEFAULT NULL,
  `type` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_images_users` (`id_user`),
  KEY `FK_images_tinnhan` (`id_mess`),
  CONSTRAINT `FK_images_tinnhan` FOREIGN KEY (`id_mess`) REFERENCES `mess` (`id_mess`),
  CONSTRAINT `FK_images_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hasagi-dating.images: ~2 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
REPLACE INTO `images` (`id`, `images_url`, `id_user`, `id_mess`, `type`) VALUES
	(1, 'abc/xyz', 3, NULL, b'0'),
	(2, 'xyz/abc', NULL, 1, b'1');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `user_like` bigint(20) unsigned NOT NULL,
  `luotlike` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_likes_users` (`id_user`),
  KEY `FK_likes_users_2` (`user_like`),
  CONSTRAINT `FK_likes_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_likes_users_2` FOREIGN KEY (`user_like`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hasagi-dating.likes: ~4 rows (approximately)
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
REPLACE INTO `likes` (`id`, `id_user`, `user_like`, `luotlike`) VALUES
	(1, 3, 1, 1),
	(2, 1, 3, 1),
	(3, 2, 1, 1),
	(4, 1, 2, 1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.mess
CREATE TABLE IF NOT EXISTS `mess` (
  `id_mess` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noidung` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_connect` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mess`),
  KEY `FK_tinnhan_connect` (`id_connect`),
  CONSTRAINT `FK_tinnhan_connect` FOREIGN KEY (`id_connect`) REFERENCES `connect` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hasagi-dating.mess: ~2 rows (approximately)
/*!40000 ALTER TABLE `mess` DISABLE KEYS */;
REPLACE INTO `mess` (`id_mess`, `noidung`, `id_connect`, `created_at`, `updated_at`) VALUES
	(1, 'gfdgdfg gfdgfdgfd fdgdfg', 2, '2019-10-15 15:12:41', '2019-10-15 15:12:44'),
	(2, 'gfdgre ưaass', 1, '2019-10-15 15:12:43', '2019-10-15 15:12:46');
/*!40000 ALTER TABLE `mess` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hasagi-dating.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_10_12_152043_create_tinnhan_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hasagi-dating.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.requests
CREATE TABLE IF NOT EXISTS `requests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `min_age` int(2) NOT NULL DEFAULT '18',
  `max_age` int(2) NOT NULL DEFAULT '45',
  `max_range` int(5) NOT NULL DEFAULT '1000',
  `gender` tinyint(4) NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_request_users` (`id_user`),
  CONSTRAINT `FK_request_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hasagi-dating.requests: ~3 rows (approximately)
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
REPLACE INTO `requests` (`id`, `id_user`, `min_age`, `max_age`, `max_range`, `gender`, `created_at`, `updated_at`) VALUES
	(1, 1, 18, 21, 11, 1, NULL, '2019-10-17 07:46:31'),
	(2, 2, 18, 45, 1000, 3, NULL, NULL),
	(3, 3, 18, 45, 1000, 3, NULL, NULL);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;

-- Dumping structure for table hasagi-dating.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `report` int(5) DEFAULT '0',
  `quyen` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hasagi-dating.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `DOB`, `address`, `description`, `gender`, `remember_token`, `active`, `report`, `quyen`, `created_at`, `updated_at`) VALUES
	(1, 'vũ văn dương', '0123456789', 'duong@gmail.com', '2019-10-12 22:32:37', '$2y$10$qVyz8LEEeSmzG7bL30mbe.ZD05aRVN6nqrE3t2Ju3Vf2Q9ia8QaGi', '1999-02-09', '12/13/14', NULL, 0, NULL, 1, 0, 1, NULL, '2019-10-17 07:09:56'),
	(2, 'nguyễn đỗ đình sang', '114', 'sangmama@gmail.com', '2019-10-13 00:15:28', '$2y$10$qVyz8LEEeSmzG7bL30mbe.ZD05aRVN6nqrE3t2Ju3Vf2Q9ia8QaGi', '1994-10-14', '113/114 , abc xyz', 'Là con gái thật tuyệt', 1, NULL, 1, 3, 0, NULL, '2019-10-17 07:27:28'),
	(3, 'nguyễn đức minh', '113', 'minhml@gmail.com', '2019-10-13 01:05:07', '$2y$10$qVyz8LEEeSmzG7bL30mbe.ZD05aRVN6nqrE3t2Ju3Vf2Q9ia8QaGi', '2001-10-13', '11/12/13 , sdfjshga, fdsfjgsajf ,fds fjasdf', 'hasagi xin tài trợ chương trình này', 2, NULL, 0, 0, 0, NULL, '2019-10-17 07:27:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
