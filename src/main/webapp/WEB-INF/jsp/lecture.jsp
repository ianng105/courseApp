<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>${lecture.title}</title>
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
        h1, h2 {
            text-align: center;
            color: #f8fafc;
            border-bottom: 1px solid #334155;
            padding-bottom: 1rem;
            margin-bottom: 2rem;
        }
        .lecture-summary {
            font-size: 1.1rem;
            color: #cbd5e1;
            line-height: 1.6;
            margin-bottom: 2rem;
            background-color: #334155;
            padding: 1.5rem;
            border-radius: 6px;
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
            margin: 0 0.5rem;
        }
        .nav-btn:hover {
            background-color: #475569;
            transform: translateY(-2px);
        }
        .download-btn {
            background-color: #166534;
        }
        .download-btn:hover {
            background-color: #15803d;
        }
        .comment-section {
            margin-top: 3rem;
        }
        .comment {
            background-color: #334155;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            border-left: 3px solid #38bdf8;
        }
        .comment-meta {
            font-size: 0.9rem;
            color: #94a3b8;
            margin-bottom: 0.5rem;
        }
        .comment-text {
            color: #cbd5e1;
        }
        textarea {
            width: 100%;
            padding: 0.75rem;
            border-radius: 6px;
            border: 1px solid #475569;
            background-color: #334155;
            color: #e2e8f0;
            font-size: 1rem;
            min-height: 80px;
            box-sizing: border-box;
        }
        .submit-btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            background-color: #38bdf8;
            color: #0f172a;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        .submit-btn:hover {
            background-color: #7dd3fc;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${lecture.title}</h1>
    <div class="controls">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 返回首页</a>
        <a href="${lecture.notesUrl}" class="nav-btn download-btn" target="_blank">📄 下载笔记</a>
    </div>
    <p class="lecture-summary">${lecture.summary}</p>

    <div class="comment-section">
        <h2>💬 评论区</h2>
        <c:forEach var="comment" items="${comments}">
            <div class="comment">
                <div class="comment-meta">
                    <strong>${comment.user.username}</strong> 发表于 ${comment.creationDate}
                </div>
                <div class="comment-text">${comment.text}</div>
            </div>
        </c:forEach>
        <c:if test="${empty comments}">
            <p style="text-align: center; color: #94a3b8;">暂无评论，快来抢沙发吧！</p>
        </c:if>

        <sec:authorize access="isAuthenticated()">
            <form action="<c:url value='/lecture/addComment'/>" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="lectureId" value="${lecture.id}"/>
                <textarea name="text" placeholder="在此输入您的评论..." required></textarea>
                <button type="submit" class="submit-btn">发表评论</button>
            </form>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <p style="text-align: center; color: #94a3b8;">请<a href="<c:url value='/login'/>" style="color: #38bdf8;">登录</a>后发表评论。</p>
        </sec:authorize>
    </div>
</div>
</body>
</html>