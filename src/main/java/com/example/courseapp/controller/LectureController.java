package com.example.courseapp.controller;

import com.example.courseapp.dao.CommentService;
import com.example.courseapp.dao.LectureService;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Lecture;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class LectureController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private CommentService commentService;

    public static class Form {

        @NotEmpty
        private String title;

        @NotEmpty
        private String coursecode;

        @Size(max = 200, message = "Summary too long")
        private String summary;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getCoursecode() { return coursecode; }
        public void setCoursecode(String coursecode) { this.coursecode = coursecode; }

        public String getSummary() { return summary; }
        public void setSummary(String summary) { this.summary = summary; }
    }

    // 查看单个Lecture
    @GetMapping("/lecture/{L_id}")
    public String viewLecture(@PathVariable String L_id, Model model, Principal principal) {
        try {
            Lecture lecture = lectureService.getLectureById(L_id);
            model.addAttribute("lecture", lecture);
            model.addAttribute("attachments", lecture.getAttachments());
            model.addAttribute("comments", commentService.getCommentsByLecture(L_id));
            model.addAttribute("currentUser", principal.getName());
            return "lecture";
        } catch (ResourceNotFoundException e) {
            return "redirect:/";
        }
    }

    // 新建Lecture表单页面
    @GetMapping("/admin/lecture/new")
    public String newLectureForm(Model model) {
        model.addAttribute("form", new Form());
        return "lecture-form";
    }

    // 创建Lecture
    @PostMapping("/admin/lecture/new")
    public String createLecture(@ModelAttribute("form") @Valid Form form,
                                BindingResult result) {
        if (result.hasErrors()) return "lecture-form";
        try {
            lectureService.createLecture(form.getCoursecode(), form.getTitle(), form.getSummary());
        } catch (ResourceNotFoundException e) {
            return "lecture-form";
        }
        return "redirect:/";
    }

    // 删除Lecture
    @PostMapping("/admin/lecture/{L_id}/delete")
    public String deleteLecture(@PathVariable String L_id) {
        try {
            lectureService.deleteLecture(L_id);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/";
    }

    // 添加评论
    @PostMapping("/lecture/{L_id}/comment")
    public String addComment(@PathVariable String L_id, @RequestParam String content, Principal principal) {
        try {
            commentService.addCommentToLecture(principal.getName(), L_id, content);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/lecture/" + L_id;
    }
}