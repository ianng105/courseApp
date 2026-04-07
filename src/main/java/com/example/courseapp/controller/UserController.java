package com.example.courseapp.controller;


import com.example.courseapp.models.Course;
import com.example.courseapp.models.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/tesing_user")
    public String testing (ModelMap modelMap){
        Student ian = new Student("Ng Man Yau Ian","ian","pw","champian.ng@gmail.com",64689772);
        Course comp3150sef = new Course();
        comp3150sef.setCoursecode("COMP3150SEF");
        comp3150sef.setTitle("Project Manager");
        comp3150sef.setDescription("testing testing 123");
        ian.addCoursesTake(comp3150sef);
        String c="";
        for(Course i:ian.getCoursesTake()){
            c=c+i.getCoursecode();
        }

        modelMap.addAttribute("username",c);
        return "testModel";
    }

}
