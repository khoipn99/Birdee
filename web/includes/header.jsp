<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="../js/script.js" type="text/javascript"></script>
<style>
    .product-card-img:hover {
        cursor: pointer;
    }
    .prd-name:hover{
        cursor: pointer;
        color: orange;
    }
</style>
<link href="../css/layout.css" rel="stylesheet" type="text/css"/>
<!-- header.jsp -->
<header class="header d-flex flex-column">
    <div class="middle-header border border-bottom-1 order-2 order-md-1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-3 col-lg-3 d-lg-block d-none block-logo">
                    <a href="home" class="logo">
                        <img src="//bizweb.dktcdn.net/100/450/808/themes/855625/assets/logo.png?1681832246171"
                             alt="Meeko">
                    </a>
                </div>
                <div class="col-xl-7 col-lg-6 block-search">
                    <div class="input-search-wrapper">
                        <form id="frm-seachtxt" action="searchByText" method="get">
                            <input type="text" name="textSearch" class="input-search rounded-pill" id="floatingInput"
                                   placeholder="Tìm kiếm...">
                            <div class="search-icon" onclick="submitTxtSearch()">
                                <i class="fa-solid fa-magnifying-glass" onclick="submitTxtSearch()"></i>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 d-lg-flex align-items-center d-none header-right justify-content-end gap-3">
                    <div class="dropdown">
                        <i class="fa-regular fa-user fa-lg" data-bs-toggle="dropdown"></i>
                        <ul class="dropdown-menu">
                            <c:if test="${sessionScope.account == null}">
                                <li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
                                <li><a class="dropdown-item" href="/register">Đăng ký</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                <li><a class="dropdown-item" onclick="getInformation()">${sessionScope.account.fullName}</a></li>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                </c:if>
                        </ul>
                    </div>
                    <i class="fa-regular fa-heart fa-lg" onclick="notFound()"></i>
                    <button class="navbar-toggler" type="button" data-bs-toggle="modal" data-bs-target="#cartModal"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                    </button>
                    <!-- Modal mobile nav responsive -->
                    <div class="modal right fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">Giỏ hàng</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <!-- List items in Cart Will Show here -->
                                <div class="modal-body" id="cart">
                                    <!-- Firt item -->
                                    <div id="product" style="display: none">
                                        <div class="mb-2 d-flex gap-2">
                                            <div class="">
                                                <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image"
                                                   title="item-cart-1">
                                                    <img id="productImage" class="img_item_in_cart"
                                                         src="https://bizweb.dktcdn.net/thumb/compact/100/450/808/products/cfa1d6c5-ffa0-4fcd-8349-51e83792254e.jpg"
                                                         alt="Bé lừa bông Winnie">
                                                </a>
                                            </div>
                                            <div class="w-100">
                                                <h6 class="mb-1" id="productName">Bé lừa bông Winnie</h6>
                                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                    <div class="cart_quantity" id="productValue">
                                                    </div>
                                                </div>
                                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                    <div class="cart_quantity">
                                                        Số lượng
                                                    </div>
                                                    <p class="mb-0" style="color: #c83252; font-weight: bold;" id="productPrice">300000 đ</p>
                                                </div>
                                                <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                    <div class="input-group">
                                                        <input id="productQuantity" type="number" min="1" class="input_cart_width" name="quantity" value="1"
                                                               onkeydown="handleKeyDown(event)" onpaste="handlePaste(event)"/>
                                                    </div>
                                                    <p class="mb-0 cart_quantity prd-name" id="deleteProduct">xóa</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- List all item -->
                                    <c:forEach var="ord" items="${sessionScope.cart}">
                                        <div id="product_${ord.product.productId}" style="display: block">
                                            <div class="mb-2 d-flex gap-2">
                                                <div class="">
                                                    <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image"
                                                       title="item-cart-1">
                                                        <img id="productImage" class="img_item_in_cart"
                                                             src="${ord.product.images.get(0).image}"
                                                             alt="Bé lừa bông Winnie">
                                                    </a>
                                                </div>
                                                <div class="w-100">
                                                    <h6 class="mb-1" id="productName">${ord.product.name}</h6>
                                                    <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                        <div class="cart_quantity" id="productValue_${ord.product.productId}">
                                                            ${ord.product.classValue}
                                                        </div>
                                                    </div>  
                                                    <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                        <div class="cart_quantity">
                                                            Số lượng
                                                        </div>
                                                        <div class="d-flex">
                                                            <c:set var="totalPrice" value="${ord.product.price * ord.quantity}"></c:set>
                                                                <p class="mb-0" style="color: #c83252; font-weight: bold;" id="productPrice">
                                                                <fmt:formatNumber value="${totalPrice}" pattern="#,##0.000" var="formattedNumber" />
                                                                ${formattedNumber}
                                                            </p>
                                                            <p class="mb-0" style="color: #c83252; font-weight: bold;">đ</p>
                                                        </div>
                                                    </div>
                                                    <div class="mb-1 d-flex justify-content-between gap align-items-center">
                                                        <div class="input-group">
                                                            <input id="productQuantity_${ord.product.productId}" min="1" onkeydown="handleKeyDown(event)" onpaste="handlePaste(event)"
                                                                   type="number" class="input_cart_width" name="quantity" value="${ord.quantity}" oninput="handleQuantityChange('${ord.product.productId}','${ord.product.price}')">
                                                        </div>
                                                        <p class="mb-0 cart_quantity prd-name" id="deleteProduct_${ord.product.productId}" onclick="deleteProduct('${ord.product.productId}', '${ord.product.price}')">xóa</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- List items in Cart Will Show here -->

                                <div class="modal-footer d-block w-100">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6>Tổng tiền:</h6>
                                        <div class="d-flex">
                                            <p style="color: #c83252; font-weight: bold;" id="totalPrice">
                                            </p>
                                            <p style="color: #c83252; font-weight: bold;">
                                                đ
                                            </p>
                                        </div>
                                    </div>
                                    <button class="btn btn-danger w-100" onclick="orderCart()">Thanh toán</button>
                                </div><!-- modal-content -->
                            </div><!-- modal-dialog -->
                        </div><!-- modal -->
                    </div>
                </div>
            </div>
        </div>
        <div class="site-nav border border-bottom-1 order-1 order-md-2">
            <div class="container-navbar">
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="left-side d-flex justify-content-between align-items-center">
                            <a href="home" class="logo d-lg-none d-block">
                                <img src="//bizweb.dktcdn.net/100/450/808/themes/855625/assets/logo.png?1681832246171"
                                     alt="Meeko">
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
                                <li class="nav-item">
                                    <a class="nav-link dropdown-toggle" data-bs-toggle="modal"
                                       data-bs-target="#exampleModalCenteredScrollable" style="cursor: pointer;">Sản
                                        phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="premium">Premium</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="notFound">Blog</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="notFound">Story</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
