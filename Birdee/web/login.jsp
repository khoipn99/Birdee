<%-- 
    Document   : login
    Created on : Jun 1, 2023, 3:27:45 PM
    Author     : ACE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>LOGIN</h2>
        <form action="MainController" method="post">
            <input type="text" name="email" placeholder="Email" required="">
            <input type="password" name="pass" placeholder="Password" required="">
            <br> <input type="checkbox" name="remember" value="Remember">
            <label for="remember">Keep me logged in</label>
            <input type="submit" value="Forgot password" name="action">
            <c:set var="msg" value="${requestScope.msg}"/>
            <c:if test="${msg != null}">
                <p>${msg}</p>
            </c:if>
            <br> <input type="submit" value="Login" name="action">                        
        </form>
        <p>Don't have an account?</p>
        <a href="MainController?action=Register">Register</a>
    </body>
</html>
