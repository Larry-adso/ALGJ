-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2024 a las 04:07:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `n_algj`
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
(1123323324, 'kdkkdk', 17, 'emdfrepusroviraa@gmail.com', '22e7e9d85b7fe6004f7b9f3aa592ea9ec9ce098682e8192fa83785f1784c768d1d1ac3b8afcae88666f66aec24739ac133e9d4adc7506f1a5f1f6078cb27c674', '121312143227'),
(2147483647, 'prueba_1_s14', 14, 'empusrsmsm45oviraa@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', '8585763');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID` int(10) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID`, `Estado`) VALUES
(1, 'Activa'),
(2, 'Inactiva'),
(3, 'Disponible');

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
(11, 'EMkG6q3myEJ3f0lKwzOOWUhf8', 0, NULL, NULL, 1213),
(14, 'LcLiOjFnGsov5YsIZM7QjPKQ4', 2, NULL, NULL, 1214),
(15, 'g7pd1tFbWc21tgf0WMfBWrVAD', 3, NULL, NULL, 1214),
(16, 'OsxFl0gPxS6YZEA9qkRxnoYXl', 3, NULL, NULL, 1214),
(17, 'knK6jRsOPpvJ1EIpmaQeFguh3', 2, NULL, NULL, 1213),
(18, 'zLbOXuXklEDbu8nfFcWyJdjeN', 3, NULL, NULL, 1213),
(19, 'dBDtn9zgxFQMtKTnIMZwX1ovO', 3, NULL, NULL, 1214);

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
  `ID_PERMISO` int(11) NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `DIAS_PERMISO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID` int(11) NOT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Cantidad_cuotas` int(11) DEFAULT NULL,
  `Valor_Cuotas` int(11) DEFAULT NULL,
  `cuotas_en_deuda` int(11) DEFAULT NULL,
  `cuotas_pagas` int(11) DEFAULT NULL,
  `VALOR` decimal(10,2) DEFAULT NULL,
  `ESTADO_SOLICITUD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `ID` int(11) NOT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `salario` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`ID`, `cargo`, `salario`) VALUES
(1, 'Programador', 3.00000),
(2, 'Tester', 3.50000);

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
(1, 'ADMIN'),
(2, 'Empleado'),
(3, 'R_H');

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
  `ID` int(10) NOT NULL,
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
  `ID` int(11) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `triggers`
--

INSERT INTO `triggers` (`ID_Triggers`, `ID`, `Password`, `Fecha`) VALUES
(1, 1212122323, 'laxky1212', '2024-02-26 10:36:55'),
(2, 34238765, 'kdkdkd3434', '2024-02-26 10:37:51'),
(3, 1109000, '1234', '2024-02-26 11:13:59'),
(4, 1109000, '2323gt', '2024-02-26 22:02:26'),
(5, 1109000, '232345', '2024-02-26 22:03:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `Foto` blob DEFAULT NULL,
  `ID_puesto` int(11) DEFAULT NULL,
  `ID_Roll` int(11) DEFAULT NULL,
  `ID_Empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `password`, `Foto`, `ID_puesto`, `ID_Roll`, `ID_Empresa`) VALUES
(1109000, NULL, NULL, NULL, NULL, '4612', NULL, 1, 1, 0),
(34238765, NULL, NULL, NULL, NULL, 'kdkdkd3434', NULL, 1, 1, 0),
(1109000445, 'lll', 'jjhh', 'empusrossviraa@gmail.com', '66565', '1234', NULL, 2, 2, 0),
(1212122323, NULL, NULL, NULL, NULL, 'laxky1212', NULL, 1, 3, 0);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `usuarios_trigger` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO triggers (ID, Password, Fecha)
    VALUES (NEW.ID, OLD.Password, NOW());
END
$$
DELIMITER ;

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
  ADD PRIMARY KEY (`ID`);

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
  ADD PRIMARY KEY (`ID_PERMISO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID`),
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
-- Indices de la tabla `triggers`
--
ALTER TABLE `triggers`
  ADD PRIMARY KEY (`ID_Triggers`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_puesto` (`ID_puesto`),
  ADD KEY `ID_Roll` (`ID_Roll`),
  ADD KEY `ID_Empresa` (`ID_Empresa`);

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
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `licencia`
--
ALTER TABLE `licencia`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `triggers`
--
ALTER TABLE `triggers`
  MODIFY `ID_Triggers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deducciones`
--
ALTER TABLE `deducciones`
  ADD CONSTRAINT `deducciones_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`),
  ADD CONSTRAINT `deducciones_ibfk_2` FOREIGN KEY (`ID_PRESTAMO`) REFERENCES `prestamo` (`ID`),
  ADD CONSTRAINT `deducciones_ibfk_3` FOREIGN KEY (`ID_SALUD`) REFERENCES `salud` (`ID`),
  ADD CONSTRAINT `deducciones_ibfk_4` FOREIGN KEY (`ID_PERMISO`) REFERENCES `permisos` (`ID_PERMISO`),
  ADD CONSTRAINT `deducciones_ibfk_5` FOREIGN KEY (`ID_PENSION`) REFERENCES `pension` (`ID`);

--
-- Filtros para la tabla `inducciones`
--
ALTER TABLE `inducciones`
  ADD CONSTRAINT `inducciones_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`),
  ADD CONSTRAINT `inducciones_ibfk_2` FOREIGN KEY (`ID_VALOR_HORA_EXTRA`) REFERENCES `v_h_extra` (`ID`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_puesto`) REFERENCES `puestos` (`ID`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_Roll`) REFERENCES `roles` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
