-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2019 lúc 04:18 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dating`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `connect`
--

CREATE TABLE `connect` (
  `id_connect` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `object` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_likes`
--

CREATE TABLE `ct_likes` (
  `id` int(11) NOT NULL,
  `user_likes` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `date_posted` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `Id_images` int(11) NOT NULL,
  `images_url` varchar(200) NOT NULL,
  `relation` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_posted` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `mess_id` int(11) NOT NULL,
  `id_connect` int(11) NOT NULL,
  `mess` varchar(500) NOT NULL,
  `date_sent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request`
--

CREATE TABLE `request` (
  `id_request` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `maximum_range` int(4) DEFAULT NULL,
  `min_age` int(2) NOT NULL DEFAULT '18',
  `max_age` int(2) NOT NULL,
  `gender` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `DOB` date DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `reported` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `phone_number`, `password`, `DOB`, `gender`, `email`, `address`, `location`, `description`, `active`, `reported`) VALUES
(1, 'abc', '0787339669', '', '1999-02-09', 0, 'duongvvps07175@fpt.edu.vn', '911/6 tân kì tân quý', '', 'ước gì có người kết nối để nhắn tin', 1, 0),
(2, 'abc', '287339669', '', NULL, 0, 'adsdad', 'dâd', '', 'sdsadd', 0, 0),
(3, 'abc', '287339669', '', '2016-10-11', 0, '324324', '32wefd', '', 'fsdf32', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`id_connect`),
  ADD KEY `object` (`object`),
  ADD KEY `user` (`user`);

--
-- Chỉ mục cho bảng `ct_likes`
--
ALTER TABLE `ct_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_likes` (`user_likes`),
  ADD KEY `ct_likes_ibfk_2` (`user`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id_images`),
  ADD KEY `relation` (`relation`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`mess_id`),
  ADD KEY `id_connect` (`id_connect`);

--
-- Chỉ mục cho bảng `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `user` (`user`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `connect`
--
ALTER TABLE `connect`
  MODIFY `id_connect` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ct_likes`
--
ALTER TABLE `ct_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `Id_images` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `mess_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `connect`
--
ALTER TABLE `connect`
  ADD CONSTRAINT `connect_ibfk_3` FOREIGN KEY (`object`) REFERENCES `ct_likes` (`user_likes`),
  ADD CONSTRAINT `connect_ibfk_4` FOREIGN KEY (`user`) REFERENCES `ct_likes` (`user`);

--
-- Các ràng buộc cho bảng `ct_likes`
--
ALTER TABLE `ct_likes`
  ADD CONSTRAINT `ct_likes_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`relation`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `images_ibfk_2` FOREIGN KEY (`relation`) REFERENCES `messages` (`mess_id`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_connect`) REFERENCES `connect` (`id_connect`);

--
-- Các ràng buộc cho bảng `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
