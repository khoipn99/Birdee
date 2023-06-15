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
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        
    </head>
    <body>
      <header>
            <%@include file="header.jsp" %>
        </header>
            <div class="container py-5">
                <div class="row">
                    <div class="col-md-8 col-lg-6">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h2 class="card-title text-primary mb-4 text-center">View Account Information</h2>
                                <c:set var="msg" value="${requestScope.msg}"/>
                                <c:if test="${msg!=null}">
                                    <div class="alert alert-danger">${msg}</div>
                                </c:if>
                                <form>
                                    <div class="mb-3">
                                        <label for="username" class="form-label font-weight-bold">Account Name:</label>
                                        <input type="text" id="username" name="username" value="${acc.username}" class="form-control" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label font-weight-bold">Email:</label>
                                        <input type="text" id="email" name="email" value="${acc.email}" class="form-control" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label font-weight-bold">Address:</label>
                                        <textarea id="address" name="address" rows="4" cols="50" class="form-control" readonly>${acc.address}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label font-weight-bold">Phone:</label>
                                        <input type="text" id="phone" name="phone" value="${acc.phone}" class="form-control" readonly>
                                    </div>
                                    <div class="d-grid gap-2">
                                        <a href="EditCusProfile.jsp" class="btn btn-primary">Edit</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        

      
      
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
        <footer>
            <%@include file="footer.jsp" %>
        </footer> 
    </body>
</html>
