
<html>
<head>
<html>
<head>

    <title>Customer Support</title>
    <script>

        //these path are just for testing
        function goToCoursePage(){
            window.location.href = 'course/new';
        }
        function goToPollPage(pollId) {
            window.location.href = "pollpage/"+pollId;
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
    <div onclick="goToPollPage('${poll.poll_id}')">
        <p><c:out value="${poll.question}"/></p>
        <br>
    </div>

</c:forEach>

</body>

</html>