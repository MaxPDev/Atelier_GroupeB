-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2021 at 10:12 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hangar`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'vegetables', 'Incidunt sint similique aut. Qui consequatur dolorem autem magnam officia sint. Minus corrupti impedit amet perspiciatis qui nihil similique assumenda. Rerum nulla libero quidem ab ab ratione animi.'),
(2, 'fruits', 'Reiciendis saepe reprehenderit eos mollitia fugiat cupiditate. Voluptas qui voluptatem nulla et est ut culpa. Id ut tempora aut sint.'),
(3, 'spices', 'Et exercitationem quaerat eaque est cumque. Saepe est quo ea. Quis nemo non sapiente consequatur. Voluptatem mollitia recusandae sed atque et est enim nemo.'),
(4, 'other', 'Saepe sit sequi ea quae. Esse dolor libero voluptas. Nam eos esse velit quas corporis occaecati. Corrupti ut voluptatem aspernatur velit id vitae occaecati.'),
(5, 'lorem', 'Sed veniam nobis aut. Ratione error officia harum et vitae nihil. Velit rerum quis ipsum impedit. Aperiam sed et quibusdam.');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `cooperation_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_FK` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `id_user`, `cooperation_name`) VALUES
(1, 1, 'LeHanger Corporations'),
(2, 2, 'LeHanger Corporations');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `name`, `mail`, `phone`, `status`, `place`, `created_at`, `updated_at`) VALUES
('1065685370', 'quidem', 'torey13@example.org', '1-156-697-7885', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1080901668', 'odit', 'amelia37@example.org', '186-750-3400x67859', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1129784005', 'dolores', 'reymundo17@example.net', '563-159-5969x35314', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1162599804', 'illum', 'annie81@example.org', '(012)414-0368', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1163993588', 'natus', 'blair38@example.net', '475-548-3956x4771', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1181892209', 'vel', 'alueilwitz@example.com', '1-924-322-5056', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1185351490', 'dolores', 'eleanora.considine@example.net', '04360430467', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1206435501', 'nobis', 'howe.edgardo@example.net', '(113)726-1454', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1219327142', 'voluptates', 'ifahey@example.org', '(197)524-9901x725', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('122139421', 'quae', 'zula28@example.net', '156.918.1428x4373', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1223667841', 'recusandae', 'zula28@example.net', '698-628-1395x571', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1237429351', 'ipsum', 'zula28@example.net', '+85(3)5745018160', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1238777359', 'quibusdam', 'luis.dietrich@example.com', '05935577144', 'Paid', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1240730423', 'quis', 'felicia07@example.net', '+04(8)7574571605', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1280071483', 'aliquam', 'prosacco.corene@example.net', '(653)198-9312', 'Delivered', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1305560941', 'a', 'mo\'keefe@example.net', '719.152.2764', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1316936126', 'nihil', 'blanda.olin@example.org', '915.533.9456x68843', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1327248741', 'est', 'nraynor@example.org', '+88(5)4661661387', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1359149874', 'fuga', 'amy40@example.org', '1-070-600-8320', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1359889299', 'tempore', 'witting.henry@example.net', '873.865.2402', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1361247100', 'aut', 'gjenkins@example.org', '1-410-482-1663', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1402963805', 'ab', 'wilton18@example.net', '139-843-0228', 'Paid', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1404145870', 'est', 'hane.mackenzie@example.com', '739.538.3277', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1409219578', 'aliquam', 'jerel78@example.com', '(175)042-0097', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1412131742', 'voluptatem', 'schaefer.glenda@example.net', '1-259-251-2279', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1431717743', 'reiciendis', 'hershel.schamberger@example.com', '+39(0)6030622625', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1433203083', 'vero', 'adams.arnold@example.org', '744.913.9901', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1450124659', 'expedita', 'vidal.cronin@example.net', '+81(9)4667311627', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1473858198', 'eius', 'elissa.wunsch@example.org', '239.282.8111x466', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1480247930', 'similique', 'haylee88@example.net', '511.767.4812x068', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1504886671', 'sapiente', 'jameson.koch@example.org', '(782)616-5081', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1511794963', 'voluptatibus', 'zfritsch@example.net', '(020)490-2433x62818', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1514759036', 'velit', 'heather.welch@example.net', '(888)446-0539x7770', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('155697529', 'molestiae', 'sven35@example.com', '366-642-1198x186', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1569947801', 'est', 'leslie.deckow@example.net', '519-087-1426', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1579549381', 'sed', 'tito09@example.com', '945-722-6643x91179', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1583689980', 'ipsa', 'qhansen@example.org', '769-589-6841', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('158606298', 'quo', 'elaina94@example.org', '038.139.4342x0995', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1611622425', 'magni', 'adams.jalen@example.net', '386-502-7188', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1613824065', 'sequi', 'o\'conner.jennifer@example.org', '1-832-285-5587x1430', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('162169803', 'et', 'gwisozk@example.net', '1-180-687-3158', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('1633747987', 'ut', 'khermiston@example.org', '(948)203-8433x0814', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('170440443', 'sunt', 'mavis.o\'kon@example.org', '190-009-2869x51627', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('170521408', 'natus', 'roberta.rowe@example.org', '426.866.9832', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('175144220', 'consequatur', 'rohan.alva@example.com', '(151)863-8957x848', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('208555260', 'voluptas', 'albina56@example.org', '1-110-254-0887', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('210305936', 'facilis', 'cbotsford@example.org', '1-545-549-8353x192', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('270316660', 'qui', 'grayson81@example.net', '04876277290', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('29127819', 'sint', 'vleuschke@example.org', '329.163.4392x272', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('298089406', 'veritatis', 'qreichel@example.com', '1-735-116-8942', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('306620562', 'sequi', 'jamir59@example.org', '(296)708-8704', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('339711842', 'qui', 'pbauch@example.net', '1-719-587-6910x55189', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('34873020', 'accusantium', 'luettgen.scottie@example.org', '+51(9)4747721190', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('383694357', 'qui', 'shammes@example.org', '299.664.3160', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('400666845', 'accusamus', 'ggislason@example.com', '1-981-780-3647x35275', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('436497471', 'animi', 'katrine.koch@example.net', '1-694-071-6093x184', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('438873583', 'atque', 'ruecker.angus@example.org', '1-400-060-5643x9989', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('447151927', 'quia', 'ystark@example.com', '428.852.1713', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('482915728', 'alias', 'ecruickshank@example.net', '1-559-847-1894x97366', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('482925689', 'sed', 'cronin.vincenza@example.net', '224-530-6970x021', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('499644667', 'beatae', 'eloise.bailey@example.com', '1-113-116-5992x67119', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('506352560', 'placeat', 'rmurray@example.org', '855.976.5572', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('524992146', 'illo', 'mpacocha@example.org', '01237265341', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('549067010', 'rem', 'bashirian.alba@example.net', '1-182-446-4037x217', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('572033833', 'aut', 'marquardt.orval@example.org', '1-401-355-2781', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('572886342', 'molestiae', 'annalise.schuster@example.net', '1-771-505-9740x352', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('585267866', 'itaque', 'lueilwitz.antwon@example.com', '(560)794-1079', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('642360378', 'doloribus', 'zfahey@example.org', '1-844-137-4863', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('645565391', 'et', 'vcummerata@example.org', '229.230.4860x703', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('654667563', 'sint', 'weissnat.soledad@example.com', '245.052.7694x505', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('655269312', 'tenetur', 'dfahey@example.org', '+24(1)8887140971', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('660517746', 'corporis', 'abshire.johnpaul@example.net', '620-362-2442', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('665437040', 'nobis', 'alejandrin78@example.net', '02668010211', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('672018066', 'commodi', 'sadye46@example.com', '1-741-843-2378x31683', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('681677560', 'corrupti', 'rosemary96@example.org', '1-203-925-1368x983', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('701125026', 'animi', 'bgutkowski@example.org', '1-458-626-7017x388', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('708913432', 'ea', 'toy.jude@example.org', '1-981-984-0874', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('726674547', 'aliquam', 'keyshawn.bode@example.net', '732-055-1243', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('755217798', 'qui', 'carlie14@example.org', '895-491-4161x5257', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('775418294', 'id', 'hmueller@example.com', '604.463.0412x122', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('793809478', 'id', 'corene04@example.org', '1-163-930-4713', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('80776083', 'quod', 'koch.eliza@example.com', '(434)086-9026x78495', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('819151596', 'cupiditate', 'mwolff@example.org', '211-317-6452x02770', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('821988499', 'sunt', 'mason94@example.org', '(695)327-0876x3356', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('825652595', 'minima', 'mpacocha@example.org', '1-952-630-9962x833', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('827955257', 'vitae', 'maribel08@example.com', '(871)928-2803x0231', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('83483532', 'accusantium', 'wmosciski@example.org', '(291)288-0155', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('839817934', 'et', 'angelina.herman@example.org', '880.724.1932x241', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('867569378', 'pariatur', 'volkman.tamara@example.net', '088-980-0178', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('870382684', 'blanditiis', 'jcorkery@example.org', '(893)035-1494x7832', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('875890644', 'cupiditate', 'jenkins.dixie@example.com', '1-253-629-7381x0235', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('876274616', 'harum', 'fgrant@example.net', '1-182-062-7350x543', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('885685951', 'cumque', 'samir63@example.net', '337-409-9805x229', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('888304657', 'mollitia', 'sreichert@example.com', '(705)411-2129x909', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('893472356', 'ipsa', 'cgleason@example.com', '1-666-953-3449', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('893864365', 'suscipit', 'bill.yundt@example.net', '(668)803-1835x89516', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('952561726', 'similique', 'rafaela.ziemann@example.com', '(985)314-6193', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('956543800', 'eum', 'tressie.kautzer@example.org', '920-424-3289x970', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('963486230', 'quae', 'frederic.strosin@example.org', '1-184-295-9055x66540', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44'),
('980982699', 'molestias', 'aebert@example.com', '1-430-329-6453x548', 'Orderd', 'Nancy', '2021-11-05 10:10:44', '2021-11-05 10:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
CREATE TABLE IF NOT EXISTS `producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_user_FK` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producer`
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` int(11) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_producer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_FK` (`id_category`),
  KEY `product_producer_FK` (`id_producer`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `img_url`, `name`, `description`, `unit_price`, `availability`, `id_category`, `id_producer`) VALUES
