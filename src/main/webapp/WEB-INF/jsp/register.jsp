
<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Sign-up</h2>

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
</form:form>
</body>
</html>