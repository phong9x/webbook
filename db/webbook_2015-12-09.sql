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
  `EPISODE_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(300) DEFAULT NULL,
  `CONTENTS` varchar(300) DEFAULT NULL,
  `HITS_NO` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.announcement: ~0 rows (approximately)
DELETE FROM `announcement`;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.banner: ~0 rows (approximately)
DELETE FROM `banner`;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;


-- Dumping structure for table webbook.book
CREATE TABLE IF NOT EXISTS `book` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `USER_NICKNAME` varchar(300) NOT NULL DEFAULT '0',
  `TITLE` varchar(300) NOT NULL DEFAULT '0',
  `GENRE_ID` int(3) NOT NULL DEFAULT '0',
  `GENRE_NAME` varchar(300) NOT NULL DEFAULT '0',
  `ADULT` varchar(20) NOT NULL DEFAULT '0',
  `DAY_OF_WEEK` varchar(300) NOT NULL DEFAULT '0',
  `AGE_GROUP_ID` int(3) NOT NULL DEFAULT '0',
  `AGE_GROUP_NAME` varchar(100) NOT NULL DEFAULT '0',
  `LEAGUE_ID` int(3) NOT NULL DEFAULT '0',
  `LEAGUE_NAME` varchar(100) NOT NULL DEFAULT '0',
  `INTRODUCE` varchar(300) NOT NULL DEFAULT '0',
  `KEYWORD` varchar(300) NOT NULL DEFAULT '0',
  `DIRECT_IMAGE` varchar(300) NOT NULL DEFAULT '0',
  `BASIC_IMAGE` varchar(300) NOT NULL DEFAULT '0',
  `EPISODE_NUMBER` int(10) NOT NULL DEFAULT '0',
  `HITS_NO` int(10) NOT NULL DEFAULT '0',
  `INTERESTED_BOOK_NO` int(10) NOT NULL DEFAULT '0',
  `RECOMMENDATION_NO` int(10) NOT NULL DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book: ~0 rows (approximately)
DELETE FROM `book`;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- Dumping structure for table webbook.bookmark
CREATE TABLE IF NOT EXISTS `bookmark` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EPISODE_ID` int(11) NOT NULL,
  `EPISODE_NAME` int(11) DEFAULT NULL,
  `NICKNAME` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.bookmark: ~0 rows (approximately)
DELETE FROM `bookmark`;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;


