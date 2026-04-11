package com.example.courseapp.controller;

import com.example.courseapp.dao.LectureService;
import com.example.courseapp.models.Lecture;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
public class LectureController {

    @Autowired
    private LectureService lectureService;

    public static class Form {
        @NotEmpty
        private String title;

        @Size(max = 500)
        private String summary;

        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }

        public String getSummary() { return summary; }
        public void setSummary(String summary) { this.summary = summary; }
    }

    @GetMapping("/lecture/{id}")
    public String viewLecture(@PathVariable Long id, Model model, Principal principal) {
        Lecture lecture = lectureService.findById(id);
        model.addAttribute("lecture", lecture);
        model.addAttribute("attachments", lecture.getAttachments());
        model.addAttribute("comments", lectureService.getComments(id));
        model.addAttribute("currentUser", principal.getName());
        return "lecture";
    }

    @GetMapping("/admin/lecture/new")
    public String newLectureForm(Model model) {
        model.addAttribute("form", new Form());
        return "lecture-form";
    }

    @PostMapping("/admin/lecture/new")
    public String createLecture(@ModelAttribute("form") @Valid Form form,
                                BindingResult result,
                                @RequestParam("files") MultipartFile[] files) throws IOException {
        if (result.hasErrors()) return "lecture-form";

        Lecture saved = lectureService.createLecture(form.getTitle(), form.getSummary());
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                lectureService.saveAttachment(saved.getId(), file);
            }
        }
        return "redirect:/lecture/" + saved.getId();
    }

    @PostMapping("/admin/lecture/{id}/delete")
    public String deleteLecture(@PathVariable Long id) {
        lectureService.deleteById(id);
        return "redirect:/";
    }

    @PostMapping("/lecture/{id}/comment")
    public String addComment(@PathVariable Long id, @RequestParam String content, Principal principal) {
        lectureService.addComment(id, principal.getName(), content);
        return "redirect:/lecture/" + id;
    }
}