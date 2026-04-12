package com.example.courseapp.dao;

import com.example.courseapp.models.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LectureRepository extends JpaRepository<Lecture, String> {

    // 查找某个课程下的所有Lecture
    List<Lecture> findByCoursecode(String coursecode);

    // 按标题精确查找
    Optional<Lecture> findByTitle(String title);

    // 按标题模糊搜索
    List<Lecture> findByTitleContaining(String keyword);
}