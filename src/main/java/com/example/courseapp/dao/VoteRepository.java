package com.example.courseapp.dao;

import com.example.courseapp.models.Vote;
import com.example.courseapp.models.Users;
import com.example.courseapp.models.Poll;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface VoteRepository extends JpaRepository<Vote, UUID> {

    // 查找用户在某个Poll的投票（判断是否已投 / 修改投票）
    Optional<Vote> findByUserAndPoll(Users user, Poll poll);

    // 投票历史页面：查找某用户的所有投票
    List<Vote> findByUser(Users user);

    // 查找某用户名的所有投票
    List<Vote> findByUserUsername(String username);

    // 查找某个Poll的所有投票
    List<Vote> findByPoll(Poll poll);
}
