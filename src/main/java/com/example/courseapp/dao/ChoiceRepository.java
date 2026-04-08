package com.example.courseapp.dao;

import com.example.courseapp.models.Choice;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ChoiceRepository extends JpaRepository<Choice, UUID> {}