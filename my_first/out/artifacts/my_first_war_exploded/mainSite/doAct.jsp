<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
<%
    String action = request.getParameter("action");
    String user_id = request.getParameter("user_id");
    String user_name = request.getParameter("user_name");
    String user_pwd = request.getParameter("user_pwd");
//    out.println(user_name);
//    out.println(action);
    try {
        String driver = "com.mysql.cj.jdbc.Driver";

        String url = "jdbc:mysql://localhost:3306/basicData?verifyServerCertificate=false&useSSL=false";

        String user = "root"; //用户名root，一般都是这个
        String password = "Zxcvbnm64895579@"; //自己数据库密码
        Class.forName(driver); //这上面可以封装起来一个方法
        Connection con = (Connection) DriverManager.getConnection(url, user, password);//连接数据库
        if(con!=null){
            System.out.println("mysql数据库连接成功！！！");
        }else{
            System.out.println("数据库连接失败！！！");
        }
        switch(action){
            case "change":
                try {
                    String sql2 = "update appUser set `userName` = ?,`userPwd`=? where `userId`=?;";
                    PreparedStatement pstm2 = con.prepareStatement(sql2);
                    pstm2.setString(1, user_name);
                    pstm2.setString(2, user_pwd);
                    pstm2.setString(3, user_id);
                    pstm2.executeLargeUpdate();
                    pstm2.close();
                    con.close();
                out.println("<script>location.href='show_user.jsp';</script>");
                }catch (SQLException e){
                    e.printStackTrace();
                }

                break;
            case "delete":
                String sql = "delete from appUser where `userId` = ?";//对表的操作语句
                PreparedStatement pstm = con.prepareStatement(sql);
                pstm.setString(1,user_id);
                pstm.executeLargeUpdate();
                pstm.close();
                con.close();
                out.println("<script>location.href='show_user.jsp';</script>");

                break;

        }


//        String sql = "insert into appUser(userId,userName,userPwd,userEmail,rgTime) values (?,?,?,?,?)";//对表的操作语句
//        PreparedStatement pstm = con.prepareStatement(sql);
//        pstm.setString(1,userId);
//        pstm.setString(2,userId);
//        pstm.setString(3,userPwd);
//        pstm.setString(4,userEmail);
//        pstm.setString(5,"20190000");
//        out.println(pstm);
//        System.out.println(pstm);
//        pstm.executeLargeUpdate();
//        pstm.close();
//        con.close();
//        out.println("<script>alert('Register successfully!');location.href='main.jsp';</script>");

    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
%>