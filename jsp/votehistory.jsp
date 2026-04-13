<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>My Votes</title>
    <jsp:include page="base.jspf"/>
</head>
<body>
<div class="container">
    <h1>My Vote History</h1>

    <div class="nav">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
        <a href="<c:url value='/courses'/>" class="nav-btn">📚 Course List</a>
        <a href="<c:url value='/my/comments'/>" class="nav-btn">💬 My Comments</a>
        <a href="<c:url value='/user/edit'/>" class="nav-btn">👤 Edit Profile</a>
    </div>

    <c:if test="${empty votes}">
        <p>You haven't voted on any polls yet.</p>
    </c:if>

    <c:if test="${not empty votes}">
        <table class="table">
            <thead>
            <tr>
                <th>Poll Question</th>
                <th>Your Choice</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vote" items="${votes}">
                <tr>
                    <td>
                        <a href="<c:url value='/poll/${vote.poll.poll_id}'/>">
                            <c:out value="${vote.poll.question}"/>
                        </a>
                    </td>
                    <td><c:out value="${vote.choice.choice}"/></td>
                    <td>${vote.timestamp}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>My Vote History</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
        }
        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid #334155;
        }
        thead th {
            color: #94a3b8;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
        }
        tbody tr:hover {
            background-color: #283548;
        }
        a {
            color: #38bdf8;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
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

    <h2>My Vote History</h2>

    <c:choose>
        <c:when test="${not empty votes}">
            <table>
                <thead>
                <tr>
                    <th>Poll Question</th>
                    <th>My Choice</th>
                    <th>Voted At</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${votes}" var="vote">
                    <tr>
                        <td><a href="<c:url value='/poll/${vote.poll.id}'/>">${vote.poll.question}</a></td>
                        <td>${vote.choice.text}</td>
                        <td><fmt:formatDate value="${vote.votedAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                <p>You haven't voted in any polls yet.</p>
                <a href="<c:url value='/polls'/>" class="nav-btn" style="margin-top: 1rem; display: inline-block;">View All Polls</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>