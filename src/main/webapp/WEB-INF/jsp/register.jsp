<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 2rem;
        }
        .form-container {
            background-color: #1e293b;
            padding: 2rem 3rem;
            border-radius: 8px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 450px;
        }
        h2 {
            text-align: center;
            color: #f8fafc;
            margin-bottom: 2rem;
        }
        .form-group {
            margin-bottom: 1.25rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #94a3b8;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 0.75rem;
            border-radius: 6px;
            border: 1px solid #475569;
            background-color: #334155;
            color: #e2e8f0;
            font-size: 1rem;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }
        .radio-group input[type="radio"] {
            margin-right: 0.5rem;
        }
        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: 6px;
            background-color: #38bdf8;
            color: #0f172a;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        .submit-btn:hover {
            background-color: #7dd3fc;
        }
        .back-link {
            display: block;
            margin-top: 1.5rem;
            text-align: center;
            color: #38bdf8;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .error-summary {
            background-color: #7f1d1d;
            color: #fecaca;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1.5rem;
        }
        .error-summary ul {
            list-style-position: inside;
            padding-left: 0;
        }
    </style>
</head>
<body>

<h2>Sign-up</h2>

<form:form method="POST" modelAttribute="Users">
    <form:label path="username">Username</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username"/><br/><br/>

    <form:label path="fullname">Fullname</form:label><br/>
    <form:errors path="fullname" cssClass="error" />
    <form:input type="text" path="fullname"/><br/><br/>

    <form:label path="email">Email</form:label><br/>
    <form:errors path="email" cssClass="error" />
    <form:input type="text" path="email"/><br/><br/>

    <form:label path="phonenum">Phone Number</form:label><br/>
    <form:errors path="phonenum" cssClass="error" />
    <form:input type="text" path="phonenum"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:errors path="password" cssClass="error" />
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="confirm_password">Confirm Password</form:label><br/>
    <form:errors path="confirm_password" cssClass="error" />
    <form:input type="text" path="confirm_password" /><br/><br/>
    <form:label path="identity">Identity</form:label><br/>
    <form:errors path="identity" cssClass="error" />
    <form:radiobutton path="identity" value="student"/>Student
    <form:radiobutton path="identity" value="teacher"/>Teacher
    <br/><br/>
    <input type="submit" value="Add User"/>
</form:form>

</body>
</html>