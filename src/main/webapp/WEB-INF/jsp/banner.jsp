<%--
  Created by IntelliJ IDEA.
  User: 18406
  Date: 2019/12/4
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int visitor = session.getAttribute("visitor") != null ? (int) session.getAttribute("visitor") : 0;
%>

<div class="container-banner">
    <div class="content-banner">
        <div class="module-logo">
            <img alt src="favicon.ico" width="36px" height="36px">
            <div class="module-logo-title">学生信息中心</div>
        </div>
        <div>
            <img alt src="selfie.jpg" width="48px" height="64px">
            <p>34号王安2017005169</p>
        </div>
        <div class="container-banner-tags">
            <div>
                <p id="username"></p>
            </div>
            <div>
                <p>网站访问量：<span style='font-size: 18px;color: red;'><%=visitor%></span></p>
            </div>
            <div>
                <a href="logout" style="color: antiquewhite;">退出</a>
            </div>
        </div>
        <div>
            <img alt src="avatar.png" width="36px" height="36px">
        </div>
    </div>
</div>
