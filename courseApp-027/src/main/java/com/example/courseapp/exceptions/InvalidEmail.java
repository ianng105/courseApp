package com.example.courseapp.exceptions;

public class InvalidEmail extends Exception{
    public InvalidEmail (String email){
        super(email+" is not a correct email format, @ is missed");
    }

}