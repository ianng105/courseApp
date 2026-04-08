<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Sign-up</h2>
<form action="signup" method="POST">
    <form:form method="POST" modelAttribute="user">
    <form:label path="username">Username</form:label><br/>
        <form:errors path="username" cssClass="error" />
        <form:input type="text" path="username"/><br/><br/>
    <form:label path="fullname">Password</form:label><br/>
        <form:errors path="fullname" cssClass="error" />
        <form:input type="text" path="fullname"/><br/><br/>
    <form:label path="email">Password</form:label><br/>
        <form:errors path="email" cssClass="error" />
        <form:input type="text" path="email"/><br/><br/>
    <form:label path="phonenum">Password</form:label><br/>
        <form:errors path="phonenum" cssClass="error" />
        <form:input type="text" path="phonenum"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
        <form:errors path="password" cssClass="error" />
        <form:input type="text" path="password"/><br/><br/>
    <form:label path="confirm_password">Confirm Password</form:label><br/>
        <form:errors path="confirm_password" cssClass="error" />
        <form:input type="text" path="confirm_password" /><br/><br/>
    <form:label path="roles">Roles</form:label><br/>
        <form:errors path="roles" cssClass="error" />
        <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
        <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
    <br/><br/>
    <input type="submit" value="Add User"/>
</body>
</html>