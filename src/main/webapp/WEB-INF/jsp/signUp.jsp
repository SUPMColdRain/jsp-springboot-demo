<%--
  Created by IntelliJ IDEA.
  User: 18406
  Date: 2019/12/3
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息中心</title>
    <link rel="stylesheet" type="text/css" href="style/index.css"/>
    <link rel="stylesheet" type="text/css" href="style/sign.css"/>
</head>
<body>

<div class="header-content-mask"></div>
<div class="header-content-welcome">
    <p class="explain-title">Welcome To JSP Final Exam Production</p>
    <h3>经过我的一番折腾，我终于发现还是<span class="case"> React + Node简单好用，功能强，维护快</span>
        <br/>jsp + Springboot真是完美结合？</h3>
</div>

<div class="container-form">
    <div class="content-form">
        <div class="form-title">
            <p>欢迎注册学生信息中心</p>
        </div>
        <form action="register" method="post" id="signForm">
            <div class="container-input-field">
                <label>
                    <input type="text" name="username" placeholder="学号"
                           autofocus required aria-required="true"/>
                </label>
                <label>
                    <input type="password" name="password" placeholder="密码"
                           required aria-required="true" minlength="8" id="password"/>
                </label>
                <label>
                    <input type="password" name="confirmPassword" placeholder="确认密码"
                           required aria-required="true" minlength="8"/>
                </label>
            </div>
            <button type="submit">注册</button>
        </form>
        <a href="signin">
            <div class="form-sign">
                已有账号？前往登录
            </div>
        </a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $('#signForm').validate({
            onsubmit: true,
            rules: {
                username: {
                    required: true,
                    minlength: 10,
                    maxlength: 10
                },
                password: {
                    required: true,
                    minlength: 8
                },
                confirmPassword: {
                    required: true,
                    equalTo: "#password"
                }
            },
            messages: {
                username: {
                    required: "请输入学号",
                    minlength: "请输入10位数有效学号",
                    maxlength: "请输入10位数有效学号"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于8位数"
                },
                confirmPassword: {
                    required: "请重新输入密码确认",
                    equalTo: "两次输入的密码不一样"
                }
            },
            submitHandler: function (form) {
                window.localStorage.setItem("username", document.getElementById('signForm').username.value);
                $(form).submit();
            },
            invalidHandler: function (event, validator) {
                console.log("提交错误: validator: ", validator);
            }
        });
    })
</script>
</body>
</html>
