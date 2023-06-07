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
        <title>Birdee - Login</title>
        <link  rel="icon" type="image/png" href="mylib/img/logo2.png">
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="mylib/img"/>
        <link rel="stylesheet" href="mylib/fontawesome-free-6.4.0-web/css/all.css"/>
        <link rel="stylesheet" href="mylib/fontawesome-free-6.4.0-web/css/all.min.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap-grid.min.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap-grid.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>     
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/popper.min.js"></script>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
         <section class="headlogin">
            <div class="container py-3 head115">
                <div class="row">
                    <div class="col he999"><a href="MainController?action="><img src="mylib/img/haiquangdoi.png" alt=""></a>
                    </div>
                     <div class="col">
                        <p class="headlogin111" style="color: white;">Đăng Nhập</p>   
                     </div>
                </div>
                </div>
        </section>  
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
                                            <input type="checkbox" id="remember" name="remember" value="true">
                                            <div class="fg456"><label for="remember">Keep me logged in</label></div>
                                        </div>
                                        <c:set var="msg" value="${requestScope.msg}" />
                                        <c:if test="${msg != null}">
                                            <p style="color: red">${msg}</p> 
                                        </c:if>
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
