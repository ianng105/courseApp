<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>All Lectures</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
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
        .add-btn {
            background-color: #38bdf8;
            color: #0f172a;
        }
        .add-btn:hover {
            background-color: #7dd3fc;
        }
        .lecture-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        .lecture-card {
            background-color: #334155;
            border-radius: 8px;
            padding: 1.5rem;
            text-decoration: none;
            color: #e2e8f0;
            transition: transform 0.2s, box-shadow 0.2s;
            display: block;
        }
        .lecture-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        .lecture-card h3 {
            margin-top: 0;
            color: #f8fafc;
        }
        .lecture-card p {
            font-size: 0.9rem;
            color: #94a3b8;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>🎙️ All Lectures</h1>
    <div class="controls">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Back to Home</a>
        <a href="<c:url value='/addLecture'/>" class="nav-btn add-btn">＋ Add Lecture</a>
    </div>
    <div class="lecture-grid">
        <c:forEach var="lecture" items="${lectures}">
            <a href="<c:url value='/lecture/${lecture.id}'/>" class="lecture-card">
                <h3>${lecture.title}</h3>
                <p>${lecture.description}</p>
            </a>
        </c:forEach>
    </div>
</div>
</body>
</html>