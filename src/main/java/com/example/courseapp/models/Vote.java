package com.example.courseapp.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(uniqueConstraints = {
        @UniqueConstraint(columnNames = {"username", "poll_id"})  // 每人每个Poll只能投一票
})
public class Vote {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "username")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    @ManyToOne
    @JoinColumn(name = "choice_id")
    private Choice choice;

    private LocalDateTime votedAt;

    public Vote() {}

    public Vote(Users user, Poll poll, Choice choice) {
        this.user = user;
        this.poll = poll;
        this.choice = choice;
        this.votedAt = LocalDateTime.now();
    }

    // Getters
    public UUID getId() { return id; }
    public Users getUser() { return user; }
    public Poll getPoll() { return poll; }
    public Choice getChoice() { return choice; }
    public LocalDateTime getVotedAt() { return votedAt; }

    // Setters
    public void setChoice(Choice choice) {
        this.choice = choice;
        this.votedAt = LocalDateTime.now(); // 修改投票时更新时间
    }

    public void setUser(Users user) { this.user = user; }
    public void setPoll(Poll poll) { this.poll = poll; }
    public void setVotedAt(LocalDateTime votedAt) { this.votedAt = votedAt; }
}