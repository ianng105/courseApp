<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Poll</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333;
            display: flex; justify-content: center; padding: 40px 20px;
        }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 40px; width: 100%; max-width: 520px;
        }
        .card h1 { font-size: 22px; font-weight: 600; text-align: center; margin-bottom: 6px; }
        .subtitle { text-align: center; color: #888; font-size: 14px; margin-bottom: 28px; }
        .form-group { margin-bottom: 16px; }
        .form-group label {
            display: block; font-size: 13px; font-weight: 500; color: #555; margin-bottom: 6px;
        }
        .form-group input {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none;
        }
        .form-group input:focus { border-color: #4f46e5; }
        .divider { height: 1px; background: #f0f0f0; margin: 20px 0; }
        .choice-num {
            display: inline-block; width: 24px; height: 24px; background: #e0e7ff; color: #4f46e5;
            border-radius: 50%; text-align: center; line-height: 24px; font-size: 12px;
            font-weight: 600; margin-right: 8px;
        }
        .btn {
            width: 100%; padding: 11px; background: #4f46e5; color: #fff; border: none;
            border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; margin-top: 8px;
        }
        .btn:hover { background: #4338ca; }
        .error-msg {
            background: #fef2f2; color: #dc2626; padding: 12px 16px; border-radius: 8px;
            font-size: 13px; margin-bottom: 18px; text-align: center;
            border: 1px solid #fca5a5;
        }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Create Poll</h1>
    <p class="subtitle">Create a poll with exactly 5 choices</p>

    <%-- ★★★ 显示错误信息 ★★★ --%>
    <c:if test="${not empty error}">
        <div class="error-msg">⚠️ ${error}</div>
    </c:if>

    <form method="POST" action="${pageContext.request.contextPath}/poll/new">
        <div class="form-group">
            <label>Course Code (must match an existing course)</label>
            <input type="text" name="coursecode" value="${Poll.coursecode}" required />
        </div>
        <div class="form-group">
            <label>Question (at least 3 characters)</label>
            <input type="text" name="question" value="${Poll.question}" required />
        </div>

        <div class="divider"></div>

        <div class="form-group">
            <label><span class="choice-num">1</span>Choice 1</label>
            <input type="text" name="choiceTexts[0]" value="${Poll.choiceTexts[0]}" required />
        </div>
        <div class="form-group">
            <label><span class="choice-num">2</span>Choice 2</label>
            <input type="text" name="choiceTexts[1]" value="${Poll.choiceTexts[1]}" required />
        </div>
        <div class="form-group">
            <label><span class="choice-num">3</span>Choice 3</label>
            <input type="text" name="choiceTexts[2]" value="${Poll.choiceTexts[2]}" required />
        </div>
        <div class="form-group">
            <label><span class="choice-num">4</span>Choice 4</label>
            <input type="text" name="choiceTexts[3]" value="${Poll.choiceTexts[3]}" required />
        </div>
        <div class="form-group">
            <label><span class="choice-num">5</span>Choice 5</label>
            <input type="text" name="choiceTexts[4]" value="${Poll.choiceTexts[4]}" required />
        </div>

        <button type="submit" class="btn">Create Poll</button>
        <input type="hidden" name="\({_csrf.parameterName}" value="\){_csrf.token}"/>
    </form>

    <a class="back-link" href="${pageContext.request.contextPath}/">← Back to Home</a>
</div>

</body>
</html>