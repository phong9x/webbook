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
  `HITS_NO` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.announcement: ~11 rows (approximately)
DELETE FROM `announcement`;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`_id`, `BOOK_ID`, `TITLE`, `CONTENTS`, `HITS_NO`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(2, 33, 'Wait episode 10 in ten dáy', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(3, 33, 'Wait episode 10 in ten dáy', 'Wonderful', 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(4, 33, 'Wait episode 10 in ten dáy', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(5, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(6, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(7, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(8, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 1, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(9, 1, 'Wait episode 10 in for ten day', 'Wonderful', 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(10, 33, 'Wait episode 10 in for ten day', 'Wonderful', 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13'),
	(11, 1, 'Wait episode 10 in for ten day', 'Wonderful', 1, 0, '2015-12-25 17:01:12', '2015-12-25 17:01:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book: ~29 rows (approximately)
DELETE FROM `book`;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`_id`, `USER_ID`, `USER_NICKNAME`, `TITLE`, `GENRE_ID`, `GENRE_NAME`, `ADULT`, `DAY_OF_WEEK`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `LEAGUE_ID`, `LEAGUE_NAME`, `INTRODUCE`, `COVER_IMAGE`, `EPISODE_NUMBER`, `HITS_NO`, `INTERESTED_BOOK_NO`, `RECOMMENDATION_NO`, `KEYWORD_1`, `KEYWORD_2`, `KEYWORD_3`, `KEYWORD_4`, `COMEPLETE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(1, 12, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 2, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 4, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:49:09', '2015-12-22 13:49:09'),
	(2, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(3, 12, 'duonglt', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(4, 12, 'kennyphong', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(5, 10, 'duonglt', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(6, 10, 'kennyphong', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(7, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(8, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(9, 10, 'kennyphong', 'Eragon', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(10, 12, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 1, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(11, 10, 'duonglt', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(12, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(13, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(14, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(15, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(16, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(17, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(18, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(19, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(20, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(21, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(22, 10, 'kennyphong', 'Harry Potter', 5, '로맨스', '성인', '화', 1, '유니티', 27, '베스트리그', 'adverture', '/images/cover_image/default1.jpg', 0, 2, 4, 2, NULL, NULL, NULL, NULL, 0, 0, '2015-12-22 13:27:24', '2015-12-22 13:27:24'),
	(27, 10, 'Kenny', 'Fairy Taile', 6, '판타지', '성인', '수', 1, '제너맨', 28, '챌린지리그', 'introduce', '/images/cover_image/default1.jpg', 0, 11111, 4, 3, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 0, '2015-12-23 16:28:17', '2015-12-23 16:28:17'),
	(28, 10, 'Kenny', 'Fairy Taile', 6, '판타지', '성인', '화, 금', 2, '유니티', 28, '챌린지리그', 'i love you more can say', '/images/cover_image/default1.jpg', 0, 111, 4, 3, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 0, '2015-12-23 16:29:43', '2015-12-23 16:29:43'),
	(29, 10, 'Kenny', 'Pegarus', 5, '로맨스', '성인', '남, 수, 금, 토', 2, '유니티', 28, '챌린지리그', 'introduce', '/images/cover_image/default1.jpg', 0, 1111111, 0, 0, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 0, '2015-12-23 16:32:24', '2015-12-23 16:32:24'),
	(30, 10, 'Kenny', 'Fairy Taile', 5, '로맨스', '일반', '남, 수', 1, '제너맨', 28, '챌린지리그', 'ádsada', '/images/cover_image/default1.jpg', 0, 111111, 0, 0, NULL, NULL, '무협', NULL, 0, 0, '2015-12-24 10:57:39', '2015-12-24 10:57:39'),
	(32, 10, 'Kenny', 'Eragon', 5, '로맨스', '일반', '화, 수', 2, '유니티', 28, '챌린지리그', 'asdad', '/images/cover_image/default1.jpg', 0, 11, 0, 0, '로맨스', '로맨스', NULL, NULL, 0, 0, '2015-12-24 10:59:58', '2015-12-24 10:59:58'),
	(33, 10, 'Kenny', 'Eragon', 5, '로맨스', '일반', '남', 2, '유니티', 28, '챌린지리그', 'aaa', '/images/cover_image/default1.jpg', 18, 1111111, 0, 0, '로맨스', '로맨스', NULL, NULL, 0, 0, '2015-12-24 15:50:24', '2015-12-24 15:50:24'),
	(34, 10, 'Kenny', 'Love Story', 5, '로맨스', '일반', '남, 수', 1, '제너맨', 28, '챌린지리그', 'introduce', '/images/cover_image/default1.jpg', 1, 1111111, 0, 0, '로맨스', '로맨스', '무협', '퓨전/기타', 0, 1, '2015-12-24 17:33:21', '2015-12-24 17:33:21');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- Dumping structure for table webbook.bookmark
CREATE TABLE IF NOT EXISTS `bookmark` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EPISODE_ID` int(11) NOT NULL,
  `EPISODE_NAME` int(11) DEFAULT NULL,
  `NICKNAME` varchar(300) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.bookmark: ~3 rows (approximately)
DELETE FROM `bookmark`;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` (`_id`, `USER_ID`, `EPISODE_ID`, `EPISODE_NAME`, `NICKNAME`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(30, 10, 33, 33, 'Kenny', 0, '2015-12-30 16:50:17', '2015-12-30 16:50:17'),
	(32, 10, 35, 35, 'Kenny', 0, '2015-12-30 16:53:21', '2015-12-30 16:53:21'),
	(33, 10, 39, 39, 'Kenny', 0, '2015-12-30 16:54:39', '2015-12-30 16:54:39');
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.category: ~30 rows (approximately)
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
	(14, '베스트 리그', 'best League', 4, 'Bulletin ', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(15, '챌린지 리그', 'challenge League', 4, 'Bulletin ', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(17, '콘텐츠 부족 등 이용할 만한 서비스 부족', '', 5, 'Leave reason', 1, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(18, '고객 서비스 불만', '', 5, 'Leave reason', 2, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(19, '시스템 장애(속도저하, 잦은 에러 등) ', '', 5, 'Leave reason', 3, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(20, '개인정보의 노출 우려 ', '', 5, 'Leave reason', 4, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(21, '기타', '', 5, 'Leave reason', 5, NULL, '2015-12-09 09:18:18', '2015-12-09 09:18:19'),
	(22, '로맨스', '로맨스', 6, 'Keyword 1', NULL, NULL, '2015-12-21 17:11:28', '2015-12-21 17:11:29'),
	(23, '판타지', '판타지', 7, 'Keyword 2', NULL, NULL, '2015-12-21 17:11:31', '2015-12-21 17:11:30'),
	(24, '무협', '무협', 8, 'Keyword 3', NULL, NULL, '2015-12-21 17:11:32', '2015-12-21 17:11:33'),
	(25, '퓨전/기타', '퓨전/기타', 9, 'Keyword 4', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(26, '작가관', 'official author', 10, 'Categorization', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(27, '베스트리그', 'best league', 10, 'Categorization', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(28, '챌린지리그', 'challenge league', 10, 'Categorization', NULL, NULL, '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(30, '기본 이미지 1', '', 11, 'Cover image default', NULL, '/images/cover_image/default1.jpg', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(31, '기본 이미지 2', '', 11, 'Cover image default', NULL, '/images/cover_image/default2.jpg', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(32, '기본 이미지 3', '', 11, 'Cover image default', NULL, '/images/cover_image/default3.jpg', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(33, '기본 이미지 4', '', 11, 'Cover image default', NULL, '/images/cover_image/default4.jpg', '2015-12-21 17:11:34', '2015-12-21 17:11:34');
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
  `USER_ID` int(11) DEFAULT NULL,
  `EPISODE_ID` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) DEFAULT NULL,
  `CHARGE_AMOUNT` int(11) DEFAULT '0',
  `METHOD_PAYMENT` int(5) DEFAULT NULL,
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_used: ~4 rows (approximately)
DELETE FROM `coupon_used`;
/*!40000 ALTER TABLE `coupon_used` DISABLE KEYS */;
INSERT INTO `coupon_used` (`_id`, `USER_ID`, `EPISODE_ID`, `BOOK_ID`, `CHARGE_AMOUNT`, `METHOD_PAYMENT`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(7, 10, 48, 47, 5, NULL, 0, '2015-12-30 15:03:36', '2015-12-30 15:03:36'),
	(8, 10, 48, 47, 5, NULL, 0, '2015-12-30 15:03:50', '2015-12-30 15:03:50'),
	(9, 10, 48, 49, 5, NULL, 0, '2015-12-30 15:05:41', '2015-12-30 15:05:41'),
	(10, 10, 49, 48, 1, NULL, 0, '2015-12-30 15:07:09', '2015-12-30 15:07:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.episode: ~23 rows (approximately)
DELETE FROM `episode`;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` (`_id`, `BOOK_ID`, `EPISODE_NUMBER`, `TITLE`, `CONTENT`, `EPILOGUE`, `PRICE`, `RATIO`, `SALES_NUMBER`, `AMOUNT`, `HITS_NO`, `RECOMMONDATION_NO`, `REVIEW_NO`, `COMPLETE`, `TEMPORARY_SAVE`, `IS_SHOW`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(33, 33, 1, 'Eragon', 'This book is dedicated to my mom, for showing me the magic in the world;\r\nto my dad, for revealing the man behind the curtain.\r\nAnd also to my sister, Angela, for helping when I’m “blue.”\r\nPROLOGUE:\r\nSHADE OF FEAR\r\nWind howled through the night, carrying a scent that would change the world. A tall\r\nShade lifted his head and sniffed the air. He looked human except for his crimson hair\r\nand maroon eyes.\r\nHe blinked in surprise. The message had been correct: they were here. Or was it a trap?\r\nHe weighed the odds, then said icily, “Spread out; hide behind trees and bushes. Stop\r\nwhoever is coming . . . or die.”\r\nAround him shuffled twelve Urgals with short swords and round iron shields painted with\r\nblack symbols. They resembled men with bowed legs and thick, brutish arms made for\r\ncrushing. A pair of twisted horns grew above their small ears. The monsters hurried into\r\nthe brush, grunting as they hid. Soon the rustling quieted and the forest was silent again.\r\nThe Shade peered around a thick tree and looked up the trail. It was too dark for any\r\nhuman to see, but for him the faint moonlight was like sunshine streaming between the\r\ntrees; every detail was clear and sharp to his searching gaze. He remained unnaturally\r\nquiet, a long pale sword in his hand. A wire-thin scratch curved down the blade. The\r\nweapon was thin enough to slip between a pair of ribs, yet stout enough to hack through\r\nthe hardest armor.\r\nThe Urgals could not see as well as the Shade; they groped like blind beggars, fumbling\r\nwith their weapons. An owl screeched, cutting through the silence. No one relaxed until\r\nthe bird flew past. Then the monsters shivered in the cold night; one snapped a twig with\r\nhis heavy boot. The Shade hissed in anger, and the Urgals shrank back, motionless. He\r\nsuppressed his distaste—they smelled like fetid meat—and turned away. They were tools,\r\nnothing more.\r\nThe Shade forced back his impatience as the minutes became hours. The scent must have\r\nwafted far ahead of its owners. He did not let the Urgals get up or warm themselves. He\r\ndenied himself those luxuries, too, and stayed behind the tree, watching the trail. Another\r\ngust of wind rushed through the forest. The smell was stronger this time. Excited, he\r\nlifted a thin lip in a snarl.\r\n“Get ready,” he whispered, his whole body vibrating. The tip of his sword moved in\r\nsmall circles. It had taken many plots and much pain to bring himself to this moment. It\r\nwould not do to lose control now.\r\nEyes brightened under the Urgals’ thick brows, and the creatures gripped their weapons\r\ntighter. Ahead of them, the Shade heard a clink as something hard struck a loose stone.\r\nFaint smudges emerged from the darkness and advanced down the trail.\r\nThree white horses with riders cantered toward the ambush, their heads held high and\r\nproud, their coats rippling in the moonlight like liquid silver.\r\nOn the first horse was an elf with pointed ears and elegantly slanted eyebrows. His build\r\nwas slim but strong, like a rapier. A powerful bow was slung on his back. A sword\r\npressed against his side opposite a quiver of arrows fletched with swan feathers.\r\nThe last rider had the same fair face and angled features as the other. He carried a long\r\nspear in his right hand and a white dagger at his belt. A helm of extraordinary\r\ncraftsmanship, wrought with amber and gold, rested on his head.\r\nBetween these two rode a raven-haired elven lady, who surveyed her surroundings with\r\npoise. Framed by long black locks, her deep eyes shone with a driving force. Her clothes\r\nwere unadorned, yet her beauty was undiminished. At her side was a sword, and on her\r\nback a long bow with a quiver. She carried in her lap a pouch that she frequently looked\r\nat, as if to reassure herself that it was still there.\r\nOne of the elves spoke quietly, but the Shade could not hear what was said. The lady\r\nanswered with obvious authority, and her guards switched places. The one wearing the\r\n', 'aaaaaaaaaaaaa', 0, 0, 0, 0, 0, 15, 0, 1, 0, 1, 0, '2015-12-24 16:26:25', '2015-12-30 18:34:54'),
	(34, 33, 2, 'Eragon', 'Line 1\r\nLine 2\r\n\r\nLine 3', 'asdasda', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, '2015-12-24 16:31:30', '2015-12-30 11:43:08'),
	(35, 33, 3, 'Eragon', 'adasda', 'asdasda', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-24 16:33:02', '2015-12-24 16:33:02'),
	(38, 33, 4, 'Eragon', '1111', '222', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 16:44:58', '2015-12-24 17:43:41'),
	(39, 33, 5, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(46, 33, 6, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(47, 33, 7, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(48, 33, 8, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(49, 33, 9, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-24 17:12:06'),
	(50, 33, 10, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(51, 33, 11, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(52, 33, 12, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(53, 33, 13, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(54, 33, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(55, 33, 15, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(56, 33, 16, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(57, 33, 17, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(58, 1, 1, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(59, 1, 2, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(60, 1, 3, 'Harry Potter', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(61, 33, 17, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(62, 33, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36'),
	(63, 34, 14, 'Eragon', 'asdasdadas', 'asdasdasdasdas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2015-12-24 17:12:06', '2015-12-28 10:58:36');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.like_history: ~0 rows (approximately)
DELETE FROM `like_history`;
/*!40000 ALTER TABLE `like_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_history` ENABLE KEYS */;


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
  `VIEWS_NUMBER` int(11) DEFAULT '0',
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
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `DEPOSIT_AMOUNT` double DEFAULT NULL,
  `PROFIT_REFUND_NAME` varchar(300) DEFAULT NULL,
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
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
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
  `AGE_GROUP_ID` int(5) DEFAULT NULL,
  `AGE_GROUP_NAME` varchar(100) NOT NULL DEFAULT '0',
  `AUTHOR_LEVEL` int(5) DEFAULT NULL,
  `AUTHOR_NAME` varchar(100) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.user: ~9 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`_id`, `USERNAME`, `PASSWORD`, `NICKNAME`, `FULLNAME`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `AUTHOR_LEVEL`, `AUTHOR_NAME`, `GENDER`, `DAY_OF_BIRTH`, `PHONE`, `EMAIL`, `ADULT_VERIFICATION`, `TOTAL_COUPON`, `LEAVE_REASON`, `ACTIVE`, `ROLE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(10, 'kenny', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'kenny', 1, '0', 28, NULL, '여', NULL, '11111', 'kennyphong2811@gmail.com', NULL, 64, NULL, NULL, 0, 0, '2015-11-06 11:23:49', '2015-11-06 11:23:48'),
	(12, 'kenny2', '698d51a19d8a121ce581499d7b701668', 'phongduong', 'Kenny', 2, '0', 28, NULL, '여', NULL, '11111', 'dfsfs', NULL, 10, NULL, NULL, 0, 0, '2015-11-06 11:23:50', '2015-11-06 11:23:51'),
	(22, 'user4', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 3, '0', 28, NULL, '여', NULL, '40230489302', 'dfsfs', NULL, 10, NULL, NULL, 0, 0, '2015-11-06 11:23:53', '2015-11-06 11:23:53'),
	(27, 'user6', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 4, '0', 28, NULL, '여', NULL, '09430294023', '', NULL, 0, NULL, NULL, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(66, 'admin', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '0', 28, NULL, '여', NULL, '09430294023', '', NULL, 0, NULL, 1, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(67, 'abc', '4ed9407630eb1000c0f6b63842defa7d', 'Kenny', 'Kenny', 2, '0', 28, NULL, '남', NULL, '1165516', 'daf@gmail.com', NULL, 0, NULL, NULL, 0, 0, '2015-11-09 22:03:32', '2015-11-09 22:03:32'),
	(70, 'zin', '96e79218965eb72c92a549dd5a330112', 'Kenny', 'Kenny', 3, '0', 28, NULL, '남', NULL, '', '', NULL, 0, NULL, NULL, 0, NULL, '2015-11-16 09:01:47', '2015-11-16 09:01:47'),
	(71, 'admin111', '111', 'Kenny Phong 2', 'test', 4, '0', 28, NULL, '남', NULL, '0973425295', 'admin@photoring.com', NULL, 0, NULL, 1, 0, NULL, '2015-12-17 15:59:58', '2015-12-17 15:59:58'),
	(73, 'user623', '698d51a19d8a121ce581499d7b701668', 'Kenny Phong', 'Posiden', 4, '0', 28, NULL, '여', '1985-07-07', '098890770911', 'admin@photoring.com', NULL, 0, NULL, 1, 0, 0, '2015-12-17 16:21:28', '2015-12-17 16:21:28');
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
