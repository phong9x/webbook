-- --------------------------------------------------------
-- Host:                         192.168.170.115
-- Server version:               5.6.28 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- Dumping data for table webbook.user: ~33 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`_id`, `USERNAME`, `PASSWORD`, `NICKNAME`, `FULLNAME`, `AGE_GROUP_ID`, `AGE_GROUP_NAME`, `AUTHOR_LEVEL`, `AUTHOR_NAME`, `GENDER`, `DAY_OF_BIRTH`, `PHONE`, `EMAIL`, `ADULT_VERIFICATION`, `TOTAL_COUPON`, `LEAVE_REASON`, `ACTIVE`, `ROLE`, `IS_DELETE`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
	(10, 'kenny', '698d51a19d8a121ce581499d7b701668', 'KennyP', 'KennyP', 2, '유니티', 27, '베스트리그', '여', '1993-03-03', '09734252952', 'kennyphong2811@gmail.com', 0, 349, '', 1, 0, 0, '2016-01-08 18:30:18', '2016-01-20 13:48:01'),
	(12, 'kenny2', '698d51a19d8a121ce581499d7b701668', 'phongduong', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '11111', 'dfsfs', NULL, 0, NULL, 0, 0, 1, '2016-01-02 11:23:50', '2015-11-06 11:23:51'),
	(22, 'user4', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '40230489302', 'dfsfs', NULL, 0, NULL, 0, 0, 1, '2015-11-06 11:23:53', '2015-11-06 11:23:53'),
	(27, 'user6', '698d51a19d8a121ce581499d7b701668', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '09430294023', '', NULL, 0, NULL, 0, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(66, 'admin', '698d51a19d8a121ce581499d7b701668', '관리자', '관리자', 1, '제너맨', 28, '챌린지리그', '여', '2016-01-05', '09430294023', '', NULL, 0, NULL, 1, 1, 0, '2015-11-06 11:24:00', '2015-11-06 11:23:56'),
	(67, 'abc', '4ed9407630eb1000c0f6b63842defa7d', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '1165516', 'daf@gmail.com', NULL, 0, NULL, 0, 0, 0, '2016-01-09 22:03:32', '2015-11-09 22:03:32'),
	(70, 'zin', '96e79218965eb72c92a549dd5a330112', 'Kenny', 'Kenny', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '', '', NULL, 0, NULL, 0, 0, 1, '2016-01-16 09:01:47', '2015-11-16 09:01:47'),
	(71, 'admin111', '111', 'KennyP3', 'test', 1, '제너맨', 28, '챌린지리그', '남', '2016-01-05', '0973425295', 'admin@photoring.com', 0, 0, NULL, 1, 0, 0, '2015-12-17 15:59:58', '2015-12-17 15:59:58'),
	(73, 'user623', '698d51a19d8a121ce581499d7b701668', 'KennyP2', 'Posiden', 1, '제너맨', 28, '챌린지리그', '여', '1985-07-07', '098890770911', 'admin@photoring.com', 0, 0, NULL, 1, 0, 0, '2015-12-17 16:21:28', '2015-12-17 16:21:28'),
	(74, 'admin1111', '96e79218965eb72c92a549dd5a330112', '1111111111111', 'tester', 1, '제너맨', 28, '챌린지리그', '남', '1986-05-18', '098890770911', 'admin@photoring.com', 0, 0, NULL, 1, 0, 0, '2016-01-07 10:50:48', '2016-01-07 10:50:48'),
	(75, 'admin1112', '96e79218965eb72c92a549dd5a330112', 'Kenny Phongadasd', 'test', 1, '제너맨', 28, '챌린지리그', '여', '1985-02-01', '098890770911', 'admin@photoring.com', 0, 0, NULL, 1, 0, 0, '2016-01-07 10:57:11', '2016-01-07 10:57:11'),
	(78, 'kenny123', 'fb6d51c28b589c1605efd5ad890f8701', 'Kenny', 'Posiden', 1, '제너맨', 26, '작가관', '남', '1985-05-18', '0973425295', 'kennyphong2811@gmail.com', 0, 0, NULL, 1, 0, 0, '2016-03-14 13:11:24', '2016-01-14 13:11:24'),
	(79, 'pegarus', '8425d751625b831e55f4382600fc2e6b', 'Vicky', 'Vicky', 1, '제너맨', 26, '작가관', '여', '1986-03-01', '098890770911', 'kennyphong2811@gmail.com', 0, 0, NULL, 1, 0, 0, '2016-02-14 13:13:12', '2016-01-14 13:13:53'),
	(80, 'samsam123', 'e10adc3949ba59abbe56e057f20f883e', 'samsam', 'sam', 4, '로우틴', 26, '작가관', '여', '1990-11-08', '0123456789', 'samsam123@gmail.com', 0, 2470, NULL, 1, 0, 0, '2016-01-20 21:41:44', '2016-01-20 21:41:44'),
	(81, 'sonic123', 'e10adc3949ba59abbe56e057f20f883e', 'sonic', 'sonic', 1, '제너맨', 28, '챌린지리그', '여', '1990-11-08', '010111010', 'sonic123@gmail.com', NULL, 27, NULL, 1, 0, 0, '2016-01-21 03:03:39', '2016-01-21 03:03:39'),
	(82, 'testtest', '05a671c66aefea124cc08b76ea6d30bb', 'test', 'test', 1, '제너맨', 28, '챌린지리그', '남', '1986-02-01', '12341234', 'test@test.com', NULL, 0, NULL, 1, 0, 0, '2016-01-22 01:28:57', '2016-01-22 01:28:57'),
	(83, 'kjchae', 'bb8c2c56f435a1c14900acedaa0df3c5', 'kjchae', '채기정', 1, '제너맨', 28, '챌린지리그', '남', '1984-10-21', '01012341234', 'kjchae@trams.co.kr', NULL, 0, NULL, 1, 0, 0, '2016-01-22 03:09:20', '2016-01-22 03:09:20'),
	(84, 'ojlcn15288', 'ac97fce72f7989bb098aff9f6b698d27', 'ojlcn5288', '오청림', 2, '유니티', 28, '챌린지리그', '여', '1994-09-08', '01023236004', 'ojlcn5288@naver.com', NULL, 29, NULL, 1, 0, 0, '2016-01-22 06:36:33', '2016-01-22 06:36:33'),
	(85, 'oss222', '36e03e5de4fd6d3123a58b9e294a8db2', '아우린', '오송식', 1, '제너맨', 28, '챌린지리그', '남', '1959-06-04', '010-3631-5288', 'oss222@hanmail.net', NULL, 0, NULL, 1, 0, 0, '2016-01-22 20:32:33', '2016-01-22 20:32:33'),
	(86, 'shjera46', '514e8cd900cec6213e6a14105fcfcdbd', '선인왕네오', '서형진', 2, '유니티', 28, '챌린지리그', '남', '1993-04-08', '01024507344', 'shjera46@naver.com', NULL, 683, NULL, 1, 0, 0, '2016-01-24 20:35:50', '2016-02-01 15:45:17'),
	(87, 'kmhkmhzz', '2355ec437a112f3c16c3a79afaaf2088', '밍킹이에요', '강민호', 1, '제너맨', 28, '챌린지리그', '남', '1990-06-14', '01046268435', 'kmhkmhzz@nate.com', NULL, 0, NULL, 1, 0, 0, '2016-01-26 21:34:29', '2016-01-26 21:34:29'),
	(88, 'naruto', 'e10adc3949ba59abbe56e057f20f883e', 'naruto', 'naruto kim', 1, '제너맨', 28, '챌린지리그', '남', '1983-02-01', '0986373671', 'duyquyetdo.scom@gmail.com', NULL, 0, NULL, 0, 0, 0, '2016-01-27 00:03:14', '2016-01-27 00:03:14'),
	(89, 'wendy123', 'e10adc3949ba59abbe56e057f20f883e', 'wendy', 'wendy', 1, '제너맨', 27, '리그&공모', '여', '1990-02-01', '0123456789', 'wendy123@gmail.com', 0, 0, NULL, 1, 0, 0, '2016-01-28 23:51:09', '2016-02-04 14:01:52'),
	(90, 'qwerty', 'e10adc3949ba59abbe56e057f20f883e', 'qwerty', 'qwerty', 1, '제너맨', 26, '작가관', '여', '1986-02-01', '123456', 'qwerty@gmail.com', 0, 0, NULL, 1, 0, 0, '2016-01-29 04:53:32', '2016-01-29 04:53:32'),
	(91, 'shj7344', '5d93ceb70e2bf5daa84ec3d0cd2c731a', 'baronSeo', '서남작', 2, '유니티', 28, '챌린지리그', '남', '1993-09-19', '01024507344', 'shjera46@naver.com', NULL, 866, NULL, 1, 0, 0, '2016-02-01 16:20:55', '2016-02-01 16:36:03'),
	(92, 'tht123', 'e10adc3949ba59abbe56e057f20f883e', 'tht', 'tht', 3, '하이틴', 28, '챌린지리그', '여', '1998-10-01', '123456', 'tht123@gmail.com', NULL, 0, NULL, 0, 0, 0, '2016-02-01 17:01:29', '2016-02-01 17:01:29'),
	(93, 'oss333', '26d773e81f3a6086fe58d9bfb0afcbd6', 'oh_yes', '오송송', 1, '제너맨', 26, '작가관', '남', '1965-02-01', '010-3631-5288', 'oss222@hanmail.net', 0, 0, NULL, 1, 0, 0, '2016-02-03 16:21:46', '2016-02-03 16:31:23'),
	(94, 'kangwook', 'e09c80c42fda55f9d992e59ca6b3307d', '김강욱', '김강욱', 1, '제너맨', 28, '챌린지리그', '남', '1980-02-01', '010-0000-0000', 'kangwook@naver.com', NULL, 0, NULL, 0, 0, 0, '2016-02-03 18:59:40', '2016-02-03 18:59:40'),
	(95, 'testqq', 'abe003354a8c5ccf6eead749f9b4632f', 'testqqq', 'test', 1, '제너맨', 27, '리그&공모', '남', '1986-02-01', 'testqq', 'testqq', NULL, 0, NULL, 0, 0, 0, '2016-02-05 14:58:23', '2016-02-05 14:58:23'),
	(96, 'wendy000', 'e10adc3949ba59abbe56e057f20f883e', 'wendy000', 'wendy000', 1, '제너맨', 27, '리그&공모', '남', '1986-02-01', '333', 'wendy000@gmail.com', NULL, 0, NULL, 1, 0, 0, '2016-02-17 09:21:00', '2016-02-17 09:21:00'),
	(97, 'phongquynh', '96e79218965eb72c92a549dd5a330112', 'KennyPhong', 'Kenny Phong', 1, '제너맨', 27, '리그&공모', '남', '1986-02-01', '098890770911', 'phong.kenny@facebook.com', 0, 0, NULL, 0, 0, 0, '2016-02-17 10:05:36', '2016-02-17 10:05:36'),
	(98, 'sonic456', 'e10adc3949ba59abbe56e057f20f883e', 'sonic456', 'sonic', 1, '제너맨', 27, '리그&공모', '남', '1986-02-01', '333', 'sonic456@gmail.com', 0, 0, NULL, 1, 0, 0, '2016-02-17 11:56:12', '2016-02-17 11:56:12'),
	(99, 'pegarus1', 'e10adc3949ba59abbe56e057f20f883e', 'KennyPhong2', 'Kenny Phong', 1, '제너맨', 27, '리그&공모', '남', '1986-02-01', '0973425295', 'kennyphong2811@gmail.com', 0, 0, NULL, 0, 0, 0, '2016-02-17 13:34:45', '2016-02-17 13:34:45');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
