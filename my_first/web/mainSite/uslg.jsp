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
        if(con==null){
            out.println("数据库连接失败！！！");
        }

        String sql = "select * from appUser where `userName` = ? and `userPwd` = ?";//对表的操作语句
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,userId);
        pstm.setString(2,userPwd);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            Random rdNum = new Random();
            int rd_id = rdNum.nextInt(999999999);
            session.setAttribute("skKeyA",rd_id);
            session.setAttribute("lg_id",rd_id);
            session.setAttribute("user_name",userId);
            session.setAttribute("status","login");
            String start_status = (String)session.getAttribute("start_status");
            int new_user_visit = 0;
            if(start_status == null){
                session.setAttribute("user_visit",1);
                session.setAttribute("start_status","start");
            }else{
                int user_visit = (int)session.getAttribute("user_visit");
                new_user_visit = user_visit + 1;
                session.setAttribute("user_visit",new_user_visit);
            }
            out.println("<script>location.href='mainPage.jsp';</script>");
        }else{
            out.println("<script language='javascript'>alert('用户名或者密码错误!');location.href='main.jsp';</script>");
        }
        pstm.close();
        con.close();
//        out.println("<script>alert('Register successfully!');location.href='main.jsp';</script>");

    }catch (ClassNotFoundException e){
        e.printStackTrace();
        out.println("<script language='javascript'>alert('用户名或者密码错误'!);location.href='main.jsp'</script>");
    }
%>