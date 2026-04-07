package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Course {
    @Id
    @GeneratedValue
    private String course_id ;
    private String title;
    private String coursecode;
    private String description;

    @OneToMany
    private ArrayList<Lecture>lectures=new ArrayList<>() ;

    @OneToMany
    private ArrayList<Poll>polls=new ArrayList<>();

    @ManyToMany
    private ArrayList<Student> students= new ArrayList<>();

    @ManyToMany
    private List<Teacher> teachers= new ArrayList<>();

    public String getTitle(){
        return title;
    }

    public String getCoursecode(){
        return coursecode;
    }

    public String getDescription(){
        return description;
    }

    public ArrayList<Lecture> getLectures(){return lectures;}

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
