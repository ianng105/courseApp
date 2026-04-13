<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Course App</title>
    <script>
        function goToCoursePage(courseCode) {
            window.location.href = "<c:url value='/lecture/'/>" + courseCode;
        }

        function goToPollPage(pollId) {
            window.location.href = "<c:url value='/poll/'/>" + pollId;
        }
    </script>
</head>
<body>
<h2>Course</h2>
<c:forEach items="${courses}" var="course">
    <div onclick="goToCoursePage('${course.coursecode}')">
        <p>Title: <c:out value="${course.title}"/></p>
        <p>Course Code: <c:out value="${course.coursecode}"/></p>
        <p>Description: <c:out value="${course.description}"/></p>
        <br>
    </div>
</c:forEach>

<h2>Poll</h2>
<c:forEach items="${polls}" var="poll">
    <div onclick="goToPollPage('${poll.poll_id}')">
        <p><c:out value="${poll.question}"/></p>
        <br>
    </div>
</c:forEach>
</body>
</html>