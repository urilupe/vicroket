-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2021 a las 22:58:33
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kalkafe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `promocion` int(11) NOT NULL,
  `paquete` int(11) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id insumos` int(11) NOT NULL,
  `nombrei` varchar(50) COLLATE utf8_bin NOT NULL,
  `precio` float NOT NULL,
  `cantidadi` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id producto` int(11) NOT NULL,
  `id proveedor` int(11) NOT NULL,
  `id usurio` int(11) NOT NULL,
  `nombrep` varchar(50) COLLATE utf8_bin NOT NULL,
  `descripcionp` text COLLATE utf8_bin NOT NULL,
  `nombreimg` text COLLATE utf8_bin NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedor`
--

CREATE TABLE `provedor` (
  `id provedor` int(11) NOT NULL,
  `nombrepv` varchar(50) COLLATE utf8_bin NOT NULL,
  `contacto` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombreu` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correou` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `claveu` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `perfilu` char(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreu`, `correou`, `claveu`, `perfilu`) VALUES
(1, 'Uriel  Ismael Guadalupe Ramirez Andrade', 'urilupe@gmail.com', '$2b$12$2jwvevYGDSXGNvefW85dEeLwRrxKpU5GjCHUL2cd/3LZjKunS4BeO', 'A'),
(2, 'Javier Alexander Rodriguez Garcia', 'javier@gmail.com', '6438', 'U'),
(3, 'Karina Muñoz Avila', 'karina@gmail.com', '3310', 'U'),
(4, 'Brenda Lizeth  Soto Trejo', 'brenda@gmail.com', '4715', 'A'),
(5, 'Teodulo Guadalupe Villarreal Gutierrez', 'teo@gmail.com', '5238', 'U'),
(6, 'Ismael Ojeda', 'ismael@gmail.com', '1736', 'U'),
(7, 'Andrea Rivera Diaz', 'andrea@gmail.com', '9876', 'U'),
(8, 'Brenda Santillan Martinez', 'santillan@gmail.com', '7564', 'U'),
(9, 'Carlos Eduardo Cortes Lugo', 'carlos@gmail.com', '1033', 'U'),
(10, 'Lizeth Huerta Arellano', 'lizeth@gmail.com', '2347', 'U'),
(11, 'Daniel Arellano', 'daniel@gmail.com', '5383', 'U'),
(12, 'Andres Miguel Marquez Gonzalez', '', '8916', 'U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fechav` date NOT NULL,
  `fechac` date NOT NULL,
  `formatop` varchar(200) COLLATE utf8_bin NOT NULL,
  `precio` float NOT NULL,
  `hora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idcarrito`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idventa` (`idventa`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id insumos`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id producto`),
  ADD KEY `id producto` (`id producto`),
  ADD KEY `id proveedor` (`id proveedor`,`id usurio`);

--
-- Indices de la tabla `provedor`
--
ALTER TABLE `provedor`
  ADD PRIMARY KEY (`id provedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `correou` (`correou`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idventa` (`idventa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idcarrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id insumos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
