package com.example.courseapp.dao;

import com.example.courseapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String>{}