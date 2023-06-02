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
        <h1>BIRD</h1>
        <table>
            <tr>
                <th>BirdName</th>
                <th>IMAGE</th>
                <th>Date of birth</th>
                <th>Gender</th>
                <th>Height</th>
                <th>Weight</th>
                <th>Origin</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach var="BL" items="${requestScope.BirdList}">
                <form action="MainController" method="post">
                    <tr>
                        <td>${BL.getBird_name()}</td>
                        <td><img style="width: 50%" src='${BL.getUrl()}' /></td>
                        <td>${BL.getDob()}</td>
                        <td>${BL.isGender()}</td>
                        <td>${BL.getHeight()}</td>
                        <td>${BL.getWeight()}</td>
                        <td>${BL.getOrigin()}</td>
                        <td><c:choose>
                                <c:when test="${BL.getQuantity() > 0}">${BL.getQuantity()}</c:when>
                                <c:otherwise>sold out</c:otherwise>
                            </c:choose></td>
                        <td>${BL.getDescription()}</td>
                        <td>${BL.getPrice()}</td>
                        <td><input type="submit" value="Add to cart"></td>
                    </tr>
                </form>
            </c:forEach>

        </table>
        <P>--------------------------------------------------------------------</P>
        <h1>ACCESSORY</h1>
        <table>
            <tr>
                <th>Accessory Name</th>
                <th>IMAGE</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach var="AL" items="${requestScope.AccessoryList}">
                <form action="MainController" method="post">
                    <tr>
                        <td>${AL.getName()}</td>
                        <td><img src='${AL.getUrl()}' /></td>
                        <td><c:choose>
                                <c:when test="${AL.getQuantity() > 0}">${AL.getQuantity()}</c:when>
                                <c:otherwise>sold out</c:otherwise>
                            </c:choose></td>
                        <td>${AL.getDescription()}</td>
                        <td>${AL.getPrice()}</td>
                        <td><input type="submit" value="Add to cart"></td>
                    </tr>
                </form>

            </c:forEach>

        </table>
        <p>-----------------------------------------------------------------------------------------</p>
        <h3 style="color: red"><c:out value="${requestScope.ERROR}" default=""/></h3>
       
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
