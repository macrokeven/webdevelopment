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
    String userId = request.getParameter("user_name");
    String userPwd = request.getParameter("user_pwd");
    try {
        String driver = "com.mysql.cj.jdbc.Driver";

        String url = "jdbc:mysql://localhost:3306/basicData?verifyServerCertificate=false&useSSL=false";

        String user = "root"; //用户名root，一般都是这个
        String password = "Zxcvbnm64895579@"; //自己数据库密码
        Class.forName(driver); //这上面可以封装起来一个方法
        Connection con = (Connection) DriverManager.getConnection(url, user, password);//连接数据库
        if(con!=null){
            out.println("mysql数据库连接成功！！！");
        }else{
            out.println("数据库连接失败！！！");
        }

        String sql = "select * from appUser";//对表的操作语句
        PreparedStatement pstm = con.prepareStatement(sql);

        out.println("<table border='1'><tr><td>用户名</td><td>密码</td></tr>");
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            out.println("<tr><td>");
            out.println(rs.getString("userName"));
            out.println("</td><td>");
            out.println(rs.getString("userPwd"));
            out.println("</td></tr>");
        }
        out.println("</table>");
        pstm.close();
        con.close();
//        out.println("<script>alert('Register successfully!');location.href='main.jsp';</script>");

    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
%>