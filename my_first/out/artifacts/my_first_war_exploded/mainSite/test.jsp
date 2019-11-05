<%--
  Created by IntelliJ IDEA.
  User: MacroKeven
  Date: 2019/10/28
  Time: 11:10 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String lg_status = (String)session.getAttribute("status");
    String lg_id = (String)session.getAttribute("ig_id");
    String skKeyA = (String)session.getAttribute("skKeyA");
    out.println(lg_status);
    out.println(lg_id);
    out.println(skKeyA);
%>
</body>
</html>
