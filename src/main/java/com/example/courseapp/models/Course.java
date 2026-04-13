package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Course {
    @Id
    private String coursecode;
    private String title;

    private String description;


    @OneToMany
    private List<Lecture>lectures=new ArrayList<>() ;

    @OneToMany
    private List<Poll>polls=new ArrayList<>();

    @ManyToMany
    private List<Users> users= new ArrayList<>();

    public Course (){}

    public  Course(String t, String cc, String d){
        title=t;
        coursecode=cc;
        description=d;

    }


    public String getTitle(){
        return title;
    }

    public String getCoursecode(){
        return coursecode;
    }

    public String getDescription(){
        return description;
    }

    public List<Lecture> getLectures(){return lectures;}

    public void setTitle(String title){
        this.title=title;
    }

    public void setCoursecode(String coursecode){
        this.coursecode=coursecode;
    }

    public void setDescription(String description){this.description=description;}

    public void addLecture(Lecture lecture){
       lectures.add(lecture);
    }

    public void removeLecture(Lecture lecture){
        lectures.remove(lecture);
    }
}
