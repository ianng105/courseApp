<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background-color: #0f172a; color: #f1f5f9; padding: 2rem; max-width: 600px; margin: 0 auto; }
        .container { background: #1e293b; padding: 2rem; border-radius: 16px; }
        h1 { color: #38bdf8; margin-bottom: 1rem; }
        input { width: 100%; padding: 0.7rem; margin: 0.5rem 0 1rem; background: #334155; border: 1px solid #475569; border-radius: 8px; color: white; }
        .btn { width: 100%; padding: 0.7rem; background: #0284c7; color: white; border: none; border-radius: 8px; cursor: pointer; }
    </style>
</head>
<body>
<div class="container">
    <h1>Register</h1>
    <form action="/signup" method="post">
        Username:<br><input name="username" required><br>
        Password:<br><input name="password" type="password" required><br>
        Full Name:<br><input name="fullName" required><br>
        Email:<br><input name="email" required><br>
        Phone:<br><input name="phone" required><br>
        <button class="btn">Register</button>
    </form>
</div>
</body>
</html>