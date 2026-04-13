<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Course List</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 2rem;
        }
        .container {
            max-width: 800px;
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
            display: inline-block;
        }
        .nav-btn:hover {
            background-color: #475569;
            transform: translateY(-2px);
        }
        .admin-btn {
            background-color: #991b1b;
        }
        .admin-btn:hover {
            background-color: #b91c1c;
        }
        .list-container {
            list-style: none;
            padding: 0;
        }
        .list-item {
            display: block;
            background-color: #334155;
            padding: 1rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            color: #cbd5e1;
            transition: background-color 0.3s, border-color 0.3s;
            border: 1px solid transparent;
            margin-bottom: 1rem;
        }
        .list-item:hover {
            background-color: #475569;
            border-color: #38bdf8;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📚 All Courses</h1>
    <div class="controls">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Back to Home</a>
        <sec:authorize access="hasRole('TEACHER')">
            <a href="<c:url value='/courses/add'/>" class="nav-btn admin-btn">➕ Add New Course</a>
        </sec:authorize>
    </div>
    <div class="list-container">
        <c:forEach var="course" items="${courses}">
            <a href="<c:url value='/courses/${course.id}'/>" class="list-item">
                    ${course.name}
            </a>
        </c:forEach>
        <c:if test="${empty courses}">
            <p style="text-align: center; color: #94a3b8;">No courses are currently available.</p>
        </c:if>
    </div>
</div>
</body>
</html>