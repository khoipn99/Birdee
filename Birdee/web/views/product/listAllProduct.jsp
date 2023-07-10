<%-- 
    Document   : listAllProduct
    Created on : Jun 28, 2023, 1:43:04 AM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/backtotop.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allcollection.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="script.js"></script>
    </head>

    <body>
        <!-- This container belong to HEADER -->
        <%@include file="../../includes/header.jsp" %>

        <div class="container pt-3 pb-5">
            <div class="mt-3 mb-3" style="font-size: 24px; font-weight: bold; color: #333;">Tất cả sản phẩm </div>
            <div class="d-flex justify-content-between align-items-center"
                 style="border-top: 1px solid #00000030;border-bottom: 1px solid #00000030; padding-top: 4px; padding-bottom: 4px;">
                <div class="filter-text">Sắp xếp theo</div>
                <div>
                    <form id="frm-sort" action="product" method="post">
                        <input type="hidden" value="sort" name="action">
                        <select class="form-select" aria-label="Default select example" onchange="sortProduct()" name="sortID">
                            <option value="-1" 
                                    <c:if test="${sortID == -1}">selected</c:if>
                                        >Sắp xếp</option>
                                    <option value="1"
                                    <c:if test="${sortID == 1}">selected</c:if>
                                        >Giá tăng dần</option>
                                    <option value="2"
                                    <c:if test="${sortID == 2}">selected</c:if>
                                        >Giá giảm dần</option>
                                    <option value="3"
                                    <c:if test="${sortID == 3}">selected</c:if>
                                        >Theo tên A-Z</option>
                                    <option value="4"
                                    <c:if test="${sortID == 4}">selected</c:if>
                                        >Theo tên Z-A</option>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="list-products-wrapper row mt-4">
                    <div class="list-filter-left-content d-none d-lg-block col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <!--                    <div class="mb-3">
                                                <a href="#" class="text-decoration-none text-black">
                                                    <h6 class="text-uppercase">For him</h6>
                                                </a>
                                                <a href="#" class="text-decoration-none text-black">
                                                    <h6 class="text-uppercase">For her</h6>
                                                </a>
                                                <a href="#" class="text-decoration-none text-black">
                                                    <h6 class="text-uppercase">For life</h6>
                                                </a>
                                            </div>-->
                        <div style="height: 1px; width: 100%; background-color: #00000030; margin-bottom: 16px;"></div>
                        <!--                    <div class="mb-3">
                                                <h6 class="text-uppercase">Cấp độ thương hiệu</h6>
                                                <ul style="padding-left: 0;">
                                                    <li class="list-group-item">
                                                        <label class="d-flex align-items-center gap-2">
                                                            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                                            <img
                                                                src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/5-sao.svg?1678953238323" />
                                                            5 sao
                                                        </label>
                                                    </li>
                                                    <li class="list-group-item d-flex align-items-center gap-2">
                                                        <label class="d-flex align-items-center gap-2">
                                                            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                                            <img
                                                                src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/4-sao.svg?1678953238323" />
                                                            4 sao
                                                        </label>
                                                    </li>
                                                    <li class="list-group-item d-flex align-items-center gap-2">
                                                        <label class="d-flex align-items-center gap-2">
                                                            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                                            <img
                                                                src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/3-sao.svg?1678953238323" />
                                                            3 sao
                                                        </label>
                                                    </li>
                                                    <li class="list-group-item d-flex align-items-center gap-2">
                                                        <label class="d-flex align-items-center gap-2">
                                                            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                                            <img
                                                                src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/2-sao.svg?1678953238323" />
                                                            2 sao
                                                        </label>
                                                    </li>
                                                    <li class="list-group-item d-flex align-items-center gap-2">
                                                        <label class="d-flex align-items-center gap-2">
                                                            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                                            <img
                                                                src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/1-sao.svg?1678953238323" />
                                                            1 sao
                                                        </label>
                                                    </li>
                                                </ul>
                                            </div>-->
                        <!--<div style="height: 1px; width: 100%; background-color: #00000030; margin-bottom: 16px;"></div>-->
                        <div>
                            <h9 class="text-uppercase">Khoảng giá</h9>
                            <form action="product" method="post">
                                <input type="hidden" name="action" value="search">
                                <div class="wrapper">
                                    <div class="price-input">
                                        <div class="field">
                                            <input type="number" class="input-min price" name="minPrice" value="${minPrice}"
                                               style="border: none;outline: none">
                                    </div>
                                    <div class="separator">-</div>
                                    <div class="field">
                                        <input type="number" class="input-max price" name="maxPrice" value="${maxPrice}"
                                               style="border: none;outline: none">.000đ
                                    </div>
                                </div>
                                <div class="slider">
                                    <div class="progress"></div>
                                </div>
                                <div class="range-input">
                                    <input type="range" class="range-min" min="0" max="10000000" 
                                           value="${minPrice}"
                                           step="100">
                                    <input type="range" class="range-max" min="0" max="10000000" 
                                           value="${maxPrice}"
                                           step="100">
                                </div>
                            </div>
                            <input type="hidden" name="action" value="searchByPrice" />
                            <button type="submit" class="btn btn-dark mt-3">Lọc giá</button>
                        </form>
                    </div>
                </div>
                <div class="new-product col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 row">
                    <c:forEach items="${listProducts}" var="p">
                        <div class="col-6 col-md-4 product-cart-wrapper">
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



                    <div class="d-flex justify-content-center mt-5">
                        <nav aria-label="Page navigation example col-12">
                            <ul class="pagination">
                                <%--For displaying Previous link except for the 1st page --%>
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="product?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <%--For displaying Page numbers. The when condition does not display
                                            a link for the current page--%>
                                <c:forEach begin="1" end="${noOfPages}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage eq i}"> 
                                            <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="product?page=${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                <%--For displaying Next link --%>
                                <c:if test="${currentPage lt noOfPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="product?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
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

    <!-- Script to filter price -->
    <script>
                                function sortProduct() {
                                    document.getElementById('frm-sort').submit();
                                }

                                const rangeInput = document.querySelectorAll(".range-input input"),
                                        priceInput = document.querySelectorAll(".price-input input"),
                                        range = document.querySelector(".slider .progress");
                                let priceGap = 1000;

                                priceInput.forEach((input) => {
                                    input.addEventListener("input", (e) => {
                                        let minPrice = parseInt(priceInput[0].value),
                                                maxPrice = parseInt(priceInput[1].value);

                                        if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
                                            if (e.target.className === "input-min") {
                                                rangeInput[0].value = minPrice;
                                                range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
                                            } else {
                                                rangeInput[1].value = maxPrice;
                                                range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                                            }
                                        }
                                    });
                                });

                                rangeInput.forEach((input) => {
                                    input.addEventListener("input", (e) => {
                                        let minVal = parseInt(rangeInput[0].value),
                                                maxVal = parseInt(rangeInput[1].value);

                                        if (maxVal - minVal < priceGap) {
                                            if (e.target.className === "range-min") {
                                                rangeInput[0].value = maxVal - priceGap;
                                            } else {
                                                rangeInput[1].value = minVal + priceGap;
                                            }
                                        } else {
                                            priceInput[0].value = minVal;
                                            priceInput[1].value = maxVal;
                                            range.style.left = (minVal / rangeInput[0].max) * 100 + "%";
                                            range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
                                        }
                                    });
                                });
                                function viewDetail(id) {
                                    window.location.href = "productDetails?productID=" + id;
                                }
                                function addCart() {
                                    alert("Thêm vào giỏ hàng thành công");
                                }
    </script>

</html>
