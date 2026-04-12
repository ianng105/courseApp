package com.example.courseapp.dao;

import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Choice;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Poll;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PollService {

    @Resource
    private PollRepository pRepo;

    @Resource
    private CourseRepository cRepo;

    @Resource
    private ChoiceRepository chRepo;

    @Transactional
    public void createPoll(String coursecode, String question, List<String> choiceTexts)
            throws ResourceNotFoundException {
        Course course = cRepo.findById(coursecode).orElse(null);
        if (course == null) {
            throw new ResourceNotFoundException("Course " + coursecode + " does not exist");
        }

        Poll poll = new Poll(question, course);
        for (String text : choiceTexts) {
            Choice choice = new Choice(text, poll);
            poll.addChoice(choice);
        }
        pRepo.save(poll);
    }

    @Transactional
    public void deletePoll(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        pRepo.delete(poll);
    }

    @Transactional
    public List<Poll> getPollsByCourse(String coursecode) throws ResourceNotFoundException {
        Course course = cRepo.findById(coursecode).orElse(null);
        if (course == null) {
            throw new ResourceNotFoundException("Course " + coursecode + " does not exist");
        }
        return pRepo.findByCourse(course);
    }

    @Transactional
    public Poll getPollById(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        return poll;
    }

    @Transactional
    public void vote(UUID choiceId) throws ResourceNotFoundException {
        Choice choice = chRepo.findById(choiceId).orElse(null);
        if (choice == null) {
            throw new ResourceNotFoundException("Choice does not exist");
        }
        choice.vote();
        chRepo.save(choice);
    }

    @Transactional
    public List<Poll> getAllPolls() {
        return pRepo.findAll();
    }
}
