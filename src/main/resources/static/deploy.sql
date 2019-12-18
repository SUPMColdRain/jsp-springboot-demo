-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.17

-- ===============================================================
-- ----------------------- Cutting Line --------------------------
-- ===============================================================

-- node-mysql 最新版本仍不支持 mysql 80 版本高强度密码，应当改为 51 版本弱密码
-- alter user 'root'@'host' identified with mysql_native_password by 'password'

CREATE DATABASE test;

-- create user 'username'@'host' identified by 'password';
-- username：你将创建的用户名
-- host：指定该用户在哪个主机上可以登陆，如果是本地用户可用localhost，如果想让该用户可以从任意远程主机登陆，可以使用通配符%
-- password：该用户的登陆密码，密码可以为空，如果为空则该用户可以不需要密码登陆服务器
CREATE USER IF NOT EXISTS 'test'@'%' IDENTIFIED BY 'test';

-- grant privileges on databaseName.tableName to 'username'@'host';
-- privileges：用户的操作权限，如select，insert，update等，如果要授予所的权限则使用all
-- databaseName：数据库名
-- tableName：表名，如果要授予该用户对所有数据库和表的相应操作权限则可用*表示，如*.*
GRANT ALL PRIVILEGES ON test.* TO 'test'@'%';

-- 用以上命令授权的用户不能给其它用户授权，如果想让该用户可以授权，用以下命令
-- grant privileges on databaseName.tableName to 'username'@'host' with grant option;

-- 刷新权限
FLUSH PRIVILEGES;

-- 设置与更改用户密码
-- set password for 'username'@'host' = password('newPassword');
-- 如果是当前登陆用户用
-- set password = password("newPassword");

-- 撤销用户权限
-- revoke privilege on databaseName.tableName from 'username'@'host';

-- 删除用户
-- drop user 'username'@'host';

-- show grants for 'test'@'localhost';
-- select user, host from mysql.user;

USE test;
-- mysql 5.6 版本以下创建表中有两个timestamp类型字段会报错
-- 解决方案1：一个使用timestamp类型，另一个使用datetime类型
-- 解决方案2：使用触发器
-- create trigger <trigger_name> before insert on <table_name>
--   for each row set new.<timestamp_field> = current_timestamp;
-- 解决方案3：升级到 mysql 5.6 以上的版本

-- ===============================================================
-- ----------------------- Cutting Line --------------------------
-- ===============================================================


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student`
(
    `id`         int(11)     NOT NULL AUTO_INCREMENT,
    `stuName`    varchar(12) NOT NULL,
    `sex`        varchar(4)  NOT NULL DEFAULT '未知',
    `age`        int(11)     NOT NULL DEFAULT '0',
    `jsp`        int(11)     NOT NULL DEFAULT '0',
    `math`       int(11)     NOT NULL DEFAULT '0',
    `c`          int(11)     NOT NULL DEFAULT '0',
    `createDate` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updateDate` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2017001101
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

-- LOCK TABLES `student` WRITE;
-- /*!40000 ALTER TABLE `student`
--    DISABLE KEYS */;

DELIMITER //

CREATE
    DEFINER = `root`@`localhost` FUNCTION rand_string(n int) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE cn_str varchar(255) DEFAULT '小王李张章赵朱毛胡欧阳安老笑肖晓新卡郭特基斯大林列宁特朗普帕奎奥地方台撇豆雷蛇奥尔';
    DECLARE return_str varchar(255) DEFAULT '';
    DECLARE i int DEFAULT 0;
    WHILE i < n
        DO
            SET return_str = concat(return_str, substring(cn_str, floor(rand() * 40 + 1), 1));
            SET i = i + 1;
        END WHILE;
    RETURN return_str;
END //

CREATE
    DEFINER = `root`@`localhost` FUNCTION rand_string_sex(n int) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE cn_str_sex varchar(4) DEFAULT '男女';
    DECLARE return_str varchar(4) DEFAULT '';
    DECLARE i int DEFAULT 0;
    WHILE i < n
        DO
            SET return_str = concat(return_str, substring(cn_str_sex, floor(rand() * 2 + 1), 1));
            SET i = i + 1;
        END WHILE;
    RETURN return_str;
END //

CREATE
    DEFINER = `root`@`localhost` PROCEDURE `student_add`(IN n int)
BEGIN
    DECLARE i int DEFAULT 1;
    WHILE (i <= n)
        DO
            INSERT INTO student (stuname, sex, age, jsp, math, c)
            VALUES (rand_string(3), rand_string_sex(1), floor(rand() * 20 + 10), floor(rand() * 100),
                    floor(rand() * 100), floor(rand() * 100));
            SET i = i + 1;
        END WHILE;
END //

DELIMITER ;

CALL student_add(100);

-- /*!40000 ALTER TABLE `student`
--     ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user`
(
    `id`         int(11)     NOT NULL,
    `userPwd`    varchar(18) NOT NULL,
    `createDate` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updateDate` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-12-18 21:40:20
