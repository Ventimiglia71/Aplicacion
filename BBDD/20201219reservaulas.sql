-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2020 a las 12:51:23
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservaulas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `cod_aula` int(11) NOT NULL,
  `nombre_aula` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `num_aula` int(2) NOT NULL,
  `num_puestos` int(2) NOT NULL,
  `cod_tipord` int(11) NOT NULL,
  `cod_equipo` int(11) NOT NULL,
  `cod_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientos`
--

CREATE TABLE `equipamientos` (
  `cod_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenadores`
--

CREATE TABLE `ordenadores` (
  `cod_ordenador` int(11) NOT NULL,
  `cod_tipord` int(11) NOT NULL,
  `tamano_pant` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cpu` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `ram` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `cod_reserva` int(11) NOT NULL,
  `anyo` int(4) NOT NULL,
  `mes` int(2) NOT NULL,
  `dia` int(2) NOT NULL,
  `cod_aula` int(11) NOT NULL,
  `usuario` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `horaIni` int(2) NOT NULL,
  `horaFin` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `cod_sede` int(11) NOT NULL,
  `nombre_sede` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `num_aulas` int(2) NOT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`cod_sede`, `nombre_sede`, `direccion`, `num_aulas`, `telefono`) VALUES
(1, 'Maldonado', 'C/Maldonado, 11', 12, '913253268'),
(2, 'Povedilla', 'C/Povedilla, 7', 8, '913758598');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposordenador`
--

CREATE TABLE `tiposordenador` (
  `cod_tipord` int(11) NOT NULL,
  `tipo` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`cod_aula`),
  ADD KEY `aulaEquip` (`cod_equipo`),
  ADD KEY `aulaSede` (`cod_sede`),
  ADD KEY `aulaCod_tipord` (`cod_tipord`);

--
-- Indices de la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  ADD PRIMARY KEY (`cod_equipo`);

--
-- Indices de la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  ADD PRIMARY KEY (`cod_ordenador`),
  ADD KEY `ordenadoresTiposordenador` (`cod_tipord`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`cod_reserva`),
  ADD KEY `reservasAulas` (`cod_aula`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`cod_sede`);

--
-- Indices de la tabla `tiposordenador`
--
ALTER TABLE `tiposordenador`
  ADD PRIMARY KEY (`cod_tipord`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `cod_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  MODIFY `cod_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  MODIFY `cod_ordenador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `cod_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tiposordenador`
--
ALTER TABLE `tiposordenador`
  MODIFY `cod_tipord` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_2` FOREIGN KEY (`cod_sede`) REFERENCES `sedes` (`cod_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `aulas_ibfk_3` FOREIGN KEY (`cod_tipord`) REFERENCES `tiposordenador` (`cod_tipord`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `aulas_ibfk_4` FOREIGN KEY (`cod_equipo`) REFERENCES `equipamientos` (`cod_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  ADD CONSTRAINT `ordenadores_ibfk_1` FOREIGN KEY (`cod_tipord`) REFERENCES `tiposordenador` (`cod_tipord`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cod_aula`) REFERENCES `aulas` (`cod_aula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;