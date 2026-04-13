<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Sign-up</h2>

<form:form method="POST" modelAttribute="Users">
    <form:label path="title">Title</form:label><br/>
    <form:errors path="title" cssClass="error" />
    <form:input type="text" path="title"/><br/><br/>

    <form:label path="coursecode">Course Code </form:label><br/>
    <form:errors path="fullname" cssClass="error" />
    <form:input type="text" path="fullname"/><br/><br/>

    <form:label path="summary">summary</form:label><br/>
    <form:errors path="summary" cssClass="error" />
    <form:input type="text" path="summary"/><br/><br/>

    <b>Attachments</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>

    <br/><br/>
    <input type="submit" value="Add lecture"/>
</form:form>
</body>
</html>