<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333;
            display: flex; justify-content: center; padding: 40px 20px;
        }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 40px; width: 100%; max-width: 480px;
        }
        .card h1 { font-size: 22px; font-weight: 600; text-align: center; margin-bottom: 6px; }
        .subtitle { text-align: center; color: #888; font-size: 14px; margin-bottom: 28px; }
        .form-group { margin-bottom: 16px; }
        .form-group label {
            display: block; font-size: 13px; font-weight: 500; color: #555; margin-bottom: 6px;
        }
        .form-group input, .form-group select {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; transition: border-color 0.2s;
        }
        .form-group input:focus, .form-group select:focus { border-color: #4f46e5; }
        .error { color: #dc2626; font-size: 12px; margin-top: 4px; }
        .btn {
            width: 100%; padding: 11px; background: #4f46e5; color: #fff; border: none;
            border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; margin-top: 8px;
        }
        .btn:hover { background: #4338ca; }
        .footer { text-align: center; margin-top: 20px; font-size: 13px; color: #888; }
        .footer a { color: #4f46e5; text-decoration: none; font-weight: 500; }
    </style>
</head>
<body>

<div class="card">
    <h1>Create Account</h1>
    <p class="subtitle">Register as a student or teacher</p>

    <form method="POST" action="${pageContext.request.contextPath}/create">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" value="${Users.username}" required />
        </div>
        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="fullname" value="${Users.fullname}" required />
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${Users.email}" required />
        </div>
        <div class="form-group">
            <label>Phone Number (8 digits)</label>
            <input type="text" name="phonenum" value="${Users.phonenum}" required />
        </div>
        <div class="form-group">
            <label>Password (6-15 characters)</label>
            <input type="password" name="password" required />
        </div>
        <div class="form-group">
            <label>Confirm Password</label>
            <input type="password" name="confirm_password" required />
        </div>
        <div class="form-group">
            <label>Identity</label>
            <select name="identity" required>
                <option value="">-- Select --</option>
                <option value="student">Student</option>
                <option value="teacher">Teacher</option>
            </select>
        </div>
        <button type="submit" class="btn">Register</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <div class="footer">
        Already have an account? <a href="${pageContext.request.contextPath}/login">Log In</a>
    </div>
</div>

</body>
</html>