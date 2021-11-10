-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2021 at 07:32 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `s_price` float(10,2) NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SGD',
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `category`, `s_price`, `currency`, `published`, `created_at`, `status`) VALUES
(52, 58, 10, 'Virtual  Titans Present - VALORANT TOURNAMENT', '1636516912_cert.png', '&lt;p&gt;&lt;strong&gt;Valorant Tournament&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Information....&lt;/p&gt;&lt;p&gt;blablabbla&amp;nbsp;&lt;/p&gt;&lt;p&gt;join now!&lt;/p&gt;', 'Solo', 15.00, 'SGD', 1, '2021-10-11 10:02:23', 1),
(61, 49, 10, 'Fifa 22 Tourney', '1636463677_f.jpg', '&lt;p&gt;balblalbalbalbla&lt;/p&gt;', 'Solo', 10.00, 'SGD', 1, '2021-11-09 21:14:37', 1),
(62, 58, 10, 'vgfadsf', '1636521480_WhatsApp Image 2021-10-25 at 9.33.19 AM.jpeg', '&lt;p&gt;fsdafasdf&lt;/p&gt;', 'solo', 0.00, 'SGD', 1, '2021-11-10 13:18:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `game_list`
--

CREATE TABLE `game_list` (
  `id` varchar(100) NOT NULL,
  `game_list` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_list`
--

INSERT INTO `game_list` (`id`, `game_list`) VALUES
('1', 'DOTA'),
('2', 'CS:GO'),
('3', 'League of Legends');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(10) NOT NULL,
  `txn_id` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `payer_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_country` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `product_id`, `txn_id`, `payment_gross`, `currency_code`, `payer_id`, `payer_name`, `payer_email`, `payer_country`, `payment_status`, `created`) VALUES
(5, 91, 52, 'PAYID-MGE4UOY9GY295054H900891S', 15.00, 'SGD', 'BJBD5WG3KURZY', 'Amir Sabrin Ali', 'amirsabrin@gmail.com', 'SG', 'approved', '2021-11-09 02:09:29'),
(6, 6, 52, 'PAYID-MGFHGOQ5AH12079V71296304', 15.00, 'SGD', 'BJBD5WG3KURZY', 'Amir Sabrin Ali', 'amirsabrin@gmail.com', 'SG', 'approved', '2021-11-09 14:10:31'),
(7, 0, 61, 'PAYID-MGFHRSI2FG5750256467023K', 10.00, 'SGD', 'BJBD5WG3KURZY', 'Amir Sabrin Ali', 'amirsabrin@gmail.com', 'SG', 'approved', '2021-11-09 14:34:09'),
(8, 0, 61, 'PAYID-MGFUHOA02P98938UA1117202', 10.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-10 05:00:39'),
(9, 0, 52, 'PAYID-MGFWC5Y5G970839RM048534X', 15.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-10 07:07:31'),
(10, 0, 52, 'PAYID-MGFWD6Q43K322272N760792W', 15.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-10 07:09:09'),
(11, 0, 61, 'PAYID-MGFWFLI8FW798381T820445C', 10.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-10 07:12:08'),
(12, 0, 52, 'PAYID-MGFWOEY6XB77056LG490362A', 15.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-10 07:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `bookmark` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `published`, `created_at`, `bookmark`) VALUES
(0, 49, 15, 'Halloween Update!', '1635416287_Phasmophobia_Halloween_Cover.png', '&lt;p&gt;Phasmophobia will receive a major update this Monday the 25th at 4PM BST!&lt;/p&gt;', 1, '2021-10-24 14:57:33', 0),
(55, 58, NULL, 'Effectively using smokes in VALORANT', '1633868454_post1.PNG', '&lt;h2&gt;In competitive VALORANT, smokes can be the difference maker. But who has the best smokes and where should you be placing them?&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;VALORANT Agents are divided into four main categories: duelists, controllers, sentinels, and initiators. The ability to drop &lsquo;smokes&rsquo; stretches across almost all of these different roles but primarily falls to the controllers and sentinels. These agents may not have flashy abilities, but their contributions give their team map control and space. In competitive VALORANT, a well placed smoke can be the difference maker between a round win or loss. With some many smoke Agents, as well as places to smoke, using smokes effectively can be difficult.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;Which Agents are the best smokers?&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Every smoke Agent has their own unique take on the ability. Whether it be range, duration, or even color there is some distinction between all playable smokers.&lt;/strong&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;strong&gt;Brimstone&amp;nbsp;is one of the best smokers in VALORANT and a great place to start for players looking to master controller Agents. Brimstone&rsquo;s has three, fairly high ranged smokes that you can drop from above. The benefit of Brimstone is that his&amp;nbsp;Sky Smoke gives an overhead perspective of the map, making his smokes some of the most precise in VALORANT.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Omen&amp;nbsp;is another viable smoke Agent. Also a controller, Omen allows for a little more play-making ability. His teleport and blinding ability make him more self-sufficient though come at the cost of his smokes.&amp;nbsp;Dark Cover&amp;nbsp;has only two charges and has a slightly below average duration. Omen&rsquo;s other abilities are useful in supplementing his smokes, making him more flexible in gaining ground.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;&amp;nbsp;Perhaps the most &lsquo;complex&rsquo; smoker Agent is&amp;nbsp;Astra. Astra&rsquo;s star system may appear daunting at first, but after mastery can be the most effective among other smoker. The five star charges can guarantee a max of five smokes on the map, however her other two abilities are just as effective in gaining map control. Similar to Brimstone, her astral projection gives her a bird&rsquo;s eye view of the map, but she has no range limits. Her incredible range and ability to lock down points on her own makes Astra the single best smoker in VALORANT.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp;&lt;strong&gt;Viper and Jett are also Agents outside the controller role with viable smokes. Jett&rsquo;s Cloudburst has the lowest duration, as they are primarily meant to facilitate her personal play making ability. Viper&rsquo;s&amp;nbsp;Poison Cloud is an interesting alternative, as it has a range of 2-15 second duration. Viper alone is a poor mimic of a controller however, as her gas management is the sole decider of her effectiveness.&lt;/strong&gt;&lt;/li&gt;&lt;/ol&gt;&lt;h2&gt;&lt;strong&gt;Where to place smokes ?&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Knowing who is the best smoker is completely separate from knowing how to use smokes.&amp;nbsp; Every map is obviously different and have their own guides for smokers, however there are some generally applicable tips.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chokepoints and entrances are the two best spots to smoke when on the defense. This will force attackers to make the first move with little information, leaving them more likely to misplay. Attackers should focus smokes on known defense points. This includes &lsquo;heaven&rsquo; areas that overlook the bombsites, corners, and areas behind cover. Well-placed attacker smokes may even force defenders off the point as you move in, forcing them to play for the re-take.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;There plenty of other specific smoke scenarios. Using a smoke to cloud your spike plant or deplant is a common strategy. Knowledge of your map is ultimately what makes a great smoker, but these tips can get you started.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;', 1, '2021-10-10 20:20:54', 0),
(57, 58, 9, 'VALORANT: Patch 3.0 brings big changes to all Agents and weapons', '1633868783_post 3.PNG', '&lt;h2&gt;&lt;strong&gt;The patch notes for patch 3.0 are here and we&rsquo;re getting changes to all Agents and weapons, alongside some competitive tuning.&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Agents&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;The biggest changes come to the Agents, as they will all be adjusted with the upcoming patch. &ldquo;We have adjusted ability pricing, cooldown rates, and ultimate costs on every Agent. Generally, we noticed that certain agents were able to have too much impact with their abilities without making any significant tradeoffs.&ldquo;&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;These changes have been made to all agents&lt;/strong&gt;&lt;/h2&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;Signature abilities now only provide a minimum of one charge per round instead of accumulating a charge every round.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Charges gained from cooldowns are now always temporary&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Visibility returns faster during the fadeout period of all flashes&lt;/strong&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h2&gt;&lt;strong&gt;Weapons&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;When it came to the weapons, the developers targeted run-and-gun, which is too powerful in some situations. &ldquo;It is currently more potent than we&rsquo;d like. This patch targets a piece of the puzzle that we haven&rsquo;t touched before which is what we call &lsquo;tag into accuracy.&rsquo; [&hellip;] We&rsquo;ve also reduced the running accuracy of Sidearms and SMGs in an attempt to tighten up engagements with those weapons while maintaining some of their identity in terms of mobility by being able to to move and shoot somewhat accurately at shorter ranges.&rdquo;&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;changes to all weapons&lt;/strong&gt;&lt;/h2&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;Bullet tagging changed from 75% slow to 72.5% slow&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Weapon Deadzones changed from 30 to 27.5%&lt;/strong&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, '2021-10-10 20:26:23', 0),
(58, 58, 15, 'These are the teams in the Worlds 2021 Group Stage', '1633868936_post4.PNG', '&lt;h2&gt;&lt;strong&gt;After a historic and eventful play-ins stage, the groups for Worlds 2021 have been determined.&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Play-Ins for Worlds 2021 was just as historic as it was dramatic. For the first time, an LJL team, DetonatioN FocusMe, escaped Play-Ins and made it to Groups. LNG swept through Play-Ins without dropping a game while Cloud9 almost bowed out early. Beyond Gaming was engulfed in controversy just hours before the final series that sent Hanwha Life Esports to the main event.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;After the dust has settled, the final groups of Worlds 2021 have been cemented. With the main event looming and only one day of rest between, these are the groups.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group A &ndash; The Group of death&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Every year has one, a group with two unimaginably strong teams paired together seemingly destined to at least make quarter finals. Cloud9 will join the fray against FPX and Damwon Kia. After a shaky play-ins, Cloud9 are clear underdogs along with Rogue. The chances of escaping groups seems slim for Cloud9, and their weaker players will have to step up to show that the team is not simply prolonging the inevitable.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group B &ndash; Will DFM defy expectations?&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Group B has one clear leader, Edward Gaming, and a team expected to end last with the addition of DFM. Despite having a historic Play-Ins with their star shining like never before, DFM are still expected to be outclassed. With heavy hitters like EDG, T1, and 100T between them, it seems unlike that the DFM Cinderella story will go any farther.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group C &ndash; Hanwha Life poised to shake up groups&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;br&gt;&lt;strong&gt;Group C is one of the more &lsquo;open&rsquo; groups in Worlds 2021. RNG have emerged as clear favorites with the race between Fnatic and PSG Talon being split down the middle. Hanwha Life&rsquo;s presence complicates this group significantly, as the team has one of the strongest midlanes and bottom lane duos in Worlds. Hanwha Life could claim one of the two available spots, though they are almost just as likely to crash and burn.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group D &ndash; LNG, the Worlds sleeper pick&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;LNG may be the best team to ever compete in Play-Ins. The LPL fourth seed did not drop a single game and were the first squad to advance on to groups. Play-Ins have given the team time to learn the meta before continuing their journey into the most competitive group at Worlds. Though competition is stiff in Group D, as Team Liquid, Gen.G, and MAD Lions stand in their way, LNG could be a sleeper pick to win the entire tournament.&lt;/strong&gt;&lt;/p&gt;', 0, '2021-10-10 20:28:56', 0),
(62, 49, 15, 'FIFA to split with EA sports?!', '1635416265_fifa.jpg', '&lt;p&gt;FIFA is ending its long-term exclusive partnership with Electronic Arts as it looks to widen its gaming and esports portfolio.&lt;/p&gt;&lt;p&gt;The two parties first struck a deal in 1993 that will expire in 2022. FIFA is &lt;a href=&quot;https://www.nytimes.com/2021/10/13/sports/soccer/ea-sports-fifa.html&quot;&gt;reportedly&lt;/a&gt; seeking more than double its current &lt;strong&gt;$150 million&lt;/strong&gt; annual licensing fee.&lt;/p&gt;&lt;p&gt;FIFA&rsquo;s &lt;a href=&quot;https://www.fifa.com/news/fifa-set-to-widen-gaming-and-esports-portfolio&quot;&gt;statement&lt;/a&gt;, in part: &ldquo;It is clear that this needs to be a space that is occupied by more than one party controlling all rights.&rdquo;&lt;/p&gt;&lt;p&gt;The organization added that it will be in a better position to serve its 211 member associations as they take advantage of emerging opportunities in gaming and soccer.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;The &ldquo;FIFA&rdquo; series is estimated to be worth more than &lt;strong&gt;$2 billion&lt;/strong&gt; annually to EA.&lt;/li&gt;&lt;li&gt;Since its October 2020 release, &ldquo;FIFA 21&rdquo; had more than 31 million players.&lt;/li&gt;&lt;li&gt;&ldquo;FIFA 22&rdquo; already has 9.1 million players following its global release on Oct. 1.&lt;/li&gt;&lt;li&gt;More than 140 million people have played EA Sports titles over the last 12 months.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;EA &lt;a href=&quot;https://s22.q4cdn.com/894350492/files/doc_financials/2022/q1/Q1-FY22-Earnings-Release-Final.pdf&quot;&gt;posted&lt;/a&gt;&lt;strong&gt; $1.6 billion &lt;/strong&gt;in revenue in fiscal Q1, slightly up from $1.5 billion in the same period a year prior.&lt;/p&gt;&lt;p&gt;The results were driven by the company&rsquo;s live services segment, which generated $1.2 billion in revenue for the quarter. EA is projected to pocket &lt;strong&gt;$6.85 billion in revenue &lt;/strong&gt;in FY 2022.&lt;/p&gt;', 1, '2021-10-24 15:05:46', 0),
(64, 49, 9, 'Battlefield 2042', '1635416254_b2042.jpg', '&lt;p&gt;asasasasasas&lt;/p&gt;', 1, '2021-10-25 13:38:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `comment` varchar(200) NOT NULL,
  `comment_sender_name` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `parent_comment_id`, `comment`, `comment_sender_name`, `date`, `user_id`, `post_id`) VALUES
(51, 52, 'COULDN\'T AGREE MORE SIS!!!', 'organiser', '2021-10-08 00:42:58', 0, 55),
(52, 0, 'woah this is actually a helpful tip!!', 'NydiaWesdi', '2021-10-08 00:43:58', 0, 55),
(53, 0, 'Thanks for this amazing tip !', 'Amir Sabrin', '2021-10-08 00:44:51', 0, 55),
(72, 0, 'Fly high bro ! you\'ll be missed </3 ', 'Danial Kamsur', '2021-10-08 00:47:21', 0, 56),
(73, 74, 'rip :((', 'User', '2021-10-08 00:47:26', 0, 56),
(74, 0, 'RIP bruh </3', 'izzat', '2021-10-08 00:47:31', 0, 56),
(75, 0, 'this update patch sucks >:(', 'moderator', '2021-10-08 00:48:07', 0, 57),
(76, 0, 'WHAT?!?! BAD PATCH UPDATE !!!!', 'admin', '2021-10-08 00:48:12', 0, 57),
(78, 76, 'haloo pls give me admin pls I can manage  users I have a degree', 'izzat', '2021-10-08 00:48:19', 0, 57),
(79, 0, 'SENTINELS BEST VALORANT TEAM NA !!!', 'organiser', '2021-10-08 00:49:04', 0, 58),
(80, 79, 'Nahhh G2 best team from EU bro', 'Normal User 1', '2021-10-08 00:49:22', 0, 58),
(81, 0, '100T is the best team !!!!', 'normal user 2', '2021-10-08 00:49:32', 0, 58),
(82, 0, '  that will 11 PM Brunei time', 'Admin', '2021-10-24 00:58:57', 0, 61),
(91, 0, '  testing', 'Zylioth', '2021-10-27 07:51:05', 0, 0),
(96, 0, '  wow', 'Zylioth', '2021-11-06 03:50:58', 0, 0),
(97, 0, '  agree', 'Zylioth', '2021-11-06 03:51:34', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like_unlike`
--

CREATE TABLE `tbl_like_unlike` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `like_unlike` int(2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_like_unlike`
--

INSERT INTO `tbl_like_unlike` (`id`, `member_id`, `comment_id`, `like_unlike`, `date`) VALUES
(56, 1, 38, 29, '2021-10-08 06:51:01'),
(57, 1, 40, 7, '2021-10-08 06:50:54'),
(58, 1, 45, 11, '2021-10-08 06:50:52'),
(59, 1, 46, 14, '2021-10-08 06:50:50'),
(60, 1, 51, 0, '2021-10-24 07:01:57'),
(61, 1, 52, 1, '2021-10-24 07:37:55'),
(62, 1, 53, 0, '2021-10-24 07:01:58'),
(63, 1, 69, 5, '2021-10-08 06:50:45'),
(64, 1, 79, 50, '2021-10-10 12:37:34'),
(65, 1, 80, 121, '2021-10-10 12:37:37'),
(66, 1, 81, 23, '2021-10-10 12:37:42'),
(67, 1, 72, 0, '2021-10-24 07:02:08'),
(68, 1, 74, 0, '2021-10-24 07:02:09'),
(69, 1, 73, 0, '2021-10-24 07:02:10'),
(70, 1, 75, 1, '2021-10-24 07:02:19'),
(71, 1, 76, 0, '2021-10-24 07:02:15'),
(72, 1, 78, 0, '2021-10-24 07:02:17'),
(73, 1, 82, 0, '2021-10-24 07:01:45'),
(74, 1, 84, 1, '2021-10-24 07:21:40'),
(75, 1, 87, 0, '2021-10-25 05:21:43'),
(76, 1, 88, 1, '2021-10-25 05:21:42'),
(77, 1, 89, 1, '2021-10-25 06:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(255) NOT NULL,
  `team_name` varchar(1000) NOT NULL,
  `team_coach` varchar(1000) NOT NULL,
  `team_creator` int(255) NOT NULL,
  `team_captain` int(255) NOT NULL,
  `team_logo` blob NOT NULL,
  `limit_members` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_name`, `team_coach`, `team_creator`, `team_captain`, `team_logo`, `limit_members`) VALUES
(19, 'one', 'some', 54, 54, '', 2),
(26, 'stop', 'it', 54, 54, '', 8),
(27, 'AyamJago', 'Bota Wila Samba', 58, 58, '', 8),
(33, 'Hellio BN', 'Zylioth', 89, 89, '', 2),
(34, 'Kampung boy', 'Abu Bakar', 91, 91, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(255) NOT NULL,
  `team_id` int(255) DEFAULT NULL,
  `member_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `member_id`) VALUES
(8, 19, 54),
(17, 26, 54),
(18, 27, 58),
(19, 28, 59),
(20, 29, 69),
(21, 30, 84),
(22, 31, 86),
(23, 32, 88),
(24, 33, 89),
(25, 34, 91);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(9, 'Gaming', '<p>game related stuff</p>'),
(10, 'Tournaments', '<p>upcoming or past Tournaments/events information will be here</p>'),
(15, 'news', '<p>Any sort of news</p>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `bio` text NOT NULL,
  `pic` varchar(255) NOT NULL DEFAULT '1634018908_profile.png',
  `blocked` tinyint(4) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `organiser_status` int(11) NOT NULL,
  `phone_number` int(7) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `code`, `status`, `created_at`, `bio`, `pic`, `blocked`, `proof`, `organiser_status`, `phone_number`, `details`) VALUES
(39, 2, 'moderator', 'moderator@account.com', '$2y$10$vchXFR6v9ACXk5K0IqthOeSuFZtHQATgjXijZuJRU8oahsHYP4ygq', 0, 'verified', '2021-10-04 05:40:32', 'test saja', '1633613077_profile.png', 0, '1633611742_Desktop Screenshot 2021.10.07 - 20.21.52.15.png', 0, 0, ''),
(49, 1, 'Admin', 'Admin@account.com', '$2y$10$IaNcXYmpQc8AEU0adOGY2.zh5syuROoi.zsGXSjYlakgNl76dPSM.', 174631, 'verified', '2021-10-05 12:02:29', 'Hello', '1633768397_961279.png', 0, '1633612832_961279.png', 0, 7258975, ''),
(53, 3, 'organiser', 'organiser@account.com', '$2y$10$beRMPZP9OPrHPQewe4IOaOPmCyrtOVXTgOzKqngllBJJcBkjInlZ2', 904720, 'verified', '2021-10-08 03:21:09', 'This is the organiser\'s bio take a peek at my profile tehee', '1633674352_Siesta (2).jpg', 0, '1633696357_Siesta (2).jpg', 2, 0, ''),
(58, 1, 'Izzat', 'izzat.latif4@gmail.com', '$2y$10$SM81vJoxiN3ZVz2L4pM5aOf6mPW6mJPcl8u68kWzTUcCwjxFcUnSe', 259092, 'verified', '2021-10-10 11:58:50', 'testing my bio bruhhhh', '1634371178_thumbnail_IMG_20190303_0001.jpg', 0, '1633955682_orange-top-gradient-background.jpg', 0, 7258975, ''),
(59, 1, 'Amir Sabrin', 'AmirSabrin@gmail.com', '$2y$10$Eb2sth71Xr9l.y9yHVyUmeO8h3NEH.s1SFhpxNpNSGxPD6E51tXwK', 196742, 'verified', '2021-10-10 11:59:23', 'One of the Co-Creator of Esports Brunei', '1635135602_Miu.jpg', 0, '', 0, 8645562, ''),
(60, 1, 'Danial Kamsur', 'DanialKamsur@gmail.com', '$2y$10$N3.Oxc4gU057BeLAWG0ObO/JCH0n0L3lOAIbI6aQrMcoGF6cy7Kmq', 699403, 'verified', '2021-10-10 11:59:56', '', '', 0, '', 0, 0, ''),
(61, 1, 'NydiaWesdi', 'NydiaWesdi@gmail.com', '$2y$10$Np/5tD9xWEJ7BlSuxR3gz.tThLH4YXIH0KyUf.UFBhqUmkk9kSbn2', 917176, 'verified', '2021-10-10 12:00:25', '', '', 0, '', 0, 0, ''),
(69, 0, 'User', 'User@account', '$2y$10$z3rPG03xRJmi9O07XQmekuR3WfkWs8M0t5i5JmeBpuTYOpcxn0ma.', 0, 'verified', '2021-10-14 13:27:59', 'hello ', '1634994442_Miu.jpg', 0, '1634994607_bg.jpg', 3, 1234456, ''),
(91, 0, 'Zylioth', 'amirsabrin8@gmail.com', '$2y$10$XCTHmAHGy88uinkaMBgwV.Qs4srId0BfeBEdqplPtT0XOT/DhJKBO', 0, 'verified', '2021-10-27 13:12:53', 'Hello World', '1635416514_Miu.jpg', 0, '1635416688_cert.png', 1, 8645562, '&lt;p&gt;Official Organiser for Esports Brunei&lt;/p&gt;'),
(93, 0, 'kerol', 'kerolijat19@gmail.com', '$2y$10$yb0KROCOu30ZbhCbjSKYUuK1vKEK9oB56v.f/NRk/5rgqssSgqpRO', 0, 'verified', '2021-11-10 05:01:35', '', '1634018908_profile.png', 0, '', 0, 7258975, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_ibfk_1` (`topic_id`);

--
-- Indexes for table `game_list`
--
ALTER TABLE `game_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_like_unlike`
--
ALTER TABLE `tbl_like_unlike`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_id` (`team_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tbl_like_unlike`
--
ALTER TABLE `tbl_like_unlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
