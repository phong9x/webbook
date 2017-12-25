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


-- Dumping structure for table webbook.announcement
CREATE TABLE IF NOT EXISTS `announcement` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `BOOK_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(300) DEFAULT NULL,
  `CONTENTS` varchar(300) DEFAULT NULL,
  `EPILOGUE` varchar(300) DEFAULT NULL,
  `HITS_NO` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.announcement: ~10 rows (approximately)
DELETE FROM `announcement`;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`_id`, `BOOK_ID`, `TITLE`, `CONTENTS`, `EPILOGUE`, `HITS_NO`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(2, 33, 'Wait episode 10 in ten dáy', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(4, 33, 'Wait episode 10 in ten dáy', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(5, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(6, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(7, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(8, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(9, 1, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(10, 33, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 0, '2015-12-25 17:01:12', '2016-01-21 11:24:20'),
	(11, 1, 'Wait episode 10 in for ten day', 'Wonderful', NULL, 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


-- Dumping structure for table webbook.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `BANNER_1` varchar(500) DEFAULT NULL,
  `BANNER_2` varchar(500) DEFAULT NULL,
  `BANNER_3` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.banner: ~1 rows (approximately)
DELETE FROM `banner`;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`_id`, `BANNER_1`, `BANNER_2`, `BANNER_3`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 'images/upload/175154365197611.png', 'images/upload/175156471882290.png', 'images/upload/175158528709475.png', '2016-01-13 18:30:44', '2016-01-13 18:30:44');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;


-- Dumping structure for table webbook.book
CREATE TABLE IF NOT EXISTS `book` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_NICKNAME` varchar(300) DEFAULT NULL,
  `TITLE` varchar(300) DEFAULT NULL,
  `GENRE_ID` int(3) DEFAULT NULL,
  `GENRE_NAME` varchar(300) DEFAULT NULL,
  `ADULT` varchar(20) DEFAULT NULL,
  `DAY_OF_WEEK` varchar(300) DEFAULT NULL,
  `AGE_GROUP_ID` int(3) DEFAULT NULL,
  `AGE_GROUP_NAME` varchar(100) DEFAULT NULL,
  `LEAGUE_ID` int(3) DEFAULT NULL,
  `LEAGUE_NAME` varchar(100) DEFAULT NULL,
  `INTRODUCE` varchar(300) DEFAULT NULL,
  `COVER_IMAGE` varchar(300) DEFAULT NULL,
  `EPISODE_NUMBER` int(10) DEFAULT NULL,
  `HITS_NO` int(10) DEFAULT NULL,
  `INTERESTED_BOOK_NO` int(10) DEFAULT NULL,
  `RECOMMENDATION_NO` int(10) DEFAULT NULL,
  `HITS_WEEKLY` int(10) DEFAULT '0',
  `INTERESTED_WEEKLY` int(10) DEFAULT '0',
  `RECOMMENDATION_WEEKLY` int(10) DEFAULT '0',
  `KEYWORD_1` varchar(100) DEFAULT NULL,
  `KEYWORD_2` varchar(100) DEFAULT NULL,
  `KEYWORD_3` varchar(100) DEFAULT NULL,
  `KEYWORD_4` varchar(100) DEFAULT NULL,
  `COMEPLETE` int(1) NOT NULL DEFAULT '0',
  `IS_DELETE` int(1) NOT NULL DEFAULT '0',
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_book_user` (`USER_ID`),
  CONSTRAINT `FK_book_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book: ~31 rows (approximately)
