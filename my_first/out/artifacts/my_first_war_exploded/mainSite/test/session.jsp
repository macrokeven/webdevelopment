<%--
  Created by IntelliJ IDEA.
  User: k.macro
  Date: 2019/10/27
  Time: 下午9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.mysql.cj.Session" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    Random RDnum = new Random();
    int rd_num = RDnum.nextInt(999999999);
    out.println(rd_num);
    SimpleDateFormat createTime = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
    Date date = new Date(session.getCreationTime());

    session.setAttribute("user_name","macro");

%>
session创建时间，<%=createTime.format(date)%><br>
session的编号，<%=session.getId()%><br>
session中获取的用户名，<%=session.getAttribute("user_name")%><br>
<a href="session2.jsp">click</a>
</body>
</html>
