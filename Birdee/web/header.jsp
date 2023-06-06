<%-- 
    Document   : header
    Created on : Jun 5, 2023, 8:10:32 PM
    Author     : ACE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee</title>
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

        <section class="head">
            <div class="container py-3">
                <div class="row">

                    <div class="col-md-6 ">
                        <a href="#" style="color: #ffffff; text-decoration: none;"> Trở thành người bán </a>
                    </div>

                    <div class="col-md-6 text-end ">
                        <div class="he666">


                            <i class="fa-regular fa-bell" style="color: #ffffff;"></i>
                            <a href="#">Thông báo</a>


                            <i class="fa-regular fa-circle-question" style="color: #ffffff;"></i>
                            <a href="#">Hỗ Trợ </a>
                            <c:set var="uName" value="${sessionScope.userName}"/>
                            <c:if test="${uName != null}">
                                <a href="#" style="color: white; text-decoration: none;"><strong>${uName}</strong></a>
                                <a href="MainController?action=Logout" style="color: white; text-decoration: none;"><strong>Logout</strong></a>

                            </c:if>
                            <c:if test="${uName == null}">
                                <a href="MainController?action=registerAccount.jsp" style="color: white; text-decoration: none;"><strong>Đăng Ký</strong></a>
                                <i class="navbar__link-separator"></i>
                                <a href="login.jsp" style="color: white; text-decoration: none;"><strong>Đăng Nhập</strong></a>

                            </c:if>    






                        </div>
                    </div>
                </div>



                <div class="row mt-5 ">

                    <div class="col-md-2 logo ">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-11"><a href="MainController?action="><img src="mylib/img/haiquangdoi.png" class="img-fluid" alt="Logo"></a></div>

                        </div>
                    </div>


                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-2"></div>
                            <div class="col-md-2">
                                <div class="dropdown">
                                    <button  class="btn btn-secondary " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i  class="fa-solid fa-bars fa-2xl" style="color: #017a47;"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>



                    </div>




                    <div class="col-md-8">
                        <form action="MainController" method="POST">
                            <div class="search">
                                <i class="fa fa-search"></i>
                                <input type="text" name="txtsearch"class="form-control" placeholder="Tìm sản phẩm...">
                                <button type="submit" value="Search" name="action"  style="background-color: #017a47; font-weight: bold;" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div> 
                        </form>
                    </div>



                    <div class="col-md-1">
                        <div class="row">
                            <!-- <div class="col-md-1"></div> -->
                            <div class="col-md-6">
                                <a href="#" class=" position-relative">
                                    <span class="fs-3"><i class="fa-regular fa-heart" style="color: white;"></i></span>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        0

                                    </span>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="#" class=" position-relative">
                                    <span class="fs-3"><i class="fa-solid fa-bag-shopping" style="color: white;"></i></span>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        0

                                    </span>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>




        </section>

    </body>

</html>
