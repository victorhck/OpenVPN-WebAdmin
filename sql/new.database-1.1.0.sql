SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `groupnames` (
  `gname` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `log_trusted_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_trusted_port` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_remote_ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_remote_port` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_end_time` timestamp NULL DEFAULT NULL,
  `log_received` float NOT NULL DEFAULT 0,
  `log_send` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `sessions2` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` datetime NOT NULL,
  `expireref` varchar(250) DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `sessdata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `user_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gid` int(10) NOT NULL,
  `user_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_mail` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_online` tinyint(1) NOT NULL DEFAULT 0,
  `user_enable` tinyint(1) NOT NULL DEFAULT 1,
  `user_start_date` date DEFAULT NULL,
  `user_end_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `usergroups` (
  `gid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `gname` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `groupnames`
  ADD PRIMARY KEY (`gname`);

ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `user_pass` (`user_pass`);

ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`gid`);


ALTER TABLE `groupnames`
  MODIFY `gname` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usergroups`
  MODIFY `gid` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

INSERT INTO `groupnames` (`gname`, `name`) VALUES
(1, 'admin'),
(2, 'user');

INSERT INTO `usergroups` (`gid`, `uid`, `gname`) VALUES
(1, 1, 1),
(2, 2, 2);
COMMIT;

INSERT INTO `log` (`log_id`, `user_id`, `log_trusted_ip`, `log_trusted_port`, `log_remote_ip`, `log_remote_port`, `log_start_time`, `log_end_time`, `log_received`, `log_send`) VALUES
(1, 'example', '2.247.242.183', '25417', '10.8.0.6', '1194', '2020-03-24 09:08:10', '2020-03-24 09:09:33', 1616, 3666),
(2, 'example', '2.247.242.183', '30672', '10.8.0.6', '1194', '2020-03-24 09:09:33', '2020-03-24 09:13:54', 2879, 4404);
