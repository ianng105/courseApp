package com.example.courseapp.dao;

import com.example.courseapp.exceptions.InvalidEmail;
import com.example.courseapp.exceptions.InvalidPhoneNumber;
import com.example.courseapp.models.User;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {

    @Resource
    private UserRepository uRepo;

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
        User newUser = new User(username,fullname,password,email,phn,"student");
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
        User newUser = new User(username,fullname,password,email,phn,"teacher");
        uRepo.save(newUser);
    }

    //read user information
    @Transactional
    public List<User> getUsers(){
        return uRepo.findAll();
    }

    /*
    public void delete(String username) {
        User user = uRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        uRepo.delete(user);
    }

     */
}

