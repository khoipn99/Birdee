<%-- 
    Document   : OrderCustomer
    Created on : Jun 18, 2023, 6:10:12 PM
    Author     : dell
--%>

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
                        <img class="logo__image logo__image--medium " style="width: 80%;"
                             src="images/banner.png">
                    </a>
                </div>
                <form action="home" method="get">
                    <div class="row g-5">
                        <div class="col-md-5 col-lg-4 order-md-last">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-dark">Đơn hàng</span>
                                <!-- Number of items in cart  -->
                                <span class="badge bg-dark rounded-pill">1</span>
                            </h4>
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between align-items-center lh-sm">
                                    <div class="d-flex align-items-center gap-4">
                                        <img src="https://image-us.eva.vn/upload/4-2021/images/2021-10-01/image1-1633053449-421-width600height450.jpg"
                                             class=""
                                             style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px;" />
                                        <h6 class="my-0">Chim vành khuyên</h6>
                                    </div>
                                    <span class="text-muted">120.000 đ</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Total (VND)</span>
                                    <strong>120.000 đ</strong>
                                </li>
                            </ul>

                            <div class="p-2 d-flex justify-content-between align-items-center gap-2">
                                <a href="home" style="color: black; text-decoration: none;">
                                    <i class="fa-solid fa-arrow-left-long"></i>
                                    Quay về trang chủ
                                </a>
                                <button type="submit" class="btn btn-dark">Đặt hàng</button>
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-8 row g-5 mt-0">
                            <div class="col-lg-6 col-12">
                                <h4 class="mb-3">Thông tin mua hàng</h4>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
                                        <div class="invalid-feedback">
                                            Please enter a valid email address for shipping updates.
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="username" class="form-label">Họ và tên</label>
                                        <div class="input-group has-validation">
                                            <input type="text" class="form-control" id="username" placeholder=""
                                                   required="">
                                            <div class="invalid-feedback">
                                                Your username is required.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="address" class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" id="address" placeholder=""
                                               required="">
                                        <div class="invalid-feedback">
                                            Please enter your shipping address.
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="address" class="form-label">Số điện thoại</label>
                                        <input type="text" class="form-control" id="address" placeholder=""
                                               required="">
                                        <div class="invalid-feedback">
                                            Please enter phone.
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="address" class="form-label">Ghi chú</label>
                                        <input type="text" class="form-control" id="address" placeholder=""/>
                                        <div class="invalid-feedback">
                                            
                                        </div>
                                    </div>
                                </div>

                                <hr class="my-4">
                            </div>
                            <div class="col-lg-6 col-12">
                                <h4 class="mb-3">Vận chuyển</h4>
                                <div class="d-flex justify-content-between align-items-center mb-4"
                                     style="padding: 8px 12px; border: 1px solid #00000020; border-radius: 9px;">
                                    <div class="d-flex gap-2 align-items-center">
                                        <input checked type="radio" name="radios" class="form-check-input"
                                               id="exampleRadio1">
                                        <span class="d-flex justify-content-between align-items-center" for="exampleRadio1">
                                            Giao hàng tận nơi
                                    </div>
                                    <div style="font-weight: bold;">20000 đ</div>
                                </div>
                                <h4 class="mb-3">Thanh toán</h4>
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <div class="p-3 d-flex align-items-center justify-content-between gap-3"
                                             id="headingOne" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                            <div class="d-flex gap-2">
                                                <input class="form-check-input" type="radio" name="checkout_type" id="bank"
                                                       value="male">
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
                                                <input class="form-check-input" type="radio" name="checkout_type" id="cod"
                                                       value="male">
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
                        </div>
                    </div>
                </form>
            </main>
        </div>
        <script>
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
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
