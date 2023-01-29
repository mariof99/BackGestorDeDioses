-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2023 at 09:34 PM
-- Server version: 8.0.32-0buntu0.22.04.1
-- PHP Version: 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `desafio2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `humanos`
--

CREATE TABLE `humanos` (
  `id_humano` bigint UNSIGNED NOT NULL,
  `destino` int DEFAULT '0',
  `id_dios` bigint UNSIGNED DEFAULT NULL,
  `cielo_infierno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `humanos`
--

INSERT INTO `humanos` (`id_humano`, `destino`, `id_dios`, `cielo_infierno`, `created_at`, `updated_at`) VALUES
(4, 43, 1, NULL, NULL, '2023-01-11 17:33:26'),
(5, 15, 2, NULL, NULL, NULL),
(6, 78, 3, NULL, NULL, '2023-01-11 17:33:31'),
(7, 40, 1, NULL, NULL, '2023-01-11 17:33:34'),
(9, 15, 1, NULL, NULL, NULL),
(11, 2, 1, NULL, '2023-01-29 19:53:21', '2023-01-29 19:53:21'),
(14, 88, 1, NULL, '2023-01-29 20:06:05', '2023-01-29 20:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `humano_prueba`
--

CREATE TABLE `humano_prueba` (
  `id_humano` bigint UNSIGNED NOT NULL,
  `id_prueba` bigint UNSIGNED NOT NULL,
  `tipo` enum('puntual','valoracion','eleccion','resp_libre') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `superada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `humano_prueba`
--

INSERT INTO `humano_prueba` (`id_humano`, `id_prueba`, `tipo`, `superada`) VALUES
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 8, NULL, NULL),
(4, 9, NULL, NULL),
(4, 10, NULL, NULL),
(4, 14, NULL, NULL),
(4, 15, NULL, NULL),
(4, 16, NULL, NULL),
(4, 19, NULL, NULL),
(4, 21, NULL, NULL),
(7, 1, NULL, NULL),
(7, 2, NULL, NULL),
(7, 5, NULL, NULL),
(7, 6, NULL, NULL),
(7, 7, NULL, NULL),
(7, 8, NULL, NULL),
(7, 9, NULL, NULL),
(7, 10, NULL, NULL),
(7, 14, NULL, NULL),
(7, 15, NULL, NULL),
(7, 16, NULL, NULL),
(7, 19, NULL, NULL),
(7, 21, NULL, NULL),
(9, 6, NULL, NULL),
(9, 8, NULL, NULL),
(9, 9, NULL, NULL),
(13, 13, NULL, NULL),
(14, 14, NULL, NULL),
(45, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mensajes`
--

CREATE TABLE `mensajes` (
  `id` bigint UNSIGNED NOT NULL,
  `asunto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuerpo` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mensajes`
--

INSERT INTO `mensajes` (`id`, `asunto`, `cuerpo`) VALUES
(1, 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
(2, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
(3, 'cccccccccccccccccccccccccccccccccccc', 'ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc'),
(4, 'dddddddddddddddddddddddddddddddddddddddddddddddddddd', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
(5, 'eeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(6, 'fffffffffffffffffffffffffffffffffffffffffffffff', 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'),
(7, 'ggggggggggggggggggggggggggggggggggggggggg', 'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'),
(12, '20 de abril del 90', 'Hola chata, cómo estás?');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(53, '2014_10_12_000000_create_users_table', 1),
(54, '2014_10_12_100000_create_password_resets_table', 1),
(55, '2019_08_19_000000_create_failed_jobs_table', 1),
(56, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(57, '2022_11_23_085616_create_humanos_table', 1),
(58, '2022_11_29_205055_create_pruebas_table', 1),
(59, '2022_11_29_205119_create_pruebas_puntuales_table', 1),
(60, '2022_11_29_205133_create_pruebas_oraculo_table', 1),
(62, '2022_11_29_205225_create_pruebas_resp_libre_table', 1),
(66, '2023_01_09_160429_create_mensajes_table', 1),
(67, '2023_01_09_160417_create_usr_mensaje_table', 2),
(68, '2023_01_09_195238_create_parametros_generales_table', 3),
(72, '2022_11_29_205204_create_pruebas_eleccion_table', 4),
(73, '2022_11_29_205245_create_pruebas_valoracion_table', 4),
(76, '2022_12_05_121405_create_humano_prueba_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `parametros_generales`
--

CREATE TABLE `parametros_generales` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parametros_generales`
--

INSERT INTO `parametros_generales` (`id`, `nombre`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'destino_minimo', 40, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'tokenDios', '054473831a1d42151e09e46ef7c7e24e0041ae6287f4545222d33ff709dae9cd', '[\"dios\"]', NULL, NULL, '2023-01-17 15:35:03', '2023-01-17 15:35:03'),
(2, 'App\\Models\\User', 1, 'tokenDios', 'bd72a4a8761bbb6af113cdf2cc9a4758b5f3f87434bd356b4dda3919c0c2af0f', '[\"dios\"]', NULL, NULL, '2023-01-18 16:30:29', '2023-01-18 16:30:29'),
(3, 'App\\Models\\User', 1, 'tokenDios', 'b7b3ee85bdc103f8d3e367cbdf761bd83526ecfd7bc071197ec66d963b29d6df', '[\"dios\"]', NULL, NULL, '2023-01-18 16:31:38', '2023-01-18 16:31:38'),
(4, 'App\\Models\\User', 1, 'tokenDios', 'cf1e87c6e1d748e1b959a07cbd164ba6d7e82ff743dbbfec740e08f2292136f6', '[\"dios\"]', NULL, NULL, '2023-01-18 16:31:38', '2023-01-18 16:31:38'),
(5, 'App\\Models\\User', 1, 'tokenDios', '067a5c7a8eb67919fa594eedfcbfe306cfa1f0af24f6b51ec0273b292b63baa0', '[\"dios\"]', NULL, NULL, '2023-01-18 16:49:33', '2023-01-18 16:49:33'),
(6, 'App\\Models\\User', 1, 'tokenDios', '345772ca670ec3caeee34540eb0b86af6528c9116b310c0f61be3c3761802683', '[\"dios\"]', NULL, NULL, '2023-01-18 16:49:56', '2023-01-18 16:49:56'),
(7, 'App\\Models\\User', 1, 'tokenDios', '0f1c63ce0d82f193fc73e1bf685f7dc7de9024147f4922d357271379a0473464', '[\"dios\"]', NULL, NULL, '2023-01-18 16:50:29', '2023-01-18 16:50:29'),
(8, 'App\\Models\\User', 1, 'tokenDios', '485471c1a654bc11458ee2bc9110225b16bbd061e43baceff0b6c8b5ca988ffc', '[\"dios\"]', NULL, NULL, '2023-01-18 16:52:14', '2023-01-18 16:52:14'),
(9, 'App\\Models\\User', 1, 'tokenDios', '682de1e6dd2066ada230c40d5247f2bdb6c1751c0fc6a0f52dfe73a16fe5d828', '[\"dios\"]', NULL, NULL, '2023-01-18 21:03:52', '2023-01-18 21:03:52'),
(10, 'App\\Models\\User', 1, 'tokenDios', '54981ef8d76bb87a391a4a0a35d06b82eb52619f290ee36377bdc5820d094980', '[\"dios\"]', NULL, NULL, '2023-01-18 21:05:08', '2023-01-18 21:05:08'),
(11, 'App\\Models\\User', 1, 'tokenDios', '67480adb718826cd2af5a0f5b4b43ec38c741657a0e5ed2f441ad7c5ab586847', '[\"dios\"]', NULL, NULL, '2023-01-18 21:10:02', '2023-01-18 21:10:02'),
(12, 'App\\Models\\User', 1, 'tokenDios', '07a6c94b8781a9268b561a7ccfe09446fed4480845d7584295316c8de1215f7e', '[\"dios\"]', NULL, NULL, '2023-01-18 21:10:49', '2023-01-18 21:10:49'),
(13, 'App\\Models\\User', 1, 'tokenDios', '3a9c41fdebe081746b82512c9378c2fc977948e3df16aa2cb71391ad7f9a7ef5', '[\"dios\"]', NULL, NULL, '2023-01-18 21:12:05', '2023-01-18 21:12:05'),
(14, 'App\\Models\\User', 1, 'tokenDios', '043837c669998ca5bc069299139eca6ca17510fb4aa025e3d136e1ec48626a12', '[\"dios\"]', NULL, NULL, '2023-01-18 21:13:45', '2023-01-18 21:13:45'),
(15, 'App\\Models\\User', 1, 'tokenDios', '93d4736d78da3fa22f7a8c9c326b070f3f1606f6da1cbd7891754e205563f8fe', '[\"dios\"]', NULL, NULL, '2023-01-19 08:45:37', '2023-01-19 08:45:37'),
(16, 'App\\Models\\User', 1, 'tokenDios', '58faeb839d472dc45dba19a3feec9205603d006f5455be4123ce2758afaaccd0', '[\"dios\"]', NULL, NULL, '2023-01-19 08:48:33', '2023-01-19 08:48:33'),
(17, 'App\\Models\\User', 1, 'tokenDios', '7d2fe6d1ca51bd94cc1c66d6e802daab4be72bd6ae45c1f800ab14ae0ea221a9', '[\"dios\"]', NULL, NULL, '2023-01-19 08:52:36', '2023-01-19 08:52:36'),
(18, 'App\\Models\\User', 1, 'tokenDios', '679ac929680c21b5a52bd7aa85ac3e4cd6d94f8d7609d35632253c1ebcd33d38', '[\"dios\"]', NULL, NULL, '2023-01-19 08:53:39', '2023-01-19 08:53:39'),
(19, 'App\\Models\\User', 1, 'tokenDios', 'a5f7faa3866d436a1ad922fd991223da38392745e63c5257cf851085556ac717', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:39', '2023-01-19 08:55:39'),
(20, 'App\\Models\\User', 1, 'tokenDios', '55c0b44051cf01043438a8cb4262eb9b0b74879d65545a28550277108db5152a', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:40', '2023-01-19 08:55:40'),
(21, 'App\\Models\\User', 1, 'tokenDios', '11d5340ab5b6833041409f890ad4de97c27ba8c79ce8e66d8894a57c2c4e15fb', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:41', '2023-01-19 08:55:41'),
(22, 'App\\Models\\User', 1, 'tokenDios', 'fcea4393c1d253e2097d7db61071a5c80b347434e3b8dc9d985e31e16777e844', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:42', '2023-01-19 08:55:42'),
(23, 'App\\Models\\User', 1, 'tokenDios', '7ce6f1dc5f2bccdc1c58b9de609dfb965a098833fbc9a9fa6167f48c681173a9', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:42', '2023-01-19 08:55:42'),
(24, 'App\\Models\\User', 1, 'tokenDios', '793964dd63133a931cc780bdd9bcc5dedf6e0aa2184cb291fb8e7c609dac079b', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:42', '2023-01-19 08:55:42'),
(25, 'App\\Models\\User', 1, 'tokenDios', 'd2db1598d7ebac26e36fd188dc9b2650eabf89132eeff54fb390b9b37109a472', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:43', '2023-01-19 08:55:43'),
(26, 'App\\Models\\User', 1, 'tokenDios', '51d6fded72b89c45b6d8b48020dfd356182cdac46f0c6c716342d71d81858e02', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:43', '2023-01-19 08:55:43'),
(27, 'App\\Models\\User', 1, 'tokenDios', 'c1044ddd72b03c84725cb6ca4f0d2125edeca79b536242a13612805d25484153', '[\"dios\"]', NULL, NULL, '2023-01-19 08:55:43', '2023-01-19 08:55:43'),
(28, 'App\\Models\\User', 1, 'tokenDios', '9e0a78fb8c87fcdcbe6cdc3580ad0ead65222615c0217aad69c0ae406387abf0', '[\"dios\"]', NULL, NULL, '2023-01-19 10:49:00', '2023-01-19 10:49:00'),
(29, 'App\\Models\\User', 1, 'tokenDios', 'dff5976ff4b13c3970ed18be21e6f7ec54119cf72346d652268f4464ea3bcae7', '[\"dios\"]', NULL, NULL, '2023-01-19 10:50:04', '2023-01-19 10:50:04'),
(30, 'App\\Models\\User', 1, 'tokenDios', 'd41cfbb5b8bb089768e269f75ee2b2f0af75bea7bef52abdb73f30a7f0d2c8e8', '[\"dios\"]', NULL, NULL, '2023-01-19 10:50:33', '2023-01-19 10:50:33'),
(31, 'App\\Models\\User', 1, 'tokenDios', 'd4c3a7eeb0d9bb3f0552bc47f0fb012a48ff88113bb0c1ec367b6f8f8a6b4bfb', '[\"dios\"]', NULL, NULL, '2023-01-19 10:50:48', '2023-01-19 10:50:48'),
(32, 'App\\Models\\User', 1, 'tokenDios', '1fc4fd67b4d3c24b722da71be6617d39da47f86341b4ac5f1e3929883c4981eb', '[\"dios\"]', NULL, NULL, '2023-01-19 10:50:54', '2023-01-19 10:50:54'),
(33, 'App\\Models\\User', 1, 'tokenDios', 'dc9fa544cd4f3287e07cb9c1a8a97960f1317772677bc28dd6f4c2c5f8db863f', '[\"dios\"]', NULL, NULL, '2023-01-19 10:50:59', '2023-01-19 10:50:59'),
(34, 'App\\Models\\User', 1, 'tokenDios', '84dae926d46526273a880cc473cc609319dec3bd1f0c49fb43ce7867a27e94e8', '[\"dios\"]', NULL, NULL, '2023-01-19 10:51:26', '2023-01-19 10:51:26'),
(35, 'App\\Models\\User', 1, 'tokenDios', '7d5e8fd6cecac8862d6d0578fe3b4de8c45b4c5282e4e7adb6d93986a86032ce', '[\"dios\"]', NULL, NULL, '2023-01-19 10:54:27', '2023-01-19 10:54:27'),
(36, 'App\\Models\\User', 5, 'tokenUser', 'ec09542ca6db7709684af9fcb96e15f7263ea73fa2589a53bbd79461feb896b3', '[\"humano\"]', NULL, NULL, '2023-01-19 10:56:30', '2023-01-19 10:56:30'),
(37, 'App\\Models\\User', 1, 'tokenDios', 'feb68292e2a69b8e650bb2c99e88587c5dca4851a3fd1169dbffb5450446ac43', '[\"dios\"]', NULL, NULL, '2023-01-19 11:33:36', '2023-01-19 11:33:36'),
(38, 'App\\Models\\User', 1, 'tokenDios', 'b4ad64df8e04f730d2023ae503a30bed510695565ed42a0811c5fec4eb8bdafa', '[\"dios\"]', NULL, NULL, '2023-01-20 07:03:57', '2023-01-20 07:03:57'),
(39, 'App\\Models\\User', 5, 'tokenUser', '39defea871091890aec98d926ec60ff3473a5872fab81d0177b68c5f33d4f082', '[\"humano\"]', NULL, NULL, '2023-01-22 20:11:21', '2023-01-22 20:11:21'),
(40, 'App\\Models\\User', 1, 'tokenDios', 'a318029b5d579f213623a10d293cc2582389edb0ae3978cb8ae1b291acd9e003', '[\"dios\"]', NULL, NULL, '2023-01-22 20:15:34', '2023-01-22 20:15:34'),
(41, 'App\\Models\\User', 1, 'tokenDios', 'bbd7b6216998d556992cc0733712680dfa0d1e5e086b844647f61796b08b4ddd', '[\"dios\"]', NULL, NULL, '2023-01-24 15:22:12', '2023-01-24 15:22:12'),
(42, 'App\\Models\\User', 1, 'tokenDios', '1857989c1ef3df00b3a983db4ba4be2b6a4bca7a0f0fe36940c3922619ec5dce', '[\"dios\"]', NULL, NULL, '2023-01-25 21:20:19', '2023-01-25 21:20:19'),
(43, 'App\\Models\\User', 1, 'tokenDios', '38d5986feb44018249144e98528df1fb0ae9fe45cd27f9e878bbf421e26ccfd8', '[\"dios\"]', NULL, NULL, '2023-01-26 20:54:14', '2023-01-26 20:54:14'),
(44, 'App\\Models\\User', 1, 'tokenDios', '2cee836188344c8c7788c0bfddb1835314765f030e7aceb64ec65a7ab744707d', '[\"dios\"]', NULL, NULL, '2023-01-27 12:10:20', '2023-01-27 12:10:20'),
(45, 'App\\Models\\User', 1, 'tokenDios', '5d30faad0124fb45e1c2c813ac0f01e2692e35561f5a430aba5a6f97db848896', '[\"dios\"]', NULL, NULL, '2023-01-27 12:10:21', '2023-01-27 12:10:21'),
(46, 'App\\Models\\User', 5, 'tokenUser', 'b62cea2a43e5638c4115402a19aa850e716813dd559306263693d581e65425a9', '[\"humano\"]', NULL, NULL, '2023-01-27 12:16:54', '2023-01-27 12:16:54'),
(47, 'App\\Models\\User', 1, 'tokenDios', 'ead4e1f95b7e7825d5a3e727b3f62be1dd6e6928141bd6e374a2191b28a25138', '[\"dios\"]', NULL, NULL, '2023-01-28 15:09:49', '2023-01-28 15:09:49'),
(48, 'App\\Models\\User', 1, 'tokenDios', '040d595f620ef7621c4a0c249accf671d61a42746bdf9f1d6a56e6b7e8a5ed48', '[\"dios\"]', NULL, NULL, '2023-01-28 15:09:50', '2023-01-28 15:09:50'),
(49, 'App\\Models\\User', 1, 'tokenDios', 'd81c898e7b1f98e6de287f98408bd047513f68cee765eb47dc3afaee0cff84a5', '[\"dios\"]', NULL, NULL, '2023-01-28 16:29:39', '2023-01-28 16:29:39'),
(50, 'App\\Models\\User', 1, 'tokenDios', '6f4f5eb559d6cdac576740920215cf35dd8f7e10f9c29e2d37eeb4ea07f9a985', '[\"dios\"]', NULL, NULL, '2023-01-29 14:53:00', '2023-01-29 14:53:00'),
(51, 'App\\Models\\User', 5, 'tokenUser', '02acc215ad208442ce3c3c6f255a24a69ab4645316baf92cc065b347e66dd933', '[\"humano\"]', NULL, NULL, '2023-01-29 20:09:45', '2023-01-29 20:09:45'),
(52, 'App\\Models\\User', 1, 'tokenDios', 'f059adf0ef993d91d74fed926ac73b0ff43a223dd1289acaf64ab9fda6845356', '[\"dios\"]', NULL, NULL, '2023-01-29 20:09:55', '2023-01-29 20:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas`
--

CREATE TABLE `pruebas` (
  `id` bigint UNSIGNED NOT NULL,
  `destino` int NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas`
--

INSERT INTO `pruebas` (`id`, `destino`, `titulo`, `created_at`, `updated_at`) VALUES
(1, 13, 'prueba1', NULL, NULL),
(2, 30, 'prueba2', NULL, NULL),
(3, 4, 'si si sis si', '2023-01-10 16:14:22', '2023-01-10 16:14:22'),
(4, 19, 'otra prueba', '2023-01-10 16:15:05', '2023-01-10 16:15:05'),
(5, 30, 'resp1', NULL, NULL),
(6, 23, 'popopopo', NULL, NULL),
(7, 49, 'aasdfdasdfasdfasdfasdf', NULL, NULL),
(8, 99, 'titulo', NULL, '2023-01-13 20:51:34'),
(9, 79, 'jijijijiijiji', NULL, NULL),
(10, 5, 'jlñkiuyth ctibihyff', NULL, NULL),
(11, 34, 'm', '2023-01-22 20:30:13', '2023-01-22 20:30:13'),
(12, 34, 'm', '2023-01-22 20:30:14', '2023-01-22 20:30:14'),
(13, 34, 'm', '2023-01-22 20:30:43', '2023-01-22 20:30:43'),
(14, 34, 'm', '2023-01-22 20:37:31', '2023-01-22 20:37:31'),
(15, 3, 'rerere123', '2023-01-22 20:41:44', '2023-01-22 20:41:44'),
(16, 34, 'pruebadesdeclient', '2023-01-22 20:50:12', '2023-01-22 20:50:12'),
(17, 96, 'pruebainsertarval', '2023-01-22 20:53:32', '2023-01-22 20:53:32'),
(18, 96, 'pruebainsertarval', '2023-01-22 20:54:23', '2023-01-22 20:54:23'),
(19, 96, 'pruebainsertarval', '2023-01-22 20:54:50', '2023-01-22 20:54:50'),
(20, 88, 'qwerty', '2023-01-22 20:59:43', '2023-01-22 20:59:43'),
(21, 88, 'qwerty', '2023-01-22 21:00:58', '2023-01-22 21:00:58'),
(22, 12, 'a veces llega un momento en que', '2023-01-29 16:41:51', '2023-01-29 16:41:51'),
(23, 33, 'eltitulo', '2023-01-29 16:43:45', '2023-01-29 16:43:45'),
(24, 33, 'eltitulo', '2023-01-29 16:44:18', '2023-01-29 16:44:18'),
(25, 33, 'eltitulo', '2023-01-29 16:45:30', '2023-01-29 16:45:30'),
(26, 33, 'eltitulo', '2023-01-29 16:46:08', '2023-01-29 16:46:08'),
(27, 33, 'eltitulo', '2023-01-29 16:46:15', '2023-01-29 16:46:15'),
(28, 33, 'eltitulo', '2023-01-29 16:46:53', '2023-01-29 16:46:53'),
(29, 12, 'a veces llega un momento en que', '2023-01-29 16:47:01', '2023-01-29 16:47:01'),
(30, 2, 'p asdñlkvj asñljvl sadjcñlsadkmvñiowld jfoaef', '2023-01-29 16:47:30', '2023-01-29 16:47:30'),
(31, 3, 'asdf', '2023-01-29 16:48:56', '2023-01-29 16:48:56'),
(32, 2, 's', '2023-01-29 16:49:40', '2023-01-29 16:49:40'),
(33, 3, 'dd', '2023-01-29 16:50:04', '2023-01-29 16:50:04'),
(34, 2, 'ew', '2023-01-29 16:50:20', '2023-01-29 16:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas_eleccion`
--

CREATE TABLE `pruebas_eleccion` (
  `id` bigint UNSIGNED NOT NULL,
  `respuesta_correcta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respuesta_incorrecta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atributo` enum('sabiduria','nobleza','virtud','maldad','audacia') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas_eleccion`
--

INSERT INTO `pruebas_eleccion` (`id`, `respuesta_correcta`, `respuesta_incorrecta`, `atributo`) VALUES
(7, 'aroro', 'eeeeeee', 'nobleza'),
(8, 'eeeeeeeeeeeeeeeeeeeeeeeea', 'a', 'sabiduria'),
(15, 'si', 'si', 'sabiduria'),
(16, 'si', 'no', 'maldad'),
(28, 's', 'ee', 'virtud'),
(31, 'ff', 'ff', 'nobleza'),
(32, 's', 'dd', 'maldad'),
(33, 'r', 'r', 'nobleza');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas_oraculo`
--

CREATE TABLE `pruebas_oraculo` (
  `id` bigint UNSIGNED NOT NULL,
  `pregunta` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas_oraculo`
--

INSERT INTO `pruebas_oraculo` (`id`, `pregunta`) VALUES
(5, 'asdf?'),
(6, 'asdfasdfasdfasdf?'),
(7, 'adfsdfesfdefeee?'),
(8, '?a'),
(9, 'pppp o lnlj l k lj o?'),
(10, 'opi? '),
(14, 'm?'),
(15, 'rerererere?'),
(16, 'pruebadesdeclient?'),
(17, 'pruebainsertarval?'),
(18, 'pruebainsertarval?'),
(19, 'pruebainsertarval?'),
(20, 'asdffasdasdffasfd?'),
(21, 'v'),
(22, 'Te haces viejo de repente?'),
(23, 'lapregunta'),
(24, 'lapregunta'),
(25, 'lapregunta'),
(26, 'lapregunta'),
(27, 'lapregunta'),
(28, 'lapregunta'),
(29, 'Te haces viejo de repente?'),
(30, '´jvś djsfñlslkfsdlfjòwenvlsm lsjflfpjsfj of sfj s fĺj sdfl asjdf'),
(31, 'asdf'),
(32, 's'),
(33, 'ddd');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas_puntuales`
--

CREATE TABLE `pruebas_puntuales` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `porcentaje` int NOT NULL,
  `atributo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas_puntuales`
--

INSERT INTO `pruebas_puntuales` (`id`, `descripcion`, `porcentaje`, `atributo`) VALUES
(1, 'aaaaaaaaaaaaaaaaaaaa', 50, 'maldad'),
(2, 'bbbbbbbbbbbbb', 30, 'virtud'),
(34, 'we', 3, 'maldad');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas_resp_libre`
--

CREATE TABLE `pruebas_resp_libre` (
  `id` bigint UNSIGNED NOT NULL,
  `porcentaje` int NOT NULL,
  `palabras_clave` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas_resp_libre`
--

INSERT INTO `pruebas_resp_libre` (`id`, `porcentaje`, `palabras_clave`) VALUES
(5, 60, 'a b c d e f g h i j k '),
(6, 50, 'k k o o u u g j k l u hyi u i');

-- --------------------------------------------------------

--
-- Table structure for table `pruebas_valoracion`
--

CREATE TABLE `pruebas_valoracion` (
  `id` bigint UNSIGNED NOT NULL,
  `respuesta` int NOT NULL,
  `atributo` enum('sabiduria','nobleza','virtud','maldad','audacia') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pruebas_valoracion`
--

INSERT INTO `pruebas_valoracion` (`id`, `respuesta`, `atributo`) VALUES
(9, 3, 'maldad'),
(10, 2, 'audacia'),
(14, 3, 'maldad'),
(19, 3, 'maldad'),
(21, 1, 'nobleza');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('dios','humano','hades') COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `sabiduria` int DEFAULT NULL,
  `nobleza` int DEFAULT NULL,
  `virtud` int DEFAULT NULL,
  `maldad` int DEFAULT NULL,
  `audacia` int DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `activo`, `sabiduria`, `nobleza`, `virtud`, `maldad`, `audacia`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zeus', 'zeus@gmail.com', NULL, '$2y$10$5khRpJers1b3tBwI0iXilOQDBjnkZ4fawsiMm7rc3JKG46MWxeUc2', 'dios', 1, 4, 2, 2, 2, 5, NULL, NULL, '2023-01-29 16:06:07'),
(2, 'Hades', 'hades@gmail.com', NULL, '$2y$10$5khRpJers1b3tBwI0iXilOQDBjnkZ4fawsiMm7rc3JKG46MWxeUc2', 'dios', 1, 5, 4, 4, 4, 2, NULL, NULL, NULL),
(3, 'Poseidón', 'poseidon@gmail.com', NULL, '$2y$10$5khRpJers1b3tBwI0iXilOQDBjnkZ4fawsiMm7rc3JKG46MWxeUc2', 'dios', 1, 5, 4, 2, 2, 5, NULL, NULL, NULL),
(4, 'risto', 'aaaaaa@gmail.com', NULL, '', 'humano', 1, 3, 4, 4, 5, 2, NULL, NULL, NULL),
(5, 'juan', 'juan@gmail.com', NULL, '$2y$10$5khRpJers1b3tBwI0iXilOQDBjnkZ4fawsiMm7rc3JKG46MWxeUc2', 'humano', 1, 2, 3, 4, 4, 5, NULL, NULL, NULL),
(6, 'cartera', 'cartera@gmail.com', NULL, '', 'humano', 1, 4, 4, 3, 3, 3, NULL, NULL, NULL),
(7, 'sintra', 'sintra@gmail.com', NULL, '', 'humano', 1, 5, 5, 5, 5, 5, NULL, NULL, NULL),
(8, 'yo', 'marioferestevez@gmail.com', NULL, '$2y$10$L8Z2FN.jkd.Fuaaj6oe1S.XdIC8usd14J8//U0zpDKqIhkReCx64a', 'dios', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-22 19:53:25', '2023-01-22 19:53:25'),
(9, 'reconocible', 'asdf@gmail.com', NULL, '$2y$10$.89.JbRahOEi4yLfBzIjLuelLTcOux3grA6gb1KfImD1w0LbZpkbq', 'dios', 1, 2, 2, 2, 2, 2, NULL, '2023-01-25 22:40:20', '2023-01-25 22:40:20'),
(11, 'ffffffffffffffffffff', 'assssssssdf@gmail.com', NULL, '$2y$10$zRM0U/bJvDu80.jMpwclTuaJ92wce2jesrV3I/BvVO4AKFHZcEM2a', 'dios', 1, 3, 3, 2, 1, 3, NULL, '2023-01-29 19:53:21', '2023-01-29 19:53:21'),
(14, 'oioioioioi', 'asssssssssssdf@gmail.com', NULL, '$2y$10$Bn7mC7yetnCDV1Na5U1gPe050p6zHqwP0/2.44CG.yRpRX0M4zj7.', 'dios', 1, 4, 5, 1, 2, 3, NULL, '2023-01-29 20:06:05', '2023-01-29 20:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `usr_mensaje`
--

CREATE TABLE `usr_mensaje` (
  `id_env` bigint UNSIGNED NOT NULL,
  `id_dest` bigint UNSIGNED NOT NULL,
  `id_mensaje` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usr_mensaje`
--

INSERT INTO `usr_mensaje` (`id_env`, `id_dest`, `id_mensaje`, `created_at`, `updated_at`) VALUES
(2, 1, 12, NULL, NULL),
(1, 2, 1, NULL, NULL),
(3, 2, 5, NULL, NULL),
(3, 2, 6, NULL, NULL),
(3, 2, 7, NULL, NULL),
(1, 3, 1, NULL, NULL),
(1, 3, 2, NULL, NULL),
(2, 3, 3, NULL, NULL),
(2, 3, 4, NULL, NULL),
(2, 3, 12, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `humanos`
--
ALTER TABLE `humanos`
  ADD PRIMARY KEY (`id_humano`);

--
-- Indexes for table `humano_prueba`
--
ALTER TABLE `humano_prueba`
  ADD PRIMARY KEY (`id_humano`,`id_prueba`);

--
-- Indexes for table `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parametros_generales`
--
ALTER TABLE `parametros_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pruebas_eleccion`
--
ALTER TABLE `pruebas_eleccion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pruebas_oraculo`
--
ALTER TABLE `pruebas_oraculo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pruebas_puntuales`
--
ALTER TABLE `pruebas_puntuales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pruebas_resp_libre`
--
ALTER TABLE `pruebas_resp_libre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pruebas_valoracion`
--
ALTER TABLE `pruebas_valoracion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usr_mensaje`
--
ALTER TABLE `usr_mensaje`
  ADD PRIMARY KEY (`id_dest`,`id_mensaje`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `parametros_generales`
--
ALTER TABLE `parametros_generales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `pruebas`
--
ALTER TABLE `pruebas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
