package com.example.courseapp.controller;

import com.example.courseapp.models.Choice;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;

@Controller
public class PollController {

    @NotEmpty
    @Size(min=3,max=30,message="Your question")
    private String question;

    @NotEmpty
    private ArrayList<Choice> choices;

    public String getQuestion(){
        return question;
    }

    public ArrayList<Choice> getChoices(){
        return choices;
    }

    public void setChoices(ArrayList<Choice> c){
        choices=c;
    }
}
