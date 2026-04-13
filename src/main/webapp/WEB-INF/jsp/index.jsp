<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head> taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <title>Customer Support</title>
    <script>

        //these path are just for testing
        function goToCoursePage(){
            window.location.href = "<c:url value='course/new' />";
        }
        function goToPollPage(){
            window.location.href = "<c:url value='poll/new' />";
        }
    </script>
</head>
<body>
<h2>Course</h2>
<c:forEach items="${courses}" var="course">
    <div onclick="goToCoursePage()">
        <p>Title: <c:out value="${course.title}"/></p>
        <p>Course Code: <c:out value="${course.coursecode}"/></p>
        <p>Description: <c:out value="${course.description}"/></p>
        <br>
    </div>

</c:forEach>

<h2>Poll</h2>
<c:forEach items="${polls}" var="poll">
    <div onclick="goToPollPage()">
        <p><c:out value="${poll.question}"/></p>
        <br>
    </div>

</c:forEach>

</body>

</html>