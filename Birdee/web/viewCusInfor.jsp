<%-- 
    Document   : viewCusInfor
    Created on : Jun 15, 2023, 9:13:37 PM
    Author     : ACE
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
        <h2 style="color: red">View Order's List:</h2>
        <a href="MainController?action=viewOrderList">View</a>
        <c:set var="OrderList" value="${sessionScope.OrderList}"/>
        <c:if test="${OrderList!=null}">
            <table border='1'>
                <tr>
                    <th>OrderID</th>
                    <th>Adress</th>
                    <th>Status</th>
                    <th>Shipping</th>
                    <th>OrderDate</th>
                    <th>Payment</th>
                </tr>
                <c:forEach var="Order" items="${OrderList}">
                    <tr>
                        <td>${Order.order_id}</td>
                        <td>${Order.address}</td>
                        <c:set var="OSI" value="${Order.status_id}"/>
                        <c:if test="${OSI ==1}">
                            <td>Processing</td>    
                        </c:if>
                        <c:if test="${OSI ==2}">
                            <td>Cancel</td>    
                        </c:if>
                        <c:if test="${OSI ==3}">
                            <td>Successful</td>    
                        </c:if>
                        <c:if test="${OSI ==4}">
                            <td>Waiting</td>    
                        </c:if>
                        <c:set var="OShI" value="${Order.shipping_id}"/>
                        <c:set var="ODD" value="${Order.order_date}"/>
                        <c:if test="${OShI ==1}">
                            <td>normal delivery</td> 
                            <td>${ODD}</td>
                        </c:if>
                        <c:if test="${OShI ==2}">
                            <td>fast delivery</td>
                            <td>${ODD}</td>
                        </c:if>
                        <c:if test="${OShI ==3}">
                            <td>express delivery</td>  
                            <td>${ODD}</td>
                        </c:if>
                        <c:set var="OPI" value="${Order.payment_id}"/>
                        <c:if test="${OPI ==1}">
                            <td>visa</td>
                        </c:if>
                        <c:if test="${OPI ==2}">
                            <td>banking online</td>
                        </c:if>
                        <c:if test="${OPI ==3}">
                            <td>cod</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

    </body>
</html>
