-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2024 a las 15:07:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `enkargadb`
--
CREATE DATABASE IF NOT EXISTS `enkargadb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `enkargadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

DROP TABLE IF EXISTS `acceso`;
CREATE TABLE `acceso` (
  `id_acceso` int(11) NOT NULL COMMENT 'Id de accesos',
  `clientes` tinyint(1) NOT NULL COMMENT 'Modulo Clientes',
  `proveedor` tinyint(1) NOT NULL COMMENT 'Modulo Proveedor',
  `inventario` tinyint(1) NOT NULL COMMENT 'Modulo Inventario',
  `personal` tinyint(1) NOT NULL COMMENT 'Modulo Personal',
  `operaciones` tinyint(1) NOT NULL COMMENT 'Modulo Operaciones',
  `contabilidad` tinyint(1) NOT NULL COMMENT 'Modulo Contabilidad',
  `id_personal` int(11) NOT NULL COMMENT 'Id de Personal',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro y/0 actualizacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE ACESSOS';

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id_acceso`, `clientes`, `proveedor`, `inventario`, `personal`, `operaciones`, `contabilidad`, `id_personal`, `fecha_registro`) VALUES(1, 1, 1, 1, 1, 1, 1, 1, '2024-06-24 10:16:33');
INSERT INTO `acceso` (`id_acceso`, `clientes`, `proveedor`, `inventario`, `personal`, `operaciones`, `contabilidad`, `id_personal`, `fecha_registro`) VALUES(2, 0, 0, 1, 0, 1, 0, 4, '2024-06-24 11:22:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL COMMENT 'Id cliente',
  `nombres` varchar(100) NOT NULL COMMENT 'Nombres del cliente',
  `apellidos` varchar(100) NOT NULL COMMENT 'Apellidos del cliente',
  `correo` varchar(100) DEFAULT NULL COMMENT 'Correo del cliente',
  `tipo_documento` int(11) NOT NULL COMMENT 'Tipo de documento del cliente',
  `numero_documento` varchar(20) NOT NULL COMMENT 'Numero de documento del cliente',
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del cliente',
  `id_distrito` varchar(10) NOT NULL COMMENT 'Distrito del Cliente',
  `direccion` varchar(250) DEFAULT NULL COMMENT 'Direccion del cliente',
  `ruc` int(20) DEFAULT NULL COMMENT 'Ruc del cliente',
  `razon_social` varchar(100) DEFAULT NULL COMMENT 'Razon social del cliente',
  `telefono` int(11) DEFAULT NULL COMMENT 'Telefono del cliente',
  `celular` int(11) DEFAULT NULL COMMENT 'Celular del cliente',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado del cliente',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE CLIENTES';

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombres`, `apellidos`, `correo`, `tipo_documento`, `numero_documento`, `fecha_nacimiento`, `id_distrito`, `direccion`, `ruc`, `razon_social`, `telefono`, `celular`, `id_estado`, `fecha_registro`) VALUES(1, 'MARIA', 'ALVAREZ TORRES', '', 1, '08070605', '1993-01-30', '130102', '', 2147483647, 'SEGURO SOCIAL DE SALUD ', NULL, NULL, 1, '2024-06-24 11:26:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_empresa`
--

DROP TABLE IF EXISTS `configuracion_empresa`;
CREATE TABLE `configuracion_empresa` (
  `ruc` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `id_distrito` varchar(10) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `telefax` varchar(25) NOT NULL,
  `celular` varchar(25) NOT NULL,
  `correo_institucional` varchar(100) NOT NULL,
  `correo_personal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE CONFIGURACION EMPRESA';

--
-- Volcado de datos para la tabla `configuracion_empresa`
--

INSERT INTO `configuracion_empresa` (`ruc`, `direccion`, `id_distrito`, `referencia`, `telefax`, `celular`, `correo_institucional`, `correo_personal`) VALUES('20563622319', 'Av. Elias Aguire Mz. 11V Lt.2', '150143', 'Tablada de Lurin', '01-2671930', '920030179', 'enkarga@gmail.com', 'roxana.operaciones@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id_departamento` varchar(2) NOT NULL COMMENT 'Id del departamento',
  `descripcion` varchar(30) NOT NULL COMMENT 'Descripcion del departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE DEPARTAMENTO';

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('01', 'Amazonas');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('02', 'Áncash');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('03', 'Apurímac');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('04', 'Arequipa');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('05', 'Ayacucho');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('06', 'Cajamarca');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('07', 'Callao');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('08', 'Cusco');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('09', 'Huancavelica');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('10', 'Huánuco');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('11', 'Ica');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('12', 'Junín');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('13', 'La Libertad');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('14', 'Lambayeque');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('15', 'Lima');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('16', 'Loreto');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('17', 'Madre de Dios');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('18', 'Moquegua');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('19', 'Pasco');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('20', 'Piura');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('21', 'Puno');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('22', 'San Martín');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('23', 'Tacna');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('24', 'Tumbes');
INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES('25', 'Ucayali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

DROP TABLE IF EXISTS `distrito`;
CREATE TABLE `distrito` (
  `id_distrito` varchar(10) NOT NULL COMMENT 'Id distrito',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion del distrito',
  `id_provincia` varchar(10) NOT NULL COMMENT 'Id provincia',
  `id_departamento` varchar(10) NOT NULL COMMENT 'Id departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE DISTRITO';

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010101', 'Chachapoyas', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010102', 'Asunción', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010103', 'Balsas', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010104', 'Cheto', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010105', 'Chiliquin', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010106', 'Chuquibamba', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010107', 'Granada', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010108', 'Huancas', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010109', 'La Jalca', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010110', 'Leimebamba', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010111', 'Levanto', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010112', 'Magdalena', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010113', 'Mariscal Castilla', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010114', 'Molinopampa', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010115', 'Montevideo', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010116', 'Olleros', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010117', 'Quinjalca', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010118', 'San Francisco de Daguas', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010119', 'San Isidro de Maino', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010120', 'Soloco', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010121', 'Sonche', '0101', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010201', 'Bagua', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010202', 'Aramango', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010203', 'Copallin', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010204', 'El Parco', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010205', 'Imaza', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010206', 'La Peca', '0102', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010301', 'Jumbilla', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010302', 'Chisquilla', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010303', 'Churuja', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010304', 'Corosha', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010305', 'Cuispes', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010306', 'Florida', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010307', 'Jazan', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010308', 'Recta', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010309', 'San Carlos', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010310', 'Shipasbamba', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010311', 'Valera', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010312', 'Yambrasbamba', '0103', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010401', 'Nieva', '0104', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010402', 'El Cenepa', '0104', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010403', 'Río Santiago', '0104', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010501', 'Lamud', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010502', 'Camporredondo', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010503', 'Cocabamba', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010504', 'Colcamar', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010505', 'Conila', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010506', 'Inguilpata', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010507', 'Longuita', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010508', 'Lonya Chico', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010509', 'Luya', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010510', 'Luya Viejo', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010511', 'María', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010512', 'Ocalli', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010513', 'Ocumal', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010514', 'Pisuquia', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010515', 'Providencia', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010516', 'San Cristóbal', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010517', 'San Francisco de Yeso', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010518', 'San Jerónimo', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010519', 'San Juan de Lopecancha', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010520', 'Santa Catalina', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010521', 'Santo Tomas', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010522', 'Tingo', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010523', 'Trita', '0105', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010601', 'San Nicolás', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010602', 'Chirimoto', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010603', 'Cochamal', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010604', 'Huambo', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010605', 'Limabamba', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010606', 'Longar', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010607', 'Mariscal Benavides', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010608', 'Milpuc', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010609', 'Omia', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010610', 'Santa Rosa', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010611', 'Totora', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010612', 'Vista Alegre', '0106', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010701', 'Bagua Grande', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010702', 'Cajaruro', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010703', 'Cumba', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010704', 'El Milagro', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010705', 'Jamalca', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010706', 'Lonya Grande', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('010707', 'Yamon', '0107', '01');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020101', 'Huaraz', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020102', 'Cochabamba', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020103', 'Colcabamba', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020104', 'Huanchay', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020105', 'Independencia', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020106', 'Jangas', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020107', 'La Libertad', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020108', 'Olleros', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020109', 'Pampas Grande', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020110', 'Pariacoto', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020111', 'Pira', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020112', 'Tarica', '0201', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020201', 'Aija', '0202', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020202', 'Coris', '0202', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020203', 'Huacllan', '0202', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020204', 'La Merced', '0202', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020205', 'Succha', '0202', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020301', 'Llamellin', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020302', 'Aczo', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020303', 'Chaccho', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020304', 'Chingas', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020305', 'Mirgas', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020306', 'San Juan de Rontoy', '0203', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020401', 'Chacas', '0204', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020402', 'Acochaca', '0204', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020501', 'Chiquian', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020502', 'Abelardo Pardo Lezameta', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020503', 'Antonio Raymondi', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020504', 'Aquia', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020505', 'Cajacay', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020506', 'Canis', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020507', 'Colquioc', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020508', 'Huallanca', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020509', 'Huasta', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020510', 'Huayllacayan', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020511', 'La Primavera', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020512', 'Mangas', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020513', 'Pacllon', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020514', 'San Miguel de Corpanqui', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020515', 'Ticllos', '0205', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020601', 'Carhuaz', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020602', 'Acopampa', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020603', 'Amashca', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020604', 'Anta', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020605', 'Ataquero', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020606', 'Marcara', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020607', 'Pariahuanca', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020608', 'San Miguel de Aco', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020609', 'Shilla', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020610', 'Tinco', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020611', 'Yungar', '0206', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020701', 'San Luis', '0207', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020702', 'San Nicolás', '0207', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020703', 'Yauya', '0207', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020801', 'Casma', '0208', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020802', 'Buena Vista Alta', '0208', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020803', 'Comandante Noel', '0208', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020804', 'Yautan', '0208', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020901', 'Corongo', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020902', 'Aco', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020903', 'Bambas', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020904', 'Cusca', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020905', 'La Pampa', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020906', 'Yanac', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('020907', 'Yupan', '0209', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021001', 'Huari', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021002', 'Anra', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021003', 'Cajay', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021004', 'Chavin de Huantar', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021005', 'Huacachi', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021006', 'Huacchis', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021007', 'Huachis', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021008', 'Huantar', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021009', 'Masin', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021010', 'Paucas', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021011', 'Ponto', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021012', 'Rahuapampa', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021013', 'Rapayan', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021014', 'San Marcos', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021015', 'San Pedro de Chana', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021016', 'Uco', '0210', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021101', 'Huarmey', '0211', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021102', 'Cochapeti', '0211', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021103', 'Culebras', '0211', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021104', 'Huayan', '0211', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021105', 'Malvas', '0211', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021201', 'Caraz', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021202', 'Huallanca', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021203', 'Huata', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021204', 'Huaylas', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021205', 'Mato', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021206', 'Pamparomas', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021207', 'Pueblo Libre', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021208', 'Santa Cruz', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021209', 'Santo Toribio', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021210', 'Yuracmarca', '0212', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021301', 'Piscobamba', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021302', 'Casca', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021303', 'Eleazar Guzmán Barron', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021304', 'Fidel Olivas Escudero', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021305', 'Llama', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021306', 'Llumpa', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021307', 'Lucma', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021308', 'Musga', '0213', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021401', 'Ocros', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021402', 'Acas', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021403', 'Cajamarquilla', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021404', 'Carhuapampa', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021405', 'Cochas', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021406', 'Congas', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021407', 'Llipa', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021408', 'San Cristóbal de Rajan', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021409', 'San Pedro', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021410', 'Santiago de Chilcas', '0214', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021501', 'Cabana', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021502', 'Bolognesi', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021503', 'Conchucos', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021504', 'Huacaschuque', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021505', 'Huandoval', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021506', 'Lacabamba', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021507', 'Llapo', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021508', 'Pallasca', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021509', 'Pampas', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021510', 'Santa Rosa', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021511', 'Tauca', '0215', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021601', 'Pomabamba', '0216', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021602', 'Huayllan', '0216', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021603', 'Parobamba', '0216', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021604', 'Quinuabamba', '0216', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021701', 'Recuay', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021702', 'Catac', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021703', 'Cotaparaco', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021704', 'Huayllapampa', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021705', 'Llacllin', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021706', 'Marca', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021707', 'Pampas Chico', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021708', 'Pararin', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021709', 'Tapacocha', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021710', 'Ticapampa', '0217', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021801', 'Chimbote', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021802', 'Cáceres del Perú', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021803', 'Coishco', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021804', 'Macate', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021805', 'Moro', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021806', 'Nepeña', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021807', 'Samanco', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021808', 'Santa', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021809', 'Nuevo Chimbote', '0218', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021901', 'Sihuas', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021902', 'Acobamba', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021903', 'Alfonso Ugarte', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021904', 'Cashapampa', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021905', 'Chingalpo', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021906', 'Huayllabamba', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021907', 'Quiches', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021908', 'Ragash', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021909', 'San Juan', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('021910', 'Sicsibamba', '0219', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022001', 'Yungay', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022002', 'Cascapara', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022003', 'Mancos', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022004', 'Matacoto', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022005', 'Quillo', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022006', 'Ranrahirca', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022007', 'Shupluy', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('022008', 'Yanama', '0220', '02');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030101', 'Abancay', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030102', 'Chacoche', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030103', 'Circa', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030104', 'Curahuasi', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030105', 'Huanipaca', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030106', 'Lambrama', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030107', 'Pichirhua', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030108', 'San Pedro de Cachora', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030109', 'Tamburco', '0301', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030201', 'Andahuaylas', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030202', 'Andarapa', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030203', 'Chiara', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030204', 'Huancarama', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030205', 'Huancaray', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030206', 'Huayana', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030207', 'Kishuara', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030208', 'Pacobamba', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030209', 'Pacucha', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030210', 'Pampachiri', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030211', 'Pomacocha', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030212', 'San Antonio de Cachi', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030213', 'San Jerónimo', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030214', 'San Miguel de Chaccrampa', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030215', 'Santa María de Chicmo', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030216', 'Talavera', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030217', 'Tumay Huaraca', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030218', 'Turpo', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030219', 'Kaquiabamba', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030220', 'José María Arguedas', '0302', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030301', 'Antabamba', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030302', 'El Oro', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030303', 'Huaquirca', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030304', 'Juan Espinoza Medrano', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030305', 'Oropesa', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030306', 'Pachaconas', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030307', 'Sabaino', '0303', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030401', 'Chalhuanca', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030402', 'Capaya', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030403', 'Caraybamba', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030404', 'Chapimarca', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030405', 'Colcabamba', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030406', 'Cotaruse', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030407', 'Ihuayllo', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030408', 'Justo Apu Sahuaraura', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030409', 'Lucre', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030410', 'Pocohuanca', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030411', 'San Juan de Chacña', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030412', 'Sañayca', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030413', 'Soraya', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030414', 'Tapairihua', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030415', 'Tintay', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030416', 'Toraya', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030417', 'Yanaca', '0304', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030501', 'Tambobamba', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030502', 'Cotabambas', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030503', 'Coyllurqui', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030504', 'Haquira', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030505', 'Mara', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030506', 'Challhuahuacho', '0305', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030601', 'Chincheros', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030602', 'Anco_Huallo', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030603', 'Cocharcas', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030604', 'Huaccana', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030605', 'Ocobamba', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030606', 'Ongoy', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030607', 'Uranmarca', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030608', 'Ranracancha', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030609', 'Rocchacc', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030610', 'El Porvenir', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030611', 'Los Chankas', '0306', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030701', 'Chuquibambilla', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030702', 'Curpahuasi', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030703', 'Gamarra', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030704', 'Huayllati', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030705', 'Mamara', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030706', 'Micaela Bastidas', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030707', 'Pataypampa', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030708', 'Progreso', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030709', 'San Antonio', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030710', 'Santa Rosa', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030711', 'Turpay', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030712', 'Vilcabamba', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030713', 'Virundo', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('030714', 'Curasco', '0307', '03');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040101', 'Arequipa', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040102', 'Alto Selva Alegre', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040103', 'Cayma', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040104', 'Cerro Colorado', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040105', 'Characato', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040106', 'Chiguata', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040107', 'Jacobo Hunter', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040108', 'La Joya', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040109', 'Mariano Melgar', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040110', 'Miraflores', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040111', 'Mollebaya', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040112', 'Paucarpata', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040113', 'Pocsi', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040114', 'Polobaya', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040115', 'Quequeña', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040116', 'Sabandia', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040117', 'Sachaca', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040118', 'San Juan de Siguas', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040119', 'San Juan de Tarucani', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040120', 'Santa Isabel de Siguas', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040121', 'Santa Rita de Siguas', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040122', 'Socabaya', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040123', 'Tiabaya', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040124', 'Uchumayo', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040125', 'Vitor', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040126', 'Yanahuara', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040127', 'Yarabamba', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040128', 'Yura', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040129', 'José Luis Bustamante Y Rivero', '0401', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040201', 'Camaná', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040202', 'José María Quimper', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040203', 'Mariano Nicolás Valcárcel', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040204', 'Mariscal Cáceres', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040205', 'Nicolás de Pierola', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040206', 'Ocoña', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040207', 'Quilca', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040208', 'Samuel Pastor', '0402', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040301', 'Caravelí', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040302', 'Acarí', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040303', 'Atico', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040304', 'Atiquipa', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040305', 'Bella Unión', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040306', 'Cahuacho', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040307', 'Chala', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040308', 'Chaparra', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040309', 'Huanuhuanu', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040310', 'Jaqui', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040311', 'Lomas', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040312', 'Quicacha', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040313', 'Yauca', '0403', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040401', 'Aplao', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040402', 'Andagua', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040403', 'Ayo', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040404', 'Chachas', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040405', 'Chilcaymarca', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040406', 'Choco', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040407', 'Huancarqui', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040408', 'Machaguay', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040409', 'Orcopampa', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040410', 'Pampacolca', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040411', 'Tipan', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040412', 'Uñon', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040413', 'Uraca', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040414', 'Viraco', '0404', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040501', 'Chivay', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040502', 'Achoma', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040503', 'Cabanaconde', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040504', 'Callalli', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040505', 'Caylloma', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040506', 'Coporaque', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040507', 'Huambo', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040508', 'Huanca', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040509', 'Ichupampa', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040510', 'Lari', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040511', 'Lluta', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040512', 'Maca', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040513', 'Madrigal', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040514', 'San Antonio de Chuca', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040515', 'Sibayo', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040516', 'Tapay', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040517', 'Tisco', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040518', 'Tuti', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040519', 'Yanque', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040520', 'Majes', '0405', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040601', 'Chuquibamba', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040602', 'Andaray', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040603', 'Cayarani', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040604', 'Chichas', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040605', 'Iray', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040606', 'Río Grande', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040607', 'Salamanca', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040608', 'Yanaquihua', '0406', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040701', 'Mollendo', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040702', 'Cocachacra', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040703', 'Dean Valdivia', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040704', 'Islay', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040705', 'Mejia', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040706', 'Punta de Bombón', '0407', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040801', 'Cotahuasi', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040802', 'Alca', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040803', 'Charcana', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040804', 'Huaynacotas', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040805', 'Pampamarca', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040806', 'Puyca', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040807', 'Quechualla', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040808', 'Sayla', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040809', 'Tauria', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040810', 'Tomepampa', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('040811', 'Toro', '0408', '04');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050101', 'Ayacucho', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050102', 'Acocro', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050103', 'Acos Vinchos', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050104', 'Carmen Alto', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050105', 'Chiara', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050106', 'Ocros', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050107', 'Pacaycasa', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050108', 'Quinua', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050109', 'San José de Ticllas', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050110', 'San Juan Bautista', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050111', 'Santiago de Pischa', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050112', 'Socos', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050113', 'Tambillo', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050114', 'Vinchos', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050115', 'Jesús Nazareno', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050116', 'Andrés Avelino Cáceres Dorregaray', '0501', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050201', 'Cangallo', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050202', 'Chuschi', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050203', 'Los Morochucos', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050204', 'María Parado de Bellido', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050205', 'Paras', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050206', 'Totos', '0502', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050301', 'Sancos', '0503', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050302', 'Carapo', '0503', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050303', 'Sacsamarca', '0503', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050304', 'Santiago de Lucanamarca', '0503', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050401', 'Huanta', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050402', 'Ayahuanco', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050403', 'Huamanguilla', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050404', 'Iguain', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050405', 'Luricocha', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050406', 'Santillana', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050407', 'Sivia', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050408', 'Llochegua', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050409', 'Canayre', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050410', 'Uchuraccay', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050411', 'Pucacolpa', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050412', 'Chaca', '0504', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050501', 'San Miguel', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050502', 'Anco', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050503', 'Ayna', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050504', 'Chilcas', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050505', 'Chungui', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050506', 'Luis Carranza', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050507', 'Santa Rosa', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050508', 'Tambo', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050509', 'Samugari', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050510', 'Anchihuay', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050511', 'Oronccoy', '0505', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050601', 'Puquio', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050602', 'Aucara', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050603', 'Cabana', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050604', 'Carmen Salcedo', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050605', 'Chaviña', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050606', 'Chipao', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050607', 'Huac-Huas', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050608', 'Laramate', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050609', 'Leoncio Prado', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050610', 'Llauta', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050611', 'Lucanas', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050612', 'Ocaña', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050613', 'Otoca', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050614', 'Saisa', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050615', 'San Cristóbal', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050616', 'San Juan', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050617', 'San Pedro', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050618', 'San Pedro de Palco', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050619', 'Sancos', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050620', 'Santa Ana de Huaycahuacho', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050621', 'Santa Lucia', '0506', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050701', 'Coracora', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050702', 'Chumpi', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050703', 'Coronel Castañeda', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050704', 'Pacapausa', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050705', 'Pullo', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050706', 'Puyusca', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050707', 'San Francisco de Ravacayco', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050708', 'Upahuacho', '0507', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050801', 'Pausa', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050802', 'Colta', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050803', 'Corculla', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050804', 'Lampa', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050805', 'Marcabamba', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050806', 'Oyolo', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050807', 'Pararca', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050808', 'San Javier de Alpabamba', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050809', 'San José de Ushua', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050810', 'Sara Sara', '0508', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050901', 'Querobamba', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050902', 'Belén', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050903', 'Chalcos', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050904', 'Chilcayoc', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050905', 'Huacaña', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050906', 'Morcolla', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050907', 'Paico', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050908', 'San Pedro de Larcay', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050909', 'San Salvador de Quije', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050910', 'Santiago de Paucaray', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('050911', 'Soras', '0509', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051001', 'Huancapi', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051002', 'Alcamenca', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051003', 'Apongo', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051004', 'Asquipata', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051005', 'Canaria', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051006', 'Cayara', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051007', 'Colca', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051008', 'Huamanquiquia', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051009', 'Huancaraylla', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051010', 'Hualla', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051011', 'Sarhua', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051012', 'Vilcanchos', '0510', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051101', 'Vilcas Huaman', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051102', 'Accomarca', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051103', 'Carhuanca', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051104', 'Concepción', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051105', 'Huambalpa', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051106', 'Independencia', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051107', 'Saurama', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('051108', 'Vischongo', '0511', '05');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060101', 'Cajamarca', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060102', 'Asunción', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060103', 'Chetilla', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060104', 'Cospan', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060105', 'Encañada', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060106', 'Jesús', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060107', 'Llacanora', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060108', 'Los Baños del Inca', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060109', 'Magdalena', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060110', 'Matara', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060111', 'Namora', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060112', 'San Juan', '0601', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060201', 'Cajabamba', '0602', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060202', 'Cachachi', '0602', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060203', 'Condebamba', '0602', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060204', 'Sitacocha', '0602', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060301', 'Celendín', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060302', 'Chumuch', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060303', 'Cortegana', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060304', 'Huasmin', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060305', 'Jorge Chávez', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060306', 'José Gálvez', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060307', 'Miguel Iglesias', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060308', 'Oxamarca', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060309', 'Sorochuco', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060310', 'Sucre', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060311', 'Utco', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060312', 'La Libertad de Pallan', '0603', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060401', 'Chota', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060402', 'Anguia', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060403', 'Chadin', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060404', 'Chiguirip', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060405', 'Chimban', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060406', 'Choropampa', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060407', 'Cochabamba', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060408', 'Conchan', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060409', 'Huambos', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060410', 'Lajas', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060411', 'Llama', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060412', 'Miracosta', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060413', 'Paccha', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060414', 'Pion', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060415', 'Querocoto', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060416', 'San Juan de Licupis', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060417', 'Tacabamba', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060418', 'Tocmoche', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060419', 'Chalamarca', '0604', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060501', 'Contumaza', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060502', 'Chilete', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060503', 'Cupisnique', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060504', 'Guzmango', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060505', 'San Benito', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060506', 'Santa Cruz de Toledo', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060507', 'Tantarica', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060508', 'Yonan', '0605', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060601', 'Cutervo', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060602', 'Callayuc', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060603', 'Choros', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060604', 'Cujillo', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060605', 'La Ramada', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060606', 'Pimpingos', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060607', 'Querocotillo', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060608', 'San Andrés de Cutervo', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060609', 'San Juan de Cutervo', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060610', 'San Luis de Lucma', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060611', 'Santa Cruz', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060612', 'Santo Domingo de la Capilla', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060613', 'Santo Tomas', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060614', 'Socota', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060615', 'Toribio Casanova', '0606', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060701', 'Bambamarca', '0607', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060702', 'Chugur', '0607', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060703', 'Hualgayoc', '0607', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060801', 'Jaén', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060802', 'Bellavista', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060803', 'Chontali', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060804', 'Colasay', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060805', 'Huabal', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060806', 'Las Pirias', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060807', 'Pomahuaca', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060808', 'Pucara', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060809', 'Sallique', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060810', 'San Felipe', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060811', 'San José del Alto', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060812', 'Santa Rosa', '0608', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060901', 'San Ignacio', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060902', 'Chirinos', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060903', 'Huarango', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060904', 'La Coipa', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060905', 'Namballe', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060906', 'San José de Lourdes', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('060907', 'Tabaconas', '0609', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061001', 'Pedro Gálvez', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061002', 'Chancay', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061003', 'Eduardo Villanueva', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061004', 'Gregorio Pita', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061005', 'Ichocan', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061006', 'José Manuel Quiroz', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061007', 'José Sabogal', '0610', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061101', 'San Miguel', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061102', 'Bolívar', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061103', 'Calquis', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061104', 'Catilluc', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061105', 'El Prado', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061106', 'La Florida', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061107', 'Llapa', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061108', 'Nanchoc', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061109', 'Niepos', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061110', 'San Gregorio', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061111', 'San Silvestre de Cochan', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061112', 'Tongod', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061113', 'Unión Agua Blanca', '0611', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061201', 'San Pablo', '0612', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061202', 'San Bernardino', '0612', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061203', 'San Luis', '0612', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061204', 'Tumbaden', '0612', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061301', 'Santa Cruz', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061302', 'Andabamba', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061303', 'Catache', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061304', 'Chancaybaños', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061305', 'La Esperanza', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061306', 'Ninabamba', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061307', 'Pulan', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061308', 'Saucepampa', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061309', 'Sexi', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061310', 'Uticyacu', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('061311', 'Yauyucan', '0613', '06');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070101', 'Callao', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070102', 'Bellavista', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070103', 'Carmen de la Legua Reynoso', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070104', 'La Perla', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070105', 'La Punta', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070106', 'Ventanilla', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('070107', 'Mi Perú', '0701', '07');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080101', 'Cusco', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080102', 'Ccorca', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080103', 'Poroy', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080104', 'San Jerónimo', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080105', 'San Sebastian', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080106', 'Santiago', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080107', 'Saylla', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080108', 'Wanchaq', '0801', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080201', 'Acomayo', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080202', 'Acopia', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080203', 'Acos', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080204', 'Mosoc Llacta', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080205', 'Pomacanchi', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080206', 'Rondocan', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080207', 'Sangarara', '0802', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080301', 'Anta', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080302', 'Ancahuasi', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080303', 'Cachimayo', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080304', 'Chinchaypujio', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080305', 'Huarocondo', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080306', 'Limatambo', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080307', 'Mollepata', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080308', 'Pucyura', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080309', 'Zurite', '0803', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080401', 'Calca', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080402', 'Coya', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080403', 'Lamay', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080404', 'Lares', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080405', 'Pisac', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080406', 'San Salvador', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080407', 'Taray', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080408', 'Yanatile', '0804', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080501', 'Yanaoca', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080502', 'Checca', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080503', 'Kunturkanki', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080504', 'Langui', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080505', 'Layo', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080506', 'Pampamarca', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080507', 'Quehue', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080508', 'Tupac Amaru', '0805', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080601', 'Sicuani', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080602', 'Checacupe', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080603', 'Combapata', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080604', 'Marangani', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080605', 'Pitumarca', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080606', 'San Pablo', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080607', 'San Pedro', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080608', 'Tinta', '0806', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080701', 'Santo Tomas', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080702', 'Capacmarca', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080703', 'Chamaca', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080704', 'Colquemarca', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080705', 'Livitaca', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080706', 'Llusco', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080707', 'Quiñota', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080708', 'Velille', '0807', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080801', 'Espinar', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080802', 'Condoroma', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080803', 'Coporaque', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080804', 'Ocoruro', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080805', 'Pallpata', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080806', 'Pichigua', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080807', 'Suyckutambo', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080808', 'Alto Pichigua', '0808', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080901', 'Santa Ana', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080902', 'Echarate', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080903', 'Huayopata', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080904', 'Maranura', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080905', 'Ocobamba', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080906', 'Quellouno', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080907', 'Kimbiri', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080908', 'Santa Teresa', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080909', 'Vilcabamba', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080910', 'Pichari', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080911', 'Inkawasi', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080912', 'Villa Virgen', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080913', 'Villa Kintiarina', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('080914', 'Megantoni', '0809', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081001', 'Paruro', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081002', 'Accha', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081003', 'Ccapi', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081004', 'Colcha', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081005', 'Huanoquite', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081006', 'Omachaç', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081007', 'Paccaritambo', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081008', 'Pillpinto', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081009', 'Yaurisque', '0810', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081101', 'Paucartambo', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081102', 'Caicay', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081103', 'Challabamba', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081104', 'Colquepata', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081105', 'Huancarani', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081106', 'Kosñipata', '0811', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081201', 'Urcos', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081202', 'Andahuaylillas', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081203', 'Camanti', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081204', 'Ccarhuayo', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081205', 'Ccatca', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081206', 'Cusipata', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081207', 'Huaro', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081208', 'Lucre', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081209', 'Marcapata', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081210', 'Ocongate', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081211', 'Oropesa', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081212', 'Quiquijana', '0812', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081301', 'Urubamba', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081302', 'Chinchero', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081303', 'Huayllabamba', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081304', 'Machupicchu', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081305', 'Maras', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081306', 'Ollantaytambo', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('081307', 'Yucay', '0813', '08');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090101', 'Huancavelica', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090102', 'Acobambilla', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090103', 'Acoria', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090104', 'Conayca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090105', 'Cuenca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090106', 'Huachocolpa', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090107', 'Huayllahuara', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090108', 'Izcuchaca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090109', 'Laria', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090110', 'Manta', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090111', 'Mariscal Cáceres', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090112', 'Moya', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090113', 'Nuevo Occoro', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090114', 'Palca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090115', 'Pilchaca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090116', 'Vilca', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090117', 'Yauli', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090118', 'Ascensión', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090119', 'Huando', '0901', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090201', 'Acobamba', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090202', 'Andabamba', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090203', 'Anta', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090204', 'Caja', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090205', 'Marcas', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090206', 'Paucara', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090207', 'Pomacocha', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090208', 'Rosario', '0902', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090301', 'Lircay', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090302', 'Anchonga', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090303', 'Callanmarca', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090304', 'Ccochaccasa', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090305', 'Chincho', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090306', 'Congalla', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090307', 'Huanca-Huanca', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090308', 'Huayllay Grande', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090309', 'Julcamarca', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090310', 'San Antonio de Antaparco', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090311', 'Santo Tomas de Pata', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090312', 'Secclla', '0903', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090401', 'Castrovirreyna', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090402', 'Arma', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090403', 'Aurahua', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090404', 'Capillas', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090405', 'Chupamarca', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090406', 'Cocas', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090407', 'Huachos', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090408', 'Huamatambo', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090409', 'Mollepampa', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090410', 'San Juan', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090411', 'Santa Ana', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090412', 'Tantara', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090413', 'Ticrapo', '0904', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090501', 'Churcampa', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090502', 'Anco', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090503', 'Chinchihuasi', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090504', 'El Carmen', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090505', 'La Merced', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090506', 'Locroja', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090507', 'Paucarbamba', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090508', 'San Miguel de Mayocc', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090509', 'San Pedro de Coris', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090510', 'Pachamarca', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090511', 'Cosme', '0905', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090601', 'Huaytara', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090602', 'Ayavi', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090603', 'Córdova', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090604', 'Huayacundo Arma', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090605', 'Laramarca', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090606', 'Ocoyo', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090607', 'Pilpichaca', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090608', 'Querco', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090609', 'Quito-Arma', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090610', 'San Antonio de Cusicancha', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090611', 'San Francisco de Sangayaico', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090612', 'San Isidro', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090613', 'Santiago de Chocorvos', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090614', 'Santiago de Quirahuara', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090615', 'Santo Domingo de Capillas', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090616', 'Tambo', '0906', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090701', 'Pampas', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090702', 'Acostambo', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090703', 'Acraquia', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090704', 'Ahuaycha', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090705', 'Colcabamba', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090706', 'Daniel Hernández', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090707', 'Huachocolpa', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090709', 'Huaribamba', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090710', 'Ñahuimpuquio', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090711', 'Pazos', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090713', 'Quishuar', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090714', 'Salcabamba', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090715', 'Salcahuasi', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090716', 'San Marcos de Rocchac', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090717', 'Surcubamba', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090718', 'Tintay Puncu', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090719', 'Quichuas', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090720', 'Andaymarca', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090721', 'Roble', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090722', 'Pichos', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('090723', 'Santiago de Tucuma', '0907', '09');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100101', 'Huanuco', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100102', 'Amarilis', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100103', 'Chinchao', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100104', 'Churubamba', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100105', 'Margos', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100106', 'Quisqui (Kichki)', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100107', 'San Francisco de Cayran', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100108', 'San Pedro de Chaulan', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100109', 'Santa María del Valle', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100110', 'Yarumayo', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100111', 'Pillco Marca', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100112', 'Yacus', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100113', 'San Pablo de Pillao', '1001', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100201', 'Ambo', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100202', 'Cayna', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100203', 'Colpas', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100204', 'Conchamarca', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100205', 'Huacar', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100206', 'San Francisco', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100207', 'San Rafael', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100208', 'Tomay Kichwa', '1002', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100301', 'La Unión', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100307', 'Chuquis', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100311', 'Marías', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100313', 'Pachas', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100316', 'Quivilla', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100317', 'Ripan', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100321', 'Shunqui', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100322', 'Sillapata', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100323', 'Yanas', '1003', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100401', 'Huacaybamba', '1004', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100402', 'Canchabamba', '1004', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100403', 'Cochabamba', '1004', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100404', 'Pinra', '1004', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100501', 'Llata', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100502', 'Arancay', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100503', 'Chavín de Pariarca', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100504', 'Jacas Grande', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100505', 'Jircan', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100506', 'Miraflores', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100507', 'Monzón', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100508', 'Punchao', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100509', 'Puños', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100510', 'Singa', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100511', 'Tantamayo', '1005', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100601', 'Rupa-Rupa', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100602', 'Daniel Alomía Robles', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100603', 'Hermílio Valdizan', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100604', 'José Crespo y Castillo', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100605', 'Luyando', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100606', 'Mariano Damaso Beraun', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100607', 'Pucayacu', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100608', 'Castillo Grande', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100609', 'Pueblo Nuevo', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100610', 'Santo Domingo de Anda', '1006', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100701', 'Huacrachuco', '1007', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100702', 'Cholon', '1007', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100703', 'San Buenaventura', '1007', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100704', 'La Morada', '1007', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100705', 'Santa Rosa de Alto Yanajanca', '1007', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100801', 'Panao', '1008', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100802', 'Chaglla', '1008', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100803', 'Molino', '1008', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100804', 'Umari', '1008', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100901', 'Puerto Inca', '1009', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100902', 'Codo del Pozuzo', '1009', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100903', 'Honoria', '1009', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100904', 'Tournavista', '1009', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('100905', 'Yuyapichis', '1009', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101001', 'Jesús', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101002', 'Baños', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101003', 'Jivia', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101004', 'Queropalca', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101005', 'Rondos', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101006', 'San Francisco de Asís', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101007', 'San Miguel de Cauri', '1010', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101101', 'Chavinillo', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101102', 'Cahuac', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101103', 'Chacabamba', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101104', 'Aparicio Pomares', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101105', 'Jacas Chico', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101106', 'Obas', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101107', 'Pampamarca', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('101108', 'Choras', '1011', '10');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110101', 'Ica', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110102', 'La Tinguiña', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110103', 'Los Aquijes', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110104', 'Ocucaje', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110105', 'Pachacutec', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110106', 'Parcona', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110107', 'Pueblo Nuevo', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110108', 'Salas', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110109', 'San José de Los Molinos', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110110', 'San Juan Bautista', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110111', 'Santiago', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110112', 'Subtanjalla', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110113', 'Tate', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110114', 'Yauca del Rosario', '1101', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110201', 'Chincha Alta', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110202', 'Alto Laran', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110203', 'Chavin', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110204', 'Chincha Baja', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110205', 'El Carmen', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110206', 'Grocio Prado', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110207', 'Pueblo Nuevo', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110208', 'San Juan de Yanac', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110209', 'San Pedro de Huacarpana', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110210', 'Sunampe', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110211', 'Tambo de Mora', '1102', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110301', 'Nasca', '1103', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110302', 'Changuillo', '1103', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110303', 'El Ingenio', '1103', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110304', 'Marcona', '1103', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110305', 'Vista Alegre', '1103', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110401', 'Palpa', '1104', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110402', 'Llipata', '1104', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110403', 'Río Grande', '1104', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110404', 'Santa Cruz', '1104', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110405', 'Tibillo', '1104', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110501', 'Pisco', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110502', 'Huancano', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110503', 'Humay', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110504', 'Independencia', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110505', 'Paracas', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110506', 'San Andrés', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110507', 'San Clemente', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('110508', 'Tupac Amaru Inca', '1105', '11');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120101', 'Huancayo', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120104', 'Carhuacallanga', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120105', 'Chacapampa', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120106', 'Chicche', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120107', 'Chilca', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120108', 'Chongos Alto', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120111', 'Chupuro', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120112', 'Colca', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120113', 'Cullhuas', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120114', 'El Tambo', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120116', 'Huacrapuquio', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120117', 'Hualhuas', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120119', 'Huancan', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120120', 'Huasicancha', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120121', 'Huayucachi', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120122', 'Ingenio', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120124', 'Pariahuanca', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120125', 'Pilcomayo', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120126', 'Pucara', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120127', 'Quichuay', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120128', 'Quilcas', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120129', 'San Agustín', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120130', 'San Jerónimo de Tunan', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120132', 'Saño', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120133', 'Sapallanga', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120134', 'Sicaya', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120135', 'Santo Domingo de Acobamba', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120136', 'Viques', '1201', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120201', 'Concepción', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120202', 'Aco', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120203', 'Andamarca', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120204', 'Chambara', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120205', 'Cochas', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120206', 'Comas', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120207', 'Heroínas Toledo', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120208', 'Manzanares', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120209', 'Mariscal Castilla', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120210', 'Matahuasi', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120211', 'Mito', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120212', 'Nueve de Julio', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120213', 'Orcotuna', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120214', 'San José de Quero', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120215', 'Santa Rosa de Ocopa', '1202', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120301', 'Chanchamayo', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120302', 'Perene', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120303', 'Pichanaqui', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120304', 'San Luis de Shuaro', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120305', 'San Ramón', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120306', 'Vitoc', '1203', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120401', 'Jauja', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120402', 'Acolla', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120403', 'Apata', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120404', 'Ataura', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120405', 'Canchayllo', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120406', 'Curicaca', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120407', 'El Mantaro', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120408', 'Huamali', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120409', 'Huaripampa', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120410', 'Huertas', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120411', 'Janjaillo', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120412', 'Julcán', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120413', 'Leonor Ordóñez', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120414', 'Llocllapampa', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120415', 'Marco', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120416', 'Masma', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120417', 'Masma Chicche', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120418', 'Molinos', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120419', 'Monobamba', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120420', 'Muqui', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120421', 'Muquiyauyo', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120422', 'Paca', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120423', 'Paccha', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120424', 'Pancan', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120425', 'Parco', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120426', 'Pomacancha', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120427', 'Ricran', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120428', 'San Lorenzo', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120429', 'San Pedro de Chunan', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120430', 'Sausa', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120431', 'Sincos', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120432', 'Tunan Marca', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120433', 'Yauli', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120434', 'Yauyos', '1204', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120501', 'Junin', '1205', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120502', 'Carhuamayo', '1205', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120503', 'Ondores', '1205', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120504', 'Ulcumayo', '1205', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120601', 'Satipo', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120602', 'Coviriali', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120603', 'Llaylla', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120604', 'Mazamari', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120605', 'Pampa Hermosa', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120606', 'Pangoa', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120607', 'Río Negro', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120608', 'Río Tambo', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120609', 'Vizcatan del Ene', '1206', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120701', 'Tarma', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120702', 'Acobamba', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120703', 'Huaricolca', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120704', 'Huasahuasi', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120705', 'La Unión', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120706', 'Palca', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120707', 'Palcamayo', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120708', 'San Pedro de Cajas', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120709', 'Tapo', '1207', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120801', 'La Oroya', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120802', 'Chacapalpa', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120803', 'Huay-Huay', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120804', 'Marcapomacocha', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120805', 'Morococha', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120806', 'Paccha', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120807', 'Santa Bárbara de Carhuacayan', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120808', 'Santa Rosa de Sacco', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120809', 'Suitucancha', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120810', 'Yauli', '1208', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120901', 'Chupaca', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120902', 'Ahuac', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120903', 'Chongos Bajo', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120904', 'Huachac', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120905', 'Huamancaca Chico', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120906', 'San Juan de Iscos', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120907', 'San Juan de Jarpa', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120908', 'Tres de Diciembre', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('120909', 'Yanacancha', '1209', '12');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130101', 'Trujillo', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130102', 'El Porvenir', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130103', 'Florencia de Mora', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130104', 'Huanchaco', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130105', 'La Esperanza', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130106', 'Laredo', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130107', 'Moche', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130108', 'Poroto', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130109', 'Salaverry', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130110', 'Simbal', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130111', 'Victor Larco Herrera', '1301', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130201', 'Ascope', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130202', 'Chicama', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130203', 'Chocope', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130204', 'Magdalena de Cao', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130205', 'Paijan', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130206', 'Rázuri', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130207', 'Santiago de Cao', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130208', 'Casa Grande', '1302', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130301', 'Bolívar', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130302', 'Bambamarca', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130303', 'Condormarca', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130304', 'Longotea', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130305', 'Uchumarca', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130306', 'Ucuncha', '1303', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130401', 'Chepen', '1304', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130402', 'Pacanga', '1304', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130403', 'Pueblo Nuevo', '1304', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130501', 'Julcan', '1305', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130502', 'Calamarca', '1305', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130503', 'Carabamba', '1305', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130504', 'Huaso', '1305', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130601', 'Otuzco', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130602', 'Agallpampa', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130604', 'Charat', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130605', 'Huaranchal', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130606', 'La Cuesta', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130608', 'Mache', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130610', 'Paranday', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130611', 'Salpo', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130613', 'Sinsicap', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130614', 'Usquil', '1306', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130701', 'San Pedro de Lloc', '1307', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130702', 'Guadalupe', '1307', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130703', 'Jequetepeque', '1307', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130704', 'Pacasmayo', '1307', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130705', 'San José', '1307', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130801', 'Tayabamba', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130802', 'Buldibuyo', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130803', 'Chillia', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130804', 'Huancaspata', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130805', 'Huaylillas', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130806', 'Huayo', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130807', 'Ongon', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130808', 'Parcoy', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130809', 'Pataz', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130810', 'Pias', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130811', 'Santiago de Challas', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130812', 'Taurija', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130813', 'Urpay', '1308', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130901', 'Huamachuco', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130902', 'Chugay', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130903', 'Cochorco', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130904', 'Curgos', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130905', 'Marcabal', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130906', 'Sanagoran', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130907', 'Sarin', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('130908', 'Sartimbamba', '1309', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131001', 'Santiago de Chuco', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131002', 'Angasmarca', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131003', 'Cachicadan', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131004', 'Mollebamba', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131005', 'Mollepata', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131006', 'Quiruvilca', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131007', 'Santa Cruz de Chuca', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131008', 'Sitabamba', '1310', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131101', 'Cascas', '1311', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131102', 'Lucma', '1311', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131103', 'Marmot', '1311', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131104', 'Sayapullo', '1311', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131201', 'Viru', '1312', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131202', 'Chao', '1312', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('131203', 'Guadalupito', '1312', '13');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140101', 'Chiclayo', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140102', 'Chongoyape', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140103', 'Eten', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140104', 'Eten Puerto', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140105', 'José Leonardo Ortiz', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140106', 'La Victoria', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140107', 'Lagunas', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140108', 'Monsefu', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140109', 'Nueva Arica', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140110', 'Oyotun', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140111', 'Picsi', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140112', 'Pimentel', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140113', 'Reque', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140114', 'Santa Rosa', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140115', 'Saña', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140116', 'Cayalti', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140117', 'Patapo', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140118', 'Pomalca', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140119', 'Pucala', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140120', 'Tuman', '1401', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140201', 'Ferreñafe', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140202', 'Cañaris', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140203', 'Incahuasi', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140204', 'Manuel Antonio Mesones Muro', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140205', 'Pitipo', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140206', 'Pueblo Nuevo', '1402', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140301', 'Lambayeque', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140302', 'Chochope', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140303', 'Illimo', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140304', 'Jayanca', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140305', 'Mochumi', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140306', 'Morrope', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140307', 'Motupe', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140308', 'Olmos', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140309', 'Pacora', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140310', 'Salas', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140311', 'San José', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('140312', 'Tucume', '1403', '14');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150101', 'Lima', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150102', 'Ancón', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150103', 'Ate', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150104', 'Barranco', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150105', 'Breña', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150106', 'Carabayllo', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150107', 'Chaclacayo', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150108', 'Chorrillos', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150109', 'Cieneguilla', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150110', 'Comas', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150111', 'El Agustino', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150112', 'Independencia', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150113', 'Jesús María', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150114', 'La Molina', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150115', 'La Victoria', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150116', 'Lince', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150117', 'Los Olivos', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150118', 'Lurigancho', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150119', 'Lurin', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150120', 'Magdalena del Mar', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150121', 'Pueblo Libre', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150122', 'Miraflores', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150123', 'Pachacamac', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150124', 'Pucusana', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150125', 'Puente Piedra', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150126', 'Punta Hermosa', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150127', 'Punta Negra', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150128', 'Rímac', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150129', 'San Bartolo', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150130', 'San Borja', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150131', 'San Isidro', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150132', 'San Juan de Lurigancho', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150133', 'San Juan de Miraflores', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150134', 'San Luis', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150135', 'San Martín de Porres', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150136', 'San Miguel', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150137', 'Santa Anita', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150138', 'Santa María del Mar', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150139', 'Santa Rosa', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150140', 'Santiago de Surco', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150141', 'Surquillo', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150142', 'Villa El Salvador', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150143', 'Villa María del Triunfo', '1501', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150201', 'Barranca', '1502', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150202', 'Paramonga', '1502', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150203', 'Pativilca', '1502', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150204', 'Supe', '1502', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150205', 'Supe Puerto', '1502', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150301', 'Cajatambo', '1503', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150302', 'Copa', '1503', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150303', 'Gorgor', '1503', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150304', 'Huancapon', '1503', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150305', 'Manas', '1503', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150401', 'Canta', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150402', 'Arahuay', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150403', 'Huamantanga', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150404', 'Huaros', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150405', 'Lachaqui', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150406', 'San Buenaventura', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150407', 'Santa Rosa de Quives', '1504', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150501', 'San Vicente de Cañete', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150502', 'Asia', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150503', 'Calango', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150504', 'Cerro Azul', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150505', 'Chilca', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150506', 'Coayllo', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150507', 'Imperial', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150508', 'Lunahuana', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150509', 'Mala', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150510', 'Nuevo Imperial', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150511', 'Pacaran', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150512', 'Quilmana', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150513', 'San Antonio', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150514', 'San Luis', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150515', 'Santa Cruz de Flores', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150516', 'Zúñiga', '1505', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150601', 'Huaral', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150602', 'Atavillos Alto', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150603', 'Atavillos Bajo', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150604', 'Aucallama', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150605', 'Chancay', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150606', 'Ihuari', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150607', 'Lampian', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150608', 'Pacaraos', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150609', 'San Miguel de Acos', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150610', 'Santa Cruz de Andamarca', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150611', 'Sumbilca', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150612', 'Veintisiete de Noviembre', '1506', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150701', 'Matucana', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150702', 'Antioquia', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150703', 'Callahuanca', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150704', 'Carampoma', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150705', 'Chicla', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150706', 'Cuenca', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150707', 'Huachupampa', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150708', 'Huanza', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150709', 'Huarochiri', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150710', 'Lahuaytambo', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150711', 'Langa', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150712', 'Laraos', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150713', 'Mariatana', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150714', 'Ricardo Palma', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150715', 'San Andrés de Tupicocha', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150716', 'San Antonio', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150717', 'San Bartolomé', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150718', 'San Damian', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150719', 'San Juan de Iris', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150720', 'San Juan de Tantaranche', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150721', 'San Lorenzo de Quinti', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150722', 'San Mateo', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150723', 'San Mateo de Otao', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150724', 'San Pedro de Casta', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150725', 'San Pedro de Huancayre', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150726', 'Sangallaya', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150727', 'Santa Cruz de Cocachacra', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150728', 'Santa Eulalia', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150729', 'Santiago de Anchucaya', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150730', 'Santiago de Tuna', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150731', 'Santo Domingo de Los Olleros', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150732', 'Surco', '1507', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150801', 'Huacho', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150802', 'Ambar', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150803', 'Caleta de Carquin', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150804', 'Checras', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150805', 'Hualmay', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150806', 'Huaura', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150807', 'Leoncio Prado', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150808', 'Paccho', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150809', 'Santa Leonor', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150810', 'Santa María', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150811', 'Sayan', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150812', 'Vegueta', '1508', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150901', 'Oyon', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150902', 'Andajes', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150903', 'Caujul', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150904', 'Cochamarca', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150905', 'Navan', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('150906', 'Pachangara', '1509', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151001', 'Yauyos', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151002', 'Alis', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151003', 'Allauca', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151004', 'Ayaviri', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151005', 'Azángaro', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151006', 'Cacra', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151007', 'Carania', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151008', 'Catahuasi', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151009', 'Chocos', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151010', 'Cochas', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151011', 'Colonia', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151012', 'Hongos', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151013', 'Huampara', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151014', 'Huancaya', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151015', 'Huangascar', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151016', 'Huantan', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151017', 'Huañec', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151018', 'Laraos', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151019', 'Lincha', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151020', 'Madean', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151021', 'Miraflores', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151022', 'Omas', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151023', 'Putinza', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151024', 'Quinches', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151025', 'Quinocay', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151026', 'San Joaquín', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151027', 'San Pedro de Pilas', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151028', 'Tanta', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151029', 'Tauripampa', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151030', 'Tomas', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151031', 'Tupe', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151032', 'Viñac', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('151033', 'Vitis', '1510', '15');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160101', 'Iquitos', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160102', 'Alto Nanay', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160103', 'Fernando Lores', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160104', 'Indiana', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160105', 'Las Amazonas', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160106', 'Mazan', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160107', 'Napo', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160108', 'Punchana', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160110', 'Torres Causana', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160112', 'Belén', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160113', 'San Juan Bautista', '1601', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160201', 'Yurimaguas', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160202', 'Balsapuerto', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160205', 'Jeberos', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160206', 'Lagunas', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160210', 'Santa Cruz', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160211', 'Teniente Cesar López Rojas', '1602', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160301', 'Nauta', '1603', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160302', 'Parinari', '1603', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160303', 'Tigre', '1603', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160304', 'Trompeteros', '1603', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160305', 'Urarinas', '1603', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160401', 'Ramón Castilla', '1604', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160402', 'Pebas', '1604', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160403', 'Yavari', '1604', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160404', 'San Pablo', '1604', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160501', 'Requena', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160502', 'Alto Tapiche', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160503', 'Capelo', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160504', 'Emilio San Martín', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160505', 'Maquia', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160506', 'Puinahua', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160507', 'Saquena', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160508', 'Soplin', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160509', 'Tapiche', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160510', 'Jenaro Herrera', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160511', 'Yaquerana', '1605', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160601', 'Contamana', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160602', 'Inahuaya', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160603', 'Padre Márquez', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160604', 'Pampa Hermosa', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160605', 'Sarayacu', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160606', 'Vargas Guerra', '1606', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160701', 'Barranca', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160702', 'Cahuapanas', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160703', 'Manseriche', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160704', 'Morona', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160705', 'Pastaza', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160706', 'Andoas', '1607', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160801', 'Putumayo', '1608', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160802', 'Rosa Panduro', '1608', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160803', 'Teniente Manuel Clavero', '1608', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('160804', 'Yaguas', '1608', '16');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170101', 'Tambopata', '1701', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170102', 'Inambari', '1701', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170103', 'Las Piedras', '1701', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170104', 'Laberinto', '1701', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170201', 'Manu', '1702', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170202', 'Fitzcarrald', '1702', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170203', 'Madre de Dios', '1702', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170204', 'Huepetuhe', '1702', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170301', 'Iñapari', '1703', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170302', 'Iberia', '1703', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('170303', 'Tahuamanu', '1703', '17');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180101', 'Moquegua', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180102', 'Carumas', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180103', 'Cuchumbaya', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180104', 'Samegua', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180105', 'San Cristóbal', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180106', 'Torata', '1801', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180201', 'Omate', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180202', 'Chojata', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180203', 'Coalaque', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180204', 'Ichuña', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180205', 'La Capilla', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180206', 'Lloque', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180207', 'Matalaque', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180208', 'Puquina', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180209', 'Quinistaquillas', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180210', 'Ubinas', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180211', 'Yunga', '1802', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180301', 'Ilo', '1803', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180302', 'El Algarrobal', '1803', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('180303', 'Pacocha', '1803', '18');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190101', 'Chaupimarca', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190102', 'Huachon', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190103', 'Huariaca', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190104', 'Huayllay', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190105', 'Ninacaca', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190106', 'Pallanchacra', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190107', 'Paucartambo', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190108', 'San Francisco de Asís de Yarusyacan', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190109', 'Simon Bolívar', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190110', 'Ticlacayan', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190111', 'Tinyahuarco', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190112', 'Vicco', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190113', 'Yanacancha', '1901', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190201', 'Yanahuanca', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190202', 'Chacayan', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190203', 'Goyllarisquizga', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190204', 'Paucar', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190205', 'San Pedro de Pillao', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190206', 'Santa Ana de Tusi', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190207', 'Tapuc', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190208', 'Vilcabamba', '1902', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190301', 'Oxapampa', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190302', 'Chontabamba', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190303', 'Huancabamba', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190304', 'Palcazu', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190305', 'Pozuzo', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190306', 'Puerto Bermúdez', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190307', 'Villa Rica', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('190308', 'Constitución', '1903', '19');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200101', 'Piura', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200104', 'Castilla', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200105', 'Catacaos', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200107', 'Cura Mori', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200108', 'El Tallan', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200109', 'La Arena', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200110', 'La Unión', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200111', 'Las Lomas', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200114', 'Tambo Grande', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200115', 'Veintiseis de Octubre', '2001', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200201', 'Ayabaca', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200202', 'Frias', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200203', 'Jilili', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200204', 'Lagunas', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200205', 'Montero', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200206', 'Pacaipampa', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200207', 'Paimas', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200208', 'Sapillica', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200209', 'Sicchez', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200210', 'Suyo', '2002', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200301', 'Huancabamba', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200302', 'Canchaque', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200303', 'El Carmen de la Frontera', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200304', 'Huarmaca', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200305', 'Lalaquiz', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200306', 'San Miguel de El Faique', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200307', 'Sondor', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200308', 'Sondorillo', '2003', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200401', 'Chulucanas', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200402', 'Buenos Aires', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200403', 'Chalaco', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200404', 'La Matanza', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200405', 'Morropon', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200406', 'Salitral', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200407', 'San Juan de Bigote', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200408', 'Santa Catalina de Mossa', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200409', 'Santo Domingo', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200410', 'Yamango', '2004', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200501', 'Paita', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200502', 'Amotape', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200503', 'Arenal', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200504', 'Colan', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200505', 'La Huaca', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200506', 'Tamarindo', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200507', 'Vichayal', '2005', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200601', 'Sullana', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200602', 'Bellavista', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200603', 'Ignacio Escudero', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200604', 'Lancones', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200605', 'Marcavelica', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200606', 'Miguel Checa', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200607', 'Querecotillo', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200608', 'Salitral', '2006', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200701', 'Pariñas', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200702', 'El Alto', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200703', 'La Brea', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200704', 'Lobitos', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200705', 'Los Organos', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200706', 'Mancora', '2007', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200801', 'Sechura', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200802', 'Bellavista de la Unión', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200803', 'Bernal', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200804', 'Cristo Nos Valga', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200805', 'Vice', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('200806', 'Rinconada Llicuar', '2008', '20');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210101', 'Puno', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210102', 'Acora', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210103', 'Amantani', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210104', 'Atuncolla', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210105', 'Capachica', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210106', 'Chucuito', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210107', 'Coata', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210108', 'Huata', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210109', 'Mañazo', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210110', 'Paucarcolla', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210111', 'Pichacani', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210112', 'Plateria', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210113', 'San Antonio', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210114', 'Tiquillaca', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210115', 'Vilque', '2101', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210201', 'Azángaro', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210202', 'Achaya', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210203', 'Arapa', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210204', 'Asillo', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210205', 'Caminaca', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210206', 'Chupa', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210207', 'José Domingo Choquehuanca', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210208', 'Muñani', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210209', 'Potoni', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210210', 'Saman', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210211', 'San Anton', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210212', 'San José', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210213', 'San Juan de Salinas', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210214', 'Santiago de Pupuja', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210215', 'Tirapata', '2102', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210301', 'Macusani', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210302', 'Ajoyani', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210303', 'Ayapata', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210304', 'Coasa', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210305', 'Corani', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210306', 'Crucero', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210307', 'Ituata', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210308', 'Ollachea', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210309', 'San Gaban', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210310', 'Usicayos', '2103', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210401', 'Juli', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210402', 'Desaguadero', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210403', 'Huacullani', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210404', 'Kelluyo', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210405', 'Pisacoma', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210406', 'Pomata', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210407', 'Zepita', '2104', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210501', 'Ilave', '2105', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210502', 'Capazo', '2105', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210503', 'Pilcuyo', '2105', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210504', 'Santa Rosa', '2105', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210505', 'Conduriri', '2105', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210601', 'Huancane', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210602', 'Cojata', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210603', 'Huatasani', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210604', 'Inchupalla', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210605', 'Pusi', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210606', 'Rosaspata', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210607', 'Taraco', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210608', 'Vilque Chico', '2106', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210701', 'Lampa', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210702', 'Cabanilla', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210703', 'Calapuja', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210704', 'Nicasio', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210705', 'Ocuviri', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210706', 'Palca', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210707', 'Paratia', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210708', 'Pucara', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210709', 'Santa Lucia', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210710', 'Vilavila', '2107', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210801', 'Ayaviri', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210802', 'Antauta', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210803', 'Cupi', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210804', 'Llalli', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210805', 'Macari', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210806', 'Nuñoa', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210807', 'Orurillo', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210808', 'Santa Rosa', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210809', 'Umachiri', '2108', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210901', 'Moho', '2109', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210902', 'Conima', '2109', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210903', 'Huayrapata', '2109', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('210904', 'Tilali', '2109', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211001', 'Putina', '2110', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211002', 'Ananea', '2110', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211003', 'Pedro Vilca Apaza', '2110', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211004', 'Quilcapuncu', '2110', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211005', 'Sina', '2110', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211101', 'Juliaca', '2111', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211102', 'Cabana', '2111', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211103', 'Cabanillas', '2111', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211104', 'Caracoto', '2111', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211105', 'San Miguel', '2111', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211201', 'Sandia', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211202', 'Cuyocuyo', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211203', 'Limbani', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211204', 'Patambuco', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211205', 'Phara', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211206', 'Quiaca', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211207', 'San Juan del Oro', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211208', 'Yanahuaya', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211209', 'Alto Inambari', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211210', 'San Pedro de Putina Punco', '2112', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211301', 'Yunguyo', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211302', 'Anapia', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211303', 'Copani', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211304', 'Cuturapi', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211305', 'Ollaraya', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211306', 'Tinicachi', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('211307', 'Unicachi', '2113', '21');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220101', 'Moyobamba', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220102', 'Calzada', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220103', 'Habana', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220104', 'Jepelacio', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220105', 'Soritor', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220106', 'Yantalo', '2201', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220201', 'Bellavista', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220202', 'Alto Biavo', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220203', 'Bajo Biavo', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220204', 'Huallaga', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220205', 'San Pablo', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220206', 'San Rafael', '2202', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220301', 'San José de Sisa', '2203', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220302', 'Agua Blanca', '2203', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220303', 'San Martín', '2203', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220304', 'Santa Rosa', '2203', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220305', 'Shatoja', '2203', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220401', 'Saposoa', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220402', 'Alto Saposoa', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220403', 'El Eslabón', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220404', 'Piscoyacu', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220405', 'Sacanche', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220406', 'Tingo de Saposoa', '2204', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220501', 'Lamas', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220502', 'Alonso de Alvarado', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220503', 'Barranquita', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220504', 'Caynarachi', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220505', 'Cuñumbuqui', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220506', 'Pinto Recodo', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220507', 'Rumisapa', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220508', 'San Roque de Cumbaza', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220509', 'Shanao', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220510', 'Tabalosos', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220511', 'Zapatero', '2205', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220601', 'Juanjuí', '2206', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220602', 'Campanilla', '2206', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220603', 'Huicungo', '2206', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220604', 'Pachiza', '2206', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220605', 'Pajarillo', '2206', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220701', 'Picota', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220702', 'Buenos Aires', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220703', 'Caspisapa', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220704', 'Pilluana', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220705', 'Pucacaca', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220706', 'San Cristóbal', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220707', 'San Hilarión', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220708', 'Shamboyacu', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220709', 'Tingo de Ponasa', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220710', 'Tres Unidos', '2207', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220801', 'Rioja', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220802', 'Awajun', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220803', 'Elías Soplin Vargas', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220804', 'Nueva Cajamarca', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220805', 'Pardo Miguel', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220806', 'Posic', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220807', 'San Fernando', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220808', 'Yorongos', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220809', 'Yuracyacu', '2208', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220901', 'Tarapoto', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220902', 'Alberto Leveau', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220903', 'Cacatachi', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220904', 'Chazuta', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220905', 'Chipurana', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220906', 'El Porvenir', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220907', 'Huimbayoc', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220908', 'Juan Guerra', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220909', 'La Banda de Shilcayo', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220910', 'Morales', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220911', 'Papaplaya', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220912', 'San Antonio', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220913', 'Sauce', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('220914', 'Shapaja', '2209', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('221001', 'Tocache', '2210', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('221002', 'Nuevo Progreso', '2210', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('221003', 'Polvora', '2210', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('221004', 'Shunte', '2210', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('221005', 'Uchiza', '2210', '22');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230101', 'Tacna', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230102', 'Alto de la Alianza', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230103', 'Calana', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230104', 'Ciudad Nueva', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230105', 'Inclan', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230106', 'Pachia', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230107', 'Palca', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230108', 'Pocollay', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230109', 'Sama', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230110', 'Coronel Gregorio Albarracín Lanchipa', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230111', 'La Yarada los Palos', '2301', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230201', 'Candarave', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230202', 'Cairani', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230203', 'Camilaca', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230204', 'Curibaya', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230205', 'Huanuara', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230206', 'Quilahuani', '2302', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230301', 'Locumba', '2303', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230302', 'Ilabaya', '2303', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230303', 'Ite', '2303', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230401', 'Tarata', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230402', 'Héroes Albarracín', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230403', 'Estique', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230404', 'Estique-Pampa', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230405', 'Sitajara', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230406', 'Susapaya', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230407', 'Tarucachi', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('230408', 'Ticaco', '2304', '23');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240101', 'Tumbes', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240102', 'Corrales', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240103', 'La Cruz', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240104', 'Pampas de Hospital', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240105', 'San Jacinto', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240106', 'San Juan de la Virgen', '2401', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240201', 'Zorritos', '2402', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240202', 'Casitas', '2402', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240203', 'Canoas de Punta Sal', '2402', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240301', 'Zarumilla', '2403', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240302', 'Aguas Verdes', '2403', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240303', 'Matapalo', '2403', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('240304', 'Papayal', '2403', '24');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250101', 'Calleria', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250102', 'Campoverde', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250103', 'Iparia', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250104', 'Masisea', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250105', 'Yarinacocha', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250106', 'Nueva Requena', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250107', 'Manantay', '2501', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250201', 'Raymondi', '2502', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250202', 'Sepahua', '2502', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250203', 'Tahuania', '2502', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250204', 'Yurua', '2502', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250301', 'Padre Abad', '2503', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250302', 'Irazola', '2503', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250303', 'Curimana', '2503', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250304', 'Neshuya', '2503', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250305', 'Alexander Von Humboldt', '2503', '25');
INSERT INTO `distrito` (`id_distrito`, `descripcion`, `id_provincia`, `id_departamento`) VALUES('250401', 'Purus', '2504', '25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_producto`
--

DROP TABLE IF EXISTS `entrada_producto`;
CREATE TABLE `entrada_producto` (
  `id_entrada` int(11) NOT NULL COMMENT 'Id de entrada',
  `id_proveedor` int(11) NOT NULL COMMENT 'Id proveedor',
  `id_producto` int(11) NOT NULL COMMENT 'Id producto',
  `cantidad` int(11) NOT NULL COMMENT 'cantidad del producto',
  `precio_unidad` varchar(20) NOT NULL COMMENT 'Precio de la entrada',
  `fecha_vencimiento` date NOT NULL COMMENT 'Fecha de vencimiento del producto',
  `factura` varchar(50) DEFAULT NULL COMMENT 'factura o boleta del producto',
  `id_usuario` int(11) NOT NULL COMMENT 'Id del usuario registro',
  `id_guia` int(11) NOT NULL COMMENT 'Id de guia de salida',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del producto',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Id estado del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DEL PRODUCTO';

--
-- Volcado de datos para la tabla `entrada_producto`
--

INSERT INTO `entrada_producto` (`id_entrada`, `id_proveedor`, `id_producto`, `cantidad`, `precio_unidad`, `fecha_vencimiento`, `factura`, `id_usuario`, `id_guia`, `fecha_registro`, `id_estado`) VALUES(1, 1, 1, 100, '8.50', '2024-06-24', 'B001 - 00001542', 1, 1, '2024-06-24 11:34:15', 1);
INSERT INTO `entrada_producto` (`id_entrada`, `id_proveedor`, `id_producto`, `cantidad`, `precio_unidad`, `fecha_vencimiento`, `factura`, `id_usuario`, `id_guia`, `fecha_registro`, `id_estado`) VALUES(2, 1, 2, 50, '12.90', '2024-08-16', 'B001 - 158206', 1, 2, '2024-06-26 12:28:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE ESTADOS';

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES(1, 'ACTIVO');
INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_factura`
--

DROP TABLE IF EXISTS `estado_factura`;
CREATE TABLE `estado_factura` (
  `id_estado_factura` int(11) NOT NULL COMMENT 'Id estado Factura',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion del estado de factura'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estado_factura`
--

INSERT INTO `estado_factura` (`id_estado_factura`, `descripcion`) VALUES(1, 'PENDIENTE DE PAGO');
INSERT INTO `estado_factura` (`id_estado_factura`, `descripcion`) VALUES(2, 'PAGADO');
INSERT INTO `estado_factura` (`id_estado_factura`, `descripcion`) VALUES(3, 'ANULADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_guia`
--

DROP TABLE IF EXISTS `estado_guia`;
CREATE TABLE `estado_guia` (
  `id_estado_guia` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `detalle` varchar(100) NOT NULL COMMENT 'Detalle del estado guia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE ESTADO GUIA';

--
-- Volcado de datos para la tabla `estado_guia`
--

INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(1, 'REGISTRADO', 'Registrado en el portal web');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(2, 'PREPARADO', 'Productos cargados en transportista');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(3, 'EN TRANSITO', 'En transito al destino');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(4, 'RECIBIDO', 'Recibido por el personal de entrega');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(5, 'ENTREGADO', 'Entregado al cliente');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(6, 'FACTURADO', 'Facturado por el usuario');
INSERT INTO `estado_guia` (`id_estado_guia`, `descripcion`, `detalle`) VALUES(7, 'CANCELADO', 'Cancelado por el cliente/usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_guia_transporte`
--

DROP TABLE IF EXISTS `estado_guia_transporte`;
CREATE TABLE `estado_guia_transporte` (
  `id_estado_guia_transporte` int(11) NOT NULL COMMENT 'Id estado guia de transporte',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE ESTADO GUIA TRANSPORTE';

--
-- Volcado de datos para la tabla `estado_guia_transporte`
--

INSERT INTO `estado_guia_transporte` (`id_estado_guia_transporte`, `descripcion`) VALUES(1, 'PENDIENTE DE PAGO');
INSERT INTO `estado_guia_transporte` (`id_estado_guia_transporte`, `descripcion`) VALUES(2, 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL COMMENT 'Id de la factura',
  `id_guia` int(11) NOT NULL COMMENT 'Id de la guia',
  `serie_factura` varchar(10) NOT NULL COMMENT 'Serie de la factura',
  `numero_factura` varchar(20) NOT NULL COMMENT 'Numero de la factura',
  `fecha_vencimiento` date NOT NULL COMMENT 'Fecha de vencimiento de la factura',
  `tipo_credito` varchar(50) NOT NULL COMMENT 'Tipo de credito de factura',
  `orden_servicio` varchar(50) DEFAULT NULL COMMENT 'Orden de servicio de la factura',
  `base_imponible` varchar(50) NOT NULL COMMENT 'Base imponible de la factura',
  `igv` varchar(50) NOT NULL COMMENT 'Igv de la factura',
  `subtotal` varchar(50) NOT NULL COMMENT 'Subtotal de la factura',
  `detraccion` varchar(50) NOT NULL COMMENT 'Detraccion del total de la factura',
  `total_cobrar` varchar(50) NOT NULL COMMENT 'Total a cobrar ',
  `id_estado_factura` int(11) NOT NULL DEFAULT 1 COMMENT 'Id estado de la factura',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la factura'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE FACTURA';

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_guia`, `serie_factura`, `numero_factura`, `fecha_vencimiento`, `tipo_credito`, `orden_servicio`, `base_imponible`, `igv`, `subtotal`, `detraccion`, `total_cobrar`, `id_estado_factura`, `fecha_registro`) VALUES(2, 1, 'F001', '00015402', '2024-06-24', 'CONTADO', '', '30677.97', '5522.03', '36200.00', '0.00', '36200.00', 2, '2024-06-24 12:12:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_deposito`
--

DROP TABLE IF EXISTS `factura_deposito`;
CREATE TABLE `factura_deposito` (
  `id_factura_deposito` int(11) NOT NULL COMMENT 'Id de factura deposito',
  `id_factura` int(11) NOT NULL COMMENT 'Id factura',
  `fecha_deposito` date NOT NULL COMMENT 'Fecha de deposito',
  `entidad_bancaria` varchar(20) NOT NULL COMMENT 'Entidad Bancaria',
  `forma_pago` varchar(100) NOT NULL COMMENT 'Forma de pago de deposito',
  `numero_centro` varchar(20) NOT NULL COMMENT 'Numero de centro',
  `numero_operacion` varchar(50) NOT NULL COMMENT 'Numero de operacion del deposito',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de deposito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE FACTURA DEPOSITO';

--
-- Volcado de datos para la tabla `factura_deposito`
--

INSERT INTO `factura_deposito` (`id_factura_deposito`, `id_factura`, `fecha_deposito`, `entidad_bancaria`, `forma_pago`, `numero_centro`, `numero_operacion`, `fecha_registro`) VALUES(2, 2, '2024-07-25', 'SCOTIABANK', 'DEPOSITO', '2100', '9155530', '2024-06-24 12:13:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia`
--

DROP TABLE IF EXISTS `guia`;
CREATE TABLE `guia` (
  `id_guia` int(11) NOT NULL COMMENT 'Id de factura',
  `serie_guia` varchar(10) NOT NULL COMMENT 'Serie de la guia',
  `numero_guia` varchar(20) NOT NULL COMMENT 'Numero de la guia',
  `codigo_cotizacion` varchar(50) NOT NULL COMMENT 'Codigo de la cotizacion',
  `fecha_emision` date NOT NULL COMMENT 'Fecha de emision',
  `id_cliente` int(11) NOT NULL COMMENT 'Id del cliente',
  `id_transportista` int(11) DEFAULT NULL COMMENT 'Id del personal transportista',
  `id_distrito_salida` varchar(10) NOT NULL COMMENT 'Id distrito salida',
  `direccion_salida` varchar(100) NOT NULL COMMENT 'Direccion salida',
  `id_distrito_llegada` varchar(10) NOT NULL COMMENT 'Id distrito llegada',
  `direccion_llegada` varchar(100) NOT NULL COMMENT 'Direccion llegada',
  `largo_guia` varchar(100) NOT NULL COMMENT 'Largo Guia',
  `ancho_guia` varchar(100) NOT NULL COMMENT 'Ancho Guia',
  `alto_guia` varchar(100) NOT NULL COMMENT 'Alto Guia',
  `costo_guia` varchar(100) NOT NULL COMMENT 'Costo Guia',
  `id_usuario` int(11) NOT NULL COMMENT 'Id personal de registro',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro',
  `id_estado_guia` int(11) NOT NULL DEFAULT 1 COMMENT 'Id estado guia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE GUIA DE REMISION';

--
-- Volcado de datos para la tabla `guia`
--

INSERT INTO `guia` (`id_guia`, `serie_guia`, `numero_guia`, `codigo_cotizacion`, `fecha_emision`, `id_cliente`, `id_transportista`, `id_distrito_salida`, `direccion_salida`, `id_distrito_llegada`, `direccion_llegada`, `largo_guia`, `ancho_guia`, `alto_guia`, `costo_guia`, `id_usuario`, `fecha_registro`, `id_estado_guia`) VALUES(1, '010', '00000154', 'COT. 15480', '2024-06-24', 1, 4, '150143', 'Av. Elias Aguire Mz. 11V Lt.2', '130102', 'AV EL PORVENIR 123', '', '', '', '', 1, '2024-06-24 11:43:14', 6);
INSERT INTO `guia` (`id_guia`, `serie_guia`, `numero_guia`, `codigo_cotizacion`, `fecha_emision`, `id_cliente`, `id_transportista`, `id_distrito_salida`, `direccion_salida`, `id_distrito_llegada`, `direccion_llegada`, `largo_guia`, `ancho_guia`, `alto_guia`, `costo_guia`, `id_usuario`, `fecha_registro`, `id_estado_guia`) VALUES(2, '001', '00154820', 'COT. 158420', '2024-06-29', 1, 0, '150143', 'Av. Elias Aguire Mz. 11V Lt.2', '130102', 'AV STA ROSA 101', '', '', '', '', 1, '2024-06-26 12:40:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_detalle`
--

DROP TABLE IF EXISTS `guia_detalle`;
CREATE TABLE `guia_detalle` (
  `id_guia_detalle` int(11) NOT NULL COMMENT 'Id Guia Detalle',
  `id_guia` int(11) NOT NULL COMMENT 'Id Guia',
  `descripcion` text NOT NULL COMMENT 'Detalle Producto',
  `cantidad` varchar(100) NOT NULL COMMENT 'Cantidad',
  `unidad` varchar(100) NOT NULL COMMENT 'Unidad',
  `peso` varchar(100) NOT NULL COMMENT 'Peso',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA GUIA DETALLE';

--
-- Volcado de datos para la tabla `guia_detalle`
--

INSERT INTO `guia_detalle` (`id_guia_detalle`, `id_guia`, `descripcion`, `cantidad`, `unidad`, `peso`, `fecha_registro`) VALUES(1, 0, '', '1', 'CAJA', '5 KGRS', '2024-06-24 11:35:12');
INSERT INTO `guia_detalle` (`id_guia_detalle`, `id_guia`, `descripcion`, `cantidad`, `unidad`, `peso`, `fecha_registro`) VALUES(2, 1, '100 ALHOCOL 90° mL ', '1', 'CAJA', '5 KGRS', '2024-06-24 11:39:10');
INSERT INTO `guia_detalle` (`id_guia_detalle`, `id_guia`, `descripcion`, `cantidad`, `unidad`, `peso`, `fecha_registro`) VALUES(4, 2, '50 JARABE unidad ', '1', 'CAJA', '5 KGRS', '2024-06-26 12:37:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_producto`
--

DROP TABLE IF EXISTS `guia_producto`;
CREATE TABLE `guia_producto` (
  `id_guia_producto` int(11) NOT NULL COMMENT 'Id de salida de producto',
  `id_guia_detalle` int(11) NOT NULL COMMENT 'Id guia detalle',
  `id_producto` int(11) NOT NULL COMMENT 'Id de producto',
  `cantidad` int(11) NOT NULL COMMENT 'Cantidad de productos de salida',
  `id_entrada` int(11) NOT NULL COMMENT 'Id de la compra de los productos',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la salida',
  `id_estado` int(11) NOT NULL COMMENT 'Id estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci COMMENT='TABLA DE SALIDA DE PRODUCTOS';

--
-- Volcado de datos para la tabla `guia_producto`
--

INSERT INTO `guia_producto` (`id_guia_producto`, `id_guia_detalle`, `id_producto`, `cantidad`, `id_entrada`, `fecha_registro`, `id_estado`) VALUES(2, 2, 1, 100, 1, '2024-06-24 11:42:10', 1);
INSERT INTO `guia_producto` (`id_guia_producto`, `id_guia_detalle`, `id_producto`, `cantidad`, `id_entrada`, `fecha_registro`, `id_estado`) VALUES(4, 4, 2, 50, 2, '2024-06-26 12:37:21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_transporte`
--

DROP TABLE IF EXISTS `guia_transporte`;
CREATE TABLE `guia_transporte` (
  `id_guia_transporte` int(11) NOT NULL COMMENT 'Id Guia de transporte',
  `id_guia` int(11) NOT NULL COMMENT 'Id guia ',
  `empresa` varchar(100) DEFAULT NULL COMMENT 'Nombre o Razon Social de la empresa de transporte',
  `ruc` varchar(100) DEFAULT NULL COMMENT 'Ruc de la empresa de transporte',
  `numero_guia` varchar(20) DEFAULT NULL COMMENT 'Numero Guia de transporte',
  `id_estado_guia_transporte` int(11) DEFAULT NULL COMMENT 'Id estado de guia d',
  `numero_factura` varchar(20) DEFAULT NULL COMMENT 'Factura de Transporte',
  `origen` varchar(100) DEFAULT NULL COMMENT 'Departamento Salida',
  `destino` varchar(100) DEFAULT NULL COMMENT 'Departamento Destino',
  `descripcion` text DEFAULT NULL COMMENT 'Descripcion de la factura',
  `cantidad_bulto` int(11) DEFAULT NULL COMMENT 'Cantidad de bultos facturados',
  `observaciones` text DEFAULT NULL COMMENT 'Observaciones del envio',
  `reparto` varchar(20) DEFAULT NULL COMMENT 'Envio incluye reparto S/N',
  `subtotal` varchar(20) DEFAULT NULL COMMENT 'Subtotal de factura',
  `igv` varchar(20) DEFAULT NULL COMMENT 'Igv del Total',
  `total` varchar(20) DEFAULT NULL COMMENT 'Total de factura',
  `fecha_despacho` date DEFAULT NULL COMMENT 'Fecha de despacho programado',
  `tipo_transporte` varchar(100) DEFAULT NULL COMMENT 'Tipo de transporte',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del transporte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE GUIA TRANSPORTE';

--
-- Volcado de datos para la tabla `guia_transporte`
--

INSERT INTO `guia_transporte` (`id_guia_transporte`, `id_guia`, `empresa`, `ruc`, `numero_guia`, `id_estado_guia_transporte`, `numero_factura`, `origen`, `destino`, `descripcion`, `cantidad_bulto`, `observaciones`, `reparto`, `subtotal`, `igv`, `total`, `fecha_despacho`, `tipo_transporte`, `fecha_registro`) VALUES(1, 1, 'ANTEZANA CARGO', '20606078189', '010 - 00009999', 2, 'F001 - 00008888', 'LIMA', 'TRUJILLO', '1 CAJA', 1, '', 'NO', '200000.00', '36000.00', '236000.00', '2024-06-24', 'TERRESTRE', '2024-06-24 11:56:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medida`
--

DROP TABLE IF EXISTS `medida`;
CREATE TABLE `medida` (
  `id_medida` int(11) NOT NULL COMMENT 'Id de la medida',
  `medida` varchar(100) NOT NULL COMMENT 'Nombre de la medida',
  `abreviatura` varchar(20) NOT NULL COMMENT 'Abreviatura de la medida',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la medida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Tabla de unidades de medidas';

--
-- Volcado de datos para la tabla `medida`
--

INSERT INTO `medida` (`id_medida`, `medida`, `abreviatura`, `fecha_registro`) VALUES(1, 'unidad', 'unidad', '2024-04-08 04:07:26');
INSERT INTO `medida` (`id_medida`, `medida`, `abreviatura`, `fecha_registro`) VALUES(2, 'gramo', 'g', '2024-04-08 04:07:26');
INSERT INTO `medida` (`id_medida`, `medida`, `abreviatura`, `fecha_registro`) VALUES(3, 'miligramo', 'mg', '2024-04-08 04:08:30');
INSERT INTO `medida` (`id_medida`, `medida`, `abreviatura`, `fecha_registro`) VALUES(4, 'litro', 'L', '2024-04-08 04:08:30');
INSERT INTO `medida` (`id_medida`, `medida`, `abreviatura`, `fecha_registro`) VALUES(5, 'mililitro', 'mL', '2024-04-08 04:08:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_credito`
--

DROP TABLE IF EXISTS `nota_credito`;
CREATE TABLE `nota_credito` (
  `id_nota_credito` int(11) NOT NULL COMMENT 'Id de nota de credito',
  `id_factura` int(11) NOT NULL COMMENT 'Id factura',
  `fecha_nota_credito` date NOT NULL COMMENT 'Fecha de la nota de credito',
  `serie_nota_credito` varchar(20) NOT NULL COMMENT 'Serie de la nota de credito',
  `numero_nota_credito` varchar(20) NOT NULL COMMENT 'Numero nota de credito',
  `base_imponible` varchar(50) NOT NULL COMMENT 'Base imponible de la nota de credito',
  `igv` varchar(50) NOT NULL COMMENT 'Igv de la nota de credito',
  `total` varchar(50) NOT NULL COMMENT 'Total de la nota de credito',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la nota de credito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE NOTA DE CREDITO';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL COMMENT 'Id del perfil',
  `perfil` varchar(20) NOT NULL COMMENT 'Nombre del perfil',
  `descripcion` varchar(50) NOT NULL COMMENT 'Descripcion del perfil',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado del perfil',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del perfil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Tabla de perfil del usuario';

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `perfil`, `descripcion`, `id_estado`, `fecha_registro`) VALUES(1, 'Administrador', 'Perfil del administrador del sistema', 1, '2023-11-30 04:56:12');
INSERT INTO `perfil` (`id_perfil`, `perfil`, `descripcion`, `id_estado`, `fecha_registro`) VALUES(2, 'Ejecutivo', 'Ejecutivo de ventas', 1, '2024-03-16 13:21:19');
INSERT INTO `perfil` (`id_perfil`, `perfil`, `descripcion`, `id_estado`, `fecha_registro`) VALUES(3, 'Mensajeria', 'Perfil de entrega', 1, '2024-03-16 13:21:19');
INSERT INTO `perfil` (`id_perfil`, `perfil`, `descripcion`, `id_estado`, `fecha_registro`) VALUES(4, 'Sin perfil', 'Usuario sin perfil', 1, '2024-03-17 00:20:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL COMMENT 'Id personal',
  `nombres` varchar(100) NOT NULL COMMENT 'Nombres del personal',
  `apellidos` varchar(100) NOT NULL COMMENT 'Apellidos del personal',
  `tipo_documento` int(11) NOT NULL COMMENT 'Tipo documento del personal',
  `numero_documento` varchar(20) NOT NULL COMMENT 'Numero documento del personal',
  `fecha_nacimiento` date NOT NULL COMMENT 'Fecha de nacimiento del personal',
  `correo` varchar(100) DEFAULT NULL COMMENT 'Correo del personal',
  `id_distrito` varchar(10) NOT NULL COMMENT 'Id distrito del personal',
  `direccion` varchar(100) NOT NULL COMMENT 'Direccion del personal',
  `telefono` varchar(20) DEFAULT NULL COMMENT 'Telefono del personal',
  `celular` varchar(20) DEFAULT NULL COMMENT 'Celular del personal',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del personal',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Id de estado del personal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DEL PERSONAL';

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombres`, `apellidos`, `tipo_documento`, `numero_documento`, `fecha_nacimiento`, `correo`, `id_distrito`, `direccion`, `telefono`, `celular`, `fecha_registro`, `id_estado`) VALUES(1, 'MIGUEL', 'RAMIREZ', 1, '78451245', '1978-03-01', 'miguel@gmail.com', '150116', 'Av Sta rosa de quilmes 102', NULL, NULL, '2024-03-17 00:55:22', 1);
INSERT INTO `personal` (`id_personal`, `nombres`, `apellidos`, `tipo_documento`, `numero_documento`, `fecha_nacimiento`, `correo`, `id_distrito`, `direccion`, `telefono`, `celular`, `fecha_registro`, `id_estado`) VALUES(4, 'JOSE ALBERTO', 'CACERES MENDIOLA', 1, '12121212', '1997-02-21', '', '130102', '', NULL, NULL, '2024-06-24 11:22:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL COMMENT 'Id del producto',
  `producto` varchar(100) NOT NULL COMMENT 'Nombre del producto',
  `descripcion` varchar(200) NOT NULL COMMENT 'Descripcion del producto',
  `precio_unidad` double(15,2) NOT NULL COMMENT 'Precio del producto',
  `id_medida` int(11) NOT NULL COMMENT 'Id de medida del producto por unidad',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del producto',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Id estado del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE PRODUCTOS';

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `producto`, `descripcion`, `precio_unidad`, `id_medida`, `fecha_registro`, `id_estado`) VALUES(1, 'ALHOCOL 90°', '450 ml/g', 9.90, 5, '2024-06-24 11:01:08', 1);
INSERT INTO `producto` (`id_producto`, `producto`, `descripcion`, `precio_unidad`, `id_medida`, `fecha_registro`, `id_estado`) VALUES(2, 'JARABE', '220 ml/g', 12.90, 1, '2024-06-24 11:28:46', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL COMMENT 'Id proveedor',
  `ruc` varchar(11) NOT NULL COMMENT 'Ruc del proveedor',
  `razon_social` varchar(100) NOT NULL COMMENT 'Razon social del proveedor',
  `correo` varchar(100) NOT NULL COMMENT 'Correo del proveedor',
  `telefono` varchar(20) NOT NULL COMMENT 'Telefono del proveedor',
  `celular` varchar(20) NOT NULL COMMENT 'Celular del proveedor',
  `direccion` varchar(100) NOT NULL COMMENT 'Direccion del proveedor',
  `id_distrito` varchar(10) NOT NULL COMMENT 'Id de distrito del proveedor',
  `nombre_contacto` varchar(100) DEFAULT NULL COMMENT 'Nombre del contacto del proveedor',
  `telefono_contacto` varchar(20) DEFAULT NULL COMMENT 'Telefono del contacto del proveedor',
  `celular_contacto` varchar(20) DEFAULT NULL COMMENT 'Celular del contacto del proveedor',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Id de estado del proveedor',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro del proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE PROVEEDORES';

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `ruc`, `razon_social`, `correo`, `telefono`, `celular`, `direccion`, `id_distrito`, `nombre_contacto`, `telefono_contacto`, `celular_contacto`, `id_estado`, `fecha_registro`) VALUES(1, '20100018540', 'ENTREGAS RAPIDAS SAC', 'entregas@rapidas.com.pe', '', '', 'Av. Prol. Javier Prado Este 8680, Ate 15494', '150103', NULL, NULL, NULL, 1, '2024-06-24 11:18:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `id_provincia` varchar(10) NOT NULL COMMENT 'Id de provincia',
  `descripcion` varchar(50) NOT NULL COMMENT 'Descripcion de la provincia',
  `id_departamento` varchar(10) NOT NULL COMMENT 'Id departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE PROVINCIA';

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0101', 'Chachapoyas', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0102', 'Bagua', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0103', 'Bongará', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0104', 'Condorcanqui', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0105', 'Luya', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0106', 'Rodríguez de Mendoza', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0107', 'Utcubamba', '01');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0201', 'Huaraz', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0202', 'Aija', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0203', 'Antonio Raymondi', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0204', 'Asunción', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0205', 'Bolognesi', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0206', 'Carhuaz', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0207', 'Carlos Fermín Fitzcarrald', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0208', 'Casma', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0209', 'Corongo', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0210', 'Huari', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0211', 'Huarmey', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0212', 'Huaylas', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0213', 'Mariscal Luzuriaga', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0214', 'Ocros', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0215', 'Pallasca', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0216', 'Pomabamba', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0217', 'Recuay', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0218', 'Santa', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0219', 'Sihuas', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0220', 'Yungay', '02');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0301', 'Abancay', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0302', 'Andahuaylas', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0303', 'Antabamba', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0304', 'Aymaraes', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0305', 'Cotabambas', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0306', 'Chincheros', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0307', 'Grau', '03');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0401', 'Arequipa', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0402', 'Camaná', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0403', 'Caravelí', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0404', 'Castilla', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0405', 'Caylloma', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0406', 'Condesuyos', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0407', 'Islay', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0408', 'La Uniòn', '04');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0501', 'Huamanga', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0502', 'Cangallo', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0503', 'Huanca Sancos', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0504', 'Huanta', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0505', 'La Mar', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0506', 'Lucanas', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0507', 'Parinacochas', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0508', 'Pàucar del Sara Sara', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0509', 'Sucre', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0510', 'Víctor Fajardo', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0511', 'Vilcas Huamán', '05');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0601', 'Cajamarca', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0602', 'Cajabamba', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0603', 'Celendín', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0604', 'Chota', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0605', 'Contumazá', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0606', 'Cutervo', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0607', 'Hualgayoc', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0608', 'Jaén', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0609', 'San Ignacio', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0610', 'San Marcos', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0611', 'San Miguel', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0612', 'San Pablo', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0613', 'Santa Cruz', '06');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0701', 'Prov. Const. del Callao', '07');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0801', 'Cusco', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0802', 'Acomayo', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0803', 'Anta', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0804', 'Calca', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0805', 'Canas', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0806', 'Canchis', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0807', 'Chumbivilcas', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0808', 'Espinar', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0809', 'La Convención', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0810', 'Paruro', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0811', 'Paucartambo', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0812', 'Quispicanchi', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0813', 'Urubamba', '08');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0901', 'Huancavelica', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0902', 'Acobamba', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0903', 'Angaraes', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0904', 'Castrovirreyna', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0905', 'Churcampa', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0906', 'Huaytará', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('0907', 'Tayacaja', '09');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1001', 'Huánuco', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1002', 'Ambo', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1003', 'Dos de Mayo', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1004', 'Huacaybamba', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1005', 'Huamalíes', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1006', 'Leoncio Prado', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1007', 'Marañón', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1008', 'Pachitea', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1009', 'Puerto Inca', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1010', 'Lauricocha ', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1011', 'Yarowilca ', '10');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1101', 'Ica ', '11');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1102', 'Chincha ', '11');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1103', 'Nasca ', '11');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1104', 'Palpa ', '11');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1105', 'Pisco ', '11');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1201', 'Huancayo ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1202', 'Concepción ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1203', 'Chanchamayo ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1204', 'Jauja ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1205', 'Junín ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1206', 'Satipo ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1207', 'Tarma ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1208', 'Yauli ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1209', 'Chupaca ', '12');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1301', 'Trujillo ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1302', 'Ascope ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1303', 'Bolívar ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1304', 'Chepén ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1305', 'Julcán ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1306', 'Otuzco ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1307', 'Pacasmayo ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1308', 'Pataz ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1309', 'Sánchez Carrión ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1310', 'Santiago de Chuco ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1311', 'Gran Chimú ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1312', 'Virú ', '13');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1401', 'Chiclayo ', '14');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1402', 'Ferreñafe ', '14');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1403', 'Lambayeque ', '14');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1501', 'Lima ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1502', 'Barranca ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1503', 'Cajatambo ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1504', 'Canta ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1505', 'Cañete ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1506', 'Huaral ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1507', 'Huarochirí ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1508', 'Huaura ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1509', 'Oyón ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1510', 'Yauyos ', '15');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1601', 'Maynas ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1602', 'Alto Amazonas ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1603', 'Loreto ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1604', 'Mariscal Ramón Castilla ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1605', 'Requena ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1606', 'Ucayali ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1607', 'Datem del Marañón ', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1608', 'Putumayo', '16');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1701', 'Tambopata ', '17');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1702', 'Manu ', '17');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1703', 'Tahuamanu ', '17');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1801', 'Mariscal Nieto ', '18');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1802', 'General Sánchez Cerro ', '18');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1803', 'Ilo ', '18');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1901', 'Pasco ', '19');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1902', 'Daniel Alcides Carrión ', '19');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('1903', 'Oxapampa ', '19');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2001', 'Piura ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2002', 'Ayabaca ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2003', 'Huancabamba ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2004', 'Morropón ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2005', 'Paita ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2006', 'Sullana ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2007', 'Talara ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2008', 'Sechura ', '20');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2101', 'Puno ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2102', 'Azángaro ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2103', 'Carabaya ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2104', 'Chucuito ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2105', 'El Collao ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2106', 'Huancané ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2107', 'Lampa ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2108', 'Melgar ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2109', 'Moho ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2110', 'San Antonio de Putina ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2111', 'San Román ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2112', 'Sandia ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2113', 'Yunguyo ', '21');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2201', 'Moyobamba ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2202', 'Bellavista ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2203', 'El Dorado ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2204', 'Huallaga ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2205', 'Lamas ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2206', 'Mariscal Cáceres ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2207', 'Picota ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2208', 'Rioja ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2209', 'San Martín ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2210', 'Tocache ', '22');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2301', 'Tacna ', '23');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2302', 'Candarave ', '23');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2303', 'Jorge Basadre ', '23');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2304', 'Tarata ', '23');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2401', 'Tumbes ', '24');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2402', 'Contralmirante Villar ', '24');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2403', 'Zarumilla ', '24');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2501', 'Coronel Portillo ', '25');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2502', 'Atalaya ', '25');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2503', 'Padre Abad ', '25');
INSERT INTO `provincia` (`id_provincia`, `descripcion`, `id_departamento`) VALUES('2504', 'Purús', '25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento_guia`
--

DROP TABLE IF EXISTS `seguimiento_guia`;
CREATE TABLE `seguimiento_guia` (
  `id_seguimiento_guia` int(11) NOT NULL COMMENT 'Id Seguimiento Guia',
  `id_guia` int(11) NOT NULL COMMENT 'Id Guia',
  `numero_guia` varchar(50) NOT NULL COMMENT 'Numero Guia',
  `actividad` text NOT NULL COMMENT 'Actividad Realizada por el usuario',
  `detalle` text DEFAULT NULL COMMENT 'Detalle de la guia',
  `id_usuario` int(11) NOT NULL COMMENT 'Id usuario personal',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de registro de la actividad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA SEGUIMIENTO GUIA';

--
-- Volcado de datos para la tabla `seguimiento_guia`
--

INSERT INTO `seguimiento_guia` (`id_seguimiento_guia`, `id_guia`, `numero_guia`, `actividad`, `detalle`, `id_usuario`, `fecha_registro`) VALUES(1, 1, '010 - 00000154', 'La guia se creó por el personal logueado', '-', 1, '2024-06-24 11:43:14');
INSERT INTO `seguimiento_guia` (`id_seguimiento_guia`, `id_guia`, `numero_guia`, `actividad`, `detalle`, `id_usuario`, `fecha_registro`) VALUES(2, 1, '010 - 00000154', 'Se actualizó el estado por el personal logueado', 'PREPARADO ← REGISTRADO', 1, '2024-06-24 11:56:20');
INSERT INTO `seguimiento_guia` (`id_seguimiento_guia`, `id_guia`, `numero_guia`, `actividad`, `detalle`, `id_usuario`, `fecha_registro`) VALUES(3, 1, '010 - 00000154', 'Se actualizó el estado por el personal logueado', 'FACTURADO ← PREPARADO', 1, '2024-06-24 11:59:54');
INSERT INTO `seguimiento_guia` (`id_seguimiento_guia`, `id_guia`, `numero_guia`, `actividad`, `detalle`, `id_usuario`, `fecha_registro`) VALUES(4, 2, '001 - 00154820', 'La guia se creó por el personal logueado', '-', 1, '2024-06-26 12:40:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `tipo_documento` int(11) NOT NULL COMMENT 'Id del tipo de documento',
  `descripcion` varchar(50) NOT NULL COMMENT 'Descripcion del tipo de documento',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Id del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE TIPOS DE DOCUMENTOS';

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tipo_documento`, `descripcion`, `id_estado`) VALUES(1, 'DNI', 1);
INSERT INTO `tipo_documento` (`tipo_documento`, `descripcion`, `id_estado`) VALUES(2, 'CE', 1);
INSERT INTO `tipo_documento` (`tipo_documento`, `descripcion`, `id_estado`) VALUES(3, 'PASAPORTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_personal` int(11) NOT NULL COMMENT 'Id personal',
  `usuario` varchar(30) NOT NULL COMMENT 'Usuario',
  `clave` varchar(50) NOT NULL COMMENT 'Clave del usuario',
  `id_perfil` int(11) NOT NULL COMMENT 'Id Perfil del personal',
  `id_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TABLA DE LOGIN DE USUARIO';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_personal`, `usuario`, `clave`, `id_perfil`, `id_estado`) VALUES(1, 'admin', '123456', 1, 1);
INSERT INTO `usuario` (`id_personal`, `usuario`, `clave`, `id_perfil`, `id_estado`) VALUES(4, 'jacaceres', '12121212', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id_acceso`),
  ADD KEY `FK_PERSONAL_ID_PERSONAL` (`id_personal`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `FK_CLIENTE_ESTADO` (`id_estado`),
  ADD KEY `FK_CLIENTE_TIPO_DOCUMENTO` (`tipo_documento`) USING BTREE,
  ADD KEY `FK_CLIENTE_DISTRITO` (`id_distrito`);

--
-- Indices de la tabla `configuracion_empresa`
--
ALTER TABLE `configuracion_empresa`
  ADD PRIMARY KEY (`ruc`) USING BTREE,
  ADD UNIQUE KEY `FK_DISTRITO_ID_DISTRITO` (`id_distrito`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_distrito`),
  ADD KEY `FK_DISTRITO_PROVINCIA` (`id_provincia`),
  ADD KEY `FK_DISTRITO_DEPARTAMENTO` (`id_departamento`);

--
-- Indices de la tabla `entrada_producto`
--
ALTER TABLE `entrada_producto`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `FK_PROVEEDOR_ID_PROVEEDOR` (`id_proveedor`),
  ADD KEY `FK_PRODUCTO_ID_PRODUCTO` (`id_producto`),
  ADD KEY `FK_PERSONAL_ID_USUARIO` (`id_usuario`),
  ADD KEY `FK_ESTADO_ID_ESTADO` (`id_estado`) USING BTREE;

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_factura`
--
ALTER TABLE `estado_factura`
  ADD PRIMARY KEY (`id_estado_factura`);

--
-- Indices de la tabla `estado_guia`
--
ALTER TABLE `estado_guia`
  ADD PRIMARY KEY (`id_estado_guia`);

--
-- Indices de la tabla `estado_guia_transporte`
--
ALTER TABLE `estado_guia_transporte`
  ADD PRIMARY KEY (`id_estado_guia_transporte`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `FK_ESTADO_FACTURA_ID_ESTADO_FACTURA` (`id_estado_factura`),
  ADD KEY `FK_GUIA_ID_GUIA` (`id_guia`);

--
-- Indices de la tabla `factura_deposito`
--
ALTER TABLE `factura_deposito`
  ADD PRIMARY KEY (`id_factura_deposito`),
  ADD KEY `FK_FACTURA_ID_FACTURA` (`id_factura`);

--
-- Indices de la tabla `guia`
--
ALTER TABLE `guia`
  ADD PRIMARY KEY (`id_guia`),
  ADD KEY `FK_ESTADO_GUIA_ID_ESTADO_GUIA` (`id_estado_guia`),
  ADD KEY `FK_CLIENTE_ID_CLIENTE` (`id_cliente`),
  ADD KEY `FK_DISTRITO_ID_DISTRITO_SALIDA` (`id_distrito_salida`),
  ADD KEY `FK_PERSONAL_ID_USUARIO` (`id_usuario`),
  ADD KEY `FK_DISTRITO_ID_DISTRITO_LLEGADA` (`id_distrito_llegada`) USING BTREE;

--
-- Indices de la tabla `guia_detalle`
--
ALTER TABLE `guia_detalle`
  ADD PRIMARY KEY (`id_guia_detalle`);

--
-- Indices de la tabla `guia_producto`
--
ALTER TABLE `guia_producto`
  ADD PRIMARY KEY (`id_guia_producto`),
  ADD KEY `FK_PRODUCTO_ID_PRODUCTO` (`id_producto`),
  ADD KEY `FK_ESTADO_ID_ESTADO` (`id_estado`),
  ADD KEY `FK_GUIA_DETALLE_ID_GUIA_DETALLE` (`id_guia_detalle`) USING BTREE,
  ADD KEY `FK_ENTRADA_PRODUCTO_ID_ENTRADA_PRODUCTO` (`id_entrada`);

--
-- Indices de la tabla `guia_transporte`
--
ALTER TABLE `guia_transporte`
  ADD PRIMARY KEY (`id_guia_transporte`),
  ADD KEY `FK_GUIA_ID_GUIA` (`id_guia`) USING BTREE,
  ADD KEY `FK_ESTADO_GUIA_TRANSPORTE_ID_ESTADO_GUIA_TRANSPORTE` (`id_estado_guia_transporte`);

--
-- Indices de la tabla `medida`
--
ALTER TABLE `medida`
  ADD PRIMARY KEY (`id_medida`);

--
-- Indices de la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  ADD PRIMARY KEY (`id_nota_credito`),
  ADD KEY `FK_FACTURA_ID_FACTURA` (`id_factura`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `FK_PERFIL_ESTADO` (`id_estado`) USING BTREE;

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `FK_PERSONAL_ESTADO` (`id_estado`) USING BTREE,
  ADD KEY `FK_PERSONAL_TIPO_DOCUMENTO` (`tipo_documento`),
  ADD KEY `FK_PERSONAL_DISTRITO` (`id_distrito`) USING BTREE;

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_MEDIDA_ID_MEDIDA` (`id_medida`),
  ADD KEY `FK_ESTADO_ID_ESTADO` (`id_estado`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `FK_PROVEEDOR_DISTRITO` (`id_distrito`),
  ADD KEY `FK_PROVEEDOR_ESTADO` (`id_estado`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `FK_PROVINCIA_DEPARTAMENTO` (`id_departamento`);

--
-- Indices de la tabla `seguimiento_guia`
--
ALTER TABLE `seguimiento_guia`
  ADD PRIMARY KEY (`id_seguimiento_guia`),
  ADD KEY `FK_PERSONAL_ID_USUARIO` (`id_usuario`),
  ADD KEY `FK_GUIA_ID_GUIA` (`id_guia`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipo_documento`),
  ADD KEY `FK_TIPO_DOCUMENTO_ESTADO` (`id_estado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD KEY `FK_USUARIO_PERFIL` (`id_perfil`),
  ADD KEY `FK_USUARIO_PERSONAL` (`id_personal`),
  ADD KEY `FK_USUARIO_ESTADO` (`id_estado`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id_acceso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de accesos', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id cliente', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrada_producto`
--
ALTER TABLE `entrada_producto`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de entrada', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_factura`
--
ALTER TABLE `estado_factura`
  MODIFY `id_estado_factura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id estado Factura', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_guia`
--
ALTER TABLE `estado_guia`
  MODIFY `id_estado_guia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estado_guia_transporte`
--
ALTER TABLE `estado_guia_transporte`
  MODIFY `id_estado_guia_transporte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id estado guia de transporte', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la factura', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura_deposito`
--
ALTER TABLE `factura_deposito`
  MODIFY `id_factura_deposito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de factura deposito', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `guia`
--
ALTER TABLE `guia`
  MODIFY `id_guia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de factura', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `guia_detalle`
--
ALTER TABLE `guia_detalle`
  MODIFY `id_guia_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Guia Detalle', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `guia_producto`
--
ALTER TABLE `guia_producto`
  MODIFY `id_guia_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de salida de producto', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `guia_transporte`
--
ALTER TABLE `guia_transporte`
  MODIFY `id_guia_transporte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Guia de transporte', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medida`
--
ALTER TABLE `medida`
  MODIFY `id_medida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la medida', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  MODIFY `id_nota_credito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de nota de credito';

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del perfil', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id personal', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del producto', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id proveedor', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seguimiento_guia`
--
ALTER TABLE `seguimiento_guia`
  MODIFY `id_seguimiento_guia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Seguimiento Guia', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tipo_documento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de documento', AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`tipo_documento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `configuracion_empresa`
--
ALTER TABLE `configuracion_empresa`
  ADD CONSTRAINT `configuracion_empresa_ibfk_1` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `distrito_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`) ON DELETE CASCADE;

--
-- Filtros para la tabla `entrada_producto`
--
ALTER TABLE `entrada_producto`
  ADD CONSTRAINT `entrada_producto_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrada_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrada_producto_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `personal` (`id_personal`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrada_producto_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia` (`id_guia`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_estado_factura`) REFERENCES `estado_factura` (`id_estado_factura`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `guia`
--
ALTER TABLE `guia`
  ADD CONSTRAINT `guia_ibfk_1` FOREIGN KEY (`id_estado_guia`) REFERENCES `estado_guia` (`id_estado_guia`) ON DELETE CASCADE,
  ADD CONSTRAINT `guia_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `guia_ibfk_4` FOREIGN KEY (`id_distrito_salida`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `guia_ibfk_5` FOREIGN KEY (`id_distrito_llegada`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `guia_ibfk_6` FOREIGN KEY (`id_usuario`) REFERENCES `personal` (`id_personal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guia_producto`
--
ALTER TABLE `guia_producto`
  ADD CONSTRAINT `guia_producto_ibfk_1` FOREIGN KEY (`id_guia_detalle`) REFERENCES `guia_detalle` (`id_guia_detalle`) ON UPDATE CASCADE,
  ADD CONSTRAINT `guia_producto_ibfk_2` FOREIGN KEY (`id_entrada`) REFERENCES `entrada_producto` (`id_entrada`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  ADD CONSTRAINT `nota_credito_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`tipo_documento`) ON DELETE CASCADE,
  ADD CONSTRAINT `personal_ibfk_3` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_medida`) REFERENCES `medida` (`id_medida`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE,
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `seguimiento_guia`
--
ALTER TABLE `seguimiento_guia`
  ADD CONSTRAINT `seguimiento_guia_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia` (`id_guia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD CONSTRAINT `tipo_documento_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
