<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>投票: ${poll.question}</title>
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
        .nav-btn {
            background-color: #334155;
            color: #e2e8f0;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
            display: inline-block;
        }
        .nav-btn:hover {
            background-color: #475569;
            transform: translateY(-2px);
        }
        .controls {
            text-align: center;
            margin-bottom: 2rem;
        }
        .poll-options, .poll-results {
            margin-top: 2rem;
        }
        .option-label {
            display: block;
            background-color: #334155;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .option-label:hover {
            background-color: #475569;
        }
        .option-label input {
            margin-right: 1rem;
        }
        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: 6px;
            background-color: #38bdf8;
            color: #0f172a;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        .submit-btn:hover {
            background-color: #7dd3fc;
        }
        .result-bar {
            background-color: #334155;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        .result-bar-inner {
            background-color: #38bdf8;
            color: #0f172a;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            white-space: nowrap;
        }
        .comment-section { margin-top: 3rem; }
        .comment { background-color: #334155; padding: 1rem; border-radius: 6px; margin-bottom: 1rem; border-left: 3px solid #38bdf8; }
        .comment-meta { font-size: 0.9rem; color: #94a3b8; margin-bottom: 0.5rem; }
        .comment-text { color: #cbd5e1; }
        textarea { width: 100%; padding: 0.75rem; border-radius: 6px; border: 1px solid #475569; background-color: #334155; color: #e2e8f0; font-size: 1rem; min-height: 80px; box-sizing: border-box; }
        .message { padding: 1rem; border-radius: 6px; margin: 1rem 0; text-align: center; background-color: #166534; color: #dcfce7; }
    </style>
</head>
<body>
<div class="container">
    <h1>${poll.question}</h1>
    <div class="controls">
        <a href="<c:url value='/'/>" class="nav-btn">🏠 返回首页</a>
    </div>

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <c:choose>
        <c:when test="${hasVoted}">
            <h2>投票结果</h2>
            <div class="poll-results">
                <c:forEach var="option" items="${poll.options}">
                    <p>${option.text} (${option.votes.size()} 票)</p>
                    <div class="result-bar">
                        <div class="result-bar-inner" style="width: ${poll.totalVotes > 0 ? (option.votes.size() * 100 / poll.totalVotes) : 0}%;">
                                ${String.format("%.1f", poll.totalVotes > 0 ? (option.votes.size() * 100.0 / poll.totalVotes) : 0)}%
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <sec:authorize access="isAuthenticated()">
                <form action="<c:url value='/poll/${poll.id}/vote'/>" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="poll-options">
                        <c:forEach var="option" items="${poll.options}">
                            <label class="option-label">
                                <input type="radio" name="optionId" value="${option.id}" required> ${option.text}
                            </label>
                        </c:forEach>
                    </div>
                    <button type="submit" class="submit-btn">确认投票</button>
                </form>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <p style="text-align: center; color: #94a3b8;">请<a href="<c:url value='/login'/>" style="color: #38bdf8;">登录</a>后参与投票。</p>
            </sec:authorize>
        </c:otherwise>
    </c:choose>

    <div class="comment-section">
        <h2>💬 评论区</h2>
        <c:forEach var="comment" items="${comments}">
            <div class="comment">
                <div class="comment-meta">
                    <strong>${comment.user.username}</strong> a écrit le ${comment.formattedTimestamp}
                </div>
                <div class="comment-text">${comment.text}</div>
            </div>
        </c:forEach>
        <c:if test="${empty comments}">
            <p style="text-align: center; color: #94a3b8;">暂无评论。</p>
        </c:if>

        <sec:authorize access="isAuthenticated()">
            <form action="<c:url value='/comment'/>" method="post" style="margin-top: 2rem;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="pollId" value="${poll.id}"/>
                <textarea name="text" placeholder="在此输入您的评论..." required></textarea>
                <button type="submit" class="submit-btn" style="width: auto;">发表评论</button>
            </form>
        </sec:authorize>
    </div>
</div>
</body>
</html>