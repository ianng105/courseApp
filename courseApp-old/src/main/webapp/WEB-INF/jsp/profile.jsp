<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/">Back to Home</a>

<h1>Profile</h1>

<h2>User Info</h2>
<p><strong>Username:</strong> ${user.username}</p>
<p><strong>Full Name:</strong> ${user.fullname}</p>
<p><strong>Email:</strong> ${user.email}</p>
<p><strong>Phone:</strong> ${user.phonenum}</p>
<p><strong>Identity:</strong> ${user.identity}</p>
<p><strong>Role:</strong> ${user.role}</p>

<hr/>

<h2>Vote History (${votes.size()})</h2>
<c:choose>
    <c:when test="${not empty votes}">
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Poll Question</th>
                    <th>Your Choice</th>
                    <th>Voted At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vote" items="${votes}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${vote.poll.question}</td>
                        <td>${vote.choice.choice}</td>
                        <td>${vote.votedAt}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/pollPage/${vote.poll.poll_id}">
                                View Poll
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>You haven't voted on any polls yet.</p>
    </c:otherwise>
</c:choose>

<hr/>

<h2>Comment History (${comments.size()})</h2>
<c:choose>
    <c:when test="${not empty comments}">
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Comment On</th>
                    <th>Your Comment</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="comment" items="${comments}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>
                            <c:choose>
                                <c:when test="${comment.poll != null}">
                                    Poll: ${comment.poll.question}
                                </c:when>
                                <c:when test="${comment.lecture != null}">
                                    Lecture: ${comment.lecture}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${comment.content}</td>
                        <td>${comment.createdAt}</td>
                        <td>
                            <c:if test="${comment.poll != null}">
                                <a href="${pageContext.request.contextPath}/pollPage/${comment.poll.poll_id}">
                                    View Poll
                                </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>You haven't made any comments yet.</p>
    </c:otherwise>
</c:choose>

</body>
</html>