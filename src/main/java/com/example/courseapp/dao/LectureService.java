package com.example.courseapp.dao;

import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Attachment;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Lecture;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class LectureService {
    @Resource
    private CourseRepository cRepo;

    @Resource
    private LectureRepository lRepo;

    // 查找单个Lecture
    @Transactional
    public Lecture getLectureById(String L_id) throws ResourceNotFoundException {
        Lecture l = lRepo.findById(L_id).orElse(null);
        if (l == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        return l;
    }

    // 查找某门课的所有Lecture
    @Transactional
    public List<Lecture> getLecturesByCourse(String coursecode) {
        return lRepo.findByCoursecode(coursecode);
    }

    // 查找所有Lecture
    @Transactional
    public List<Lecture> getAllLectures() {
        return lRepo.findAll();
    }

    // 更新Lecture标题
    @Transactional
    public void updateTitle(String L_id, String newTitle) throws ResourceNotFoundException {
        Lecture l = lRepo.findById(L_id).orElse(null);
        if (l == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        l.setTitle(newTitle);
        lRepo.save(l);
    }

    // 更新Lecture摘要
    @Transactional
    public void updateSummary(String L_id, String newSummary) throws ResourceNotFoundException {
        Lecture l = lRepo.findById(L_id).orElse(null);
        if (l == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        l.setSummary(newSummary);
        lRepo.save(l);
    }

    // 删除Lecture
    @Transactional
    public void deleteLecture(String L_id) throws ResourceNotFoundException {
        Lecture l = lRepo.findById(L_id).orElse(null);
        if (l == null) {
            throw new ResourceNotFoundException("Lecture " + L_id + " does not exist");
        }
        lRepo.delete(l);
    }
    // 创建Lecture
    @Transactional
    public Lecture createLecture(String coursecode, String title, String summary)
            throws ResourceNotFoundException {
        Course course = cRepo.findById(coursecode).orElse(null);
        if (course == null) {
            throw new ResourceNotFoundException("Course " + coursecode + " does not exist");
        }
        Lecture lecture = new Lecture(coursecode, title, summary);
        lRepo.save(lecture);
        return lecture;
    }

    @Transactional
    public void addAttachment(String L_id,List<MultipartFile> attachments)
        throws IOException{
        Lecture l = lRepo.findById(L_id).orElse(null);
        for(MultipartFile file: attachments){
            Attachment attachment = new Attachment();
            attachment.setName(file.getOriginalFilename());
            attachment.setMimeContentType(file.getContentType());
            attachment.setContents(file.getBytes());
            attachment.setLecture(l);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                l.addAttachment(attachment);
            }
        }

    }

}
