
<html>
<head>
    <title>投票: ${Poll.question}</title>

</head>
<body>
<div class="container">
    <h1>${Poll.question}</h1>

    <form:form method="POST" modelAttribute="Vote">

        <form:label path="ch">${choices[0].choice}</form:label>
        <form:label path="ch">${choices[0].voted}</form:label>
        <form:errors path="ch" cssClass="error" />
        <form:radiobutton path="ch" value="ch0"/><br>

        <form:label path="ch">${choices[1].choice}</form:label>
        <form:errors path="ch" cssClass="error" />
        <form:radiobutton path="ch" value="ch1"/><br>

        <form:label path="ch">${choices[2].choice}</form:label>
        <form:errors path="ch" cssClass="error" />
        <form:radiobutton path="ch" value="ch2"/><br>

        <form:label path="ch">${choices[3].choice}</form:label>
        <form:errors path="ch" cssClass="error" />
        <form:radiobutton path="ch" value="ch3"/><br>

        <form:label path="ch">${choices[4].choice}</form:label>
        <form:errors path="ch" cssClass="error" />
        <form:radiobutton path="ch" value="ch4"/><br>
        <br/><br/>
        <input type="submit" value="Vote"/>
    </form:form>



    </div>
</div>
</body>
</html>