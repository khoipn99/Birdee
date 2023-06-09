<%-- 
    Document   : UserProfile
    Created on : Jun 13, 2023, 11:54:34 AM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="../../css/account.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/layout.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/MyModal.css" rel="stylesheet" type="text/css"/>
        <script src="script.js"></script>
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }

            /* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>
    </head>
    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div class="row container-home"
             style="padding-left: 1%;padding-right: 64px; padding-top: 60px; padding-bottom: 60px; width: 100%;">
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
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-password" type="button" role="tab">
                        Đổi mật khẩu
                    </div>
                </div>
            </div>
            <div class="col-lg-9 px-2 vh-80">
                <!-- Right Section  -->
                <div class="tab-content mb-3">
                    <!-- This section is use for account tab  -->
                    <section class="tab-pane fade show active" id="pills-accounts">
                        <h3 style="font-weight: 300;">
                            TRANG TÀI KHOẢN
                        </h3>
                        <p class="mt-4"><span style="font-weight: bold;">Họ tên: </span>${sessionScope.account.fullName}</p>
                        <p><span style="font-weight: bold;">Email:</span> ${sessionScope.account.email}</p>
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
                                <tbody>
                                    <c:if test="${sessionScope.orders.size() != 0}">
                                        <c:set value="${sessionScope.orders.size()}" var="orderSize"></c:set>
                                        <c:forEach begin="0" step="1" end="${orderSize-1}" var="i">
                                            <tr>
                                                <th scope="row">${i+1}</th>
                                                <td>${sessionScope.orders.get(i).dateTime}</td>
                                                <td>${sessionScope.orders.get(i).customerAddress}</td>
                                                <fmt:formatNumber value="${sessionScope.orders.get(i).totalOrder}" pattern="#,##0.000" var="formattedNumber" />
                                                <td> ${formattedNumber}đ</td>
                                                <td>${sessionScope.orders.get(i).paymentMethod.paymentMethod}</td>
                                                <td><a href="rateOrder?id=${sessionScope.orders.get(i).orderId}" style="text-decoration: none">Xem chi tiết đơn hàng</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- This section is use for change password  -->
                    <section class="tab-pane fade show" id="pills-password">
                        <h3 style="font-weight: 300;">
                            ĐỔI MẬT KHẨU
                        </h3>
                        <c:if test="${sessionScope.account.emailID == null}">
                            <p class="mt-4">Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 6 kí tự
                            </p>
                            <form class="mt-2" method="POST" action="/userChangePass">
                                <h6>MẬT KHẨU <span class="text-danger">*</span></h6>
                                <input type="password" class="form-control mb-2" placeholder="Mật khẩu cũ"
                                       aria-label="Username" required name="old-pass">
                                <h6 class="mt-3">MẬT KHẨU MỚI <span class="text-danger">*</span></h6>
                                <input type="password" class="form-control mb-2" placeholder="Mật khẩu mới"
                                       aria-label="Username" required name="new-pass">
                                <h6 class="mt-3">XÁC NHẬN LẠI MẬT KHẨU <span class="text-danger">*</span></h6>
                                <input type="password" class="form-control mb-2" placeholder="Xác nhận lại mật khẩu"
                                       aria-label="Username" required
                                       name = "new-pass-2"
                                       >
                                <button type="submit" class="btn btn-dark mt-4">Đặt lại mật khẩu</button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.account.emailID != null}">
                            <p class="mt-4" style="color: red">Bạn đang dùng tài khoản email để đăng nhập!
                            </p>
                        </c:if>
                    </section>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>
    <%@ include file="../../includes/footer.jsp" %>
    <script>
// Get the modal
                                                        var modal = document.getElementById("myModal");

// Get the button that opens the modal
                                                        var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
                                                        var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
                                                        btn.onclick = function () {
                                                            modal.style.display = "block";
                                                        };

// When the user clicks on <span> (x), close the modal
                                                        span.onclick = function () {
                                                            modal.style.display = "none";
                                                        };

// When the user clicks anywhere outside of the modal, close it
                                                        window.onclick = function (event) {
                                                            if (event.target === modal) {
                                                                modal.style.display = "none";
                                                            }
                                                        };
                                                        function rateOrder(id) {
                                                            window.location.href = 'rateOrder?id=' + id;
                                                        }
    </script>
</html>
