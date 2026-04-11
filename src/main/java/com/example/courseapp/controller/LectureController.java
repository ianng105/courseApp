package com.example.courseapp.controller;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Controller;

@Controller
public class LectureController {
    public static class Form{

        @NotEmpty
        private String title;

        @Size(max=20,message="Summary:")
        private String summary;

        public String getTitle(){
            return title;
        }

        public String getSummary(){
            return summary;
        }

        public void setTitle(String title){
            this.title=title;
        }

        public void setSummary(String summary){
            this.summary=summary;
        }
    }
}
