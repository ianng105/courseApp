package com.example.courseapp.controller;

import com.example.courseapp.dao.CommentService;
import com.example.courseapp.dao.PollService;
import com.example.courseapp.dao.VoteService;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Choice;
import com.example.courseapp.models.Poll;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

    public static class VoteForm {
        private String ch;


        public String getCh() {
            return ch;
        }

        public void setCh(String c) {
            ch=c;
        }

    }

    // 查看单个Poll
    @GetMapping("/pollpage/{pollId}")
    public ModelAndView viewPoll(@PathVariable String pollId, @Valid VoteForm form,Principal principal) {
        try {
            Poll poll = pollService.getPollById(pollId);
            ModelAndView mav = new ModelAndView("poll");
            mav.addObject("Poll", poll);
            mav.addObject("choices", poll.getChoices());
            mav.addObject("comments", commentService.getCommentsByPoll(pollId));
            mav.addObject("currentUser", principal.getName());
            mav.addObject("Vote",form);
            try {
                mav.addObject("userVote", voteService.getVoteByUserAndPoll(principal.getName(), pollId));
            }
                catch(ResourceNotFoundException e) {
                mav.addObject("userVote", null);
            }
            return mav;
        } catch (ResourceNotFoundException e) {
            return new ModelAndView ("/");
        }
    }

    // 投票
    @PostMapping("/pollpage/{pollId}")
    public String vote(@PathVariable String pollId, Principal principal,@Valid VoteForm form) {
        try {
            Poll poll = pollService.getPollById(pollId);
            List<Choice> choiceList = poll.getChoices();
            Choice choice;
            UUID choiceId=null ;
            if (form.getCh().equals("ch0")) {
                choice = choiceList.get(0);
                choiceId = choice.getId();
            } else if (form.getCh().equals("ch1")) {
                choice = choiceList.get(1);
                choiceId = choice.getId();
            } else if (form.getCh().equals("ch2")) {
                choice = choiceList.get(2);
                choiceId = choice.getId();
            } else if (form.getCh().equals("ch3")) {
                choice = choiceList.get(3);
                choiceId = choice.getId();
            } else {
                choice = choiceList.get(4);
                choiceId = choice.getId();
            }

            voteService.vote(principal.getName(), pollId, choiceId);
        } catch (ResourceNotFoundException e) {
            // 处理异常
        }
        return "redirect:/pollpage/"+ pollId;
    }

    // 新建Poll表单页面
    @GetMapping(/*/admin*/"/poll/new")
    public ModelAndView newPollForm() {
        return new ModelAndView("poll-form", "Poll", new PollController.Form());
    }

    // 创建Poll
    @PostMapping(/*admin*/"/poll/new")
    public String createPoll(@ModelAttribute("Poll") @Valid Form form, BindingResult result) {
        if (result.hasErrors() || form.getChoiceTexts().size() != 5) {
            return "poll-form";
        }
        try {
            Poll p=pollService.createPoll(form.getCoursecode(), form.getQuestion(), form.getChoiceTexts());
            for(String i:form.getChoiceTexts()){
                pollService.createChoice(i,p);
            }
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