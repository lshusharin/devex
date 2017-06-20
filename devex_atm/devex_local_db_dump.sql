-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 16 2017 г., 10:31
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `devex_local`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add cards', 7, 'add_cards'),
(20, 'Can change cards', 7, 'change_cards'),
(21, 'Can delete cards', 7, 'delete_cards'),
(22, 'Can add available operations', 8, 'add_availableoperations'),
(23, 'Can change available operations', 8, 'change_availableoperations'),
(24, 'Can delete available operations', 8, 'delete_availableoperations'),
(25, 'Can add operations log', 9, 'add_operationslog'),
(26, 'Can change operations log', 9, 'change_operationslog'),
(27, 'Can delete operations log', 9, 'delete_operationslog');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cashmachine_availableoperations`
--

CREATE TABLE `cashmachine_availableoperations` (
  `id` int(11) NOT NULL,
  `operation_name` varchar(255) NOT NULL,
  `operation_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cashmachine_availableoperations`
--

INSERT INTO `cashmachine_availableoperations` (`id`, `operation_name`, `operation_url`) VALUES
(1, 'Cash', '/payout/'),
(2, 'Balance', '/balance/');

-- --------------------------------------------------------

--
-- Структура таблицы `cashmachine_cards`
--

CREATE TABLE `cashmachine_cards` (
  `id` int(11) NOT NULL,
  `cardnum` varchar(19) NOT NULL,
  `password` varchar(32) NOT NULL,
  `balance` double NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `wrong_pass_counter` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cashmachine_cards`
--

INSERT INTO `cashmachine_cards` (`id`, `cardnum`, `password`, `balance`, `is_active`, `wrong_pass_counter`) VALUES
(1, '1111-1111-1111-1111', 'b59c67bf196a4758191e42f76670ceba', 40910.58, 1, 0),
(2, '2222-2222-2222-2222', '934b535800b1cba8f96a5d72f72f1611', 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cashmachine_operationslog`
--

CREATE TABLE `cashmachine_operationslog` (
  `id` int(11) NOT NULL,
  `payout` double DEFAULT NULL,
  `time` datetime NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cashmachine_operationslog`
--

INSERT INTO `cashmachine_operationslog` (`id`, `payout`, `time`, `card_id`, `operation_id`) VALUES
(1, NULL, '2017-06-15 09:57:57', 1, 2),
(2, 111, '2017-06-15 10:27:46', 1, 1),
(3, NULL, '2017-06-15 10:27:46', 1, 2),
(4, NULL, '2017-06-15 10:27:46', 1, 2),
(5, NULL, '2017-06-15 11:49:33', 1, 2),
(6, 555, '2017-06-15 11:49:33', 1, 1),
(7, 4111, '2017-06-15 11:49:33', 1, 1),
(8, 2222, '2017-06-15 11:49:33', 1, 1),
(9, 222, '2017-06-15 11:49:33', 1, 1),
(10, 111, '2017-06-15 14:43:46', 1, 1),
(11, NULL, '2017-06-15 14:43:46', 1, 2),
(12, NULL, '2017-06-15 14:43:46', 1, 2),
(13, NULL, '2017-06-15 14:43:46', 1, 2),
(14, NULL, '2017-06-15 14:45:16', 1, 2),
(15, NULL, '2017-06-16 06:44:12', 2, 2),
(16, NULL, '2017-06-16 06:44:12', 2, 2),
(17, NULL, '2017-06-16 06:44:12', 2, 2),
(18, NULL, '2017-06-16 09:59:14', 1, 2),
(19, NULL, '2017-06-16 09:59:14', 1, 2),
(20, NULL, '2017-06-16 09:59:14', 1, 2),
(21, NULL, '2017-06-16 09:59:14', 1, 2),
(22, NULL, '2017-06-16 09:59:14', 1, 2),
(23, NULL, '2017-06-16 09:59:14', 1, 2),
(24, NULL, '2017-06-16 09:59:14', 1, 2),
(25, NULL, '2017-06-16 10:20:18', 1, 2),
(26, NULL, '2017-06-16 10:22:40', 1, 2),
(27, NULL, '2017-06-16 10:22:40', 1, 2),
(28, NULL, '2017-06-16 10:23:11', 1, 2),
(29, NULL, '2017-06-16 10:23:11', 1, 2),
(30, NULL, '2017-06-16 10:23:11', 1, 2),
(31, NULL, '2017-06-16 10:25:08', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'cashmachine', 'cards'),
(8, 'cashmachine', 'availableoperations'),
(9, 'cashmachine', 'operationslog');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-06-12 14:33:11'),
(2, 'auth', '0001_initial', '2017-06-12 14:33:12'),
(3, 'admin', '0001_initial', '2017-06-12 14:33:13'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-06-12 14:33:13'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-06-12 14:33:13'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-06-12 14:33:13'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-06-12 14:33:13'),
(8, 'auth', '0004_alter_user_username_opts', '2017-06-12 14:33:13'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-06-12 14:33:13'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-06-12 14:33:13'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-06-12 14:33:13'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-06-12 14:33:13'),
(13, 'sessions', '0001_initial', '2017-06-12 14:33:14'),
(14, 'cashmachine', '0001_initial', '2017-06-13 14:43:31'),
(15, 'cashmachine', '0002_auto_20170613_1752', '2017-06-13 14:52:40'),
(16, 'cashmachine', '0003_auto_20170615_1157', '2017-06-15 08:57:47'),
(17, 'cashmachine', '0004_auto_20170615_1257', '2017-06-15 09:57:53'),
(18, 'cashmachine', '0005_auto_20170615_1642', '2017-06-15 13:42:42');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9bir43gll8q2ci21xs4yt89p0vroozpb', 'ZjcwYjYxYTk4NDc1OWE1NTAzOTNhZGE3NGU4NGVlNzc3MTk4ZjJhMzp7InBhc3N3ZCI6IjExMTEiLCJjYXJkX251bSI6IjExMTEtMTExMS0xMTExLTExMTEifQ==', '2017-06-30 10:27:37'),
('buxylhe0l8gfltzmdx8iyc12gjbrjpgz', 'ODgzNmQ3YmI5N2M1NDg3MjViMTZjYmIxMjJlNGNiYzMyNzE0MmM5Mjp7InBhc3N3ZCI6ImI1OWM2N2JmMTk2YTQ3NTgxOTFlNDJmNzY2NzBjZWJhIiwiYmFsYW5jZSI6NDEyNDMuNTgsImNhcmRfbnVtIjoiMTExMS0xMTExLTExMTEtMTExMSIsImNhcmRfaWQiOjEsIndyb25nX3Bhc3MiOjB9', '2017-06-29 12:41:13');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`);

--
-- Индексы таблицы `cashmachine_availableoperations`
--
ALTER TABLE `cashmachine_availableoperations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashmachine_cards`
--
ALTER TABLE `cashmachine_cards`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashmachine_operationslog`
--
ALTER TABLE `cashmachine_operationslog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashmachine_operationslog_card_id_a704960b` (`card_id`),
  ADD KEY `cashmachine_operationslog_operation_id_76c2c384` (`operation_id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cashmachine_availableoperations`
--
ALTER TABLE `cashmachine_availableoperations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `cashmachine_cards`
--
ALTER TABLE `cashmachine_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `cashmachine_operationslog`
--
ALTER TABLE `cashmachine_operationslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
