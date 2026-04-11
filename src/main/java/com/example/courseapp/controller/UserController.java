package com.example.courseapp.controller;

import com.example.courseapp.dao.UserService;
import com.example.courseapp.exceptions.InvalidEmail;
import com.example.courseapp.exceptions.InvalidPhoneNumber;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Users;
import com.example.courseapp.validator.UserValidator;
import jakarta.annotation.Resource;
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

    // 注册页面
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("register", "Users", new Form());
    }

    // 注册提交
    @PostMapping("/create")
    public String create(@ModelAttribute("Users") @Valid Form form, BindingResult result)
            throws IOException, InvalidEmail, InvalidPhoneNumber {
        uv.validate(form, result);
        if (result.hasErrors()) {
            return "register";
        }

        if (form.getIdentity().equals("student")) {
            us.createStudent(form.getUsername(), form.getFullname(), form.getPassword(), form.getEmail(), form.getPhonenum());
            logger.info("Student {} created.", form.getUsername());
        } else {
            us.createTeacher(form.getUsername(), form.getFullname(), form.getPassword(), form.getEmail(), form.getPhonenum());
            logger.info("Teacher {} created.", form.getUsername());
        }
        return "redirect:/";
    }

    // 个人资料页
    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        Users user = us.getUserByUsername(principal.getName());
        model.addAttribute("user", user);
        return "profile";
    }

    // 管理员查看所有用户
    @GetMapping("/admin/users")
    public String adminUsers(Model model, Authentication auth) {
        if (!auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_TEACHER"))) {
            return "redirect:/";
        }
        model.addAttribute("users", us.getUsers());
        return "admin-users";
    }

    // 管理员删除用户
    @PostMapping("/admin/user/{username}/delete")
    public String deleteUser(@PathVariable String username, Authentication auth) {
        if (auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_TEACHER"))) {
            us.delete(username);
            logger.info("student "+username+" deleted");
        }
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/user/{username}/update")
    public String updateUser(@PathVariable String username,@ModelAttribute("Users") @Valid Form form, BindingResult result, Authentication auth)
        throws InvalidPhoneNumber,InvalidEmail{
        if (auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_TEACHER"))) {

            us.update(username, form.getFullname(), form.getPassword(), form.getEmail(), form.getPhonenum());
            logger.info("student "+username+" full name "+form.getFullname()+" password "+form.getPassword()+" email "+form.getEmail()+" phone number "+form.getPhonenum());
        }
        return "redirect:/admin/users";
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
}