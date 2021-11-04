-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 04 nov. 2021 à 17:49
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'excepturi', 'Incidunt sint similique aut. Qui consequatur dolorem autem magnam officia sint. Minus corrupti impedit amet perspiciatis qui nihil similique assumenda. Rerum nulla libero quidem ab ab ratione animi.'),
(2, 'qui', 'Reiciendis saepe reprehenderit eos mollitia fugiat cupiditate. Voluptas qui voluptatem nulla et est ut culpa. Id ut tempora aut sint.'),
(3, 'sit', 'Et exercitationem quaerat eaque est cumque. Saepe est quo ea. Quis nemo non sapiente consequatur. Voluptatem mollitia recusandae sed atque et est enim nemo.'),
(4, 'autem', 'Saepe sit sequi ea quae. Esse dolor libero voluptas. Nam eos esse velit quas corporis occaecati. Corrupti ut voluptatem aspernatur velit id vitae occaecati.'),
(5, 'cum', 'Sed veniam nobis aut. Ratione error officia harum et vitae nihil. Velit rerum quis ipsum impedit. Aperiam sed et quibusdam.'),
(6, 'exercitationem', 'Dolores id illum ut quo repellat sequi voluptatem fuga. Quis est ut atque voluptatum recusandae repellat praesentium. Quae perferendis tempora aliquam enim temporibus. Esse quam commodi delectus nisi ut. Consequatur numquam voluptas quos consequatur facilis at.'),
(7, 'aut', 'Et nobis soluta aut velit ea ratione mollitia. Placeat iure ratione quisquam. Quidem amet debitis nemo aspernatur ut laboriosam aperiam.'),
(8, 'et', 'Consequatur et et quisquam sit nihil officia exercitationem. Voluptas vero earum et in. Facilis ut modi sequi commodi corporis rerum facere. Consequatur est ullam possimus qui nobis sunt et quas.'),
(9, 'dolores', 'Voluptas a consectetur vero eligendi et id impedit. Repudiandae mollitia consectetur quia quo aut ut sed. Reprehenderit sunt magni deserunt ipsam ab rerum eos nesciunt. Qui deserunt et amet dolorum temporibus iusto.'),
(10, 'dolor', 'Sapiente quibusdam qui alias sint dolorem. Ipsum dolorem amet molestias et. Excepturi perferendis perferendis doloremque ab perspiciatis qui quis fuga.');

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

