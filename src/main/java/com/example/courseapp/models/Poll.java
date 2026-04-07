package com.example.courseapp.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Entity
public class Poll {
    @Id
    @GeneratedValue
    private String id;
    private String question;
    private ArrayList<Choice> choices=new ArrayList<>();
}
