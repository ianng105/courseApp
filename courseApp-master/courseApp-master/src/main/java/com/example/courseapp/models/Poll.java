package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Poll {
    @Id
    @GeneratedValue
    private String poll_id;
    private String question;

    @OneToMany(mappedBy = "poll", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private ArrayList<Choice> choices = new ArrayList<>(5);

    @Column(name = "course_id", insertable = false, updatable = false)
    private String course_id;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @OneToMany(mappedBy = "poll", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    // ===== 构造函数 =====
    public Poll() {}

    public Poll(String question, Course course) {
        this.question = question;
        this.course = course;
    }

    // ===== Getter =====
    public String getPoll_id() { return poll_id; }
    public String getQuestion() { return question; }
    public ArrayList<Choice> getChoices() { return choices; }
    public Course getCourse() { return course; }
    public List<Comment> getComments() { return comments; }

    // ===== Setter =====
    public void setQuestion(String question) { this.question = question; }
    public void setCourse(Course course) { this.course = course; }

    // ===== 选项管理 =====
    public void addChoice(Choice choice) {
        choices.add(choice);
    }

    public void removeChoice(Choice choice) {
        choices.remove(choice);
    }
}