package com.example.courseapp.validator;


import com.example.courseapp.dao.UserRepository;
import com.example.courseapp.models.User;
import com.example.courseapp.controller.UserController.Form;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Resource
    UserRepository uRepo;

    @Override
    public boolean supports(Class<?> type) {
        return Form.class.equals(type);
    }

    @Override
    public static void validate(Object o, Errors errors) {
        Form userF = (Form) o;
        ValidationUtils.rejectIfEmpty(errors, "confirm_password", "",
                "Please confirm your password.");
        if (!userF.getPassword().equals(userF.getConfirm_password())) {
            errors.rejectValue("confirm_password", "", "Password does not match.");
        }
        if (userF.getUsername().equals("")) {
            return;
        }
        User user = uRepo.findById(userF.getUsername()).orElse(null);
        if (user != null) {
            errors.rejectValue("username", "", "User already exists.");
        }
    }
}