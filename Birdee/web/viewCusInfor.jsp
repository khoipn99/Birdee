<%-- 
    Document   : viewCusInfor
    Created on : Jun 10, 2023, 2:26:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Customer Information page</title>
    </head>
    <body>
        <h2>View Account's Information</h2>
        <c:set var="msg" value="${requestScope.msg}"/>
            <c:if test="${msg!=null}">
                <h2 style="color: red">${msg}</h2>
            </c:if>
        <c:set var="acc" value="${sessionScope.acc}"/>
        <c:if test="${acc.username!=null}">
            <p>Account Name: ${acc.username}</p>
            <p>Email: ${acc.email}</p>
            <p>Address: ${acc.address}</p>
            <p>Phone: ${acc.phone}</p>
            <p><a href="EditCusProfile.jsp">Edit</a></p>
        </c:if>
        
    </body>
</html>
