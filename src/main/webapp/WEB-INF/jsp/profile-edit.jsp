<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5;
            color: #333;
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }
        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 40px;
            width: 100%;
            max-width: 480px;
        }
        .card h1 {
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 8px;
        }
        .card .subtitle {
            text-align: center;
            color: #888;
            font-size: 14px;
            margin-bottom: 28px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            color: #555;
            margin-bottom: 6px;
        }
        .form-group input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
        }
        .form-group input:focus { border-color: #4f46e5; }
        .form-group input:disabled {
            background: #f5f5f5;
            color: #999;
            cursor: not-allowed;
        }
        .hint {
            font-size: 11px;
            color: #aaa;
            margin-top: 4px;
        }
        .btn {
            width: 100%;
            padding: 11px;
            background: #4f46e5;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.2s;
        }
        .btn:hover { background: #4338ca; }
        .btn-cancel {
            display: block;
            text-align: center;
            margin-top: 16px;
            color: #888;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-cancel:hover { color: #333; }
        .success-msg {
            background: #f0fdf4;
            color: #16a34a;
            padding: 10px 14px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 18px;
            text-align: center;
        }
        .error-msg {
            background: #fef2f2;
            color: #dc2626;
            padding: 10px 14px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 18px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Edit Profile</h1>
    <p class="subtitle">Update your personal information</p>

    <c:if test="${not empty success}">
        <div class="success-msg"><c:out value="${success}"/></div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error-msg"><c:out value="${error}"/></div>
    </c:if>

    <form method="POST" action="${pageContext.request.contextPath}/profile/edit">

        <!-- Username 不可修改 -->
        <div class="form-group">
            <label>Username</label>
            <input type="text" value="${user.username}" disabled />
            <input type="hidden" name="username" value="${user.username}" />
            <p class="hint">Username cannot be changed</p>
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="fullname" value="${user.fullname}" required />
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}" required />
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phonenum" value="${user.phonenum}" required />
        </div>

        <div class="form-group">
            <label>New Password</label>
            <input type="password" name="password" placeholder="Leave blank to keep current" />
            <p class="hint">Leave empty if you don't want to change password</p>
        </div>

        <div class="form-group">
            <label>Confirm New Password</label>
            <input type="password" name="confirm_password" />
        </div>

        <button type="submit" class="btn">Save Changes</button>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <a class="btn-cancel" href="${pageContext.request.contextPath}/profile">Cancel</a>
</div>

</body>
</html>