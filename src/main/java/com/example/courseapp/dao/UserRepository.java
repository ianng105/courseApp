package com.example.courseapp.dao;

import com.example.courseapp.models.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<Users, String> {

    // 按用户名查找
    Optional<Users> findByUsername(String username);

    // 按角色查找所有用户（如查所有student或teacher）
    List<Users> findByRole(String role);

    // 判断用户名是否已存在（注册时用）
    boolean existsByUsername(String username);
}