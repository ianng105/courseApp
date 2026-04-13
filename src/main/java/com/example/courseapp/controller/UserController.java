package com.example.courseapp.controller;

import com.example.courseapp.dao.UserService;
import com.example.courseapp.exceptions.InvalidEmail;
import com.example.courseapp.exceptions.InvalidPhoneNumber;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Users;
import com.example.courseapp.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class UserController {
    private final Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    UserValidator uv;

    @Resource
    UserService us;

    // ===== 注册表单对象 =====
    public static class Form {
        @NotEmpty(message = "Please enter your user name.")
        private String username;

        @NotEmpty
        private String fullname;

        @NotEmpty
        private String email;

        @NotEmpty
        private String phonenum;

        @NotEmpty(message = "Please enter your password.")
        @Size(min = 6, max = 15, message = "Your password length must be between {min} and {max}.")
        private String password;
        private String confirm_password;

        @NotEmpty(message = "Are you student or teacher ?")
        private String identity;

        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }

        public String getFullname() { return fullname; }
        public void setFullname(String fullname) { this.fullname = fullname; }

        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }

        public String getPhonenum() { return phonenum; }
        public void setPhonenum(String phonenum) { this.phonenum = phonenum; }

        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }

        public String getConfirm_password() { return confirm_password; }
        public void setConfirm_password(String confirm_password) { this.confirm_password = confirm_password; }

        public String getIdentity() { return identity; }
        public void setIdentity(String identity) { this.identity = identity; }
    }

    public static class SearchUserForm {
        private String username;
        public String getUsername(){return username;}
        public void setUsername(String u){username=u;}
    }

    // 注册页面
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("register", "Users", new Form());
    }

    // 注册提交
    @PostMapping("/create")
    public String create(@ModelAttribute("Users") @Valid Form form, BindingResult result, HttpSession session)
            throws IOException, InvalidEmail, InvalidPhoneNumber {
        uv.validate(form, result);
        if (result.hasErrors()) {
            return "register";
        }

        if (form.getIdentity().equals("student")) {
            us.createStudent(form.getUsername(), form.getFullname(), form.getPassword(), form.getEmail(), form.getPhonenum());
            session.setAttribute("username",form.getUsername());
            session.setAttribute("role",form.getIdentity());
            logger.info("Student {} created.", form.getUsername());
        } else {
            us.createTeacher(form.getUsername(), form.getFullname(), form.getPassword(), form.getEmail(), form.getPhonenum());
            logger.info("Teacher {} created.", form.getUsername());
        }
        return "redirect:/";
    }

    // 个人资料页
    @GetMapping("/admin/profile/{username}")
    public String profile(@PathVariable String username, Model model) {
        Users user = us.getUserByUsername(username);
        model.addAttribute("user", user);
        return "profile";
    }



    // 管理员查看所有用户
    @GetMapping("/admin/users")
    public String adminUsers(Model model) {
        model.addAttribute("users", us.getUsers());
        return "admin-users";
    }

    // 管理员删除用户
    @PostMapping("/admin/user/{username}/delete")
    public ModelAndView deleteUser(@PathVariable String username) {
        us.delete(username);
        return new ModelAndView("studentmanage","Searchform",new SearchUserForm());
    }

    // 用户添加课程
    @PostMapping("/profile/addCourse")
    public String addCourse(@RequestParam String coursecode, Principal principal) {
        try {
            us.addCourse(principal.getName(), coursecode);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/profile";
    }

    // 用户移除课程
    @PostMapping("/profile/removeCourse")
    public String removeCourse(@RequestParam String coursecode, Principal principal) {
        try {
            us.removeCourse(principal.getName(), coursecode);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/profile";
    }


    @PostMapping("/admin/studentmanage/")
    public String SearchUser(@ModelAttribute("Searchform") @Valid SearchUserForm form, BindingResult result,Model model){
       String un=form.username;
       return "redirect:/admin/studentmanage/"+un;
    }
}