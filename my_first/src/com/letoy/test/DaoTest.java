package com.letoy.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.letoy.bean.Customer;
import com.letoy.dao.CustomerDAO;

public class DaoTest {

    public static void main(String[] args) {
        new DaoTest().add();//增
//        new DaoTest().delete();//删
         new DaoTest().update();//改
//        new DaoTest().findOne();//查询具体某一个
         new DaoTest().findAll();//查询一个集合
    }

    private void findAll() {
        // TODO Auto-generated method stub
        CustomerDAO customerDAO=new CustomerDAO();
        List<Customer> customers=customerDAO.findAll();
        for (Customer customer : customers) {
            System.out.println(customer.toString());
        }

    }

    private void findOne() {
        // TODO Auto-generated method stub
        CustomerDAO customerDAO=new CustomerDAO();
        Customer customer=customerDAO.findByName("Bob");
        System.out.println(customer.toString());
    }

    private void update() {
        // TODO Auto-generated method stub
        CustomerDAO customerDAO=new CustomerDAO();
        customerDAO.update(new Customer(2L, "Bob", "男", "123456789", "英国"));
    }

    private void delete() {
        // TODO Auto-generated method stub
        CustomerDAO customerDAO=new CustomerDAO();
        customerDAO.delete(1L);
    }

    private void add() {
        CustomerDAO customerDAO=new CustomerDAO();
        try {
            Customer customer=new Customer(1L, "Mikyou", "男", "123456789", "中国");
            customerDAO.save(customer);
            Customer customer2=new Customer(2L, "Alice", "女", "123456789", "美国");
            customerDAO.save(customer2);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
