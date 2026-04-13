<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head> taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Course Homepage</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            width: 100%;
            max-width: 900px;
            background-color: #1e293b;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        h1, h2, h3 {
            color: #f8fafc;
            text-align: center;
            border-bottom: 1px solid #334155;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        p {
            text-align: center;
            color: #94a3b8;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }
        .nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #334155;
        }
        .nav-btn {
            background-color: #334155;
            color: #e2e8f0;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
        }
        .nav-btn:hover {
            background-color: #475569;
            transform: translateY(-2px);
        }
        .admin-btn {
            background-color: #991b1b;
        }
        .admin-btn:hover {
            background-color: #b91c1c;
        }
        .content-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
        }
        @media (min-width: 768px) {
            .content-grid {
                grid-template-columns: 1fr 1fr;
            }
        }
        .list-item {
            display: block;
            background-color: #334155;
            padding: 1rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            color: #cbd5e1;
            transition: background-color 0.3s, border-color 0.3s;
            border: 1px solid transparent;
            margin-bottom: 0.75rem;
        }
        .list-item:hover {
            background-color: #475569;
            border-color: #38bdf8;
        }
        .login-box {
            background-color: #334155;
            padding: 2rem;
            border-radius: 8px;
            margin-top: 2rem;
            text-align: center;
        }
        .login-box h3 {
            border: none;
            margin-top: 0;
        }
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: calc(100% - 2rem);
            padding: 0.75rem;
            margin-bottom: 1rem;
            border-radius: 4px;
            border: 1px solid #475569;
            background-color: #1e293b;
            color: #e2e8f0;
        }
        .login-box label {
            display: block;
            text-align: left;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        .login-btn {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: 6px;
            background-color: #38bdf8;
            color: #0f172a;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .login-btn:hover {
            background-color: #7dd3fc;
        }
        .register-link {
            display: block;
            margin-top: 1rem;
            color: #38bdf8;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .message, .error {
            padding: 1rem;
            border-radius: 6px;
            margin: 1rem auto;
            text-align: center;
            max-width: 800px;
        }
        .message {
            background-color: #166534;
            color: #dcfce7;
        }
        .error {
            background-color: #991b1b;
            color: #fecaca;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Course Platform</h1>
    <p>Welcome to the interactive online course platform</p>

    <c:if test="${param.register_success}">
        <div class="message">
            Registration successful. Please login.
        </div>
    </c:if>

    <sec:authorize access="isAuthenticated()">
        <div class="nav">
            <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
            <a href="<c:url value='/courses'/>" class="nav-btn">📚 Course List</a>
            <a href="<c:url value='/my/comments'/>" class="nav-btn">💬 My Comments</a>
            <a href="<c:url value='/my/votes'/>" class="nav-btn">🗳️ My Votes</a>
            <a href="<c:url value='/user/edit'/>" class="nav-btn">👤 Edit Profile</a>
            <sec:authorize access="hasRole('TEACHER')">
                <a href="<c:url value='/addPoll'/>" class="nav-btn admin-btn">➕ Add Poll</a>
                <a href="<c:url value='/addLecture'/>" class="nav-btn admin-btn">➕ Add Lecture</a>
            <a href="<c:url value='/admin/users'/>" class="nav-btn admin-btn">👥 Manage Users</a>
        </sec:authorize>
            <form action="<c:url value='/logout'/>" method="post" style="display: inline;">
                <button type="submit" class="nav-btn" style="border: none; cursor: pointer; background: transparent; color: #e2e8f0;">🚪 Logout</button>
            </form>
        </div>
        <h2>Hello, <sec:authentication property="principal.username"/>!</h2>
    </sec:authorize>

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <div class="content-grid">
        <section>
            <h2>📚 Courses</h2>
            <c:forEach var="lecture" items="${lectures}">
                <a href="<c:url value='/lecture/${lecture.id}'/>" class="list-item">
                    ${lecture.title}
                    <span style="display: block; font-size: 0.8em; color: #94a3b8; margin-top: 0.25rem;">
                        <c:forEach items="${lecture.course.students}" var="student">
                            <c:if test="${student.identity == 'ROLE_TEACHER' || student.identity == 'ROLE_ADMIN'}">
                                <c:out value="${student.fullname}"/>
                            </c:if>
                        </c:forEach>
                    </span>
                </a>
            </c:forEach>
            <c:if test="${empty lectures}">
                <p>No courses available at the moment.</p>
            </c:if>
        </section>

        <section>
            <h2>🗳️ Active Polls</h2>
            <c:forEach var="poll" items="${polls}">
                <a href="<c:url value='/poll/${poll.id}'/>" class="list-item">
                    ${poll.question}
                    <span style="display: block; font-size: 0.8em; color: #94a3b8; margin-top: 0.25rem;">
                        <c:forEach items="${poll.course.students}" var="student">
                            <c:if test="${student.identity == 'ROLE_TEACHER' || student.identity == 'ROLE_ADMIN'}">
                                <c:out value="${student.fullname}"/>
                            </c:if>
                        </c:forEach>
                    </span>
                </a>
            </c:forEach>
            <c:if test="${empty polls}">
                <p>No active polls at the moment.</p>
            </c:if>
        </section>
    </div>

    <%-- Add Login Form for unauthenticated users --%>
    <sec:authorize access="!isAuthenticated()">
        <div class="login-box">
            <h3>Login to Course Platform</h3>

            <c:if test="${param.error}">
                <div class="error">
                    Invalid username or password.
                </div>
            </c:if>
            <c:if test="${param.logout}">
                <div class="message" style="background-color: #166534; color: #dcfce7;">
                    You have been logged out.
                </div>
            </c:if>

            <form action="<c:url value='/perform_login'/>" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit" class="login-btn">Login</button>
            </form>
            <a href="<c:url value='/register'/>" class="register-link">Don't have an account? Register here</a>
        </div>
    </sec:authorize>

</div>

</body>
</html>