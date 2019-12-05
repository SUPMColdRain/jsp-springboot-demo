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
    <link rel="stylesheet" type="text/css" href="style/banner.css"/>
</head>
<body>

<%@ include file="banner.jsp" %>

<ul id="student-list" class="container_table">
    <li class="content_table content_table_title">
        <div>学号</div>
        <div>姓名</div>
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

<dialog id="container-update">
    <form name="container-form" method="post">
        <label>
            <input name="serialNumber" type="text" placeholder="学号" autocomplete="on"
                   required aria-required="true" autofocus/>
        </label>
        <label>
            <input name="stuName" type="text" placeholder="姓名" autocomplete="on"
                   required aria-required="true"/>
        </label>
        <div class="form-btn">
            <button type="submit">提交</button>
        </div>
    </form>
</dialog>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    let conUpdate = document.querySelector("#container-update");

    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "/api/student/list",
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log('data: ', data);
                $.each(data, function (n, value) {
                    let str = "<li class='content_table'>" +
                        "<div>" + value["id"] + "</div>" +
                        "<div>" + value["stuName"] + "</div>" +
                        "<div>" + value["sex"] + "</div>" +
                        "<div>" + value["age"] + "</div>" +
                        "<div>" + value["jsp"] + "</div>" +
                        "<div>" + value["math"] + "</div>" +
                        "<div>" + value["c"] + "</div>" +
                        "<div>" + value["createDate"].slice(0, 10) + ' ' + value["createDate"].slice(11, 19) + "</div>" +
                        "<div>" + value["updateDate"].slice(0, 10) + ' ' + value["updateDate"].slice(11, 19) + "</div>" +
                        "<div><button onclick='updateStu()'>编辑</button></div>" +
                        "<div><button onclick='deleteStu(" + value["id"] + ")'>删除</button></div></li>";
                    $("#student-list").append(str);
                });
            },
            error: function (error) {
                throw error;
            }
        })
    });

    function updateStu() {
        conUpdate.style.visibility = "visible";
        window.location.reload();
    }

    function deleteStu(id) {
        $.ajax({
            type: "DELETE",
            url: "/api/student/delete/" + id,
            dataType: "json"
        });
        window.location.reload();
    }
</script>
</body>
</html>
