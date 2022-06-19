/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.6.24 : Database - sekolah
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sekolah` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sekolah`;

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(150) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELP` varchar(20) DEFAULT NULL,
  `KELAS` varchar(20) DEFAULT NULL,
  `JENIS_KLAMIN` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `siswa` */

insert  into `siswa`(`id_siswa`,`NAMA`,`ALAMAT`,`NO_TELP`,`KELAS`,`JENIS_KLAMIN`) values 
(1,'Arjun A','Jln Cilitan','0838292','ips4','P'),
(2,'Arjun C','jln seroja','083829388','IPS7','P'),
(3,'Arjun L','Jalan cililitan','087373883','IPS4','L');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
