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
        <form method="post" id="signForm" onsubmit="return formValidator();">
            <div class="container-input-field">
                <label>
                    <input type="text" name="user_serialNumber" placeholder="学号"
                           autofocus required aria-required="true"/>
                    <span id="caseOne"></span>
                </label>
                <label>
                    <input type="password" name="user_password" placeholder="密码"
                           required aria-required="true" minlength="8"/>
                    <span id="caseTwo"></span>
                </label>
                <label>
                    <input type="password" name="user_confirmPassword" placeholder="确认密码"
                           required aria-required="true" minlength="8"/>
                    <span id="caseThird"></span>
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

<script type="text/javascript">

    // 本来是弄了个"async-validator"的依赖包，加个实时表单*验证
    // 好像是国人做的，不太好用，没有"redux-form"方便，而且bug很多
    let signForm = document.querySelector('#signForm');
    let caseOne = document.querySelector('#caseOne');
    let caseTwo = document.querySelector('#caseTwo');
    let caseThird = document.querySelector('#caseThird');

    function formValidator() {
        console.log(signForm.user_serialNumber);
        if (!/^201[6|7|8|9]\d{6}$/.test(signForm.user_serialNumber.value)) {
            caseOne.innerHTML = "请输入2016级到2019级10位有效学号";
            signForm.user_serialNumber.style.borderColor = 'red';
            signForm.user_serialNumber.style.outlineColor = 'red';
            signForm.user_serialNumber.style.boxShadow = '0 0 5px red';
            signForm.user_serialNumber.focus();
            signForm.user_serialNumber.select();
            return false;
        }

        if (!/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[!@#$%^&*()_+<>:"{}?|~])[a-zA-Z\d!@#$%^&*()_+<>:"{}?|~]*$/.test(signForm.user_password.value)) {
            caseTwo.innerHTML = "须包含大小写字母、数字、特殊字符";
            signForm.user_password.style.borderColor = 'red';
            signForm.user_password.style.outlineColor = 'red';
            signForm.user_password.style.boxShadow = '0 0 5px red';
            signForm.user_password.focus();
            signForm.user_password.select();
            return false;
        }

        if (!signForm.user_confirmPassword.value === signForm.user_password.value) {
            caseThird.innerHTML = "两次输入的密码不一致";
            return false;
        }

        return true;
    }

</script>
</body>
</html>
