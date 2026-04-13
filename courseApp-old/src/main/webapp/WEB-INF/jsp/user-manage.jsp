<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 2rem;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #1e293b;
            padding: 2rem;
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #f8fafc;
            border-bottom: 1px solid #334155;
            padding-bottom: 1rem;
            margin-bottom: 2rem;
        }
        .controls {
            text-align: center;
            margin-bottom: 2rem;
        }
        .nav-btn {
            background-color: #334155;
            color: #e2e8f0;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
        }
        .nav-btn:hover {
            background-color: #475569;
            transform: translateY(-2px);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
        }
        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid #334155;
        }
        th {
            color: #94a3b8;
            font-weight: 600;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover {
            background-color: #334155;
        }
        .role-tag {
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
        }
        .role-student {
            background-color: #1d4ed8;
            color: #dbeafe;
        }
        .role-teacher {
            background-color: #991b1b;
            color: #fecaca;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>👥 User Management</h1>
    <div class="controls">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Back to Home</a>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <c:forEach var="role" items="${user.roles}">
                        <c:choose>
                            <c:when test="${role.name == 'ROLE_STUDENT'}">
                                <span class="role-tag role-student">Student</span>
                            </c:when>
                            <c:when test="${role.name == 'ROLE_TEACHER'}">
                                <span class="role-tag role-teacher">Teacher</span>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>