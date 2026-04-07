package com.example.courseapp.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;

import java.util.UUID;

@Entity
public class User {

    @Id
    @GeneratedValue
    private UUID user_id;

    @Column(unique = true)
    private String username ;

    private String fullname ;

    private String password;

    @Email(message="Please enter valid email address")
    private String email;

    @Column(length = 8)
    private int phonenum;

    public User(){}

    public User(String username,String fullname,String password, String email,int phonenum){
        this.username=username;
        this.fullname=fullname;
        this.password=password;
        this.email=email;
        this.phonenum=phonenum;
    }

    public String getUsername(){
        return username;
    }

    public String getFullname(){
        return fullname;
    }

    public String getPassword(){
        return password;
    }

    public String getEmail(){
        return email;
    }

    public int getPhonenum(){
        return phonenum;
    }

    public void setUsername(String username){this.username = username;}

    public void setFullname(String fullname){
        this.fullname=fullname;
    }

    public void setPassword(String password){
        this.password=password;
    }

    public void setEmail(String email){
        this.email=email;
    }

    public void setPhonenum(int phonenum){
        this.phonenum=phonenum;
    }


}
