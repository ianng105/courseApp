<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Poll List</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            width: 100%;
            max-width: 900px;
            background-color: #1e293b;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        h2 {
            color: #f8fafc;
            text-align: center;
            border-bottom: 1px solid #334155;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        .nav {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #334155;
        }
        .nav-btn {
            background-color: #334155;
            color: #e2e8f0;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .nav-btn:hover {
            background-color: #475569;
        }
        .poll-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .poll-item {
            background-color: #283548;
            padding: 1rem 1.5rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background-color 0.3s;
        }
        .poll-item:hover {
            background-color: #334155;
        }
        .poll-question {
            font-weight: 500;
            font-size: 1.1rem;
        }
        .view-btn {
            background-color: #38bdf8;
            color: #0f172a;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .view-btn:hover {
            background-color: #7dd3fc;
        }
        .add-poll-btn {
            display: inline-block;
            margin-top: 1.5rem;
            background-color: #38bdf8;
            color: #0f172a;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .add-poll-btn:hover {
            background-color: #7dd3fc;
        }
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #94a3b8;
        }
    </style>
</head>
<body>

<div class="container">
    <sec:authorize access="isAuthenticated()">
        <div class="nav">
            <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
            <a href="<c:url value='/courses'/>" class="nav-btn">📚 Course List</a>
            <a href="<c:url value='/my/comments'/>" class="nav-btn">💬 My Comments</a>
            <a href="<c:url value='/my/votes'/>" class="nav-btn">🗳️ My Votes</a>
            <a href="<c:url value='/user/edit'/>" class="nav-btn">👤 Edit Profile</a>
        </div>
    </sec:authorize>

    <h2>🗳️ All Polls</h2>

    <c:choose>
        <c:when test="${empty polls}">
            <div class="empty-state">
                <p>No polls available at the moment.</p>
            </div>
        </c:when>
        <c:otherwise>
            <ul class="poll-list">
                <c:forEach items="${polls}" var="poll">
                    <li class="poll-item">
                        <span class="poll-question">${poll.question}</span>
                        <a href="<c:url value='/poll/${poll.poll_id}'/>" class="view-btn">View Details</a>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>

    <sec:authorize access="hasRole('TEACHER')">
        <div style="text-align: center;">
            <a href="<c:url value='/addPoll'/>" class="add-poll-btn">Create New Poll</a>
        </div>
    </sec:authorize>
</div>

</body>
</html>