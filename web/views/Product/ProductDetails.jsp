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
                        <c:if test="${product.category.tag.tagId == 1}">
                            <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                            <div class="mt-3 mb-4">
                                <p>Giới tính: <span style="font-weight: bold;">
                                        <c:if test="${birdDetails.gender == true}">
                                            Đực
                                        </c:if>
                                        <c:if test="${birdDetails.gender == false}">
                                            Cái
                                        </c:if>
                                    </span><br/>
                                    Ngày sinh: <span style="font-weight: bold;">${birdDetails.dob}</span><br/>
                                    Chiều cao: <span style="font-weight: bold;">${birdDetails.height}cm</span><br/>
                                    Cân nặng: <span style="font-weight: bold;">${birdDetails.weight}g</span><br/>
                                    Xuất sứ: <span style="font-weight: bold;">${birdDetails.origin}</span><br/>
                                </p>
                            </div>
                            <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                            <div class="row" style="padding-top: 12px; padding-bottom: 12px;">
                                <div class="col-12">
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
                        </c:if>
                        <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                        <div class="mt-3 mb-3 d-flex align-items-center gap-1" style="cursor: pointer;">
                            Shop: <a href="#" style="text-decoration: none">${product.shop.fullName}</a>
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
                <div class="mt-4 row">
                    <div class="mt-4 mb-5">
                        <p style="margin-top: 16px; font-weight: 600; margin-bottom: 4px;">Mô tả sản phẩm</p>
                        <p style="max-width: 700px; width: 100%; color: #777777; font-size: 14px; line-height: 24px;">${product.description}</p>
                    </div>
                    <div style="height: 1px; width: 100%; background-color: #33333330;"></div>

                    <!-- Slider in same category here  -->
                    <div class="mt-4">
                        <div class="mb-3 align-items-center justify-content-between gap-2">
                            <div style="font-size: 22px; color: #333; margin-bottom: 10px; font-weight: bold;">
                                Ðánh giá
                            </div>
                            <div>
                                5 sao
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