-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 03:48 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweetdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `time`) VALUES
(7, 'ThankYou :)', 1, 19, '2023-08-06 17:32:26'),
(8, 'Nice Quote', 1, 18, '2023-08-06 17:33:08'),
(9, 'Absolutely', 5, 17, '2023-08-06 17:58:42'),
(10, 'aahaan', 4, 17, '2023-08-06 18:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `following_id`, `time`) VALUES
(1, 2, 1, '2023-08-06 07:47:54'),
(2, 1, 2, '2023-08-06 17:31:27'),
(3, 3, 1, '2023-08-06 17:33:35'),
(4, 4, 1, '2023-08-06 17:45:41'),
(5, 5, 1, '2023-08-06 17:52:57'),
(6, 5, 3, '2023-08-06 17:57:28'),
(7, 5, 2, '2023-08-06 17:57:31'),
(9, 6, 1, '2023-08-06 18:02:53'),
(10, 4, 2, '2023-08-06 18:20:23'),
(11, 4, 6, '2023-08-06 18:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(320, 2, 17),
(321, 2, 16),
(322, 1, 20),
(323, 1, 18),
(324, 5, 21),
(325, 5, 19),
(326, 5, 18),
(327, 5, 23),
(328, 5, 22),
(329, 6, 17),
(330, 6, 16),
(331, 6, 22),
(332, 6, 21),
(333, 6, 24),
(334, 6, 23),
(335, 6, 20),
(336, 6, 19),
(337, 6, 18),
(338, 2, 20),
(339, 4, 23),
(340, 4, 22),
(341, 4, 17),
(342, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notify_for` int(11) NOT NULL,
  `notify_from` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','like','retweet','qoute','comment','reply','mention') COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notify_for`, `notify_from`, `target`, `type`, `time`, `count`, `status`) VALUES
(8, 1, 2, 17, 'like', '2023-08-06 17:20:58', 0, 0),
(9, 1, 2, 19, 'qoute', '2023-08-06 17:23:46', 0, 0),
(10, 1, 2, 16, 'like', '2023-08-06 17:24:05', 0, 0),
(11, 2, 1, 0, 'follow', '2023-08-06 17:31:27', 1, 0),
(12, 2, 1, 20, 'like', '2023-08-06 17:31:57', 1, 0),
(13, 2, 1, 19, 'comment', '2023-08-06 17:32:26', 1, 0),
(14, 2, 1, 18, 'like', '2023-08-06 17:32:41', 1, 0),
(15, 2, 1, 18, 'comment', '2023-08-06 17:33:08', 1, 0),
(16, 1, 3, 0, 'follow', '2023-08-06 17:33:35', 0, 0),
(17, 1, 4, 0, 'follow', '2023-08-06 17:45:42', 0, 0),
(18, 1, 5, 0, 'follow', '2023-08-06 17:52:57', 0, 0),
(19, 3, 5, 0, 'follow', '2023-08-06 17:57:28', 0, 0),
(20, 2, 5, 0, 'follow', '2023-08-06 17:57:30', 1, 0),
(21, 3, 5, 21, 'like', '2023-08-06 17:57:48', 0, 0),
(22, 3, 5, 21, 'retweet', '2023-08-06 17:57:51', 0, 0),
(23, 2, 5, 19, 'like', '2023-08-06 17:58:04', 1, 0),
(24, 2, 5, 18, 'like', '2023-08-06 17:58:06', 1, 0),
(25, 1, 5, 17, 'comment', '2023-08-06 17:58:42', 0, 0),
(26, 4, 5, 23, 'like', '2023-08-06 17:59:01', 1, 0),
(27, 4, 5, 22, 'like', '2023-08-06 17:59:05', 1, 0),
(28, 4, 5, 22, 'retweet', '2023-08-06 17:59:09', 1, 0),
(30, 1, 6, 0, 'follow', '2023-08-06 18:02:53', 0, 0),
(31, 1, 6, 17, 'like', '2023-08-06 18:13:52', 0, 0),
(32, 1, 6, 17, 'retweet', '2023-08-06 18:13:55', 0, 0),
(33, 1, 6, 16, 'like', '2023-08-06 18:14:09', 0, 0),
(34, 4, 6, 22, 'like', '2023-08-06 18:14:19', 1, 0),
(35, 3, 6, 21, 'like', '2023-08-06 18:14:21', 0, 0),
(36, 5, 6, 24, 'like', '2023-08-06 18:14:23', 0, 0),
(37, 4, 6, 23, 'like', '2023-08-06 18:14:33', 1, 0),
(38, 2, 6, 20, 'like', '2023-08-06 18:14:55', 1, 0),
(39, 2, 6, 19, 'like', '2023-08-06 18:15:00', 1, 0),
(40, 2, 6, 18, 'like', '2023-08-06 18:15:01', 1, 0),
(41, 1, 4, 17, 'like', '2023-08-06 18:20:05', 0, 0),
(42, 1, 4, 16, 'like', '2023-08-06 18:20:10', 0, 0),
(43, 2, 4, 0, 'follow', '2023-08-06 18:20:23', 0, 0),
(44, 6, 4, 0, 'follow', '2023-08-06 18:20:33', 0, 0),
(46, 1, 4, 17, 'comment', '2023-08-06 18:23:05', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_on`) VALUES
(16, 1, '2023-08-06 17:09:54'),
(17, 1, '2023-08-06 17:10:59'),
(18, 2, '2023-08-06 17:21:57'),
(19, 2, '2023-08-06 17:23:46'),
(20, 2, '2023-08-06 17:27:51'),
(21, 3, '2023-08-06 17:40:45'),
(22, 4, '2023-08-06 17:50:44'),
(23, 4, '2023-08-06 17:51:55'),
(24, 5, '2023-08-06 17:56:46'),
(25, 5, '2023-08-06 17:57:51'),
(26, 5, '2023-08-06 17:59:09'),
(27, 6, '2023-08-06 18:09:32'),
(28, 6, '2023-08-06 18:13:25'),
(29, 6, '2023-08-06 18:13:55'),
(30, 4, '2023-08-06 18:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retweets`
--

CREATE TABLE `retweets` (
  `post_id` int(11) NOT NULL,
  `retweet_msg` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `retweet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `retweets`
--

INSERT INTO `retweets` (`post_id`, `retweet_msg`, `tweet_id`, `retweet_id`) VALUES
(19, 'Well Said', 17, NULL),
(25, NULL, 21, NULL),
(26, NULL, 22, NULL),
(29, NULL, 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `id` int(11) NOT NULL,
  `hashtag` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`id`, `hashtag`, `created_on`) VALUES
(16, 'coding', '2023-08-06 17:40:45'),
(17, 'php', '2023-08-06 17:40:45'),
(18, 'webkul', '2023-08-06 17:40:45'),
(19, 'happy', '2023-08-06 17:50:44'),
(20, 'career', '2023-08-06 17:50:45'),
(21, 'enjoy', '2023-08-06 17:50:45'),
(22, 'happ', '2023-08-06 17:56:46'),
(23, 'hiring', '2023-08-06 17:56:47'),
(24, 'BDE', '2023-08-06 17:56:47'),
(25, 'biden', '2023-08-06 18:13:25'),
(26, 'americafriendship', '2023-08-06 18:13:25'),
(27, 'sundayFunday', '2023-08-06 18:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `post_id` int(11) NOT NULL,
  `status` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf16_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`post_id`, `status`, `img`) VALUES
(16, 'We are a team of experts that empower businesses globally to adopt the digital transformation path for their success.', 'tweet-64cf868a213f2.jpg'),
(17, 'Make each moment a celebration.', NULL),
(18, 'Keep your face always toward the sunshineâ€”and shadows will fall behind you.', NULL),
(20, 'Of course, bad code can be cleaned up. But itâ€™s very expensive.', 'tweet-64cf8abf7128a.jpg'),
(21, 'Itâ€™s not a bug; itâ€™s an undocumented feature.\r\n#coding \r\n#php\r\n#webkul', NULL),
(22, 'True happiness is found by living in the present moment. #happy\r\n#webkul\r\n#career\r\n#enjoy', 'tweet-64cf901c8dd78.jpg'),
(23, '#webkul', NULL),
(24, 'If you do good, people will accuse you of selfish ulterior motives.\r\nDo good anyway.\r\n#happ\r\n#webkul\r\n#hiring\r\n#php\r\n#BDE', NULL),
(27, 'â€œOnce we decide we have to do something, we can go miles ahead.â€ Narendra Modi', NULL),
(28, 'If you are successful, you will win false friends and true enemies.\r\nSucceed anyway.\r\n#biden\r\n#americafriendship', 'tweet-64cf956d8342f.jpg'),
(30, '#happy\r\n#sundayFunday', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf16_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `imgCover` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'cover.png',
  `bio` varchar(140) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `img`, `imgCover`, `bio`, `location`, `website`) VALUES
(1, 'Webkul', 'webkul@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Webkul', 'user-64cf8149c6f39.jpg', 'user-64cf8149c6f49.jpg', 'IT Services and IT Consulting Noida, Uttar Pradesh', 'webkul,noida', 'https://webkul.com/'),
(2, 'vibhor', 'vibhor@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Vibhor Saini', 'user-64cf88d3c464e.jpg', 'user-64cf88d3c465d.jpg', 'Web Developer in Webblaze softtech', '302, E-193, Phase 8B, Industrial Area, Sector 74, Sahibzada Ajit Singh Nagar', 'https://vibhor-saini.github.io/PORTFOLIO./'),
(3, 'VipinSahu', 'vipinsahu@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Vipin Sahu', 'user-64cf8c624b098.jpg', 'user-64cf8c624b0a9.png', 'Co-Founder, Webkul', 'webkul,noida', 'https://www.linkedin.com/in/vipinsahu/?originalSubdomain=in'),
(4, 'NikitaJoshi', 'nikita@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Nikita Joshi', 'user-64cf8f1706800.jpg', 'user-64cf8f170680e.jpg', 'Software Quality Analyst at Webkul', 'webkul, H-28, ARV Park, Sector 63, Noida, Uttar Pradesh 201301', 'https://www.linkedin.com/in/nikita-joshi-005b8b175/'),
(5, 'SakshiMishra', 'sakshi@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Sakshi Mishra', 'user-64cf9134dfe29.jpg', 'user-64cf9134dfe38.jpg', 'Sakshi Mishra ( Hiring for Php Developer and BDE)', 'Noida', 'https://www.linkedin.com/in/sakshi-mishra-hiring-for-php-developer-and-bde-604691148/'),
(6, 'NarendraModi', 'modi@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Narendra Modi', 'user-64cf93fe97df8.jpg', 'user-64cf93fe97e05.jpg', 'Prime Minister Of India', 'Lok Kalyan Marg,Delhi', 'narendramodi.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `likes_ibfk_2` (`post_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_ibfk_1` (`notify_for`),
  ADD KEY `notifications_ibfk_2` (`notify_from`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweets`
--
ALTER TABLE `retweets`
  ADD PRIMARY KEY (`post_id`) USING BTREE,
  ADD KEY `retweet_id` (`retweet_id`),
  ADD KEY `retweets_ibfk_2` (`tweet_id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notify_for`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notify_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retweets`
--
ALTER TABLE `retweets`
  ADD CONSTRAINT `retweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_3` FOREIGN KEY (`retweet_id`) REFERENCES `retweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
