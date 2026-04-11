package com.example.courseapp.dao;

import com.example.courseapp.exceptions.InvalidEmail;
import com.example.courseapp.exceptions.InvalidPhoneNumber;
import com.example.courseapp.exceptions.ResourceNotFoundException;
import com.example.courseapp.models.Course;
import com.example.courseapp.models.Users;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class UserService implements UserDetailsService {

    @Autowired
    private PasswordEncoder pe;

    @Resource
    private UserRepository uRepo;

    @Resource
    private CourseRepository cRepo;


    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(user.getRole()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
    }

    //create user(student)
    @Transactional
    public void createStudent(String username, String fullname, String password, String email, String phonenum)
        throws InvalidEmail, InvalidPhoneNumber{
        if(phonenum.length()<8){
            throw new InvalidPhoneNumber();
        }
        int phn = Integer.parseInt(phonenum);
        if (!email.contains("@")){
            throw new InvalidEmail(email);
        }
        Users newUser = new Users(username,fullname,password,email,phn,"student");
        uRepo.save(newUser);
    }

    //(teacher)
    @Transactional
    public void createTeacher(String username, String fullname, String password, String email, String phonenum)
            throws InvalidEmail, InvalidPhoneNumber{
        if(phonenum.length()<8){
            throw new InvalidPhoneNumber();
        }
        int phn = Integer.parseInt(phonenum);
        if (!email.contains("@")){
            throw new InvalidEmail(email);
        }
        Users newUser = new Users(username,fullname,pe.encode(password),email,phn,"teacher");
        uRepo.save(newUser);
    }

    //read user information
    @Transactional
    public List<Users> getUsers(){
        return uRepo.findAll();
    }


    @Transactional
    public void delete(String username) {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        uRepo.delete(user);
    }

    //add course to user
    @Transactional
    public void addCourse(String username,String coursecode) throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        Course course = cRepo.findById(coursecode).orElse(null);
        if(course==null){
            throw new ResourceNotFoundException("Course code does not exist ");
        }
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        user.addCourses(course);
        uRepo.save(user);
    }

    @Transactional
    public void removeCourse(String username,String coursecode) throws ResourceNotFoundException {
        Users user = uRepo.findById(username).orElse(null);
        Course course = cRepo.findById(coursecode).orElse(null);
        if(course==null){
            throw new ResourceNotFoundException("Course code does not exist ");
        }
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        user.removeCourses(course);
        uRepo.save(user);
    }

    @Transactional
    public Users getUserByUsername(String username) {
        Users user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        return user;
    }
}

