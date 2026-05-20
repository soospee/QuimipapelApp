-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.13.0.7160
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para quimipapel
CREATE DATABASE IF NOT EXISTS `quimipapel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `quimipapel`;

-- Volcando estructura para tabla quimipapel.actividad_usuario
CREATE TABLE IF NOT EXISTS `actividad_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `actividad_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.actividad_usuario: ~9 rows (aproximadamente)
INSERT INTO `actividad_usuario` (`id`, `usuario_id`, `accion`, `created_at`) VALUES
	(1, 1, 'Alta inicial del sistema', '2026-05-19 22:06:33'),
	(2, 2, 'Creó pedido #1', '2026-05-19 22:06:33'),
	(3, 3, 'Registró cliente nuevo', '2026-05-19 22:06:33'),
	(4, 4, 'Actualizó stock de productos', '2026-05-19 22:06:33'),
	(5, 5, 'Inició reparto', '2026-05-19 22:06:33'),
	(6, 6, 'Confirmó entrega', '2026-05-19 22:06:33'),
	(7, 7, 'Revisó incidencias', '2026-05-19 22:06:33'),
	(8, 8, 'Generó presupuesto', '2026-05-19 22:06:33'),
	(9, 1, 'Inició sesión en la app', '2026-05-20 12:25:42');

-- Volcando estructura para tabla quimipapel.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.categorias: ~10 rows (aproximadamente)
INSERT INTO `categorias` (`id`, `nombre`) VALUES
	(1, 'Papel'),
	(2, 'Cartón'),
	(3, 'Embalaje'),
	(4, 'Limpieza'),
	(5, 'Oficina'),
	(6, 'Higiene'),
	(7, 'Desechables'),
	(8, 'Consumibles'),
	(9, 'Etiquetado'),
	(10, 'Seguridad');

-- Volcando estructura para tabla quimipapel.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(150) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `localidad_id` int(11) DEFAULT NULL,
  `zona_id` int(11) DEFAULT NULL,
  `localidad_texto` varchar(150) DEFAULT NULL,
  `zona_texto` varchar(150) DEFAULT NULL,
  `latitud` decimal(10,7) NOT NULL DEFAULT 0.0000000,
  `longitud` decimal(10,7) NOT NULL DEFAULT 0.0000000,
  `recibe_pedidos` tinyint(1) NOT NULL DEFAULT 1,
  `facturacion_mensual` tinyint(1) NOT NULL DEFAULT 0,
  `dia_facturacion` int(11) NOT NULL DEFAULT 1,
  `observaciones` text DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_clientes_zona` (`zona_id`),
  KEY `fk_clientes_localidad` (`localidad_id`),
  CONSTRAINT `fk_clientes_localidad` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`),
  CONSTRAINT `fk_clientes_zona` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.clientes: ~10 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `empresa`, `contacto`, `telefono`, `email`, `direccion`, `ciudad`, `codigo_postal`, `localidad_id`, `zona_id`, `localidad_texto`, `zona_texto`, `latitud`, `longitud`, `recibe_pedidos`, `facturacion_mensual`, `dia_facturacion`, `observaciones`, `activo`, `created_at`) VALUES
	(1, 'Supermercados Sol', 'Elena Martín', '910000001', 'compras@supermercadossol.es', 'Calle Mayor 12', 'Madrid', '28001', 1, 1, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 1, 1, NULL, 1, '2026-05-19 22:06:32'),
	(2, 'Distribuciones Norte', 'Ángel Pérez', '910000002', 'info@distnorte.es', 'Avenida Europa 45', 'Madrid', '28008', 1, 2, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 1, 1, NULL, 1, '2026-05-19 22:06:32'),
	(3, 'Oficinas Central', 'Mónica López', '910000003', 'pedidos@oficinascentral.es', 'Paseo del Prado 22', 'Madrid', '28014', 1, 1, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 1, 1, NULL, 1, '2026-05-19 22:06:32'),
	(4, 'Papelería Estrella', 'Raúl Sánchez', '910000004', 'pedidos@papeleriaestrella.es', 'Calle Alcalá 88', 'Madrid', '28009', 1, 2, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 1, '2026-05-19 22:06:32'),
	(5, 'Almacenes Vega', 'Lucía Romero', '910000005', 'compras@almacenesvega.es', 'Calle Toledo 101', 'Madrid', '28005', 1, 1, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 0, '2026-05-19 22:06:32'),
	(6, 'Residencias Vida', 'Pedro Navarro', '910000006', 'compras@residenciasvida.es', 'Calle Goya 33', 'Madrid', '28002', 1, 2, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 1, '2026-05-19 22:06:32'),
	(7, 'Hospital del Sur', 'Sara Molina', '910000007', 'logistica@hospitalsur.es', 'Avenida del Sur 77', 'Madrid', '28031', 1, 4, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 1, '2026-05-19 22:06:32'),
	(8, 'Colegio Nuevo Futuro', 'Diego Herrera', '910000008', 'admin@colegionuevofuturo.es', 'Calle López de Hoyos 150', 'Madrid', '28020', 1, 2, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, '', 1, '2026-05-19 22:06:32'),
	(9, 'Restauración Iberia', 'Clara Vega', '910000009', 'compras@restib.es', 'Calle Atocha 55', 'Madrid', '28012', 1, 1, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 1, '2026-05-19 22:06:32'),
	(10, 'Logística Rapid', 'Iván Castro', '910000010', 'pedidos@lograpid.es', 'Calle Leganés 9', 'Madrid', '28914', 1, 5, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, NULL, 1, '2026-05-19 22:06:32'),
	(11, '', '', '', '', '', 'Madrid', '46600', 1, 3, 'Madrid', 'Sin zona', 0.0000000, 0.0000000, 1, 0, 1, '', 0, '2026-05-20 09:43:56');

-- Volcando estructura para tabla quimipapel.conductores
CREATE TABLE IF NOT EXISTS `conductores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` enum('Disponible','En ruta','Cargando') NOT NULL DEFAULT 'Disponible',
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `conductores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.conductores: ~2 rows (aproximadamente)
INSERT INTO `conductores` (`id`, `usuario_id`, `estado`) VALUES
	(1, 5, 'Disponible'),
	(2, 6, 'En ruta');

