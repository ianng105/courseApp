<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333; padding: 30px 20px;
        }
        .container { max-width: 960px; margin: 0 auto; }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 28px;
        }
        .card-header {
            display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;
        }
        .card-header h1 { font-size: 22px; font-weight: 600; }
        .count-badge {
            background: #e0e7ff; color: #4f46e5; padding: 4px 14px; border-radius: 20px;
            font-size: 13px; font-weight: 500;
        }
        table { width: 100%; border-collapse: collapse; }
        th {
            text-align: left; padding: 10px 12px; font-size: 12px; font-weight: 600; color: #888;
            text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid #f0f0f0;
        }
        td { padding: 12px; font-size: 14px; border-bottom: 1px solid #f0f0f0; }
        tr:last-child td { border-bottom: none; }
        tr:hover { background: #fafafa; }
        .role-badge {
            display: inline-block; font-size: 11px; font-weight: 500; padding: 2px 10px; border-radius: 20px;
        }
        .role-user { background: #e0e7ff; color: #4f46e5; }
        .role-teacher { background: #fef3c7; color: #d97706; }
        .role-admin { background: #fce7f3; color: #db2777; }
        .btn-delete {
            padding: 5px 14px; background: #fff; color: #dc2626; border: 1px solid #fca5a5;
            border-radius: 6px; font-size: 12px; cursor: pointer;
        }
        .btn-delete:hover { background: #fef2f2; border-color: #dc2626; }
        .empty { text-align: center; color: #aaa; padding: 40px; font-size: 14px; }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h1>👥 User Management</h1>
            <span class="count-badge">${fn:length(userlist)} users</span>
        </div>

        <c:if test="${empty userlist}">
            <p class="empty">No users found.</p>
        </c:if>

        <c:if test="${not empty userlist}">
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Identity</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userlist}" var="u">
                        <tr>
                            <td><strong><c:out value="${u.username}"/></strong></td>
                            <td><c:out value="${u.fullname}"/></td>
                            <td><c:out value="${u.email}"/></td>
                            <td><c:out value="${u.phonenum}"/></td>
                            <td><c:out value="${u.identity}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.role == 'ROLE_ADMIN'}">
                                        <span class="role-badge role-admin">Admin</span>
                                    </c:when>
                                    <c:when test="${u.role == 'ROLE_TEACHER'}">
                                        <span class="role-badge role-teacher">Teacher</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="role-badge role-user">User</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <form method="POST" action="${pageContext.request.contextPath}/admin/user/${u.username}/delete"
                                      onsubmit="return confirm('Delete this user?');" style="margin:0;">
                                    <button type="submit" class="btn-delete">Delete</button>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <a class="back-link" href="${pageContext.request.contextPath}/">← Back to Home</a>
</div>

</body>
</html>