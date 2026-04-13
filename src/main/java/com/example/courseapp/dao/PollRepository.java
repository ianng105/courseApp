package com.example.courseapp.dao;

import com.example.courseapp.models.Poll;
import com.example.courseapp.models.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PollRepository extends JpaRepository<Poll, String> {

    // 查找某门课下的所有Poll
    List<Poll> findByCourse(Course course);

    // 通过course_id查找所有Poll
    List<Poll> findByCourseCoursecode(String coursecode);

    // 按问题模糊搜索
    List<Poll> findByQuestionContaining(String keyword);
}