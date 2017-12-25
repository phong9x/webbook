-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.26-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for webbook
CREATE DATABASE IF NOT EXISTS `webbook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webbook`;


/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`_id`, `catName`, `Description`, `GroupId`, `groupName`, `catId`, `image`, `createDate`, `updateDate`) VALUES
	(40, '영리 목적 또는 홍보성 게시물', NULL, 13, 'Report reason', NULL, NULL, '2016-01-07 17:09:59', '2016-01-07 17:10:00'),
	(41, '음란성, 선정성이 포함된 게시물', NULL, 13, 'Report reason', NULL, NULL, '2016-01-07 17:10:01', '2016-01-07 17:10:00'),
	(42, '특정인 대상의 비방, 욕설, 인신공격, 개인정보노출', NULL, 13, 'Report reason', NULL, NULL, '2016-01-07 17:10:02', '2016-01-07 17:10:03'),
	(43, '같은 내용의 게시글 반복 등록 (도배)', NULL, 13, 'Report reason', NULL, NULL, '2016-01-07 17:10:05', '2016-01-07 17:10:04'),
	(44, '기타', NULL, 13, 'Report reason', NULL, NULL, '2016-01-07 17:10:06', '2016-01-07 17:10:07');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
