package com.letoy;
import java.sql.*;
public class Conn{
 public static void main(String[] args) throws SQLException, ClassNotFoundException {
  String driver = "com.mysql.cj.jdbc.Driver";
  /*这个链接包含主机，库名“newcapec“，其他乱七八糟的都是模版*/
  String url = "jdbc:mysql://localhost:3306/webApp?verifyServerCertificate=false&useSSL=false";

  String user = "root"; //用户名root，一般都是这个
  String password = "Zxcvbnm64895579@"; //自己数据库密码
  Class.forName(driver); //这上面可以封装起来一个方法
  Connection con = (Connection) DriverManager.getConnection(url, user, password);//连接数据库
//  Statement stmt = (Statement) con.createStatement();
//  String sql = "insert into appUser(userName,userId,userPwd,rgTime,userEmail)" + "values(110,1023,124,123,142)";//对表的操作语句
//  System.out.println(sql);
//  int result = (int) stmt.executeLargeUpdate(sql);
  /*executeLargeUpdate 是对数据库进行修改增加的操作。*/
//  System.out.println("受影响的行数:"+result);

//  stmt.close();
  con.close();

 }
}