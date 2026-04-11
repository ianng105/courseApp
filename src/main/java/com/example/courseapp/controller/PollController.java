package com.example.courseapp.controller;
import com.example.courseapp.dao.PollService;
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

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PollController {


    @Autowired
    private PollService pollService;

    public static class Form {
        @NotEmpty
        @Size(min = 3, max = 30)
        private String question;

        private List<Choice> choices = new ArrayList<>();

        public String getQuestion() { return question; }
        public void setQuestion(String question) { this.question = question; }

        public List<Choice> getChoices() { return choices; }
        public void setChoices(List<Choice> choices) { this.choices = choices; }
    }

    @GetMapping("/poll/{id}")
    public String viewPoll(@PathVariable Long id, Model model, Principal principal) {
        Poll poll = pollService.findById(id);
        model.addAttribute("poll", poll);
        model.addAttribute("choices", poll.getChoices());
        model.addAttribute("comments", pollService.getComments(id));
        model.addAttribute("currentUser", principal.getName());
        model.addAttribute("userVote", pollService.getUserVote(id, principal.getName()));
        return "poll";
    }

    @PostMapping("/poll/{id}/vote")
    public String vote(@PathVariable Long id, @RequestParam Long choiceId, Principal principal) {
        pollService.vote(id, principal.getName(), choiceId);
        return "redirect:/poll/" + id;
    }

    @GetMapping("/admin/poll/new")
    public String newPollForm(Model model) {
        model.addAttribute("form", new Form());
        return "poll-form";
    }

    @PostMapping("/admin/poll/new")
    public String createPoll(@ModelAttribute("form") @Valid Form form, BindingResult result) {
        if (result.hasErrors() || form.getChoices().size() != 5) {
            return "poll-form";
        }
        Poll saved = pollService.createPoll(form.getQuestion(), form.getChoices());
        return "redirect:/poll/" + saved.getId();
    }

    @PostMapping("/admin/poll/{id}/delete")
    public String deletePoll(@PathVariable Long id) {
        pollService.deletePoll(id);
        return "redirect:/";
    }

    @PostMapping("/poll/{id}/comment")
    public String addComment(@PathVariable Long id, @RequestParam String content, Principal principal) {
        pollService.addComment(id, principal.getName(), content);
        return "redirect:/poll/" + id;
    }
}

