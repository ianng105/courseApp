<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Student Management</h2>


<form:form method="POST" modelAttribute="Searchform" >
    <form:label path="username">Student name:</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username"/><br/><br/>

    <input type="submit" value="Search"/>
</form:form>>
<c:forEach items="${userlist}" var="u">
    <div>
        <c:if test="${u.role.equals('ROLE_USER')}">
            <h3><c:out value="${u.username}"/></h3>
            <p>fullname: <c:out value="${u.fullname}"/></p>
            <p>email: <c:out value="${u.email}"/></p>
            <p>password: <c:out value="${u.password}"/></p>
            <p>phone number: <c:out value="${u.phonenum}"/></p>

            <c:url var="delete" value="/admin/user/${u.username}/delete"/>
            <form action="${delete}" method="post">
                <input type="submit" value="DELETE" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <c:url var="edit" value="/admin/profile/${u.username}"/>
            <form action="${edit}" method="get">
                <input type="submit" value="EDIT" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

        </c:if>
    </div>
</c:forEach>
</body>
</html>