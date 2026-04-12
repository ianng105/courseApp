package com.example.courseapp.dao;

import com.example.courseapp.models.Comment;
import com.example.courseapp.models.Lecture;
import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CommentRepository extends JpaRepository<Comment, UUID> {

    // 评论历史页面：查找某用户的所有评论
    List<Comment> findByUser(Users user);

    // 查找某用户名的所有评论
    List<Comment> findByUserUsername(String username);

    // 查找某个Lecture的所有评论
    List<Comment> findByLecture(Lecture lecture);

    // 查找某个Poll的所有评论
    List<Comment> findByPoll(Poll poll);
}
