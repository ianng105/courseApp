package com.example.courseapp.dao;

import com.example.courseapp.exceptions.InvalidCourseCode;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Lecture;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CourseService {
    @Resource
    private CourseRepository cRepo ;

    @Resource
    private LectureRepository lRepo;

    @Transactional
    public void createNewCourse(String title, String coursecode1,int coursecode2,String coursecode3, String description)
        throws InvalidCourseCode {
            if(coursecode1.length()<2){
                throw new InvalidCourseCode("Course title should have two characters");
            }

            if(coursecode2<1000){
                throw new InvalidCourseCode("Course number should larger than 1000");
            }
            if(coursecode3.equals("F")||coursecode3.equals("SEF")){
                String cc=coursecode1+coursecode2+coursecode3;
                Course c =new Course(title, cc, description);
                cRepo.save(c);
            }
            throw new InvalidCourseCode("course code must end with F or SEF");
    }

    @Transactional
    public void deleteCourse(String cc) throws ResourceNotFoundException {
        Course c= cRepo.findById(cc).orElse(null);
        if(c==null){
            throw new ResourceNotFoundException("course "+cc+" does not exist");
        }
        cRepo.delete(c);
    }

    @Transactional
    public void addLecture(String cc, String t, String s)throws ResourceNotFoundException{
        Lecture l = new Lecture(cc,t,s);
        Course c= cRepo.findById(cc).orElse(null);
        if(c==null){
            throw new ResourceNotFoundException("this lecture does not exist");
        }
        c.addLecture(l);
        cRepo.save(c);
    }

    @Transactional
    public void removeLecture(String cc,String L_id)throws ResourceNotFoundException{
        Lecture l = lRepo.findById(L_id).orElse(null);
        Course c= cRepo.findById(cc).orElse(null);
        if(c==null){
                throw new ResourceNotFoundException("this course does not exist");
        }
        if(l==null){
            throw new ResourceNotFoundException("this lecture does not exist");
        }
        c.removeLecture(l);
        cRepo.save(c);
    }
    @Transactional
    public List<Course> getAllCourses() {
        return cRepo.findAll();
    }

}
