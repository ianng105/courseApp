<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>课程详情 - ${course.name}</title>
    <style>
        body {
            background-color: #0f172a;
            color: #e2e8f0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            margin: 0;
            padding: 2rem;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 900px;
            background-color: #1e293b;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        h1, h2, h3 {
            color: #f8fafc;
            border-bottom: 2px solid #334155;
            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
        }
        p {
            line-height: 1.6;
        }
        a {
            color: #38bdf8;
            text-decoration: none;
            transition: color 0.3s;
        }
        a:hover {
            color: #7dd3fc;
        }
        .btn {
            display: inline-block;
            background-color: #334155;
            color: #e2e8f0;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #475569;
        }
        .btn-primary {
            background-color: #0ea5e9;
            color: #f8fafc;
        }
        .btn-primary:hover {
            background-color: #38bdf8;
        }
        .list {
            list-style: none;
            padding: 0;
        }
        .list-item {
            background-color: #334155;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 0.75rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-control {
            width: 100%;
            padding: 0.75rem;
            background-color: #334155;
            border: 1px solid #475569;
            color: #e2e8f0;
            border-radius: 6px;
            box-sizing: border-box;
        }
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        .comment-section .list-item {
            flex-direction: column;
            align-items: flex-start;
        }
        .comment-meta {
            font-size: 0.875rem;
            color: #94a3b8;
            margin-bottom: 0.5rem;
        }
        .back-link {
            display: block;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>

<div class="container">
    <a href="<c:url value='/courses'/>" class="back-link">&larr; 返回课程列表</a>

    <h1>${course.name}</h1>
    <p>${course.description}</p>

    <sec:authorize access="hasRole('TEACHER')">
        <a href="<c:url value='/addLecture'/>" class="btn btn-primary">添加新讲座</a>
    </sec:authorize>

    <h2>讲座列表</h2>
    <ul class="list">
        <c:forEach var="lecture" items="${lectures}">
            <li class="list-item">
                <a href="<c:url value='/lecture/${lecture.id}'/>">${lecture.title}</a>
            </li>
        </c:forEach>
        <c:if test="${empty lectures}">
            <li class="list-item">该课程下暂无讲座。</li>
        </c:if>
    </ul>

    <%-- 评论区暂时移除，因为评论是针对单个讲座的，在课程详情页展示所有评论逻辑复杂且不直观 --%>
    <%--
    <div class="comment-section">
        <h2>评论区</h2>
        <ul class="list">
            <c:forEach var="comment" items="${comments}">
                <li class="list-item">
                    <div class="comment-meta"><strong>${comment.user.username}</strong> 写道:</div>
                    <p>${comment.content}</p>
                </li>
            </c:forEach>
        </ul>

        <h3>发表新评论</h3>
        <form action="<c:url value='/comment'/>" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <!-- 需要一种方式来指定评论是针对哪个讲座的，这里无法实现 -->
            <div class="form-group">
                <textarea name="content" class="form-control" placeholder="在此输入您的评论..." required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">提交评论</button>
        </form>
    </div>
    --%>

</div>

</body>
</html>