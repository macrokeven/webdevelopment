<%--
  Created by IntelliJ IDEA.
  User: k.macro
  Date: 2019/10/15
  Time: 上午11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JavaEE作业</title>
    <link href="static/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-grid.css" rel="stylesheet">
    <link href="static/css/bootstrap-grid.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-grid.min.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.css" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.css.map" rel="stylesheet">
    <link href="static/css/bootstrap-reboot.min.css.map" rel="stylesheet">
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/bootstrap.css.map" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css.map" rel="stylesheet">
    <style>

    </style>
</head>
<body  style="background:#E9ECEF">
<%
    session.setAttribute("status",null);
    session.setAttribute("skKeyA",null);

%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">中国乐游</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">主页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">联系我们</a>
            </li>
            <!--
                         <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                         </li>
            -->
        </ul>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="输入内容..." aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
    </form>
    </div>
</nav>

<div class="jumbotron jumbotron-fluid text-center">
    <h1 class="display-4">MacroKeven 的网站</h1>
    <p class="lead">欢迎来到一个极具创意的网站</p>
    <!--    <hr class="my-4">-->
    <p>还没账号？赶紧<a href="register.jsp">注册</a>一个吧！</p>
    <form action="uslg.jsp" action="post">
        <div class="text-center">
            <div class="input-group col-xl-2 offset-xl-5">
                <input type="text" class="form-control" placeholder="用户名..." aria-describedby="basic-addon1" name="user_name">
            </div>
        </div>
        <p class="lead"></p>
        <div class="text-center">
            <div class="input-group col-xl-2 offset-xl-5">
                <input type="password" class="form-control" placeholder="密码..." aria-describedby="basic-addon2" name="user_pwd">
            </div>
        </div>
        <p class="lead"></p>
        <p class="lead">
            <button type="submit" class="btn btn-primary">登陆</button>
        </p>
    </form>

    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap-grid.min.js"></script>
    <script>
        $('.dropdown-toggle').dropdown();
    </script>
</div>
</body>
</html>