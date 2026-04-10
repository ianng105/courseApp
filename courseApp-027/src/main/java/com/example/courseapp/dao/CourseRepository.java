package com.example.courseapp.dao;

import com.example.courseapp.models.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CourseRepository extends JpaRepository<Course, String> {

    // 通过课程代码查找
    Optional<Course> findByCoursecode(String coursecode);

    // 通过标题模糊搜索
    List<Course> findByTitleContaining(String keyword);

    // 通过标题精确查找
    Optional<Course> findByTitle(String title);
}