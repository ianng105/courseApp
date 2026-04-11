package com.example.courseapp.dao;

import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Comment;
import com.example.courseapp.models.Lecture;
import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Users;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class CommentService {

    @Resource
    private CommentRepository cmRepo;

    @Resource
    private LectureRepository lRepo;

    @Resource
    private PollRepository pRepo;

    @Resource
    private UserRepository uRepo;

    // 给Lecture添加评论
    @Transactional
    public void addCommentToLecture(String username, String L_id, String content)
            throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        Lecture lecture = lRepo.findById(L_id).orElse(null);
        if (lecture == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        Comment comment = new Comment(content, user, lecture);
        cmRepo.save(comment);
    }

    // 给Poll添加评论
    @Transactional
    public void addCommentToPoll(String username, String pollId, String content)
            throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        Comment comment = new Comment(content, user, poll);
        cmRepo.save(comment);
    }

    // 查找某个Lecture下的所有评论
    @Transactional
    public List<Comment> getCommentsByLecture(String L_id) throws ResourceNotFoundException {
        Lecture lecture = lRepo.findById(L_id).orElse(null);
        if (lecture == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        return cmRepo.findByLecture(lecture);
    }

    // 查找某个Poll下的所有评论
    @Transactional
    public List<Comment> getCommentsByPoll(String pollId) throws ResourceNotFoundException {
        Poll poll = pRepo.findById(pollId).orElse(null);
        if (poll == null) {
            throw new ResourceNotFoundException("Poll " + pollId + " does not exist");
        }
        return cmRepo.findByPoll(poll);
    }

    // 查找某个用户的所有评论
    @Transactional
    public List<Comment> getCommentsByUser(String username) throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new ResourceNotFoundException("User " + username + " does not exist");
        }
        return cmRepo.findByUserUsername(username);
    }

    // 删除评论
    @Transactional
    public void deleteComment(UUID commentId) throws ResourceNotFoundException {
        Comment comment = cmRepo.findById(commentId).orElse(null);
        if (comment == null) {
            throw new ResourceNotFoundException("Comment does not exist");
        }
        cmRepo.delete(comment);
    }

    // 修改评论内容
    @Transactional
    public void updateComment(UUID commentId, String newContent) throws ResourceNotFoundException {
        Comment comment = cmRepo.findById(commentId).orElse(null);
        if (comment == null) {
            throw new ResourceNotFoundException("Comment does not exist");
        }
        comment.setContent(newContent);
        cmRepo.save(comment);
    }
}