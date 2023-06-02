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
       <%@include file="headHome.jsp" %>
    </head>
    <body>
          
        <section class="login">
            <div class="container">
                <div class="row py-3">

                    <div class="col-md-6  py-3">
                        <div class="lo2">
                            <h2>LOGIN</h2>
                            <form action="MainController" method="post">
                                <p><input type="text" name="email" placeholder="Email" required=""></p>

                                <p><input type="password" name="pass" placeholder="Password" required=""></p>
                                <p><input type="submit" value="Login" name="action"></p>
                                <p><input type="checkbox" name="remember" value="Remember">
                                    <label for="remember">Keep me logged in</label></p>

                                <p><a href="#">Forgot Password ?</a></p>

                                <c:set var="msg" value="${requestScope.msg}"/>
                                <c:if test="${msg != null}">
                                    <p>${msg}</p>
                                </c:if>

                            </form>
                            <p>Don't have an account?
                                <a href="MainController?action=RegisterAccount">Register</a></p>
                        </div>
                    </div>
                    <div class="col-md-6   lo1">
                        <img src="mylib/img/logo2.png" alt="">
                    </div>
                </div>
            </div>
        
    </section> 
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
