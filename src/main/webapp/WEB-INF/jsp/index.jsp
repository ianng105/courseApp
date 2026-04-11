<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>COMP3820 Online Course</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background-color: #0f172a; color: #f1f5f9; padding: 2rem; max-width: 1000px; margin: 0 auto; line-height: 1.6; }
        .container { background: #1e293b; padding: 2rem; border-radius: 16px; box-shadow: 0 0 20px #0f172a; margin-bottom: 2rem; }
        h1, h2, h3 { color: #38bdf8; margin-bottom: 1rem; }
        a { color: #38bdf8; text-decoration: none; }
        a:hover { color: #7dd3fc; }
        .btn { display: inline-block; padding: 0.6rem 1.2rem; background: #0284c7; color: white; border: none; border-radius: 8px; cursor: pointer; margin: 0.5rem 0.5rem 0.5rem 0; }
        .btn:hover { background: #0369a1; }
        .btn-admin { background: #ef4444; }
        .btn-admin:hover { background: #dc2626; }
        .card { background: #334155; padding: 1rem; border-radius: 10px; margin: 1rem 0; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; flex-wrap: wrap; }
        .welcome { font-size: 1.1rem; margin-bottom: 1.5rem; color: #94a3b8; }
        .login-box { background: #273444; padding: 1.5rem; border-radius: 10px; margin-bottom: 2rem; }
        .login-box input { width: 100%; padding: 0.7rem; margin: 0.5rem 0 1rem; background: #334155; border: 1px solid #475569; border-radius: 8px; color: white; }
        .role-buttons { display: flex; gap: 1rem; margin-top: 1rem; }
        .role-btn { flex: 1; padding: 0.8rem; border-radius: 8px; border: none; color: white; cursor: pointer; }
        .role-guest { background: #64748b; }
        .role-student { background: #0ea5e9; }
        .role-teacher { background: #ef4444; }
    </style>
</head>
<body>
<div class="container">
    <h1>COMP3820 Online Course</h1>
    <p>This course covers Spring Boot, JSP, Spring MVC, Spring Security, H2 Database.</p>

    <!-- 未登录状态：显示登录表单和角色入口 -->
    <sec:authorize access="!isAuthenticated()">
        <div class="login-box">
            <h3>Login</h3>
            <form action="/login" method="post">
                Username:<br><input type="text" name="username"><br>
                Password:<br><input type="password" name="password"><br>
                <button type="submit" class="btn">Login</button>
            </form>
            <div class="role-buttons">
                <button class="role-btn role-guest" onclick="window.location.href='/'">Guest</button>
                <button class="role-btn role-student" onclick="window.location.href='/login'">Student</button>
                <button class="role-btn role-teacher" onclick="window.location.href='/login'">Teacher</button>
            </div>
            <br>
            <a href="/register">Don't have an account? Register</a>
        </div>
    </sec:authorize>

    <!-- 已登录状态：显示导航栏和欢迎信息 -->
    <sec:authorize access="isAuthenticated()">
        <div class="welcome">
            Welcome, <sec:authentication property="principal.username"/>
            (<sec:authentication property="principal.authorities"/>)
        </div>

        <div class="nav">
            <a href="/" class="btn">Home</a>
            <a href="/my/comments" class="btn">My Comments</a>
            <a href="/my/votes" class="btn">My Votes</a>
            <a href="/user/edit" class="btn">Edit Profile</a>
            <sec:authorize access="hasRole('TEACHER')">
                <a href="/addPoll" class="btn btn-admin">Add Poll</a>
                <a href="/addLecture" class="btn btn-admin">Add Lecture</a>
                <a href="/user/manage" class="btn btn-admin">Manage Users</a>
            </sec:authorize>
            <a href="/logout" class="btn">Logout</a>
        </div>

        <h2>Lectures</h2>
        <div class="card"><a href="/lecture/1">Lecture 1: Jakarta EE & JSP Basics</a></div>
        <div class="card"><a href="/lecture/2">Lecture 2: Spring MVC & Controller</a></div>

        <h2>Active Polls</h2>
        <div class="card"><a href="/poll/1">Which topic should we focus next?</a></div>
        <div class="card"><a href="/poll/2">How do you rate this course?</a></div>
    </sec:authorize>
</div>
</body>
</html>