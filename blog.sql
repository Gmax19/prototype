-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 08:20 AM
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
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `id` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`id`, `postid`, `userid`, `status`) VALUES
(45, 0, 98, 1),
(46, 55, 97, 1),
(47, 58, 97, 1),
(48, 62, 97, 1),
(49, 0, 97, 1),
(50, 64, 97, 1),
(51, 0, 97, 1),
(52, 0, 97, 1),
(53, 0, 97, 1),
(54, 0, 97, 1),
(55, 0, 97, 1),
(56, 0, 97, 1),
(57, 0, 97, 1),
(58, 0, 69, 1),
(59, 0, 69, 0),
(60, 55, 69, 1),
(61, 55, 69, 0),
(62, 0, 97, 0),
(63, 0, 58, 1);

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
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `participant_limit` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `category`, `s_price`, `currency`, `published`, `created_at`, `status`, `participant_limit`) VALUES
(52, 58, 10, 'Virtual  Titans Present - VALORANT TOURNAMENT', '1636634492_1633870021_961279.png', '&lt;p&gt;&lt;strong&gt;Valorant Tournament&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Information....&lt;/p&gt;&lt;p&gt;blablabbla&amp;nbsp;&lt;/p&gt;&lt;p&gt;join now!&lt;/p&gt;', 'Solo', 15.00, 'SGD', 1, '2021-10-11 10:02:23', 1, 4),
(69, 58, 10, 'Event Test', '1637632457_1633870021_961279.png', '&lt;p&gt;Testing aja kok mas&lt;/p&gt;', 'Solo', 5.00, 'SGD', 1, '2021-11-23 09:54:17', 1, 2),
(72, 58, 10, 'dsf', '1637817830_1634190231_G.jpg', '&lt;p&gt;fdsfds&lt;/p&gt;', 'Solo', 4.00, 'SGD', 1, '2021-11-25 13:23:50', 1, 12);

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
(5, 58, 52, 'PAYID-MGE4UOY9GY295054H900891S', 15.00, 'SGD', 'BJBD5WG3KURZY', 'Amir Sabrin Ali', 'amirsabrin@gmail.com', 'SG', 'approved', '2021-11-09 02:09:29'),
(33, 69, 52, 'PAYID-MGGQ5VI2WW783100S1559300', 15.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-11 13:39:02'),
(35, 91, 52, 'PAYID-MGIL6PI9TX98604P6928084A', 15.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-14 08:48:23'),
(44, 97, 52, 'PAYID-MGNZAHI1RK42422RA858690C', 11.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-22 13:42:14'),
(45, 58, 69, 'PAYID-MGOEWKA2CX59766XD879005B', 5.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-23 03:00:21'),
(46, 97, 69, 'PAYID-MGPDVAA84229231W62419333', 5.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-24 14:13:49'),
(47, 58, 70, 'PAYID-MGPQQDI4EK07662AR469744A', 12.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-25 04:50:49'),
(48, 58, 71, 'PAYID-MGPREGI9W758485GR946435E', 11.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-25 05:33:42'),
(49, 58, 72, 'PAYID-MGPR37I3S637310V1325912X', 4.00, 'SGD', 'UY6BNUUQWFWSU', 'John Doe', 'sb-e4vyr8091156@business.example.com', 'US', 'approved', '2021-11-25 06:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `pending`
--

CREATE TABLE `pending` (
  `id` int(255) NOT NULL,
  `member_id` int(255) NOT NULL,
  `team` int(255) NOT NULL,
  `approval` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pending`
--

INSERT INTO `pending` (`id`, `member_id`, `team`, `approval`) VALUES
(13, 36, 0, 0),
(14, 36, 0, 0),
(15, 39, 36, 0),
(16, 36, 36, 0),
(17, 69, 37, 0),
(18, 69, 38, 0),
(19, 69, 39, 0);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `published`, `created_at`) VALUES
(0, 49, 15, 'Halloween Update!', '1635416287_Phasmophobia_Halloween_Cover.png', '&lt;p&gt;Phasmophobia will receive a major update this Monday the 25th at 4PM BST!&lt;/p&gt;', 1, '2021-10-24 14:57:33'),
(55, 58, NULL, 'Effectively using smokes in VALORANT', '1633868454_post1.PNG', '&lt;h2&gt;In competitive VALORANT, smokes can be the difference maker. But who has the best smokes and where should you be placing them?&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;VALORANT Agents are divided into four main categories: duelists, controllers, sentinels, and initiators. The ability to drop &lsquo;smokes&rsquo; stretches across almost all of these different roles but primarily falls to the controllers and sentinels. These agents may not have flashy abilities, but their contributions give their team map control and space. In competitive VALORANT, a well placed smoke can be the difference maker between a round win or loss. With some many smoke Agents, as well as places to smoke, using smokes effectively can be difficult.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;Which Agents are the best smokers?&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Every smoke Agent has their own unique take on the ability. Whether it be range, duration, or even color there is some distinction between all playable smokers.&lt;/strong&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;strong&gt;Brimstone&amp;nbsp;is one of the best smokers in VALORANT and a great place to start for players looking to master controller Agents. Brimstone&rsquo;s has three, fairly high ranged smokes that you can drop from above. The benefit of Brimstone is that his&amp;nbsp;Sky Smoke gives an overhead perspective of the map, making his smokes some of the most precise in VALORANT.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Omen&amp;nbsp;is another viable smoke Agent. Also a controller, Omen allows for a little more play-making ability. His teleport and blinding ability make him more self-sufficient though come at the cost of his smokes.&amp;nbsp;Dark Cover&amp;nbsp;has only two charges and has a slightly below average duration. Omen&rsquo;s other abilities are useful in supplementing his smokes, making him more flexible in gaining ground.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;&amp;nbsp;Perhaps the most &lsquo;complex&rsquo; smoker Agent is&amp;nbsp;Astra. Astra&rsquo;s star system may appear daunting at first, but after mastery can be the most effective among other smoker. The five star charges can guarantee a max of five smokes on the map, however her other two abilities are just as effective in gaining map control. Similar to Brimstone, her astral projection gives her a bird&rsquo;s eye view of the map, but she has no range limits. Her incredible range and ability to lock down points on her own makes Astra the single best smoker in VALORANT.&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp;&lt;strong&gt;Viper and Jett are also Agents outside the controller role with viable smokes. Jett&rsquo;s Cloudburst has the lowest duration, as they are primarily meant to facilitate her personal play making ability. Viper&rsquo;s&amp;nbsp;Poison Cloud is an interesting alternative, as it has a range of 2-15 second duration. Viper alone is a poor mimic of a controller however, as her gas management is the sole decider of her effectiveness.&lt;/strong&gt;&lt;/li&gt;&lt;/ol&gt;&lt;h2&gt;&lt;strong&gt;Where to place smokes ?&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Knowing who is the best smoker is completely separate from knowing how to use smokes.&amp;nbsp; Every map is obviously different and have their own guides for smokers, however there are some generally applicable tips.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chokepoints and entrances are the two best spots to smoke when on the defense. This will force attackers to make the first move with little information, leaving them more likely to misplay. Attackers should focus smokes on known defense points. This includes &lsquo;heaven&rsquo; areas that overlook the bombsites, corners, and areas behind cover. Well-placed attacker smokes may even force defenders off the point as you move in, forcing them to play for the re-take.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;There plenty of other specific smoke scenarios. Using a smoke to cloud your spike plant or deplant is a common strategy. Knowledge of your map is ultimately what makes a great smoker, but these tips can get you started.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;', 1, '2021-10-10 20:20:54'),
(58, 58, 15, 'These are the teams in the Worlds 2021 Group Stage', '1633868936_post4.PNG', '&lt;h2&gt;&lt;strong&gt;After a historic and eventful play-ins stage, the groups for Worlds 2021 have been determined.&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Play-Ins for Worlds 2021 was just as historic as it was dramatic. For the first time, an LJL team, DetonatioN FocusMe, escaped Play-Ins and made it to Groups. LNG swept through Play-Ins without dropping a game while Cloud9 almost bowed out early. Beyond Gaming was engulfed in controversy just hours before the final series that sent Hanwha Life Esports to the main event.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;After the dust has settled, the final groups of Worlds 2021 have been cemented. With the main event looming and only one day of rest between, these are the groups.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group A &ndash; The Group of death&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Every year has one, a group with two unimaginably strong teams paired together seemingly destined to at least make quarter finals. Cloud9 will join the fray against FPX and Damwon Kia. After a shaky play-ins, Cloud9 are clear underdogs along with Rogue. The chances of escaping groups seems slim for Cloud9, and their weaker players will have to step up to show that the team is not simply prolonging the inevitable.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group B &ndash; Will DFM defy expectations?&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;Group B has one clear leader, Edward Gaming, and a team expected to end last with the addition of DFM. Despite having a historic Play-Ins with their star shining like never before, DFM are still expected to be outclassed. With heavy hitters like EDG, T1, and 100T between them, it seems unlike that the DFM Cinderella story will go any farther.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group C &ndash; Hanwha Life poised to shake up groups&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;br&gt;&lt;strong&gt;Group C is one of the more &lsquo;open&rsquo; groups in Worlds 2021. RNG have emerged as clear favorites with the race between Fnatic and PSG Talon being split down the middle. Hanwha Life&rsquo;s presence complicates this group significantly, as the team has one of the strongest midlanes and bottom lane duos in Worlds. Hanwha Life could claim one of the two available spots, though they are almost just as likely to crash and burn.&lt;/strong&gt;&lt;/p&gt;&lt;h2&gt;&lt;strong&gt;Group D &ndash; LNG, the Worlds sleeper pick&lt;/strong&gt;&lt;/h2&gt;&lt;p&gt;&lt;strong&gt;LNG may be the best team to ever compete in Play-Ins. The LPL fourth seed did not drop a single game and were the first squad to advance on to groups. Play-Ins have given the team time to learn the meta before continuing their journey into the most competitive group at Worlds. Though competition is stiff in Group D, as Team Liquid, Gen.G, and MAD Lions stand in their way, LNG could be a sleeper pick to win the entire tournament.&lt;/strong&gt;&lt;/p&gt;', 1, '2021-10-10 20:28:56'),
(62, 49, 15, 'FIFA to split with EA sports?!', '1635416265_fifa.jpg', '&lt;p&gt;FIFA is ending its long-term exclusive partnership with Electronic Arts as it looks to widen its gaming and esports portfolio.&lt;/p&gt;&lt;p&gt;The two parties first struck a deal in 1993 that will expire in 2022. FIFA is &lt;a href=&quot;https://www.nytimes.com/2021/10/13/sports/soccer/ea-sports-fifa.html&quot;&gt;reportedly&lt;/a&gt; seeking more than double its current &lt;strong&gt;$150 million&lt;/strong&gt; annual licensing fee.&lt;/p&gt;&lt;p&gt;FIFA&rsquo;s &lt;a href=&quot;https://www.fifa.com/news/fifa-set-to-widen-gaming-and-esports-portfolio&quot;&gt;statement&lt;/a&gt;, in part: &ldquo;It is clear that this needs to be a space that is occupied by more than one party controlling all rights.&rdquo;&lt;/p&gt;&lt;p&gt;The organization added that it will be in a better position to serve its 211 member associations as they take advantage of emerging opportunities in gaming and soccer.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;The &ldquo;FIFA&rdquo; series is estimated to be worth more than &lt;strong&gt;$2 billion&lt;/strong&gt; annually to EA.&lt;/li&gt;&lt;li&gt;Since its October 2020 release, &ldquo;FIFA 21&rdquo; had more than 31 million players.&lt;/li&gt;&lt;li&gt;&ldquo;FIFA 22&rdquo; already has 9.1 million players following its global release on Oct. 1.&lt;/li&gt;&lt;li&gt;More than 140 million people have played EA Sports titles over the last 12 months.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;EA &lt;a href=&quot;https://s22.q4cdn.com/894350492/files/doc_financials/2022/q1/Q1-FY22-Earnings-Release-Final.pdf&quot;&gt;posted&lt;/a&gt;&lt;strong&gt; $1.6 billion &lt;/strong&gt;in revenue in fiscal Q1, slightly up from $1.5 billion in the same period a year prior.&lt;/p&gt;&lt;p&gt;The results were driven by the company&rsquo;s live services segment, which generated $1.2 billion in revenue for the quarter. EA is projected to pocket &lt;strong&gt;$6.85 billion in revenue &lt;/strong&gt;in FY 2022.&lt;/p&gt;', 1, '2021-10-24 15:05:46'),
(64, 49, 9, 'Battlefield 2042', '1635416254_b2042.jpg', '&lt;p&gt;asasasasasas&lt;/p&gt;', 1, '2021-10-25 13:38:36');

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
(193, 0, '  asa', 'Izzat', '2021-11-24 18:46:19', 58, 0),
(194, 0, '  vxzvzx', 'kerol', '2021-11-24 19:40:25', 97, 0);

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
(83, 1, 193, 0, '2021-11-25 02:40:36');

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
(31, 'teamone', 'teamone', 0, 0, 0x313633363630363033325f313633363433323338353036302e706e67, 2),
(37, 't', 't', 87, 87, 0x313633373636343636365f646c7266584d354f6f6d4231675671516e3575316341375468776763537a57372e706e67, 2),
(38, 'testing', 'testing', 87, 87, 0x313633373830373631325f31303738303932362e6a7067, 2),
(39, 'testingg', 'testingg', 87, 87, 0x313633373830393137305f31303738303932362e6a7067, 8),
(40, 'Team A', 'ahmad', 97, 97, 0x313633373832343135355f313633333836383536355f706f7374322e504e47, 2),
(41, 'Team B', 'test', 97, 97, 0x313633373832343137355f313633353431363235345f62323034322e6a7067, 5),
(42, 'Team C', 'ahmaddasda', 97, 97, 0x313633373832343434355f313633333931373734335f4465736b746f702053637265656e73686f7420323032312e31302e3131202d2030392e35322e32352e3838202833292e706e67, 5);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(255) NOT NULL,
  `team_id` int(255) NOT NULL,
  `member_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `member_id`) VALUES
(41, 37, 87),
(45, 38, 87),
(46, 38, 69),
(47, 39, 87),
(48, 39, 69),
(49, 37, 69),
(50, 40, 97),
(51, 41, 97),
(52, 40, 69),
(53, 41, 91),
(54, 42, 97),
(55, 42, 91);

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
  `bio` text NOT NULL DEFAULT 'No Bio Yet ... ',
  `instagram` text NOT NULL DEFAULT 'EsportBrunei',
  `steam` text NOT NULL DEFAULT 'SteamID',
  `discord` text NOT NULL DEFAULT 'name#0000',
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

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `code`, `status`, `created_at`, `bio`, `instagram`, `steam`, `discord`, `pic`, `blocked`, `proof`, `organiser_status`, `phone_number`, `details`) VALUES
(39, 2, 'moderator', 'moderator@account.com', '$2y$10$vchXFR6v9ACXk5K0IqthOeSuFZtHQATgjXijZuJRU8oahsHYP4ygq', 0, 'verified', '2021-10-04 05:40:32', 'test saja', '', '', 'name#0000', '1633613077_profile.png', 0, '1633611742_Desktop Screenshot 2021.10.07 - 20.21.52.15.png', 0, 0, ''),
(49, 1, 'Admin', 'Admin@account.com', '$2y$10$IaNcXYmpQc8AEU0adOGY2.zh5syuROoi.zsGXSjYlakgNl76dPSM.', 174631, 'verified', '2021-10-05 12:02:29', 'Hello', '', '', 'name#0000', '1633768397_961279.png', 0, '1633612832_961279.png', 0, 7258975, ''),
(53, 3, 'organiser', 'organiser@account.com', '$2y$10$beRMPZP9OPrHPQewe4IOaOPmCyrtOVXTgOzKqngllBJJcBkjInlZ2', 904720, 'verified', '2021-10-08 03:21:09', 'This is the organiser\'s bio take a peek at my profile tehee', '', '', 'name#0000', '1633674352_Siesta (2).jpg', 0, '1633696357_Siesta (2).jpg', 2, 0, ''),
(58, 1, 'Izzat', 'izzat.latif4@gmail.com', '$2y$10$NuhnudBLupNPlYpmdpVZ1OwS/EblLe2Z7QTJHB1ZIm9f4VK1Vk/d6', 259092, 'verified', '2021-10-10 11:58:50', 'Hi it\'s Izzat , Head-developer for EsportsBrunei . Eventhough it looks like rotten carcass but hey .. there\'s room for improvement am I right ??? xD', 'izzxtlxtif', '76561198450007053', 'kerol#1903', '1636977941_1634037650_Siesta.jpg', 0, '1633955682_orange-top-gradient-background.jpg', 0, 7258975, ''),
(59, 1, 'Amir Sabrin', 'AmirSabrin@gmail.com', '$2y$10$Eb2sth71Xr9l.y9yHVyUmeO8h3NEH.s1SFhpxNpNSGxPD6E51tXwK', 196742, 'verified', '2021-10-10 11:59:23', 'One of the Co-Creator of Esports Brunei', '', '', 'name#0000', '1635135602_Miu.jpg', 0, '', 0, 8645562, ''),
(60, 1, 'Danial Kamsur', 'DanialKamsur@gmail.com', '$2y$10$N3.Oxc4gU057BeLAWG0ObO/JCH0n0L3lOAIbI6aQrMcoGF6cy7Kmq', 699403, 'verified', '2021-10-10 11:59:56', '', '', '', 'name#0000', '', 0, '', 0, 0, ''),
(61, 1, 'NydiaWesdi', 'NydiaWesdi@gmail.com', '$2y$10$Np/5tD9xWEJ7BlSuxR3gz.tThLH4YXIH0KyUf.UFBhqUmkk9kSbn2', 917176, 'verified', '2021-10-10 12:00:25', '', '', '', 'name#0000', '', 0, '', 0, 0, ''),
(69, 0, 'User', 'User@account', '$2y$10$bmz8mxpXx0P1fopabCvR3OnUTjKEDQNkxyl7/Fz5RYxCMj1TeNm2O', 0, 'verified', '2021-10-14 13:27:59', 'hello ', '', '', 'name#0000', '1636975942_1634018908_profile.png', 0, '1636976645_1634037650_Siesta.jpg', 1, 1234456, '&lt;p&gt;yo&lt;/p&gt;'),
(91, 0, 'Zylioth', 'amirsabrin8@gmail.com', '$2y$10$vchXFR6v9ACXk5K0IqthOeSuFZtHQATgjXijZuJRU8oahsHYP4ygq', 0, 'verified', '2021-10-27 13:12:53', 'Hello World', '_amir02', '76561199032818871', 'Zylioth#1580', '1635416514_Miu.jpg', 0, '1635416688_cert.png', 3, 8645562, '&lt;p&gt;Official Organiser for Esports Brunei&lt;/p&gt;'),
(97, 0, 'kerol', 'kerolijat19@gmail.com', '$2y$10$44pWXXHr9p2uMebQ5iXAu.AicwKBywV/exc0E3jXMBLKHqY23hA7m', 0, 'verified', '2021-11-22 12:41:08', 'No Bio Yet ... ', 'EsportBrunei', 'SteamID', 'name#0000', '1634018908_profile.png', 0, '1637587130_1634037650_Siesta.jpg', 1, 7258975, '&lt;h1&gt;fgsegfsdfvsfwfdsfsscsacsaca&lt;/h1&gt;&lt;p&gt;hfdhdfhfdhfdhdhd&lt;/p&gt;');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pending`
--
ALTER TABLE `pending`
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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `pending`
--
ALTER TABLE `pending`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `tbl_like_unlike`
--
ALTER TABLE `tbl_like_unlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
