-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2020 a las 23:37:45
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `candidato_experto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambito`
--

DROP TABLE IF EXISTS `ambito`;
CREATE TABLE IF NOT EXISTS `ambito` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ambito`
--

INSERT INTO `ambito` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Salud', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Educación', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Transporte', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Medio Ambiente', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Seguridad', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Trabajo', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ideologia_politica_id` int(20) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ideologia_politica_id_fk` (`ideologia_politica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`id`, `nombre`, `ideologia_politica_id`, `created_at`, `updated_at`) VALUES
(1, 'Hollman Morris', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Miguel Uribe', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Claudia Lopez', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Carlos Galan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato_candidatura`
--

DROP TABLE IF EXISTS `candidato_candidatura`;
CREATE TABLE IF NOT EXISTS `candidato_candidatura` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `candidato_id` int(20) NOT NULL,
  `candidatura_id` int(11) NOT NULL,
  `periodo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `candidato_candidatura_fk` (`candidato_id`),
  KEY `candidatura_cadidato_fk` (`candidatura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `candidato_candidatura`
--

INSERT INTO `candidato_candidatura` (`id`, `candidato_id`, `candidatura_id`, `periodo`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2020-2024', '2020-05-29 01:39:43', '2020-05-29 01:39:43'),
(2, 3, 1, '2020-2024', '2020-05-29 01:39:43', '2020-05-29 01:39:43'),
(3, 1, 1, '2020-2024', '2020-05-29 01:39:43', '2020-05-29 01:39:43'),
(4, 2, 1, '2020-2024', '2020-05-29 01:39:43', '2020-05-29 01:39:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura`
--

DROP TABLE IF EXISTS `candidatura`;
CREATE TABLE IF NOT EXISTS `candidatura` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `candidatura`
--

INSERT INTO `candidatura` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Elección Alcaldía de Bogotá', '2020-05-29 01:40:12', '2020-05-29 01:40:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Masculino', '2020-05-31 20:55:25', '2020-05-31 20:55:25'),
(2, 'Femenino', '2020-05-31 20:55:25', '2020-05-31 20:55:25'),
(3, 'Otro', '2020-05-31 20:55:25', '2020-05-31 20:55:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideologia_politica`
--

DROP TABLE IF EXISTS `ideologia_politica`;
CREATE TABLE IF NOT EXISTS `ideologia_politica` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ideologia_politica`
--

INSERT INTO `ideologia_politica` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Derecha', '2020-05-29 01:42:18', '2020-05-29 01:42:18'),
(2, 'Izquierda', '2020-05-29 01:42:18', '2020-05-29 01:42:18'),
(3, 'Centro', '2020-05-29 01:42:18', '2020-05-29 01:42:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_respuesta`
--

DROP TABLE IF EXISTS `opcion_respuesta`;
CREATE TABLE IF NOT EXISTS `opcion_respuesta` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(20) NOT NULL,
  `propuesta_id` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `opcion_regunta_propuesta` (`propuesta_id`),
  KEY `opcion_pregunta_pregunta` (`pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `opcion_respuesta`
--

INSERT INTO `opcion_respuesta` (`id`, `pregunta_id`, `propuesta_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(2, 1, 7, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(3, 1, 13, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(4, 1, 19, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(5, 2, 2, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(6, 2, 8, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(7, 2, 14, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(8, 2, 20, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(9, 3, 3, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(10, 3, 9, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(11, 3, 15, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(12, 3, 21, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(13, 4, 4, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(14, 4, 10, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(15, 4, 16, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(16, 4, 22, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(17, 5, 5, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(18, 5, 11, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(19, 5, 17, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(20, 5, 23, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(21, 6, 6, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(22, 6, 12, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(23, 6, 18, '2020-05-29 01:42:46', '2020-05-29 01:42:46'),
(24, 6, 24, '2020-05-29 01:42:46', '2020-05-29 01:42:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `genero_id` int(20) NOT NULL,
  `rango_edad_id` int(20) NOT NULL,
  `estrato_social` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `genero_persona_fk` (`genero_id`),
  KEY `rango_edad_persona_fk` (`rango_edad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `genero_id`, `rango_edad_id`, `estrato_social`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '3', '2020-06-08 03:11:47', '2020-06-08 03:11:47'),
(2, 1, 1, '4', '2020-06-08 04:05:29', '2020-06-08 04:05:29'),
(3, 1, 2, '3', '2020-06-08 04:13:42', '2020-06-08 04:13:42'),
(4, 1, 2, '4', '2020-06-08 04:21:09', '2020-06-08 04:21:09'),
(5, 2, 3, '1', '2020-06-08 04:23:55', '2020-06-08 04:23:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(1500) COLLATE utf8_spanish_ci NOT NULL,
  `ambito_id` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ambito_pregunta_fk` (`ambito_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `pregunta`, `ambito_id`, `created_at`, `updated_at`) VALUES
(1, '¿Qué considera usted, que podría mejorar el sistema de salud actual para la ciudad de Bogotá?  ', 1, '2020-05-29 01:44:31', '2020-05-29 01:44:31'),
(2, '¿Qué debe tener en cuenta para el futuro de la educación de los ciudadanos de Bogotá?', 2, '2020-05-29 01:44:31', '2020-05-29 01:44:31'),
(3, '¿Cuál es la prioridad que debe tener el futuro alcalde de Bogotá para el sistema de transporte público?', 3, '2020-05-29 01:44:31', '2020-05-29 01:44:31'),
(4, '¿Qué factor tiene prioridad para el medio ambiente de la ciudad de Bogotá?', 4, '2020-05-29 01:44:31', '2020-05-29 01:44:31'),
(5, '¿Cuál es la mejor opción para prestar un buen sistema de seguridad en la ciudad de Bogotá?', 5, '2020-05-29 01:44:31', '2020-05-29 01:44:31'),
(6, '¿Cuál consideraría usted, es la mejor opción para disminuir el desempleo en la ciudad de Bogotá?', 6, '2020-05-29 01:44:31', '2020-05-29 01:44:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuesta`
--

DROP TABLE IF EXISTS `propuesta`;
CREATE TABLE IF NOT EXISTS `propuesta` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `candidato_candidatura_id` int(20) NOT NULL,
  `ambito_id` int(20) NOT NULL,
  `enunciado_propuesta` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `propuesta_ambito_fk` (`ambito_id`),
  KEY `candidato_candidatura_propuesta_fk` (`candidato_candidatura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `propuesta`
--

INSERT INTO `propuesta` (`id`, `candidato_candidatura_id`, `ambito_id`, `enunciado_propuesta`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Fortalecer los hospitales públicos.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(2, 3, 2, 'creación de una ciudadela universitaria con capacidad para albergar a 50.000 estudiantes, quienes contarán con toda la dotación necesaria para desarrollar el conocimiento.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(3, 3, 3, 'construir cable de San Cristóbal, un segundo cable en ciudad Bolívar. Indicó la construcción del tren de cercanías.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(4, 3, 4, 'licitación para la renovación de la flota de Transmilenio.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(5, 3, 5, 'estructurar una mejor política de seguridad a través la inversión social, haciendo hincapié en la educación e intervención de sectores populares y mano dura contra el narcotráfico.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(6, 3, 6, 'apostar por sistemas férreos, así como la ciencia y la tecnología, aprovechado la fibra óptica que ofrece la ETB, como empresa pública.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(7, 1, 1, 'corregir las dificultades que se han presentado en el otorgamiento de citas y tratará el consumo de drogas bajo un enfoque de salud pública.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(8, 1, 2, 'Realizar con la primera infancia de cara a que haya un proceso permanente y articulada en la educación en todas sus fases, garantizando además una actualización constante.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(9, 1, 3, 'proponer la construcción de la troncal de Transmilenio en la avenida Boyacá, la avenida longitudinal de occidente respetando los humedales, la avenida circunvalar hasta la salida por Usme, y construir más cables aéreos.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(10, 1, 4, 'movilidad eléctrica para hacerle frente a la contaminación en la ciudad.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(11, 1, 5, 'contrarrestar el hurto a personas, apoyar a quienes denuncian y facilitando esa tarea; sumado a la prevención del delito y a un trabajo con los jóvenes para que no sean instrumentalizados a través del empleo y la educación.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(12, 1, 6, 'promover semilleros de emprendimiento desde las instituciones bajo un enfoque de ciencia e innovación, lo que contribuiría además a las industrias creativas (economía naranja).', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(13, 2, 1, 'Sanear las finanzas de los hospitales y entidades prestadoras de salud, en el cual se va a optimizar el servicio de salud para los ciudadanos, en frentes como la prevención y la atención oportuna.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(14, 2, 2, 'trabajo intensivo con la primera infancia y el impulso de la cultura ciudadana, también, la formación más articulada para mejorarlos resultados en las pruebas estatales, así como un trabajo mancomunado con los maestros y una educación superior ligada a la ciencia e innovación, todo con un enfoque de gratuidad y sin créditos.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(15, 2, 3, 'No construir Transmilenio por la séptima, y destinará ese dinero para llevar la primera línea del metro hasta Suba y Engativá. También, duplicar los viajes en bicicleta y fomentar la cultura ciudadana.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(16, 2, 4, 'renovación de la flota de Transmilenio privilegió el diésel por encima de otras tecnologías proteger las reservas y desincentivar el uso del carro particular, impulsando en su lugar a las bicicletas y trayectos a pie.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(17, 2, 5, 'reducir la violencia contra la mujer, y a capturar a abusadores, sumado a una judicialización efectiva y contar con información más precisa para predecir actividades delictivas.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(18, 2, 6, 'atraer empresarios y promover el emprendimiento, eso sí, garantizando condiciones de seguridad ciudadana y educación gratuita para la inversión.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(19, 4, 1, 'Construcción de hospitales en las localidades de Bosa y Usme, la reforma del hospital San Juan de Dios.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(20, 4, 2, 'hacer mejores colegios, y en paralelo seguir combatiendo el embarazo infantil e impulsar la jornada nocturna de la mano del Sena.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(21, 4, 3, 'el transporte público como columna vertebral de la movilidad, y dejar de lado el debate entre el transporte actual y la nueva línea del metro, donde garantiza que se hará la segunda línea.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(22, 4, 4, 'sembrar alrededor de un millón de árboles en su administración, 400.000 de ellos en zonas como los cerros orientales. Impulsar huertas urbanas, lo que le daría un empujón al emprendimiento y el desarrollo económico.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(23, 4, 5, 'Redoblar esfuerzos para atacar a quienes se dedican a la reventa de celulares y bicicletas, sumado a un trabajo más robusto en inteligencia e investigación criminal para lograr una efectiva judicialización. se comprometió a traer 3.000 nuevos uniformados a quienes el Distrito les va a pagar, sumado al impulso de frentes de seguridad comunitarios.', '2020-05-29 01:44:54', '2020-05-29 01:44:54'),
(24, 4, 6, 'promoverá la construcción de la tercera pista del aeropuerto El Dorado, a lo que se sumaría un impulso decidido al turismo en la capital y la construcción de vivienda.', '2020-05-29 01:44:54', '2020-05-29 01:44:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango_edad`
--

DROP TABLE IF EXISTS `rango_edad`;
CREATE TABLE IF NOT EXISTS `rango_edad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rango_edad`
--

INSERT INTO `rango_edad` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '18 - 24', '2020-05-31 20:54:56', '2020-05-31 20:54:56'),
(2, '25 - 35', '2020-05-31 20:54:56', '2020-05-31 20:54:56'),
(3, '36 - 45', '2020-05-31 20:54:56', '2020-05-31 20:54:56'),
(4, '46 - 60', '2020-05-31 20:54:56', '2020-05-31 20:54:56'),
(5, 'mayor a 60', '2020-05-31 20:54:56', '2020-05-31 20:54:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE IF NOT EXISTS `respuesta` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) NOT NULL,
  `opcion_respuesta_id` int(20) NOT NULL,
  `toma` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `respuesta_persona_id` (`persona_id`),
  KEY `respuesta_opcion_pregunta` (`opcion_respuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `persona_id`, `opcion_respuesta_id`, `toma`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(2, 1, 5, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(3, 1, 12, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(4, 1, 15, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(5, 1, 17, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(6, 1, 24, 1, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(7, 2, 4, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(8, 2, 5, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(9, 2, 10, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(10, 2, 16, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(11, 2, 17, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(12, 2, 24, 1, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(13, 3, 2, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(14, 3, 7, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(15, 3, 9, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(16, 3, 14, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(17, 3, 18, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(18, 3, 22, 1, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(19, 4, 2, 1, '2020-06-08 04:22:44', '2020-06-08 04:22:44'),
(20, 4, 5, 1, '2020-06-08 04:22:44', '2020-06-08 04:22:44'),
(21, 4, 10, 1, '2020-06-08 04:22:44', '2020-06-08 04:22:44'),
(22, 4, 14, 1, '2020-06-08 04:22:44', '2020-06-08 04:22:44'),
(23, 4, 17, 1, '2020-06-08 04:22:44', '2020-06-08 04:22:44'),
(24, 4, 22, 1, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(25, 5, 3, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(26, 5, 5, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(27, 5, 9, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(28, 5, 16, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(29, 5, 18, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(30, 5, 22, 1, '2020-06-08 04:24:28', '2020-06-08 04:24:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_toma`
--

DROP TABLE IF EXISTS `resultado_toma`;
CREATE TABLE IF NOT EXISTS `resultado_toma` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) NOT NULL,
  `candidato_candidatura_id` int(20) NOT NULL,
  `porcentaje` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `resultado_toma_persona_fk` (`persona_id`),
  KEY `resultado_toma_candidato_candidatura_fk` (`candidato_candidatura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `resultado_toma`
--

INSERT INTO `resultado_toma` (`id`, `persona_id`, `candidato_candidatura_id`, `porcentaje`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 33, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(2, 1, 4, 33, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(3, 1, 2, 17, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(4, 1, 1, 17, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(5, 1, 3, 33, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(6, 1, 4, 33, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(7, 1, 2, 17, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(8, 1, 1, 17, '2020-06-08 03:24:49', '2020-06-08 03:24:49'),
(9, 2, 3, 33, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(10, 2, 4, 42, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(11, 2, 2, 8, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(12, 2, 1, 17, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(13, 2, 3, 33, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(14, 2, 4, 42, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(15, 2, 2, 8, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(16, 2, 1, 17, '2020-06-08 04:12:52', '2020-06-08 04:12:52'),
(17, 3, 3, 28, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(18, 3, 4, 28, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(19, 3, 2, 11, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(20, 3, 1, 33, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(21, 3, 3, 28, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(22, 3, 4, 28, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(23, 3, 2, 11, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(24, 3, 1, 33, '2020-06-08 04:15:31', '2020-06-08 04:15:31'),
(25, 4, 3, 29, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(26, 4, 4, 21, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(27, 4, 2, 8, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(28, 4, 1, 42, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(29, 4, 3, 29, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(30, 4, 4, 21, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(31, 4, 2, 8, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(32, 4, 1, 42, '2020-06-08 04:22:45', '2020-06-08 04:22:45'),
(33, 5, 3, 30, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(34, 5, 4, 20, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(35, 5, 2, 10, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(36, 5, 1, 40, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(37, 5, 3, 30, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(38, 5, 4, 20, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(39, 5, 2, 10, '2020-06-08 04:24:28', '2020-06-08 04:24:28'),
(40, 5, 1, 40, '2020-06-08 04:24:28', '2020-06-08 04:24:28');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `ideologia_politica_id_fk` FOREIGN KEY (`ideologia_politica_id`) REFERENCES `ideologia_politica` (`id`);

--
-- Filtros para la tabla `candidato_candidatura`
--
ALTER TABLE `candidato_candidatura`
  ADD CONSTRAINT `candidato_candidatura_fk` FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `candidatura_cadidato_fk` FOREIGN KEY (`candidatura_id`) REFERENCES `candidatura` (`id`);

--
-- Filtros para la tabla `opcion_respuesta`
--
ALTER TABLE `opcion_respuesta`
  ADD CONSTRAINT `opcion_pregunta_pregunta` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  ADD CONSTRAINT `opcion_regunta_propuesta` FOREIGN KEY (`propuesta_id`) REFERENCES `propuesta` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `genero_persona_fk` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `rango_edad_persona_fk` FOREIGN KEY (`rango_edad_id`) REFERENCES `rango_edad` (`id`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `ambito_pregunta_fk` FOREIGN KEY (`ambito_id`) REFERENCES `ambito` (`id`);

--
-- Filtros para la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD CONSTRAINT `candidato_candidatura_propuesta_fk` FOREIGN KEY (`candidato_candidatura_id`) REFERENCES `candidato_candidatura` (`id`),
  ADD CONSTRAINT `propuesta_ambito_fk` FOREIGN KEY (`ambito_id`) REFERENCES `ambito` (`id`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_opcion_pregunta` FOREIGN KEY (`opcion_respuesta_id`) REFERENCES `opcion_respuesta` (`id`),
  ADD CONSTRAINT `respuesta_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `resultado_toma`
--
ALTER TABLE `resultado_toma`
  ADD CONSTRAINT `resultado_toma_candidato_candidatura_fk` FOREIGN KEY (`candidato_candidatura_id`) REFERENCES `candidato_candidatura` (`id`),
  ADD CONSTRAINT `resultado_toma_persona_fk` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
