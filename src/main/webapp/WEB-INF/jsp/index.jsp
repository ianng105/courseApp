<!DOCTYPE html>
<html>
<head>
    <title>Online Course Website</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5;
            color: #333;
            padding: 0;
        }
        .navbar {
            background: #fff;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
            padding: 16px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .navbar .logo {
            font-size: 20px;
            font-weight: 700;
            color: #4f46e5;
            text-decoration: none;
        }
        .nav-links { display: flex; gap: 18px; align-items: center; }
        .nav-links a {
            color: #555;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 6px 14px;
            border-radius: 6px;
            transition: all 0.2s;
        }
        .nav-links a:hover { background: #f0f0f0; color: #333; }
        .nav-links .btn-primary {
            background: #4f46e5;
            color: #fff;
        }
        .nav-links .btn-primary:hover { background: #4338ca; }
        .container { max-width: 960px; margin: 0 auto; padding: 30px 20px; }
        .section {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            padding: 28px;
            margin-bottom: 24px;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }
        .section-header h2 {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }
        .btn-add {
            padding: 6px 16px;
            background: #4f46e5;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 500;
            text-decoration: none;
            transition: background 0.2s;
        }
        .btn-add:hover { background: #4338ca; }
        .btn-delete {
            padding: 4px 12px;
            background: #fff;
            color: #dc2626;
            border: 1px solid #fca5a5;
            border-radius: 6px;
            font-size: 11px;
            cursor: pointer;
            transition: all 0.2s;
        }
        .btn-delete:hover { background: #fef2f2; }
        .list-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .list-item:last-child { border-bottom: none; }
        .list-item a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }
        .list-item a:hover { text-decoration: underline; }
        .list-item .desc { color: #888; font-size: 13px; margin-top: 2px; }
        .list-item .right { display: flex; align-items: center; gap: 10px; }
        .badge {
            display: inline-block;
            font-size: 11px;
            font-weight: 500;
            padding: 2px 10px;
            border-radius: 20px;
        }
        .badge-green { background: #f0fdf4; color: #16a34a; }
        .badge-blue { background: #eff6ff; color: #2563eb; }
        .empty { color: #aaa; font-size: 14px; padding: 16px 0; text-align: center; }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <a class="logo" href="${pageContext.request.contextPath}/">CourseApp</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/admin/studentmanage">Manage Users</a>
        <a href="${pageContext.request.contextPath}/login">Login</a>
        <a class="btn-primary" href="${pageContext.request.contextPath}/create">Register</a>
    </div>
</div>

<div class="container">

    <!-- Courses Section -->
    <div class="section">
        <div class="section-header">
            <h2>📚 Courses</h2>
            <a class="btn-add" href="${pageContext.request.contextPath}/admin/course/new">+ New Course</a>
        </div>
        <c:if test="${empty courses}">
            <p class="empty">No courses yet.</p>
        </c:if>
        <c:forEach items="${courses}" var="c">
            <div class="list-item">
                <div>
                    <a href="${pageContext.request.contextPath}/lecture/${c.coursecode}">
                        <c:out value="${c.title}"/>
                    </a>
                    <div class="desc">
                        <c:out value="${c.coursecode}"/> — <c:out value="${c.description}"/>
                    </div>
                </div>
                <div class="right">
                    <span class="badge badge-blue"><c:out value="${c.lectures.size()}"/> lectures</span>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/course/${c.coursecode}/delete"
                          onsubmit="return confirm('Delete this course?');" style="margin:0;display:inline;">
                        <button type="submit" class="btn-delete">Delete</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Lectures Section -->
    <div class="section">
        <div class="section-header">
            <h2>📖 Lectures</h2>
        </div>
        <c:if test="${empty lectures}">
            <p class="empty">No lectures yet.</p>
        </c:if>
        <c:forEach items="${lectures}" var="lec">
            <div class="list-item">
                <div>
                    <a href="${pageContext.request.contextPath}/lecture/${lec.l_id}">
                        <c:out value="${lec.title}"/>
                    </a>
                    <div class="desc"><c:out value="${lec.summary}"/></div>
                </div>
                <span class="badge badge-green"><c:out value="${lec.coursecode}"/></span>
            </div>
        </c:forEach>
    </div>

    <!-- Polls Section -->
    <div class="section">
        <div class="section-header">
            <h2>📊 Polls</h2>
            <a class="btn-add" href="${pageContext.request.contextPath}/poll/new">+ New Poll</a>
        </div>
        <c:if test="${empty polls}">
            <p class="empty">No polls yet.</p>
        </c:if>
        <c:forEach items="${polls}" var="p">
            <div class="list-item">
                <div>
                    <a href="${pageContext.request.contextPath}/poll/${p.poll_id}">
                        <c:out value="${p.question}"/>
                    </a>
                </div>
                <div class="right">
                    <span class="badge badge-green"><c:out value="${p.choices.size()}"/> choices</span>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/poll/${p.poll_id}/delete"
                          onsubmit="return confirm('Delete this poll?');" style="margin:0;display:inline;">
                        <button type="submit" class="btn-delete">Delete</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>