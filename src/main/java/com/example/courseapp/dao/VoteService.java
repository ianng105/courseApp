package com.example.courseapp.dao;

import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Choice;
import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Users;
import com.example.courseapp.models.Vote;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class VoteService {

    @Resource
    private VoteRepository vRepo;

    @Resource
    private PollRepository pRepo;

    @Resource
    private UserRepository uRepo;

    @Resource
    private ChoiceRepository chRepo;

    // 投票（每人每个Poll只能投一次）
    @Transactional
    public void vote(String username, String pollId, UUID choiceId)
            throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        Choice choice = chRepo.findById(choiceId).orElse(null);
        if (choice == null) {
            throw new ResourceNotFoundException("Choice does not exist");
        }

        // 检查是否已经投过票
        Vote existingVote = vRepo.findByUserAndPoll(user, poll).orElse(null);
        if (existingVote != null) {
            // 已投过 → 修改选项
            existingVote.getChoice().setVoted(existingVote.getChoice().getVoted() - 1);
            chRepo.save(existingVote.getChoice());

            existingVote.setChoice(choice);
            choice.vote();
            chRepo.save(choice);
            vRepo.save(existingVote);
        } else {
            // 没投过 → 新建投票
            Vote newVote = new Vote(user, poll, choice);
            choice.vote();
            chRepo.save(choice);
            vRepo.save(newVote);
        }
    }

    // 查找用户在某个Poll的投票
    @Transactional
    public Vote getVoteByUserAndPoll(String username, String pollId)
            throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        Vote vote = vRepo.findByUserAndPoll(user, poll).orElse(null);
        if (vote == null) {
            throw new ResourceNotFoundException("User has not voted on this poll");
        }
        return vote;
    }

    // 查找某用户的所有投票（投票历史）
    @Transactional
    public List<Vote> getVotesByUser(String username) throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        return vRepo.findByUser(user);
    }

    // 查找某个Poll的所有投票
    @Transactional
    public List<Vote> getVotesByPoll(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        return vRepo.findByPoll(poll);
    }

    // 删除投票（取消投票）
    @Transactional
    public void cancelVote(String username, String pollId)
            throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        Vote vote = vRepo.findByUserAndPoll(user, poll).orElse(null);
        if (vote == null) {
            throw new ResourceNotFoundException("User has not voted on this poll");
        }
        // 票数 -1
        vote.getChoice().setVoted(vote.getChoice().getVoted() - 1);
        chRepo.save(vote.getChoice());
        vRepo.delete(vote);
    }
}