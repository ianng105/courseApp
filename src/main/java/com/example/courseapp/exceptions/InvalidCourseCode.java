package com.example.courseapp.exceptions;

public class InvalidCourseCode extends RuntimeException {
    public InvalidCourseCode(String message) {
        super(message);
    }
}
