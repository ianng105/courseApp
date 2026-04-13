<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }
        .card h1 { font-size: 22px; font-weight: 600; text-align: center; margin-bottom: 6px; }
        .subtitle { text-align: center; color: #888; font-size: 14px; margin-bottom: 28px; }
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block; font-size: 13px; font-weight: 500; color: #555; margin-bottom: 6px;
        }
        .form-group input {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; transition: border-color 0.2s;
        }
        .form-group input:focus { border-color: #4f46e5; }
        .remember { display: flex; align-items: center; gap: 8px; font-size: 13px; color: #666; margin-bottom: 24px; }
        .btn {
            width: 100%; padding: 11px; background: #4f46e5; color: #fff; border: none;
            border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; transition: background 0.2s;
        }
        .btn:hover { background: #4338ca; }
        .footer { text-align: center; margin-top: 20px; font-size: 13px; color: #888; }
        .footer a { color: #4f46e5; text-decoration: none; font-weight: 500; }
        .footer a:hover { text-decoration: underline; }
        .error-msg {
            background: #fef2f2; color: #dc2626; padding: 10px 14px; border-radius: 8px;
            font-size: 13px; margin-bottom: 18px; text-align: center;
        }
        .success-msg {
            background: #f0fdf4; color: #16a34a; padding: 10px 14px; border-radius: 8px;
            font-size: 13px; margin-bottom: 18px; text-align: center;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Welcome Back</h1>
    <p class="subtitle">Sign in to your account</p>

    <c:if test="${param.error != null}">
        <div class="error-msg">Invalid username or password.</div>
    </c:if>
    <c:if test="${param.logout != null}">
        <div class="success-msg">You have been logged out.</div>
    </c:if>

    <form method="POST" action="${pageContext.request.contextPath}/login">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required />
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required />
        </div>
        <div class="remember">
            <input type="checkbox" name="remember-me" id="remember"/>
            <label for="remember" style="margin:0;color:#666;">Remember me</label>
        </div>
        <button type="submit" class="btn">Log In</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <div class="footer">
        Don't have an account? <a href="${pageContext.request.contextPath}/create">Register</a>
    </div>
</div>

</body>
</html>