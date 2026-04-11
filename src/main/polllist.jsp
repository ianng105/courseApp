<%@ include file="base.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <title>Poll List</title>
</head>
<body>

<h2>🗳 Poll List</h2>

<a href="<c:url value='/'/>">🏠 Home</a>
<hr/>

<c:choose>
    <c:when test="${empty polls}">
        <p>No polls available.</p>
    </c:when>
    <c:otherwise>
        <c:forEach items="${polls}" var="poll">
            <div style="margin-bottom:10px;">
                <strong>${poll.question}</strong>
                <a href="<c:url value='/poll/${poll.id}'/>">👉 View</a>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>

<br/>

<security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value='/addPoll'/>">➕ Add Poll</a>
</security:authorize>

</body>
</html>