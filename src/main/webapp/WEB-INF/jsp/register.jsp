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
<div class="form-container">
    <form action="<c:url value='/register'/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <h2>Register</h2>

        <c:if test="${bindingResult.hasErrors()}">
            <div class="error-summary">
                <p>Please correct the errors below:</p>
                <ul>
                    <c:forEach var="error" items="${bindingResult.allErrors}">
                        <li>${error.defaultMessage}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${userForm.username}" required>
        </div>
        <div class="form-group">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="${userForm.fullname}" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${userForm.email}" required>
        </div>
        <div class="form-group">
            <label for="phonenum">Phone Number:</label>
            <input type="tel" id="phonenum" name="phonenum" value="${userForm.phonenum}" required>
        </div>
        <div class="form-group">
            <label>Identity:</label>
            <div class="radio-group">
                <input type="radio" id="student" name="identity" value="student" checked>
                <label for="student">Student</label>
                <input type="radio" id="teacher" name="identity" value="teacher">
                <label for="teacher">Teacher</label>
                <input type="radio" id="admin" name="identity" value="admin">
                <label for="admin">Admin</label>
            </div>
        </div>
        <button type="submit" class="submit-btn">Register</button>
    </form>
    <a href="<c:url value='/'/>" class="back-link">Already have an account? Login</a>
</div>
</body>
</html>