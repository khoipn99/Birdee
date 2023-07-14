<%-- 
    Document   : MainPage
    Created on : May 23, 2023, 11:40:49 PM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee.vn</title>     
        <link rel="stylesheet" href="../css/layout.css" type="text/css" />
        <link rel="stylesheet" href="../css/style.css" type="text/css" />
        <link href="../css/backtotop.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="script.js"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <style>
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                top: 30px; /* Changed from bottom: 30px; */
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
            }

            @keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
            }

            @-webkit-keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
                to {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
            }

            @keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
                to {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
            }
        </style>
    </head>
    <body>
        <%@ include file="../includes/header.jsp" %>
        <!-- display message here -->
        <div id="snackbar"></div>
        <c:if test="${msg != null}">
            <script>
                var x = document.getElementById("snackbar");
                x.textContent = '${msg}';
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            </script>
        </c:if>
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
                <a>
                    <img style="width: 140px; height: 140px; object-fit: cover; border-radius: 12px;"
                         src="https://inoxthaian.vn/wp-content/uploads/2021/02/hinh-anh-chim-chao-mao-trong-tu-nhien.jpg" />
                    <div style="color: #21D192; font-weight: bold; margin-top: 8px;" class="text-center">Chim</div>
                </a>
                <a>
                    <img style="width: 140px; height: 140px; object-fit: cover; border-radius: 12px;"
                         src="https://maytretrungphuong.com/wp-content/uploads/2016/04/den-long-tre-mau-den-tre-hinh-long-chim-2-510x510.jpg" />
                    <div style="color: #21D192; font-weight: bold; margin-top: 8px;" class="text-center">Các sản phẩm phụ kiện</div>
                </a>
            </div>
            <section class="new-product container-home">
                <div class="new-product-header d-flex justify-content-center align-items-center gap-5 mt-5 mb-5">
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                    <h2 class="head-title">Sản phẩm mới</h2>
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                </div>
                <div class="list-new-product row g-3">
                    <c:forEach items="${newArrivals}" var="na">
                        <div class="col-6 col-md-3 product-cart-wrapper">
                            <form id="frm-product-details-${na.product.productId}" action="productDetails" method="post">
                                <input type="hidden" value="${na.product.productId}" name="productID" id="productID${na.product.productId}">
                                <div class="position-relative">
                                    <img src="${na.product.images.get(0).image}"
                                         alt="new-prd" class="product-card-img w-100 h-auto cursor-pointer" onclick="viewProduct('${na.product.productId}')"/>
                                    <div class="love-prd">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                             fill="none">
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                              fill="#333333"></path>
                                        </svg>
                                    </div>
                                </div>
                                <fmt:formatNumber value="${na.product.price}" pattern="#,##0.000" var="formattedNumber" />
                                <div class="action-prd-cart">
                                    <button class="navbar-toggler" type="button" data-bs-toggle="modal" 
                                            <c:if test="${na.product.quantity != 0}">
                                                data-bs-target="#cartModal"
                                            </c:if>
                                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                                            <c:if test="${na.product.children.size() == 0}">
                                                onclick="
                                                <c:if test="${na.product.quantity != 0}">
                                                        addToCart('${na.product.productId}', '${na.product.name}', '${na.product.images.get(0).image}', '${na.product.price}', 1
                                                    <c:if test="${na.product.classValue != null}">
                                                        , '${na.product.classValue}'
                                                    </c:if>
                                                    <c:if test="${na.product.classValue == null}">
                                                        , ''
                                                    </c:if>
                                                        )
                                                </c:if>
                                                <c:if test="${na.product.quantity == 0}">
                                                        viewProduct('${na.product.productId}')
                                                </c:if>
                                                "
                                            </c:if>          
                                            <c:if test="${na.product.children.size() != 0}">
                                                onclick="viewProduct('${na.product.productId}')"
                                            </c:if>
                                            >                            
                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                    </button>
                                </div>

                                <div class="prd-name" onclick="viewProduct('${na.product.productId}')">
                                    ${na.product.name}
                                </div>
                                <div class="prd-description">
                                    ${na.product.description}
                                </div>
                                <div class="prd-price">
                                    ${formattedNumber}đ
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </section>
            <section class="hot-product container-home">
                <div class="hot-product-header d-flex justify-content-center align-items-center gap-5 mt-5 mb-5">
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                    <h2 class="head-title">Top sản phẩm bán chạy</h2>
                    <div style="width: 80px; height: 1px; background-color: black;"></div>
                </div>
                <div class="list-hot-product row g-4">
                    <c:forEach items="${bestSellers}" var="bs">
                        <div class="col-6 col-md-3 product-cart-wrapper">
                            <form id="frm-product-details-${bs.product.productId}" action="productDetails" method="post">
                                <input type="hidden" value="${bs.product.productId}" name="productID">
                                <div class="position-relative">
                                    <img src="${bs.product.images.get(0).image}"
                                         alt="new-prd" class="product-card-img w-100 h-auto cursor-pointer" onclick="viewProduct('${bs.product.productId}')"/>
                                    <div class="love-prd">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                             fill="none">
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                              fill="#333333"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="action-prd-cart">
                                    <button class="navbar-toggler" type="button" data-bs-toggle="modal" 
                                            "<c:if test="${bs.product.quantity != 0}">
                                                data-bs-target="#cartModal"
                                            </c:if>
                                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                                            onclick=
                                            "<c:if test="${bs.product.quantity != 0}">
                                                 addToCart('${bs.product.productId}', '${bs.product.name}', '${bs.product.images.get(0).image}', '${bs.product.price}', 1
                                                <c:if test="${bs.product.classValue != null}">
                                                 , '${bs.product.classValue}'
                                                </c:if>
                                                <c:if test="${bs.product.classValue == null}">
                                                 , ''
                                                </c:if>
                                                 )
                                            </c:if>
                                            <c:if test="${bs.product.quantity == 0}">
                                                 viewProduct('${bs.product.productId}')
                                            </c:if>
                                            "
                                            />
                                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                                    </button>
                                </div>

                                <div class="prd-name" onclick="viewProduct('${bs.product.productId}')">
                                    ${bs.product.name}
                                </div>
                                <div class="prd-description">
                                    ${bs.product.description}
                                </div>
                                <div class="prd-price">
                                    <fmt:formatNumber value="${bs.product.price}" pattern="#,##0.000" var="formattedNumber" />
                                    ${formattedNumber}đ
                                </div>
                            </form>
                        </div>     
                    </c:forEach>
                </div>
            </section>
        </section>
        <%@ include file="Product/AbsoluteBtn.jsp" %>
        <%@ include file="../includes/footer.jsp" %>
        <!--Script go to top, copy to every single page-->
        <script>
            //Get the button
            let mybutton = document.getElementById("btn-back-to-top");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            mybutton.addEventListener("click", backToTop);

            function backToTop() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }

            function viewProduct(id) {
                document.getElementById("frm-product-details-" + id).submit();
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>
</html>
