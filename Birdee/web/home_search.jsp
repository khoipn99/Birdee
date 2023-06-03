<%-- 
    Document   : home
    Created on : Jun 1, 2023, 2:28:13 PM
    Author     : Admin
--%>

<%@page import="dao.AccessoryDAO"%>
<%@page import="dao.BirdDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="headHome.jsp" %>
    </head>
    <body>
        
        <h1>BIRD</h1>
        <table class="">
            <tr>
                <th>IMAGE</th>
                <th>BirdName</th>
                <th>Address</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach var="BL" items="${requestScope.BirdList}">
                <form action="MainController" method="post">
                    <tr>
                        <td>
                            <c:forEach var="url" items="${BirdDAO.getBirdImg(BL.getBird_id())}">
                                <img style="width: 100px" src="${url}">
                            </c:forEach>
                        </td>                        
                        <td>${BL.getBird_name()}</td>
                        <td>${BirdDAO.getBirdAddress(BL.getBird_id())}</td>
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
                <th>IMAGE</th>
                <th>Accessory Name</th>
                <th>Price</th>
                <th>Address</th>
                <th>Vote</th>
                <th>Action</th>
            </tr>
            <c:forEach var="AL" items="${requestScope.AccessoryList}">
                <form action="MainController" method="post">
                    <tr><td>
                            <c:forEach var="url" items="${AccessoryDAO.getAccessoryImg(AL.getAccessory_id()).get(0)}">
                                <img src="${url}">
                            </c:forEach>
                        <td>${AL.getName()}</td>  
                        <td>${AL.getPrice()}</td>
                        <td>${AccessoryDAO.getAccessoryAddress(AL.getAccessory_id())}</td> 
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
