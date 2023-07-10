<%-- 
    Document   : header
    Created on : Jun 27, 2023, 6:47:03 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header d-flex flex-column" style="background-color: #21D192;">
    <div class="middle-header border border-bottom-1 order-2 order-md-1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-3 col-lg-3 d-lg-block d-none block-logo">
                    <a href="home" class="logo">
                        <img style="width: 110px;" src="images/logo2.png" alt="birdee">
                    </a>
                </div>
                <div class="col-xl-7 col-lg-6 block-search">
                    <form id="frm-text" action="searchProductByText" method="post">
                        <div class="input-search-wrapper">
                            <input style="color: black; background-color: #21D192; border: 1px solid white;"
                                   type="text" class="input-search rounded-pill" id="floatingInput" name="textSearch"
                                   placeholder="Tìm kiếm sản phẩm..." value="${sessionScope.textSearch}">
                            <div class="search-icon" onclick="searchByText()">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                        </div>
                    </form>
                </div>
                <div
                    class="col-xl-2 col-lg-2 d-lg-flex d-none header-right align-items-center justify-content-end gap-3">
                    <div class="dropdown">
                        <i class="fa-regular fa-user fa-lg" data-bs-toggle="dropdown"></i>
                        <ul class="dropdown-menu">
                            <c:if test="${sessionScope.account eq null}">
                                <li><a class="dropdown-item" href="login">Đăng nhập</a></li>
                                <li><a class="dropdown-item" href="register">Đăng ký</a></li>
                                </c:if>

                            <c:if test="${sessionScope.account ne null}">
                                <!-- Only show two list when already login -->
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <c:if test="${sessionScope.account != null}">
                                            Hello, ${sessionScope.account.fullName}
                                        </c:if>
                                    </a>
                                </li>
                                <li><a class="dropdown-item" href="userProfile">Thông tin tài khoản</a></li>
                                <li <c:if test="${sessionScope.account.role.id == 3}">style="display: none"</c:if>><a class="dropdown-item" href="cartDetails">Chi tiết giỏ hàng</a></li>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                </c:if>
                        </ul>
                    </div>
                    <!--                    <i class="fa-regular fa-heart fa-lg"></i>-->
                    <div class="position-relative">

                        <c:if test="${sessionScope.account ne null}">
                            <div class="navbar-icon-link-badge" style="position: absolute; top: -8px; left: 12px; z-index: 2; font-size: 11px; border-radius: 50%; background: #d60b28; width: 16px; height: 16px; line-height:16px;
                                 display: block;
                                 text-align: center;
                                 color: white;
                                 font-weight: bold;">
                            </div>
                        </c:if>
                        <button class="navbar-toggler" type="button" data-bs-toggle="modal"
                                data-bs-target="#cartModal" aria-controls="navbarNav" aria-expanded="false"
                                aria-label="Toggle navigation">

                            <span>
                                <i class="fa-solid fa-cart-plus fa-lg"></i>
                            </span>
                        </button>
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
                            <img src="images/logo2.png" alt="birdee">
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
                                <a class="nav-link active" aria-current="page" href="home">Trang chủ</a>
                            </li>
                            <c:if test="${sessionScope.account.role.id == 3}">
                                <li class="nav-item">
                                    <a class="nav-link" href="createProduct">Đăng bán sản phẩm</a>
                                </li>
                            </c:if>
                            <li class="nav-item" <c:if test="${sessionScope.account.role.id == 3}">style="display: none"</c:if>>
                                    <a class="nav-link" href="product">Tất cả sản phẩm</a>
                                </li>
                            <c:forEach var="c" items="${sessionScope.categories}">
                                <li class="nav-item" <c:if test="${sessionScope.account.role.id == 3}">style="display: none"</c:if>>
                                    <a class="nav-link" href="product?categoryID=${c.categoryID}">${c.categoryName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>
<script>
    function searchByText() {
        document.getElementById('frm-text').submit();
    }
</script>