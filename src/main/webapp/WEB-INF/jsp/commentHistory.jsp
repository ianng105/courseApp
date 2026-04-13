<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>My Comment History</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#0f172a; color:#f1f5f9; padding:2rem; max-width:800px; margin:0 auto; }
        .container { background:#1e293b; padding:2rem; border-radius:16px; }
        h1 { color:#38bdf8; text-align: center; margin-bottom: 1.5rem; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
        .nav-btn { padding:0.6rem 1.2rem; background:#334155; color:white; border:none; border-radius:8px; cursor:pointer; text-decoration: none; }
        .nav-btn:hover { background: #475569; }
        .comment-list { margin-bottom: 2rem; }
        .comment { background: #334155; padding: 1rem; border-radius: 8px; margin-bottom: 1rem; }
        .comment-meta { font-size: 0.9em; color: #94a3b8; margin-bottom: 0.5rem; }
        .comment-text { font-size: 1.1em; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
    </div>

    <h1>My Comment History</h1>

    <div class="comment-list">
        <c:choose>
            <c:when test="${empty userComments}">
                <p style="text-align: center; color: #94a3b8;">You haven't made any comments yet.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${userComments}" var="comment">
                    <div class="comment">
                        <div class="comment-meta">
                            Commented on
                            <c:if test="${not empty comment.poll}">Poll: "${comment.poll.title}"</c:if>
                            <c:if test="${not empty comment.lecture}">Lecture: "${comment.lecture.title}"</c:if>
                            - <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                        </div>
                        <div class="comment-text">
                                ${comment.text}
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>