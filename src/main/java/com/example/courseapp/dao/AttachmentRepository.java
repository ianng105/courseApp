package com.example.courseapp.dao;

import com.example.courseapp.models.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachmentRepository extends JpaRepository<Attachment,String> {}