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

        // 1. 未登录用户：显示所有 Course
        List<Course> allCourses = courseService.findAll();
        model.addAttribute("courses", allCourses);   // index.jsp 可以循环显示所有课程

        if (principal == null) {
            // 未登录：显示所有 lectures 和 polls（符合需求：unregistered users 可以看 index 全部内容）
            model.addAttribute("lectures", lectureService.findAll());
            model.addAttribute("polls", pollService.findAll());
            // 可选：不传单个 course，或者传第一个作为默认
            if (!allCourses.isEmpty()) {
                model.addAttribute("course", allCourses.get(0));
            }
        } else {
            // 2. 已登录用户：根据 username 查找该用户所属的 Course
            String username = principal.getName();
            Course userCourse = courseService.findByUsername(username);   // ← 你需要在 CourseService 里实现这个方法

            if (userCourse != null) {
                model.addAttribute("course", userCourse);

                // 显示该 course 对应的 lectures 和 polls
                model.addAttribute("lectures", lectureService.findByCourseId(userCourse.getId()));     // ← 需要在 LectureService 实现
                model.addAttribute("polls", pollService.findByCourseId(userCourse.getId()));         // ← 需要在 PollService 实现
            } else {
                // 如果找不到该用户的 course，fallback 到显示所有
                model.addAttribute("lectures", lectureService.findAll());
                model.addAttribute("polls", pollService.findAll());
            }
        }

        return "index";
    }
}
