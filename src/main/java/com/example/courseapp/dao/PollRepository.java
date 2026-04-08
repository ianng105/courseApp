package com.example.courseapp.dao;

import com.example.courseapp.models.Poll;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollRepository extends JpaRepository<Poll,String> {}