<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
    <script>
        function exit(){
            location.href="main.jsp";
        }
    </script>
    <script type="text/javascript">
        function startTime(){
            var today=new Date();
            var week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
            var year=today.getFullYear();
            var month=today.getMonth()+1;
            var date=today.getDate();
            var day=today.getDay();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            h=checkTime(h);
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('time').innerHTML=" "+year+"年"+month+"月"+date+"日  "+week[day]+"  "+h+":"+m+":"+s+" ";
            t=setTimeout('startTime()',1000);
        }

        function checkTime(i){
            if (i<10)
            {i="0" + i}
            return i
        }
    </script>

</head>
<body  style="background:#E9ECEF" onload="startTime()">
<%
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");

    String user_name = (String)session.getAttribute("user_name");

    int new_user_visit = (int)session.getAttribute("user_visit");


    //    if(user_visit == 0 ){
//
//    }
    String lg_status = (String)session.getAttribute("status");
    if(lg_status == null){
        out.println("<script>alert('请登录!');location.href='main.jsp';</script>");
    }else{
        int lg_id = (int)session.getAttribute("lg_id");
        int skKeyA = (int)session.getAttribute("skKeyA");
        if(lg_id != skKeyA){
            out.println("<script>alert('请登录!');location.href='main.jsp';</script>");
        }

    }
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String now_time = df.format(d);
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">中国乐游</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="main.jsp">主页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">联系我们</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    管理用户
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">添加用户</a>
                    <a class="dropdown-item" href="#">删除用户</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="show_user.jsp">查看用户</a>
                </div>
            </li>
            <!--
                         <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                         </li>
            -->
        </ul>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <!--        <input class="form-control mr-sm-2" type="search" placeholder="输入内容..." aria-label="Search">-->
        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="exit()">退出</button>
    </form>
    </div>
</nav>

<div class="jumbotron jumbotron-fluid text-center">
        <div class="offset-lg-0 col-lg-4">用户<strong><%=user_name%></strong>，欢迎登录系统！</div>
    <hr class="my-4">
    <h3 class="display-6">现在时间为：<label id="time"></label></h3>
    <h3 class="display-4">网站部分功能正在开发中，敬请期待！</h3>
</div>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap-grid.min.js"></script>
<script>
    $('.dropdown-toggle').dropdown();
</script>
</div>
<div style="position: fixed;bottom: 0px;width: 100%">
    <div align="center">
        <footer>
            <a>Copyright &copy; 2019 China Letoy <h5 class="display-6">当前网站的访问量为：<%=new_user_visit%></h5> </a>

        </footer>
    </div>
</div>
</body>
</html>