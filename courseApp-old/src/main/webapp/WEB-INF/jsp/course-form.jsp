<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>course</h2>
<form:form method="POST" modelAttribute="Course">
    <form:label path="title">Course title</form:label><br/>
    <form:errors path="title" cssClass="error" />
    <form:input type="text" path="title"/><br/><br/>

    <form:label path="coursecode1">Course subject</form:label><br/>
    <form:errors path="coursecode1" cssClass="error" />
    <form:input type="text" path="coursecode1"/><br/><br/>

    <form:label path="coursecode2">code number</form:label><br/>
    <form:errors path="coursecode2" cssClass="error" />
    <form:input type="text" path="coursecode2"/><br/><br/>

    <form:label path="coursecode3">F or SEF</form:label><br/>
    <form:errors path="coursecode3" cssClass="error" />
    <form:input type="text" path="coursecode3"/><br/><br/>

    <form:label path="description">description</form:label><br/>
    <form:errors path="description" cssClass="error" />
    <form:textarea path="description" rows="5" cols="30"/><br/><br/>

    <br/><br/>
    <input type="submit" value="Add Course"/>
</form:form>>
</body>
</html>