DELETE FROM `book`;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`_id`, `USER_ID`, `USER_NICKNAME`, `TITLE`, `GENRE_ID`, `GENRE_NAME`, `ADULT`, `DAY_OF_WEEK`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `LEAGUE_ID`, `LEAGUE_NAME`, `INTRODUCE`, `COVER_IMAGE`, `EPISODE_NUMBER`, `HITS_NO`, `INTERESTED_BOOK_NO`, `RECOMMENDATION_NO`, `HITS_WEEKLY`, `INTERESTED_WEEKLY`, `RECOMMENDATION_WEEKLY`, `KEYWORD_1`, `KEYWORD_2`, `KEYWORD_3`, `KEYWORD_4`, `COMEPLETE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 12, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 2, '유니티', 26, '작가관', 'adverture', 'images/cover_image/로맨스_01.jpg', 4, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:49:09', '2015-12-22 13:49:09'),
	(2, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 26, '작가관', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(3, 12, 'duonglt', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 28, '챌린지리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(4, 12, 'kennyphong', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 28, '챌린지리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(5, 10, 'Kenny222222', '콘텐츠 부족 등 이용할 만한 서비스 부족', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'introduce', 'images/cover_image/로맨스_02.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2016-01-16 13:27:24', '2016-01-16 15:51:33'),
	(6, 10, 'Kenny222222', '콘텐츠 부족 등 이용할 만한 서비스 부족', 5, '로맨스', '일반', '토', 2, '유니티', 27, '베스트리그', 'introduce', 'images/cover_image/로맨스_05.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 15:53:20'),
	(7, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'introduce', 'images/cover_image/로맨스_06.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 15:53:29'),
	(8, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 28, '챌린지리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(9, 10, 'Kenny222222', 'Eragon', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/로맨스_07.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 15:53:39'),
	(10, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 28, '챌린지리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(11, 10, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'introduce', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(12, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(13, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', 'images/cover_image/로맨스_01.jpg\r\n', 0, 2, 4, 2, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(14, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'introduce', 'images/cover_image/기타_13.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:07:00'),
	(15, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/기타_08.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:52'),
	(16, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/판타지_03.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:43'),
	(17, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/기타_22.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:34'),
	(18, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/판타지_02.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:26'),
	(19, 10, 'Kenny222222', '콘텐츠 부족 등 이용할 만한 서비스 부족', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/기타_20.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:19'),
	(20, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/기타_02.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:06:12'),
	(21, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/로맨스_08.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:07:14'),
	(22, 10, 'Kenny222222', 'Harry Potter', 5, '로맨스', '일반', '토', 1, '제너맨', 27, '베스트리그', 'adverture', 'images/cover_image/판타지_05.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2016-01-16 16:07:21'),
	(27, 10, 'Kenny222222', 'Fairy Taile', 6, '판타지', '일반', '토', 1, '제너맨', 28, '챌린지리그', 'introduce', 'images/cover_image/로맨스_04.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '무협', '퓨전/기타', 0, 0, '2015-12-23 16:28:17', '2016-01-16 15:53:11'),
	(28, 10, 'Kenny222222', 'Fairy Taile', 6, '판타지', '일반', '토', 2, '유니티', 26, '작가관', 'i love you more can say', 'images/cover_image/로맨스_03.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '무협', '퓨전/기타', 0, 0, '2015-12-23 16:29:43', '2016-01-16 15:53:04'),
	(29, 10, 'Kenny222222', 'Pegarus', 5, '로맨스', '일반', '토', 2, '유니티', 26, '작가관', 'introduce', 'images/cover_image/기타_19.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '무협', '퓨전/기타', 0, 0, '2015-12-23 16:32:24', '2016-01-16 15:52:46'),
	(30, 10, 'Kenny222222', 'Fairy Taile', 5, '로맨스', '성인', '토, 일', 1, '제너맨', 26, '작가관', 'ádsada', 'images/cover_image/판타지_06.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '무협', NULL, 0, 0, '2015-12-24 10:57:39', '2016-01-16 15:52:36'),
	(32, 10, 'Kenny222222', 'Eragon', 5, '로맨스', '성인', '토, 일', 2, '유니티', 26, '작가관', 'asdad', 'images/cover_image/SF_01.jpg', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, '2015-12-24 10:59:58', '2016-01-16 15:52:27'),
	(33, 10, 'Kenny222222', 'Mimosa', 8, '퓨전/기타', '일반', '토', 4, '로우틴', 27, '베스트리그', '13213421', 'images/cover_image/판타지_03.jpg', 1, 1111, 0, 5, 5, 5, 0, NULL, NULL, '무협', '퓨전/기타', 0, 0, '2016-01-07 17:56:59', '2016-01-16 15:52:02'),
	(34, 10, 'Kenny', 'Love Story', 5, '로맨스', '일반', '남, 수', 1, '제너맨', 26, '작가관', 'introduce', 'images/cover_image/로맨스_01.jpg\r\n', 1, 1, 0, 0, 0, 0, 0, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 1, '2015-12-24 17:33:21', '2015-12-24 17:33:21'),
	(35, 12, 'Kenny', 'Love Story 1', 7, '무협', '일반', '남, 수', 1, '제너맨', 26, '작가관', 'introduce', 'images/cover_image/로맨스_01.jpg\r\n', 1, 1, 0, 0, 0, 0, 0, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 0, '2015-12-24 17:33:21', '2015-12-24 17:33:21'),
	(36, 12, 'Kenny', 'Love Story 2', 7, '무협', '일반', '남, 수', 1, '제너맨', 26, '작가관', 'introduce', 'images/cover_image/로맨스_01.jpg\r\n', 1, 1111, 0, 0, 0, 0, 0, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 0, '2015-12-25 17:33:21', '2015-12-25 17:33:21');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- Dumping structure for table webbook.bookmark
CREATE TABLE IF NOT EXISTS `bookmark` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EPISODE_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `EPISODE_NAME` int(11) DEFAULT NULL,
  `NICKNAME` longtext,
  PRIMARY KEY (`_id`),
  KEY `FK_bookmark_user` (`USER_ID`),
  KEY `FK_bookmark_episode` (`EPISODE_ID`),
  CONSTRAINT `FK_bookmark_episode` FOREIGN KEY (`EPISODE_ID`) REFERENCES `episode` (`_id`),
  CONSTRAINT `FK_bookmark_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.bookmark: ~5 rows (approximately)
DELETE FROM `bookmark`;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` (`_id`, `USER_ID`, `EPISODE_ID`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`, `EPISODE_NAME`, `NICKNAME`) VALUES
	(32, 10, 35, 1, '2015-12-30 16:53:21', '2015-12-30 16:53:21', NULL, NULL),
	(33, 10, 39, 1, '2015-12-30 16:54:39', '2015-12-30 16:54:39', NULL, NULL),
	(34, 10, 33, 1, '2015-12-30 16:50:17', '2015-12-30 16:50:17', NULL, NULL),
	(35, 10, 33, 1, '2016-01-07 14:29:27', '2016-01-07 14:29:27', NULL, 'Kenny'),
	(36, 10, 34, 1, '2016-01-07 14:30:23', '2016-01-07 14:30:23', NULL, 'Kenny');
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;


-- Dumping structure for table webbook.book_viewing
CREATE TABLE IF NOT EXISTS `book_viewing` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_book_viewing_user` (`USER_ID`),
  KEY `FK_book_viewing_book` (`BOOK_ID`),
  CONSTRAINT `FK_book_viewing_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`),
  CONSTRAINT `FK_book_viewing_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book_viewing: ~8 rows (approximately)
DELETE FROM `book_viewing`;
/*!40000 ALTER TABLE `book_viewing` DISABLE KEYS */;
INSERT INTO `book_viewing` (`_id`, `USER_ID`, `BOOK_ID`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 71, 2, '2016-01-16 10:30:36', '2016-01-16 10:30:37'),
	(2, 10, 33, '2016-01-21 10:06:41', '2016-01-21 10:06:41'),
	(3, 10, 33, '2016-01-21 10:06:48', '2016-01-21 10:06:48'),
	(4, 10, 33, '2016-01-21 10:27:22', '2016-01-21 10:27:22'),
	(5, 10, 36, '2016-01-21 10:27:59', '2016-01-21 10:27:59'),
	(6, 10, 33, '2016-01-21 10:28:24', '2016-01-21 10:28:24'),
	(7, 10, 33, '2016-01-21 10:28:38', '2016-01-21 10:28:38'),
	(8, 10, 33, '2016-01-21 10:46:51', '2016-01-21 10:46:51');
