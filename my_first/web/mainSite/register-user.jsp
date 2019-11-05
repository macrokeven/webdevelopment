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
    <title></title>
</head>
<body>

</body>
</html>
<%
    String userId = request.getParameter("userId");
    String userName = request.getParameter("userName");
    String userPwd = request.getParameter("userPwd");
    String userEmail = request.getParameter("userEmail");
    try {
        String driver = "com.mysql.cj.jdbc.Driver";

        String url = "jdbc:mysql://localhost:3306/basicData?verifyServerCertificate=false&useSSL=false";

        String user = "root"; //用户名root，一般都是这个
        String password = "Zxcvbnm64895579@"; //自己数据库密码
        Class.forName(driver); //这上面可以封装起来一个方法
        Connection con = (Connection) DriverManager.getConnection(url, user, password);//连接数据库
        if(con==null){
            out.println("数据库连接失败！！！");
        }

        String sql = "insert into appUser(userId,userName,userPwd,userEmail,rgTime) values (?,?,?,?,?)";//对表的操作语句
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,userId);
        pstm.setString(2,userName);
        pstm.setString(3,userPwd);
        pstm.setString(4,userEmail);
        pstm.setString(5,"20190000");
        pstm.executeLargeUpdate();
        pstm.close();
        con.close();
        out.println("<script>alert('Register successfully!');location.href='main.jsp';</script>");
//<script language='javascript'>window.history.back(-1)</script>
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
%>