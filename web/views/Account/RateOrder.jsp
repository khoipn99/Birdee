<%-- 
    Document   : RateOrder
    Created on : Jul 12, 2023, 9:48:17 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div style="margin: 5%">
            <c:if test="${list.size() != 0}">
                <c:forEach var="o" items="${list}">
                    <!-- Firt item -->
                    <div id="product m-3">
                        <div class="mb-2 d-flex gap-2">
                            <div class="">
                                <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image"
                                   title="item-cart-1">
                                    <img id="productImage" class="img_item_in_cart"
                                         src="${o.product.images.get(0).image}"
                                         alt="Bé lừa bông Winnie">
                                </a>
                            </div>
                            <div class="w-100">
                                <h6 class="mb-1" id="productName">${o.product.name}</h6>
                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                    <div class="cart_quantity" id="productValue">
                                    </div>
                                </div>
                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                    <div class="cart_quantity">
                                        Số lượng
                                    </div>
                                </div>
                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                    <div class="input-group">
                                        <input id="productQuantity" type="number" min="1" class="input_cart_width" name="quantity" value="${o.quantity}" readonly/>
                                        <a href="rateProduct?id=${o.oderDetailsID}" style="margin-left: 5%">Đánh giá</a>
                                    </div>
                                </div>
                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${list.size() == 0}">
                <div class="d-flex justify-content-center">
                    <p style="color: red">Không còn sản phẩm để đánh giá</p>
                </div>
            </c:if>
        </div>
        <%@ include file="../../includes/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>
</html>
