package com.example.courseapp.models;

import jakarta.persistence.Entity;

import java.util.ArrayList;

@Entity
public class Teacher extends User {
    private String identity = "teacher";
    private ArrayList<String> coursesTeach=new ArrayList<>();

    public String getIdentity(){
        return identity;
    }

    public ArrayList<String> getCoursesTeach(){
        return coursesTeach;
    }

    public Teacher (){
    }

    public Teacher (String username,String fullname,String password, String email,int phonenum){
        super( username, fullname, password,  email, phonenum);
    }

    public String addCoursesTeach(String coursecode){
        for(String i:coursesTeach){
            if(i.equals(coursecode)){
                return coursecode+" already exist";
            }
        }
        coursesTeach.add(coursecode);
        return "success";
    }

    public String removeCoursesTeach(String coursecode){
        for(int i=0;i<coursesTeach.size();i++){
            if(coursesTeach.get(i).equals(coursecode)){
                coursesTeach.remove(i);
                return "remove lecture "+coursecode+" from this course";
            }
        }
        return coursecode+" does not exist";
    }






}
