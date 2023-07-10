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
        <%@include file="../includes/header.jsp" %>

        <!-- index wrapper -->
        <section class="container pt-3 pb-5">
            <!-- Banner -->
            <div style="height: 240px; width: 100%;">
                <img src="images/banner.png" alt="birdee" style="width: 100%; height: 100%; object-fit: cover;">
            </div>
            <!-- List category of shop  -->
            <div class="d-flex justify-content-center align-items-center gap-5 mt-4 mb-3">
                <div style="width: 80px; height: 1px; background-color: black;"></div>
                <h2 class="head-title">Khám phá chúng tôi</h2>
                <div style="width: 80px; height: 1px; background-color: black;"></div>
            </div>
            <div class="d-flex justify-content-center align-items-center gap-5">
                <c:forEach items="${sessionScope.categories}" var="c">
                    <a href="product?categoryID=${c.categoryID}">
                        <img style="width: 140px; height: 140px; object-fit: cover; border-radius: 12px;"
                             src="${c.image}" />
                        <div style="color: #21D192; font-weight: bold; margin-top: 8px;" class="text-center">${c.categoryName}</div>
                    </a>
                </c:forEach>
            </div>

            <!-- List new product (bird and accestory) -->
            <section class="mt-5 new-product" id="new-product">
                <div class="new-product-header d-flex justify-content-center align-items-center gap-5 mb-3">
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                    <h2 class="head-title">Sản phẩm mới</h2>
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                </div>
                <div class="row g-4">
                    <c:forEach items="${newProducts}" var="p">
                        <div class="col-6 col-md-3 product-cart-wrapper">
                            <div class="position-relative">
                                <img src="${p.image}"
                                     alt="new-prd" class="product-card-img w-100" style="height: 220px; object-fit: cover;" onclick="viewDetail('${p.productId}')"/>
                                <div class="love-prd">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                          d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                          fill="#333333"></path>
                                    </svg>
                                </div>
                            </div>
                            <div class="action-prd-cart" onclick="addCart()">
                                <i class="fa-solid fa-cart-plus fa-lg"></i>
                            </div>

                            <div class="prd-name">
                                ${p.name}
                            </div>
                            <div class="prd-description">
                                * Mô tả: ${p.description}
                            </div>
                            <div class="prd-price">
                                <fmt:formatNumber value="${p.price}" pattern="#,##0.000" var="price" />
                                ${price}đ
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
            <section class="mt-5 new-product">
                <div class="new-product-header d-flex justify-content-center align-items-center gap-5 mb-3">
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                    <h2 class="head-title">Sản phẩm giá rẻ</h2>
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                </div>
                <div class="row g-4">
                    <c:forEach items="${cheapProducts}" var="p">
                        <div class="col-6 col-md-3 product-cart-wrapper">
                            <div class="position-relative">
                                <img src="${p.image}"
                                     alt="new-prd" class="product-card-img w-100" style="height: 220px; object-fit: cover;"  onclick="viewDetail('${p.productId}')"/>
                                <div class="love-prd">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                    <path fill-rule="evenodd" clip-rule="evenodd"
                                          d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                          fill="#333333"></path>
                                    </svg>
                                </div>
                            </div>
                            <div class="action-prd-cart" onclick="addCart()">
                                <i class="fa-solid fa-cart-plus fa-lg"></i>
                            </div>

                            <div class="prd-name">
                                ${p.name}
                            </div>
                            <div class="prd-description">
                                * Mô tả: ${p.description}
                            </div>
                            <div class="prd-price">
                                <fmt:formatNumber value="${p.price}" pattern="#,##0.000" var="price" />
                                ${price}đ
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </section>

        <%@include file="../includes/footer.jsp" %>
        <%@include file="../includes/cart.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>

        <script>
                                function viewDetail(id) {
                                    window.location.href = "productDetails?productID=" + id;
                                }
                                function addCart() {
                                    alert("Thêm vào giỏ hàng thành công");
                                }
        </script>
    </body>

</html>