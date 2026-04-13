package com.example.courseapp.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
public class Comment {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(length = 1000)
    private String content;

    @ManyToOne
    @JoinColumn(name = "username")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "L_id", nullable = true)
    private Lecture lecture;

    @ManyToOne
    @JoinColumn(name = "poll_id", nullable = true)
    private Poll poll;

    private LocalDateTime createdAt;

    public Comment() {}

    public Comment(String content, Users user, Lecture lecture) {
        this.content = content;
        this.user = user;
        this.lecture = lecture;
        this.createdAt = LocalDateTime.now();
    }

    public Comment(String content, Users user, Poll poll) {
        this.content = content;
        this.user = user;
        this.poll = poll;
        this.createdAt = LocalDateTime.now();
    }

    // Getters
    public UUID getId() { return id; }
    public String getContent() { return content; }
    public Users getUser() { return user; }
    public Lecture getLecture() { return lecture; }
    public Poll getPoll() { return poll; }
    public LocalDateTime getCreatedAt() { return createdAt; }

    // Setters
    public void setContent(String content) { this.content = content; }
    public void setUser(Users user) { this.user = user; }
    public void setLecture(Lecture lecture) { this.lecture = lecture; }
    public void setPoll(Poll poll) { this.poll = poll; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
