package com.letoy.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JDBCTemplate<T> {
    private OnIMapperListener<T> listener;
    public void setOnMapperListener(OnIMapperListener< T> mapper){//初始化映射监听器
        this.listener=mapper;
    }
    public void update(String sql, Object[] agrs){
        try{
            Connection conn=null;
            PreparedStatement pstmt=null;
            try {
                conn=ConnectionFactory.getConnection();//获取连接对象
                pstmt=conn.prepareStatement(sql);//预处理sql
                for (int i = 0; i < agrs.length; i++) {//处理占位符
                    pstmt.setObject(i+1, agrs[i]);
                }
                pstmt.executeUpdate();//由于不需要返回结果集，所以直接使用executeUpdate
            } finally {
                ConnectionFactory.close(null, pstmt, conn);//关闭连接
            }
        } catch (Exception e) {
        }
    }

    public T queryOne(String sql,Object[] agrs){
        T obj=null;
        try {
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            try {
                conn=ConnectionFactory.getConnection();
                pstmt=conn.prepareStatement(sql);
                for (int i = 0; i < agrs.length; i++) {
                    pstmt.setObject(i+1, agrs[i]);
                }
                rs=pstmt.executeQuery();
                if (rs.next()) {
                    if (listener!=null) {//表示已经注册了映射监听器了，监听器对象不为空
                        obj=listener.mapper(rs);//结果集作为参数传入回调方法中
                    }

                }
            } finally {
                ConnectionFactory.close(rs, pstmt, conn);
            }
        } catch (Exception e) {
        }
        return obj;
    }
    /**
     * @MIkyou
     * queryAll方法
     * */
    public List<T> queryAll(String sql,Object[] agrs){
        List<T>list=new ArrayList<T>();
        try {
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            try {
                conn=ConnectionFactory.getConnection();
                pstmt=conn.prepareStatement(sql);
                for (int i = 0; i < agrs.length; i++) {
                    pstmt.setObject(i+1, agrs[i]);
                }
                rs=pstmt.executeQuery();
                while (rs.next()) {
                    if (listener!=null) {//表示已经注册了映射监听器了，监听器对象不为空
                        T obj=listener.mapper(rs);//结果集作为参数传入回调方法中
                        list.add(obj);
                    }

                }
            } finally {
                ConnectionFactory.close(rs, pstmt, conn);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
