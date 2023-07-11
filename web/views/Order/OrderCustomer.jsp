<%-- 
    Document   : OrderCustomer
    Created on : Jun 18, 2023, 6:10:12 PM
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
        <title>Checkout</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>

    <body>
        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <a href="/">
                        <img class="logo__image logo__image--medium " alt="Meeko" style="width: 340px;"
                             src="//bizweb.dktcdn.net/100/450/808/themes/855625/assets/logo.png?1681832246171">
                    </a>
                </div>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-dark">Đơn hàng</span>
                            <!-- Number of items in cart  -->
                            <span class="badge bg-dark rounded-pill">${sessionScope.totalProduct}</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <c:forEach items="${sessionScope.cart}" var="ord">
                                <div>
                                    <li class="list-group-item d-flex justify-content-between align-items-center lh-sm">
                                        <div class="d-flex align-items-center gap-4">
                                            <img src="${ord.product.images.get(0).image}"
                                                 class=""
                                                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px;" />
                                            <span class="product-thumbnail__quantity">${ord.quantity}</span>
                                            <h6 class="my-0">${ord.product.name}</h6>
                                        </div>
                                        <span class="text-muted">
                                            <fmt:formatNumber value="${ord.product.price * ord.quantity}" pattern="#,##0.000" var="formattedNumber" />
                                            ${formattedNumber}đ
                                        </span>
                                    </li>
                                </div>
                            </c:forEach>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (VND)</span>
                                <strong class="pr-0 mr-0" id="totalPrice"></strong>
                            </li>
                        </ul>

                        <div class="p-2 d-flex justify-content-between align-items-center gap-2">
                            <a href="orderDetail" style="color: black; text-decoration: none;">
                                <i class="fa-solid fa-arrow-left-long"></i>
                                Quay về giỏ hàng
                            </a>
                            <button type="submit" class="btn btn-dark" onclick="orderProduct()">Đặt hàng</button>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-8 row g-5 mt-0">
                        <form class="row" action="orderCustomer" method="post" id="orderDetailCustomer">
                            <div class="col-lg-6 col-12">
                                <h4 class="mb-3">Thông tin mua hàng</h4>
                                <input type="hidden" id="totalOrder" name="totalOrder"/>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" oninput="validateEmail(this)"
                                               required>
                                        <span style="color: red;display: none" id="error-email">Ðịa chỉ email sai định dạng</span>
                                    </div>
                                    <div class="col-12">
                                        <label for="username" class="form-label">Số điện thoại</label>
                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Số điện thoại người nhận hàng"
                                               oninput="validatePhone(this)" required/>
                                        <span id="error-phone" style="color: red; display: none;"></span>
                                    </div>
                                    <div class="col-12">
                                        <label for="username" class="form-label">Họ và tên</label>
                                        <input type="text" name="fullName" required maxlength="255" oninput="validateName(this)"
                                               class="form-control mb-3" placeholder="Nhập Họ và Tên" value="${account.fullName}"
                                               aria-label="Username">
                                        <span id="error-fullName" style="color: red; display: none;"></span>
                                    </div>

                                    <div class="col-12">
                                        <label for="address" class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" name="address" id="addressID" placeholder="Địa chỉ nhận hàng" oninput="validateAddress(this)"
                                               required>
                                        <span style="color: red;display: none" id="error-address"></span>
                                    </div>
                                </div>
                                <hr class="my-4">
                            </div>
                            <div class="col-lg-6 col-12">
                                <h4 class="mb-3">Vận chuyển</h4>
                                <div class="d-flex justify-content-between align-items-center mb-4"
                                     style="padding: 8px 12px; border: 1px solid #00000020; border-radius: 9px;">
                                    <div class="d-flex gap-2 align-items-center">
                                        <input checked type="radio" class="form-check-input"
                                               id="exampleRadio1">
                                        <span class="d-flex justify-content-between align-items-center" for="exampleRadio1">
                                            Giao hàng tận nơi
                                    </div>
                                    <div style="font-weight: bold;">20.000 đ</div>
                                </div>
                                <h4 class="mb-3">Thanh toán</h4>
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <div class="p-3 d-flex align-items-center justify-content-between gap-3"
                                             id="headingOne" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                            <div class="d-flex gap-2">
                                                <input class="form-check-input" type="radio" name="payment" id="bank"
                                                       value="2">
                                                <p class="mb-0">Chuyển khoản qua ngân hàng</p>
                                            </div>
                                            <i class="fa-solid fa-money-check-dollar fa-xl"></i>
                                        </div>
                                        <div id="collapseOne" class="accordion-collapse collapse show"
                                             aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                            <div class="accordion-body" style="background-color: #f8f8f8;">
                                                Ngân Hàng Á Châu (ACB) <br />
                                                STK: 338007 <br />
                                                Vu Ngoc Minh <br /><br /> <br />
                                                Nội dung chuyển khoản: "Số điện thoại bạn dùng để nhận hàng"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <div class="p-3 d-flex align-items-center justify-content-between gap-3"
                                             id="headingTwo" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                            <div class="d-flex gap-2">
                                                <input class="form-check-input" type="radio" name="payment" id="cod"
                                                       value="1" checked>
                                                <p class="mb-0">Thanh toán khi giao hàng (COD)</p>
                                            </div>
                                            <i class="fa-solid fa-money-check-dollar fa-xl"></i>
                                        </div>
                                        <div id="collapseTwo" class="accordion-collapse collapse"
                                             aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                            <div class="accordion-body"
                                                 style="background-color: #f8f8f8; padding-top: 20px; padding-bottom: 20px;">
                                                Bạn chỉ phải thanh toán khi nhận được hàng
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <script>
            var cookiesName = 'cart';
            var cookiesPrice = 'totalP';
            var shippingCost = 20.000;

            <c:if test="${sessionScope.account != null}">
            cookiesName = cookiesName + '<c:out value="${sessionScope.account.userID}"></c:out>';
            cookiesPrice = cookiesPrice + '<c:out value="${sessionScope.account.userID}"></c:out>';
            </c:if>

            var totalPriceValue = getCookie(cookiesPrice);
            if (totalPriceValue !== '') {
                $(document).ready(function () {
                    var price = parseFloat(totalPriceValue);
                    price += shippingCost;
                    var formatPrice = price.toFixed(3);
                    document.getElementById('totalOrder').value = price.toString();
                    $("#totalPrice").html(formatPrice.toString());
                });
            }


            // Lấy danh sách các thẻ div của accordion item
            const accordionItems = document.querySelectorAll('.accordion-item');

            // Lặp qua từng accordion item
            accordionItems.forEach((item, index) => {
                // Lấy input tương ứng với accordion item
                const input = item.querySelector('input[type="radio"]');

                // Xử lý sự kiện click cho accordion item
                item.addEventListener('click', () => {
                    // Thiết lập thuộc tính checked cho input tương ứng
                    input.checked = true;
                });
            });

            // Thiết lập div ban đầu được chọn khi trang tải lên
            const initialDiv = document.querySelector('.accordion-item.show');
            const initialInput = initialDiv.querySelector('input[type="radio"]');
            initialInput.checked = true;


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



            var checkFullName = false;
            var checkPhone = false;
            var checkEmail = false;
            var checkAddress = false;

            function orderProduct() {
                if (checkFullName && checkPhone && checkEmail && checkAddress) {
                    document.getElementById('orderDetailCustomer').submit();
                } else {
                    alert('Vui lòng kiểm tra lại thông tin đặt hàng!');
                }
            }

            function validatePhone(input) {
                // Remove non-digit characters
                var value = input.value.replace(/\D/g, '');

                // Limit the length to 10 characters
                if (value.length > 10) {
                    value = value.slice(0, 10);
                } else if (value.length !== 10) {
                    document.getElementById('error-phone').textContent = "Số điện thoại sai định dạng";
                    document.getElementById('error-phone').style.display = "block";
                    checkPhone = false;
                } else if (value.length === 10) {
                    document.getElementById('error-phone').textContent = "";
                    document.getElementById('error-phone').style.display = "none";
                    checkPhone = true;
                }
                // Update the input value
                input.value = value;
            }

            function validateEmail(input) {
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var value = input.value;
                if (!emailRegex.test(value)) {
                    document.getElementById('error-email').textContent = "Vui lòng nhập email đúng định dạng";
                    document.getElementById('error-email').style.display = "block";
                    checkEmail = false;
                } else {
                    document.getElementById('error-email').textContent = "";
                    document.getElementById('error-email').style.display = "none";
                    checkEmail = true;
                }
            }

            function validateName(input) {
                var value = input.value;

                if (value.trim().length === 0) {
                    document.getElementById('error-fullName').textContent = "Bạn chưa nhập tên";
                    document.getElementById('error-fullName').style.display = "block";
                    checkFullName = false;
                } else {
                    document.getElementById('error-fullName').textContent = "";
                    document.getElementById('error-fullName').style.display = "none";
                    checkFullName = true;
                }
            }

            function validateAddress(input) {
                var value = input.value;
                if (value.trim().length === 0) {
                    document.getElementById('error-address').textContent = "Bạn chưa điền địa chỉ giao hàng";
                    document.getElementById('error-address').style.display = "block";
                    checkAddress = false;
                } else {
                    document.getElementById('error-address').textContent = "";
                    document.getElementById('error-address').style.display = "none";
                    checkAddress = true;
                }
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
