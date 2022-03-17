/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - parcial1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parcial1`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(11) NOT NULL,
  `journeyId` int(11) NOT NULL,
  `degreedId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journeyId` (`journeyId`),
  KEY `degreedId` (`degreedId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degreedId`) REFERENCES `degrees` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `levelId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `abbreviation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelId`),
  CONSTRAINT `degrees_ibfk_1` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`createdAt`,`updatedAt`,`name`,`abbreviation`) values 
(16,'2021-11-19 19:42:18',0,'Matutina','Mat.');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `updatedAt` int(50) NOT NULL,
  `abbreviation` int(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(11) NOT NULL,
  `academicPeriodGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
