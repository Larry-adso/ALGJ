-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 18:01:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nomina_algj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aux_trasporte`
--

CREATE TABLE `aux_trasporte` (
  `ID` int(11) NOT NULL,
  `Valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deducciones`
--

CREATE TABLE `deducciones` (
  `ID_DEDUCCION` int(11) DEFAULT NULL,
  `MES_DECUCCION` datetime DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PRESTAMO` int(11) DEFAULT NULL,
  `ID_SALUD` int(11) DEFAULT NULL,
  `ID_PERMISO` int(11) DEFAULT NULL,
  `ID_PENSION` int(11) DEFAULT NULL,
  `TOTAL_DEDUCCION` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `NIT` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ID_Licencia` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`NIT`, `Nombre`, `ID_Licencia`, `Correo`, `password`, `Telefono`) VALUES
(1105462834, 'bricont', 23, 'bjulian1605@gmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', '3023004176'),
(1109000123, 'Angie', 20, 'garcialarry575@gmail.com', 'c0225bde4916276b2058e16c4a00e27557c65472e318e0746523c71b85288ef87a424f9c88dcccbdde9755615327e365aa90f60c813b4d2997306a9cfab168d6', '1234512345'),
(1109000587, 'Celcia', 19, 'celcia@gmail.com', 'e80882fd014ff1966b64e1496e6b760b046fe08e4b5d1927d0d7d93de01176da3fafd4c9c0f6914a84eac23bfdcbb591237fdb5ed4b639ffb9e94ea8d69483da', '1213121432'),
(1234567890, 'Empusrovira', 22, 'empusroviraa@gmail.com', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', '1213121432');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID_Es` int(10) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID_Es`, `Estado`) VALUES
(1, 'Activa'),
(2, 'Inactiva'),
(3, 'Disponible'),
(4, 'En proceso'),
(5, 'Aprobado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inducciones`
--

