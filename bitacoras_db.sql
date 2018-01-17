-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-01-2018 a las 15:18:51
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pruebas2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE IF NOT EXISTS `aplicacion` (
  `APLCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `APLDESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL,
  `APLESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`APLCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- (Evento) desencadenante `aplicacion`
--
DROP TRIGGER IF EXISTS `insert_aplicacion`;
DELIMITER //
CREATE TRIGGER `insert_aplicacion` AFTER INSERT ON `aplicacion`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("APLICACION", "Inserted", USER(), CURDATE(), CURTIME(), NEW.APLCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_aplicacion`;
DELIMITER //
CREATE TRIGGER `update_aplicacion` AFTER UPDATE ON `aplicacion`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.APLCODIGO <=> OLD.APLCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("APLICACION", "Updated", USER(), CURDATE(), CURTIME(), OLD.APLCODIGO, "APLCODIGO", OLD.APLCODIGO, NEW.APLCODIGO);
	END IF;
	IF(NOT(NEW.APLDESCRIPCION <=> OLD.APLDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("APLICACION", "Updated", USER(), CURDATE(), CURTIME(), OLD.APLCODIGO, "APLDESCRIPCION", OLD.APLDESCRIPCION, NEW.APLDESCRIPCION);
	END IF;
	IF(NOT(NEW.APLESTADO <=> OLD.APLESTADO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("APLICACION", "Updated", USER(), CURDATE(), CURTIME(), OLD.APLCODIGO, "APLESTADO", OLD.APLESTADO, NEW.APLESTADO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_aplicacion`;
DELIMITER //
CREATE TRIGGER `delete_aplicacion` AFTER DELETE ON `aplicacion`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("APLICACION", "Deleted", USER(), CURDATE(), CURTIME(), OLD.APLCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE IF NOT EXISTS `calendario` (
  `CALFECHASK` int(11) NOT NULL,
  `CALFECHA` date NOT NULL,
  `CALANIO` smallint(6) NOT NULL,
  `CALTRIMESTRE` smallint(6) NOT NULL,
  `CALMES` smallint(6) NOT NULL,
  `CALSEMANA` smallint(6) NOT NULL,
  `CALDIA` smallint(6) NOT NULL,
  `CALDIASEMANA` smallint(6) NOT NULL,
  `CALNMES` char(15) COLLATE utf8_bin NOT NULL,
  `CALNDIA` char(15) COLLATE utf8_bin NOT NULL,
  `CALFERIADO` tinyint(1) DEFAULT '0',
  `CALLABORABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CALFECHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- (Evento) desencadenante `calendario`
--
DROP TRIGGER IF EXISTS `update_calendario`;
DELIMITER //
CREATE TRIGGER `update_calendario` AFTER UPDATE ON `calendario`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.CALFECHASK <=> OLD.CALFECHASK)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALFECHASK", OLD.CALFECHASK, NEW.CALFECHASK);
	END IF;
	IF(NOT(NEW.CALFECHA <=> OLD.CALFECHA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALFECHA", OLD.CALFECHA, NEW.CALFECHA);
	END IF;
	IF(NOT(NEW.CALANIO <=> OLD.CALANIO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALANIO", OLD.CALANIO, NEW.CALANIO);
	END IF;
	IF(NOT(NEW.CALTRIMESTRE <=> OLD.CALTRIMESTRE)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALTRIMESTRE", OLD.CALTRIMESTRE, NEW.CALTRIMESTRE);
	END IF;
	IF(NOT(NEW.CALMES <=> OLD.CALMES)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALMES", OLD.CALMES, NEW.CALMES);
	END IF;
	IF(NOT(NEW.CALSEMANA <=> OLD.CALSEMANA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALSEMANA", OLD.CALSEMANA, NEW.CALSEMANA);
	END IF;
	IF(NOT(NEW.CALDIA <=> OLD.CALDIA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALDIA", OLD.CALDIA, NEW.CALDIA);
	END IF;
	IF(NOT(NEW.CALDIASEMANA <=> OLD.CALDIASEMANA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALDIASEMANA", OLD.CALDIASEMANA, NEW.CALDIASEMANA);
	END IF;
	IF(NOT(NEW.CALNMES <=> OLD.CALNMES)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALNMES", OLD.CALNMES, NEW.CALNMES);
	END IF;
	IF(NOT(NEW.CALNDIA <=> OLD.CALNDIA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALNDIA", OLD.CALNDIA, NEW.CALNDIA);
	END IF;
	IF(NOT(NEW.CALFERIADO <=> OLD.CALFERIADO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALFERIADO", OLD.CALFERIADO, NEW.CALFERIADO);
	END IF;
	IF(NOT(NEW.CALLABORABLE <=> OLD.CALLABORABLE)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CALENDARIO", "Updated", USER(), CURDATE(), CURTIME(), OLD.CALFECHASK, "CALLABORABLE", OLD.CALLABORABLE, NEW.CALLABORABLE);
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clave`
--

CREATE TABLE IF NOT EXISTS `clave` (
  `Id_clave` int(11) NOT NULL AUTO_INCREMENT,
  `Servidor` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `IP` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `Usuario` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Clave` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Responsable` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Activo` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id_clave`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=326 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CLICODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `CLIDESCRIPCION` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CLIESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`CLICODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- (Evento) desencadenante `cliente`
--
DROP TRIGGER IF EXISTS `insert_cliente`;
DELIMITER //
CREATE TRIGGER `insert_cliente` AFTER INSERT ON `cliente`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("CLIENTE", "Inserted", USER(), CURDATE(), CURTIME(), NEW.CLICODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_cliente`;
DELIMITER //
CREATE TRIGGER `update_cliente` AFTER UPDATE ON `cliente`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.CLICODIGO <=> OLD.CLICODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("CLIENTE", "Updated", USER(), CURDATE(), CURTIME(), OLD.CLICODIGO, "CLICODIGO", OLD.CLICODIGO, NEW.CLICODIGO);
	END IF;
	IF(NOT(NEW.CLIDESCRIPCION <=> OLD.CLIDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CLIENTE", "Updated", USER(), CURDATE(), CURTIME(), OLD.CLICODIGO, "CLIDESCRIPCION", OLD.CLIDESCRIPCION, NEW.CLIDESCRIPCION);
	END IF;
	IF(NOT(NEW.CLIESTADO <=> OLD.CLIESTADO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("CLIENTE", "Updated", USER(), CURDATE(), CURTIME(), OLD.CLICODIGO, "CLIESTADO", OLD.CLIESTADO, NEW.CLIESTADO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_cliente`;
DELIMITER //
CREATE TRIGGER `delete_cliente` AFTER DELETE ON `cliente`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("CLIENTE", "Deleted", USER(), CURDATE(), CURTIME(), OLD.CLICODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clixapl`
--

CREATE TABLE IF NOT EXISTS `clixapl` (
  `CLICODIGO` int(6) NOT NULL,
  `APLCODIGO` int(6) NOT NULL,
  PRIMARY KEY (`CLICODIGO`,`APLCODIGO`),
  KEY `FK_R3` (`APLCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `EMPCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `EMPCEDULA` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMPNOMBRE1` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMPNOMBRE2` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPAPELLIDO1` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `EMPAPELLIDO2` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPULTIMATIX` char(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMPULTIMATIX2` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPULTIMATIX3` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPFECHANAC` date NOT NULL,
  `EMPINGRESOTCS` date DEFAULT NULL,
  `EMPINGRESOPLM` date DEFAULT NULL,
  `EMPFECHASALIDA` date DEFAULT NULL,
  `EMPFIRMA` longblob,
  `EMPFOTO` longblob,
  `EMPFIRMATIPO` char(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMPFOTOTIPO` char(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`EMPCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- (Evento) desencadenante `empleado`
--
DROP TRIGGER IF EXISTS `insert_empleado`;
DELIMITER //
CREATE TRIGGER `insert_empleado` AFTER INSERT ON `empleado`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("EMPLEADO", "Inserted", USER(), CURDATE(), CURTIME(), NEW.EMPCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_empleado`;
DELIMITER //
CREATE TRIGGER `update_empleado` AFTER UPDATE ON `empleado`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.EMPCODIGO <=> OLD.EMPCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPCODIGO", OLD.EMPCODIGO, NEW.EMPCODIGO);
	END IF;
	IF(NOT(NEW.EMPCEDULA <=> OLD.EMPCEDULA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPCEDULA", OLD.EMPCEDULA, NEW.EMPCEDULA);
	END IF;
	IF(NOT(NEW.EMPNOMBRE1 <=> OLD.EMPNOMBRE1)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPNOMBRE1", OLD.EMPNOMBRE1, NEW.EMPNOMBRE1);
	END IF;
	IF(NOT(NEW.EMPNOMBRE2 <=> OLD.EMPNOMBRE2)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPNOMBRE2", OLD.EMPNOMBRE2, NEW.EMPNOMBRE2);
	END IF;
	IF(NOT(NEW.EMPAPELLIDO1 <=> OLD.EMPAPELLIDO1)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPAPELLIDO1", OLD.EMPAPELLIDO1, NEW.EMPAPELLIDO1);
	END IF;
	IF(NOT(NEW.EMPAPELLIDO2 <=> OLD.EMPAPELLIDO2)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPAPELLIDO2", OLD.EMPAPELLIDO2, NEW.EMPAPELLIDO2);
	END IF;
	IF(NOT(NEW.EMPULTIMATIX <=> OLD.EMPULTIMATIX)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PERFIL", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPULTIMATIX", OLD.EMPULTIMATIX, NEW.EMPULTIMATIX);
	END IF;
	IF(NOT(NEW.EMPULTIMATIX2 <=> OLD.EMPULTIMATIX2)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPULTIMATIX2", OLD.EMPULTIMATIX2, NEW.EMPULTIMATIX2);
	END IF;
	IF(NOT(NEW.EMPULTIMATIX3 <=> OLD.EMPULTIMATIX3)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPULTIMATIX3", OLD.EMPULTIMATIX3, NEW.EMPULTIMATIX3);
	END IF;
	IF(NOT(NEW.EMPFECHANAC <=> OLD.EMPFECHANAC)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPFECHANAC", OLD.EMPFECHANAC, NEW.EMPFECHANAC);
	END IF;
	IF(NOT(NEW.EMPINGRESOTCS <=> OLD.EMPINGRESOTCS)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPINGRESOTCS", OLD.EMPINGRESOTCS, NEW.EMPINGRESOTCS);
	END IF;
	IF(NOT(NEW.EMPINGRESOPLM <=> OLD.EMPINGRESOPLM)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPINGRESOPLM", OLD.EMPINGRESOPLM, NEW.EMPINGRESOPLM);
	END IF;
	IF(NOT(NEW.EMPFECHASALIDA <=> OLD.EMPFECHASALIDA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("EMPLEADO", "Updated", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO, "EMPFECHASALIDA", OLD.EMPFECHASALIDA, NEW.EMPFECHASALIDA);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_empleado`;
DELIMITER //
CREATE TRIGGER `delete_empleado` AFTER DELETE ON `empleado`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("EMPLEADO", "Deleted", USER(), CURDATE(), CURTIME(), OLD.EMPCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empxgru`
--

CREATE TABLE IF NOT EXISTS `empxgru` (
  `GRUCODIGO` int(6) NOT NULL,
  `EMPCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `EXGFECHADESDE` date DEFAULT NULL,
  `EXGFECHAHASTA` date DEFAULT NULL,
  PRIMARY KEY (`GRUCODIGO`,`EMPCODIGO`),
  KEY `FK_R4` (`EMPCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia`
--

CREATE TABLE IF NOT EXISTS `frecuencia` (
  `FRECODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `FREDESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL,
  `freindice` int(11) DEFAULT '99',
  PRIMARY KEY (`FRECODIGO`),
  KEY `freindice` (`freindice`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=104 ;

--
-- (Evento) desencadenante `frecuencia`
--
DROP TRIGGER IF EXISTS `insert_frecuencia`;
DELIMITER //
CREATE TRIGGER `insert_frecuencia` AFTER INSERT ON `frecuencia`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("FRECUENCIA", "Inserted", USER(), CURDATE(), CURTIME(), NEW.FRECODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_frecuencia`;
DELIMITER //
CREATE TRIGGER `update_frecuencia` AFTER UPDATE ON `frecuencia`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.FRECODIGO <=> OLD.FRECODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("FRECUENCIA", "Updated", USER(), CURDATE(), CURTIME(), OLD.FRECODIGO, "FRECODIGO", OLD.FRECODIGO, NEW.FRECODIGO);
	END IF;
	IF(NOT(NEW.FREDESCRIPCION <=> OLD.FREDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("FRECUENCIA", "Updated", USER(), CURDATE(), CURTIME(), OLD.FRECODIGO, "FREDESCRIPCION", OLD.FREDESCRIPCION, NEW.FREDESCRIPCION);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_frecuencia`;
DELIMITER //
CREATE TRIGGER `delete_frecuencia` AFTER DELETE ON `frecuencia`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("FRECUENCIA", "Deleted", USER(), CURDATE(), CURTIME(), OLD.FRECODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frexcal`
--

CREATE TABLE IF NOT EXISTS `frexcal` (
  `CALFECHA` date NOT NULL,
  `FRECODIGO` int(6) NOT NULL,
  PRIMARY KEY (`CALFECHA`,`FRECODIGO`),
  KEY `FK_R8` (`FRECODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- (Evento) desencadenante `frexcal`
--
DROP TRIGGER IF EXISTS `update_frexcal`;
DELIMITER //
CREATE TRIGGER `update_frexcal` AFTER UPDATE ON `frexcal`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.CALFECHA <=> OLD.CALFECHA)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("FREXCAL", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.CALFECHA, OLD.FRECODIGO), "CALFECHA", OLD.CALFECHA, NEW.CALFECHA);
	END IF;
	IF(NOT(NEW.FRECODIGO <=> OLD.FRECODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("FREXCAL", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.CALFECHA, OLD.FRECODIGO), "FRECODIGO", OLD.FRECODIGO, NEW.FRECODIGO);
	END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `GRUCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `GRUDESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`GRUCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- (Evento) desencadenante `grupo`
--
DROP TRIGGER IF EXISTS `insert_grupo`;
DELIMITER //
CREATE TRIGGER `insert_grupo` AFTER INSERT ON `grupo`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("GRUPO", "Inserted", USER(), CURDATE(), CURTIME(), NEW.GRUCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_grupo`;
DELIMITER //
CREATE TRIGGER `update_grupo` AFTER UPDATE ON `grupo`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.GRUCODIGO <=> OLD.GRUCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("GRUPO", "Updated", USER(), CURDATE(), CURTIME(), OLD.GRUCODIGO, "GRUCODIGO", OLD.GRUCODIGO, NEW.GRUCODIGO);
	END IF;
	IF(NOT(NEW.GRUDESCRIPCION <=> OLD.GRUDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("GRUPO", "Updated", USER(), CURDATE(), CURTIME(), OLD.GRUCODIGO, "GRUDESCRIPCION", OLD.GRUDESCRIPCION, NEW.GRUDESCRIPCION);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_grupo`;
DELIMITER //
CREATE TRIGGER `delete_grupo` AFTER DELETE ON `grupo`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("GRUPO", "Deleted", USER(), CURDATE(), CURTIME(), OLD.GRUCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE IF NOT EXISTS `herramienta` (
  `HERCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `HERDESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL,
  `HERESTADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`HERCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- (Evento) desencadenante `herramienta`
--
DROP TRIGGER IF EXISTS `insert_herramienta`;
DELIMITER //
CREATE TRIGGER `insert_herramienta` AFTER INSERT ON `herramienta`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("HERRAMIENTA", "Inserted", USER(), CURDATE(), CURTIME(), NEW.HERCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_herramienta`;
DELIMITER //
CREATE TRIGGER `update_herramienta` AFTER UPDATE ON `herramienta`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.HERCODIGO <=> OLD.HERCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("HERRAMIENTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.HERCODIGO, "HERCODIGO", OLD.HERCODIGO, NEW.HERCODIGO);
	END IF;
	IF(NOT(NEW.HERDESCRIPCION <=> OLD.HERDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HERRAMIENTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.HERCODIGO, "HERDESCRIPCION", OLD.HERDESCRIPCION, NEW.HERDESCRIPCION);
	END IF;
	IF(NOT(NEW.HERESTADO <=> OLD.HERESTADO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HERRAMIENTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.HERCODIGO, "HERESTADO", OLD.HERESTADO, NEW.HERESTADO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_herramienta`;
DELIMITER //
CREATE TRIGGER `delete_herramienta` AFTER DELETE ON `herramienta`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("HERRAMIENTA", "Deleted", USER(), CURDATE(), CURTIME(), OLD.HERCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `PROCODIGO` int(10) NOT NULL,
  `FRECODIGO` int(6) NOT NULL,
  `TURCODIGO` int(6) NOT NULL,
  `HORHORAINICIO` time NOT NULL DEFAULT '00:00:00',
  `HORHORAFIN` time DEFAULT NULL,
  `HORTIPO` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `HORACTIVO` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`PROCODIGO`,`FRECODIGO`,`TURCODIGO`,`HORHORAINICIO`),
  KEY `FK_R6` (`FRECODIGO`),
  KEY `FK_R11` (`TURCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- (Evento) desencadenante `horario`
--
DROP TRIGGER IF EXISTS `insert_horario`;
DELIMITER //
CREATE TRIGGER `insert_horario` AFTER INSERT ON `horario`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("HORARIO", "Inserted", USER(), CURDATE(), CURTIME(), CONCAT(NEW.PROCODIGO, NEW.FRECODIGO, NEW.TURCODIGO, NEW.HORHORAINICIO));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_horario`;
DELIMITER //
CREATE TRIGGER `update_horario` AFTER UPDATE ON `horario`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.PROCODIGO <=> OLD.PROCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "PROCODIGO", OLD.PROCODIGO, NEW.PROCODIGO);
	END IF;
	IF(NOT(NEW.FRECODIGO <=> OLD.FRECODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "FRECODIGO", OLD.FRECODIGO, NEW.FRECODIGO);
	END IF;
	IF(NOT(NEW.TURCODIGO <=> OLD.TURCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "TURCODIGO", OLD.TURCODIGO, NEW.TURCODIGO);
	END IF;
	IF(NOT(NEW.HORHORAINICIO <=> OLD.HORHORAINICIO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "HORHORAINICIO", OLD.HORHORAINICIO, NEW.HORHORAINICIO);
	END IF;
	IF(NOT(NEW.HORHORAFIN <=> OLD.HORHORAFIN)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "HORHORAFIN", OLD.HORHORAFIN, NEW.HORHORAFIN);
	END IF;
	IF(NOT(NEW.HORTIPO <=> OLD.HORTIPO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "HORTIPO", OLD.HORTIPO, NEW.HORTIPO);
	END IF;
	IF(NOT(NEW.HORACTIVO <=> OLD.HORACTIVO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("HORARIO", "Updated", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO), "HORACTIVO", OLD.HORACTIVO, NEW.HORACTIVO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_horario`;
DELIMITER //
CREATE TRIGGER `delete_horario` AFTER DELETE ON `horario`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("HORARIO", "Deleted", USER(), CURDATE(), CURTIME(), CONCAT(OLD.PROCODIGO, OLD.FRECODIGO, OLD.TURCODIGO, OLD.HORHORAINICIO));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE IF NOT EXISTS `imagen` (
  `IMGCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PASCODIGO` int(11) DEFAULT NULL,
  `IMGDESC` longblob,
  PRIMARY KEY (`IMGCODIGO`),
  KEY `FK_R17` (`PASCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `LOGID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGTABLA` varchar(100) COLLATE utf8_bin NOT NULL,
  `LOGACCION` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `LOGUSER` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOGFECHA` date DEFAULT NULL,
  `LOGHORA` time DEFAULT NULL,
  `LOGFILA` varchar(20) COLLATE utf8_bin NOT NULL,
  `LOGCOLUMNA` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGANTES` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGDESPUES` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOGID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5676 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `LOGUSUARIO` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `PERCODIGO` int(6) NOT NULL,
  `EMPCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `LOGCLAVE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`LOGUSUARIO`),
  KEY `FK_R7` (`EMPCODIGO`),
  KEY `FK_R15` (`PERCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- (Evento) desencadenante `login`
--
DROP TRIGGER IF EXISTS `insert_login`;
DELIMITER //
CREATE TRIGGER `insert_login` AFTER INSERT ON `login`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("LOGIN", "Inserted", USER(), CURDATE(), CURTIME(), NEW.LOGUSUARIO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_login`;
DELIMITER //
CREATE TRIGGER `update_login` AFTER UPDATE ON `login`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.LOGUSUARIO <=> OLD.LOGUSUARIO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("LOGIN", "Updated", USER(), CURDATE(), CURTIME(), OLD.LOGUSUARIO, "LOGUSUARIO", OLD.LOGUSUARIO, NEW.LOGUSUARIO);
	END IF;
	IF(NOT(NEW.LOGCLAVE <=> OLD.LOGCLAVE)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("LOGIN", "Updated", USER(), CURDATE(), CURTIME(), OLD.LOGUSUARIO, "LOGCLAVE", OLD.LOGCLAVE, NEW.LOGCLAVE);
	END IF;
	IF(NOT(NEW.EMPCODIGO <=> OLD.EMPCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("LOGIN", "Updated", USER(), CURDATE(), CURTIME(), OLD.LOGUSUARIO, "EMPCODIGO", OLD.EMPCODIGO, NEW.EMPCODIGO);
	END IF;
	IF(NOT(NEW.PERCODIGO <=> OLD.PERCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("LOGIN", "Updated", USER(), CURDATE(), CURTIME(), OLD.LOGUSUARIO, "PERCODIGO", OLD.PERCODIGO, NEW.PERCODIGO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_login`;
DELIMITER //
CREATE TRIGGER `delete_login` AFTER DELETE ON `login`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("LOGIN", "Deleted", USER(), CURDATE(), CURTIME(), OLD.LOGUSUARIO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paso`
--

CREATE TABLE IF NOT EXISTS `paso` (
  `PROCODIGO` int(10) DEFAULT NULL,
  `PASCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PASDESCRIPCION` text COLLATE utf8_bin NOT NULL,
  `pasActivo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PASCODIGO`),
  KEY `FK_R16` (`PROCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=454 ;

--
-- (Evento) desencadenante `paso`
--
DROP TRIGGER IF EXISTS `insert_paso`;
DELIMITER //
CREATE TRIGGER `insert_paso` AFTER INSERT ON `paso`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PASO", "Inserted", USER(), CURDATE(), CURTIME(), NEW.PASCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_paso`;
DELIMITER //
CREATE TRIGGER `update_paso` AFTER UPDATE ON `paso`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.PASCODIGO <=> OLD.PASCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("PASO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PASCODIGO, "PASCODIGO", OLD.PASCODIGO, NEW.PASCODIGO);
	END IF;
	IF(NOT(NEW.PROCODIGO <=> OLD.PROCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PASO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PASCODIGO, "PROCODIGO", OLD.PROCODIGO, NEW.PROCODIGO);
	END IF;
	IF(NOT(NEW.PASDESCRIPCION <=> OLD.PASDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PASO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PASCODIGO, "PASDESCRIPCION", OLD.PASDESCRIPCION, NEW.PASDESCRIPCION);
	END IF;
	IF(NOT(NEW.PASACTIVO <=> OLD.PASACTIVO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PASO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PASCODIGO, "PASACTIVO", OLD.PASACTIVO, NEW.PASACTIVO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_paso`;
DELIMITER //
CREATE TRIGGER `delete_paso` AFTER DELETE ON `paso`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PASO", "Deleted", USER(), CURDATE(), CURTIME(), OLD.PASCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasoh`
--

CREATE TABLE IF NOT EXISTS `pasoh` (
  `pasohCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `pasohFecha` date DEFAULT NULL,
  `pasohHora` time DEFAULT NULL,
  `pasohEstado` tinyint(1) DEFAULT NULL,
  `pasoCodigo` int(6) NOT NULL,
  `tcodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`pasohCodigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1456 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `PERCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `PERDESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL,
  `PERESTADO` int(2) DEFAULT '1',
  PRIMARY KEY (`PERCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- (Evento) desencadenante `perfil`
--
DROP TRIGGER IF EXISTS `insert_perfil`;
DELIMITER //
CREATE TRIGGER `insert_perfil` AFTER INSERT ON `perfil`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PERFIL", "Inserted", USER(), CURDATE(), CURTIME(), NEW.PERCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_perfil`;
DELIMITER //
CREATE TRIGGER `update_perfil` AFTER UPDATE ON `perfil`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.PERCODIGO <=> OLD.PERCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("PERFIL", "Updated", USER(), CURDATE(), CURTIME(), OLD.PERCODIGO, "PERCODIGO", OLD.PERCODIGO, NEW.PERCODIGO);
	END IF;
	IF(NOT(NEW.PERDESCRIPCION <=> OLD.PERDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PERFIL", "Updated", USER(), CURDATE(), CURTIME(), OLD.PERCODIGO, "PERDESCRIPCION", OLD.PERDESCRIPCION, NEW.PERDESCRIPCION);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_perfil`;
DELIMITER //
CREATE TRIGGER `delete_perfil` AFTER DELETE ON `perfil`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PERFIL", "Deleted", USER(), CURDATE(), CURTIME(), OLD.PERCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE IF NOT EXISTS `proceso` (
  `PROCODIGO` int(10) NOT NULL AUTO_INCREMENT,
  `HERCODIGO` int(6) NOT NULL,
  `CLICODIGO` int(6) NOT NULL,
  `APLCODIGO` int(6) NOT NULL,
  `PRONOMBRE` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRODESCRIPCION` text CHARACTER SET utf8 COLLATE utf8_bin,
  `PROCONSIDERACIONES` text CHARACTER SET utf8 COLLATE utf8_bin,
  `PROOBSERVACIONES` text CHARACTER SET utf8 COLLATE utf8_bin,
  `PRONOTAS` text CHARACTER SET utf8 COLLATE utf8_bin,
  `PROIDEN` tinyint(4) DEFAULT '0',
  `PROACTIVO` tinyint(4) DEFAULT '1',
  `FKPROCESO` int(10) DEFAULT NULL,
  PRIMARY KEY (`PROCODIGO`),
  KEY `FK_R13` (`CLICODIGO`,`APLCODIGO`),
  KEY `FK_R12` (`HERCODIGO`),
  KEY `FK_R19` (`FKPROCESO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1276 ;

--
-- (Evento) desencadenante `proceso`
--
DROP TRIGGER IF EXISTS `insert_proceso`;
DELIMITER //
CREATE TRIGGER `insert_proceso` AFTER INSERT ON `proceso`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PROCESO", "Inserted", USER(), CURDATE(), CURTIME(), NEW.PROCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_proceso`;
DELIMITER //
CREATE TRIGGER `update_proceso` AFTER UPDATE ON `proceso`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.PROCODIGO <=> OLD.PROCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PROCODIGO", OLD.PROCODIGO, NEW.PROCODIGO);
	END IF;
	IF(NOT(NEW.PRONOMBRE <=> OLD.PRONOMBRE)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PRONOMBRE", OLD.PRONOMBRE, NEW.PRONOMBRE);
	END IF;
	IF(NOT(NEW.PRODESCRIPCION <=> OLD.PRODESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PRODESCRIPCION", OLD.PRODESCRIPCION, NEW.PRODESCRIPCION);
	END IF;
	IF(NOT(NEW.PROCONSIDERACIONES <=> OLD.PROCONSIDERACIONES)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PROCONSIDERACIONES", OLD.PROCONSIDERACIONES, NEW.PROCONSIDERACIONES);
	END IF;
	IF(NOT(NEW.PROOBSERVACIONES <=> OLD.PROOBSERVACIONES)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PROOBSERVACIONES", OLD.PROOBSERVACIONES, NEW.PROOBSERVACIONES);
	END IF;
	IF(NOT(NEW.PRONOTAS <=> OLD.PRONOTAS)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PRONOTAS", OLD.PRONOTAS, NEW.PRONOTAS);
	END IF;
	IF(NOT(NEW.PRONOTAS <=> OLD.PRONOTAS)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "PRONOTAS", OLD.PRONOTAS, NEW.PRONOTAS);
	END IF;
	IF(NOT(NEW.CLICODIGO <=> OLD.CLICODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "CLICODIGO", OLD.CLICODIGO, NEW.CLICODIGO);
	END IF;
	IF(NOT(NEW.HERCODIGO <=> OLD.HERCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "HERCODIGO", OLD.HERCODIGO, NEW.HERCODIGO);
	END IF;
	IF(NOT(NEW.APLCODIGO <=> OLD.APLCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("PROCESO", "Updated", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO, "APLCODIGO", OLD.APLCODIGO, NEW.APLCODIGO);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_proceso`;
DELIMITER //
CREATE TRIGGER `delete_proceso` AFTER DELETE ON `proceso`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("PROCESO", "Deleted", USER(), CURDATE(), CURTIME(), OLD.PROCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE IF NOT EXISTS `ruta` (
  `RUTCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PASCODIGO` int(11) DEFAULT NULL,
  `RUTDESCRIPCION` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`RUTCODIGO`),
  KEY `FK_R18` (`PASCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=41 ;

--
-- (Evento) desencadenante `ruta`
--
DROP TRIGGER IF EXISTS `insert_ruta`;
DELIMITER //
CREATE TRIGGER `insert_ruta` AFTER INSERT ON `ruta`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("RUTA", "Inserted", USER(), CURDATE(), CURTIME(), NEW.RUTCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_ruta`;
DELIMITER //
CREATE TRIGGER `update_ruta` AFTER UPDATE ON `ruta`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.RUTCODIGO <=> OLD.RUTCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("RUTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.RUTCODIGO, "RUTCODIGO", OLD.RUTCODIGO, NEW.RUTCODIGO);
	END IF;
	IF(NOT(NEW.PASCODIGO <=> OLD.PASCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("RUTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.RUTCODIGO, "PASCODIGO", OLD.PASCODIGO, NEW.PASCODIGO);
	END IF;
	IF(NOT(NEW.RUTDESCRIPCION <=> OLD.RUTDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("RUTA", "Updated", USER(), CURDATE(), CURTIME(), OLD.RUTCODIGO, "RUTDESCRIPCION", OLD.RUTDESCRIPCION, NEW.RUTDESCRIPCION);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_ruta`;
DELIMITER //
CREATE TRIGGER `delete_ruta` AFTER DELETE ON `ruta`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("RUTA", "Deleted", USER(), CURDATE(), CURTIME(), OLD.RUTCODIGO);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t`
--

CREATE TABLE IF NOT EXISTS `t` (
  `TCODIGO` int(10) NOT NULL AUTO_INCREMENT,
  `PROCODIGO` int(10) NOT NULL,
  `PROHORAINICIO` time DEFAULT NULL,
  `THORAINICIO` time DEFAULT NULL,
  `THORAFIN` time DEFAULT NULL,
  `TESTADO` tinyint(1) DEFAULT NULL,
  `TREVISOR` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TEJECUTOR` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TFECHA` date DEFAULT NULL,
  `TOBSERVACIONES` text COLLATE utf8_bin,
  `PRONOMBRE` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `PRODESCRIPCION` text COLLATE utf8_bin,
  `PROCONSIDERACIONES` text COLLATE utf8_bin,
  `PROOBSERVACIONES` text COLLATE utf8_bin,
  `PRONOTAS` text COLLATE utf8_bin,
  `FREDESCRIPCION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CLIDESCRIPCION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `APLDESCRIPCION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `HERDESCRIPCION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TCODIGO`),
  KEY `FK_R14` (`PROCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12828 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `TURCODIGO` int(6) NOT NULL AUTO_INCREMENT,
  `TURDESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TURCODIGO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- (Evento) desencadenante `turno`
--
DROP TRIGGER IF EXISTS `insert_turno`;
DELIMITER //
CREATE TRIGGER `insert_turno` AFTER INSERT ON `turno`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("TURNO", "Inserted", USER(), CURDATE(), CURTIME(), NEW.TURCODIGO);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_turno`;
DELIMITER //
CREATE TRIGGER `update_turno` AFTER UPDATE ON `turno`
 FOR EACH ROW BEGIN
	IF(NOT(NEW.TURCODIGO <=> OLD.TURCODIGO)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`) 
		VALUES ("TURNO", "Updated", USER(), CURDATE(), CURTIME(), OLD.TURCODIGO, "TURCODIGO", OLD.TURCODIGO, NEW.TURCODIGO);
	END IF;
	IF(NOT(NEW.TURDESCRIPCION <=> OLD.TURDESCRIPCION)) THEN
		INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`, `logcolumna`, `logantes`, `logdespues`)
		VALUES ("TURNO", "Updated", USER(), CURDATE(), CURTIME(), OLD.TURCODIGO, "TURDESCRIPCION", OLD.TURDESCRIPCION, NEW.TURDESCRIPCION);
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_turno`;
DELIMITER //
CREATE TRIGGER `delete_turno` AFTER DELETE ON `turno`
 FOR EACH ROW BEGIN
	INSERT INTO LOG (`logtabla`, `logaccion`, `loguser`, `logfecha`, `loghora`, `logfila`) 
	VALUES ("TURNO", "Deleted", USER(), CURDATE(), CURTIME(), OLD.TURCODIGO);
END
//
DELIMITER ;

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `clixapl`
--
ALTER TABLE `clixapl`
  ADD CONSTRAINT `FK_R2` FOREIGN KEY (`CLICODIGO`) REFERENCES `cliente` (`CLICODIGO`),
  ADD CONSTRAINT `FK_R3` FOREIGN KEY (`APLCODIGO`) REFERENCES `aplicacion` (`APLCODIGO`);

--
-- Filtros para la tabla `empxgru`
--
ALTER TABLE `empxgru`
  ADD CONSTRAINT `FK_R1` FOREIGN KEY (`GRUCODIGO`) REFERENCES `grupo` (`GRUCODIGO`),
  ADD CONSTRAINT `FK_R4` FOREIGN KEY (`EMPCODIGO`) REFERENCES `empleado` (`EMPCODIGO`);

--
-- Filtros para la tabla `frexcal`
--
ALTER TABLE `frexcal`
  ADD CONSTRAINT `FK_R8` FOREIGN KEY (`FRECODIGO`) REFERENCES `frecuencia` (`FRECODIGO`),
  ADD CONSTRAINT `FK_R9` FOREIGN KEY (`CALFECHA`) REFERENCES `calendario` (`CALFECHA`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FK_R11` FOREIGN KEY (`TURCODIGO`) REFERENCES `turno` (`TURCODIGO`),
  ADD CONSTRAINT `FK_R20` FOREIGN KEY (`PROCODIGO`) REFERENCES `proceso` (`PROCODIGO`),
  ADD CONSTRAINT `FK_R5` FOREIGN KEY (`PROCODIGO`) REFERENCES `proceso` (`PROCODIGO`),
  ADD CONSTRAINT `FK_R6` FOREIGN KEY (`FRECODIGO`) REFERENCES `frecuencia` (`FRECODIGO`);

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `FK_R17` FOREIGN KEY (`PASCODIGO`) REFERENCES `paso` (`PASCODIGO`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `FK_R15` FOREIGN KEY (`PERCODIGO`) REFERENCES `perfil` (`PERCODIGO`),
  ADD CONSTRAINT `FK_R7` FOREIGN KEY (`EMPCODIGO`) REFERENCES `empleado` (`EMPCODIGO`);

--
-- Filtros para la tabla `paso`
--
ALTER TABLE `paso`
  ADD CONSTRAINT `FK_R16` FOREIGN KEY (`PROCODIGO`) REFERENCES `proceso` (`PROCODIGO`);

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD CONSTRAINT `FK_R12` FOREIGN KEY (`HERCODIGO`) REFERENCES `herramienta` (`HERCODIGO`),
  ADD CONSTRAINT `FK_R13` FOREIGN KEY (`CLICODIGO`, `APLCODIGO`) REFERENCES `clixapl` (`CLICODIGO`, `APLCODIGO`),
  ADD CONSTRAINT `FK_R19` FOREIGN KEY (`FKPROCESO`) REFERENCES `proceso` (`PROCODIGO`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `FK_R18` FOREIGN KEY (`PASCODIGO`) REFERENCES `paso` (`PASCODIGO`);

--
-- Filtros para la tabla `t`
--
ALTER TABLE `t`
  ADD CONSTRAINT `FK_R14` FOREIGN KEY (`PROCODIGO`) REFERENCES `proceso` (`PROCODIGO`);
