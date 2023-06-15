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
        <footer>
            <%@include file="footer.jsp" %>
        </footer> 
    </body>
</html>