/*!40000 ALTER TABLE `book_viewing` ENABLE KEYS */;


-- Dumping structure for table webbook.category
CREATE TABLE IF NOT EXISTS `category` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(200) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `GroupId` int(5) DEFAULT NULL,
  `groupName` varchar(200) DEFAULT NULL,
  `catId` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.category: ~109 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`_id`, `catName`, `Description`, `GroupId`, `groupName`, `catId`, `image`, `createDate`, `updateDate`) VALUES
	(1, '제너맨', 'Over 25: generman', 1, 'Age group', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(2, '유니티', 'Under 25: unity, generman', 1, 'Age group', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(3, '하이틴', 'Under 20: high teen, unity, generman', 1, 'Age group', 3, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(4, '로우틴', 'Under 15: low teen, high teen, unity, generman', 1, 'Age group', 4, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(5, '로맨스', 'romance', 2, 'genre', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(6, '판타지', 'fantasy', 2, 'genre', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(7, '무협', 'heroism', 2, 'genre', 3, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(8, '퓨전/기타', 'fusion/other', 2, 'genre', 4, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(9, '자유게시판', 'freeboard', 3, 'Bulletin ', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(10, '감상평', 'appreciation', 3, 'Bulletin ', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(11, '강의/자료실', 'lecture/documents', 3, 'Bulletin ', 3, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(12, 'FAQ', 'FAQ', 3, 'Bulletin ', 4, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(17, '콘텐츠 부족 등 이용할 만한 서비스 부족', '', 5, 'Leave reason', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(18, '고객 서비스 불만', '', 5, 'Leave reason', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(19, '시스템 장애(속도저하, 잦은 에러 등) ', '', 5, 'Leave reason', 3, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(20, '개인정보의 노출 우려 ', '', 5, 'Leave reason', 4, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(21, '기타', '', 5, 'Leave reason', 5, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(26, '작가관', 'official author', 10, 'Author level', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(27, '베스트리그', 'best league', 10, 'Author level', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(28, '챌린지리그', 'challenge league', 10, 'Author level', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(30, '로맨스 01', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_01.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(31, '로맨스 02', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_02.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(32, '로맨스 03', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_03.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(33, '로맨스 04', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_04.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(34, '신용카드', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(35, '휴대폰 결제', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(36, '계좌 이체', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(37, '문화상품권', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(38, '도서상품권', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(39, '무통장 입금', '', 12, 'Payment method', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(40, '거래취소', 'transaction cancel', 13, 'Cancel code', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(41, '오류', 'error', 13, 'Cancel code', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(42, '기타사항', 'other details', 13, 'Cancel code', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(43, '영리 목적 또는 홍보성 게시물', NULL, 14, 'Report reason', NULL, NULL, '2016-01-07 17:09:59', '2016-01-07 17:10:00'),
	(44, '음란성, 선정성이 포함된 게시물', NULL, 14, 'Report reason', NULL, NULL, '2016-01-07 17:10:01', '2016-01-07 17:10:00'),
	(45, '특정인 대상의 비방, 욕설, 인신공격, 개인정보노출', NULL, 14, 'Report reason', NULL, NULL, '2016-01-07 17:10:02', '2016-01-07 17:10:03'),
	(46, '같은 내용의 게시글 반복 등록 (도배)', NULL, 14, 'Report reason', NULL, NULL, '2016-01-07 17:10:05', '2016-01-07 17:10:04'),
	(47, '기타', NULL, 14, 'Report reason', NULL, NULL, '2016-01-07 17:10:06', '2016-01-07 17:10:07'),
	(48, '우리은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-07 17:10:06', '2016-01-07 17:10:07'),
	(49, '국민은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:06', '2016-01-13 10:01:07'),
	(50, 'SC제일은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(51, '하나은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(52, '대구은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(53, '부산은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(54, '기업은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(55, '한국시티은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(56, '경남은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(57, '외환은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(58, '신한은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(59, '광주은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(60, '새마을금고', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(61, '농협', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(62, '우체국', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(63, '산업은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(64, '수협', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(65, '신협', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(66, '전북은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(67, '제주은행', NULL, 15, 'Bank', NULL, NULL, '2016-01-13 10:01:09', '2016-01-13 10:01:08'),
	(157, 'key 1', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(158, 'key 2', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(159, 'key 3', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(160, 'key 4', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(161, 'key 5', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(162, 'key 6', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(163, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(164, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(165, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(166, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(167, '무협', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(168, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(169, 'key 1', '무협', 8, 'Keyword 3', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(170, '무협', '무협', 8, 'Keyword 3', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(171, 'key 1', '퓨전/기타', 9, 'Keyword 4', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(172, '퓨전/기타', '퓨전/기타', 9, 'Keyword 4', NULL, NULL, '2016-01-13 17:18:12', '2016-01-13 17:18:12'),
	(173, '로맨스 05', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_05.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(174, '로맨스 06', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_06.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(175, '로맨스 07', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_07.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(176, '로맨스 08', '', 11, 'Cover image default', NULL, 'images/cover_image/로맨스_08.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(177, '판타지 01', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_01.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(178, '판타지 02', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_02.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(179, '판타지 03', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_03.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(180, '판타지 04', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_04.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(181, '판타지 05', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_05.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(182, '로맨스 06', '', 11, 'Cover image default', NULL, 'images/cover_image/판타지_06.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(183, '무협 01', '', 11, 'Cover image default', NULL, 'images/cover_image/무협_01.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(184, '무협 02', '', 11, 'Cover image default', NULL, 'images/cover_image/무협_02.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(185, 'SF 01\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/SF_01.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(186, '기타 01\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_01.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(187, '기타 02\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_02.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(188, '기타 03\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_03.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(189, '기타 04\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_04.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(190, '기타 05\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_05.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(191, '기타 06\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_06.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(192, '기타 07\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_07.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(193, '기타 08\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_08.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(194, '기타 09\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_09.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(195, '기타 10\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_10.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(196, '기타 11\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_11.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(197, '기타 12\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_12.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(198, '기타 13\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_13.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(199, '기타 14\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_14.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(200, '기타 15\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_15.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(201, '기타 16\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_16.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(202, '기타 17\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_17.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(203, '기타 18\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_18.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(204, '기타 19\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_19.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(205, '기타 20\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_20.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(206, '기타 21\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_21.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(207, '기타 22\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_22.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table webbook.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `TYPE_KEY` varchar(50) DEFAULT NULL,
  `COMMENT` varchar(300) DEFAULT NULL,
  `REPORT_NUMBER` int(5) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_comment_user` (`USER_ID`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.comment: ~38 rows (approximately)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`_id`, `USER_ID`, `PARENT_ID`, `TYPE_KEY`, `COMMENT`, `REPORT_NUMBER`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 10, 33, 'EPISODE', 'spam', 3, 0, '2015-12-31 10:39:17', '2015-12-31 10:39:30'),
	(2, 10, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:16', '2015-12-31 10:39:29'),
	(3, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:18', '2015-12-31 10:39:28'),
	(4, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:19', '2015-12-31 10:39:27'),
	(5, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:21', '2015-12-31 10:39:26'),
	(6, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:19', '2015-12-31 10:39:27'),
	(7, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:20', '2015-12-31 10:39:25'),
	(8, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:23', '2015-12-31 10:39:25'),
	(9, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(10, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(11, 12, 33, 'EPISODE', 'good', 0, 0, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(12, 12, 1, 'POST', 'good', 0, 0, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(13, 12, 1, 'POST', 'good', 0, 0, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(14, 10, 1, 'POST', 'good', 0, 1, '2015-12-31 10:39:22', '2015-12-31 10:39:24'),
	(15, 10, 1, 'POST', '1', 0, 1, '2016-01-07 09:35:33', '2016-01-07 09:35:33'),
	(16, 10, 1, 'POST', '1', 0, 1, '2016-01-07 09:37:19', '2016-01-07 09:37:19'),
	(17, 10, 1, 'POST', 'sfsdfsfds', 0, 0, '2016-01-07 09:37:24', '2016-01-07 09:37:24'),
	(18, 10, 1, 'POST', ' oke men', 0, 0, '2016-01-07 09:37:31', '2016-01-07 09:37:31'),
	(19, 10, 1, 'POST', ' oke men', 0, 0, '2016-01-07 09:38:19', '2016-01-07 09:38:19'),
	(20, 10, 1, 'POST', ' oke men', 0, 0, '2016-01-07 09:38:24', '2016-01-07 09:38:24'),
	(21, 10, 1, 'POST', ' oke men', 0, 0, '2016-01-07 09:38:27', '2016-01-07 09:38:27'),
	(22, 10, 1, 'POST', ' oke men', 0, 1, '2016-01-07 09:38:28', '2016-01-07 09:38:28'),
	(33, 10, 1, 'POST', ' ', 0, 1, '2016-01-07 09:39:57', '2016-01-07 09:39:57'),
	(34, 10, 1, 'POST', ' ', 0, 1, '2016-01-07 09:40:00', '2016-01-07 09:40:00'),
	(35, 10, 1, 'POST', ' ', 0, 1, '2016-01-07 09:40:03', '2016-01-07 09:40:03'),
	(36, 10, 1, 'POST', ' ', 0, 1, '2016-01-07 09:40:06', '2016-01-07 09:40:06'),
	(37, 10, 1, 'POST', ' 11111111111', 0, 1, '2016-01-07 09:41:49', '2016-01-07 09:41:49'),
	(38, 10, 33, 'EPISODE', '11111', 0, 0, '2016-01-07 14:09:00', '2016-01-07 14:09:00'),
	(39, 10, 33, 'EPISODE', '222222222', 0, 1, '2016-01-07 14:11:46', '2016-01-07 14:11:46'),
	(40, 10, 33, 'EPISODE', '33333', 0, 0, '2016-01-07 14:15:09', '2016-01-07 14:15:09'),
	(41, 10, 35, 'EPISODE', 'sfdsfsfs', 0, 0, '2016-01-07 14:32:16', '2016-01-07 14:32:16'),
	(42, 10, 35, 'EPISODE', 'sdffdsfds', 0, 0, '2016-01-07 14:32:21', '2016-01-07 14:32:21'),
	(43, 10, 33, 'EPISODE', 'okhjukjguj', 0, 0, '2016-01-07 14:35:59', '2016-01-07 14:35:59'),
	(44, 10, 1, 'EPISODE', 'okhjukjguj', 0, 0, '2016-01-07 14:36:30', '2016-01-07 14:36:30'),
	(45, 10, 34, 'EPISODE', '1213213213', 0, 0, '2016-01-07 14:37:40', '2016-01-07 14:37:40'),
	(46, 10, 20, 'POST', 'test comment', 0, 0, '2016-01-16 17:06:50', '2016-01-16 17:06:50'),
	(47, 10, 20, 'POST', 'test commentasdasd', 0, 0, '2016-01-16 17:06:53', '2016-01-16 17:06:53'),
	(48, 10, 20, 'POST', 'sdfsdf', 0, 0, '2016-01-16 17:08:12', '2016-01-16 17:08:12');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table webbook.coupon_purchase
CREATE TABLE IF NOT EXISTS `coupon_purchase` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CHARGE_AMOUNT` int(11) DEFAULT NULL,
  `TOTAL_FEE` double DEFAULT NULL,
  `PAYMENT_METHOD_ID` int(2) DEFAULT NULL,
  `PAYMENT_METHOD_NAME` varchar(200) DEFAULT NULL,
  `CANCEL_REASON` varchar(300) DEFAULT NULL,
  `CANCEL_CODE` varchar(300) DEFAULT NULL,
  `CANCEL` int(1) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_coupon_purchase_user` (`USER_ID`),
  CONSTRAINT `FK_coupon_purchase_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_purchase: ~5 rows (approximately)
DELETE FROM `coupon_purchase`;
/*!40000 ALTER TABLE `coupon_purchase` DISABLE KEYS */;
INSERT INTO `coupon_purchase` (`_id`, `USER_ID`, `CHARGE_AMOUNT`, `TOTAL_FEE`, `PAYMENT_METHOD_ID`, `PAYMENT_METHOD_NAME`, `CANCEL_REASON`, `CANCEL_CODE`, `CANCEL`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 10, 100, 1000, 39, '무통장 입금', NULL, NULL, NULL, 0, '2016-01-08 11:24:29', '2016-01-08 11:24:30'),
	(2, 10, 100, 1000, 39, '무통장 입금', NULL, NULL, NULL, 0, '2016-01-08 11:24:29', '2016-01-08 11:24:30'),
	(3, 12, 100, 1000, 39, '무통장 입금', NULL, NULL, NULL, 0, '2016-01-08 11:24:29', '2016-01-08 11:24:30'),
	(4, 10, 110, 100000, 35, '휴대폰 결제', NULL, NULL, NULL, 0, '2016-01-08 14:10:46', '2016-01-08 14:10:46'),
	(5, 10, 120, 50000, 35, '휴대폰 결제', NULL, NULL, NULL, 0, '2016-01-08 14:17:40', '2016-01-08 14:17:40');
/*!40000 ALTER TABLE `coupon_purchase` ENABLE KEYS */;


-- Dumping structure for table webbook.coupon_used
CREATE TABLE IF NOT EXISTS `coupon_used` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `EPISODE_ID` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) DEFAULT NULL,
  `CHARGE_AMOUNT` int(11) DEFAULT '0',
  `METHOD_PAYMENT` int(5) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_coupon_used_user` (`USER_ID`),
  KEY `FK_coupon_used_book` (`BOOK_ID`),
  KEY `FK_coupon_used_episode` (`EPISODE_ID`),
  CONSTRAINT `FK_coupon_used_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_coupon_used_episode` FOREIGN KEY (`EPISODE_ID`) REFERENCES `episode` (`_id`),
  CONSTRAINT `FK_coupon_used_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_used: ~15 rows (approximately)
DELETE FROM `coupon_used`;
/*!40000 ALTER TABLE `coupon_used` DISABLE KEYS */;
INSERT INTO `coupon_used` (`_id`, `USER_ID`, `EPISODE_ID`, `BOOK_ID`, `CHARGE_AMOUNT`, `METHOD_PAYMENT`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 10, 47, 33, 100, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(11, 12, 49, 33, 100, NULL, 0, '2015-01-07 11:33:23', '2016-01-08 11:33:23'),
	(12, 27, 53, 33, 100, NULL, 0, '2016-01-08 11:33:23', '2016-01-08 11:33:23'),
	(13, 27, 61, 33, 200, NULL, 0, '2016-01-08 11:33:23', '2016-01-08 11:33:23'),
	(14, 10, 47, 33, 100, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(15, 10, 47, 33, 100, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(16, 10, 47, 33, 200, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(17, 10, 47, 33, 200, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(18, 10, 47, 33, 100, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(19, 10, 47, 33, 200, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(20, 10, 47, 33, 100000, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(21, 10, 47, 33, 200, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(22, 10, 47, 33, 200, NULL, 0, '2016-01-11 11:33:23', '2016-01-08 11:33:23'),
	(31, 10, 50, 33, 5, NULL, 0, '2016-01-21 10:06:48', '2016-01-21 10:06:48'),
	(43, 10, 48, 33, 5, NULL, 0, '2016-01-21 10:28:32', '2016-01-21 10:28:32');
/*!40000 ALTER TABLE `coupon_used` ENABLE KEYS */;


-- Dumping structure for table webbook.episode
CREATE TABLE IF NOT EXISTS `episode` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `BOOK_ID` int(11) DEFAULT NULL,
  `EPISODE_NUMBER` int(11) DEFAULT '1',
  `TITLE` varchar(300) DEFAULT NULL,
  `CONTENT` text,
  `EPILOGUE` varchar(300) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `RATIO` int(11) DEFAULT NULL,
  `SALES_NUMBER` int(11) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `HITS_NO` int(11) DEFAULT NULL,
  `RECOMMONDATION_NO` int(11) DEFAULT NULL,
  `REVIEW_NO` int(11) DEFAULT NULL,
  `COMPLETE` int(1) DEFAULT '0',
  `TEMPORARY_SAVE` int(1) DEFAULT '0',
  `IS_SHOW` int(1) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_book_episode` (`BOOK_ID`),
  CONSTRAINT `FK_book_episode` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.episode: ~25 rows (approximately)
DELETE FROM `episode`;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` (`_id`, `BOOK_ID`, `EPISODE_NUMBER`, `TITLE`, `CONTENT`, `EPILOGUE`, `PRICE`, `RATIO`, `SALES_NUMBER`, `AMOUNT`, `HITS_NO`, `RECOMMONDATION_NO`, `REVIEW_NO`, `COMPLETE`, `TEMPORARY_SAVE`, `IS_SHOW`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(33, 33, 1, 'Eragon', 'This book is dedicated to my mom, for showing me the magic in the world;\r\nto my dad, for revealing the man behind the curtain.\r\nAnd also to my sister, Angela, for helping when I’m “blue.”\r\nPROLOGUE:\r\nSHADE OF FEAR\r\nWind howled through the night, carrying a scent that would change the world. A tall\r\nShade lifted his head and sniffed the air. He looked human except for his crimson hair\r\nand maroon eyes.\r\nHe blinked in surprise. The message had been correct: they were here. Or was it a trap?\r\nHe weighed the odds, then said icily, “Spread out; hide behind trees and bushes. Stop\r\nwhoever is coming . . . or die.”\r\nAround him shuffled twelve Urgals with short swords and round iron shields painted with\r\nblack symbols. They resembled men with bowed legs and thick, brutish arms made for\r\ncrushing. A pair of twisted horns grew above their small ears. The monsters hurried into\r\nthe brush, grunting as they hid. Soon the rustling quieted and the forest was silent again.\r\nThe Shade peered around a thick tree and looked up the trail. It was too dark for any\r\nhuman to see, but for him the faint moonlight was like sunshine streaming between the\r\ntrees; every detail was clear and sharp to his searching gaze. He remained unnaturally\r\nquiet, a long pale sword in his hand. A wire-thin scratch curved down the blade. The\r\nweapon was thin enough to slip between a pair of ribs, yet stout enough to hack through\r\nthe hardest armor.\r\nThe Urgals could not see as well as the Shade; they groped like blind beggars, fumbling\r\nwith their weapons. An owl screeched, cutting through the silence. No one relaxed until\r\nthe bird flew past. Then the monsters shivered in the cold night; one snapped a twig with\r\nhis heavy boot. The Shade hissed in anger, and the Urgals shrank back, motionless. He\r\nsuppressed his distaste—they smelled like fetid meat—and turned away. They were tools,\r\nnothing more.\r\nThe Shade forced back his impatience as the minutes became hours. The scent must have\r\nwafted far ahead of its owners. He did not let the Urgals get up or warm themselves. He\r\ndenied himself those luxuries, too, and stayed behind the tree, watching the trail. Another\r\ngust of wind rushed through the forest. The smell was stronger this time. Excited, he\r\nlifted a thin lip in a snarl.\r\n“Get ready,” he whispered, his whole body vibrating. The tip of his sword moved in\r\nsmall circles. It had taken many plots and much pain to bring himself to this moment. It\r\nwould not do to lose control now.\r\nEyes brightened under the Urgals’ thick brows, and the creatures gripped their weapons\r\ntighter. Ahead of them, the Shade heard a clink as something hard struck a loose stone.\r\nFaint smudges emerged from the darkness and advanced down the trail.\r\nThree white horses with riders cantered toward the ambush, their heads held high and\r\nproud, their coats rippling in the moonlight like liquid silver.\r\nOn the first horse was an elf with pointed ears and elegantly slanted eyebrows. His build\r\nwas slim but strong, like a rapier. A powerful bow was slung on his', '1111', 0, 0, 0, 0, 100, 15, 0, 1, 1, 1, 0, '2015-12-24 16:26:25', '2016-01-21 10:49:46'),
	(34, 33, 1, 'Eragon', 'Line 1\r\nLine 2\r\n\r\nLine 3', 'asdasda', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2015-12-24 16:31:30', '2016-01-21 11:31:07'),
	(35, 33, 1, 'Eragon', 'adasda', 'asdasda', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, '2015-12-24 16:33:02', '2016-01-21 10:50:17'),
	(38, 33, 1, 'Eragon', '1111', '222', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2015-12-24 16:44:58', '2016-01-21 11:32:41'),
	(39, 33, 5, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 0, 0, 0, 0, 12, 0, 0, 1, 0, 1, 0, '2015-12-24 17:12:06', '2016-01-21 11:42:25'),
	(46, 33, 6, 'Eragon', '123', 'asdasdasdasdas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2016-01-21 11:17:33'),
	(47, 33, 7, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(48, 33, 8, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(49, 33, 9, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(50, 33, 10, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 14, 0, 0, 1, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(51, 33, 11, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(52, 33, 12, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(53, 33, 13, 'Eragon', '123', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, '2015-12-24 17:12:06', '2016-01-20 16:16:59'),
	(54, 33, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(55, 33, 15, 'Eragon 3', '111', '111', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2016-01-20 16:39:06'),
	(56, 33, 16, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(57, 33, 17, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(58, 1, 1, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(59, 1, 2, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(60, 1, 3, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(61, 33, 17, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(62, 33, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(63, 34, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(64, 33, NULL, 'Fairy Taile', '2342423423', '23423423', 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, '2016-01-20 16:46:38', '2016-01-20 16:46:38'),
	(65, 33, NULL, 'Fairy Taile', '2342423423', '23423423', 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 0, 0, '2016-01-20 16:46:43', '2016-01-20 16:46:43');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;


-- Dumping structure for table webbook.interested_book
CREATE TABLE IF NOT EXISTS `interested_book` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `EPISODE_ID` int(11) NOT NULL,
  `NICKNAME` longtext,
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_interested_book_user` (`USER_ID`),
  KEY `FK_interested_book_book` (`BOOK_ID`),
  CONSTRAINT `FK_interested_book_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_interested_book_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.interested_book: ~11 rows (approximately)
DELETE FROM `interested_book`;
/*!40000 ALTER TABLE `interested_book` DISABLE KEYS */;
INSERT INTO `interested_book` (`_id`, `USER_ID`, `BOOK_ID`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`, `EPISODE_ID`, `NICKNAME`, `TYPE`) VALUES
	(1, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(2, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(3, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(4, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(5, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(6, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(7, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(8, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(9, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(10, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL),
	(11, 10, 33, 1, '2016-01-05 17:24:35', '2016-01-05 17:24:36', 0, NULL, NULL);
/*!40000 ALTER TABLE `interested_book` ENABLE KEYS */;


-- Dumping structure for table webbook.like_history
CREATE TABLE IF NOT EXISTS `like_history` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EPISODE_ID` int(11) NOT NULL,
  `TYPE` int(1) NOT NULL,
  `TYPE_NAME` varchar(20) NOT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.like_history: ~0 rows (approximately)
DELETE FROM `like_history`;
/*!40000 ALTER TABLE `like_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_history` ENABLE KEYS */;


-- Dumping structure for table webbook.post
CREATE TABLE IF NOT EXISTS `post` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(300) DEFAULT NULL,
  `BULLETIN_ID` int(11) DEFAULT NULL,
  `BULLETIN_NAME` varchar(50) DEFAULT NULL,
  `IMAGE1` varchar(500) DEFAULT NULL,
  `IMAGE2` varchar(500) DEFAULT NULL,
  `CONTENTS` varchar(500) DEFAULT NULL,
  `FILE1` varchar(500) DEFAULT NULL,
  `FILE2` varchar(500) DEFAULT NULL,
  `REPORT_NUMBER` int(5) unsigned DEFAULT '0',
  `VIEWS_NUMBER` int(11) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_post_user` (`USER_ID`),
  KEY `FK_post_book` (`BOOK_ID`),
  CONSTRAINT `FK_post_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.post: ~20 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`_id`, `USER_ID`, `BOOK_ID`, `TITLE`, `BULLETIN_ID`, `BULLETIN_NAME`, `IMAGE1`, `IMAGE2`, `CONTENTS`, `FILE1`, `FILE2`, `REPORT_NUMBER`, `VIEWS_NUMBER`, `IS_DELETE`, `UPDATE_DATE`, `CREATE_DATE`) VALUES
	(1, 10, NULL, 'oke men', 9, '자유게시판', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(2, 10, NULL, 'oke men', 9, '자유게시판', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(3, 10, NULL, 'oke men', 9, '자유게시판', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(4, 10, NULL, 'asd', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(5, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(6, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(7, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(8, 10, NULL, 'asdsd', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(9, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(10, 10, NULL, 'asasda', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(11, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(12, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(13, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(14, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(15, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(16, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(17, 10, NULL, 'oke men', 12, 'FAQ', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(18, 10, NULL, 'oke men', 10, '감상평', NULL, NULL, 'good good good good good', NULL, NULL, 0, 0, 0, '2016-01-06 15:51:07', '2016-01-06 15:51:09'),
	(19, 10, NULL, 'sdas', 10, '감상평', NULL, NULL, 'dasdas', NULL, NULL, 0, 0, 0, '2016-01-16 17:04:34', '2016-01-16 17:04:34'),
	(20, 10, NULL, 'asd', 10, '감상평', NULL, NULL, 'asdas', NULL, NULL, 1, 0, 0, '2016-01-16 17:06:45', '2016-01-16 17:06:45');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for table webbook.profit_refund
CREATE TABLE IF NOT EXISTS `profit_refund` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `DEPOSIT_AMOUNT` double DEFAULT NULL,
  `NAME` varchar(300) DEFAULT NULL,
  `RESIDENT_NUMBER` varchar(300) DEFAULT NULL,
  `CELL_PHONE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(300) DEFAULT NULL,
  `ADDRESS` varchar(300) DEFAULT NULL,
  `ACCOUNT_HOLDER_NAME` varchar(300) DEFAULT NULL,
  `RELATIONSHIP` varchar(200) DEFAULT NULL,
  `BANK_ID` int(1) DEFAULT NULL,
  `BANK_NAME` varchar(200) DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(200) DEFAULT NULL,
  `APPLICATION_DATE` datetime DEFAULT NULL,
  `DEPOSIT_DATE` datetime DEFAULT NULL,
  `DEPOSITED` int(1) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_profit_refund_user_2` (`USER_ID`),
  CONSTRAINT `FK_profit_refund_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.profit_refund: ~18 rows (approximately)
DELETE FROM `profit_refund`;
/*!40000 ALTER TABLE `profit_refund` DISABLE KEYS */;
INSERT INTO `profit_refund` (`_id`, `USER_ID`, `DEPOSIT_AMOUNT`, `NAME`, `RESIDENT_NUMBER`, `CELL_PHONE`, `EMAIL`, `ADDRESS`, `ACCOUNT_HOLDER_NAME`, `RELATIONSHIP`, `BANK_ID`, `BANK_NAME`, `ACCOUNT_NUMBER`, `APPLICATION_DATE`, `DEPOSIT_DATE`, `DEPOSITED`, `IS_DELETE`, `UPDATE_DATE`, `CREATE_DATE`) VALUES
	(1, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'Agribank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(2, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(3, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(4, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(5, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(6, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(7, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(8, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(9, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(10, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(11, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(12, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(13, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(14, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(15, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(16, 10, 20, 'Ok men', '1', '07890789', 'kennyphong28@gmail.com', 'Korean', 'Kenny', NULL, NULL, 'VP Bank', NULL, '2016-01-12 15:56:13', '2016-01-12 15:56:14', NULL, 0, NULL, NULL),
	(17, 10, 20, 'kenny', '024923049230', '089097807867', 'anhgt2@gmail.com', 'Seul Korean', 'Kenny Phong', '본인', 49, '국민은행', 'oke men', '2016-01-13 11:03:38', '2016-01-13 11:02:48', NULL, 0, '2016-01-13 11:02:48', '2016-01-13 11:02:48'),
	(18, 10, 100000, 'Kenny Phong', '024923049230', '089097807867', 'kennyphong2811@gmail.com', 'Seul Korean', 'Kenny Phong', '대리인', 66, '전북은행', 'oke men', NULL, '2016-01-13 11:06:49', NULL, 0, '2016-01-13 11:06:49', '2016-01-13 11:06:49');
/*!40000 ALTER TABLE `profit_refund` ENABLE KEYS */;


-- Dumping structure for table webbook.report
CREATE TABLE IF NOT EXISTS `report` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `PARENT_ID` int(11) DEFAULT NULL,
  `REASON` varchar(300) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `TYPE_KEY` varchar(100) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USER_ID_PARENT_ID_TYPE_KEY` (`USER_ID`,`PARENT_ID`,`TYPE_KEY`),
  KEY `FK_report_user` (`USER_ID`),
  CONSTRAINT `FK_report_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.report: ~3 rows (approximately)
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`_id`, `USER_ID`, `PARENT_ID`, `REASON`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`, `TYPE_KEY`) VALUES
	(1, 66, 1, 'not fair', 0, '2016-01-13 13:39:00', '2016-01-13 13:39:01', 'COMMENT'),
	(5, 71, 1, 'not fair 2', 0, '2016-01-13 13:39:00', '2016-01-13 13:39:01', 'COMMENT'),
	(6, 10, 20, '같은 내용의 게시글 반복 등록 (도배)', 0, '2016-01-16 17:08:08', '2016-01-16 17:08:08', 'APPRECIATION');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


-- Dumping structure for table webbook.user
CREATE TABLE IF NOT EXISTS `user` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `NICKNAME` varchar(200) DEFAULT NULL,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `AGE_GROUP_ID` int(5) DEFAULT NULL,
  `AGE_GROUP_NAME` varchar(100) DEFAULT '0',
  `AUTHOR_LEVEL` int(5) DEFAULT NULL,
  `AUTHOR_NAME` varchar(100) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `DAY_OF_BIRTH` date DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ADULT_VERIFICATION` int(1) DEFAULT NULL,
  `TOTAL_COUPON` int(11) DEFAULT '0',
  `LEAVE_REASON` varchar(300) DEFAULT NULL,
  `ACTIVE` int(1) DEFAULT '0',
  `ROLE` int(11) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.user: ~13 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`_id`, `USERNAME`, `PASSWORD`, `NICKNAME`, `FULLNAME`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `AUTHOR_LEVEL`, `AUTHOR_NAME`, `GENDER`, `DAY_OF_BIRTH`, `PHONE`, `EMAIL`, `ADULT_VERIFICATION`, `TOTAL_COUPON`, `LEAVE_REASON`, `ACTIVE`, `ROLE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(10, 'kenny', '698d51a19d8a121ce581499d7b701668', 'Bac Kieu Phong', 'Kenny Phong', 2, '유니티', 27, '베스트리그', '여', '1993-03-03', '09734252952', 'kennyphong2811@gmail.com1', 0, 94, '', 1, 0, 0, '2016-01-08 18:30:18', '2016-01-20 13:48:01'),
	(12, 'kenny2', '698d51a19d8a121ce581499d7b701668', 'phongduong', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '11111', 'dfsfs', NULL, 10, NULL, 0, 0, 1, '2016-01-02 11:23:50', '2015-11-06 11:23:51'),
	(22, 'user4', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '40230489302', 'dfsfs', NULL, 10, NULL, 0, 0, 0, '2015-11-06 11:23:53', '2015-11-06 11:23:53'),
	(27, 'user6', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '09430294023', '', NULL, 0, NULL, 0, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(66, 'admin', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '09430294023', '', NULL, 0, NULL, 1, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(67, 'abc', '4ed9407630eb1000c0f6b63842defa7d', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '1165516', 'daf@gmail.com', NULL, 0, NULL, 0, 0, 0, '2016-01-09 22:03:32', '2015-11-09 22:03:32'),
	(70, 'zin', '96e79218965eb72c92a549dd5a330112', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '', '', NULL, 0, NULL, 0, 0, 0, '2016-01-16 09:01:47', '2015-11-16 09:01:47'),
	(71, 'admin111', '111', 'Kenny Phong 2', 'test', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '0973425295', 'admin@photoring.com', NULL, 0, NULL, 1, 0, 0, '2015-12-17 15:59:58', '2015-12-17 15:59:58'),
	(73, 'user623', '698d51a19d8a121ce581499d7b701668', 'Kenny Phong', 'Posiden', 1, '제너맨', 28, '챌린지리그', '여', '1985-07-07', '098890770911', 'admin@photoring.com', NULL, 0, NULL, 1, 0, 0, '2015-12-17 16:21:28', '2015-12-17 16:21:28'),
	(74, 'admin1111', '96e79218965eb72c92a549dd5a330112', '1111111111111', 'Nguyễn Thị Huy 2', 1, '제너맨', 28, '챌린지리그', '남', '1986-05-18', '098890770911', 'admin@photoring.com', NULL, 0, NULL, 1, 0, 0, '2016-01-07 10:50:48', '2016-01-07 10:50:48'),
	(75, 'admin1112', '96e79218965eb72c92a549dd5a330112', 'Kenny Phongadasd', 'Nguyễn Thị Huy 2', 1, '제너맨', 28, '챌린지리그', '여', '1985-02-01', '098890770911', 'admin@photoring.com', NULL, 0, NULL, 1, 0, 0, '2016-01-07 10:57:11', '2016-01-07 10:57:11'),
	(78, 'kenny123', 'fb6d51c28b589c1605efd5ad890f8701', 'Kenny Phong 1', 'Posiden', 1, '제너맨', 28, '챌린지리그', '남', '1985-05-18', '0973425295', 'kennyphong2811@gmail.com', NULL, 0, NULL, 1, 0, 0, '2016-03-14 13:11:24', '2016-01-14 13:11:24'),
	(79, 'pegarus', '698d51a19d8a121ce581499d7b701668', 'pegarus', 'Kenny Phong', 1, '제너맨', 28, '챌린지리그', '여', '1986-03-01', '098890770911', 'kennyphong2811@gmail.com', NULL, 0, NULL, 1, 0, 0, '2016-02-14 13:13:12', '2016-01-14 13:13:53');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table webbook.visitor
CREATE TABLE IF NOT EXISTS `visitor` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_visitor` int(15) DEFAULT '0',
  `today_visitor` int(15) DEFAULT '0',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.visitor: ~1 rows (approximately)
DELETE FROM `visitor`;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` (`_id`, `total_visitor`, `today_visitor`) VALUES
	(1, 22, 1);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
