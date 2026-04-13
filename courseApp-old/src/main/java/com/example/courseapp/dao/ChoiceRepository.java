package com.example.courseapp.dao;

import com.example.courseapp.models.Choice;
import com.example.courseapp.models.Poll;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChoiceRepository extends JpaRepository<Choice, UUID> {

    /*查找某个Poll下的所有选项
    List<Choice> findByPoll(Poll poll);

    // 通过poll_id查找所有选项
    List<Choice> findByPollPollId(String pollId);
    */
}
