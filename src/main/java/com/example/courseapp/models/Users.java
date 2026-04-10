package com.example.courseapp.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Users {


    @Id
    private String username ;

    private String fullname ;

    private String password;

    @Email(message="Please enter valid email address")
    private String email;

    @Column(length = 8)
    private int phonenum;

    private String identity;

    private String role = "USER";

    @ManyToMany
    @JoinTable(name = "user_course", // Name of the bridge table
            joinColumns = @JoinColumn(name = "username"),
            inverseJoinColumns = @JoinColumn(name = "course_id"))

    private List<Course> courses=new ArrayList<>() ;

    public Users(){}

    public Users(String username, String fullname, String password, String email, int phonenum, String identity){
        this.username=username;
        this.fullname=fullname;
        this.password=password;
        this.email=email;
        this.phonenum=phonenum;
        this.identity=identity;


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

    public String getIdentity(){return identity;}

    public String getRole(){
        return role;
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

    public void setIdentity(String identity){
        this.identity=identity;
    }

    public void setCourses(ArrayList<Course> c ){courses=c;}

    public void addCourses(Course c){
        courses.add(c);
    }

    public void removeCourses(Course c){
        courses.remove(c);
    }

    public void setToAdmin(){
        role="ADMIN";
    }



}
