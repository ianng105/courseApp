package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;


@Entity
public class Lecture {
    @Id
    @GeneratedValue
    private String L_id;
    private String coursecode;
    private String title;
    private String summary;
    @OneToMany(mappedBy = "lecture", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Attachment> attachments = new ArrayList<>();

    @OneToMany(mappedBy = "lecture", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    public Lecture(){}

    public Lecture(String cc, String t, String s){
        coursecode=cc;
        title=t;
        summary=s;
    }

    public String getCoursecode(){
        return coursecode;
    }

    public String getTitle() {
        return title;
    }

    public String getSummary() {
        return summary;
    }

    public List<Comment> getComments() { return comments; }

    public void setComments(List<Comment> c) { comments = c; }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setCoursecode(String coursecode){
        this.coursecode=coursecode;
    }

    public List<Attachment> getAttachments() {
        return attachments;
    }
}