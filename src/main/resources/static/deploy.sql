-- NODE-MYSQL 最新版本仍不支持 MySQL 80 版本高强度密码，应当改为 51 版本弱密码
-- ALTER USER 'root'@'host' IDENTIFIED WITH mysql_native_password BY 'password'

create database if not exists test;

-- CREATE USER 'username'@'host' IDENTIFIED BY 'password';
-- username：你将创建的用户名
-- host：指定该用户在哪个主机上可以登陆，如果是本地用户可用localhost，如果想让该用户可以从任意远程主机登陆，可以使用通配符%
-- password：该用户的登陆密码，密码可以为空，如果为空则该用户可以不需要密码登陆服务器
CREATE USER IF NOT EXISTS 'test'@'localhost' IDENTIFIED BY 'test';

-- GRANT privileges ON databaseName.tableName TO 'username'@'host';
-- privileges：用户的操作权限，如SELECT，INSERT，UPDATE等，如果要授予所的权限则使用ALL
-- databaseName：数据库名
-- tableName：表名，如果要授予该用户对所有数据库和表的相应操作权限则可用*表示，如*.*
GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost';

-- 用以上命令授权的用户不能给其它用户授权，如果想让该用户可以授权，用以下命令
-- GRANT privileges ON databaseName.tableName TO 'username'@'host' WITH GRANT OPTION;

-- 刷新权限
FLUSH PRIVILEGES;

-- 设置与更改用户密码
-- SET PASSWORD FOR 'username'@'host' = PASSWORD('newPassword');
-- 如果是当前登陆用户用
-- SET PASSWORD = PASSWORD("newPassword");

-- 撤销用户权限
-- REVOKE privilege ON databaseName.tableName FROM 'username'@'host';

-- 删除用户
-- DROP USER 'username'@'host';

-- SHOW GRANTS FOR 'test'@'localhost';
-- SELECT user, host FROM mysql.user;

USE test;

-- MySQL 5.6 版本以下创建表中有两个timestamp类型字段会报错
-- 解决方案1：一个使用timestamp类型，另一个使用datetime类型
-- 解决方案2：使用触发器
-- CREATE TRIGGER <trigger_name> BEFORE INSERT ON <table_name>
--   FOR EACH ROW SET NEW.<timestamp_field> = CURRENT_TIMESTAMP;
-- 解决方案3：升级到 MySQL 5.6 以上的版本


create table if not exists `user`
(
    id         int         not null primary key,
    userPwd    varchar(18) not null,
    createDate datetime    not null default current_timestamp,
    updateDate timestamp   not null default current_timestamp on update current_timestamp
) engine = InnoDB
  default charset = utf8;

create table if not exists `student`
(
    id         int         not null auto_increment primary key,
    stuName    varchar(12) not null,
    sex        varchar(4)  not null default '未知',
    age        int         not null default 0,
    jsp        int         not null default 0,
    math       int         not null default 0,
    c          int         not null default 0,
    createDate datetime    not null default current_timestamp,
    updateDate timestamp   not null default current_timestamp on update current_timestamp
) engine = InnoDB
  auto_increment = 2017001001
  default charset = utf8;

-- 创建随机函数

create
    definer = `root`@`localhost` function rand_string(n int) returns varchar(255) charset utf8
    deterministic
begin
    declare cn_str varchar(255) default '小王李张章赵朱毛胡欧阳安老笑肖晓新卡郭特基斯大林列宁特朗普帕奎奥';
    declare return_str varchar(255) default '';
    declare i int default 0;
    while i < n
        do
            set return_str = concat(return_str, substring(cn_str, floor(rand() * 50), 1));
            set i = i + 1;
        end while;
    return return_str;
end;

create
    definer = `root`@`localhost` function rand_string_sex(n int) returns varchar(255) charset utf8
    deterministic
begin
    declare cn_str_sex varchar(4) default '男女';
    declare return_str varchar(4) default '';
    declare i int default 0;
    while i < n
        do
            set return_str = concat(return_str, substring(cn_str_sex, floor(rand() * 2 + 0.9999), 1));
            set i = i + 1;
        end while;
    return return_str;
end;

create
    definer = `root`@`localhost` procedure `student_add`(in n int)
begin
    declare i int default 1;
    while (i <= n)
        do
            insert into student (stuname, sex, age, jsp, math, c)
            values (rand_string(6), rand_string_sex(1), floor(rand() * 100), floor(rand() * 100), floor(rand() * 100),
                    floor(rand() * 100));
            set i = i + 1;
        end while;
end;

call student_add(50);

INSERT INTO user (id, userPwd) VALUES (2017001001, 12345678);
