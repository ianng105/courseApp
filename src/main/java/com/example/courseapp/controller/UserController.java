package com.example.courseapp.controller;


import com.example.courseapp.models.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/tesing_user")
    public String testing (ModelMap modelMap){
        Student ian = new Student("Ng Man Yau Ian","ian","pw","champian.ng@gmail.com",64689772);
        modelMap.addAttribute("username",ian.getUsername());
        return "testModel";
    }

}
