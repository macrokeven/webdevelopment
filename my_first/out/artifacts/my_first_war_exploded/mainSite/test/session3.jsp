<%--
  Created by IntelliJ IDEA.
  User: MacroKeven
  Date: 2019/10/28
  Time: 9:50 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = (String)session.getAttribute("user_name");
    if(username==null){
        out.println("未登录");
    }else{
        out.println("已登录");
        session.setAttribute("user_name",null);
    }
%>

</body>
</html>
