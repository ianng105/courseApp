package com.example.courseapp.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Choice {
    @Id
    @GeneratedValue
    private UUID id;
    private String choice;
    private int voted;

    public String getChoice(){
        return choice;
    }

    public int getVoted(){
        return voted;
    }
}
