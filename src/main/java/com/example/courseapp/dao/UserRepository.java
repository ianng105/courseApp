package com.example.courseapp.dao;

import com.example.courseapp.models.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, String>{}