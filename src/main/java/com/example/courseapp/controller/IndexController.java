package com.example.courseapp.controller;

import com.example.courseapp.dao.*;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
    

    @GetMapping("/admin/studentmanage")
    public String StuManage(Model model){
        List<Users> users = us.getUsers();
        model.addAttribute("userlist",users);
        return "studentmanage";
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

    @Autowired
    private VoteService voteService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/profile")
    public String profile(Model model, Principal principal){
        Users u = us.getUserByUsername(principal.getName());
        model.addAttribute("user", u);

        try {
            List<Vote> votes = voteService.getVotesByUser(principal.getName());
            model.addAttribute("votes", votes);
        } catch (ResourceNotFoundException e) {
            model.addAttribute("votes", List.of());
        }

        try {
            List<Comment> comments = commentService.getCommentsByUser(principal.getName());
            model.addAttribute("comments", comments);
        } catch (ResourceNotFoundException e) {
            model.addAttribute("comments", List.of());
        }

        return "profile";
    }

}