CREATE TABLE `manager` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `cooperation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `name`, `mail`, `phone`, `status`, `place`, `created_at`, `updated_at`) VALUES
('1065685370', 'quidem', 'torey13@example.org', '1-156-697-7885', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1080901668', 'odit', 'amelia37@example.org', '186-750-3400x67859', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1129784005', 'dolores', 'reymundo17@example.net', '563-159-5969x35314', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1162599804', 'illum', 'annie81@example.org', '(012)414-0368', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1163993588', 'natus', 'blair38@example.net', '475-548-3956x4771', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1181892209', 'vel', 'alueilwitz@example.com', '1-924-322-5056', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1185351490', 'dolores', 'eleanora.considine@example.net', '04360430467', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1206435501', 'nobis', 'howe.edgardo@example.net', '(113)726-1454', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1219327142', 'voluptates', 'ifahey@example.org', '(197)524-9901x725', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('122139421', 'quae', 'zula28@example.net', '156.918.1428x4373', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1223667841', 'recusandae', 'zula28@example.net', '698-628-1395x571', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1237429351', 'ipsum', 'zula28@example.net', '+85(3)5745018160', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1238777359', 'quibusdam', 'luis.dietrich@example.com', '05935577144', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1240730423', 'quis', 'felicia07@example.net', '+04(8)7574571605', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1280071483', 'aliquam', 'prosacco.corene@example.net', '(653)198-9312', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1305560941', 'a', 'mo\'keefe@example.net', '719.152.2764', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1316936126', 'nihil', 'blanda.olin@example.org', '915.533.9456x68843', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1327248741', 'est', 'nraynor@example.org', '+88(5)4661661387', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1359149874', 'fuga', 'amy40@example.org', '1-070-600-8320', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1359889299', 'tempore', 'witting.henry@example.net', '873.865.2402', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1361247100', 'aut', 'gjenkins@example.org', '1-410-482-1663', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1402963805', 'ab', 'wilton18@example.net', '139-843-0228', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1404145870', 'est', 'hane.mackenzie@example.com', '739.538.3277', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1409219578', 'aliquam', 'jerel78@example.com', '(175)042-0097', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1412131742', 'voluptatem', 'schaefer.glenda@example.net', '1-259-251-2279', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1431717743', 'reiciendis', 'hershel.schamberger@example.com', '+39(0)6030622625', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1433203083', 'vero', 'adams.arnold@example.org', '744.913.9901', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1450124659', 'expedita', 'vidal.cronin@example.net', '+81(9)4667311627', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1473858198', 'eius', 'elissa.wunsch@example.org', '239.282.8111x466', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1480247930', 'similique', 'haylee88@example.net', '511.767.4812x068', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1504886671', 'sapiente', 'jameson.koch@example.org', '(782)616-5081', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1511794963', 'voluptatibus', 'zfritsch@example.net', '(020)490-2433x62818', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1514759036', 'velit', 'heather.welch@example.net', '(888)446-0539x7770', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('155697529', 'molestiae', 'sven35@example.com', '366-642-1198x186', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1569947801', 'est', 'leslie.deckow@example.net', '519-087-1426', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1579549381', 'sed', 'tito09@example.com', '945-722-6643x91179', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1583689980', 'ipsa', 'qhansen@example.org', '769-589-6841', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('158606298', 'quo', 'elaina94@example.org', '038.139.4342x0995', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1611622425', 'magni', 'adams.jalen@example.net', '386-502-7188', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1613824065', 'sequi', 'o\'conner.jennifer@example.org', '1-832-285-5587x1430', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('162169803', 'et', 'gwisozk@example.net', '1-180-687-3158', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1633747987', 'ut', 'khermiston@example.org', '(948)203-8433x0814', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('170440443', 'sunt', 'mavis.o\'kon@example.org', '190-009-2869x51627', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('170521408', 'natus', 'roberta.rowe@example.org', '426.866.9832', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('175144220', 'consequatur', 'rohan.alva@example.com', '(151)863-8957x848', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('208555260', 'voluptas', 'albina56@example.org', '1-110-254-0887', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('210305936', 'facilis', 'cbotsford@example.org', '1-545-549-8353x192', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('270316660', 'qui', 'grayson81@example.net', '04876277290', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('29127819', 'sint', 'vleuschke@example.org', '329.163.4392x272', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('298089406', 'veritatis', 'qreichel@example.com', '1-735-116-8942', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('306620562', 'sequi', 'jamir59@example.org', '(296)708-8704', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('339711842', 'qui', 'pbauch@example.net', '1-719-587-6910x55189', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('34873020', 'accusantium', 'luettgen.scottie@example.org', '+51(9)4747721190', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('383694357', 'qui', 'shammes@example.org', '299.664.3160', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('400666845', 'accusamus', 'ggislason@example.com', '1-981-780-3647x35275', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('436497471', 'animi', 'katrine.koch@example.net', '1-694-071-6093x184', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('438873583', 'atque', 'ruecker.angus@example.org', '1-400-060-5643x9989', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('447151927', 'quia', 'ystark@example.com', '428.852.1713', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('482915728', 'alias', 'ecruickshank@example.net', '1-559-847-1894x97366', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('482925689', 'sed', 'cronin.vincenza@example.net', '224-530-6970x021', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('499644667', 'beatae', 'eloise.bailey@example.com', '1-113-116-5992x67119', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('506352560', 'placeat', 'rmurray@example.org', '855.976.5572', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('524992146', 'illo', 'mpacocha@example.org', '01237265341', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('549067010', 'rem', 'bashirian.alba@example.net', '1-182-446-4037x217', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('572033833', 'aut', 'marquardt.orval@example.org', '1-401-355-2781', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('572886342', 'molestiae', 'annalise.schuster@example.net', '1-771-505-9740x352', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('585267866', 'itaque', 'lueilwitz.antwon@example.com', '(560)794-1079', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('642360378', 'doloribus', 'zfahey@example.org', '1-844-137-4863', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('645565391', 'et', 'vcummerata@example.org', '229.230.4860x703', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('654667563', 'sint', 'weissnat.soledad@example.com', '245.052.7694x505', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('655269312', 'tenetur', 'dfahey@example.org', '+24(1)8887140971', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('660517746', 'corporis', 'abshire.johnpaul@example.net', '620-362-2442', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('665437040', 'nobis', 'alejandrin78@example.net', '02668010211', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('672018066', 'commodi', 'sadye46@example.com', '1-741-843-2378x31683', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('681677560', 'corrupti', 'rosemary96@example.org', '1-203-925-1368x983', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('701125026', 'animi', 'bgutkowski@example.org', '1-458-626-7017x388', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('708913432', 'ea', 'toy.jude@example.org', '1-981-984-0874', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('726674547', 'aliquam', 'keyshawn.bode@example.net', '732-055-1243', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('755217798', 'qui', 'carlie14@example.org', '895-491-4161x5257', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('775418294', 'id', 'hmueller@example.com', '604.463.0412x122', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('793809478', 'id', 'corene04@example.org', '1-163-930-4713', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('80776083', 'quod', 'koch.eliza@example.com', '(434)086-9026x78495', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('819151596', 'cupiditate', 'mwolff@example.org', '211-317-6452x02770', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('821988499', 'sunt', 'mason94@example.org', '(695)327-0876x3356', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('825652595', 'minima', 'mpacocha@example.org', '1-952-630-9962x833', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('827955257', 'vitae', 'maribel08@example.com', '(871)928-2803x0231', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('83483532', 'accusantium', 'wmosciski@example.org', '(291)288-0155', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('839817934', 'et', 'angelina.herman@example.org', '880.724.1932x241', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('867569378', 'pariatur', 'volkman.tamara@example.net', '088-980-0178', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('870382684', 'blanditiis', 'jcorkery@example.org', '(893)035-1494x7832', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('875890644', 'cupiditate', 'jenkins.dixie@example.com', '1-253-629-7381x0235', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('876274616', 'harum', 'fgrant@example.net', '1-182-062-7350x543', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('885685951', 'cumque', 'samir63@example.net', '337-409-9805x229', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('888304657', 'mollitia', 'sreichert@example.com', '(705)411-2129x909', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('893472356', 'ipsa', 'cgleason@example.com', '1-666-953-3449', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('893864365', 'suscipit', 'bill.yundt@example.net', '(668)803-1835x89516', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('952561726', 'similique', 'rafaela.ziemann@example.com', '(985)314-6193', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('956543800', 'eum', 'tressie.kautzer@example.org', '920-424-3289x970', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('963486230', 'quae', 'frederic.strosin@example.org', '1-184-295-9055x66540', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('980982699', 'molestias', 'aebert@example.com', '1-430-329-6453x548', 'Orderd', 'Nancy', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `producer`
--

CREATE TABLE `producer` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `producer`
--

INSERT INTO `producer` (`id`, `id_user`, `location`, `siret`) VALUES
(1, 1, 'Nancy', '7966088'),
(2, 2, 'Nancy', '832775'),
(3, 3, 'Nancy', '147633000'),
(4, 4, 'Nancy', '29423333'),
(5, 5, 'Nancy', '50'),
(6, 6, 'Nancy', '221816'),
(7, 7, 'Nancy', '7'),
(8, 8, 'Nancy', '384945'),
(9, 9, 'Nancy', ''),
(10, 10, 'Nancy', '46810'),
(11, 11, 'Nancy', '63504606'),
(12, 12, 'Nancy', '1');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `img_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` int NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `id_category` int NOT NULL,
  `id_producer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `img_url`, `name`, `description`, `unit_price`, `availability`, `id_category`, `id_producer`) VALUES
