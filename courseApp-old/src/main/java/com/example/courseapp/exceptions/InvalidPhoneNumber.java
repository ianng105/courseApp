package com.example.courseapp.exceptions;

public class InvalidPhoneNumber extends Exception {
    public InvalidPhoneNumber(){
        super("phone number must be number with 8 digit");
    }
    public InvalidPhoneNumber(String message) {
        super(message);
    }
}
