<!DOCTYPE html>
<html>
<head>
    <title>Voting History</title>
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
        .vote-item {
            border: 1px solid #f0f0f0; border-radius: 10px; padding: 18px; margin-bottom: 12px;
            transition: box-shadow 0.2s;
        }
        .vote-item:hover { box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
        .vote-question {
            font-size: 15px; font-weight: 600; margin-bottom: 8px;
        }
        .vote-question a { color: #4f46e5; text-decoration: none; }
        .vote-question a:hover { text-decoration: underline; }
        .vote-detail { display: flex; gap: 16px; align-items: center; flex-wrap: wrap; }
        .vote-choice {
            display: inline-flex; align-items: center; gap: 6px; background: #e0e7ff; color: #4f46e5;
            padding: 4px 14px; border-radius: 20px; font-size: 13px; font-weight: 500;
        }
        .vote-time { color: #aaa; font-size: 12px; }
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
        <h1>📊 My Voting History</h1>

        <c:if test="${empty votes}">
            <p class="empty">You haven't voted in any poll yet.</p>
        </c:if>

        <c:forEach items="${votes}" var="v">
            <div class="vote-item">
                <div class="vote-question">
                    <a href="${pageContext.request.contextPath}/poll/${v.poll.poll_id}">
                        <c:out value="${v.poll.question}"/>
                    </a>
                </div>
                <div class="vote-detail">
                    <span class="vote-choice">✓ <c:out value="${v.choice.choice}"/></span>
                    <span class="vote-time"><c:out value="${v.votedAt}"/></span>
                </div>
            </div>
        </c:forEach>
    </div>

    <a class="back-link" href="${pageContext.request.contextPath}/profile">← Back to Profile</a>
</div>

</body>
</html>