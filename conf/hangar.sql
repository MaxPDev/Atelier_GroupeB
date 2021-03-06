-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 08 nov. 2021 à 15:02
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Hangar`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'vegetables', 'Incidunt sint similique aut. Qui consequatur dolorem autem magnam officia sint. Minus corrupti impedit amet perspiciatis qui nihil similique assumenda. Rerum nulla libero quidem ab ab ratione animi.'),
(2, 'fruits', 'Reiciendis saepe reprehenderit eos mollitia fugiat cupiditate. Voluptas qui voluptatem nulla et est ut culpa. Id ut tempora aut sint.'),
(3, 'spices', 'Et exercitationem quaerat eaque est cumque. Saepe est quo ea. Quis nemo non sapiente consequatur. Voluptatem mollitia recusandae sed atque et est enim nemo.'),
(4, 'other', 'Saepe sit sequi ea quae. Esse dolor libero voluptas. Nam eos esse velit quas corporis occaecati. Corrupti ut voluptatem aspernatur velit id vitae occaecati.'),
(5, 'lorem', 'Sed veniam nobis aut. Ratione error officia harum et vitae nihil. Velit rerum quis ipsum impedit. Aperiam sed et quibusdam.');

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

CREATE TABLE `manager` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `cooperation_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `manager`
--

