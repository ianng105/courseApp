<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Poll</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#0f172a; color:#f1f5f9; padding:2rem; max-width:1000px; margin:0 auto; }
        .container { background:#1e293b; padding:2rem; border-radius:16px; }
        h1, h2, h3 { color:#38bdf8; margin-bottom:1rem; }
        .btn { padding:0.6rem 1.2rem; background:#0284c7; color:white; border:none; border-radius:8px; cursor:pointer; }
        .btn-admin { background: #ef4444; }
        label { display:block; margin:0.6rem 0; font-size:16px; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/" class="btn">Home</a>
        <sec:authorize access="hasRole('TEACHER')">
            <a href="/editPoll/1" class="btn btn-admin">Edit Poll</a>
            <a href="/deletePoll/1" class="btn btn-admin">Delete Poll</a>
        </sec:authorize>
    </div>

    <h1>Which topic next?</h1>
    <sec:authorize access="isAuthenticated()">
        <form action="/vote" method="post">
            <input type="hidden" name="pollId" value="1">
            <label><input type="radio" name="opt" value="1"> 1. Spring Security</label>
            <label><input type="radio" name="opt" value="2"> 2. Database & JPA</label>
            <label><input type="radio" name="opt" value="3"> 3. File Upload</label>
            <label><input type="radio" name="opt" value="4"> 4. Multi-language</label>
            <label><input type="radio" name="opt" value="5"> 5. Frontend UI</label><br>
            <button class="btn">Vote / Edit Vote</button>
        </form>
    </sec:authorize>

    <h3>Results</h3>
    <p>1: 12 votes</p><p>2: 8 votes</p><p>3: 5 votes</p><p>4: 3 votes</p><p>5: 10 votes</p>

    <h3>Comments</h3>
    <div class="comment">Student: I want Security!</div>
</div>
</body>
</html>