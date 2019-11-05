<%--
  Created by IntelliJ IDEA.
  User: MacroKeven
  Date: 2019/10/28
  Time: 12:54 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String user_name = (String)session.getAttribute("user_name");
    out.println(user_name);
    String username = (String)session.getAttribute("user_name");
    if(username==null){
        out.println("未登录");
    }else{
        out.println("已登录");
    }
%>

</body>
</html>
