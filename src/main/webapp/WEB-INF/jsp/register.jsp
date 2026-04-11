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
    <form:form method="POST" modelAttribute="Users">
        <form:label path="username">Username</form:label><br/>
        <form:errors path="username" cssClass="error" />
        <form:input type="text" path="username"/><br/><br/>

        <form:label path="fullname">Fullname</form:label><br/>
        <form:errors path="fullname" cssClass="error" />
        <form:input type="text" path="fullname"/><br/><br/>

        <form:label path="email">Email</form:label><br/>
        <form:errors path="email" cssClass="error" />
        <form:input type="text" path="email"/><br/><br/>

        <form:label path="phonenum">Phone Number</form:label><br/>
        <form:errors path="phonenum" cssClass="error" />
        <form:input type="text" path="phonenum"/><br/><br/>
        <form:label path="password">Password</form:label><br/>
        <form:errors path="password" cssClass="error" />
        <form:input type="text" path="password"/><br/><br/>
        <form:label path="confirm_password">Confirm Password</form:label><br/>
        <form:errors path="confirm_password" cssClass="error" />
        <form:input type="text" path="confirm_password" /><br/><br/>
        <form:label path="identity">Identity</form:label><br/>
        <form:errors path="identity" cssClass="error" />
        <form:radiobutton path="identity" value="student"/>Student
        <form:radiobutton path="identity" value="teacher"/>Teacher
        <br/><br/>
        <input type="submit" value="Add User"/>
    </form:form>>
</div>
</body>
</html>