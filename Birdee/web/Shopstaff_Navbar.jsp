<%-- 
    Document   : Shopstaff_Navbar
    Created on : Jun 14, 2023, 2:00:55 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
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
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <form action="MainController" method="post">
                        <input hidden="" name="shopEmail" value="${sessionScope.cEmail}"/>
                        <button class="nav-link btn" type="submit" value="ShowShopStaff" name="action">Home Staff</button>  
                    </form>
                </li>
                <li class="nav-item">
                    <form action="MainController" method="post">
                        <input hidden="" name="shopEmail" value="${sessionScope.cEmail}"/>
                        <button class="nav-link btn" type="submit" value="ShowBList" name="action">Show bird List</button>  
                    </form>
                </li>
                <li class="nav-item">
                    <form action="MainController" method="post">
                        <input hidden="" name="shopEmail" value="${sessionScope.cEmail}"/>
                        <button class="nav-link btn" type="submit" value="ShowAList" name="action" onclick="showAccessoryTable()">Show Accessory List</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="MainController" method="post">
                        <input hidden="" name="shopEmail" value="${sessionScope.cEmail}"/>
                        <button class="nav-link btn" type="submit" value="DeleP" name="action">Delete Table</button>
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
