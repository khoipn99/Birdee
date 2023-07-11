<%-- 
    Document   : OrderDetails.jsp
    Created on : Jun 18, 2023, 6:29:59 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CartDetail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/layout.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/script.js" type="text/javascript"></script>
        <script src="script.js"></script>
        <style>
            .product-card-img:hover {
                cursor: pointer;
            }
            .prd-name:hover{
                cursor: pointer;
                color: orange;
            }
        </style>
    </head>

    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div style="padding-left: 64px; padding-right: 64px; padding-top: 14px; width: 100%;">
            <h3 class="modal-title" id="myModalLabel"
                style="font-weight: bold; border-bottom: 1px solid #00000050; padding-bottom: 12px;">Giỏ hàng</h3>

            <!-- List items in Cart Will Show here -->
            <div>
                <c:forEach var="ord" items="${sessionScope.cart}">
                    <div class="mb-2 d-flex gap-2"
                         style="padding-top: 16px; padding-bottom: 16px; border-bottom: 1px solid #00000050;">
                        <div class="">
                            <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image" title="item-cart-1">
                                <img class="" style="width: 80px; height: 80px; border-radius: 8px;"
                                     src="${ord.product.images.get(0).image}"
                                     alt="Bé lừa bông Winnie">
                            </a>
                        </div>
                        <div class="w-100">
                            <h6 class="mb-1">${ord.product.name}</h6>
                            <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                <div class="cart_quantity">
                                    Số lượng
                                </div>
                                <p class="mb-0" style="color: #c83252; font-weight: bold;">
                                    <fmt:formatNumber value="${ord.product.price * ord.quantity}" pattern="#,##0.000" var="formattedNumber" />
                                    ${formattedNumber}đ
                                </p>
                            </div>
                            <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                <div class="input-group">
                                    <input type="number" min="1" class="input_cart_width" name="qty" value="${ord.quantity}" onkeydown="handleKeyDown(event)" onpaste="handlePaste(event)">
                                </div>
                                <p class="mb-0 cart_quantity">Xóa</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- List items in Cart Will Show here -->

            <div class="d-block w-100 mt-5">
                <div class="d-flex justify-content-between align-items-center">
                    <h5>Tổng tiền:</h5>
                    <p id="totalPrice" style="color: #c83252; font-weight: bold; "></p>
                </div>
                <form action="orderCustomer" method="get">
                    <button type="submit" class="btn btn-danger w-100 mt-5">Thanh toán</button>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                                        var cookiesName = 'cart';
                                        var cookiesPrice = 'totalP';

            <c:if test="${sessionScope.account != null}">
                                        cookiesName = cookiesName + '<c:out value="${sessionScope.account.userID}"></c:out>';
                                        cookiesPrice = cookiesPrice + '<c:out value="${sessionScope.account.userID}"></c:out>';
            </c:if>
                                        var totalPriceValue = getCookie(cookiesPrice);
                                        if (totalPriceValue !== '') {
                                            printTotalPrice(totalPriceValue);
                                        }

                                        function notFound() {
                                            window.location.href = "notFound";
                                        }

                                        function getInformation() {
                                            window.location.href = "userProfile";
                                        }
                                        function submitTxtSearch() {
                                            document.getElementById('frm-seachtxt').submit();
                                        }
                                        function addToCart(id, name, image, price, quantity, typeValue) {
                                            //Lay thong tin ve id va so luong cua san pham
                                            //lay ra chuoi cookie co ten la cart
                                            var cartValue = getCookie(cookiesName) || '';
                                            if (cartValue !== '') {
                                                //Tach chuoi san phan trong cart
                                                var products = cartValue.split("_");
                                                var isExist = false;
                                                //duyet tu dau den cuoi mang
                                                for (var i = 0; i < products.length; i++) {
                                                    //lay ra thong tin cua tung san pham trong cart
                                                    var product = products[i];
                                                    //tach chuoi
                                                    var parts = product.split("-");
                                                    //kiem tra xem id da ton tai hay chua
                                                    if (parts[0] === id) {
                                                        //tinh toan lai gia tien dua tren so luong hang moi
                                                        var existingQuantity = parseInt(parts[1]);

                                                        var totalQuantity = existingQuantity + parseInt(quantity);

                                                        var totalPrice = parseFloat(price) * totalQuantity;
                                                        //fomart lai thanh dinh dang xx.xxx
                                                        var formattedPrice = totalPrice.toFixed(3);

                                                        var existCart = document.getElementById('product_' + id);
                                                        //thay doi gia cua san pham
                                                        existCart.querySelector('#productPrice').innerHTML = formattedPrice.toString();
                                                        //thay doi so luong cua san pham
                                                        existCart.querySelector('#productQuantity_' + id).value = totalQuantity.toString();


                                                        //cap nhat lai so luong san pham
                                                        cartValue = cartValue.replace(id + "-" + existingQuantity, id + "-" + totalQuantity);

                                                        //ap nhat lai cokies
                                                        document.cookie = cookiesName + "=" + cartValue + "; path=/";
                                                        isExist = true;

                                                        //cap nhat lai tong hoa don
                                                        var newPrice = parseFloat(price) * parseInt(quantity);
                                                        totalPrice = updateTotalPrice(newPrice);
                                                        printTotalPrice(totalPrice.toString());
                                                        break;
                                                    }
                                                }
                                                //neu san pham do chua ton tai tao san pham moi
                                                if (!isExist) {
                                                    createProduct(id, name, image, price, quantity, cartValue, typeValue);
                                                    var totalPrice = updateTotalPrice(parseFloat(price));
                                                    printTotalPrice(totalPrice.toString());
                                                }
                                            } else {
                                                createProduct(id, name, image, price, quantity, cartValue, typeValue);
                                                printTotalPrice(price);
                                            }

                                        }

                                        function getCookie(cookieName) {
                                            var name = cookieName + '=';
                                            var decodedCookie = decodeURIComponent(document.cookie);
                                            var cookieArray = decodedCookie.split(';');
                                            for (var i = 0; i < cookieArray.length; i++) {
                                                var cookie = cookieArray[i].trim();
                                                if (cookie.indexOf(name) === 0) {
                                                    return cookie.substring(name.length, cookie.length);
                                                }
                                            }
                                            return '';
                                        }

                                        function createProduct(id, name, image, price, quantity, cartValue, typeValue) {
                                            var targetDiv = document.getElementById('cart');
                                            var sourceDiv = document.getElementById('product');


                                            // Clone khoi div duoc tao san
                                            var newDiv = sourceDiv.cloneNode(true);

                                            //thay doi ten cua san pham
                                            newDiv.querySelector('#productName').innerHTML = name;
                                            //thay doi anh san pham
                                            newDiv.querySelector('#productImage').src = image;
                                            //thay doi gia cua san pham
                                            var valuePrice = parseFloat(price);
                                            var formattedPrice = valuePrice.toFixed(3);
                                            newDiv.querySelector('#productPrice').innerHTML = formattedPrice.toString();
                                            newDiv.querySelector('#productQuantity').id = 'productQuantity_' + id;
                                            newDiv.querySelector('#productValue').id = 'productValue_' + id;
                                            newDiv.querySelector('#deleteProduct').id = 'deleteProduct_' + id;
                                            //thay doi so luong cua san pham
                                            newDiv.querySelector('#productQuantity_' + id).value = quantity;

                                            //them su kien thay doi so luong
                                            newDiv.querySelector('#productQuantity_' + id).addEventListener('input', function () {
                                                handleQuantityChange(id, price);
                                            });
                                            newDiv.querySelector('#deleteProduct_' + id).addEventListener('click', function () {
                                                deleteProduct(id, price);
                                            });
                                            //thay doi loai cua san pham
                                            if (typeValue !== '') {
                                                newDiv.querySelector('#productValue_' + id).innerHTML = typeValue;
                                            }
                                            // thay doi ten cua khoi div
                                            newDiv.id = 'product_' + id;

                                            // Hien thi khoi div
                                            newDiv.style.display = 'block';

                                            var productIDValue = id + "-" + quantity;
                                            //tao khoi div trong gio hang
                                            targetDiv.appendChild(newDiv);
                                            // Concatenate the productIDValue with the existing cartValue
                                            var newCartValue = cartValue + "_" + productIDValue;
                                            //them vao cookie
                                            document.cookie = cookiesName + "=" + newCartValue + "; path=/";
                                            ;
                                        }

                                        function printTotalPrice(totalPrice) {
                                            var price = parseFloat(totalPrice);
                                            var formattedPrice = price.toFixed(3);
                                            document.cookie = cookiesPrice + "=" + totalPrice + "; path=/";
                                            document.getElementById('totalPrice').innerHTML = formattedPrice.toString();
                                        }

                                        function updateTotalPrice(price) {
                                            var oldTotalPrice = parseFloat(document.getElementById('totalPrice').textContent);
                                            return (oldTotalPrice + price);
                                        }

                                        function handleQuantityChange(id, priceString) {
                                            var input = document.getElementById('productQuantity_' + id);
                                            var price = parseFloat(priceString);

                                            var newQuantity = input.value;
                                            var existingQuantity = 0;
                                            var cartValue = getCookie(cookiesName) || '';
                                            if (cartValue !== '') {
                                                //Tach chuoi san phan trong cart
                                                var products = cartValue.split("_");
                                                //duyet tu dau den cuoi mang
                                                for (var i = 0; i < products.length; i++) {
                                                    //lay ra thong tin cua tung san pham trong cart
                                                    var product = products[i];
                                                    //tach chuoi
                                                    var parts = product.split("-");
                                                    //kiem tra xem id da ton tai hay chua
                                                    if (parts[0] === id) {
                                                        //lay thong tin so luong cu
                                                        existingQuantity = parseInt(parts[1]);
                                                        //tinh toan so luong thay doi
                                                        var changeQuantity = newQuantity - existingQuantity;

                                                        //tinh toan lai so tien thay doi
                                                        var changePrice = parseFloat(price) * changeQuantity;
                                                        var totalPrice = parseFloat(price) * newQuantity;
                                                        //fomart lai thanh dinh dang xx.xxx
                                                        var formattedPrice = totalPrice.toFixed(3);

                                                        var existCart = document.getElementById('product_' + id);
                                                        //thay doi gia cua san pham
                                                        existCart.querySelector('#productPrice').innerHTML = formattedPrice.toString();

                                                        //cap nhat lai so luong san pham
                                                        cartValue = cartValue.replace(id + "-" + existingQuantity, id + "-" + newQuantity);
                                                        //ap nhat lai cokies
                                                        document.cookie = cookiesName + "=" + cartValue + "; path=/";

                                                        //cap nhat lai tong hoa don
                                                        totalPrice = updateTotalPrice(changePrice);
                                                        printTotalPrice(totalPrice.toString());
                                                        break;
                                                    }
                                                }
                                            }
                                        }

                                        function deleteProduct(id, price) {
                                            var div = document.getElementById('product_' + id);
                                            if (div) {
                                                div.remove();
                                                var cartValue = getCookie(cookiesName) || '';
                                                if (cartValue !== '') {
                                                    //Tach chuoi san phan trong cart
                                                    var products = cartValue.split("_");
                                                    //duyet tu dau den cuoi mang
                                                    for (var i = 0; i < products.length; i++) {
                                                        //lay ra thong tin cua tung san pham trong cart
                                                        var product = products[i];
                                                        //tach chuoi
                                                        var parts = product.split("-");
                                                        //kiem tra xem id da ton tai hay chua
                                                        if (parts[0] === id) {

                                                            //cap nhat lai so luong san pham
                                                            cartValue = cartValue.replace("_" + parts[0] + "-" + parts[1], '');
                                                            //ap nhat lai cokies
                                                            document.cookie = cookiesName + "=" + cartValue + "; path=/";
                                                            var changePrice = parseFloat(price) * parseInt(parts[1]);
                                                            //cap nhat lai tong hoa don
                                                            var totalPrice = updateTotalPrice(-changePrice);
                                                            printTotalPrice(totalPrice.toString());
                                                            break;
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        function orderCart() {
            <c:if test="${sessionScope.account == null}">
                                            alert('Bạn phải đăng nhập để sử dụng tính năng này');
            </c:if>
            <c:if test="${sessionScope.account != null}">
                                            window.location.href = "orderCustomer";
            </c:if>
                                        }
        </script>
        <%@ include file="../../includes/footer.jsp" %>
    </body>

</html>
