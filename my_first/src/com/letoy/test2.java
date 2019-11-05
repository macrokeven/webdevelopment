package com.letoy;
import com.letoy.bean.Customer;
import com.letoy.common.ConnectionFactory;
import com.letoy.common.JDBCTemplate;
import com.letoy.common.OnIMapperListener;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
/**
 * @Mikyou
 * JDBCTemplate：<--->JDBC模板类
 *
 * */
abstract class CustomerDAO implements OnIMapperListener<Customer> {
    private JDBCTemplate<Customer> temp;

    public CustomerDAO() {
        temp = new JDBCTemplate<Customer>();
        temp.setOnMapperListener(this);//给CustomerDAO注册映射监听器
    }

    /**
     * 以下三个方法都有一个共同的特点就是无需带有返回结果集，所以直接在JDBCTemplate模板类中直接封装成一个update方法即可
     */
    public void save(Customer customer) throws SQLException {
        String sql = "insert into tb1_customer(name,gender,telephone,address) values(?,?,?,?)";
        Object[] agrs = {customer.getName(), customer.getGender(), customer.getTelephone(), customer.getAddress()};
        temp.update(sql, agrs);
    }
}