package com.example.courseapp.dao;

import com.example.courseapp.models.Choice;
import com.example.courseapp.models.Comment;
import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PollService {

    @Autowired
    private PollRepository pollRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private VoteRepository voteRepository;

    public List<Poll> findAll() {
        return pollRepository.findAll();
    }

    // 新增：按 Course 显示 poll
    public List<Poll> findByCourseId(Long courseId) {
        return pollRepository.findByCourseId(courseId);
    }

    public Poll findById(Long id) {
        return pollRepository.findById(id).orElseThrow(() -> new RuntimeException("Poll not found"));
    }

    public Poll createPoll(String question, List<Choice> choices) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        poll.setChoices(choices);
        return pollRepository.save(poll);
    }

    public void deleteById(Long id) {
        pollRepository.deleteById(id);
    }

    public void vote(Long pollId, String username, Long choiceId) {
        Vote existing = voteRepository.findByPollIdAndUsername(pollId, username);
        if (existing != null) {
            existing.setChoiceId(choiceId);
            voteRepository.save(existing);
        } else {
            Vote vote = new Vote();
            vote.setPoll(findById(pollId));
            vote.setUsername(username);
            vote.setChoiceId(choiceId);
            voteRepository.save(vote);
        }
    }

    public Long getUserVote(Long pollId, String username) {
        Vote vote = voteRepository.findByPollIdAndUsername(pollId, username);
        return vote != null ? vote.getChoiceId() : null;
    }

    public List<Comment> getComments(Long pollId) {
        return commentRepository.findByPollId(pollId);
    }

    public void addComment(Long pollId, String username, String content) {
        Comment comment = new Comment();
        comment.setPoll(findById(pollId));
        comment.setUsername(username);
        comment.setContent(content);
        commentRepository.save(comment);
    }
}