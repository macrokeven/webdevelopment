<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%--
  Created by IntelliJ IDEA.
  User: k.macro
  Date: 2019/10/12
  Time: 上午1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看用户</title>
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
        table

        {

            border-collapse: collapse;

            margin: 0 auto;

            text-align: center;

        }

        table td, table th

        {

            border: 1px solid #cad9ea;

            color: #666;

            height: 30px;

        }

        table thead th

        {

            background-color: #CCE8EB;

            width: 100px;

        }

        table tr:nth-child(odd)

        {

            background: #fff;

        }

        table tr:nth-child(even)

        {

            background: #F5FAFA;

        }

    </style>
    <script>
        function back_to(){
            window.history.back(-1);
            document.getElementById('').innerHTML

        }
        var stats ="ok";
        function ckA(id){
            if (stats == "ok") {
                var btnId = "bt" + id;
                var clId = "cl" + id;
                var inptNId = "in" + id;
                var inptId = "ip" + id;
                var btn = document.getElementById(btnId);
                var cl = document.getElementById(clId);
                var inputN = document.getElementById(inptNId);
                var inputE = document.getElementById(inptId);
                btn.innerHTML = "<a href='javascript:void(0)' onClick='sub(this.id)' id ='" + id + "'>提交</a>";
                cl.innerHTML = "<a class='nav-link' href='show_user.jsp'>取消</a>";
                inputE.innerHTML = "<input style='text-align: center' type='text' id = 'k" + id + "'>";
                inputN.innerHTML = "<input style='text-align: center' type='text' id = 'n" + id + "'>";
                stats="cg";
            }
        }
        function sub(id){
            realId = "k" + id;
            realN = "n" + id;
            var val =  document.getElementById(realId).value;
            var valn =  document.getElementById(realN).value;
            var path = "doAct.jsp?user_name="+valn+"&user_pwd="+val+"&action=change&user_id="+id;
            location.href=path;
        }
    </script>
</head>
<body style="background:#E9ECEF">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">中国乐游</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="mainPage.jsp">返回 <span class="sr-only">(current)</span></a>
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
                    <a class="dropdown-item" href="#">查看用户</a>
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
        <input class="form-control mr-sm-2" type="search" placeholder="输入内容..." aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
    </form>
    </div>
</nav>
<p class="lead"></p>
<div align="center">
    <%
//    String id = request.getParameter("user_id");
//    String userName = request.getParameter("user_name");
//    String userPwd = request.getParameter("user_pwd");
    try {
        String driver = "com.mysql.cj.jdbc.Driver";

        String url = "jdbc:mysql://localhost:3306/basicData?verifyServerCertificate=false&useSSL=false&allowPublicKeyRetrieval=true";

        String user = "root"; //用户名root，一般都是这个
        String password = "Zxcvbnm64895579@"; //自己数据库密码
        Class.forName(driver); //这上面可以封装起来一个方法
        Connection con = (Connection) DriverManager.getConnection(url, user, password);//连接数据库
        if(con!=null){
            System.out.println("mysql数据库连接成功！！！");
        }else{
            out.println("数据库连接失败！！！");
        }

        String sql = "select * from appUser";//对表的操作语句
        PreparedStatement pstm = con.prepareStatement(sql);

        out.println("<table width='70%'  style='text-align: center'><thead><tr><th width='30%' >用户名</th><th width='30%' >密码</th><th colspan = '2' width='40%' >操作</th></tr></thead>");
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            String user_name = rs.getString("userName");
            String user_pwd = rs.getString("userPwd");
            String id = rs.getString("userId");
            out.println("<tr><td><div id='in"+id+"'>" + user_name + "<div></td>");
            out.println("<td><div id='ip"+id+"'>" + user_pwd + "<div></td>");
            out.println("<td width='10%'><div id = 'bt"+id+"'><a class='nav-link' href='javascript:void(0);' onclick='ckA(this.id)' id ='"+id+"'>修改</a><div></td>");
            out.println("<td width='10%'><div id = 'cl"+id+"'><a class='nav-link' href = 'doAct.jsp?action=delete&user_id=" + id +"'>删除</a></div></td></tr>");
        }
        out.println("</table>");
        pstm.close();
        con.close();
//        out.println("<script>alert('Register successfully!');location.href='main.jsp';</script>");

    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
%>
</div>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/bootstrap.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap-grid.min.js"></script>
<script>
    $('.dropdown-toggle').dropdown();
</script>
</body>
</html>