INSERT INTO `manager` (`id`, `id_user`, `cooperation_name`) VALUES
(1, 1, 'LeHanger Corporations'),
(2, 2, 'LeHanger Corporations');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `name`, `mail`, `phone`, `status`, `place`, `created_at`, `updated_at`) VALUES
('1080901668', 'odit', 'amelia37@example.org', '186-750-3400x67859', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1129784005', 'dolores', 'reymundo17@example.net', '563-159-5969x35314', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1162599804', 'illum', 'annie81@example.org', '(012)414-0368', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1163993588', 'natus', 'blair38@example.net', '475-548-3956x4771', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1181892209', 'vel', 'alueilwitz@example.com', '1-924-322-5056', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 13:02:16'),
('1185351490', 'dolores', 'eleanora.considine@example.net', '04360430467', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1206435501', 'nobis', 'howe.edgardo@example.net', '(113)726-1454', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1219327142', 'voluptates', 'ifahey@example.org', '(197)524-9901x725', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1237429351', 'ipsum', 'zula28@example.net', '+85(3)5745018160', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1280071483', 'aliquam', 'prosacco.corene@example.net', '(653)198-9312', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1404145870', 'est', 'hane.mackenzie@example.com', '739.538.3277', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1409219578', 'aliquam', 'jerel78@example.com', '(175)042-0097', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1504886671', 'sapiente', 'jameson.koch@example.org', '(782)616-5081', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1511794963', 'voluptatibus', 'zfritsch@example.net', '(020)490-2433x62818', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('155697529', 'molestiae', 'sven35@example.com', '366-642-1198x186', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1569947801', 'est', 'leslie.deckow@example.net', '519-087-1426', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1633747987', 'ut', 'khermiston@example.org', '(948)203-8433x0814', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('175144220', 'consequatur', 'rohan.alva@example.com', '(151)863-8957x848', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 12:16:48'),
('339711842', 'qui', 'pbauch@example.net', '1-719-587-6910x55189', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('34873020', 'accusantium', 'luettgen.scottie@example.org', '+51(9)4747721190', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('400666845', 'accusamus', 'ggislason@example.com', '1-981-780-3647x35275', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('549067010', 'rem', 'bashirian.alba@example.net', '1-182-446-4037x217', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('655269312', 'tenetur', 'dfahey@example.org', '+24(1)8887140971', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('793809478', 'id', 'corene04@example.org', '1-163-930-4713', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('80776083', 'quod', 'koch.eliza@example.com', '(434)086-9026x78495', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('821988499', 'sunt', 'mason94@example.org', '(695)327-0876x3356', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('876274616', 'harum', 'fgrant@example.net', '1-182-062-7350x543', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('893472356', 'ipsa', 'cgleason@example.com', '1-666-953-3449', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44');

-- --------------------------------------------------------

--
-- Structure de la table `producer`
--

CREATE TABLE `producer` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `siret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `producer`
--

INSERT INTO `producer` (`id`, `id_user`, `location`, `siret`) VALUES
(3, 3, '134 Miller Junction\nGilberthaven, PA 48720', '147633000'),
(4, 4, '60569 Orn Burg Apt. 570\nWest Ovasid_usere, MO 82094', '29423333'),
(5, 5, '8861 Pouros Brid_userge Suite 515\nNew Walkerbury, SD 35858-9284', '50'),
(6, 6, '32021 Schamberger Place Suite 575\nEast Kassandrasid_usere, MD 34667-3499', '221816'),
(7, 7, '1958 Mitchell Mission Apt. 289\nSouth Prince, OH 21107', '7'),
(8, 8, '25040 McLaughlin Plain\nEast Shaun, KS 79061', '384945'),
(9, 9, '690 Mueller Brook\nToyport, WV 86043-6237', ''),
(10, 10, '938 Ashtyn Pass\nWest Jillian, NV 90893-4820', '46810'),
(11, 11, '3528 Brenda Extension\nCathrinemouth, AR 58960-3311', '63504606'),
(12, 12, '705 Estel Parkways\nDamarismouth, SD 08505-0852', '1');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `img_url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` int NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `id_category` int NOT NULL,
  `id_producer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `img_url`, `name`, `description`, `unit_price`, `availability`, `id_category`, `id_producer`) VALUES
(3, 'https://nutritionadvance.com/wp-content/uploads/2018/01/several-fresh-carrots-with-intact-green-stems.jpg', 'Carrots 500g', 'Ut fuga est eos reprehenderit error. Ipsa nemo est odit in et quos tenetur sint. Est nostrum incidunt quo ut temporibus. Blanditiis vel tempora tenetur.', 3, 1, 1, 3),
(4, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic 500g', 'Voluptas cum in qui reiciendis. Recusandae rerum velit officia ut est quis. Tenetur temporibus est at voluptatem magnam. Deleniti porro ipsum dignissimos id dicta ullam animi quod. Quibusdam officiis perferendis maiores animi.', 5, 1, 1, 4),
(5, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes 500g', 'Illo temporibus enim tempore a delectus consequuntur nihil. Ut natus odit enim autem aut dolorum. Rerum quae dolore incidunt dolores.', 3, 0, 1, 5),
(11, 'https://images.freeimages.com/images/large-previews/c58/ananas-1-1522721.jpg', 'ananas 1', 'Corrupti et nemo ducimus eos quam qui necessitatibus. Molestias modi omnis recusandae possimus. Aut et libero ullam hic deserunt laborum accusantium.', 3, 1, 2, 11),
(12, 'https://images.freeimages.com/images/large-previews/8e1/orange-1524171.jpg', 'Orange 500g', 'Omnis et eius quo accusantium debitis et eligendi numquam. Non veritatis quas repudiandae cum. Voluptates sed recusandae facilis sunt voluptatem. Sapiente voluptas aut voluptatum et minima.', 4, 1, 2, 12),
(15, 'https://images.freeimages.com/images/large-previews/5c6/at-the-market-serie-potatoes-1538685.jpg', 'Peaches 500g', 'Consequatur provident exercitationem ut nihil quasi excepturi. Quis cum dolores tempora consequuntur. Dolorem amet maxime commodi in aut. Illum a omnis doloribus recusandae natus repellendus.', 5, 1, 2, 3),
(23, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/fresh-yellow-onions.jpg', 'Onions 250g', 'Non quidem accusamus asperiores iste aliquam eum. Et eos quia quia autem porro sint quasi. Nihil dolores error provident illo similique et consequatur velit.', 3, 0, 1, 11),
(24, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-and-sliced-eggplant-aubergine.jpg', 'Eggplant 1', 'Excepturi ipsum cupiditate impedit quae porro beatae nihil. Alias nihil saepe nemo est. Voluptatem voluptatem adipisci distinctio autem quisquam enim. Ut aliquid veniam voluptatem asperiores odio voluptatum commodi.', 3, 0, 1, 12),
(31, 'https://nutritionadvance.com/wp-content/uploads/2018/01/several-fresh-carrots-with-intact-green-stems.jpg', 'Carrots 500g', 'Et dolorem quod ut facere qui consectetur. Sequi eius optio aliquam aut hic aut ut. Sit ducimus accusamus iste quae totam cum. Soluta unde nostrum sequi occaecati temporibus sit ut. Maiores et numquam assumenda non deleniti.', 3, 0, 1, 7),
(32, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/red-radishes-and-their-leaves-in-a-basket.jpg', 'Radish 500g', 'Recusandae vitae aut vel placeat quo aut. Unde et eaque deserunt autem beatae totam natus. Ad itaque et ullam rem autem eaque. Nulla odio nisi minus vitae in voluptates voluptate nobis.', 3, 0, 1, 8),
(34, 'https://images.freeimages.com/images/large-previews/198/peaches-1466922.jpg', 'Peaches 1kg', 'Rerum excepturi ut est aut qui quo praesentium. Magni qui voluptas aliquid eos officia labore. Hic ad distinctio quia ut porro inventore. Et nam aperiam odio ut aliquam voluptatum.', 7, 0, 2, 10),
(35, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-and-sliced-eggplant-aubergine.jpg', 'Eggplant 2', 'Nihil maiores nemo voluptate laudantium. Et aspernatur odit quis dolor in magnam. Atque qui reprehenderit qui nisi repellat facere. Repellat expedita maiores et nobis nulla odit.', 3, 0, 1, 11),
(42, 'https://www.owimio.com/wp-content/uploads/2021/02/pumpkin-health-benefits-nutrition-facts.jpg', 'Pumpkin 1', 'Eos magnam sapiente repellat sed labore tempora. Eos consectetur impedit placeat est iusto ullam perspiciatis. Odit rerum aperiam aliquid voluptatem et.', 3, 1, 1, 6),
(43, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/fresh-yellow-onions.jpg', 'Onions 250g', 'Non occaecati animi magni dolores. Omnis autem exercitationem cumque error. Dicta sint accusamus accusantium.', 2, 0, 1, 7),
(45, 'https://images.freeimages.com/images/large-previews/198/peaches-1466922.jpg', 'Peaches 500g', 'Minima aut dolorum porro. Dolor ipsa tempore fugiat sequi soluta rerum.', 3, 0, 2, 9),
(52, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/healthy-champignon-mushrooms.jpg', 'Mushrooms', 'Dolorem labore ullam ea consectetur debitis accusamus consequatur sint. Fugiat aperiam nostrum repudiandae magni rem. Et laborum nihil culpa.', 3, 1, 1, 4),
(53, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes 1kg', 'Culpa perspiciatis dolorem inventore in. Ad deserunt quaerat ducimus laboriosam. Ducimus et ut voluptatum quia sed. Voluptatem ipsa et sunt quia quasi fugit labore.', 5, 0, 1, 5),
(55, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic 200g', 'A aut magni ut commodi necessitatibus. Et assumenda voluptas inventore. Et iste porro excepturi autem.', 2, 1, 1, 7),
(64, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-green-cabbage-cut-into-pieces.jpg', 'Cabbage 1kg', 'Inventore esse incidunt est velit dolores ut voluptatum. Libero et enim eaque natus maiores autem.', 3, 1, 4, 4),
(71, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-green-cabbage-cut-into-pieces.jpg', 'Cabbage 500g', 'Unde praesentium iste vero qui aliquid alias enim aperiam. Voluptate consequatur tempora numquam sapiente ipsa quidem. Cum tempora voluptates a ducimus quo eaque. Assumenda aut voluptatem natus voluptatem repellendus exercitationem unde.', 3, 0, 1, 11),
(81, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/red-radishes-and-their-leaves-in-a-basket.jpg', 'Radish 500g', 'Sed sit tempore esse labore. Et odio commodi fuga natus ut. Corporis possimus enim dolorem non dolorum fugiat.', 3, 1, 1, 9),
(82, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes 1kg', 'Et minus impedit ipsam quis natus nihil. Incidunt occaecati omnis necessitatibus cumque. A ut ea illo voluptatem deserunt quam.', 6, 0, 1, 10),
(84, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic 250g', 'Velit quidem neque sit quos modi. Tempore est maxime enim. Non quia tempore quaerat vitae tempore soluta quisquam voluptas. Est enim quibusdam similique possimus aut.', 3, 1, 1, 12),
(92, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/healthy-champignon-mushrooms.jpg', 'Mushrooms 500g', 'Voluptatum reprehenderit voluptatem veniam ea. Porro est rerum veritatis voluptas illo. Temporibus voluptatem non ut qui pariatur et facere dolor.', 2, 1, 1, 8),
(95, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic 250', 'Velit doloribus rerum iusto. Odit recusandae sit minima. Veniam sunt voluptate sint soluta possimus vel. Odio officia aperiam porro et et rerum voluptatem.', 2, 0, 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `quantity`
--

CREATE TABLE `quantity` (
  `id` int NOT NULL,
  `id_product` int NOT NULL,
  `id_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `quantity`
--

INSERT INTO `quantity` (`id`, `id_product`, `id_order`, `quantity`) VALUES
(1, 3, '1129784005', 4),
(2, 4, '1162599804', 2),
(3, 4, '1185351490', 3),
(4, 5, '1163993588', 3),
(5, 12, '1237429351', 4),
(6, 15, '1280071483', 4),
(7, 23, '1404145870', 1),
(8, 24, '1080901668', 3),
(9, 24, '1219327142', 9),
(10, 24, '1409219578', 2),
(11, 31, '1504886671', 2),
(12, 32, '1511794963', 2),
(13, 34, '155697529', 4),
(14, 35, '1569947801', 5),
(15, 42, '1633747987', 2),
(16, 45, '175144220', 5),
(17, 52, '339711842', 2),
(18, 53, '34873020', 4),
(19, 55, '400666845', 1),
(20, 64, '1206435501', 1),
(21, 64, '549067010', 3),
(22, 71, '655269312', 1),
(23, 81, '793809478', 5),
(24, 82, '80776083', 4),
(25, 84, '821988499', 2),
(26, 92, '1181892209', 2),
(27, 92, '876274616', 3),
(28, 95, '893472356', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `mail`, `password`) VALUES
(1, 'Lucas Monty\r\n', '+33334509230\r\n\r\n', 'derek83@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(2, 'Vivienne Cartier\r\n', '+33258827624\r\n\r\n', 'manager@manager.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(3, 'Cheney Loiselle', '+33366325915\r\n\r\n', 'madie.nikolaus@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(4, 'Fitz Marchesseault', '+33344335619\r\n\r\n', 'producer@producer.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(5, 'Florismart Mailly', '+33533721657\r\n\r\n', 'kuhlman.stacey@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(6, 'Jeanette Despins', '+33362222397\r\n\r\n', 'nola78@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(7, 'Chandler Ricard', '+33417510746\r\n\r\n', 'leilani.schaden@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(8, 'Joseph Laprise', '+33177864078\r\n\r\n', 'maryam36@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(9, 'Avril Senneville\r\n', '+33456109340\r\n\r\n', 'savanah.rath@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(10, 'Noémi Lespérance\r\n', '+33518298981\r\n\r\n', 'estefania11@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(11, 'Fauna Laliberté\r\n', '+33588315159\r\n\r\n', 'leffler.dennis@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(12, 'Sumner Houle\r\n', '+33529226742\r\n\r\n', 'billy.glover@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_user_FK` (`id_user`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producer_user_FK` (`id_user`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_FK` (`id_category`),
  ADD KEY `product_producer_FK` (`id_producer`);

--
-- Index pour la table `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quantite_order_FK` (`id_order`),
  ADD KEY `quantite_product_FK` (`id_product`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `quantity`
--
ALTER TABLE `quantity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `producer_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_FK` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_producer_FK` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `quantity`
--
ALTER TABLE `quantity`
  ADD CONSTRAINT `quantite_order_FK` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quantite_product_FK` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
