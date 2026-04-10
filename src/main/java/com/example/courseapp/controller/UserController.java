package com.example.courseapp.controller;


import com.example.courseapp.dao.UserService;
import com.example.courseapp.exceptions.InvalidEmail;
import com.example.courseapp.exceptions.InvalidPhoneNumber;
import com.example.courseapp.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


@Controller
public class UserController {
    private final Logger logger = LogManager.getLogger(this.getClass());
    @Autowired
    UserValidator uv;

    @Resource
    UserService us;


    public static class Form {
        @NotEmpty(message="Please enter your user name.")
        private String username;

        @NotEmpty
        private String fullname;

        @NotEmpty
        private String email;

        @NotEmpty
        private String phonenum;

        @NotEmpty(message="Please enter your password.")
        @Size(min=6, max=15, message="Your password length must be between {min} and {max}.")
        private String password;
        private String confirm_password;

        @NotEmpty(message="Are you student or teacher ?")
        private String identity;

        // getters and setters for all properties
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getFullname(){return fullname;}

        public void setFullname(String fullname){this.fullname=fullname;}

        public String getEmail(){return email;}

        public void setEmail(String email){this.email=email;}

        public String getPhonenum(){return phonenum;}

        public void setPhonenum(String phonenum){this.phonenum=phonenum;}

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getConfirm_password() {
            return confirm_password;
        }

        public void setConfirm_password(String confirm_password) {
            this.confirm_password = confirm_password;
        }

        public String getIdentity() {
            return identity;
        }

        public void setIdentity(String identity) {
            this.identity = identity;
        }
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("register", "Users", new Form());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("Users") @Valid Form form, BindingResult result)
            throws IOException, InvalidEmail, InvalidPhoneNumber {
        uv.validate(form, result);

        if (result.hasErrors()) {
            return "register";
        }

        // set the path later
        if(form.getIdentity().equals("student")){
            us.createStudent(form.getUsername(),form.getFullname(), form.getPassword(),form.getEmail(), form.getPhonenum());
            logger.info("Student {} created.", form.getUsername());
            return "index";
        }
        else{
            us.createTeacher(form.getUsername(),form.getFullname(),  form.getPassword(),form.getEmail(), form.getPhonenum());
            logger.info("Teacher {} created.", form.getUsername());
            return "index";
        }
    }

}
