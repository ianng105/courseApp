
<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Sign-up</h2>

<form:form method="POST" modelAttribute="Poll">
    <form:label path="question">Question</form:label><br/>
    <form:errors path="question" cssClass="error" />
    <form:textarea path="question" rows="5" cols="30"/><br/><br/>

    <form:label path="coursecode">Course Code</form:label><br/>
    <form:errors path="coursecode" cssClass="error" />
    <form:input type="text" path="coursecode"/><br/><br/>

    <form:label path="choiceTexts[0]">Choice 1</form:label><br/>
    <form:errors path="choiceTexts[0]" cssClass="error" />
    <form:input type="text" path="choiceTexts[0]"/><br/><br/>

    <form:label path="choiceTexts[1]">Choice 2</form:label><br/>
    <form:errors path="choiceTexts[1]" cssClass="error" />
    <form:input type="text" path="choiceTexts[1]"/><br/><br/>

    <form:label path="choiceTexts[2]">Choice 3</form:label><br/>
    <form:errors path="choiceTexts[2]" cssClass="error" />
    <form:input type="text" path="choiceTexts[2]"/><br/><br/>

    <form:label path="choiceTexts[3]">Choice 4</form:label><br/>
    <form:errors path="choiceTexts[3]" cssClass="error" />
    <form:input type="text" path="choiceTexts[3]" /><br/><br/>

    <form:label path="choiceTexts[4]">Choice 5</form:label><br/>
    <form:errors path="choiceTexts[4]" cssClass="error" />
    <form:input type="text" path="choiceTexts[4]" /><br/><br/>
    <br/><br/>
    <input type="submit" value="Add Poll"/>
</form:form>
</body>
</html>