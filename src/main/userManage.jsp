<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Manage Users</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', sans-serif; }
        body { background:#0f172a; color:#f1f5f9; padding:2rem; max-width:1000px; margin:0 auto; }
        .container { background:#1e293b; padding:2rem; border-radius:16px; }
        h1 { color:#38bdf8; }
        .user-row { display: flex; justify-content: space-between; align-items: center; background:#273444; padding:1rem; border-radius:8px; margin:0.8rem 0; }
        .btn { padding:0.5rem 1rem; background:#0284c7; color:white; border:none; border-radius:6px; cursor:pointer; }
        .btn-delete { background:#ef4444; }
        .nav { display: flex; gap: 1rem; margin-bottom: 2rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/" class="btn">Home</a>
    </div>

    <h1>User Management</h1>
    <div class="user-row">
        <span>student (STUDENT)</span>
        <div>
            <button class="btn">Edit</button>
            <button class="btn btn-delete">Delete</button>
        </div>
    </div>
    <div class="user-row">
        <span>teacher (TEACHER)</span>
        <div>
            <button class="btn">Edit</button>
            <button class="btn btn-delete">Delete</button>
        </div>
    </div>
</div>
</body>
</html>
