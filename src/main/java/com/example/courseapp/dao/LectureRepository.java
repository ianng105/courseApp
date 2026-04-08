package com.example.courseapp.dao;

import com.example.courseapp.models.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LectureRepository extends JpaRepository<Lecture,String>{}