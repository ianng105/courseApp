<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Lecture</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background-color: #0f172a; color: #f1f5f9; padding: 2rem; max-width: 1000px; margin: 0 auto; }
        .container { background: #1e293b; padding: 2rem; border-radius: 16px; }
        h1, h2, h3 { color: #38bdf8; margin-bottom: 1rem; }
        .btn { display: inline-block; padding: 0.6rem 1.2rem; background: #0284c7; color: white; border-radius: 8px; text-decoration: none; margin-bottom:1rem; }
        .comment { background: #273444; padding: 0.8rem; border-radius: 8px; margin: 0.6rem 0; }
        textarea { width:100%; padding:0.8rem; background:#334155; color:white; border-radius:8px; border:1px solid #475569; margin:1rem 0; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/" class="btn">Home</a>
        <sec:authorize access="hasRole('TEACHER')">
            <a href="/editLecture/1" class="btn btn-admin">Edit Lecture</a>
            <a href="/deleteLecture/1" class="btn btn-admin">Delete Lecture</a>
        </sec:authorize>
    </div>

    <h1>Lecture 1: Jakarta EE Basics</h1>
    <a href="/files/lecture1.pdf" class="btn">Download Notes</a>
    <p>Summary: Learn JSP, EL, JSTL, Servlet.</p>

    <h3>Comments</h3>
    <div class="comment">Student: Very clear lecture!</div>
    <div class="comment">Teacher: Please finish the quiz.</div>

    <sec:authorize access="isAuthenticated()">
        <form action="/addComment" method="post">
            <input type="hidden" name="lectureId" value="1">
            <textarea name="content" placeholder="Write a comment..."></textarea>
            <button class="btn">Post Comment</button>
        </form>
    </sec:authorize>
</div>
</body>
</html>