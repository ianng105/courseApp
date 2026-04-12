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

import java.security.Principal;
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
    public String index(Model model, Principal principal) {

        List<Course> allCourses = courseService.findAll();
        model.addAttribute("courses", allCourses);  

        if (principal == null) {
            model.addAttribute("lectures", lectureService.findAll());
            model.addAttribute("polls", pollService.findAll());
            if (!allCourses.isEmpty()) {
                model.addAttribute("course", allCourses.get(0));
            }
        } else {
            String username = principal.getName();
            Course userCourse = courseService.findByUsername(username);  

            if (userCourse != null) {
                model.addAttribute("course", userCourse);

                model.addAttribute("lectures", lectureService.findByCourseId(userCourse.getId()));    
                model.addAttribute("polls", pollService.findByCourseId(userCourse.getId()));     
            } else {
                model.addAttribute("lectures", lectureService.findAll());
                model.addAttribute("polls", pollService.findAll());
            }
        }

        return "index";
    }
}
