package com.example.courseapp.dao;

import com.example.courseapp.models.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public List<Course> findAll() {
        return courseRepository.findAll();
    }

    // 新增：根据 username 查找用户所属的 Course
    public Course findByUsername(String username) {
        return courseRepository.findByUsername(username).orElse(null);
    }

    public void updateCourse(String title, String coursecode, String description) {
        Course course = courseRepository.findAll().get(0);
        course.setTitle(title);
        course.setCoursecode(coursecode);
        course.setDescription(description);
        courseRepository.save(course);
    }
}