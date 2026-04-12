package com.example.courseapp.controller;

import com.example.courseapp.dao.CourseService;
import com.example.courseapp.exceptions.InvalidCourseCode;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    // ===== 创建课程的表单对象 =====
    public static class Form {
        @NotEmpty
        private String title;

        @NotEmpty
        @Size(min = 2, message = "Course title should have at least 2 characters")
        private String coursecode1;   // 如 "CS"

        @Min(value = 1000, message = "Course number should be >= 1000")
        private int coursecode2;      // 如 1234

        @NotEmpty
        private String coursecode3;   // "F" 或 "SEF"

        @NotEmpty
        @Size(max = 100, message = "Description too long")
        private String description;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getCoursecode1() { return coursecode1; }
        public void setCoursecode1(String coursecode1) { this.coursecode1 = coursecode1; }

        public int getCoursecode2() { return coursecode2; }
        public void setCoursecode2(int coursecode2) { this.coursecode2 = coursecode2; }

        public String getCoursecode3() { return coursecode3; }
        public void setCoursecode3(String coursecode3) { this.coursecode3 = coursecode3; }

        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
    }

    // ===== 添加Lecture的表单对象 =====
    public static class LectureForm {
        @NotEmpty
        private String title;

        private String summary;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getSummary() { return summary; }
        public void setSummary(String summary) { this.summary = summary; }
    }

    // 创建课程 - 表单页面
    @GetMapping("course/new")
    // Accept this version
    public ModelAndView newCourseForm(Model model) {
        return new ModelAndView("course-form", "Course", new CourseController.Form());
    }

    // 创建课程 - 提交
    @PostMapping("course/new")
    public String createCourse(@ModelAttribute("Course") @Valid CourseController.Form form, BindingResult result, Model model) {
        if (result.hasErrors()) return "course-form";
        try {
            courseService.createNewCourse(
                    form.getTitle(),
                    form.getCoursecode1(),
                    form.getCoursecode2(),
                    form.getCoursecode3(),
                    form.getDescription()
            );
        } catch (InvalidCourseCode e) {
            model.addAttribute("error", e.getMessage());
            return "course-form";
        }
        return "redirect:/";
    }

    // 删除课程
    @PostMapping("/admin/course/{coursecode}/delete")
    public String deleteCourse(@PathVariable String coursecode) {
        try {
            courseService.deleteCourse(coursecode);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/";
    }

    // 给课程添加Lecture - 表单页面
    @GetMapping("/admin/course/{coursecode}/lecture/new")
    public String newLectureForm(@PathVariable String coursecode, Model model) {
        model.addAttribute("coursecode", coursecode);
        model.addAttribute("lectureForm", new LectureForm());
        return "lecture-form";
    }

    // 给课程添加Lecture - 提交
    @PostMapping("/admin/course/{coursecode}/lecture/new")
    public String addLecture(@PathVariable String coursecode,
                             @ModelAttribute("lectureForm") @Valid LectureForm form,
                             BindingResult result) {
        if (result.hasErrors()) return "lecture-form";
        try {
            courseService.addLecture(coursecode, form.getTitle(), form.getSummary());
        } catch (ResourceNotFoundException e) {
            return "redirect:/";
        }
        return "redirect:/";
    }

    // 从课程中移除Lecture
    @PostMapping("/admin/course/{coursecode}/lecture/{L_id}/remove")
    public String removeLecture(@PathVariable String coursecode, @PathVariable String L_id) {
        try {
            courseService.removeLecture(coursecode, L_id);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/";
    }
}