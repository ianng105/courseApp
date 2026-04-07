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

    @Column(name="poll_id", insertable=false, updatable=false)
    private String poll_id;

    @ManyToOne
    @JoinColumn(name="poll_id")
    private Poll poll;

    public String getChoice(){
        return choice;
    }

    public int getVoted(){
        return voted;
    }
}
