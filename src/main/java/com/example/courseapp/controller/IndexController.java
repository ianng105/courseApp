package com.example.courseapp.controller;

import com.example.courseapp.dao.CourseService;
import com.example.courseapp.dao.LectureService;
import com.example.courseapp.dao.PollService;
import com.example.courseapp.dao.UserService;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Lecture;
import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Users;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private PollService pollService;

    @Autowired
    private UserService us;

    @GetMapping("/")
    public String index(Model model) {
        List<Course> courses = courseService.getAllCourses();
        List<Lecture> lectures = lectureService.getAllLectures();
        List<Poll> polls = pollService.getAllPolls();

        model.addAttribute("courses", courses);
        model.addAttribute("lectures", lectures);
        model.addAttribute("polls", polls);

        return"index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Model model, HttpSession session){
            Users u = us.getUserByUsername((String) session.getAttribute("username"));
            model.addAttribute("user",u);
            return "profile";

    }

    @GetMapping("/admin/studentmanage/")
    public ModelAndView StuManage(){
        List<Users> users = us.getUsers();
        ModelAndView mav = new ModelAndView("studentmanage");
        mav.addObject("userlist",users);
        mav.addObject("Searchform",new UserController.SearchUserForm());
        return mav;
    }

    @GetMapping("/admin/studentmanage/{username}")
    public ModelAndView StuManage2(@PathVariable String username){
        ModelAndView mav = new ModelAndView("studentmanage");
        Users stu=us.getUserByUsername(username);
        mav.addObject("userlist", Collections.singletonList(stu));
        mav.addObject("Searchform",new UserController.SearchUserForm());
        return mav;

    }


    @GetMapping("/pollPage/{pollId}")
    public String pollPage(@PathVariable String pollId, Model model){
        try{
            Poll p = pollService.getPollById(pollId);
            model.addAttribute("poll",p);
            return "poll";
        }catch(ResourceNotFoundException e){
            return "index";
        }

    }


    @GetMapping("/lecture/{coursecode}")
    public String courseMPage(@PathVariable String coursecode, Model model){
        try{
            Course c = courseService.getCourse(coursecode);
            List<Lecture> lectures = c.getLectures();
            model.addAttribute("lecturelist",lectures);
            return "lecture";
        }catch(ResourceNotFoundException e){
            return "index";
        }

    }



}