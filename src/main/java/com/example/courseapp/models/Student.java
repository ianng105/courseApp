package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;

@Entity
public class Student extends User{

    @ManyToMany
    @JoinTable(name = "student_course", // Name of the bridge table
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "course_id"))
    private ArrayList<Course> coursesTake=new ArrayList<>() ;
    private String identity = "student";

    public String getIdentity(){
        return identity;
    }


    public ArrayList<Course> getCoursesTake(){
        return coursesTake;
    }

    public Student (){
    }

    public Student (String username,String fullname,String password, String email,int phonenum){
        super( username, fullname, password,  email, phonenum);
    }

    public void addCoursesTake(Course c){
        coursesTake.add(c);
    }

    public void removeCoursesTake(Course c){
        coursesTake.remove(c);
    }
}
