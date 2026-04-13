<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<h2>Course</h2>
<c:forEach items="${courses}" var="course">
    <div onclick="window.location.href='<c:url value='/course/${course.id}' />'"
         style="cursor: pointer; padding: 10px;">
        <p>Title: <c:out value="${course.title}"/></p>
        <p>Course Code: <c:out value="${course.coursecode}"/></p>
        <p>Description: <c:out value="${course.description}"/></p>
        <br>
    </div>
</c:forEach>

<h2>Poll</h2>
<c:forEach items="${polls}" var="poll">
    <div onclick="window.location.href='<c:url value='/poll/${poll.id}' />'"
         style="cursor: pointer; padding: 10px;">
        <p><c:out value="${poll.question}"/></p>
        <br>
    </div>
</c:forEach>

</body>
</html>