<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/backtotop.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/script.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <style>
            @media (max-width: 767px) {
                .carousel-inner .carousel-item>div {
                    display: none;
                }

                .carousel-inner .carousel-item>div:first-child {
                    display: block;
                }
            }

            .carousel-inner .carousel-item.active,
            .carousel-inner .carousel-item-next,
            .carousel-inner .carousel-item-prev {
                display: flex;
            }

            /* medium and up screens */
            @media (min-width: 768px) {

                .carousel-inner .carousel-item-end.active,
                .carousel-inner .carousel-item-next {
                    transform: translateX(25%);
                }

                .carousel-inner .carousel-item-start.active,
                .carousel-inner .carousel-item-prev {
                    transform: translateX(-25%);
                }
            }

            .carousel-inner .carousel-item-end,
            .carousel-inner .carousel-item-start {
                transform: translateX(0);
            }
        </style>
    </head>

    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div>
            <div class="container-home"
                 style="padding-left: 64px; padding-right: 64px; padding-top: 60px; padding-bottom: 60px; width: 100%;">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <!-- Carousel wrapper -->
                        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel">
                            <!-- Slides -->
                            <div class="carousel-inner mb-5">
                                <div class="carousel-item active" style="height: 400px; width: 100%;">
                                    <img src="${images.get(0).image}"
                                         class="w-100 h-100 object-fit-cover" alt="..." />
                                </div>
                                <c:forEach var="i" begin="1" step="1" end="${images.size()-1}">
                                    <div class="carousel-item" style="height: 400px; width: 100%;">
                                        <img src="${images.get(i).image}"
                                             class="w-100 h-100 object-fit-cover" alt="..." />
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Slides -->

                            <!-- Controls -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                            <!-- Controls -->

                            <!-- Thumbnails -->
                            <div class="carousel-indicators" style="margin-bottom: -20px;">
                                <c:forEach var="i" begin="0" step="1" end="${images.size()-1}">
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i}"
                                            class="active" aria-current="true" aria-label="Slide ${i+1}" style="width: 100px;">
                                        <img class="d-block w-100"
                                             src="${images.get(i).image}"
                                             class="img-fluid" />
                                    </button>
                                </c:forEach>
                            </div>
                            <!-- Thumbnails -->
                        </div>
                        <!-- Carousel wrapper -->
                    </div>
                    <div class="col-md-6 col-12">
                        <div style="font-size: 18px; color: #333; margin-bottom: 10px; font-weight: bold;">
                            ĐANG CẬP NHẬT
                        </div>
                        <h3 style="font-weight: 400; margin-bottom: 14px;">${product.name}</h3>
                        <div class="d-flex">
                            <p style="color: #c83252; font-weight: 700; font-size: 24px; margin-bottom: 14px;" id="proPrice">
                                <fmt:formatNumber value="${product.price}" pattern="#,##0.000" var="formattedNumber" />
                                ${formattedNumber}
                            </p>
                            <p style="color: #c83252; font-weight: 700; font-size: 24px; margin-bottom: 14px;">
                                đ
                            </p>
                        </div>
                        <div class="mb-3">
                            <!-- Show 2 list, 1 list for can buy, 1 list for sold out  -->
                            <div class="d-flex flex-wrap align-items-center gap-2" id="">
                                <c:if test="${product.children.size() != 0}"><!-- List can buy show here  -->
                                    <!-- If you choose div, you need add active into class in div like below -->
                                    <div id="pro-${product.productId}" 
                                         data-productid="${product.productId}"
                                         data-producttypevalue="${product.classValue}"
                                         data-productprice="${product.price}"
                                         style="color: #777777; border: 1px solid #777777; border-radius: 6px; cursor: pointer;"
                                         class="custom__select__type active px-3 py-2
                                         <c:if test="${product.quantity == 0}">
                                             position-relative soldout
                                         </c:if>
                                         ">
                                        <p class="mb-0">${product.classValue}</p>
                                        <c:if test="${product.quantity == 0}">
                                            <div class="position-absolute"
                                                 style="height: 1px; width: 100%; background-color: #777777; bottom: 50%; left: 0px; transform: rotate(14deg);">
                                            </div>
                                            <div class="position-absolute"
                                                 style="height: 1px; width: 100%; background-color: #777777; bottom: 50%; right: 0px; transform: rotate(-14deg);">
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:forEach items="${product.children}" var="pc">
                                        <div id="pro-${pc.productId}" 
                                             data-productid="${pc.productId}"
                                             data-producttypevalue="${pc.classValue}"
                                             data-productprice="${pc.price}"
                                             style="color: #777777; border: 1px solid #777777; border-radius: 6px; cursor: pointer;"
                                             class="custom__select__type px-3 py-2
                                             <c:if test="${pc.quantity == 0}">
                                                 position-relative soldout
                                             </c:if>
                                             ">
                                            <p class="mb-0"> ${pc.classValue}</p>
                                            <c:if test="${pc.quantity == 0}">
                                                <div class="position-absolute"
                                                     style="height: 1px; width: 100%; background-color: #777777; bottom: 50%; left: 0px; transform: rotate(14deg);">
                                                </div>
                                                <div class="position-absolute"
                                                     style="height: 1px; width: 100%; background-color: #777777; bottom: 50%; right: 0px; transform: rotate(-14deg);">
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                        <div class="mt-3 mb-4">
                            <p>Code: <span style="font-weight: bold;">ĐANG CẬP NHẬT</span><br />
                                Hãng sản xuất: <span style="font-weight: bold;">ĐANG CẬP NHẬT</span><br />Xuất xứ thương hiệu:
                                <span style="font-weight: bold;">ĐANG CẬP NHẬT</span>
                            </p>
                        </div>
                        <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                        <div class="row" style="padding-top: 12px; padding-bottom: 12px;">
                            <div class="col-6">
                                <div class="d-flex gap-2 align-items-center">
                                    <i class="fa-solid fa-box-open"></i>
                                    <p class="mb-0">Miễn Phí Gói Quà</p>
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
                        <div class="mt-3 mb-3 d-flex align-items-center gap-3" style="cursor: pointer;">
                            <i class="fa-regular fa-heart fa-lg"></i>
                            Yêu thích
                        </div>
                        <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                        <!-- if else to show each case, if have product, show below. If out of stock, show sold out -->
                        <div class="mt-3" id="show_buy">
                            <div class="mb-3">
                                <input type="number" class="input_cart_width" onkeydown="handleKeyDown(event)" onpaste="handlePaste(event)"
                                       name="qty" value="1" min="1" id="quantityBuy">
                            </div>
                            <div class="d-flex gap-3 align-items-center">
                                <button class="btn btn-outline-dark btn-lg custom_btn_add" 
                                        data-bs-toggle="modal" data-bs-target="#cartModal"
                                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                                        onclick="addToCartDetail('${product.name}', '${product.images.get(0).image}')">Thêm vào giỏ hàng</button>
                                        <button class="btn btn-danger btn-lg custom_btn_buynow" onclick="buyNow('${product.name}', '${product.images.get(0).image}')">Mua ngay</button>
                            </div>
                        </div>
                        <div class="mt-3" id="show_out">
                            <button class="btn btn-outline-dark btn-lg" style="cursor: not-allowed;">Hết hàng</button>
                        </div>
                    </div>
                </div>

                <!-- Product Detail Go here -->
                <div class="mt-4">
                    <div style="font-size: 22px; color: #333; margin-bottom: 10px; font-weight: bold;">
                        Chi tiết sản phẩm
                    </div>
                    <div class="mt-4 mb-5">
                        <p
                            style="max-width: 700px; width: 100%; color: #777777; font-size: 14px; line-height: 24px; margin-bottom: 10px;">
                            Không còn phải tán loạn lên tìm chìa khóa mỗi ngày vì đã có em móc khóa bông êm mềm, đáng yêu nhắc
                            nhở bạn hàng ngày.
                            Với chất liệu bông mềm mịn, được làm thủ công tỉ mỉ từng chi tiết nên các bé vô cùng dễ thương, sắc
                            nét đến từng chi tiết.
                            Thích hợp dùng để làm móc chìa khóa hoặc trang trí túi, balo đều xinh hết nấc.
                        </p>
                        <p style="margin-top: 16px; font-weight: 600; margin-bottom: 4px;">Thông tin sản phẩm</p>
                        <p style="max-width: 700px; width: 100%; color: #777777; font-size: 14px; line-height: 24px;">More
                            detail about product</p>
                    </div>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>

                    <!-- Slider in same category here  -->
                    <div class="mt-4">
                        <div class="mb-3 d-flex align-items-center justify-content-between gap-2">
                            <div style="font-size: 22px; color: #333; margin-bottom: 10px; font-weight: bold;">
                                CÓ THỂ BẠN CŨNG QUAN TÂM
                            </div>
                            <div class="slider-wrapper d-flex justify-content-between align-items-center">
                                <!-- Custom button -->
                                <div>
                                    <a class="btn mr-1" href="#recipeCarousel" role="button" data-bs-slide="prev"
                                       id="prevButton">
                                        <i class="fa-solid fa-angle-left"></i>
                                    </a>
                                    <a class="btn " href="#recipeCarousel" role="button" data-bs-slide="next" id="nextButton">
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Carousel of list items here  -->
                        <div class="text-center mb-5">
                            <div class="row mx-auto my-auto justify-content-center">
                                <div id="recipeCarousel" class="carousel slide">
                                    <div class="carousel-inner" role="listbox">
                                        <!-- List of carousel will show here -->
                                        <div class="carousel-item product__item active">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 1
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="carousel-item product__item">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 2
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="carousel-item product__item">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 3
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="carousel-item product__item">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 4
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="carousel-item product__item">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 5
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="carousel-item product__item">
                                            <div class="col-md-3 new-product" style="padding-left: 8px;padding-right: 8px;">
                                                <div class="product-cart-wrapper text-start">
                                                    <div class="position-relative">
                                                        <img src="https://bizweb.dktcdn.net/thumb/large/100/450/808/products/a55404c7-9b14-45ee-9e9d-a91893f5d952.jpg?v=1682419487663"
                                                             alt="new-prd" class="product-card-img w-100 h-auto" />
                                                        <div class="love-prd">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                 viewBox="0 0 24 24" fill="none">
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                                  fill="#333333"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="action-prd-cart">
                                                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                                                    </div>

                                                    <div class="prd-name">
                                                        BÉ LỪA BÔNG WINNIE 6
                                                    </div>
                                                    <div class="prd-description">
                                                        * Thông tin chi tiết bé Lừa bông: - Chất liệu: Lông xù siêu mềm mịn.
                                                    </div>
                                                    <div class="prd-price">
                                                        390000₫
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="AbsoluteBtn.jsp" %>
        </div>
        <%@ include file="../../includes/footer.jsp" %>
        <script>
            let items = document.querySelectorAll('.carousel .product__item');

            items.forEach((el) => {
                const minPerSlide = 4;
                let next = el.nextElementSibling;
                for (var i = 1; i < minPerSlide; i++) {
                    if (!next) {
                        // wrap carousel by using first child
                        next = items[0];
                    }
                    let cloneChild = next.cloneNode(true);
                    el.appendChild(cloneChild.children[0]);
                    next = next.nextElementSibling;
                }
            });


        </script>
        <script>
            var productID = '<c:out value="${product.productId}"/>';
            var typeValue = '<c:out value="${product.classValue}"/>';
            var priceValue = '<c:out value="${product.price}"/>';

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

            <c:if test="${product.children.size() != 0}">
            // Get all the custom__select__type elements
            var selectTypes = document.querySelectorAll('.custom__select__type');

            selectTypes.forEach(function (element) {
                element.addEventListener('click', function () {
                    // Remove the "active" class from all elements
                    selectTypes.forEach(function (el) {
                        el.classList.remove('active');
                    });

                    // Add the "active" class to the clicked element
                    this.classList.add('active');

                    productID = this.dataset.productid;
                    typeValue = this.dataset.producttypevalue;
                    priceValue = this.dataset.productprice;

                    //display price according to type
                    var price = parseFloat(priceValue);
                    var formmatPrice = price.toFixed(3);
                    document.getElementById('proPrice').textContent = formmatPrice.toString();

                    selectTypes.forEach(function (e1) {
                        if (e1.classList.contains('active')) {
                            if (e1.classList.contains('soldout')) {
                                document.getElementById('show_out').style.display = 'block';
                                document.getElementById('show_buy').style.display = 'none';
                            } else {
                                document.getElementById('show_out').style.display = 'none';
                                document.getElementById('show_buy').style.display = 'block';
                            }
                            // Exit the loop once the desired condition is met
                            return;
                        }
                    });

                });
            });

            for (var i = 0; i < selectTypes.length; i++) {
                if (selectTypes[i].classList.contains('active')) {
                    if (selectTypes[i].classList.contains('soldout')) {
                        document.getElementById('show_out').style.display = 'block';
                        document.getElementById('show_buy').style.display = 'none';
                    } else {
                        document.getElementById('show_out').style.display = 'none';
                        document.getElementById('show_buy').style.display = 'block';
                    }
                    break;
                }
            }
            </c:if>
            <c:if test="${product.quantity != 0}">
            document.getElementById('show_out').style.display = 'none';
            document.getElementById('show_buy').style.display = 'block';
            </c:if>
            <c:if test="${product.quantity == 0}">
            document.getElementById('show_out').style.display = 'block';
            document.getElementById('show_buy').style.display = 'none';
            </c:if>
            function addToCartDetail(name, image) {
                var quantity = document.getElementById('quantityBuy').value;
                addToCart(productID, name, image, priceValue, quantity, typeValue);
            }
            function buyNow(name, image) {
                var quantity = document.getElementById('quantityBuy').value;
                addToCart(productID, name, image, priceValue, quantity, typeValue);
                window.location.href = "orderCustomer";
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>