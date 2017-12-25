-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.35-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for webbook
CREATE DATABASE IF NOT EXISTS `webbook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webbook`;


-- Dumping structure for table webbook.book_viewing
CREATE TABLE IF NOT EXISTS `book_viewing` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `BOOK_ID` (`BOOK_ID`),
  KEY `FK_book_viewing_user` (`USER_ID`),
  KEY `FK_book_viewing_book` (`BOOK_ID`),
  CONSTRAINT `FK_book_viewing_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_book_viewing_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book_viewing: ~0 rows (approximately)
DELETE FROM `book_viewing`;
/*!40000 ALTER TABLE `book_viewing` DISABLE KEYS */;
INSERT INTO `book_viewing` (`_id`, `USER_ID`, `BOOK_ID`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(61, 10, 38, '2016-01-25 11:35:50', '2016-01-25 11:35:50'),
	(72, 79, 40, '2016-01-25 14:00:23', '2016-01-25 14:00:23');
/*!40000 ALTER TABLE `book_viewing` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
