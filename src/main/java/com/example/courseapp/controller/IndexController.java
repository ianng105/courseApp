package com.example.courseapp.controller;

import com.example.courseapp.dao.CourseService;
import com.example.courseapp.dao.LectureService;
import com.example.courseapp.dao.PollService;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Lecture;
import com.example.courseapp.models.Poll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private PollService pollService;

    @GetMapping("/")
    public String index(Model model) {
        Course course = courseService.findAll().get(0);
        List<Lecture> lectures = lectureService.findAll();
        List<Poll> polls = pollService.findAll();

        model.addAttribute("course", course);
        model.addAttribute("lectures", lectures);
        model.addAttribute("polls", polls);

        return "index";
    }
}