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
          
        <section >
            <div class="container py-3">

                <div class="row py-3">
                    <div class="col looo8 py-3">
                        <div class="login-form py-3">
                            <div class="login11">
                                <h2>Login</h2>
                                <form action="MainController">
                                    <div class="form-group py-3">
                                        <input type="text" name="email" placeholder="Enter your email address" required="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" placeholder="Enter your password" required="">
                                    </div>
                                    <div class="form-group">
                                        <div class="fg123">
                                            <input type="checkbox" id="remember" name="remember" value="Remember">
                                            <div class="fg456"><label for="remember">Keep me logged in</label></div>
                                        </div>
                                    </div>
                                    <button type="submit" value="Login" name="action">Login</button>                                
                                    <a href="#">Forgot Password?</a>
                                </form>
                                <p>Don't have an account? <a href="MainController?action=RegisterAccount">Register</a></p>
                            </div>
                            
                        </div>

                    </div>
                    <div class="col l11">
                        <div class="l1"><img src="mylib/img/logo2.png" alt=""></div> 
                    </div>
                </div>
            </div>  

        </section> 
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
