-- --------------------------------------------------------
-- Host:                         localhost
-- Server Version:               8.0.33 - MySQL Community Server - GPL
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für foodswap_db
CREATE DATABASE IF NOT EXISTS `foodswap_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `foodswap_db`;

-- Exportiere Struktur von Tabelle foodswap_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Exportiere Daten aus Tabelle foodswap_db.category: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle foodswap_db.food
CREATE TABLE IF NOT EXISTS `food` (
  `id` int NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `offerId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `food_to_category` (`categoryId`),
  KEY `food_to_user` (`userId`),
  KEY `food_to_offer` (`offerId`),
  CONSTRAINT `food_to_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `food_to_offer` FOREIGN KEY (`offerId`) REFERENCES `offer` (`id`),
  CONSTRAINT `food_to_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Exportiere Daten aus Tabelle foodswap_db.food: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle foodswap_db.offer
CREATE TABLE IF NOT EXISTS `offer` (
  `id` int NOT NULL,
  `amount` float DEFAULT NULL,
  `foodId` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `offer_to_food` (`foodId`),
  KEY `offer_to_category` (`categoryId`),
  CONSTRAINT `offer_to_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `offer_to_food` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Exportiere Daten aus Tabelle foodswap_db.offer: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle foodswap_db.request
CREATE TABLE IF NOT EXISTS `request` (
  `id` int NOT NULL,
  `foodId` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `request_to_food` (`foodId`),
  CONSTRAINT `request_to_food` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Exportiere Daten aus Tabelle foodswap_db.request: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle foodswap_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Exportiere Daten aus Tabelle foodswap_db.user: ~0 rows (ungefähr)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
