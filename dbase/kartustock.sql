# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: rinovaintan
# ------------------------------------------------------
# Server version 5.0.27-community-nt

USE `rinovaintan`;

#
# Table structure for table kartustock
#

DROP TABLE IF EXISTS `kartustock`;
CREATE TABLE `kartustock` (
  `ks_id` int(11) NOT NULL auto_increment,
  `ks_gudang` varchar(255) default NULL,
  `ks_notransaksi` varchar(255) default NULL,
  `ks_tgl` date default NULL,
  `ks_stokawal` int(11) default '0',
  `ks_stoktrans` int(11) default '0',
  `ks_stokakhir` int(11) default '0',
  `ks_kodeobat` varchar(255) default NULL,
  `ks_pic` varchar(255) default NULL,
  `ks_ket` varchar(255) default NULL,
  `ks_wkt` time default NULL,
  PRIMARY KEY  (`ks_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
