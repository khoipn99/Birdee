<%-- 
    Document   : home
    Created on : Jun 27, 2023, 6:36:16 PM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <!-- Css for header group  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>
        
        <!-- This container belong to HEADER -->
        <%@include file="../../includes/header.jsp" %>


        <div class="row container-home"
             style="padding-left: 12%;padding-right: 64px; padding-top: 60px; padding-bottom: 60px; width: 100%; height: 700px">
            <div class="col-lg-3 px-2">
                <!-- Left section -->
                <div class="nav group__left__account mb-3" style="display: block;" role="tablist">
                    <h4 style="font-weight: 200;">
                        TRANG TÀI KHOẢN
                    </h4>
                    <h6 style="font-weight: bold;">Xin chào, ${sessionScope.account.fullName}!</h6>
                    <div class="mt-4 mb-2 active left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-accounts" type="button" role="tab">
                        Thông tin tài khoản
                    </div>
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-carts" type="button" role="tab">
                        Đơn hàng của bạn
                    </div>
                </div>
            </div>
            <div class="col-lg-9 px-2">
                <!-- Right Section  -->
                <div class="tab-content mb-3">
                    <!-- This section is use for account tab  -->
                    <section class="tab-pane fade show active" id="pills-accounts">
                        <h3 style="font-weight: 300;">
                            TRANG TÀI KHOẢN
                        </h3>
                        <p class="mt-4"><span style="font-weight: bold;">Họ tên: </span>${sessionScope.account.fullName}</p>
                        <p><span style="font-weight: bold;">Email:</span> ${sessionScope.account.username}</p>
                        <p><span style="font-weight: bold;">Phone:</span> ${sessionScope.account.phone}</p>
                        <p><span style="font-weight: bold;">Address:</span> ${sessionScope.account.address}</p>
                    </section>

                    <!-- This section is use for see cart tab  -->
                    <section class="tab-pane fade show" id="pills-carts">
                        <h3 style="font-weight: 300;">
                            Đơn hàng của bạn
                        </h3>
                        <div class="mt-4">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Đơn hàng</th>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Giá trị đơn hàng</th>
                                        <th scope="col">TT thanh toán</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </section>
                    <!-- This section is use for change password  -->
                    <section class="tab-pane fade show" id="pills-password">
                        <h3 style="font-weight: 300;">
                            ĐỔI MẬT KHẨU
                        </h3>
                        <p class="mt-4">Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự
                        </p>
                        <form class="mt-2">
                            <h6>MẬT KHẨU <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Mật khẩu cũ"
                                   aria-label="Username">
                            <h6 class="mt-3">MẬT KHẨU MỚI <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Mật khẩu mới"
                                   aria-label="Username">
                            <h6 class="mt-3">XÁC NHẬN LẠI MẬT KHẨU <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Xác nhận lại mật khẩu"
                                   aria-label="Username">
                            <button type="button" class="btn btn-dark mt-4">Đặt lại mật khẩu</button>
                        </form>
                    </section>
                </div>
            </div>
        </div>
        <%@include file="../../includes/footer.jsp" %>
        <%@include file="../../includes/cart.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>