
<html>
<head>
    <title>Add New Lecture</title>
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
        h1, h2 {
            color: #f8fafc;
            text-align: center;
            border-bottom: 1px solid #334155;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        .nav {
            display: flex;
            justify-content: center;
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
            transition: background-color 0.3s;
        }
        .nav-btn:hover {
            background-color: #475569;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #94a3b8;
        }
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 0.75rem;
            border-radius: 6px;
            border: 1px solid #475569;
            background-color: #334155;
            color: #e2e8f0;
            font-size: 1rem;
            box-sizing: border-box;
        }
        textarea {
            min-height: 120px;
            resize: vertical;
        }
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        .submit-btn, .cancel-btn {
            flex-grow: 1;
            padding: 0.75rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .submit-btn {
            border: none;
            background-color: #38bdf8;
            color: #0f172a;
        }
        .submit-btn:hover {
            background-color: #7dd3fc;
        }
        .cancel-btn {
            background-color: #475569;
            color: #e2e8f0;
            border: 1px solid #475569;
        }
        .cancel-btn:hover {
            background-color: #5f7089;
        }
    </style>
</head>
<body>

<div class="container">
    <sec:authorize access="isAuthenticated()">
        <div class="nav">
            <a href="<c:url value='/'/>" class="nav-btn">🏠 Home</a>
            <a href="<c:url value='/courses'/>" class="nav-btn">📚 Course List</a>
            <a href="<c:url value='/admin/users'/>" class="nav-btn">👥 Manage Users</a>
            <a href="<c:url value='/my/votes'/>" class="nav-btn">🗳️ My Votes</a>
            <a href="<c:url value='/user/edit'/>" class="nav-btn">👤 Edit Profile</a>
        </div>
    </sec:authorize>

    <h2>Add New Lecture</h2>

    <form action="<c:url value='/addLecture'/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="courseId">Course</label>
            <select id="courseId" name="courseId" required>
                <c:forEach items="${courses}" var="course">
                    <option value="${course.id}">${course.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="title">Lecture Title</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="summary">Lecture Summary</label>
            <textarea id="summary" name="summary" required></textarea>
        </div>
        <div class="form-group">
            <label for="notesUrl">Notes URL</label>
            <input type="text" id="notesUrl" name="notesUrl" required>
        </div>
        <div class="button-group">
            <a href="<c:url value='/lectures'/>" class="cancel-btn">Cancel</a>
            <button type="submit" class="submit-btn">Confirm Add</button>
        </div>
    </form>
</div>

</body>
</html>