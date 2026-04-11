<%@ include file="base.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course Detail</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f5f0fa;
        }

        .container {
            width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        h2, h3 {
            color: #6a0dad;
        }

        .section {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .btn {
            padding: 6px 12px;
            background-color: #6a0dad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #8e44ad;
        }

        .comment-box {
            margin-top: 10px;
            padding: 10px;
            background-color: #f0e6ff;
            border-radius: 5px;
        }

        .error {
            color: red;
        }

        .nav {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- 导航 -->
    <div class="nav">
        <a href="<c:url value='/'/>">🏠 Home</a>
        |
        <a href="<c:url value='/courses'/>">📚 Back to Courses</a>
    </div>

    <!-- 课程信息 -->
    <h2>📘 Course Detail</h2>

    <div class="section">
        <p><strong>Title:</strong> ${course.title}</p>
        <p><strong>Description:</strong> ${course.description}</p>
        <p><strong>Teacher:</strong> ${course.teacher}</p>
    </div>

    <!-- 投票区域 -->
    <div class="section">
        <h3>🗳 Vote</h3>

        <form action="<c:url value='/vote'/>" method="post">
            <input type="hidden" name="courseId" value="${course.id}"/>

            <input type="radio" name="vote" value="LIKE"/> 👍 Like
            <input type="radio" name="vote" value="DISLIKE"/> 👎 Dislike

            <br/><br/>

            <input type="submit" value="Submit Vote" class="btn"/>

            <!-- CSRF -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <!-- 评论列表 -->
    <div class="section">
        <h3>💬 Comments</h3>

        <c:choose>
            <c:when test="${empty comments}">
                <p>No comments yet.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${comments}" var="c">
                    <div class="comment-box">
                        <strong>${c.username}</strong>: ${c.text}
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 添加评论 -->
    <div class="section">
        <h3>✏️ Add Comment</h3>

        <form action="<c:url value='/addComment'/>" method="post">

            <input type="hidden" name="courseId" value="${course.id}"/>

            <textarea name="comment" rows="4" cols="60" placeholder="Write your comment..."></textarea>
            <br/><br/>

            <input type="submit" value="Submit Comment" class="btn"/>

            <!-- CSRF -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

</div>

</body>
</html>