-- Volcando estructura para tabla quimipapel.incidencias
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `resuelta` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.incidencias: ~4 rows (aproximadamente)
INSERT INTO `incidencias` (`id`, `pedido_id`, `descripcion`, `resuelta`, `created_at`) VALUES
	(1, 7, 'Producto faltante detectado en preparación.', 0, '2026-05-19 22:06:33'),
	(2, 2, 'Retraso por exceso de carga en ruta.', 0, '2026-05-19 22:06:33'),
	(3, 10, 'Cliente solicitó cambio de franja horaria.', 1, '2026-05-19 22:06:33'),
	(4, 2, 'no paga\n', 0, '2026-05-20 09:34:47');

-- Volcando estructura para tabla quimipapel.localidades
CREATE TABLE IF NOT EXISTS `localidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `provincia` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_localidad_nombre` (`nombre`,`provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.localidades: ~1 rows (aproximadamente)
INSERT INTO `localidades` (`id`, `nombre`, `provincia`) VALUES
	(1, 'Madrid', 'Madrid');

-- Volcando estructura para tabla quimipapel.notificaciones_config
CREATE TABLE IF NOT EXISTS `notificaciones_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nuevos_pedidos` tinyint(1) DEFAULT 1,
  `pedidos_urgentes` tinyint(1) DEFAULT 1,
  `incidencias` tinyint(1) DEFAULT 1,
  `entregas_completadas` tinyint(1) DEFAULT 0,
  `actualizaciones_sistema` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `notificaciones_config_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.notificaciones_config: ~8 rows (aproximadamente)
INSERT INTO `notificaciones_config` (`id`, `usuario_id`, `nuevos_pedidos`, `pedidos_urgentes`, `incidencias`, `entregas_completadas`, `actualizaciones_sistema`) VALUES
	(1, 1, 1, 1, 1, 1, 1),
	(2, 2, 1, 1, 1, 0, 1),
	(3, 3, 1, 1, 1, 0, 0),
	(4, 4, 1, 1, 1, 1, 0),
	(5, 5, 1, 1, 1, 1, 0),
	(6, 6, 1, 1, 1, 1, 0),
	(7, 7, 1, 1, 1, 0, 1),
	(8, 8, 1, 1, 0, 0, 1);

-- Volcando estructura para tabla quimipapel.pedido_items
CREATE TABLE IF NOT EXISTS `pedido_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unit` decimal(10,2) NOT NULL,
  `descuento_porcentaje` decimal(5,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `pedido_items_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_items_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.pedido_items: ~32 rows (aproximadamente)
INSERT INTO `pedido_items` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unit`, `descuento_porcentaje`) VALUES
	(1, 1, 1, 10, 4.95, 0.00),
	(2, 1, 6, 20, 1.85, 0.00),
	(3, 1, 9, 15, 1.10, 0.00),
	(4, 2, 11, 8, 8.90, 0.00),
	(5, 2, 15, 12, 6.80, 0.00),
	(6, 2, 29, 4, 11.95, 0.00),
	(7, 3, 17, 2, 9.90, 0.00),
	(8, 3, 19, 10, 1.95, 0.00),
	(9, 3, 35, 6, 1.20, 0.00),
	(10, 4, 1, 20, 4.95, 0.00),
	(11, 4, 7, 40, 1.55, 0.00),
	(12, 4, 24, 30, 2.95, 0.00),
	(13, 5, 26, 1, 42.00, 0.00),
	(14, 5, 27, 2, 8.90, 0.00),
	(15, 5, 31, 5, 14.20, 0.00),
	(16, 6, 21, 8, 4.60, 0.00),
	(17, 6, 23, 20, 2.95, 0.00),
	(18, 6, 36, 10, 2.10, 0.00),
	(19, 7, 12, 15, 2.35, 0.00),
	(20, 7, 13, 5, 11.60, 0.00),
	(21, 7, 38, 2, 24.90, 0.00),
	(22, 8, 18, 4, 9.90, 0.00),
	(23, 8, 20, 10, 2.40, 0.00),
	(24, 8, 34, 25, 1.35, 0.00),
	(25, 9, 3, 12, 5.40, 0.00),
	(26, 9, 8, 3, 14.70, 0.00),
	(27, 9, 30, 6, 19.90, 0.00),
	(28, 10, 2, 25, 9.80, 0.00),
	(29, 10, 5, 10, 12.90, 0.00),
	(30, 10, 33, 50, 1.25, 0.00),
	(31, 11, 37, 1, 2.10, 0.00),
	(32, 12, 17, 1, 9.90, 0.00);

-- Volcando estructura para tabla quimipapel.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `conductor_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Pendiente','Preparado','Cargado','En reparto','Entregado','Incidencia','Fallido','Reprogramado') NOT NULL DEFAULT 'Pendiente',
  `urgencia` enum('Normal','Urgente') NOT NULL DEFAULT 'Normal',
  `reparto` tinyint(1) NOT NULL DEFAULT 1,
  `notas` text DEFAULT NULL,
  `incidencia_descripcion` text DEFAULT NULL,
  `descuento_pedido_porcentaje` decimal(5,2) NOT NULL DEFAULT 0.00,
  `espacio_estimado` decimal(10,2) NOT NULL DEFAULT 0.00,
  `peso_estimado` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prioridad` varchar(30) NOT NULL DEFAULT 'Normal',
  `franja_inicio` time DEFAULT NULL,
  `franja_fin` time DEFAULT NULL,
  `tiempo_entrega_minutos` int(11) NOT NULL DEFAULT 3,
  `orden_ruta` int(11) DEFAULT NULL,
  `distancia_km` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tiempo_ruta_minutos` int(11) NOT NULL DEFAULT 0,
  `estado_ruta` varchar(30) NOT NULL DEFAULT 'Pendiente',
  `estado_actualizado_at` datetime DEFAULT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `conductor_id` (`conductor_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`conductor_id`) REFERENCES `conductores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.pedidos: ~10 rows (aproximadamente)
INSERT INTO `pedidos` (`id`, `cliente_id`, `usuario_id`, `conductor_id`, `fecha`, `estado`, `urgencia`, `reparto`, `notas`, `incidencia_descripcion`, `descuento_pedido_porcentaje`, `espacio_estimado`, `peso_estimado`, `prioridad`, `franja_inicio`, `franja_fin`, `tiempo_entrega_minutos`, `orden_ruta`, `distancia_km`, `tiempo_ruta_minutos`, `estado_ruta`, `estado_actualizado_at`, `total`) VALUES
	(1, 1, 2, 1, '2026-05-01 09:15:00', 'Entregado', 'Normal', 1, 'Entrega sin incidencias.', NULL, 0.00, 45.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-01 09:15:00', 126.40),
	(2, 2, 3, 1, '2026-05-02 11:20:00', 'Entregado', 'Urgente', 1, 'Prioridad por rotura de stock.', NULL, 0.00, 24.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-02 11:20:00', 248.75),
	(3, 3, 4, 2, '2026-05-03 08:40:00', 'Entregado', 'Normal', 1, 'Preparar para mañana.', NULL, 0.00, 18.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-20 11:19:55', 89.60),
	(4, 4, 2, 2, '2026-05-04 10:10:00', 'Cargado', 'Normal', 1, 'Pedido grande de papelería.', NULL, 0.00, 90.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Pendiente', NULL, 312.95),
	(5, 5, 3, NULL, '2026-05-05 13:30:00', 'Pendiente', 'Urgente', 0, 'Recogida en almacén.', NULL, 0.00, 8.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Pendiente', NULL, 54.20),
	(6, 6, 4, 1, '2026-05-06 15:45:00', 'Entregado', 'Normal', 1, 'Cliente satisfecho.', NULL, 0.00, 38.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-06 15:45:00', 177.30),
	(7, 7, 7, 2, '2026-05-07 09:05:00', 'Reprogramado', 'Urgente', 1, 'Falta un producto del pedido.', NULL, 0.00, 22.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Reprogramado', '2026-05-07 09:05:00', 98.90),
	(8, 8, 8, NULL, '2026-05-08 12:00:00', 'Pendiente', 'Normal', 0, 'Pedido interno de oficina.', NULL, 0.00, 39.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Pendiente', NULL, 64.35),
	(9, 9, 1, 1, '2026-05-09 16:10:00', 'Entregado', 'Normal', 1, 'Entregado en recepción.', NULL, 0.00, 21.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-09 16:10:00', 205.70),
	(10, 10, 1, 2, '2026-05-10 10:25:00', 'Entregado', 'Urgente', 1, 'Cliente con urgencia máxima.', NULL, 0.00, 85.00, 0.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Entregado', '2026-05-10 10:25:00', 411.20),
	(11, 2, 1, NULL, '2026-05-20 11:21:46', 'Pendiente', 'Normal', 1, '', NULL, 0.00, 1.00, 1.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Pendiente', NULL, 2.10),
	(12, 8, 4, NULL, '2026-05-20 12:03:07', 'Pendiente', 'Normal', 1, 'Pedido Sospe', NULL, 0.00, 1.00, 1.00, 'Normal', NULL, NULL, 3, NULL, 0.00, 0, 'Pendiente', NULL, 9.90);

-- Volcando estructura para tabla quimipapel.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `imagen_path` varchar(500) DEFAULT NULL,
  `volumen` decimal(10,2) NOT NULL DEFAULT 1.00,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 10,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `categoria_id` (`categoria_id`),
  KEY `idx_productos_proveedor` (`proveedor_id`),
  CONSTRAINT `fk_productos_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.productos: ~40 rows (aproximadamente)
