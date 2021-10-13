-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 10, 2021 at 05:04 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuelosbaratos.com`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
CREATE TABLE IF NOT EXISTS `tb_estado` (
  `ID_ESTADO` int(11) NOT NULL,
  `NOM_ESTADO` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_nombre_ciudades`
--

DROP TABLE IF EXISTS `tb_nombre_ciudades`;
CREATE TABLE IF NOT EXISTS `tb_nombre_ciudades` (
  `ID_CIUDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_AEROPUERTO` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CIUDAD` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IATA` char(3) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `HABILITADA` char(1) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CIUDAD`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `tb_nombre_ciudades`
--

INSERT INTO `tb_nombre_ciudades` (`ID_CIUDAD`, `NOMBRE_AEROPUERTO`, `CIUDAD`, `IATA`, `HABILITADA`) VALUES
(1, 'el dorado', 'bogota', 'cuc', '1'),
(2, 'aeropuerto palo negro', 'medellin', 'tlp', '1'),
(3, 'el dorado', 'barranquilla', 'BGA', '1'),
(4, 'camilo daza', 'bucaramanga', 'qwe', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ordenes`
--

DROP TABLE IF EXISTS `tb_ordenes`;
CREATE TABLE IF NOT EXISTS `tb_ordenes` (
  `ID_ORDEN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ESTADO` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ID_RUTA` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  PRIMARY KEY (`ID_ORDEN`),
  KEY `FK_REFERENCE_2` (`ID_USUARIO`),
  KEY `FK_REFERENCE_3` (`ESTADO`),
  KEY `FK_REFERENCE_4` (`ID_RUTA`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `tb_ordenes`
--

INSERT INTO `tb_ordenes` (`ID_ORDEN`, `ID_USUARIO`, `ESTADO`, `ID_RUTA`, `FECHA`) VALUES
(1, 1, 'reservado', 1, '2021-10-10'),
(2, 1, 'reservado', 3, '2021-10-10'),
(3, 1, 'reservado', 1, '2021-10-10'),
(4, 1, 'reservado', 1, '2021-10-10'),
(5, 1, 'reservado', 1, '2021-10-10'),
(6, 1, 'reservado', 2, '2021-10-10'),
(7, 1, 'reservado', 2, '2021-10-10'),
(8, 1, 'reservado', 1, '2021-10-10'),
(9, 1, 'reservado', 2, '2021-10-10'),
(10, 1, 'reservado', 1, '2021-10-10'),
(11, 1, 'reservado', 1, '2021-10-10'),
(12, 1, 'reservado', 3, '2021-10-10'),
(13, 2, 'reservado', 2, '2021-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rutas`
--

DROP TABLE IF EXISTS `tb_rutas`;
CREATE TABLE IF NOT EXISTS `tb_rutas` (
  `ID_RUTA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CIUDAD_ORIGEN` int(11) DEFAULT NULL,
  `ID_CIUDAD_DESTINO` int(11) DEFAULT NULL,
  `AEROLINEA` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `HORA_SALIDA` time NOT NULL,
  `FECHA_SALIDA` date NOT NULL,
  `TIEMPO` float DEFAULT NULL,
  `ACTIVADA` tinyint(1) DEFAULT NULL,
  `PRECIO` double NOT NULL,
  PRIMARY KEY (`ID_RUTA`),
  KEY `FK_REFERENCE_5` (`ID_CIUDAD_ORIGEN`),
  KEY `FK_REFERENCE_6` (`ID_CIUDAD_DESTINO`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `tb_rutas`
--

INSERT INTO `tb_rutas` (`ID_RUTA`, `ID_CIUDAD_ORIGEN`, `ID_CIUDAD_DESTINO`, `AEROLINEA`, `HORA_SALIDA`, `FECHA_SALIDA`, `TIEMPO`, `ACTIVADA`, `PRECIO`) VALUES
(1, 1, 2, 'avianca', '22:26:32', '2021-10-15', 2.5, 1, 710000),
(2, 2, 1, 'latam', '10:28:45', '2021-11-10', 1.5, 1, 80000),
(3, 1, 2, 'vuelafacil', '10:28:45', '2021-11-10', 2.5, 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_documento`
--

DROP TABLE IF EXISTS `tb_tipo_documento`;
CREATE TABLE IF NOT EXISTS `tb_tipo_documento` (
  `ID_TIPO_DOCUMENTO` int(11) NOT NULL,
  `TIPO_DOCUMENTO` varchar(15) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_DOCUMENTO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_DOCUMENTO` varchar(11) COLLATE utf8mb4_spanish_ci NOT NULL,
  `NUMERO_DOCUMENTO` varchar(15) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NOMBRES` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `APELLIDOS` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CORREO` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CONTRASENA` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `FK_REFERENCE_1` (`ID_TIPO_DOCUMENTO`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `tb_usuario`
--

INSERT INTO `tb_usuario` (`ID_USUARIO`, `ID_TIPO_DOCUMENTO`, `NUMERO_DOCUMENTO`, `NOMBRES`, `APELLIDOS`, `CORREO`, `CONTRASENA`) VALUES
(1, '1', '2222', 'andres', 'ortega', 'andresdavi@.com', '1234'),
(2, '1', '1084847526', 'andres', 'ortega', 'andresmg42@outlook.com', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
