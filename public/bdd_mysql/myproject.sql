-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 16 août 2023 à 08:59
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(6, 2, 'Mon addresse', 'Richard', 'marx', NULL, '154, avenue des soulard', '75104', 'Paris', 'FR', '0105090705');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Collisimo', 'Profitez d\'une livraison premium avec un colis chez vous dans les 72 prochaines heures.', 990),
(2, 'Chronopost', 'Profitez de la livraison express pour être livré le lendemain de votre commande', 1490);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Google'),
(2, 'Iphone'),
(3, 'Samsung'),
(4, 'Xiaomi');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230424161200', '2023-04-24 18:12:09', 74),
('DoctrineMigrations\\Version20230601132718', '2023-06-01 15:28:17', 46),
('DoctrineMigrations\\Version20230605072410', '2023-06-05 09:45:19', 21),
('DoctrineMigrations\\Version20230605081304', '2023-06-05 10:13:16', 89),
('DoctrineMigrations\\Version20230607212927', '2023-06-07 23:29:38', 44),
('DoctrineMigrations\\Version20230618211559', '2023-06-18 23:16:17', 50),
('DoctrineMigrations\\Version20230619114821', '2023-06-19 13:48:26', 39),
('DoctrineMigrations\\Version20230621215652', '2023-06-21 23:57:02', 44),
('DoctrineMigrations\\Version20230622210035', '2023-06-22 23:00:41', 51),
('DoctrineMigrations\\Version20230622212003', '2023-06-22 23:20:07', 17);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(3, 'Nouvelle Collection', 'bienvenue chez nous', 'Découvrir', '/nos-produits', '973e3fe7b30035b8e7275cfb8ef4dd824d3f1edd.jpg'),
(4, 'Collections 2022', 'Nouveaux produits 2022', 'Smartphone', '/nos-produits', 'df78977248cb468e81baf60a98d0bba360e10846.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `state`) VALUES
(1, 2, '2023-06-12 10:49:19', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '', NULL, 0),
(2, 2, '2023-06-18 23:29:09', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '18062023 - 648f772550660', NULL, 0),
(3, 2, '2023-06-18 23:29:56', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '18062023 - 648f7754c5ac1', NULL, 0),
(4, 2, '2023-06-18 23:37:13', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '18062023 - 648f79099d6e5', NULL, 0),
(5, 2, '2023-06-18 23:38:07', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '18062023 - 648f793f029fd', NULL, 0),
(6, 2, '2023-06-18 23:39:15', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '18062023 - 648f798320fde', NULL, 0),
(7, 2, '2023-06-19 08:43:54', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ff92a9b82d', NULL, 0),
(8, 2, '2023-06-19 08:46:10', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ff9b28facd', NULL, 0),
(9, 2, '2023-06-19 08:47:53', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ffa1940ef0', NULL, 0),
(10, 2, '2023-06-19 08:48:34', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ffa422cdcb', NULL, 0),
(11, 2, '2023-06-19 08:49:32', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ffa7c75800', NULL, 0),
(12, 2, '2023-06-19 08:50:44', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023 - 648ffac432ea2', NULL, 0),
(13, 2, '2023-06-19 09:01:42', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-648ffd5623de7', NULL, 0),
(14, 2, '2023-06-19 09:02:29', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-648ffd858fd93', NULL, 0),
(15, 2, '2023-06-19 14:00:41', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-6490436976606', 'cs_test_b17eiRLcn6oMVj357ZzNdRWkpZsAE2CmQP41JjJ9YVlZPXWH4x3ZSk7Yd4', 0),
(16, 2, '2023-06-19 14:28:17', 'Collisimo', 9.9, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-649049e1ad871', 'cs_test_b1wsJLCvSEZx9qqgKZMTPMMnYLnVffQ78yrJzfZJSiQKvPLLE901BZMj4l', 0),
(17, 2, '2023-06-19 14:40:00', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904ca0b01f7', NULL, 0),
(18, 2, '2023-06-19 14:40:36', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904cc4a395f', NULL, 0),
(19, 2, '2023-06-19 14:40:59', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904cdb5e7e5', NULL, 0),
(20, 2, '2023-06-19 14:41:35', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904cffbc5c8', NULL, 0),
(21, 2, '2023-06-19 14:41:54', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904d12c2208', NULL, 0),
(22, 2, '2023-06-19 14:42:40', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904d4001077', NULL, 0),
(23, 2, '2023-06-19 14:43:07', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904d5ba3fa1', NULL, 0),
(24, 2, '2023-06-19 14:43:33', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904d75b0198', NULL, 0),
(25, 2, '2023-06-19 14:44:24', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-64904da867a01', 'cs_test_b1ozMjHHf2xlsmWIbIjdyQIkRVQbL2wLJoJZmKKzRd42eU2BBLW20Jhkie', 0),
(26, 2, '2023-06-19 23:33:48', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-6490c9bcaa56b', NULL, 0),
(27, 2, '2023-06-19 23:35:43', 'Chronopost', 1490, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '19062023-6490ca2fb69fc', NULL, 0),
(28, 2, '2023-06-22 00:15:29', 'Collisimo', 990, 'Richard marx<br/>0105090705<br/>154, avenue des soulard<br/>75104 Paris<br/>FR', '22062023-6493768153626', 'cs_test_b1uw3wm9S4XRbOkfeGLvJ51hkJPuA3WCc2FYssCWHj8snT861cjX7C3ETE', 3);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Google Pixel 6A', 1, 33400, 33400),
(2, 1, 'Rednote 11', 1, 15900, 15900),
(3, 2, 'Google Pixel 6A', 1, 33400, 33400),
(4, 2, 'Samsung a53', 1, 45900, 45900),
(5, 2, 'Rednote 11', 1, 15900, 15900),
(6, 2, 'Samsung A33', 1, 37900, 37900),
(7, 2, 'Iphone 14', 1, 86200, 86200),
(8, 3, 'Google Pixel 6A', 1, 33400, 33400),
(9, 3, 'Samsung a53', 1, 45900, 45900),
(10, 3, 'Rednote 11', 1, 15900, 15900),
(11, 3, 'Samsung A33', 1, 37900, 37900),
(12, 3, 'Iphone 14', 1, 86200, 86200),
(13, 4, 'Google Pixel 6A', 1, 33400, 33400),
(14, 4, 'Samsung a53', 1, 45900, 45900),
(15, 4, 'Rednote 11', 1, 15900, 15900),
(16, 4, 'Samsung A33', 1, 37900, 37900),
(17, 4, 'Iphone 14', 1, 86200, 86200),
(18, 5, 'Google Pixel 6A', 1, 33400, 33400),
(19, 5, 'Samsung a53', 1, 45900, 45900),
(20, 5, 'Rednote 11', 1, 15900, 15900),
(21, 5, 'Samsung A33', 1, 37900, 37900),
(22, 5, 'Iphone 14', 1, 86200, 86200),
(23, 6, 'Google Pixel 6A', 1, 33400, 33400),
(24, 6, 'Samsung a53', 1, 45900, 45900),
(25, 6, 'Rednote 11', 1, 15900, 15900),
(26, 6, 'Samsung A33', 1, 37900, 37900),
(27, 6, 'Iphone 14', 1, 86200, 86200),
(28, 7, 'Google Pixel 6A', 1, 33400, 33400),
(29, 7, 'Iphone 14', 1, 86200, 86200),
(30, 7, 'Samsung A33', 1, 37900, 37900),
(31, 7, 'Samsung a53', 1, 45900, 45900),
(32, 7, 'Iphone 13', 1, 79900, 79900),
(33, 8, 'Google Pixel 6A', 1, 33400, 33400),
(34, 8, 'Iphone 14', 1, 86200, 86200),
(35, 8, 'Samsung A33', 1, 37900, 37900),
(36, 8, 'Samsung a53', 1, 45900, 45900),
(37, 8, 'Iphone 13', 1, 79900, 79900),
(38, 9, 'Google Pixel 6A', 1, 33400, 33400),
(39, 9, 'Iphone 14', 1, 86200, 86200),
(40, 9, 'Samsung A33', 1, 37900, 37900),
(41, 9, 'Samsung a53', 1, 45900, 45900),
(42, 9, 'Iphone 13', 1, 79900, 79900),
(43, 10, 'Google Pixel 6A', 1, 33400, 33400),
(44, 10, 'Iphone 14', 1, 86200, 86200),
(45, 10, 'Samsung A33', 1, 37900, 37900),
(46, 10, 'Samsung a53', 1, 45900, 45900),
(47, 10, 'Iphone 13', 1, 79900, 79900),
(48, 11, 'Google Pixel 6A', 1, 33400, 33400),
(49, 11, 'Iphone 14', 1, 86200, 86200),
(50, 11, 'Samsung A33', 1, 37900, 37900),
(51, 11, 'Samsung a53', 1, 45900, 45900),
(52, 11, 'Iphone 13', 1, 79900, 79900),
(53, 12, 'Google Pixel 6A', 1, 33400, 33400),
(54, 12, 'Iphone 14', 1, 86200, 86200),
(55, 12, 'Samsung A33', 1, 37900, 37900),
(56, 12, 'Samsung a53', 1, 45900, 45900),
(57, 12, 'Iphone 13', 1, 79900, 79900),
(58, 13, 'Google Pixel 6A', 1, 33400, 33400),
(59, 13, 'Iphone 14', 1, 86200, 86200),
(60, 13, 'Samsung A33', 1, 37900, 37900),
(61, 13, 'Samsung a53', 1, 45900, 45900),
(62, 13, 'Iphone 13', 1, 79900, 79900),
(63, 14, 'Google Pixel 6A', 1, 33400, 33400),
(64, 14, 'Iphone 14', 1, 86200, 86200),
(65, 14, 'Samsung A33', 1, 37900, 37900),
(66, 14, 'Samsung a53', 1, 45900, 45900),
(67, 14, 'Iphone 13', 1, 79900, 79900),
(68, 15, 'Google Pixel 6A', 1, 33400, 33400),
(69, 16, 'Google Pixel 6A', 1, 33400, 33400),
(70, 17, 'Rednote 11', 1, 15900, 15900),
(71, 18, 'Rednote 11', 1, 15900, 15900),
(72, 19, 'Rednote 11', 1, 15900, 15900),
(73, 20, 'Rednote 11', 1, 15900, 15900),
(74, 21, 'Rednote 11', 1, 15900, 15900),
(75, 22, 'Rednote 11', 1, 15900, 15900),
(76, 23, 'Rednote 11', 1, 15900, 15900),
(77, 24, 'Rednote 11', 1, 15900, 15900),
(78, 25, 'Rednote 11', 1, 15900, 15900),
(79, 26, 'Google Pixel 6A', 1, 33400, 33400),
(80, 26, 'Samsung A33', 1, 37900, 37900),
(81, 27, 'Google Pixel 6A', 1, 33400, 33400),
(82, 27, 'Samsung A33', 1, 37900, 37900),
(83, 28, 'Samsung a53', 1, 45900, 45900);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `is_best`) VALUES
(1, 1, 'Google Pixel 6A', 'google-pixel-6a', 'e19750844987529caddbb8e6f11607aecb2e5072.jpg', 'Google Pixel 6a – Smartphone Android 5G', 'En plus du Pixel 7, de la Google Pixel Watch, des Pixel Buds Pro et d\'un teasing de Pixel Tablet, la Google I/O a été l\'occasion pour Google de lever le voile sur son Pixel 6a. Rentrons tout de suite dans le vif du sujet avec les caractéristiques attendues du téléphone. Premièrement, on remarque que l’écran de 6,1 pouces (Full HD+) est plus petit que celui du Pixel 6, qui a droit à une diagonale de 6,4 pouces. Au niveau du design, la philosophie globale reste la même.', 33400, 1),
(2, 2, 'Iphone 14', 'iphone-14', 'e2bfe9c4ad2d5d8a67da99c56daf16ec9ebfa701.jpg', 'En 2022, la gamme iPhone 14 se compose de quatre modèles : iPhone 14, iPhone 14 Plus, iPhone 14 Pro, iPhone 14 Pro Max.', 'Malgré l\'augmentation significative du prix des iPhone 14 Pro, font un véritable carton depuis leur lancement. À tel point que de nombreux utilisateurs de Galaxy S22 Ultra ont vendu leurs smartphones pour se les offrir. Cela dit, la faible demande pour les iPhone 14 et 14 Plus a poussé Apple à réduire leur production. En décembre 2022, on considère que les iPhone 14 et iPhone 14 Plus ne comptent que pour 36 % des ventes annuelles d\'iPhone. Les ventes ont ensuite beaucoup chuté au début de l\'année 2023, poussant Apple à appliquer d\'importantes promotions sur ses smartphones dans certains pays.', 86200, 1),
(3, 3, 'Samsung A33', 'samsung-a33', '6c4d2ed1304ba7e1d17055cb107fc7da01657a71.jpg', 'La série A de Samsung est probablement l\'une des plus populaires au monde.', 'Le Samsung Galaxy A33 est un modèle milieu de gamme équipé d\'un écran Super AMOLED de 6.4 pouces avec un taux de rafraîchissement de 90 Hz, animé par un SoC Samsung Exynos 1280 (compatible 5G), couplé à 6 Go de RAM et 128 Go de stockage. Il possède quatre capteurs photo à l\'arrière : un grand-angle de 50 mégapixels (munie d\'une fonction de stabilisation optique), un ultra grand-angle de 8 mégapixels, un objectif macro de 5 mégapixels et un capteur de profondeur de 2 mégapixels. Il a une batterie de 5000 mAh compatible charge rapide (25 W) et il est certifié IP67.', 37900, 1),
(4, 3, 'Samsung a53', 'samsung-a53', '03508188ce8726804be5f3e85c64b593574cb5cb.jpg', 'Le Samsung Galaxy A53 a l\'ambition de s\'imposer sur le milieu de gamme.', 'Le Samsung Galaxy A53 est un solide choix de milieu de gamme. Il a pour lui de très sérieux arguments : les quatre mises à jour majeures, un écran qui ne dénoterait pas sur du haut de gamme, un design agréable et robuste et une autonomie jusqu\'à deux jours (que nous avons pu éprouver). C\'est le smartphone parfait pour quiconque cherche un fidèle destrier pour l\'accompagner au quotidien.', 45900, 0),
(5, 4, 'Rednote 11', 'rednote-11', '5cf3837cc8fb168dea7afa01d078fefc80ecb1b6.jpg', 'Le Xiaomi Redmi Note 11 est l\'un des 4 smartphones de la gamme Note 11 de Xiaomi Redmi.', 'Il se positionne comme une version plus accessible du Redmi Note 11 5G avec un SoC Qualcomm Snapdragon 680 4G épaulé par 4 Go ou 6 Go de RAM et 64 ou 128 Go de stockage, un écran AMOLED de 6,43 pouces 90Hz et un module photo polyvalent avec un capteur principal de 50 mégapixels. Il dispose également d\'une batterie de 5000 mAh compatible recharge rapide 33W.', 15900, 0),
(6, 2, 'Iphone 13', 'iphone-13', 'c73440e33f3611ca6844b11df46e5150eaf6f7c7.jpg', 'L\'iPhone 13, annoncé le 14 septembre 2021, est le modèle central de la 15e itération du smartphone d\'Apple', 'Il est équipé d\'un écran OLED de 6,1 pouces 60 Hz, d\'un SoC Apple A15 Bionic compatible 5G (NR & Sub-6) et d\'un double capteur photo de 12+12 mégapixels (grand-angle et ultra grand-angle) avec OIS.', 79900, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'john@doe.fr', '[]', 'john', 'john', 'doe'),
(2, 'richard@marx.fr', '[\"ROLE_ADMIN\"]', '$2y$13$/TL8hHJv8ZjaiLXa9N7wqusCwHNrfz71swWXBLC6MO2u5TYHrLXCO', 'richard', 'marx');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
