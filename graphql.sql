-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.25-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for graphql
CREATE DATABASE IF NOT EXISTS `graphql` /*!40100 DEFAULT CHARACTER SET latin2 COLLATE latin2_croatian_ci */;
USE `graphql`;

-- Dumping structure for table graphql.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin2_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.city: ~3 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Beograd'),
	(2, 'Novi Sad'),
	(3, 'Podgorica');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table graphql.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin2_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.person: ~1 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `name`) VALUES
	(1, 'Dusko');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Dumping structure for table graphql.registration
CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registration_year_id` int(11) NOT NULL,
  `to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_registration_registration_year` (`registration_year_id`),
  CONSTRAINT `FK_registration_registration_year` FOREIGN KEY (`registration_year_id`) REFERENCES `registration_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.registration: ~3 rows (approximately)
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`id`, `from`, `registration_year_id`, `to`) VALUES
	(1, '2020-02-18 14:55:09', 1, '2020-02-18 14:30:44'),
	(2, '2020-02-18 14:55:10', 1, '2020-02-18 14:30:58'),
	(3, '2020-02-18 14:55:10', 1, '2020-02-18 14:31:14');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;

-- Dumping structure for table graphql.registration_year
CREATE TABLE IF NOT EXISTS `registration_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(50) COLLATE latin2_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.registration_year: ~2 rows (approximately)
/*!40000 ALTER TABLE `registration_year` DISABLE KEYS */;
INSERT INTO `registration_year` (`id`, `year`) VALUES
	(1, '2019'),
	(2, '2020');
/*!40000 ALTER TABLE `registration_year` ENABLE KEYS */;

-- Dumping structure for table graphql.travel
CREATE TABLE IF NOT EXISTS `travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_destination` varchar(50) COLLATE latin2_croatian_ci NOT NULL DEFAULT '0',
  `to_destination` varchar(50) COLLATE latin2_croatian_ci NOT NULL DEFAULT '',
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_travel_vehicle` (`vehicle_id`),
  CONSTRAINT `FK_travel_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.travel: ~2 rows (approximately)
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` (`id`, `from_destination`, `to_destination`, `vehicle_id`) VALUES
	(1, 'Mrkonjic', 'Banja Luka', 1),
	(2, 'Prijedor', 'Banja Luka', 1);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;

-- Dumping structure for table graphql.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE latin2_croatian_ci DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `model_code` varchar(50) COLLATE latin2_croatian_ci DEFAULT NULL,
  `brand_name` varchar(50) COLLATE latin2_croatian_ci DEFAULT NULL,
  `launch_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vehicle_person` (`person_id`),
  CONSTRAINT `FK_vehicle_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.vehicle: ~2 rows (approximately)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`id`, `type`, `person_id`, `model_code`, `brand_name`, `launch_date`) VALUES
	(1, 'car', 1, 'XYZ0192', 'XYZ', '2016-08-16 22:22:11'),
	(2, 'Malina', 1, 'Modle', 'BMW', NULL);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

-- Dumping structure for table graphql.vehicle_city
CREATE TABLE IF NOT EXISTS `vehicle_city` (
  `vehicle_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  KEY `FK_vehicle_city_vehicle` (`vehicle_id`),
  KEY `FK_vehicle_city_city` (`city_id`),
  CONSTRAINT `FK_vehicle_city_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FK_vehicle_city_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.vehicle_city: ~3 rows (approximately)
/*!40000 ALTER TABLE `vehicle_city` DISABLE KEYS */;
INSERT INTO `vehicle_city` (`vehicle_id`, `city_id`) VALUES
	(1, 1),
	(2, 1),
	(1, 3);
/*!40000 ALTER TABLE `vehicle_city` ENABLE KEYS */;

-- Dumping structure for table graphql.vehicle_registration
CREATE TABLE IF NOT EXISTS `vehicle_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin2_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK` (`vehicle_id`),
  KEY `FK_vehicle_registration_registration` (`registration_id`),
  CONSTRAINT `FK` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FK_vehicle_registration_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci;

-- Dumping data for table graphql.vehicle_registration: ~3 rows (approximately)
/*!40000 ALTER TABLE `vehicle_registration` DISABLE KEYS */;
INSERT INTO `vehicle_registration` (`id`, `vehicle_id`, `registration_id`, `name`) VALUES
	(1, 1, 1, 'iME'),
	(2, 1, 2, 'Fake'),
	(3, 2, 2, 'Da');
/*!40000 ALTER TABLE `vehicle_registration` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
