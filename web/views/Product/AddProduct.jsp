<%-- 
    Document   : AddProduct
    Created on : Jul 12, 2023, 8:14:44 AM
    Author     : nguyenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <!-- Css for header group  -->
        <link rel="stylesheet" href="layout.css" type="text/css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>
        <!-- This container belong to HEADER; DONT copy to JSP, JUST INCLUDE -->
        <header class="header d-flex flex-column" style="background-color: #21D192;">
            <div class="middle-header border border-bottom-1 order-2 order-md-1">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3 d-lg-block d-none block-logo">
                            <a href="/" class="logo">
                                <img style="width: 110px;" src="/images/logo2.png" alt="birdee">
                            </a>
                        </div>
                        <div class="col-xl-7 col-lg-6 block-search">
                            <div class="input-search-wrapper">
                                <input style="color: black; background-color: #21D192; border: 1px solid white;"
                                       type="email" class="input-search rounded-pill" id="floatingInput"
                                       placeholder="Tìm kiếm sản phẩm...">
                                <div class="search-icon">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </div>
                        </div>
                        <div
                            class="col-xl-2 col-lg-2 d-lg-flex d-none header-right align-items-center justify-content-end gap-3">
                            <div class="dropdown">
                                <i class="fa-regular fa-user fa-lg" data-bs-toggle="dropdown"></i>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="/login.html">Đăng nhập</a></li>
                                    <li><a class="dropdown-item" href="/signup.html">Đăng ký</a></li>

                                    <!-- Only show two list when already login -->
                                    <li><a class="dropdown-item" href="/sell-product.html">Bán hàng</a></li>
                                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                </ul>
                            </div>
                            <i class="fa-regular fa-heart fa-lg"></i>
                            <div class="position-relative">
                                <div class="navbar-icon-link-badge" style="position: absolute; top: -8px; left: 12px; z-index: 2; font-size: 11px; border-radius: 50%; background: #d60b28; width: 16px; height: 16px; line-height:16px;
                                     display: block;
                                     text-align: center;
                                     color: white;
                                     font-weight: bold;">
                                    10
                                </div>
                                <a style="text-decoration: none; color: black;" href="/cart.html">
                                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-nav border border-bottom-1 order-1 order-md-2">
                <div class="container-navbar">
                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid">
                            <div class="left-side d-flex justify-content-between align-items-center">
                                <a href="/" class="logo d-lg-none d-block">
                                    <img src="/images/logo2.png" alt="birdee">
                                </a>
                                <div class="d-flex d-lg-none align-items-center gap-3">
                                    <i class="fa-regular fa-heart fa-lg"></i>
                                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="modal"
                                            data-bs-target="#myModal1" aria-controls="navbarNav" aria-expanded="false"
                                            aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                </div>
                            </div>
                            <div class="collapse navbar-collapse" id="navbarNav">
                                <ul class="navbar-nav navbar-home gap-4">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/all-product.html">Sản phẩm</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Chim cảnh</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Lồng thú</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </header>

        <!-- seller product wrapper  -->
        <section class="p-5 container">
            <div>
                <h4>Đăng bán một sản phẩm mới</h4>
                <div>
                    <form method="POST" action="/product/add" class="add-form" id="add-form">
                        <div class="col">
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Tên
                                        sản phẩm:</label>
                                    <input type="text" class="form-control" id="category-film" name="name" required>
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Giá:</label>
                                    <input type="number" class="form-control" id="category-film" name="price" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Loại
                                        sản phẩm: </label>
                                    <select class="form-select" aria-label="Default select example" id="theloai"
                                            name="category" required>
                                        <option disabled selected>Choose category</option>
                                        <c:forEach var="cate" items="${categories}">
                                            <option value="${cate.categoryId}">${cate.categoryName}</option>
                                        </c:forEach>
                                        </option>
                                    </select>
                                </div>
<!--                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Phân loại:</label>
                                    <select class="form-select" style="width: 200px;" id="city" required="">
                                        <option value="">Chọn phân loại</option>
                                        <c:forEach var="tag" items="${tags}">
                                            <option value="${tag.tagId}">${tag.tagName}</option>
                                        </c:forEach>
                                    </select>
                                </div>-->
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Xuất
                                        xứ:</label>
                                    <input type="text" class="form-control" id="category-film" name="origin">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Cân
                                        nặng:</label>
                                    <input type="number" class="form-control" id="category-film" name="weight">
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Chiều
                                        cao:</label>
                                    <input type="number" class="form-control" id="category-film" name="height">
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Giới
                                        tính:</label>
                                    <select name="gender" class="form-select" style="width: 200px;" id="city" required>
                                        <option disabled>Chọn giới tính</option>
                                        <option value="true">Đực</option>
                                        <option value="false">Cái</option>
                                    </select>
                                </div>

                            </div>
<!--                            <div class="mb-3 mt-3">
                                <label for="exampleFormControlFile1">Ảnh:</label>
                                <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*"
                                       required>
                            </div>-->
                            <div class="mb-3">
                                <label for="category-film" class="col-form-label">Mô
                                    tả:</label>
                                <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                            </div>
                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Đóng
                        </button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- This container belong to FOOTER; DONT copy to JSP, JUST INCLUDE -->
        <footer class="text-center text-lg-start text-dark pt-3" style="background-color: #21D192">
            <div class="text-center text-md-start">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <img style="width: 150px; object-fit: contain;" src="/images/logo2.png" alt="birdee" />
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Sản phẩm</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p>
                            <a href="#!" class="text-dark">Chim cảnh</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Lồng thú</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Hỗ trợ</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p>
                            <a href="#!" class="text-dark">Câu hỏi thường gặp</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Thông tin liên hệ</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Liên hệ</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                        <p><i class="fas fa-envelope mr-3"></i> birdee@gmaill.com</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