(3, 'https://nutritionadvance.com/wp-content/uploads/2018/01/several-fresh-carrots-with-intact-green-stems.jpg', 'Carrots', 'Ut fuga est eos reprehenderit error. Ipsa nemo est odit in et quos tenetur sint. Est nostrum incidunt quo ut temporibus. Blanditiis vel tempora tenetur.', 3, 1, 1, 3),
(4, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic', 'Voluptas cum in qui reiciendis. Recusandae rerum velit officia ut est quis. Tenetur temporibus est at voluptatem magnam. Deleniti porro ipsum dignissimos id dicta ullam animi quod. Quibusdam officiis perferendis maiores animi.', 3, 1, 1, 4),
(5, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes', 'Illo temporibus enim tempore a delectus consequuntur nihil. Ut natus odit enim autem aut dolorum. Rerum quae dolore incidunt dolores.', 3, 0, 1, 5),
(11, 'https://images.freeimages.com/images/large-previews/c58/ananas-1-1522721.jpg', 'ananas', 'Corrupti et nemo ducimus eos quam qui necessitatibus. Molestias modi omnis recusandae possimus. Aut et libero ullam hic deserunt laborum accusantium.', 3, 1, 2, 11),
(12, 'https://images.freeimages.com/images/large-previews/8e1/orange-1524171.jpg', 'Orange', 'Omnis et eius quo accusantium debitis et eligendi numquam. Non veritatis quas repudiandae cum. Voluptates sed recusandae facilis sunt voluptatem. Sapiente voluptas aut voluptatum et minima.', 3, 1, 2, 12),
(15, 'https://images.freeimages.com/images/large-previews/5c6/at-the-market-serie-potatoes-1538685.jpg', 'Peaches', 'Consequatur provident exercitationem ut nihil quasi excepturi. Quis cum dolores tempora consequuntur. Dolorem amet maxime commodi in aut. Illum a omnis doloribus recusandae natus repellendus.', 3, 1, 2, 3),
(23, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/fresh-yellow-onions.jpg', 'Onions', 'Non quidem accusamus asperiores iste aliquam eum. Et eos quia quia autem porro sint quasi. Nihil dolores error provident illo similique et consequatur velit.', 3, 0, 1, 11),
(24, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-and-sliced-eggplant-aubergine.jpg', 'Eggplant', 'Excepturi ipsum cupiditate impedit quae porro beatae nihil. Alias nihil saepe nemo est. Voluptatem voluptatem adipisci distinctio autem quisquam enim. Ut aliquid veniam voluptatem asperiores odio voluptatum commodi.', 3, 0, 1, 12),
(31, 'https://nutritionadvance.com/wp-content/uploads/2018/01/several-fresh-carrots-with-intact-green-stems.jpg', 'Carrots', 'Et dolorem quod ut facere qui consectetur. Sequi eius optio aliquam aut hic aut ut. Sit ducimus accusamus iste quae totam cum. Soluta unde nostrum sequi occaecati temporibus sit ut. Maiores et numquam assumenda non deleniti.', 3, 0, 1, 7),
(32, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/red-radishes-and-their-leaves-in-a-basket.jpg', 'Radish', 'Recusandae vitae aut vel placeat quo aut. Unde et eaque deserunt autem beatae totam natus. Ad itaque et ullam rem autem eaque. Nulla odio nisi minus vitae in voluptates voluptate nobis.', 3, 0, 1, 8),
(34, 'https://images.freeimages.com/images/large-previews/5c6/at-the-market-serie-potatoes-1538685.jpg', 'Peaches', 'Rerum excepturi ut est aut qui quo praesentium. Magni qui voluptas aliquid eos officia labore. Hic ad distinctio quia ut porro inventore. Et nam aperiam odio ut aliquam voluptatum.', 3, 0, 2, 10),
(35, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-and-sliced-eggplant-aubergine.jpg', 'Eggplant', 'Nihil maiores nemo voluptate laudantium. Et aspernatur odit quis dolor in magnam. Atque qui reprehenderit qui nisi repellat facere. Repellat expedita maiores et nobis nulla odit.', 3, 0, 1, 11),
(42, 'https://www.owimio.com/wp-content/uploads/2021/02/pumpkin-health-benefits-nutrition-facts.jpg', 'Pumpkin', 'Eos magnam sapiente repellat sed labore tempora. Eos consectetur impedit placeat est iusto ullam perspiciatis. Odit rerum aperiam aliquid voluptatem et.', 3, 1, 1, 6),
(43, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/fresh-yellow-onions.jpg', 'Onions', 'Non occaecati animi magni dolores. Omnis autem exercitationem cumque error. Dicta sint accusamus accusantium.', 3, 0, 1, 7),
(45, 'https://images.freeimages.com/images/large-previews/5c6/at-the-market-serie-potatoes-1538685.jpg', 'Peaches', 'Minima aut dolorum porro. Dolor ipsa tempore fugiat sequi soluta rerum.', 3, 0, 2, 9),
(52, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/healthy-champignon-mushrooms.jpg', 'Mushrooms', 'Dolorem labore ullam ea consectetur debitis accusamus consequatur sint. Fugiat aperiam nostrum repudiandae magni rem. Et laborum nihil culpa.', 3, 1, 1, 4),
(53, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes', 'Culpa perspiciatis dolorem inventore in. Ad deserunt quaerat ducimus laboriosam. Ducimus et ut voluptatum quia sed. Voluptatem ipsa et sunt quia quasi fugit labore.', 3, 0, 1, 5),
(55, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic', 'A aut magni ut commodi necessitatibus. Et assumenda voluptas inventore. Et iste porro excepturi autem.', 3, 1, 1, 7),
(64, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-green-cabbage-cut-into-pieces.jpg', 'Cabbage', 'Inventore esse incidunt est velit dolores ut voluptatum. Libero et enim eaque natus maiores autem.', 3, 1, 4, 4),
(71, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-green-cabbage-cut-into-pieces.jpg', 'Cabbage', 'Unde praesentium iste vero qui aliquid alias enim aperiam. Voluptate consequatur tempora numquam sapiente ipsa quidem. Cum tempora voluptates a ducimus quo eaque. Assumenda aut voluptatem natus voluptatem repellendus exercitationem unde.', 3, 0, 1, 11),
(81, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/red-radishes-and-their-leaves-in-a-basket.jpg', 'Radish', 'Sed sit tempore esse labore. Et odio commodi fuga natus ut. Corporis possimus enim dolorem non dolorum fugiat.', 3, 1, 1, 9),
(82, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/colorful-cherry-tomatoes-in-a-variety-of-different-colors.jpg', 'Tomatoes', 'Et minus impedit ipsam quis natus nihil. Incidunt occaecati omnis necessitatibus cumque. A ut ea illo voluptatem deserunt quam.', 3, 0, 1, 10),
(84, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic', 'Velit quidem neque sit quos modi. Tempore est maxime enim. Non quia tempore quaerat vitae tempore soluta quisquam voluptas. Est enim quibusdam similique possimus aut.', 3, 1, 1, 12),
(92, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/healthy-champignon-mushrooms.jpg', 'Mushrooms', 'Voluptatum reprehenderit voluptatem veniam ea. Porro est rerum veritatis voluptas illo. Temporibus voluptatem non ut qui pariatur et facere dolor.', 3, 1, 1, 8),
(95, 'https://www.nutritionadvance.com/wp-content/uploads/2018/01/whole-garlic-with-skin-and-a-garlic-clove.jpg', 'Garlic', 'Velit doloribus rerum iusto. Odit recusandae sit minima. Veniam sunt voluptate sint soluta possimus vel. Odio officia aperiam porro et et rerum voluptatem.', 3, 0, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `quantity`
--

DROP TABLE IF EXISTS `quantity`;
CREATE TABLE IF NOT EXISTS `quantity` (
  `id_product` int(11) NOT NULL,
  `id_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `quantite_order0_FK` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quantity`
--

INSERT INTO `quantity` (`id_product`, `id_order`, `quantity`) VALUES
(3, '1129784005', 4),
(4, '1162599804', 2),
(5, '1163993588', 3),
(11, '1223667841', 1),
(12, '1237429351', 4),
(15, '1280071483', 4),
(23, '1404145870', 1),
(24, '1409219578', 2),
(31, '1504886671', 2),
(32, '1511794963', 2),
(34, '155697529', 4),
(35, '1569947801', 5),
(42, '1633747987', 2),
(43, '170440443', 2),
(45, '175144220', 5),
(52, '339711842', 2),
(53, '34873020', 4),
(55, '400666845', 1),
(64, '549067010', 3),
(71, '655269312', 1),
(81, '793809478', 5),
(82, '80776083', 4),
(84, '821988499', 2),
(92, '876274616', 3),
(95, '893472356', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `mail`, `password`) VALUES
(1, 'Lucas Monty\r\n', '+33334509230\r\n\r\n', 'derek83@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(2, 'Vivienne Cartier\r\n', '+33258827624\r\n\r\n', 'rturcotte@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(3, 'Cheney Loiselle', '+33366325915\r\n\r\n', 'madie.nikolaus@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(4, 'Fitz Marchesseault', '+33344335619\r\n\r\n', 'jordane67@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(5, 'Florismart Mailly', '+33533721657\r\n\r\n', 'kuhlman.stacey@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(6, 'Jeanette Despins', '+33362222397\r\n\r\n', 'nola78@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(7, 'Chandler Ricard', '+33417510746\r\n\r\n', 'leilani.schaden@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(8, 'Joseph Laprise', '+33177864078\r\n\r\n', 'maryam36@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(9, 'Avril Senneville\r\n', '+33456109340\r\n\r\n', 'savanah.rath@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(10, 'Noémi Lespérance\r\n', '+33518298981\r\n\r\n', 'estefania11@example.net', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(11, 'Fauna Laliberté\r\n', '+33588315159\r\n\r\n', 'leffler.dennis@example.com', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2'),
(12, 'Sumner Houle\r\n', '+33529226742\r\n\r\n', 'billy.glover@example.org', '$2y$10$S.OpIxImOr.YqBWnwVYE9OGZFmqGU2PxYK/SrfT3hH1ZmUhtOmkp2');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `producer_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_FK` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_producer_FK` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quantity`
--
ALTER TABLE `quantity`
  ADD CONSTRAINT `quantite_order0_FK` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quantite_product_FK` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
