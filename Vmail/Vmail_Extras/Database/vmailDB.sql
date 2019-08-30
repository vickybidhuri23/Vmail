CREATE DATABASE vmailDB;

USE vmailDB;

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int not null auto_increment unique key,
  `name` varchar(30) not null,
  `uname` varchar(30) not null primary key,
  `password` varchar(1000) not null,
  `email` varchar(30) not null ,
  `mobile` int not null,
  `hash` varchar(1000) DEFAULT NULL,
  `nonce` varchar(1000) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'user');
  
  
INSERT INTO register (id,name,uname,password,email,mobile,hash,nonce,role)
VALUES (1,'Administrator','admin','fpHQfa67ae9Q1DpCdiVe2/UgmpE+s3jpg+aKXnAZevYBOyQok8TnCp63CwaS3cJB','admin@vmail.com','0899345678','$s0$e0801$ymD5tE40UEd0gJhEgcVsMA==$1N4MolikanQi2Gxzqexs7Q2txWlLc6GPV249EiQQYU8=','z5ZzU/oy1SY+eanuhvQoWiPwvgjYSh0wpG+34veuXBY=','admin');

DROP TABLE IF EXISTS `compose`;

CREATE TABLE `compose` (
  `id` int not null auto_increment unique key,
  `fromMail` varchar(30) default null,
  `toMail` varchar(50) default null,
  `subject` varchar(100) default null,
  `message` varchar(1000) default null,
  `vStatus` varchar(10) default 'new',
  `mStatus` varchar(10) default 'inbox');
  


