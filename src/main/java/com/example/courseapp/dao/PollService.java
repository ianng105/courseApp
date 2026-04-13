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

    // 创建Poll并添加选项
    @Transactional
    public Poll createPoll(String coursecode, String question, List<String> choiceTexts)
            throws ResourceNotFoundException {
        Course course = cRepo.findById(coursecode).orElse(null);
        if (course == null) {
            throw new ResourceNotFoundException("Course " + coursecode + " does not exist");
        }

        Poll poll = new Poll(question, course);
        // 为每个选项文本创建Choice并关联到Poll
        for (String text : choiceTexts) {
            Choice choice = new Choice(text, poll);
            poll.addChoice(choice);
        }
        pRepo.save(poll);
        return poll;
    }

    // 删除Poll
    @Transactional
    public void deletePoll(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        pRepo.delete(poll);
    }

    // 查找某门课的所有Poll
    @Transactional
    public List<Poll> getPollsByCourse(String coursecode) throws ResourceNotFoundException {
        Course course = cRepo.findById(coursecode).orElse(null);
        if (course == null) {
            throw new ResourceNotFoundException("Course " + coursecode + " does not exist");
        }
        return pRepo.findByCourse(course);
    }

    // 查找单个Poll
    @Transactional
    public Poll getPollById(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        return poll;
    }

    // 投票：给某个Choice的票数+1
    @Transactional
    public void vote(UUID choiceId) throws ResourceNotFoundException {
        Choice choice = chRepo.findById(choiceId).orElse(null);
        if (choice == null) {
            throw new ResourceNotFoundException("Choice does not exist");
        }
        choice.vote();
        chRepo.save(choice);
    }

    // 查找所有Poll
    @Transactional
    public List<Poll> getAllPolls() {
        return pRepo.findAll();
    }

    @Transactional
    public void createChoice(String choice,Poll p){
        Choice ch = new Choice(choice,p);
        chRepo.save(ch);

    }
}