CREATE TABLE `inducciones` (
  `ID_INDUCCION` int(11) DEFAULT NULL,
  `MES_INDUCCION` datetime DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_VALOR_HORA_EXTRA` int(11) DEFAULT NULL,
  `HORAS_EXTRAS` int(11) DEFAULT NULL,
  `TOTAL_INDUCCION` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia`
--

CREATE TABLE `licencia` (
  `ID` int(10) NOT NULL,
  `Serial` varchar(100) NOT NULL,
  `ID_Estado` int(11) NOT NULL,
  `F_inicio` datetime DEFAULT NULL,
  `F_fin` datetime DEFAULT NULL,
  `TP_licencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `licencia`
--

INSERT INTO `licencia` (`ID`, `Serial`, `ID_Estado`, `F_inicio`, `F_fin`, `TP_licencia`) VALUES
(19, 'rWEYZzCD1iC51Y5iH5wpBC0AN', 1, '2024-03-01 05:43:07', '2024-09-01 05:43:07', 1213),
(20, 'uBV7Pv34xAZ2119Q4CV75W4oh', 1, '2024-03-01 06:01:03', '2025-03-01 06:01:03', 1214),
(21, 'NvflKohOMVeHrcT1BgbMBlKi5', 3, NULL, NULL, 1213),
(22, 'gTK5Bc1aGnKOEBHGjy5D2FbpL', 2, NULL, NULL, 1213),
(23, 'AoJaAti6lPvFtFHisoavjODiS', 1, '2024-03-01 14:26:29', '2025-03-01 14:26:29', 1214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `ID` int(11) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `ID_deducion` int(11) NOT NULL,
  `Id_induccion` int(11) NOT NULL,
  `ID_aux_Trasporte` int(111) NOT NULL,
  `Valor_Pagar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pension`
--

CREATE TABLE `pension` (
  `ID` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_reingreso` datetime NOT NULL,
  `id_us` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID_prest` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Cantidad_cuotas` int(11) NOT NULL,
  `Valor_Cuotas` decimal(10,2) NOT NULL,
  `cuotas_en_deuda` int(11) DEFAULT NULL,
  `cuotas_pagas` int(11) DEFAULT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  `ESTADO_SOLICITUD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID_prest`, `ID_Empleado`, `Fecha`, `Cantidad_cuotas`, `Valor_Cuotas`, `cuotas_en_deuda`, `cuotas_pagas`, `VALOR`, `ESTADO_SOLICITUD`) VALUES
(6, 1007428013, '2024-02-28 13:46:00', 2, 245000.00, NULL, NULL, 490000.00, '4'),
(33, 1109000587, '2024-02-29 17:36:00', 1, 97769.67, 0, 0, 293309.00, '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `ID` int(11) NOT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`ID`, `cargo`, `salario`) VALUES
(4, 'DEV_', 3.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `TP_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID`, `TP_user`) VALUES
(1, 'empleado'),
(4, 'DEV'),
(5, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `ID` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_licencia`
--

CREATE TABLE `tp_licencia` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tp_licencia`
--

INSERT INTO `tp_licencia` (`ID`, `Tipo`) VALUES
(1213, '6 meses'),
(1214, '12 meses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `triggers`
--

CREATE TABLE `triggers` (
  `ID_Triggers` int(11) NOT NULL,
  `id_us` int(11) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `triggers`
--

INSERT INTO `triggers` (`ID_Triggers`, `id_us`, `pass`, `Fecha`) VALUES
(1, 8848484, '12345', '2024-02-29 19:58:59'),
(3, 1234567890, '3rt3l', '2024-02-29 20:15:45'),
(4, 1234567890, 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', '2024-02-29 21:23:45'),
(5, 1234567890, 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', '2024-02-29 22:09:06'),
(6, 1234567890, 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', '2024-02-29 22:15:24'),
(7, 1234567890, 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', '2024-02-29 22:18:18'),
(8, 1234567890, 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', '2024-02-29 22:18:52');

--
-- Disparadores `triggers`
--
DELIMITER $$
CREATE TRIGGER `password_triggers` AFTER UPDATE ON `triggers` FOR EACH ROW INSERT INTO triggers (id_us, pass, Fecha)VALUES (NEW.id_us, OLD.pass, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_us` int(11) NOT NULL,
  `nombre_us` varchar(50) NOT NULL,
  `apellido_us` varchar(50) NOT NULL,
  `correo_us` varchar(50) NOT NULL,
  `tel_us` varchar(15) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `foto` blob DEFAULT NULL,
  `id_puesto` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `Codigo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_us`, `nombre_us`, `apellido_us`, `correo_us`, `tel_us`, `pass`, `foto`, `id_puesto`, `id_rol`, `Codigo`) VALUES
(1007428013, 'angie', 'leyva', 'gutierrezangietatiana@gmail.com', '3023004176', '23b4a7bdd3406aaaf459dc07013264c2f16f73cdcc2ff92b423622db61dbde95c11eb1ec9d04a068f7f55d8021be9ba79d391abf6b4105e83c8df6114280cf59', 0x63756576612e6a706567, 4, 4, 1111),
(1105462834, 'brian', 'avila', 'bjulian1605@gmail.com', '3023004176', '847de8c4f25ed04fa015085fa9b8672141114ea078d1e2e68b3d0f559e90f62f886eab59872d58d5de3f1dbb142a03460ad39449fdfbcf3c77d4424030d1f8d9', 0x63756576612e6a706567, 4, 5, 1105462834);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `v_h_extra`
--

CREATE TABLE `v_h_extra` (
  `ID` int(11) NOT NULL,
  `V_H_extra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aux_trasporte`
--
ALTER TABLE `aux_trasporte`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `deducciones`
--
ALTER TABLE `deducciones`
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_PRESTAMO` (`ID_PRESTAMO`),
  ADD KEY `ID_SALUD` (`ID_SALUD`),
  ADD KEY `ID_PERMISO` (`ID_PERMISO`),
  ADD KEY `ID_PENSION` (`ID_PENSION`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Es`);

--
-- Indices de la tabla `inducciones`
--
ALTER TABLE `inducciones`
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_VALOR_HORA_EXTRA` (`ID_VALOR_HORA_EXTRA`);

--
-- Indices de la tabla `licencia`
--
ALTER TABLE `licencia`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pension`
--
ALTER TABLE `pension`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `ID_USUARIO` (`id_us`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID_prest`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tp_licencia`
--
ALTER TABLE `tp_licencia`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `triggers`
--
ALTER TABLE `triggers`
  ADD PRIMARY KEY (`ID_Triggers`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_us`),
  ADD KEY `ID_puesto` (`id_puesto`),
  ADD KEY `ID_Roll` (`id_rol`);

--
-- Indices de la tabla `v_h_extra`
--
ALTER TABLE `v_h_extra`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Es` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `licencia`
--
ALTER TABLE `licencia`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `ID_prest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `triggers`
--
ALTER TABLE `triggers`
  MODIFY `ID_Triggers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deducciones`
--
ALTER TABLE `deducciones`
  ADD CONSTRAINT `deducciones_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`id_us`),
  ADD CONSTRAINT `deducciones_ibfk_2` FOREIGN KEY (`ID_PRESTAMO`) REFERENCES `prestamo` (`ID_prest`),
  ADD CONSTRAINT `deducciones_ibfk_3` FOREIGN KEY (`ID_SALUD`) REFERENCES `salud` (`ID`),
  ADD CONSTRAINT `deducciones_ibfk_4` FOREIGN KEY (`ID_PERMISO`) REFERENCES `permisos` (`id_permiso`),
  ADD CONSTRAINT `deducciones_ibfk_5` FOREIGN KEY (`ID_PENSION`) REFERENCES `pension` (`ID`);

--
-- Filtros para la tabla `inducciones`
--
ALTER TABLE `inducciones`
  ADD CONSTRAINT `inducciones_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`id_us`),
  ADD CONSTRAINT `inducciones_ibfk_2` FOREIGN KEY (`ID_VALOR_HORA_EXTRA`) REFERENCES `v_h_extra` (`ID`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_us`) REFERENCES `usuarios` (`id_us`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`ID`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
