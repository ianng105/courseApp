package com.example.courseapp.controller;

import com.example.courseapp.dao.CourseService;
import com.example.courseapp.models.Course;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    public static class Form {
        @NotEmpty
        private String title;

        @NotEmpty
        private String coursecode;

        @NotEmpty
        @Size(max = 100, message = "Description")
        private String description;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getCoursecode() { return coursecode; }
        public void setCoursecode(String coursecode) { this.coursecode = coursecode; }

        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
    }

    @GetMapping("/admin/course")
    public String editCourseForm(Model model) {
        model.addAttribute("form", new Form());
        return "course-form";
    }

    @PostMapping("/admin/course")
    public String updateCourse(@ModelAttribute("form") @Valid Form form, BindingResult result) {
        if (result.hasErrors()) return "course-form";
        courseService.updateCourse(form.getTitle(), form.getCoursecode(), form.getDescription());
        return "redirect:/";
    }
}