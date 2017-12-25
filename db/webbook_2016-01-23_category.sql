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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
