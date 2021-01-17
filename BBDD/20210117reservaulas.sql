-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2021 a las 10:57:22
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

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`cod_aula`, `nombre_aula`, `num_aula`, `num_puestos`, `cod_tipord`, `cod_equipo`, `cod_sede`) VALUES
(3, 'Berlín', 1, 8, 2, 2, 1),
(4, 'Londres', 2, 12, 1, 0, 1),
(5, 'Asia', 1, 16, 1, 1, 2),
(6, 'Europa', 2, 20, 1, 0, 2),
(7, 'América', 3, 6, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `id` bigint(20) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`id`, `authority`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_ADMIN', 2),
(3, 'ROLE_USER', 2),
(6, 'ROLE_ADMIN', 3),
(5, 'ROLE_USER', 3),
(18, 'ROLE_ADMIN', 12),
(17, 'ROLE_USER', 12),
(24, 'ROLE_ADMIN', 16),
(23, 'ROLE_USER', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientos`
--

CREATE TABLE `equipamientos` (
  `cod_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `equipamientos`
--

INSERT INTO `equipamientos` (`cod_equipo`, `nombre_equipo`, `descripcion`) VALUES
(1, 'Retroproyector', 'para ver la pantalla del pc en la pared'),
(2, 'Cine', 'Para emitir videos necesarios');

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

--
-- Volcado de datos para la tabla `ordenadores`
--

INSERT INTO `ordenadores` (`cod_ordenador`, `cod_tipord`, `tamano_pant`, `cpu`, `ram`) VALUES
(1, 1, '29', '1Gb', '16Mb'),
(2, 1, '32', '2Tb', '32Gb'),
(3, 1, '52', 'I7', '16Gb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `cod_reserva` int(11) NOT NULL,
  `usuario` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cod_aula` int(11) NOT NULL,
  `anyo` int(4) NOT NULL,
  `mes` int(2) NOT NULL,
  `dia` int(2) NOT NULL,
  `hora` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`cod_reserva`, `usuario`, `cod_aula`, `anyo`, `mes`, `dia`, `hora`) VALUES
(2624, 'albertorpon@gmail.com', 3, 2021, 1, 28, 9),
(2625, 'albertorpon@gmail.com', 3, 2021, 1, 29, 9),
(2626, 'albertorpon@gmail.com', 3, 2021, 1, 30, 9),
(2627, 'albertorpon@gmail.com', 3, 2021, 2, 1, 9),
(2628, 'albertorpon@gmail.com', 3, 2021, 2, 2, 9),
(2629, 'albertorpon@gmail.com', 3, 2021, 2, 3, 9),
(2630, 'albertorpon@gmail.com', 3, 2021, 2, 4, 9),
(2631, 'albertorpon@gmail.com', 3, 2021, 2, 5, 9),
(2632, 'albertorpon@gmail.com', 3, 2021, 2, 6, 9),
(2633, 'albertorpon@gmail.com', 3, 2021, 2, 8, 9),
(2634, 'albertorpon@gmail.com', 3, 2021, 2, 9, 9),
(2635, 'albertorpon@gmail.com', 3, 2021, 2, 10, 9),
(2636, 'albertorpon@gmail.com', 3, 2021, 2, 11, 9),
(2637, 'albertorpon@gmail.com', 3, 2021, 2, 12, 9),
(2638, 'albertorpon@gmail.com', 3, 2021, 2, 13, 9),
(2639, 'albertorpon@gmail.com', 3, 2021, 2, 15, 9),
(2640, 'albertorpon@gmail.com', 3, 2021, 2, 16, 9),
(2641, 'albertorpon@gmail.com', 3, 2021, 2, 17, 9),
(2642, 'albertorpon@gmail.com', 3, 2021, 2, 18, 9),
(2643, 'albertorpon@gmail.com', 3, 2021, 2, 19, 9),
(2644, 'albertorpon@gmail.com', 3, 2021, 2, 20, 9),
(2645, 'albertorpon@gmail.com', 3, 2021, 2, 22, 9),
(2646, 'albertorpon@gmail.com', 3, 2021, 2, 23, 9),
(2647, 'albertorpon@gmail.com', 3, 2021, 2, 24, 9),
(2648, 'albertorpon@gmail.com', 3, 2021, 2, 25, 9),
(2649, 'albertorpon@gmail.com', 3, 2021, 2, 26, 9),
(2650, 'albertorpon@gmail.com', 3, 2021, 2, 27, 9),
(2651, 'albertorpon@gmail.com', 3, 2021, 3, 1, 9),
(2652, 'albertorpon@gmail.com', 3, 2021, 3, 2, 9),
(2653, 'albertorpon@gmail.com', 3, 2021, 3, 3, 9),
(2654, 'albertorpon@gmail.com', 3, 2021, 3, 4, 9),
(2655, 'albertorpon@gmail.com', 3, 2021, 3, 5, 9),
(2656, 'albertorpon@gmail.com', 3, 2021, 3, 6, 9),
(2657, 'albertorpon@gmail.com', 3, 2021, 3, 8, 9),
(2658, 'albertorpon@gmail.com', 3, 2021, 3, 9, 9),
(2659, 'albertorpon@gmail.com', 3, 2021, 3, 10, 9),
(2660, 'albertorpon@gmail.com', 3, 2021, 3, 11, 9),
(2661, 'albertorpon@gmail.com', 3, 2021, 1, 15, 9);

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
(2, 'Povedilla', 'C/Povedilla, 7', 8, '913758598'),
(3, 'periquita', 'calle sin vistas s/n', 6, '1321654324');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposordenador`
--

CREATE TABLE `tiposordenador` (
  `cod_tipord` int(11) NOT NULL,
  `tipo` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tiposordenador`
--

INSERT INTO `tiposordenador` (`cod_tipord`, `tipo`) VALUES
(1, 'WINDOWS'),
(2, 'MAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `enabled`, `password`, `username`) VALUES
(1, b'1', '$2a$10$Rt42bYoWzH/Q7SQ.GmkxR.kfsiWeqd89.muL5Cuvu8vWDGBO.lJ0m', 'user'),
(2, b'1', '$2a$10$U0Z69VDEiMUs7O3wi7Y5CuyBv5jKqcXOqfpx3G6d8tKTjCgmfRe.y', 'admin'),
(3, b'1', '$2a$10$uEcq4s6fJnTkbQF3Ow8OKeq1q0ZJ.Gje4KXBKd58NVrtXB507IMW2', 'arturorc02'),
(12, b'1', '$2a$10$DKwCtGDlqbig6xUEA5t8MuYc47kb6rL3PmAu8loI5yYjQUUPZLa/m', 'arturorc04'),
(16, b'1', '$2a$10$H5g1FqzPyApr4AOEaf0Ro.h/Cl2e/2CzDgg5cZLVksC5UcE45fu/y', 'pepe01');

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
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKrimuuii4fm3j9qt8uupyiy8nd` (`user_id`,`authority`);

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
  ADD KEY `reservasAulas` (`cod_aula`),
  ADD KEY `fecha` (`anyo`,`mes`,`dia`);

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
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `cod_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  MODIFY `cod_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  MODIFY `cod_ordenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2662;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `cod_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tiposordenador`
--
ALTER TABLE `tiposordenador`
  MODIFY `cod_tipord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cod_aula`) REFERENCES `aulas` (`cod_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