-- Dumping structure for table webbook.category
CREATE TABLE IF NOT EXISTS `category` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(200) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `GroupId` int(5) DEFAULT NULL,
  `groupName` varchar(200) DEFAULT NULL,
  `catId` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.category: ~20 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`_id`, `catName`, `Description`, `GroupId`, `groupName`, `catId`, `createDate`, `updateDate`) VALUES
	(1, '제너맨', 'Over 25: generman', 1, 'Age group', 1, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(2, '유니티', 'Under 25: unity, generman', 1, 'Age group', 2, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(3, '하이틴', 'Under 20: high teen, unity, generman', 1, 'Age group', 3, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(4, '로우틴', 'Under 15: low teen, high teen, unity, generman', 1, 'Age group', 4, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(5, '로맨스', 'romance', 2, 'genre', 1, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(6, '판타지', 'fantasy', 2, 'genre', 2, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(7, '무협', 'heroism', 2, 'genre', 3, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(8, '퓨전/기타', 'fusion/other', 2, 'genre', 4, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(9, '- 자유게시판', 'freeboard', 3, 'Bulletin ', 1, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(10, '감상평', 'appreciation', 3, 'Bulletin ', 2, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(11, '강의/자료실', 'lecture/documents', 3, 'Bulletin ', 3, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(12, 'FAQ', 'FAQ', 3, 'Bulletin ', 4, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(13, '공지사항', 'official announcements', 3, 'Bulletin ', 5, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(14, '베스트 리그', 'best League', 4, 'Bulletin ', 1, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(15, '챌린지 리그', 'challenge League', 4, 'Bulletin ', 2, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(17, '콘텐츠 부족 등 이용할 만한 서비스 부족', 'challenge League', 5, 'Leave reason', 1, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(18, '고객 서비스 불만', 'challenge League', 5, 'Leave reason', 2, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(19, '시스템 장애(속도저하, 잦은 에러 등) ', 'challenge League', 5, 'Leave reason', 3, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(20, '개인정보의 노출 우려 ', 'challenge League', 5, 'Leave reason', 4, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(21, '기타', 'challenge League', 5, 'Leave reason', 5, '2015-12-09 09:18:18', '2015-12-09 09:18:19');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table webbook.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(300) DEFAULT NULL,
  `TYPE_KEY` int(11) DEFAULT NULL,
  `COMMENT` varchar(300) DEFAULT NULL,
  `REPORT_NUMBER` int(5) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.comment: ~0 rows (approximately)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table webbook.coupon_purchase
CREATE TABLE IF NOT EXISTS `coupon_purchase` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CHARGE_AMOUNT` int(11) DEFAULT NULL,
  `TOTAL_FEE` double DEFAULT NULL,
  `PAYMENT_METHOD_ID` int(2) DEFAULT NULL,
  `PAYMENT_METHOD_NAME` varchar(200) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_purchase: ~0 rows (approximately)
DELETE FROM `coupon_purchase`;
/*!40000 ALTER TABLE `coupon_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_purchase` ENABLE KEYS */;


-- Dumping structure for table webbook.coupon_used
CREATE TABLE IF NOT EXISTS `coupon_used` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `BOOK_NAME` varchar(200) NOT NULL DEFAULT '0',
  `EPISODE_NAME` varchar(200) NOT NULL DEFAULT '0',
  `CHARGE_AMOUNT` double DEFAULT '0',
  `METHOD_PAYMENT` int(11) DEFAULT '0',
  `CHARGE_DATE` int(11) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_used: ~0 rows (approximately)
DELETE FROM `coupon_used`;
/*!40000 ALTER TABLE `coupon_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_used` ENABLE KEYS */;


-- Dumping structure for table webbook.episode
CREATE TABLE IF NOT EXISTS `episode` (
  `_id` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `RATIO` int(11) DEFAULT NULL,
  `SALES_NUMBER` int(11) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `NAME` varchar(300) DEFAULT NULL,
  `CONTENTS` varchar(3000) DEFAULT NULL,
  `EPILOGUE` varchar(300) DEFAULT NULL,
  `HITS_NO` int(11) DEFAULT NULL,
  `RECOMMONDATION_NO` int(11) DEFAULT NULL,
  `REVIEW_NO` int(11) DEFAULT NULL,
  `CHECKED` int(1) DEFAULT '0',
  `IS_SHOW` int(1) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.episode: ~0 rows (approximately)
DELETE FROM `episode`;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;


-- Dumping structure for table webbook.post
CREATE TABLE IF NOT EXISTS `post` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(300) DEFAULT '0',
  `NICKNAME` varchar(300) DEFAULT '0',
  `BULLETIN_ID` int(11) DEFAULT '0',
  `BULLETIN_NAME` varchar(50) DEFAULT '0',
  `IMAGE` varchar(500) DEFAULT '0',
  `CONTENTS` varchar(500) DEFAULT '0',
  `FILE1` varchar(500) DEFAULT '0',
  `FILE2` varchar(500) DEFAULT '0',
  `REPORT_NUMBER` int(5) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.post: ~0 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for table webbook.profit_refund
CREATE TABLE IF NOT EXISTS `profit_refund` (
  `_id` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `DEPOSIT_AMOUNT` double DEFAULT NULL,
  `NAME` varchar(300) DEFAULT NULL,
  `RESIDENT_NUMBER` varchar(300) DEFAULT NULL,
  `CELL_PHONE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(300) DEFAULT NULL,
  `ADDRESS` varchar(300) DEFAULT NULL,
  `ACCOUNT_HOLDER_NAME` varchar(300) DEFAULT NULL,
  `RELATIONSHIP` int(1) DEFAULT NULL,
  `BANK_ID` int(1) DEFAULT NULL,
  `BANK_NAME` varchar(200) DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(200) DEFAULT NULL,
  `APPLICATION_DATE` datetime DEFAULT NULL,
  `DEPOSIT_DATE` datetime DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.profit_refund: ~0 rows (approximately)
DELETE FROM `profit_refund`;
/*!40000 ALTER TABLE `profit_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `profit_refund` ENABLE KEYS */;


-- Dumping structure for table webbook.report
CREATE TABLE IF NOT EXISTS `report` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TYPE_KEY` varchar(100) NOT NULL DEFAULT '0',
  `REASON` varchar(300) NOT NULL DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.report: ~0 rows (approximately)
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


-- Dumping structure for table webbook.user
CREATE TABLE IF NOT EXISTS `user` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `NICKNAME` varchar(200) DEFAULT NULL,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `AGE_GROUP` int(5) DEFAULT NULL,
  `AUTHOR_LEVEL` int(5) DEFAULT NULL,
  `SEX` varchar(50) DEFAULT NULL,
  `DAY_OF_BIRTH` date DEFAULT NULL,
  `PHONE` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ADULT_VERIFICATION` int(1) DEFAULT NULL,
  `TOTAL_COUPON` int(11) DEFAULT NULL,
  `LEAVE_REASON` int(11) DEFAULT NULL,
  `ACTIVE` int(1) DEFAULT NULL,
  `ROLE` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.user: ~7 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`_id`, `USERNAME`, `PASSWORD`, `NICKNAME`, `FULLNAME`, `AGE_GROUP`, `AUTHOR_LEVEL`, `SEX`, `DAY_OF_BIRTH`, `PHONE`, `EMAIL`, `ADULT_VERIFICATION`, `TOTAL_COUPON`, `LEAVE_REASON`, `ACTIVE`, `ROLE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(10, 'user1', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', NULL, NULL, 'sex', NULL, '11111', NULL, NULL, NULL, NULL, NULL, 1, 0, '2015-11-06 11:23:49', '2015-11-06 11:23:48'),
	(12, 'user2', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', NULL, NULL, 'sex', NULL, '11111', 'dfsfs', NULL, NULL, NULL, NULL, 0, 0, '2015-11-06 11:23:50', '2015-11-06 11:23:51'),
	(22, 'user4', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', NULL, NULL, 'sex', NULL, '40230489302', 'dfsfs', NULL, NULL, NULL, NULL, 0, 0, '2015-11-06 11:23:53', '2015-11-06 11:23:53'),
	(27, 'user6', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', NULL, NULL, '', NULL, '09430294023', '', NULL, NULL, NULL, NULL, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(66, 'admin', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', NULL, NULL, '', NULL, '09430294023', '', NULL, NULL, NULL, 1, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(67, 'abc', '4ed9407630eb1000c0f6b63842defa7d', 'Kenny', 'Kenny', NULL, NULL, 'male', NULL, '1165516', 'daf@gmail.com', NULL, NULL, NULL, NULL, 0, 0, '2015-11-09 22:03:32', '2015-11-09 22:03:32'),
	(70, 'zin', '96e79218965eb72c92a549dd5a330112', 'Kenny', 'Kenny', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, '2015-11-16 09:01:47', '2015-11-16 09:01:47');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
