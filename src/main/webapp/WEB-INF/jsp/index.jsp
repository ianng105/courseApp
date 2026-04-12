<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<h2>Course</h2>
<c:forEach items="${courses}" var="course">
    <p><c:out value="${course.title}"/></p>
    <p><c:out value="${course.coursecode}"/></p>p>
</c:forEach>

<h2>Poll</h2>
<c:forEach items="${polls}" var="poll">
    <p><c:out value="${poll.question}"/></p>p>
</c:forEach>
</body>
</html>