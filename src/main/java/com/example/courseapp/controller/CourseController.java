package com.example.courseapp.controller;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Controller;

@Controller
public class CourseController {
    public static class Form {
        @NotEmpty
        private String title;

        @NotEmpty
        private String coursecode;

        @NotEmpty
        @Size(max=100, message="Description")
        private String description;

        public String getTitle (){
            return title;
        }

        public String getCoursecode(){
            return coursecode;
        }

        public String getDescription(){
            return description ;
        }

        public void setTitle(String title ){this.title=title;}

        public void setCoursecode(String coursecode){
            this.coursecode=coursecode;
        }

        public void setDescription(String description){
            this.description=description;
        }

    }
}
