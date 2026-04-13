<!DOCTYPE html>
<html>
<head>
    <title>Poll</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333; padding: 30px 20px;
        }
        .container { max-width: 640px; margin: 0 auto; }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 28px; margin-bottom: 20px;
        }
        .card h1 { font-size: 22px; font-weight: 600; margin-bottom: 6px; }
        .card h2 { font-size: 17px; font-weight: 600; margin-bottom: 14px; }
        .meta { color: #888; font-size: 13px; margin-bottom: 20px; }
        .choice-item {
            display: flex; align-items: center; gap: 12px; padding: 12px 14px;
            border: 2px solid #eee; border-radius: 8px; margin-bottom: 8px;
            cursor: pointer; transition: all 0.2s;
        }
        .choice-item:hover { border-color: #4f46e5; background: #fafafe; }
        .choice-item.selected { border-color: #4f46e5; background: #f0f0ff; }
        .choice-item input[type="radio"] { accent-color: #4f46e5; flex-shrink: 0; }
        .choice-text { flex: 1; font-size: 14px; }
        .vote-count {
            font-size: 12px; color: #888; background: #f5f5f5; padding: 2px 10px;
            border-radius: 12px; white-space: nowrap;
        }
        .btn {
            padding: 10px 24px; background: #4f46e5; color: #fff; border: none; border-radius: 8px;
            font-size: 14px; font-weight: 500; cursor: pointer; margin-top: 12px;
        }
        .btn:hover { background: #4338ca; }
        .empty { color: #aaa; font-size: 14px; padding: 12px 0; }
        .comment-box {
            border: 1px solid #f0f0f0; border-radius: 8px; padding: 14px; margin-bottom: 10px;
        }
        .comment-box .author { font-weight: 600; font-size: 13px; }
        .comment-box .time { color: #aaa; font-size: 12px; margin-left: 8px; }
        .comment-box .content { font-size: 14px; color: #555; margin-top: 6px; }
        textarea {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; font-family: inherit; outline: none; resize: vertical;
        }
        textarea:focus { border-color: #4f46e5; }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
        .voted-info {
            background: #f0fdf4; color: #16a34a; padding: 8px 14px; border-radius: 8px;
            font-size: 13px; margin-bottom: 14px;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- Poll Question & Vote -->
    <div class="card">
        <h1><c:out value="${poll.question}"/></h1>
        <div class="meta">Course: <c:out value="${poll.course.coursecode}"/></div>

        <c:if test="${not empty userVote}">
            <div class="voted-info">
                ✅ You have voted. You can change your vote below.
            </div>
        </c:if>

        <form method="POST" action="${pageContext.request.contextPath}/poll/${poll.poll_id}/vote">
            <c:forEach items="${poll.choices}" var="ch">
                <label class="choice-item <c:if test='${not empty userVote and userVote.choice.id == ch.id}'>selected</c:if>">
                    <input type="radio" name="choiceId" value="${ch.id}"
                           <c:if test="${not empty userVote and userVote.choice.id == ch.id}">checked</c:if> />
                    <span class="choice-text"><c:out value="${ch.choice}"/></span>
                    <span class="vote-count"><c:out value="${ch.voted}"/> votes</span>
                </label>
            </c:forEach>
            <button type="submit" class="btn">Vote</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
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
        <form method="POST" action="${pageContext.request.contextPath}/poll/${poll.poll_id}/comment">
            <textarea name="content" rows="3" placeholder="Write a comment..." required></textarea>
            <button type="submit" class="btn">Submit</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <a class="back-link" href="${pageContext.request.contextPath}/">← Back to Home</a>
</div>

</body>
</html>