INSERT INTO `productos` (`id`, `nombre`, `sku`, `categoria_id`, `proveedor_id`, `imagen_path`, `volumen`, `precio`, `stock`, `stock_minimo`, `activo`, `created_at`) VALUES
	(1, 'Papel A4 80g 500 hojas', 'PAP-A4-500', 1, 1, NULL, 1.00, 4.95, 450, 50, 1, '2026-05-19 22:06:33'),
	(2, 'Papel A3 80g 500 hojas', 'PAP-A3-500', 1, 1, NULL, 1.00, 9.80, 180, 30, 1, '2026-05-19 22:06:33'),
	(3, 'Papel reciclado A4 500 hojas', 'PAP-REC-A4', 1, 1, NULL, 1.00, 5.40, 220, 40, 1, '2026-05-19 22:06:33'),
	(4, 'Cartulina blanca 50 hojas', 'CAR-BL-50', 2, 2, NULL, 1.00, 7.25, 90, 20, 1, '2026-05-19 22:06:33'),
	(5, 'Cartón ondulado doble canal', 'CAR-OND-DOB', 2, 2, NULL, 1.00, 12.90, 60, 10, 1, '2026-05-19 22:06:33'),
	(6, 'Caja de archivo grande', 'CAJ-ARCH-G', 3, 2, NULL, 1.00, 1.85, 1000, 100, 1, '2026-05-19 22:06:33'),
	(7, 'Caja de archivo mediana', 'CAJ-ARCH-M', 3, 2, NULL, 1.00, 1.55, 850, 100, 1, '2026-05-19 22:06:33'),
	(8, 'Rollo film estirable 500mm', 'FILM-500', 3, 2, NULL, 1.00, 14.70, 120, 20, 1, '2026-05-19 22:06:33'),
	(9, 'Cinta adhesiva transparente', 'CINT-TRA-48', 3, 2, NULL, 1.00, 1.10, 1500, 150, 1, '2026-05-19 22:06:33'),
	(10, 'Cinta precinto marrón', 'CINT-PRE-M', 3, 2, NULL, 1.00, 1.25, 1100, 150, 1, '2026-05-19 22:06:33'),
	(11, 'Detergente multiusos 5L', 'LIM-MULT-5L', 4, 3, NULL, 1.00, 8.90, 75, 15, 1, '2026-05-19 22:06:33'),
	(12, 'Limpiacristales 1L', 'LIM-CRIS-1L', 4, 3, NULL, 1.00, 2.35, 260, 30, 1, '2026-05-19 22:06:33'),
	(13, 'Desinfectante superficies 5L', 'DESINF-5L', 4, 3, NULL, 1.00, 11.60, 95, 15, 1, '2026-05-19 22:06:33'),
	(14, 'Ambientador spray 400ml', 'AMB-SPR-400', 4, 3, 'file:///C:/Users/carlo/.quimipapel/product_images/AMB-SPR-400_1779263257570.png', 1.00, 3.20, 140, 20, 0, '2026-05-19 22:06:33'),
	(15, 'Guantes nitrilo talla M', 'GUA-NIT-M', 5, 4, NULL, 1.00, 6.80, 300, 50, 1, '2026-05-19 22:06:33'),
	(16, 'Guantes nitrilo talla L', 'GUA-NIT-L', 5, 4, NULL, 1.00, 6.80, 280, 50, 1, '2026-05-19 22:06:33'),
	(17, 'Bolígrafo azul caja 50', 'BOL-AZ-50', 5, 4, NULL, 1.00, 9.90, 199, 40, 1, '2026-05-19 22:06:33'),
	(18, 'Bolígrafo negro caja 50', 'BOL-NE-50', 5, 4, NULL, 1.00, 9.90, 190, 40, 1, '2026-05-19 22:06:33'),
	(19, 'Cuaderno A4 rayado', 'CUE-A4-RAY', 5, 4, NULL, 1.00, 1.95, 500, 80, 1, '2026-05-19 22:06:33'),
	(20, 'Cuaderno A5 espiral', 'CUE-A5-ESP', 5, 4, NULL, 1.00, 2.40, 420, 80, 1, '2026-05-19 22:06:33'),
	(21, 'Papel higiénico industrial 6 uds', 'HIG-PHI-6', 6, 3, NULL, 1.00, 4.60, 310, 50, 1, '2026-05-19 22:06:33'),
	(22, 'Papel secamanos 2 capas', 'HIG-SEC-2C', 6, 3, NULL, 1.00, 18.50, 110, 20, 1, '2026-05-19 22:06:33'),
	(23, 'Servilleta blanca 40x40', 'SER-BLA-40', 7, 3, NULL, 1.00, 2.95, 600, 100, 1, '2026-05-19 22:06:33'),
	(24, 'Plato desechable pack 50', 'PLA-50', 7, 3, NULL, 1.00, 3.75, 260, 40, 1, '2026-05-19 22:06:33'),
	(25, 'Vaso desechable pack 100', 'VAS-100', 7, 3, NULL, 1.00, 4.10, 240, 40, 1, '2026-05-19 22:06:33'),
	(26, 'Tóner compatible HP 117A negro', 'TON-HP117A', 8, 4, NULL, 1.00, 42.00, 45, 10, 1, '2026-05-19 22:06:33'),
	(27, 'Tinta compatible Epson 104 cyan', 'TIN-EPS-104-C', 8, 4, NULL, 1.00, 8.90, 55, 10, 1, '2026-05-19 22:06:33'),
	(28, 'Etiquetas adhesivas A4 100 hojas', 'ETQ-A4-100', 9, 4, NULL, 1.00, 11.95, 130, 20, 1, '2026-05-19 22:06:33'),
	(29, 'Etiquetadora manual', 'ETQ-MAN-01', 9, 4, NULL, 1.00, 19.90, 35, 8, 1, '2026-05-19 22:06:33'),
	(30, 'Señal de seguridad salida', 'SEG-SALIDA', 10, 3, NULL, 1.00, 6.40, 70, 10, 1, '2026-05-19 22:06:33'),
	(31, 'Señal de uso obligatorio guantes', 'SEG-GUA', 10, 3, NULL, 1.00, 5.80, 85, 10, 1, '2026-05-19 22:06:33'),
	(32, 'Cono señalización 75 cm', 'SEG-CONO-75', 10, 3, NULL, 1.00, 14.20, 40, 8, 1, '2026-05-19 22:06:33'),
	(33, 'Papel kraft 70cm rollo', 'KRAFT-70', 3, 2, NULL, 1.00, 13.50, 95, 15, 1, '2026-05-19 22:06:33'),
	(34, 'Cinta doble cara industrial', 'CIN-DOB-IND', 3, 2, NULL, 1.00, 2.65, 210, 30, 1, '2026-05-19 22:06:33'),
	(35, 'Marcador permanente negro', 'MAR-PER-NEG', 5, 4, NULL, 1.00, 1.35, 700, 100, 1, '2026-05-19 22:06:33'),
	(36, 'Rotulador fluorescente amarillo', 'ROT-FLU-AM', 5, 4, NULL, 1.00, 1.20, 620, 100, 1, '2026-05-19 22:06:33'),
	(37, 'Bloc notas adhesivas 76x76', 'BLOC-ADH-76', 5, 4, NULL, 1.00, 2.10, 479, 80, 1, '2026-05-19 22:06:33'),
	(38, 'Jabón de manos 5L', 'JAB-MAN-5L', 4, 3, NULL, 1.00, 7.45, 88, 15, 1, '2026-05-19 22:06:33'),
	(39, 'Gel hidroalcohólico 5L', 'GEL-HID-5L', 4, 3, NULL, 1.00, 15.30, 66, 12, 1, '2026-05-19 22:06:33'),
	(40, 'Mascarillas FFP2 caja 50', 'MAS-FFP2-50', 10, 3, NULL, 1.00, 24.90, 52, 10, 1, '2026-05-19 22:06:33');

