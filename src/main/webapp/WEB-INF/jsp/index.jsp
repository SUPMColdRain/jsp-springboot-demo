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

<div class="container-list">
    <div class="container-list-action">
        <div class="content-list-action">
            <form id="content-query-form">
                <label>
                    <input name="require" type="text" autocomplete="on" aria-autocomplete="list"/>
                </label>
                <button type="submit">搜索</button>
            </form>
            <button type="button" onclick="addStu()">新增</button>
        </div>
    </div>

    <div class="container-table">
        <div class="content-table content-table-title">
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
        </div>

        <ul id="student-query"></ul>
        <ul id="student-list"></ul>
    </div>
</div>

<dialog id="container-edit">
    <div class="content-form">
        <div class="form-title">
            <p id="content-form-title"></p>
        </div>

        <form id="content-add-form">
            <div class="container-input-field">
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
            </div>
            <div class="module-btn">
                <button type="button" onclick="cancelSubmit()">取消</button>
                <button type="submit">确定</button>
            </div>
        </form>

        <form id="content-edit-form">
            <div class="container-input-field">
                <label>
                    <input name="id" type="text" placeholder="学号" autocomplete="on"
                           required aria-required="true" readonly/>
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

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<script type="text/javascript">
    let conEdit = $("#container-edit");
    let stuQuery = $("#student-query");
    let stuList = $("#student-list");
    let formQuery = $("#content-query-form");
    let formAdd = $("#content-add-form");
    let formEdit = $("#content-edit-form");
    let formTitle = $("#content-form-title");

    function showTips(content, x, y, time) {
        let tipsDiv = '<div class="tipsClass">' + content + '</div>';

        $('body').append(tipsDiv);
        $('div.tipsClass').css({
            'font-size': 16 + 'px',
            'display': 'flex',
            'justify-content': 'center',
            'align-items': 'center',
            'text-align': 'center',
            'position': 'fixed',
            'bottom': y,
            'right': x,
            'width': '10.3125em',
            'height': '2.5em',
            'box-shadow': '0 0 5px hsl(0, 47%, 42%)',
            'border-radius': '5px',
            'color': 'hsl(0, 0%, 100%)',
            'background': 'rgb(217, 23, 23)',
            'z-index': '999'
        }).show();
        setTimeout(function () {
            $('div.tipsClass').fadeOut();
        }, (time * 1000));
    }

    function addStu() {
        conEdit.css({
            "visibility": "visible",
            "display": "flex"
        });
        formAdd.css({
            "visibility": "visible",
            "display": "flex"
        });
        formEdit.css({
            "visibility": "hidden",
            "display": "none"
        });
        formTitle.html("新增学员信息");
    }

    function updateStu(value) {
        console.log("value: ", value);
        console.log("arguments: ", arguments);
        conEdit.css({
            "visibility": "visible",
            "display": "flex"
        });
        formEdit.css({
            "visibility": "visible",
            "display": "flex"
        });
        formAdd.css({
            "visibility": "hidden",
            "display": "none"
        });
        formTitle.html("更新学员信息");
        $("#content-edit-form input[name=id]").val(arguments[0]["id"]);
        $("#content-edit-form input[name=stuName]").val(arguments[0]["stuName"]);
        $("#content-edit-form select[name=sex]").val(arguments[0]["sex"]);
        $("#content-edit-form input[name=age]").val(arguments[0]["age"]);
        $("#content-edit-form input[name=jsp]").val(arguments[0]["jsp"]);
        $("#content-edit-form input[name=math]").val(arguments[0]["math"]);
        $("#content-edit-form input[name=c]").val(arguments[0]["c"]);
        $("#content-edit-form input[name=createDate]").val(arguments[0]["createDate"].slice(0, 10) + ' ' + arguments[0]["createDate"].slice(11, 19));
        $("#content-edit-form input[name=updateDate]").val(arguments[0]["updateDate"].slice(0, 10) + ' ' + arguments[0]["createDate"].slice(11, 19));
    }

    function deleteStu(id) {
        if (window.confirm("您确认删除 学号: " + id + " 的学员吗？")) {
            $.ajax({
                type: "DELETE",
                url: "/api/student/delete/" + id,
                dataType: "json"
            });

            showTips("删除成功", "3em", "2em", 3);
            setTimeout(function () {
                window.location.reload();
            }, 1000)
        }
    }

    function cancelSubmit() {
        conEdit.css({
            "visibility": "hidden",
            "display": "none"
        });
        formAdd.css({
            "visibility": "hidden",
            "display": "none"
        });
        formEdit.css({
            "visibility": "hidden",
            "display": "none"
        });
    }

    $(document).ready(function () {
        document.getElementById("username").innerHTML = localStorage.getItem("username");

        stuQuery.css({
            "visibility": "hidden",
            "display": "none"
        }).empty();
        stuList.css({
            "visibility": "visible",
            "display": "flex"
        }).empty();

        $.ajax({
            type: "GET",
            url: "/api/student/list",
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log('list data: ', data);

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
                    stuList.append(str);
                });
            },
            error: function (error) {
                throw error;
            }
        });

        //序列化表单字段为json对象
        $.fn.serializeFormToJson = function () {
            let arr = $(this).serializeArray();
            let param = {};
            $.each(arr, function (i, obj) {
                param[obj.name] = obj.value;
            });
            return param;
        };

        formQuery.on("submit", function (e) {
            e.preventDefault();

            $.ajax({
                type: "GET",
                url: "/api/student/query/" + formQuery.serialize().slice(8),
                cache: false,
                dataType: "json",
                success: function (data) {
                    console.log('query data: ', data);

                    stuQuery.css({
                        "visibility": "visible",
                        "display": "flex"
                    }).empty();
                    stuList.css({
                        "visibility": "hidden",
                        "display": "none"
                    }).empty();

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
                        stuQuery.append(str);
                    });
                },
                error: function (error) {
                    throw error;
                }
            });
        });

        formAdd.on("submit", function (e) {
            console.log("formAdd.serializeFormToJson(): ", formAdd.serializeFormToJson());
            e.preventDefault();

            $.ajax({
                type: "POST",
                url: "/api/student/add",
                data: formAdd.serializeFormToJson(),
                dataType: "json"
            });

            cancelSubmit();
            showTips("新增成功", "3em", "2em", 3);
            setTimeout(function () {
                window.location.reload();
            }, 1000)
        });

        formEdit.on("submit", function (e) {
            console.log("formEdit.serializeFormToJson(): ", formEdit.serializeFormToJson());
            e.preventDefault();

            $.ajax({
                type: "PUT",
                url: "/api/student/update",
                data: formEdit.serializeFormToJson(),
                dataType: "json"
            });

            cancelSubmit();
            showTips("更新成功", "3em", "2em", 3);
            setTimeout(function () {
                window.location.reload();
            }, 1000)
        });
    });
</script>
</body>
</html>
