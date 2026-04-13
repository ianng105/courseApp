<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
</head>
<body>
<h2>Sign-up</h2>
<form action="signup" method="POST">
    <label for="username">Username:</label><br/>
    <input type="text" id="username" name="username"/><br/><br/>
    <label for="password">Password:</label><br/>
    <input type="password" id="password" name="password"/><br/><br/>
    <input type="checkbox" id="remember-me" name="remember-me"/>
    <label for="remember-me">Remember me</label><br/><br/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="Sign-up"/>
</form>
</body>
</html>