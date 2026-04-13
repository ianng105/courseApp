<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background-color: #1e293b;
            padding: 2rem 3rem;
            border-radius: 8px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            text-align: center;
            color: #f8fafc;
            margin-bottom: 2rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #94a3b8;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border-radius: 6px;
            border: 1px solid #475569;
            background-color: #334155;
            color: #e2e8f0;
            font-size: 1rem;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: #475569;
            cursor: not-allowed;
        }
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        button, .nav-btn {
            flex-grow: 1;
            padding: 0.75rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        button {
            border: none;
            background-color: #38bdf8;
            color: #0f172a;
        }
        button:hover {
            background-color: #7dd3fc;
        }
        .nav-btn {
            background-color: #475569;
            color: #e2e8f0;
            border: 1px solid #475569;
        }
        .nav-btn:hover {
            background-color: #5f7089;
        }
        .message {
            background-color: #166534;
            color: #dcfce7;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1.5rem;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="card">
    <h1>Edit Profile</h1>
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <form action="<c:url value='/user/edit'/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${user.username}" readonly>
        </div>
        <div class="form-group">
            <label for="password">New Password (leave blank to keep current)</label>
            <input type="password" id="password" name="password">
        </div>
        <div class="button-group">
            <a href="<c:url value='/'/>" class="nav-btn">Back to Home</a>
            <button type="submit">Save Changes</button>
        </div>
    </form>
</div>
</body>
</html>