<%-- 
    Document   : home
    Created on : Jun 1, 2023, 2:28:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="headHome.jsp" %>
    </head>
    <body>
        <c:set var="userName" value="${requestScope.userName}"/>
        <c:if test="${userName != null}">
            <h1>Welcome ${userName}</h1>
        </c:if>
        asddfg
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
