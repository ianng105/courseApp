<!DOCTYPE html>
<html>
<head>
    <title>Lecture</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333; padding: 30px 20px;
        }
        .container { max-width: 720px; margin: 0 auto; }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 28px; margin-bottom: 20px;
        }
        .card h1 { font-size: 22px; font-weight: 600; margin-bottom: 8px; }
        .card h2 { font-size: 17px; font-weight: 600; margin-bottom: 14px; }
        .meta { color: #888; font-size: 13px; margin-bottom: 16px; }
        .summary { font-size: 14px; line-height: 1.7; color: #555; }
        .list-item {
            display: flex; justify-content: space-between; align-items: center;
            padding: 12px 0; border-bottom: 1px solid #f0f0f0;
        }
        .list-item:last-child { border-bottom: none; }
        .list-item a { color: #4f46e5; text-decoration: none; font-weight: 500; font-size: 14px; }
        .list-item a:hover { text-decoration: underline; }
        .list-item .desc { color: #888; font-size: 13px; margin-top: 2px; }
        .empty { color: #aaa; font-size: 14px; padding: 12px 0; }
        .comment-box {
            border: 1px solid #f0f0f0; border-radius: 8px; padding: 14px; margin-bottom: 10px;
        }
        .comment-box .author { font-weight: 600; font-size: 13px; }
        .comment-box .time { color: #aaa; font-size: 12px; margin-left: 8px; }
        .comment-box .content { font-size: 14px; color: #555; margin-top: 6px; }
        .comment-box .delete-comment { color: #dc2626; font-size: 11px; float: right; }
        textarea {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; font-family: inherit; outline: none; resize: vertical;
        }
        textarea:focus { border-color: #4f46e5; }
        .btn {
            padding: 9px 20px; background: #4f46e5; color: #fff; border: none; border-radius: 8px;
            font-size: 13px; font-weight: 500; cursor: pointer; margin-top: 10px;
        }
        .btn:hover { background: #4338ca; }
        .btn-delete {
            padding: 4px 12px; background: #fff; color: #dc2626; border: 1px solid #fca5a5;
            border-radius: 6px; font-size: 11px; cursor: pointer;
        }
        .btn-delete:hover { background: #fef2f2; }
        .attachment-item {
            display: flex; align-items: center; gap: 10px; padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .attachment-item:last-child { border-bottom: none; }
        .attachment-item a { color: #4f46e5; font-size: 14px; text-decoration: none; }
        .attachment-item a:hover { text-decoration: underline; }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="container">

    <%-- 列表模式: 某课程的所有 lecture --%>
    <c:if test="${not empty lecturelist}">
        <div class="card">
            <h1>📖 Lectures</h1>
            <c:if test="${empty lecturelist}">
                <p class="empty">No lectures yet.</p>
            </c:if>
            <c:forEach items="${lecturelist}" var="lec">
                <div class="list-item">
                    <div>
                        <a href="${pageContext.request.contextPath}/lecture/${lec.l_id}">
                            <c:out value="${lec.title}"/>
                        </a>
                        <div class="desc"><c:out value="${lec.summary}"/></div>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/lecture/${lec.l_id}/delete"
                          onsubmit="return confirm('Delete?');" style="margin:0;">
                        <button type="submit" class="btn-delete">Delete</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <%-- 详情模式: 单个 lecture --%>
    <c:if test="${not empty lecture}">

        <!-- Lecture Info -->
        <div class="card">
            <h1><c:out value="${lecture.title}"/></h1>
            <div class="meta">Course: <c:out value="${lecture.coursecode}"/></div>
            <div class="summary"><c:out value="${lecture.summary}"/></div>
        </div>

        <!-- Attachments / Download Links -->
        <div class="card">
            <h2>📎 Lecture Notes</h2>
            <c:if test="${empty attachments}">
                <p class="empty">No attachments uploaded.</p>
            </c:if>
            <c:forEach items="${attachments}" var="att">
                <div class="attachment-item">
                    <span>📄</span>
                    <a href="${pageContext.request.contextPath}/attachment/${att.id}" download>
                        <c:out value="${att.name}"/>
                    </a>
                </div>
            </c:forEach>
        </div>

        <!-- Comments -->
        <div class="card">
            <h2>💬 Comments</h2>
            <c:if test="${empty comments}">
                <p class="empty">No comments yet.</p>
            </c:if>
            <c:forEach items="${comments}" var="comment">
                <div class="comment-box">
                    <span class="author"><c:out value="${comment.user.username}"/></span>
                    <span class="time"><c:out value="${comment.createdAt}"/></span>
                    <p class="content"><c:out value="${comment.content}"/></p>
                </div>
            </c:forEach>

            <h3 style="font-size:14px; margin:16px 0 8px; font-weight:600;">Add Comment</h3>
            <form method="POST" action="${pageContext.request.contextPath}/lecture/${lecture.l_id}/comment">
                <textarea name="content" rows="3" placeholder="Write a comment..." required></textarea>
                <button type="submit" class="btn">Submit</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>

    </c:if>

    <a class="back-link" href="${pageContext.request.contextPath}/">← Back to Home</a>
</div>

</body>
</html>