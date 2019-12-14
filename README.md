# Jsp Spring boot Jpa MySQL [![Github License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/SUPMColdRain/jsp-springboot-jpa-mysql/blob/master/LICENSE) [![spring boot](https://img.shields.io/badge/springboot-2.21-green.svg)](https://spring.io/projects/spring-boot) [![Maven](https://img.shields.io/badge/maven-3.6.1-yellow.svg)](https://maven.apache.org/) [![MySQL](https://img.shields.io/badge/mysql-8.0.17-informational.svg)](https://dev.mysql.com/downloads/)
| 所用参数名称 | 值 |
| ----  | ----  |
| 数据库 | test |
| 用户名 | test |
| 密码 | test |
| 表1 | student |
| 表2 | user |

## 部署 MySQL
>##### 使用命令行
>```shell script
>mysql> mysql -u root -p < deploy.sql
>```
>OR
>```shell script
>mysql> mysql -u root -p
>mysql> source deploy.sql
>```
>_(请将 `deploy.sql` 替换为正确的路径)_  
>_(必需使用 `root` 等超级权限用户执行 `deploy.sql` )_  
#### OR
>##### 使用相关 DBMA 执行SQL脚本（如 DataGrip 等）  

## 部署 Tomcat
>##### 打开`apache-tomcat-*/conf/server.xml`，修改Tomcat的根目录
>_(为了消去浏览器路径中`/exam`对重定向与API的影响)_
>```xml
><Host name="localhost"  appBase="webapps" unpackWARs="true" autoDeploy="true">
>       <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
>               prefix="localhost_access_log" suffix=".txt"
>               pattern="%h %l %u %t &quot;%r&quot; %s %b" />
>
>       <!--User Changed | 添加的子目录-->
>       <Context path="" docBase="/exam" debug="0" reloadable="true"/>
></Host>
>```
>##### 将`exam.war`移至`apache-tomcat-*/webapps/`下
>##### 在`apache-tomcat-*/bin/`运行 Tomcat 
>```shell script
>> startup.bat
>```
>_(请确保已安装JDK或JRE，并设置好JAVA_HOME、JRE_HOME、CATLINA_HOME等环境变量)_

## 在浏览器中打开 [http://localhost:8080/signin](http://localhost:8080/signin)
