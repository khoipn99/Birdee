<%-- 
    Document   : productDetails
    Created on : Jun 28, 2023, 8:01:54 AM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>
        <%@include file="../../includes/header.jsp" %>
        <!-- product detail wrapper -->
        <section class="p-5">
            <div class="row">
                <div class="col-md-6 col-12">
                    <div>
                        <img style="width: 100%; height: 100%; object-fit: contain; border-radius: 18px;"
                             src="${product.image}"
                             alt="pet-shop">
                    </div>
                </div>
                <div class="col-md-6 col-12">
                    <div style="font-size: 18px; color: #333; margin-bottom: 10px; font-weight: bold;">
                        ${product.category.categoryName}
                    </div>
                    <h3 style="font-weight: 400; margin-bottom: 14px;">${product.name}</h3>
                    <p style="color: #c83252; font-weight: 700; font-size: 24px; margin-bottom: 14px;">
                        <fmt:formatNumber value="${product.price}" pattern="#,##0.000" var="price" />
                        ${price}đ
                    </p>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                    <div class="mt-3 mb-4">
                        <div class="row">
                            <div class="col-6">
                                <p class="mb-0"><span style="font-weight: bold;">Giới tính:</span> 
                                    <c:if test="${bird.gender == false}">Cái</c:if>
                                    <c:if test="${bird.gender == true}">Đực</c:if>
                                    </p>
                                </div>
                                <div class="col-6">
                                    <p class="mb-0"><span style="font-weight: bold;">Ngày
                                            sinh:</span> ${bird.dob}</p>
                            </div>
                        </div>
                        <p class="mb-0 mt-1"><span style="font-weight: bold;">Mô tả:</span> ${product.description}
                        </p>
                        <div class="row mt-1">
                            <div class="col-4">
                                <p class="mb-0"><span style="font-weight: bold;">Chiều cao:</span> ${bird.height}cm</p>
                            </div>
                            <div class="col-4">
                                <p class="mb-0"><span style="font-weight: bold;">Cân nặng:</span> ${bird.weight}g</p>
                            </div>
                            <div class="col-4">
                                <p class="mb-0"><span style="font-weight: bold;">Xuất sứ:</span>  ${bird.origin}</p>
                            </div>
                        </div>
                    </div>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                    <div class="row" style="padding-top: 12px; padding-bottom: 12px;">
                        <div class="col-6">
                            <div class="d-flex gap-2 align-items-center">
                                <i class="fa-solid fa-box-open"></i>
                                <p class="mb-0">Miễn Phí Giao Hàng</p>
                            </div>
                            <div class="d-flex gap-2 align-items-center mt-2">
                                <i class="fa-solid fa-right-left"></i>
                                <p class="mb-0">Cam kết đổi/trả hàng miễn phí</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="d-flex gap-2 align-items-center">
                                <i class="fa-solid fa-sack-dollar"></i>
                                <p class="mb-0">Thanh toán khi nhận hàng</p>
                            </div>
                            <div class="d-flex gap-2 align-items-center mt-2">
                                <i class="fa-solid fa-truck-fast"></i>
                                <p class="mb-0">Giao hàng toàn quốc</p>
                            </div>
                        </div>
                    </div>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                    Số hàng còn lại: <span style="color: red">${product.quantity}</span>
                    <!-- if else to show each case, if have product, show below. If out of stock, show s-->

                    <c:if test="${product.quantity != 0}">
                        <div class="mt-3 d-flex flex-column flex-md-row gap-3 align-items-md-center" id="show_buy">
                            <div class="d-flex gap-3 align-items-center">
                                <input type="number" class="input_cart_width" name="qty" value="1" max="${product.quantity}">
                                <button class="btn btn-outline-success btn-lg custom_btn_add" onclick="addCart()">Thêm vào giỏ hàng</button>
                            </div>
                                <button class="btn btn-success btn-lg custom_btn_buynow" onclick="buy()">Mua ngay</button>
                        </div>

                    </c:if>
                    <c:if test="${product.quantity == 0}">
                        <div class="mt-3" id="show_out">
                            <button class="btn btn-outline-danger btn-lg" style="cursor: not-allowed;">Hết hàng</button>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Slider show hot bird in shop -->

        </section>

        <%@include file="../../includes/footer.jsp" %>
        <%@include file="../../includes/cart.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                                    function addCart() {
                                        alert("Thêm vào giỏ hàng thành công");
                                    }
                                    function buy(){
                                        window.location.href = "billDetail";
                                    }
        </script>
    </body>

</html>
