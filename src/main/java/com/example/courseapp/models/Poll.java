package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;


@Entity
public class Poll {
    @Id
    @GeneratedValue
    private String poll_id;
    private String question;

    @OneToMany(mappedBy = "poll", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private ArrayList<Choice> choices=new ArrayList<>(5);

    @Column(name="course_id", insertable=false, updatable=false)
    private String course_id;

    @ManyToOne
    @JoinColumn(name="course_id")
    private Course course;

    public String getQuestion(){
        return question ;
    }

}
