package com.example.courseapp.models;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Choice {
    @Id
    @GeneratedValue
    private UUID id;
    private String choice;
    private int voted;

    @Column(name = "poll_id", insertable = false, updatable = false)
    private String poll_id;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    // ===== 构造函数 =====
    public Choice() {}

    public Choice(String choice, Poll poll) {
        this.choice = choice;
        this.poll = poll;
        this.voted = 0;
    }

    // ===== Getter =====
    public UUID getId() { return id; }
    public String getChoice() { return choice; }
    public int getVoted() { return voted; }
    public Poll getPoll() { return poll; }

    // ===== Setter =====
    public void setChoice(String choice) { this.choice = choice; }
    public void setVoted(int voted) { this.voted = voted; }
    public void setPoll(Poll poll) { this.poll = poll; }

    // ===== 投票 =====
    public void vote() { this.voted++; }
}