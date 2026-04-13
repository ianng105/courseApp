<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Comments</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#0f172a; color:#f1f5f9; padding:2rem; max-width:800px; margin:0 auto; }
        .container { background:#1e293b; padding:2rem; border-radius:16px; }
        h2, h3 { color:#38bdf8; margin-bottom: 1.5rem; text-align: center; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
        .nav-btn { padding:0.6rem 1.2rem; background:#334155; color:white; border:none; border-radius:8px; cursor:pointer; text-decoration: none; }
        .nav-btn:hover { background: #475569; }
        .comment-list { margin-bottom: 2rem; }
        .comment { background: #334155; padding: 1rem; border-radius: 8px; margin-bottom: 1rem; }
        .comment strong { color: #60a5fa; }
        textarea {
            width:100%;
            padding:0.8rem;
            margin-bottom: 1rem;
            background:#334155;
            border:1px solid #475569;
            border-radius:8px;
            color:white;
            font-size: 16px;
            resize: vertical;
            min-height: 100px;
        }
        .btn {
            width: 100%;
            padding: 0.8rem;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.2s;
        }
        .btn:hover { background: #0369a1; }
        hr { display: none; } /* Hide the horizontal rules */
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
    </div>

    <h2>💬 Comments</h2>

    <!-- 评论列表 -->
    <div class="comment-list">
        <c:choose>
            <c:when test="${empty comments}">
                <p style="text-align: center; color: #94a3b8;">No comments yet.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${comments}" var="c">
                    <div class="comment">
                        <strong>${c.username}</strong>: ${c.text}
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 添加评论 -->
    <h3>Add Comment</h3>
    <form action="<c:url value='/addComment'/>" method="post">
        <input type="hidden" name="pollId" value="${pollId}"/>
        <textarea name="comment" placeholder="Write your comment here..." required></textarea>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn">Submit Comment</button>
    </form>
</div>
</body>
</html>