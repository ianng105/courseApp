<!DOCTYPE html>
<html>
<head>
    <title>Create Course</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5; color: #333;
            display: flex; justify-content: center; padding: 40px 20px;
        }
        .card {
            background: #fff; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 40px; width: 100%; max-width: 520px;
        }
        .card h1 { font-size: 22px; font-weight: 600; text-align: center; margin-bottom: 6px; }
        .subtitle { text-align: center; color: #888; font-size: 14px; margin-bottom: 28px; }
        .form-group { margin-bottom: 16px; }
        .form-group label {
            display: block; font-size: 13px; font-weight: 500; color: #555; margin-bottom: 6px;
        }
        .form-group input, .form-group textarea {
            width: 100%; padding: 10px 14px; border: 1px solid #ddd; border-radius: 8px;
            font-size: 14px; outline: none; font-family: inherit;
        }
        .form-group input:focus, .form-group textarea:focus { border-color: #4f46e5; }
        .code-row { display: flex; gap: 10px; }
        .code-row input { flex: 1; }
        .btn {
            width: 100%; padding: 11px; background: #4f46e5; color: #fff; border: none;
            border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; margin-top: 8px;
        }
        .btn:hover { background: #4338ca; }
        .error-msg {
            background: #fef2f2; color: #dc2626; padding: 10px 14px; border-radius: 8px;
            font-size: 13px; margin-bottom: 18px; text-align: center;
        }
        .back-link {
            display: block; text-align: center; margin-top: 20px;
            color: #4f46e5; text-decoration: none; font-size: 14px;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Create Course</h1>
    <p class="subtitle">Add a new course to the system</p>

    <c:if test="${not empty error}">
        <div class="error-msg"><c:out value="${error}"/></div>
    </c:if>

    <form method="POST" action="${pageContext.request.contextPath}/admin/course/new">
        <div class="form-group">
            <label>Course Title</label>
            <input type="text" name="title" value="${Course.title}" required />
        </div>
        <div class="form-group">
            <label>Course Code</label>
            <div class="code-row">
                <input type="text" name="coursecode1" placeholder="CS" value="${Course.coursecode1}" required />
                <input type="number" name="coursecode2" placeholder="1234" value="${Course.coursecode2}" required />
                <input type="text" name="coursecode3" placeholder="F" value="${Course.coursecode3}" required />
            </div>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" rows="4" required><c:out value="${Course.description}"/></textarea>
        </div>
        <button type="submit" class="btn">Create Course</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <a class="back-link" href="${pageContext.request.contextPath}/">← Back to Home</a>
</div>

</body>
</html>