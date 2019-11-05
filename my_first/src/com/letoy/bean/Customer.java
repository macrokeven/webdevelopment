package com.letoy.bean;

public class Customer{
    private Long id1;
    private String name1;
    private String gender1;
    private String telephone1;
    private String address1;

    public Customer(Long id, String name, String gender, String telephone, String address) {
        id1 = id;
        name1 = name;
        gender1 = gender;
        telephone1 = telephone;
        address1 = address;
    }

    public String getName(){
        return name1;
    }
    public String getGender(){
        return gender1;
    }
    public String getTelephone(){
        return telephone1;
    }
    public String getAddress(){
        return address1;
    }
    public Long getId(){
        return id1;
    }
}
