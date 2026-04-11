<%@ include file="base.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <title>Comments</title>
</head>
<body>

<h2>💬 Comments</h2>

<a href="<c:url value='/'/>">🏠 Home</a>
<hr/>

<!-- 评论列表 -->
<c:choose>
    <c:when test="${empty comments}">
        <p>No comments yet.</p>
    </c:when>
    <c:otherwise>
        <c:forEach items="${comments}" var="c">
            <div style="margin-bottom:10px;">
                <strong>${c.username}</strong>: ${c.text}
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>

<hr/>

<!-- 添加评论 -->
<h3>Add Comment</h3>

<form action="<c:url value='/addComment'/>" method="post">

    <input type="hidden" name="pollId" value="${pollId}"/>

    <textarea name="comment" rows="4" cols="50" required></textarea><br/><br/>

    <input type="submit" value="Submit Comment"/>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>

</body>
</html>