</header>

<!-- Modal mobile nav responsive -->
<div class="modal left fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Left Sidebar</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Left Side bar
                </p>
            </div>
        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->
<!-- Modal mobile nav responsive-->

<!-- This section used to open modal when click on "Sản phẩm". Remember cut this section and put in on to header section  -->
<div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1"
     aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">Tất cả thể loại</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="height: 600px;">
                <div class="row" style="height: 100%;">
                    <div class="col-3" style="height: 100%; overflow-y: auto; overflow-x: hidden;">
                        <!-- This section UL For each Category -->
                        <ul class="" style="list-style: none; padding-left: 0px;">
                            <li style="list-style: none;">
                                <a class="heading__category" href="listAllProduct">
                                    Tất cả sản phẩm
                                </a>
                            </li>
                            <c:forEach items="${sessionScope.tags}" var="t">
                                <ul class="" style="list-style: none; padding-left: 0px;">
                                    <li style="list-style: none;">
                                        <a class="heading__category" href="searchByTag?tagID=${t.tagId}">
                                            ${t.tagName}
                                        </a>
                                    </li>
                                    <ul style="list-style: none; padding-left: 0px; margin-top: 12px;">
                                        <c:forEach var="c" items="${t.categories}">
                                            <li style="list-style: none; margin-bottom: 8px;">
                                                <a class="heading__sub_category" href="searchByCategory?categoryID=${c.categoryId}">
                                                    ${c.categoryName}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </ul>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-9 row" style="height: 100%; overflow: hidden;">
                        <div class="col-6">
                            <img style="width: 100%; height: 100%;"
                                 src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_1.jpg?1681832246171"
                                 alt="meeko" />
                        </div>
                        <div class="col-6">
                            <div style="height: 50%;">
                                <img style="width: 100%; height: 96%; object-fit: cover;"
                                     src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_2.jpg?1681832246171" />
                            </div>
                            <div class="row" style="height: 50%;">
                                <div class="col-6">
                                    <img style="width: 100%; height: 100%; object-fit: cover;"
                                         src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_3.jpg?1681832246171"
                                         alt="meeko">
                                </div>
                                <div class="col-6" style="height: 100%;">
                                    <img style="width: 100%; height: 100%; object-fit: cover;"
                                         src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_4.jpg?1681832246171"
                                         alt="meeko">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>