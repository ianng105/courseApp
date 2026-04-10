package com.example.courseapp.dao;

import com.example.courseapp.models.Attachment;
import com.example.courseapp.models.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AttachmentRepository extends JpaRepository<Attachment, String> {

    // 根据 Lecture 对象查找所有附件（课程材料页面显示下载链接）
    List<Attachment> findByLecture(Lecture lecture);

    // 根据 lecture_id 查找所有附件
    @Query("SELECT a FROM Attachment a WHERE a.L_id = :lectureId")
    List<Attachment> findByLectureId(@Param("lectureId") String lectureId);

    // 删除某个 Lecture 下的所有附件（教师删除课程材料页面时用）
    void deleteByLecture(Lecture lecture);
}