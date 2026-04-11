package com.example.courseapp.dao;

import com.example.courseapp.models.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course,String>{}