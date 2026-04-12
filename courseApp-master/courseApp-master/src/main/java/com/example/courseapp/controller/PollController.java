package com.example.courseapp.controller;

import com.example.courseapp.dao.CommentService;
import com.example.courseapp.dao.PollService;
import com.example.courseapp.dao.VoteService;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Poll;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class PollController {

    @Autowired
    private PollService pollService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private VoteService voteService;

    // ===== 表单对象 =====
    public static class Form {
        @NotEmpty
        @Size(min = 3, max = 30)
        private String question;

        @NotEmpty
        private String coursecode;

        private List<String> choiceTexts = new ArrayList<>();

        public String getQuestion() { return question; }
        public void setQuestion(String question) { this.question = question; }

        public String getCoursecode() { return coursecode; }
        public void setCoursecode(String coursecode) { this.coursecode = coursecode; }

        public List<String> getChoiceTexts() { return choiceTexts; }
        public void setChoiceTexts(List<String> choiceTexts) { this.choiceTexts = choiceTexts; }
    }

    // 查看单个Poll
    @GetMapping("/poll/{pollId}")
    public String viewPoll(@PathVariable String pollId, Model model, Principal principal) {
        try {
            Poll poll = pollService.getPollById(pollId);
            model.addAttribute("poll", poll);
            model.addAttribute("choices", poll.getChoices());
            model.addAttribute("comments", commentService.getCommentsByPoll(pollId));
            model.addAttribute("currentUser", principal.getName());
            try {
                model.addAttribute("userVote", voteService.getVoteByUserAndPoll(principal.getName(), pollId));
            } catch (ResourceNotFoundException e) {
                model.addAttribute("userVote", null);
            }
            return "poll";
        } catch (ResourceNotFoundException e) {
            return "redirect:/";
        }
    }

    // 投票
    @PostMapping("/poll/{pollId}/vote")
    public String vote(@PathVariable String pollId, @RequestParam UUID choiceId, Principal principal) {
        try {
            voteService.vote(principal.getName(), pollId, choiceId);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/poll/" + pollId;
    }

    // 新建Poll表单页面
    @GetMapping("/admin/poll/new")
    public String newPollForm(Model model) {
        model.addAttribute("form", new Form());
        return "poll-form";
    }

    // 创建Poll
    @PostMapping("/admin/poll/new")
    public String createPoll(@ModelAttribute("form") @Valid Form form, BindingResult result) {
        if (result.hasErrors() || form.getChoiceTexts().size() != 5) {
            return "poll-form";
        }
        try {
            pollService.createPoll(form.getCoursecode(), form.getQuestion(), form.getChoiceTexts());
        } catch (ResourceNotFoundException e) {
            return "poll-form";
        }
        return "redirect:/";
    }

    // 删除Poll
    @PostMapping("/admin/poll/{pollId}/delete")
    public String deletePoll(@PathVariable String pollId) {
        try {
            pollService.deletePoll(pollId);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/";
    }

    // 添加评论
    @PostMapping("/poll/{pollId}/comment")
    public String addComment(@PathVariable String pollId, @RequestParam String content, Principal principal) {
        try {
            commentService.addCommentToPoll(principal.getName(), pollId, content);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/poll/" + pollId;
    }
}