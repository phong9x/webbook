

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
  `USER_ID` int(11) DEFAULT NULL,
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
  `HITS_NO` int(10) DEFAULT '0',
  `INTERESTED_BOOK_NO` int(10) DEFAULT '0',
  `RECOMMENDATION_NO` int(10) DEFAULT '0',
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
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `EPISODE_NAME` int(11) DEFAULT NULL,
  `NICKNAME` longtext,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `EPISODE_ID` (`EPISODE_ID`),
  KEY `FK_bookmark_user` (`USER_ID`),
  KEY `FK_bookmark_episode` (`EPISODE_ID`),
  CONSTRAINT `FK_bookmark_episode` FOREIGN KEY (`EPISODE_ID`) REFERENCES `episode` (`_id`),
  CONSTRAINT `FK_bookmark_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.bookmark: ~0 rows (approximately)
DELETE FROM `bookmark`;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.book_viewing: ~0 rows (approximately)
DELETE FROM `book_viewing`;
/*!40000 ALTER TABLE `book_viewing` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.category: ~110 rows (approximately)
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
	(13, '공지사항', 'offical announcement', 3, 'Bulletin ', 5, NULL, '2016-01-23 16:41:54', '2016-01-23 16:41:55'),
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
	(207, '기타 22\r\n', '', 11, 'Cover image default', NULL, 'images/cover_image/기타_22.jpg\r\n', '2015-12-21 17:11:34', '2015-12-21 17:11:34'),
	(225, 'romano', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(226, 'key 2', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(227, 'key 3', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(228, 'key 4', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(229, 'key 5', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(230, 'key 6', '로맨스', 6, 'Keyword 1', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(231, 'fantasy', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(232, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(233, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(234, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(235, '무협', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(236, 'key 1', '판타지', 7, 'Keyword 2', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(237, 'key 1', '무협', 8, 'Keyword 3', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(238, '무협', '무협', 8, 'Keyword 3', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(239, 'key 1', '퓨전/기타', 9, 'Keyword 4', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19'),
	(240, '퓨전/기타', '퓨전/기타', 9, 'Keyword 4', NULL, NULL, '2016-01-22 09:30:19', '2016-01-22 09:30:19');
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
  `CANCEL_REASON` varchar(300) DEFAULT NULL,
  `CANCEL_CODE` varchar(300) DEFAULT NULL,
  `CANCEL` int(1) DEFAULT '0',
  `IS_DELETE` int(1) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_coupon_purchase_user` (`USER_ID`),
  CONSTRAINT `FK_coupon_purchase_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
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
  PRIMARY KEY (`_id`),
  KEY `FK_coupon_used_user` (`USER_ID`),
  KEY `FK_coupon_used_book` (`BOOK_ID`),
  KEY `FK_coupon_used_episode` (`EPISODE_ID`),
  CONSTRAINT `FK_coupon_used_book` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_coupon_used_episode` FOREIGN KEY (`EPISODE_ID`) REFERENCES `episode` (`_id`),
  CONSTRAINT `FK_coupon_used_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.coupon_used: ~0 rows (approximately)
DELETE FROM `coupon_used`;
/*!40000 ALTER TABLE `coupon_used` DISABLE KEYS */;
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
  `VIEW_NO` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.episode: ~0 rows (approximately)
DELETE FROM `episode`;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.interested_book: ~0 rows (approximately)
DELETE FROM `interested_book`;
/*!40000 ALTER TABLE `interested_book` DISABLE KEYS */;
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
  PRIMARY KEY (`_id`),
  UNIQUE KEY `USER_ID_EPISODE_ID` (`USER_ID`,`EPISODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.like_history: ~0 rows (approximately)
DELETE FROM `like_history`;
/*!40000 ALTER TABLE `like_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_history` ENABLE KEYS */;


-- Dumping structure for table webbook.post
CREATE TABLE IF NOT EXISTS `post` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
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
  `BOOK_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `FK_post_user` (`USER_ID`),
  KEY `FK_246cfpxtxxy5rf89xjw5yjfku` (`BOOK_ID`),
  CONSTRAINT `FK_246cfpxtxxy5rf89xjw5yjfku` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`_id`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.profit_refund: ~0 rows (approximately)
DELETE FROM `profit_refund`;
/*!40000 ALTER TABLE `profit_refund` DISABLE KEYS */;
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

-- Dumping data for table webbook.user: ~5 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`_id`, `USERNAME`, `PASSWORD`, `NICKNAME`, `FULLNAME`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `AUTHOR_LEVEL`, `AUTHOR_NAME`, `GENDER`, `DAY_OF_BIRTH`, `PHONE`, `EMAIL`, `ADULT_VERIFICATION`, `TOTAL_COUPON`, `LEAVE_REASON`, `ACTIVE`, `ROLE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(66, 'admin', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '09430294023', '', 0, 0, NULL, 1, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56');
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