(1, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'aut', 'Et aperiam et expedita voluptate repudiandae. Dolore corporis consequatur temporibus excepturi possimus. Beatae voluptates iusto est autem odit quo dolores. Consectetur voluptatibus officia sunt tempore quae dolore pariatur. Nulla voluptatem ab neque et sint nisi qui.', 3, 0, 1, 1),
(2, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'ut', 'Consequatur fuga dolor natus aut. Sit possimus numquam magnam corporis laudantium neque autem. Aut reprehenderit dolor distinctio voluptatem numquam hic. Et temporibus dolores aliquid laboriosam. Quidem suscipit ducimus eos assumenda minima.', 3, 1, 2, 2),
(3, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'molestiae', 'Ut fuga est eos reprehenderit error. Ipsa nemo est odit in et quos tenetur sint. Est nostrum incidunt quo ut temporibus. Blanditiis vel tempora tenetur.', 3, 1, 3, 3),
(4, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'qui', 'Voluptas cum in qui reiciendis. Recusandae rerum velit officia ut est quis. Tenetur temporibus est at voluptatem magnam. Deleniti porro ipsum dignissimos id dicta ullam animi quod. Quibusdam officiis perferendis maiores animi.', 3, 1, 4, 4),
(5, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'maiores', 'Illo temporibus enim tempore a delectus consequuntur nihil. Ut natus odit enim autem aut dolorum. Rerum quae dolore incidunt dolores.', 3, 0, 5, 5),
(6, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'sed', 'Rem et est amet voluptas omnis laudantium voluptate. Delectus enim consequatur fugiat ea voluptatem iure. Sit at consequatur rerum rerum nihil.', 3, 0, 6, 6),
(7, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'fugit', 'Voluptatem autem ad repellendus eligendi id. Ducimus repudiandae rerum perferendis sed. Cumque et aliquid ratione vitae explicabo id. Adipisci quo et sapiente eius quam. Tempore cum et id.', 3, 0, 7, 7),
(8, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'est', 'Quo eos est non repellendus rerum. Voluptates voluptatem quod doloremque placeat reprehenderit possimus fugit. Tenetur atque fuga aliquid esse aut cupiditate.', 3, 0, 8, 8),
(9, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'dolorum', 'Eos velit deleniti qui dolores rerum blanditiis molestiae. Quo possimus ut sunt repellat. Laborum blanditiis architecto fugit qui quis. Beatae perspiciatis modi et ipsam sequi officia voluptate molestiae.', 3, 1, 9, 9),
(10, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'eum', 'Ex voluptatem et sint nesciunt omnis excepturi expedita enim. Facere neque qui aut omnis. Et voluptas natus eaque nulla vel autem. Pariatur ullam sed eaque fuga quae.', 3, 1, 10, 10),
(11, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'voluptatem', 'Corrupti et nemo ducimus eos quam qui necessitatibus. Molestias modi omnis recusandae possimus. Aut et libero ullam hic deserunt laborum accusantium.', 3, 1, 1, 11),
(12, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'non', 'Omnis et eius quo accusantium debitis et eligendi numquam. Non veritatis quas repudiandae cum. Voluptates sed recusandae facilis sunt voluptatem. Sapiente voluptas aut voluptatum et minima.', 3, 1, 2, 12),
(13, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'et', 'Quibusdam voluptatibus quo est animi iusto. Possimus itaque et delectus ut voluptatem. Incidunt delectus dolorum ex sunt. Quibusdam deleniti ut repellat unde nihil esse et dolor. Vel qui a minus sunt molestiae aut eos.', 3, 0, 3, 1),
(14, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'impedit', 'Molestias officia suscipit excepturi aut nam. Cumque error aut et temporibus.', 3, 1, 4, 2),
(15, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'explicabo', 'Consequatur provident exercitationem ut nihil quasi excepturi. Quis cum dolores tempora consequuntur. Dolorem amet maxime commodi in aut. Illum a omnis doloribus recusandae natus repellendus.', 3, 1, 5, 3),
(16, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'ducimus', 'Enim sapiente dolorum doloremque provident sit similique. Sed omnis blanditiis totam eaque vel officiis. Alias quia aperiam est cumque aspernatur provident. Minus est nam sint ullam.', 3, 1, 6, 4),
(17, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'est', 'Aperiam voluptatem nobis aperiam rerum omnis voluptas. Aut saepe saepe distinctio provident. Incidunt voluptas aperiam voluptates voluptas omnis voluptate nihil.', 3, 0, 7, 5),
(18, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'rerum', 'Voluptatem vero aliquid voluptatum minima minima suscipit. Ipsa sed incidunt sit repellat. Et quos qui rem perferendis. Ex tenetur ea voluptatibus sint consequatur laborum temporibus.', 3, 1, 8, 6),
(19, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'quo', 'Qui in architecto pariatur eligendi tenetur voluptas. Vitae aperiam autem repellendus ullam.', 3, 0, 9, 7),
(20, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'error', 'Blanditiis sed expedita et dolorem. Omnis et et veritatis itaque. Est voluptates similique illo nulla alias.', 3, 0, 10, 8),
(21, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'voluptate', 'Reiciendis cum eaque deleniti ea sit. Qui et architecto quisquam consequuntur placeat repudiandae eius veniam. Consequuntur numquam molestiae qui laborum corrupti consequatur iure et. Dignissimos itaque architecto totam nobis.', 3, 1, 1, 9),
(22, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'nesciunt', 'Quibusdam sequi ab nam. Praesentium magnam quos nulla aut ratione perspiciatis.', 3, 0, 2, 10),
(23, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'iure', 'Non quidem accusamus asperiores iste aliquam eum. Et eos quia quia autem porro sint quasi. Nihil dolores error provident illo similique et consequatur velit.', 3, 0, 3, 11),
(24, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'architecto', 'Excepturi ipsum cupiditate impedit quae porro beatae nihil. Alias nihil saepe nemo est. Voluptatem voluptatem adipisci distinctio autem quisquam enim. Ut aliquid veniam voluptatem asperiores odio voluptatum commodi.', 3, 0, 4, 12),
(25, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'voluptatem', 'Rem voluptate quo unde unde. Rerum similique nostrum non id repudiandae. Voluptatum magnam ducimus sed. Voluptate velit culpa quidem alias quia et iusto.', 3, 1, 5, 1),
(26, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'aliquam', 'Occaecati voluptate suscipit ex nesciunt. Cum vero facere ab qui iste. Deleniti in id sit dignissimos dolorem debitis provident.', 3, 0, 6, 2),
(27, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'architecto', 'In at dolores modi aut. Numquam animi odit id. Sapiente sequi saepe ea voluptate suscipit quo totam. Ab consequatur error porro nesciunt officia omnis dolores blanditiis.', 3, 1, 7, 3),
(28, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'eius', 'Veniam aliquid dignissimos officiis aut perferendis nihil est. Minus numquam id quia mollitia.', 3, 0, 8, 4),
(29, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'impedit', 'Itaque et ut nihil facilis ipsam aut. Eaque harum sed autem et. Quis enim nisi sunt voluptatem dolore aut.', 3, 0, 9, 5),
(30, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'atque', 'Aspernatur sunt et soluta aut pariatur. Saepe excepturi temporibus et sapiente sunt. Quis tempora eligendi laboriosam.', 3, 0, 10, 6),
(31, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'consequatur', 'Et dolorem quod ut facere qui consectetur. Sequi eius optio aliquam aut hic aut ut. Sit ducimus accusamus iste quae totam cum. Soluta unde nostrum sequi occaecati temporibus sit ut. Maiores et numquam assumenda non deleniti.', 3, 0, 1, 7),
(32, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'eveniet', 'Recusandae vitae aut vel placeat quo aut. Unde et eaque deserunt autem beatae totam natus. Ad itaque et ullam rem autem eaque. Nulla odio nisi minus vitae in voluptates voluptate nobis.', 3, 0, 2, 8),
(33, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'aut', 'Ad ratione sint mollitia et assumenda voluptatibus. Quo quod ad et laboriosam delectus eligendi. Dolore repellat dignissimos incidunt iste saepe maxime eum at. Nesciunt porro impedit unde totam. Earum sapiente quasi ratione aut dolorum vitae qui qui.', 3, 0, 3, 9),
(34, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'quos', 'Rerum excepturi ut est aut qui quo praesentium. Magni qui voluptas aliquid eos officia labore. Hic ad distinctio quia ut porro inventore. Et nam aperiam odio ut aliquam voluptatum.', 3, 0, 4, 10),
(35, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'ratione', 'Nihil maiores nemo voluptate laudantium. Et aspernatur odit quis dolor in magnam. Atque qui reprehenderit qui nisi repellat facere. Repellat expedita maiores et nobis nulla odit.', 3, 0, 5, 11),
(36, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'vitae', 'Deserunt velit nisi consectetur eaque suscipit ut. Distinctio illum quisquam nostrum est occaecati aliquid id. Ut quae deserunt minus distinctio harum. Reiciendis consectetur eum sint dolorum quibusdam amet odit.', 3, 1, 6, 12),
(37, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'neque', 'Qui asperiores adipisci corrupti voluptas odit odio voluptas. Quidem vel doloremque aut. Consequatur et odit necessitatibus repellendus quis deserunt provident. Accusantium laboriosam qui enim iusto ducimus saepe sed.', 3, 0, 7, 1),
(38, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'id', 'Consequatur magni tempora velit libero a. Est autem tempora non explicabo doloribus at ea. Libero corrupti earum est deleniti.', 3, 1, 8, 2),
(39, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'dicta', 'Dolores qui ut et molestias ut. Eaque unde praesentium culpa est. Inventore quo corrupti natus itaque.', 3, 0, 9, 3),
(40, 'https://www.medisite.fr/files/images/article/9/3/6/482639/vignette-focus.jpg', 'sint', 'Et voluptatem praesentium voluptatem qui omnis dolorem. Facilis est nulla quisquam blanditiis vel. Ducimus ut aut omnis ut quia neque. Hic enim est cum sint.', 3, 1, 10, 4),
(41, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'delectus', 'Enim ut et officia sapiente. Expedita corrupti ut et et libero aut quidem porro. Omnis est quis maxime et fuga. Sint et aliquid animi eum aspernatur aut. Veritatis sed exercitationem optio accusamus iusto quo laboriosam.', 3, 0, 1, 5),
(42, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'ut', 'Eos magnam sapiente repellat sed labore tempora. Eos consectetur impedit placeat est iusto ullam perspiciatis. Odit rerum aperiam aliquid voluptatem et.', 3, 1, 2, 6),
(43, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'rerum', 'Non occaecati animi magni dolores. Omnis autem exercitationem cumque error. Dicta sint accusamus accusantium.', 3, 0, 3, 7),
(44, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'sed', 'Et et ex qui fuga natus doloribus praesentium id. Provident impedit eligendi quas enim vero. Aut est qui et nihil voluptatem sint. Enim quis dolores quis vero consequatur sit. Sed optio debitis ipsum voluptatum commodi omnis architecto.', 3, 1, 4, 8),
(45, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'voluptatem', 'Minima aut dolorum porro. Dolor ipsa tempore fugiat sequi soluta rerum.', 3, 0, 5, 9),
(46, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'libero', 'Rem recusandae vero qui tenetur et veritatis nobis. Quibusdam ut sint laboriosam nisi cupiditate provident. Facilis nam vitae laboriosam ut. Qui illo aliquid eligendi qui ut deleniti.', 3, 1, 6, 10),
(47, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'repellendus', 'Quam iure deleniti omnis nihil temporibus eveniet. Porro aliquid possimus vel nisi nemo nam. Architecto reiciendis ut aliquid est vitae consequatur veniam consectetur.', 3, 1, 7, 11),
(48, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'culpa', 'Ratione nemo voluptatem repellendus libero quia non. Sed quo velit quia qui quae. Rem rem voluptatem aliquam consectetur repudiandae.', 3, 0, 8, 12),
(49, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'quis', 'Voluptatibus velit et dolor laudantium non. Blanditiis eos sed eos qui. Id excepturi et et sed quaerat nam earum. Eveniet temporibus nobis iusto error dolorem.', 3, 0, 9, 1),
(50, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'voluptatibus', 'Consequatur sunt nam sit sequi quia temporibus asperiores voluptatem. Rerum et et ut sequi. Culpa ea ipsam sit aut consequatur omnis voluptate. Unde sed est voluptatum. Qui minus voluptatem quo minus voluptas.', 3, 1, 10, 2),
(51, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'modi', 'Aliquid id et modi laudantium qui expedita. Minima est consequuntur ullam odit. Illo saepe asperiores ipsa occaecati ut aperiam. Eum enim suscipit omnis quo at.', 3, 0, 1, 3),
(52, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'illo', 'Dolorem labore ullam ea consectetur debitis accusamus consequatur sint. Fugiat aperiam nostrum repudiandae magni rem. Et laborum nihil culpa.', 3, 1, 2, 4),
(53, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'non', 'Culpa perspiciatis dolorem inventore in. Ad deserunt quaerat ducimus laboriosam. Ducimus et ut voluptatum quia sed. Voluptatem ipsa et sunt quia quasi fugit labore.', 3, 0, 3, 5),
(54, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'delectus', 'Qui aliquam sapiente repudiandae error architecto. Modi qui fugiat sunt consequatur. Autem iure aut quis ut.', 3, 0, 4, 6),
(55, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'voluptas', 'A aut magni ut commodi necessitatibus. Et assumenda voluptas inventore. Et iste porro excepturi autem.', 3, 1, 5, 7),
(56, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'sed', 'Sint nihil sit in amet. Qui occaecati ut aliquam delectus amet animi quam. Qui qui eligendi doloremque dolorum. Commodi expedita quam similique eum sit.', 3, 0, 6, 8),
(57, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'facere', 'Ut recusandae vero temporibus. Eius voluptatem perspiciatis modi illum. Non aut nihil provident ipsa nobis atque cum possimus.', 3, 0, 7, 9),
(58, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'consequatur', 'Nesciunt impedit quia similique nihil itaque. Nemo ad architecto dolores dolorem repellendus exercitationem ipsam.', 3, 1, 8, 10),
(59, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'voluptates', 'Ut placeat eos sunt est quis rem doloribus voluptas. Voluptas similique quis excepturi. Molestias aliquam eum minima quod doloremque.', 3, 0, 9, 11),
(60, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'libero', 'Est assumenda earum fugiat non. Voluptatem ea totam hic sunt quia. Temporibus corrupti hic enim doloremque. Aspernatur eaque quis quidem fugiat dolore vel.', 3, 1, 10, 12),
(61, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'cum', 'Sunt dolores ex exercitationem quia accusamus et autem. Et odio nostrum praesentium tenetur deleniti. Laudantium qui est doloremque commodi placeat perferendis autem. Optio delectus consequatur earum.', 3, 0, 1, 1),
(62, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'voluptatem', 'Et molestias quidem nemo illo molestiae eveniet. Sequi enim suscipit aut reprehenderit reprehenderit accusantium nihil quod. Qui et nihil voluptate earum. Similique qui maiores reprehenderit quia.', 3, 1, 2, 2),
(63, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'odit', 'Debitis eum officia et recusandae porro consequatur aspernatur. Molestiae qui autem ut provident. Sed quibusdam placeat sed.', 3, 1, 3, 3),
(64, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'et', 'Inventore esse incidunt est velit dolores ut voluptatum. Libero et enim eaque natus maiores autem.', 3, 1, 4, 4),
(65, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'vel', 'Commodi autem quis recusandae nam. Aut molestiae molestias ducimus eveniet esse recusandae. Qui ipsam consequatur ipsa.', 3, 0, 5, 5),
(66, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'placeat', 'Expedita alias temporibus velit. Temporibus in et fuga deleniti facilis error alias. Aliquid ad in doloribus autem provident.', 3, 0, 6, 6),
(67, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'aut', 'Autem rerum dolor vitae in. Possimus cumque itaque sed laboriosam ea qui. Laboriosam ipsam ad architecto eum sequi odit corporis aut.', 3, 1, 7, 7),
(68, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'quam', 'Quia consequuntur id tempora dolorum et. Dolor nisi a voluptas delectus. Repellendus rerum eum aspernatur doloribus eius iusto. Vero libero non omnis laboriosam molestiae quis molestiae.', 3, 0, 8, 8),
(69, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'reprehenderit', 'Numquam itaque iure laboriosam magni. Praesentium veritatis nisi qui nostrum voluptate. Et maiores velit repudiandae reiciendis.', 3, 0, 9, 9),
(70, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'dolor', 'Non sunt voluptatem eum dolorum velit velit consequatur ut. Et beatae enim et mollitia et rerum voluptatem. Rem quis animi hic.', 3, 1, 10, 10),
(71, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'eos', 'Unde praesentium iste vero qui aliquid alias enim aperiam. Voluptate consequatur tempora numquam sapiente ipsa quidem. Cum tempora voluptates a ducimus quo eaque. Assumenda aut voluptatem natus voluptatem repellendus exercitationem unde.', 3, 0, 1, 11),
(72, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'delectus', 'Possimus eveniet incidunt qui error adipisci eaque. Deserunt harum quibusdam consequatur aut numquam.', 3, 1, 2, 12),
(73, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'sit', 'Ut dolor et quia cumque. Consequatur beatae non earum. Ea qui est illum sequi fuga officia. Et ab et ab.', 3, 0, 3, 1),
(74, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'a', 'Illum eos recusandae est sed animi ut. Aut dolores aut sunt voluptates cupiditate cupiditate. Aut soluta ipsa quasi dicta. Aut nulla nulla et adipisci vel et ea.', 3, 0, 4, 2),
(75, 'https://media.istockphoto.com/photos/fresh-carrots-isolated-on-white-background-picture-id545454816?k=20&m=545454816&s=612x612&w=0&h=zTbL2GTPiWKU7kNyC1mqsQfbBvQIQNKtRgm_uLzUKkk=', 'nobis', 'Dignissimos porro sequi voluptas quibusdam laborum nisi qui. Ducimus nemo quod qui repudiandae commodi quia. Corporis voluptatem aut omnis veniam illum.', 3, 0, 5, 3),
(76, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'quia', 'Maxime incidunt animi suscipit quia officia sapiente. Sit tempora nihil veniam optio incidunt sint perspiciatis esse. Suscipit doloribus cupiditate sit sit a voluptatibus. Non dignissimos cupiditate vel.', 3, 0, 6, 4),
(77, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'sunt', 'Voluptate consequuntur reprehenderit eius exercitationem autem qui. Qui voluptatum saepe ab modi et est ut. Nihil inventore architecto deserunt adipisci libero nemo eum. Nihil odio itaque odio.', 3, 0, 7, 5),
(78, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'eum', 'Numquam sunt et magnam doloribus. Ipsum fuga sunt qui aut ut minima est. Ea consectetur nulla nisi ullam qui. Non et omnis laboriosam magni fugiat.', 3, 0, 8, 6),
(79, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'laboriosam', 'Repellat doloremque fugit repellendus. Animi vitae ad illo eligendi. Optio molestiae perferendis aspernatur distinctio nostrum. Est hic eligendi eveniet animi in voluptatem recusandae voluptatem.', 3, 0, 9, 7),
(80, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'est', 'Aut et ipsum quod modi inventore et molestiae. Quo et asperiores similique qui minus aperiam. Aut est aut est distinctio ratione saepe consequuntur doloribus. Fugit accusamus quia ducimus qui.', 3, 0, 10, 8),
(81, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'id', 'Sed sit tempore esse labore. Et odio commodi fuga natus ut. Corporis possimus enim dolorem non dolorum fugiat.', 3, 1, 1, 9),
(82, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'quisquam', 'Et minus impedit ipsam quis natus nihil. Incidunt occaecati omnis necessitatibus cumque. A ut ea illo voluptatem deserunt quam.', 3, 0, 2, 10),
(83, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'laboriosam', 'Ab esse autem doloribus dignissimos eligendi. Laboriosam voluptatibus quis quia rerum quis velit maxime. Quae voluptatem sed odio recusandae architecto. Quia sed quam aut sunt omnis iure reiciendis. Atque facilis itaque aliquid aliquam consequatur sunt.', 3, 1, 3, 11),
(84, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'accusantium', 'Velit quidem neque sit quos modi. Tempore est maxime enim. Non quia tempore quaerat vitae tempore soluta quisquam voluptas. Est enim quibusdam similique possimus aut.', 3, 1, 4, 12),
(85, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'atque', 'Quo quia sed voluptatum quam. Neque impedit repellat minus reiciendis laborum qui sed. Ad sunt explicabo dolorem asperiores at culpa at et.', 3, 0, 5, 1),
(86, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'eum', 'Dignissimos tempore illum temporibus accusantium ex est voluptate. Sequi magni occaecati nihil labore voluptatem autem rerum non. Nisi blanditiis nemo nobis delectus quas sunt ab quo. Et dicta quia aut perferendis provident et.', 3, 1, 6, 2),
(87, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'odio', 'Iure excepturi hic id temporibus consectetur libero omnis occaecati. Autem non nostrum placeat mollitia. Rerum voluptas sit magni pariatur dolorem. Quis ducimus adipisci nisi temporibus et nisi ad.', 3, 1, 7, 3),
(88, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'excepturi', 'Aliquid sapiente dolorem eum ex. Temporibus dolor voluptatem ut quidem exercitationem non. Cupiditate earum saepe ipsum veritatis ut ex ea.', 3, 1, 8, 4),
(89, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'molestiae', 'Voluptatem neque unde nisi et eos. Error quos iusto perferendis. Voluptas occaecati aut sed. Sint earum cum cumque quae id error sint.', 3, 0, 9, 5),
(90, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'neque', 'Voluptatem et voluptate autem modi exercitationem maxime. Eum harum quos sint dolorum ut omnis ipsa. Et corrupti nihil aliquam. Ea harum vero sequi nobis placeat velit.', 3, 0, 10, 6),
(91, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'quidem', 'Magni dolorem exercitationem et qui reiciendis. Officiis dignissimos est earum soluta qui cum animi. Esse eveniet placeat tempora officiis error sint autem.', 3, 0, 1, 7),
(92, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'quasi', 'Voluptatum reprehenderit voluptatem veniam ea. Porro est rerum veritatis voluptas illo. Temporibus voluptatem non ut qui pariatur et facere dolor.', 3, 1, 2, 8),
(93, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'optio', 'Dolorem reprehenderit nostrum ut facere consectetur. Voluptas quis qui velit sint qui ea maxime sit. Eaque placeat est qui voluptatum. Aut id sit veritatis non voluptates non aut. Sunt quia non aut iure dolor aliquid atque eos.', 3, 0, 3, 9),
(94, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'cum', 'Totam minus qui quisquam dicta aut. Ut facere occaecati at quod omnis nihil enim. Harum alias est minima nam soluta ut repellendus. Sapiente est minus deleniti rem accusantium occaecati laboriosam nihil.', 3, 1, 4, 10),
(95, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'odit', 'Velit doloribus rerum iusto. Odit recusandae sit minima. Veniam sunt voluptate sint soluta possimus vel. Odio officia aperiam porro et et rerum voluptatem.', 3, 0, 5, 11),
(96, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'similique', 'Veniam et odio ut ipsum aliquam ea. Odio delectus voluptas laborum quia et ea quis. Autem nihil quasi explicabo expedita.', 3, 1, 6, 12),
(97, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'totam', 'Perspiciatis provident blanditiis quam doloribus. Illum voluptatum eum quam aut. Autem expedita totam nobis ex. Officiis alias libero possimus doloribus optio ipsa.', 3, 1, 7, 1),
(98, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'possimus', 'Dolorum et ratione odio nesciunt placeat maxime. Fugit cupiditate aut exercitationem cupiditate est. Mollitia voluptates sit dolores. Perferendis et et ut corrupti incidunt optio.', 3, 0, 8, 2),
(99, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'aut', 'Quia pariatur a quasi vitae aut. Molestiae vel vel vel voluptas minima. Consectetur ad libero numquam omnis repudiandae similique quod.', 3, 1, 9, 3),
(100, 'https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=20&m=157430678&s=612x612&w=0&h=dfYLuPYwA50ojI90hZ4jCgKZd5TGnqf24UCVBszoZIA=', 'iste', 'Quia voluptatibus veniam deserunt placeat. Est expedita quia qui neque et fugiat. Facilis cum doloribus fuga blanditiis dolores consequatur in quia.', 3, 1, 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `quantity`
--

CREATE TABLE `quantity` (
  `id_product` int NOT NULL,
  `id_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quantity`
--

INSERT INTO `quantity` (`id_product`, `id_order`, `quantity`) VALUES
(1, '1065685370', 5),
(2, '1080901668', 3),
(3, '1129784005', 4),
(4, '1162599804', 2),
(5, '1163993588', 3),
(6, '1181892209', 5),
(7, '1185351490', 3),
(8, '1206435501', 4),
(9, '1219327142', 5),
(10, '122139421', 3),
(11, '1223667841', 1),
(12, '1237429351', 4),
(13, '1238777359', 4),
(14, '1240730423', 3),
(15, '1280071483', 4),
(16, '1305560941', 4),
(17, '1316936126', 4),
(18, '1327248741', 4),
(19, '1359149874', 1),
(20, '1359889299', 5),
(21, '1361247100', 3),
(22, '1402963805', 3),
(23, '1404145870', 1),
(24, '1409219578', 2),
(25, '1412131742', 3),
(26, '1431717743', 4),
(27, '1433203083', 5),
(28, '1450124659', 2),
(29, '1473858198', 4),
(30, '1480247930', 4),
(31, '1504886671', 2),
(32, '1511794963', 2),
(33, '1514759036', 1),
(34, '155697529', 4),
(35, '1569947801', 5),
(36, '1579549381', 1),
(37, '1583689980', 1),
(38, '158606298', 1),
(39, '1611622425', 4),
(40, '1613824065', 4),
(41, '162169803', 4),
(42, '1633747987', 2),
(43, '170440443', 2),
(44, '170521408', 3),
(45, '175144220', 5),
(46, '208555260', 5),
(47, '210305936', 5),
(48, '270316660', 2),
(49, '29127819', 1),
(50, '298089406', 3),
(51, '306620562', 2),
(52, '339711842', 2),
(53, '34873020', 4),
(54, '383694357', 4),
(55, '400666845', 1),
(56, '436497471', 4),
(57, '438873583', 3),
(58, '447151927', 5),
(59, '482915728', 3),
(60, '482925689', 5),
(61, '499644667', 4),
(62, '506352560', 4),
(63, '524992146', 4),
(64, '549067010', 3),
(65, '572033833', 1),
(66, '572886342', 3),
(67, '585267866', 5),
(68, '642360378', 2),
(69, '645565391', 4),
(70, '654667563', 1),
(71, '655269312', 1),
(72, '660517746', 5),
(73, '665437040', 3),
(74, '672018066', 5),
(75, '681677560', 1),
(76, '701125026', 2),
(77, '708913432', 2),
(78, '726674547', 4),
(79, '755217798', 4),
(80, '775418294', 5),
(81, '793809478', 5),
(82, '80776083', 4),
(83, '819151596', 3),
(84, '821988499', 2),
(85, '825652595', 3),
(86, '827955257', 3),
(87, '83483532', 2),
(88, '839817934', 4),
(89, '867569378', 3),
(90, '870382684', 4),
(91, '875890644', 1),
(92, '876274616', 3),
(93, '885685951', 4),
(94, '888304657', 3),
(95, '893472356', 2),
(96, '893864365', 4),
(97, '952561726', 2),
(98, '956543800', 5),
(99, '963486230', 1),
(100, '980982699', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `mail`, `username`, `password`) VALUES
(1, 'rerum', '1-423-319-2980', 'derek83@example.net', 'gmcdermott', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(2, 'magni', '+83(5)6710164462', 'rturcotte@example.com', 'corkery.devante', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(3, 'unde', '(839)465-9582x61543', 'madie.nikolaus@example.com', 'zoey44', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(4, 'quisquam', '1-867-097-3947', 'jordane67@example.net', 'stanford88', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(5, 'dolores', '1-791-706-1246', 'kuhlman.stacey@example.net', 'jamarcus.cassin', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(6, 'eveniet', '443-334-9610x6037', 'nola78@example.org', 'stanton.jacinthe', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(7, 'et', '09420132495', 'leilani.schaden@example.com', 'schultz.makenzie', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(8, 'quis', '1-765-170-7841', 'maryam36@example.com', 'hoppe.jazmyn', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(9, 'natus', '+07(3)3029544047', 'savanah.rath@example.org', 'langosh.floy', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(10, 'aperiam', '(714)158-6931', 'estefania11@example.net', 'orn.della', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(11, 'fugiat', '794-178-4246x9643', 'leffler.dennis@example.com', 'corine.leffler', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(12, 'nobis', '329.207.3946x8355', 'billy.glover@example.org', 'homenick.emiliano', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2');

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
  ADD PRIMARY KEY (`id_product`,`id_order`),
  ADD KEY `quantite_order0_FK` (`id_order`);

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
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `quantite_order0_FK` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quantite_product_FK` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
