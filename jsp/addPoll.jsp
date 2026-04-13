<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Add New Poll</title>
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
        input[type="text"] {
            width: 100%;
            padding: 0.75rem;
            border-radius: 6px;
            border: 1px solid #475569;
            background-color: #334155;
            color: #e2e8f0;
            font-size: 1rem;
            box-sizing: border-box;
        }
        #options-container .form-group {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        #options-container input {
            flex-grow: 1;
        }
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        .btn, .cancel-btn, .submit-btn {
            flex-grow: 1;
            padding: 0.75rem;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn {
            border: none;
        }
        .submit-btn {
            background-color: #38bdf8;
            color: #0f172a;
            border: none;
        }
        .submit-btn:hover {
            background-color: #7dd3fc;
        }
        .btn-secondary {
            background-color: #475569;
            color: #e2e8f0;
        }
        .btn-secondary:hover {
            background-color: #5f7089;
        }
        .btn-remove {
            background-color: #b91c1c;
            color: #fecaca;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
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
            <a href="<c:url value='/my/comments'/>" class="nav-btn">💬 My Comments</a>
            <a href="<c:url value='/my/votes'/>" class="nav-btn">🗳️ My Votes</a>
            <a href="<c:url value='/user/edit'/>" class="nav-btn">👤 Edit Profile</a>
        </div>
    </sec:authorize>

    <h2>Create New Poll</h2>

    <form action="<c:url value='/addPoll'/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group">
            <label for="question">Poll Question</label>
            <input type="text" id="question" name="question" required>
        </div>
        <div id="options-container">
            <label>Poll Options</label>
            <div class="form-group">
                <input type="text" name="choiceTexts" placeholder="Option 1" required>
            </div>
            <div class="form-group">
                <input type="text" name="choiceTexts" placeholder="Option 2" required>
            </div>
        </div>
        <button type="button" id="add-option-btn" class="btn btn-secondary" style="width: 100%; margin-top: 1rem;">Add More Options</button>
        <div class="button-group">
            <a href="<c:url value='/'/>" class="cancel-btn">Cancel</a>
            <button type="submit" class="submit-btn">Confirm Create</button>
        </div>
    </form>
</div>

<script>
    document.getElementById('add-option-btn').addEventListener('click', function() {
        const container = document.getElementById('options-container');
        const index = container.querySelectorAll('.form-group').length;
        const newOption = document.createElement('div');
        newOption.classList.add('form-group');
        newOption.innerHTML = `
            <input type="text" name="choiceTexts" placeholder="Option ${index + 1}" required>
            <button type="button" class="btn btn-remove" onclick="this.parentElement.remove()">Remove</button>
        `;
        container.appendChild(newOption);
    });
</script>
</body>
</html>