-- Volcando estructura para tabla quimipapel.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.proveedores: ~4 rows (aproximadamente)
INSERT INTO `proveedores` (`id`, `nombre`, `contacto`, `telefono`, `email`, `activo`, `created_at`) VALUES
	(1, 'Papelera Central Madrid S.L.', 'Departamento Comercial', '910111222', 'pedidos@papeleracentralmadrid.es', 1, '2026-05-20 09:17:38'),
	(2, 'Embalajes y Cartonajes Iberia', 'Logística', '910333444', 'ventas@embalajesiberia.es', 1, '2026-05-20 09:17:38'),
	(3, 'Higiene Profesional Norte', 'Atención Empresas', '910555666', 'empresas@higienenorte.es', 1, '2026-05-20 09:17:38'),
	(4, 'Consumibles Oficina Madrid', 'Compras', '910777888', 'compras@consumiblesoficina.es', 1, '2026-05-20 09:17:38');

-- Volcando estructura para tabla quimipapel.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('Administrador','Comercial','Repartidor','Oficina') NOT NULL DEFAULT 'Oficina',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `foto_perfil_path` varchar(500) DEFAULT NULL,
  `descuento_porcentaje` decimal(5,2) NOT NULL DEFAULT 0.00,
  `zona_id` int(11) DEFAULT NULL,
  `zona_permitida_texto` varchar(180) DEFAULT NULL,
  `capacidad_furgoneta` decimal(10,2) NOT NULL DEFAULT 100.00,
  `max_paquetes` int(11) NOT NULL DEFAULT 40,
  `ubicacion_inicio` varchar(255) DEFAULT NULL,
  `inicio_latitud` decimal(10,7) NOT NULL DEFAULT 40.4167750,
  `inicio_longitud` decimal(10,7) NOT NULL DEFAULT -3.7037900,
  `hora_inicio_jornada` time DEFAULT NULL,
  `hora_fin_jornada` time DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_usuarios_zona` (`zona_id`),
  CONSTRAINT `fk_usuarios_zona` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.usuarios: ~8 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nombre`, `email`, `telefono`, `password_hash`, `rol`, `activo`, `ultimo_acceso`, `foto_perfil_path`, `descuento_porcentaje`, `zona_id`, `zona_permitida_texto`, `capacidad_furgoneta`, `max_paquetes`, `ubicacion_inicio`, `inicio_latitud`, `inicio_longitud`, `hora_inicio_jornada`, `hora_fin_jornada`, `created_at`) VALUES
	(1, 'Admin General', 'carlos', '600100101', '1234', 'Administrador', 1, '2026-05-20 12:25:42', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 0.0000000, 0.0000000, NULL, NULL, '2026-05-19 22:06:32'),
	(2, 'Laura Gómez', 'laura.gomez@quimipapel.com', '600100102', 'password', 'Oficina', 1, '2026-05-19 22:06:32', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 40.4167750, -3.7037900, NULL, NULL, '2026-05-19 22:06:32'),
	(3, 'Carlos Ruiz', 'carlos.ruiz@quimipapel.com', '600100103', 'password', 'Comercial', 1, '2026-05-20 09:54:27', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 40.4167750, -3.7037900, NULL, NULL, '2026-05-19 22:06:32'),
	(4, 'Marta León', 'marta.leon@quimipapel.com', '600100104', 'password', 'Oficina', 1, '2026-05-20 11:52:47', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 40.4167750, -3.7037900, NULL, NULL, '2026-05-19 22:06:32'),
	(5, 'Javier Torres', 'javier.torres@quimipapel.com', '600100105', 'password', 'Repartidor', 1, '2026-05-20 09:59:34', NULL, 0.00, 1, 'Madrid Centro', 120.00, 40, 'Almacén central QUIMIPAPEL', 40.4167750, -3.7037900, '08:00:00', '16:00:00', '2026-05-19 22:06:32'),
	(6, 'Sergio Vidal', 'sergio.vidal@quimipapel.com', '600100106', 'password', 'Repartidor', 1, '2026-05-20 11:51:08', NULL, 0.00, 2, 'Madrid Centro', 100.00, 40, 'Almacén central QUIMIPAPEL', 40.4167750, -3.7037900, '08:00:00', '16:00:00', '2026-05-19 22:06:32'),
	(7, 'Ana Prieto', 'ana.prieto@quimipapel.com', '600100107', 'password', 'Oficina', 1, '2026-05-19 22:06:32', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 40.4167750, -3.7037900, NULL, NULL, '2026-05-19 22:06:32'),
	(8, 'Rubén Gil', 'ruben.gil@quimipapel.com', '600100108', 'password', 'Comercial', 1, '2026-05-19 22:06:32', NULL, 0.00, NULL, NULL, 100.00, 40, NULL, 40.4167750, -3.7037900, NULL, NULL, '2026-05-19 22:06:32');

-- Volcando estructura para tabla quimipapel.zonas
CREATE TABLE IF NOT EXISTS `zonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localidad_id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_zona_localidad` (`localidad_id`,`nombre`),
  CONSTRAINT `fk_zonas_localidad` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla quimipapel.zonas: ~5 rows (aproximadamente)
INSERT INTO `zonas` (`id`, `localidad_id`, `nombre`, `descripcion`) VALUES
	(1, 1, 'Madrid Centro', 'Códigos postales centro: 28001, 28005, 28012, 28013, 28014'),
	(2, 1, 'Madrid Norte', 'Códigos postales norte: 28002, 28008, 28009, 28020'),
	(3, 1, 'Madrid Este', 'Zona este y alrededores'),
	(4, 1, 'Madrid Sur', 'Zona sur y alrededores: 28031'),
	(5, 1, 'Madrid Oeste', 'Zona oeste y alrededores: 28914');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
