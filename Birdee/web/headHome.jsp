<%-- 
    Document   : thanhjsp
    Created on : May 30, 2023, 11:42:13 PM
    Author     : Acer
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
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <section class="head">
            <div class="container py-3">
                <div class="row ">

                    <div class="col-md-3  logo">
                        <a href="MainController?action="><img src="mylib/img/haiquangdoi.png" class="img-fluid" alt="Logo"></a>
                    </div>
                    <div class="col-md-4 ">
                        <div class="he2"> 
                            <div class="input-group mb-3">
                                <form action="MainController" method="post">
                                    <div class="search123">
                                        <input type="text" name="txtsearch" class="form-control" placeholder="Tìm kiếm sản phẩm...." aria-label="Tìm kiếm sản phẩm"
                                               aria-describedby="basic-addon2">
                                        <button class="input-group-text" id="basic-addon2" type="submit" value="Search" name="action">                                               
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </button>
                                    </div>                                     
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mt-1">
                        <div class="row mt-1">

                            <div class="col mt-1">
                                <div class="row mt-1">
                                    <div class="col-3">
                                        <div class="fs-3">
                                            <i class="fa-solid fa-phone-volume" style="color: white;"></i>
                                        </div>
                                    </div>
                                    <div class="col-9 he4">
                                        <a style="color: white;">Tư vấn hỗ trợ </a>
                                        <br>
                                        <strong style="color: white;">09650060383</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="col mt-1">
                                <div class="row mt-1">
                                    <div class="col-3">
                                        <div class="fs-3">
                                            <i class="fa-solid fa-user " style="color: white
                                               ;"></i>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <a style="color: white; ">Xin chào</a> <br>
                                        
                                        <c:set var="uName" value="${sessionScope.userName}"/>
                                        <c:if test="${uName != null}">
                                            <a href="#" style="color: white; text-decoration: none;"><strong>${uName}</strong></a></div>
                                        </c:if>
                                        <c:if test="${uName == null}">
                                            <a href="login.jsp" style="color: white; text-decoration: none;"><strong>Đăng Nhập</strong></a></div>
                                        </c:if>
                                        
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-2 mt-3">
                        <div class="row">
                            <div class="col">
                                <a href="#" class=" position-relative">
                                    <span class="fs-3"><i class="fa-regular fa-heart" style="color: white;"></i></span>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        0

                                    </span>
                                </a>
                            </div>
                            <div class="col">
                                <a href="#" class=" position-relative">
                                    <span class="fs-3"><i class="fa-solid fa-bag-shopping" style="color: white;"></i></span>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        0

                                    </span>
                                </a>
                            </div>
                            <div class="col">
                                <a href="#" class=" position-relative">
                                    <span class="fs-3"><i class="fa-solid fa-print" style="color: white;"></i></span>
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
