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
    <link rel="stylesheet" type="text/css" href="style/dialog.css"/>
</head>
<body>

<%@ include file="banner.jsp" %>

<ul id="student-list" class="container-table">
    <li class="content-table content-table-title">
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

<dialog id="container-edit">
    <div class="content-form">
        <div class="form-title">
            <p>编辑学员信息</p>
        </div>
        <form name="content-edit-form">
            <div class="container-input-field">
                <label>
                    <input name="id" type="text" placeholder="学号" autocomplete="on"
                           required aria-required="true" readonly disabled/>
                </label>
                <label>
                    <input name="stuName" type="text" placeholder="姓名" autocomplete="on"
                           required aria-required="true"/>
                </label>
                <label>
                    <select name="sex" required aria-required="true">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </label>
                <label>
                    <input name="age" type="text" placeholder="年龄" autocomplete="on"
                           required aria-required="true"/>
                </label>
                <label>
                    <input name="jsp" type="text" placeholder="jsp分数" autocomplete="on"
                           required aria-required="true"/>
                </label>
                <label>
                    <input name="math" type="text" placeholder="math分数" autocomplete="on"
                           required aria-required="true"/>
                </label>
                <label>
                    <input name="c" type="text" placeholder="c分数" autocomplete="on"
                           required aria-required="true"/>
                </label>
                <label>
                    <input name="createDate" type="text" placeholder="创建日期" autocomplete="on"
                           required aria-required="true" readonly disabled/>
                </label>
                <label>
                    <input name="updateDate" type="text" placeholder="更新日期" autocomplete="on"
                           required aria-required="true" readonly disabled/>
                </label>
            </div>
            <div class="module-btn">
                <button type="button" onclick="cancelSubmit()">取消</button>
                <button type="submit">确定</button>
            </div>
        </form>
    </div>
</dialog>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    let conEdit = document.getElementById("container-edit");

    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "/api/student/list",
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log('data: ', data);
                $.each(data, function (n, value) {
                    let str = "<li class='content-table'>" +
                        "<div>" + value["id"] + "</div>" +
                        "<div>" + value["stuName"] + "</div>" +
                        "<div>" + value["sex"] + "</div>" +
                        "<div>" + value["age"] + "</div>" +
                        "<div>" + value["jsp"] + "</div>" +
                        "<div>" + value["math"] + "</div>" +
                        "<div>" + value["c"] + "</div>" +
                        "<div>" + value["createDate"].slice(0, 10) + ' ' + value["createDate"].slice(11, 19) + "</div>" +
                        "<div>" + value["updateDate"].slice(0, 10) + ' ' + value["updateDate"].slice(11, 19) + "</div>" +
                        "<div><button onclick='updateStu(" + JSON.stringify(value) + ")'>编辑</button></div>" +
                        "<div><button onclick='deleteStu(" + value["id"] + ")'>删除</button></div></li>";
                    $("#student-list").append(str);
                });
            },
            error: function (error) {
                throw error;
            }
        })
    });

    function updateStu(value) {
        console.log("value: ", value);
        console.log("arguments: ", arguments);
        conEdit.style.visibility = "visible";
        // conEdit.action = "/api/student/update";
        $("input[name=id]").val(arguments[0]["id"]);
        $("input[name=stuName]").val(arguments[0]["stuName"]);
        $("select[name=sex]").val(arguments[0]["sex"]);
        $("input[name=age]").val(arguments[0]["age"]);
        $("input[name=jsp]").val(arguments[0]["jsp"]);
        $("input[name=math]").val(arguments[0]["math"]);
        $("input[name=c]").val(arguments[0]["c"]);
        $("input[name=createDate]").val(arguments[0]["createDate"].slice(0, 10) + ' ' + arguments[0]["createDate"].slice(11, 19));
        $("input[name=updateDate]").val(arguments[0]["updateDate"].slice(0, 10) + ' ' + arguments[0]["createDate"].slice(11, 19));
    }

    function deleteStu(id) {
        $.ajax({
            type: "DELETE",
            url: "/api/student/delete/" + id,
            dataType: "json",
            success: function () {

            },
            error: function () {

            }
        });
        window.location.reload();
    }

    function cancelSubmit() {
        conEdit.style.visibility = "hidden";
    }

    $(conEdit).submit(function (e) {
        console.log("conEdit.serialize(): ", conEdit.serialize());
        e.preventDefault();
        $.ajax({
            type: "PUT",
            url: "/api/student/update",
            data: $(this).serialize(),
            dataType: "json",
            success: function () {
                alert("success!");
            },
            error: function () {

            }
        });
        return false;
    });
</script>
</body>
</html>
