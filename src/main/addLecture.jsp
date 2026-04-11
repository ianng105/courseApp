<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Add Lecture</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#0f172a; color:#f1f5f9; padding:2rem; max-width:600px; margin:0 auto; }
        .container { background:#1e293b; padding:2rem; border-radius:16px; }
        h1 { color:#38bdf8; }
        input, textarea { width:100%; padding:0.7rem; margin:0.5rem 0 1rem; background:#334155; border:1px solid #475569; border-radius:8px; color:white; }
        .btn { width:100%; padding:0.7rem; background:#0284c7; color:white; border:none; border-radius:8px; cursor:pointer; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/" class="btn">Home</a>
    </div>

    <h1>Create New Lecture</h1>
    <form action="/addLecture" method="post">
        Title:<br><input name="title"><br>
        Summary:<br><textarea name="summary"></textarea><br>
        Notes URL:<br><input name="notesUrl"><br>
        <button class="btn">Create Lecture</button>
    </form>
</div>
</body>
</html>