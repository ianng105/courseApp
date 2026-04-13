<!DOCTYPE html>
<html>
<head>
    <title>Comment History</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333; padding: 30px 20px;
        }
        .container { max-width: 700px; margin: 0 auto; }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 28px; margin-bottom: 20px;
        }
        .card h1 { font-size: 22px; font-weight: 600; margin-bottom: 20px; }
        .comment-item {
            border: 1px solid #f0f0f0; border-radius: 10px; padding: 18px; margin-bottom: 12px;
            transition: box-shadow 0.2s;
        }
        .comment-item:hover { box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
        .comment-source {
            display: flex; align-items: center; gap: 8px; margin-bottom: 8px;
        }
        .source-badge {
            display: inline-block; font-size: 11px; font-weight: 500; padding: 2px 10px;
            border-radius: 20px;
        }
        .source-lecture { background: #dbeafe; color: #2563eb; }
        .source-poll { background: #fef3c7; color: #d97706; }
        .comment-source a { color: #4f46e5; text-decoration: none; font-size: 14px; font-weight: 500; }
        .comment-source a:hover { text-decoration: underline; }
        .comment-content {
            font-size: 14px; color: #555; line-height: 1.6; margin-bottom: 8px;
            padding: 10px 14px; background: #f9f9f9; border-radius: 8px;
        }
        .comment-time { color: #aaa; font-size: 12px; }
        .empty { color: #aaa; font-size: 14px; padding: 30px 0; text-align: center; }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <h1>💬 My Comment History</h1>

        <c:if test="${empty comments}">
            <p class="empty">You haven't made any comments yet.</p>
        </c:if>

        <c:forEach items="${comments}" var="c">
            <div class="comment-item">
                <div class="comment-source">
                    <c:if test="${not empty c.lecture}">
                        <span class="source-badge source-lecture">Lecture</span>
                        <a href="${pageContext.request.contextPath}/lecture/${c.lecture.l_id}">
                            <c:out value="${c.lecture.title}"/>
                        </a>
                    </c:if>
                    <c:if test="${not empty c.poll}">
                        <span class="source-badge source-poll">Poll</span>
                        <a href="${pageContext.request.contextPath}/poll/${c.poll.poll_id}">
                            <c:out value="${c.poll.question}"/>
                        </a>
                    </c:if>
                </div>
                <div class="comment-content"><c:out value="${c.content}"/></div>
                <span class="comment-time"><c:out value="${c.createdAt}"/></span>
            </div>
        </c:forEach>
    </div>

    <a class="back-link" href="${pageContext.request.contextPath}/profile">← Back to Profile</a>
</div>

</body>
</html>