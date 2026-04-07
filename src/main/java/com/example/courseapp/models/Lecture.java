package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;


@Entity
public class Lecture {
    @Id
    @GeneratedValue
    private String L_id;
    private String course_id;
    private String title;
    private String summary;
    @OneToMany(mappedBy = "lecture", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Attachment> attachments = new ArrayList<>();
    private ArrayList<String> comments = new ArrayList<>();

    public String getCourse_id(){
        return course_id;
    }

    public String getTitle() {
        return title;
    }

    public String getSummary() {
        return summary;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setCourse_id(String course_id){
        this.course_id=course_id;
    }

    public List<Attachment> getAttachments() {
        return attachments;
    }
}