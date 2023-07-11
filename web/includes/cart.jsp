<%-- 
    Document   : cart
    Created on : Jul 9, 2023, 8:39:35 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
