-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 23 2020 г., 12:49
-- Версия сервера: 5.5.16
-- Версия PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `myshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'Браслеты'),
(2, 0, 'Кольца'),
(3, 0, 'На Шею'),
(4, 0, 'Серьги'),
(5, 0, 'Аксессуары'),
(6, 1, 'Мужские Стальные Браслеты'),
(7, 1, 'Мужские Кожаные Браслеты'),
(8, 2, 'Мужские Стальные Кольца'),
(9, 2, 'Мужские Вольфрамовые Кольца'),
(10, 3, 'Подвески с черепом'),
(11, 3, 'Кулоны и подвески'),
(12, 3, 'Цепи и Цепочки'),
(13, 5, 'Запонки'),
(14, 5, 'Зажимы Для Галстуков');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `user_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_created`, `date_payment`, `date_modification`, `status`, `comment`, `user_ip`) VALUES
(1, 2, '2020-11-22 15:22:58', NULL, '2020-11-22 14:22:58', 0, 'id пользователя: 2<br/>\r\n                Имя: nnnn<br/>\r\n                Тел: 87778887788<br/>\r\n                Адрес: aaaaa', '127.0.0.1'),
(2, 3, '2020-11-22 15:29:19', NULL, '2020-11-22 14:29:19', 0, 'id пользователя: 3<br/>\r\n                Имя: <br/>\r\n                Тел: <br/>\r\n                Адрес: ', '127.0.0.1'),
(3, 3, '2020-11-22 16:07:23', NULL, '2020-11-22 15:07:23', 0, 'id пользователя: 3<br/>\r\n                Имя: aa<br/>\r\n                Тел: 87025858574<br/>\r\n                Адрес: Адрес 15', '127.0.0.1'),
(4, 5, '2020-11-22 16:55:04', NULL, '2020-11-22 15:55:04', 0, 'id пользователя: 5<br/>\r\n                Имя: Balapan<br/>\r\n                Тел: 87787787878<br/>\r\n                Адрес: Nursultan, Balapan 78', '127.0.0.1'),
(5, 5, '2020-11-22 20:00:47', NULL, '2020-11-22 19:00:47', 0, 'id пользователя: 5<br/>\r\n                Имя: Balapan<br/>\r\n                Тел: 87787787878<br/>\r\n                Адрес: Nursultan, Balapan 78', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `status`) VALUES
(1, 6, 'Стальной Браслет MR.SMITH <br />MS-7031-BLS', ' <p>Ювелирная сталь - бессменная классика на все времена, обладающая спокойным, уверенным благородством королевского клинка. Простая честная всегда была любима людьми со стальным характером!</p><br /><p>Характеристики:</p><ul><li>Производитель : MR.SMITH</li><li>Материал : Сталь</li><li>Ширина : 6 мм</li><li>Производство : Таиланд </li><li>Длина : 220 мм</li></ul>', 7500, '1.png', 1),
(2, 7, 'Вольфрамовый Браслет MR.SMITH <br />MS-TG-013', '<p>Способствуют расширению кровеносных сосудов и улучшению кровообращения. Стабилизируют артериальное давление. Благодаря их воздействию клетки получают больше кислорода и питательных веществ, нормализуют метаболизм, что способствует снижению массы тела, укрепляют иммунитет, уменьшают усталость, сонливость и вялость. Повышают тонус и упругость кожи, снижают боли в суставах. </p><br /><p>Характеристики:</p><ul><li>Производитель : MR.SMITH</li><li>Материал : Вольфрам</li><li>Ширина : 10 мм</li><li>Производство : Таиланд </li><li>Длина : 220 мм</li><li>Шаг звена : 11</li></ul>', 17500, '2.png', 1),
(3, 8, 'Стальное Кольцо SPIKES <br />010208', 'Характеристики:</p><ul><li>Производитель : Spikes</li><li>Материал : Сталь</li><li>Ширина : 8 мм</li><li>Производство : США</li></ul>', 3000, '3.png', 1),
(4, 9, 'Вольфрамовое Кольцо Spikes <br />R-TU-7017M', '<p>Характеристики:</p><ul><li>Производитель : Spikes</li><li>Материал : Сталь</li><li>Ширина : 5 мм</li><li>Производство : США</li></ul>', 12500, '4.png', 1),
(5, 10, 'Кулон С Черепом Fashion Steel <br />FS-ST013', '<p>Характеристики:</p><ul><li>Производитель : Respect Steel</li><li>Материал : Сталь</li><li>Ширина : 20 мм</li><li>Высота : 55 мм</li><li>Производство : США</li></ul>', 6000, '5.png', 1),
(6, 11, 'Кулон SPIKES <br />SS-2314-PQ', '<p>Характеристики:</p><ul><li>Производитель : Respect Steel</li><li>Материал : Сталь</li><li>Ширина : 25 мм</li><li>Высота : 46 мм</li><li>Производство : США</li></ul>', 8000, '6.png', 1),
(7, 13, 'Запонки Man Power Elegance <br />MACS115', '<p>Man Power Elegance   - это солидные аксессуары, убедительно завершающие мужской образ, а также демонстрирующие неповторимый стиль и эстетическое совершенство ! Украшения выполнены  из -– стали марки 316 L- бессмертной классики ,с покрытием из розового золота.</p><br /><p>Характеристики:</p><ul><li>Материал : Сталь</li><li>Ширина : 15 мм</li><li>Высота : 15 мм</li><li>Производство : США</li></ul>', 8800, '7.png', 1),
(8, 14, 'Зажим Для Галстука Man Power Wooden <br />MATS45', '<p>Изделия мужского бренда Man Power выполнены в современном стиле для деловых мужчин, предпочитающих классику. Аксессуары имеют лаконичный дизайн, идеально дополняющий строгий стиль сильной половины.</p><br /><p>Характеристики:</p><ul><li>Материал : Титан</li><li>Ширина : 7 мм</li><li>Высота : 45 мм</li><li>Производство : США</li></ul>', 10200, '8.png', 1),
(9, 12, 'Широкая Цепь Spikes <br />FS-7093', '<p>Характеристики:</p><ul><li>Производитель : Spikes</li><li>Материал : Сталь</li><li>Ширина : 9 мм</li><li>Толщина : 2,5 мм</li><li>Высота : 65 см</li><li>Производство : США</li></ul>', 9500, '9.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `purchase`
--

INSERT INTO `purchase` (`id`, `order_id`, `product_id`, `price`, `amount`) VALUES
(1, 1, 8, 10200, 1),
(2, 2, 6, 8000, 1),
(3, 3, 5, 6000, 1),
(4, 4, 7, 8800, 1),
(5, 4, 9, 9500, 2),
(6, 5, 9, 9500, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `pwd`, `name`, `phone`, `address`) VALUES
(1, 'n.altynbekkyzy@mail.ru', '827ccb0eea8a706c4c34a16891f84e7b', '', '', ''),
(2, 'nn', '827ccb0eea8a706c4c34a16891f84e7b', 'nnnn', '87778887788', 'aaaaa'),
(3, 'aa', '202cb962ac59075b964b07152d234b70', 'alma', '87788882125', 'Нұрсұлтан қ.,Сарайшық 15'),
(4, 'aaa', '202cb962ac59075b964b07152d234b70', '', '', ''),
(5, 'balapanbalapanb@mail.ru', '827ccb0eea8a706c4c34a16891f84e7b', 'Balapan', '87787787878', 'Nursultan, Balapan 78');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
