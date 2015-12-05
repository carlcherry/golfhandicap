CREATE DATABASE  IF NOT EXISTS `Golf` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Golf`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: Golf
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Drop all the tables first

DROP TABLE IF EXISTS `Score`;
DROP TABLE IF EXISTS `GolfCourseRating`;
DROP TABLE IF EXISTS `GolfCourse`;
DROP TABLE IF EXISTS `User`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GolfCourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postalCode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `golf_course_email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GolfCourseRating`
--
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GolfCourseRating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `golfCourseId` int(11) NOT NULL,
  `teeBlock` varchar(45) NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `slope` smallint(6) NOT NULL,
  PRIMARY KEY (`golfCourseId`,`teeBlock`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `golf_course_idx` FOREIGN KEY (`id`) REFERENCES `GolfCourse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Score`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Score` (
  `userId` int(11) NOT NULL,
  `golfCourseRatingId` int(11) NOT NULL,
  `datePlayed` date NOT NULL,
  `rawScore` smallint(6) NOT NULL,
  `netScore` smallint(6) NOT NULL,
  PRIMARY KEY (`userId`,`golfCourseRatingId`,`datePlayed`),
  KEY `golf_course_rating_idx_idx` (`golfCourseRatingId`),
  CONSTRAINT `golf_course_rating_idx` FOREIGN KEY (`golfCourseRatingId`) REFERENCES `GolfCourseRating` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_idx` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'Golf'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-05 10:34:29
