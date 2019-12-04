<%--
  Created by IntelliJ IDEA.
  User: 18406
  Date: 2019/12/4
  Time: 7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>学生信息中心</title>
    <link rel="stylesheet" type="text/css" href="style/index.css"/>
    <link rel="stylesheet" type="text/css" href="style/list.css"/>
</head>
<body onload="fetchUser();">

<ul id="student-list" class="container_table">
    <li class="content_table content_table_title">
        <div>学号</div>
        <div>姓名</div>
        <div>备注</div>
        <div>班级</div>
        <div>性别</div>
        <div>年龄</div>
        <div>JSP</div>
        <div>MATH</div>
        <div>C</div>
        <div>创建日期</div>
        <div>更新日期</div>
        <div>编辑</div>
        <div>删除</div>
    </li>
</ul>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    function fetchUser() {
        $.ajax({
            type: "GET",
            url: "/api/student/list",
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log('data: ', data);
                $.each(data, function (n, value) {
                    let str = "<li class='content_table'>" +
                        "<div>" + value["serialNumber"] + "</div>" +
                        "<div>" + value["stuName"] + "</div>" +
                        "<div>" + value["describes"] + "</div>" +
                        "<div>" + value["stuClass"] + "</div>" +
                        "<div>" + value["sex"] + "</div>" +
                        "<div>" + value["age"] + "</div>" +
                        "<div>" + value["jsp"] + "</div>" +
                        "<div>" + value["math"] + "</div>" +
                        "<div>" + value["c"] + "</div>" +
                        "<div>" + value["createDate"] + "</div>" +
                        "<div>" + value["updateDate"] + "</div></li>";
                    $("#student-list").append(str);
                });
            },
            error: function (error) {
                throw error;
            }
        })
    }
</script>
</body>
</html>
