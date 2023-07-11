<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meeko.vn</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link rel="stylesheet" href="../css/style.css" type="text/css" />
        <link rel="stylesheet" href="../css/layout.css" type="text/css" />
        <link rel="stylesheet" href="../css/login.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
              crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <%@ include file="../includes/header.jsp" %>
        <!-- Login wrapper -->
        <div class="d-flex justify-content-center mt-5 mb-5">
            <div class="login-wrapper shadow bg-body rounded">

                <div class="nav group-login-wrapper mb-2 row" id="accountTab" role="tablist">
                    <div class="col-6">
                        <form action="login" method="get">
                            <button class="btn-tab-login w-100" id="pills-login-tab" data-bs-toggle="pill" data-bs-target="#pills-login" type="submit" role="tab" aria-controls="pills-login" aria-selected="false" tabindex="-1">Đăng nhập</button>
                        </form>
                    </div>
                    <div class="col-6">
                        <button class="btn-tab-login w-100 active" id="pills-register-tab" data-bs-toggle="pill" data-bs-target="#pills-register" type="button" role="tab" aria-controls="pills-register" aria-selected="true">Đăng kí</button>
                    </div>
                </div>
                <div class="tab-content" id="accountTabContent">
                    <!--Register form-->
                    <div class="tab-pane fade show active body-login-wrapper" id="pills-login" role="tabpanel"
                         aria-labelledby="pills-login-tab">
                        <form action="register" method="post">
                            <c:if test="${isFail == true}">
                                <p style="color: red">${msg}</p>
                            </c:if>
                            <h6>HỌ & Tên<span class="text-danger">*</span></h6>
                            <input type="text" name="fullName" required maxlength="255" oninput="validateName(this)"
                                   class="form-control mb-3" placeholder="Nhập Họ và Tên" value="${account.fullName}"
                                   aria-label="Username">
                            <span id="error-fullName" style="color: red; display: none;"></span>
                            <h6>SỐ ĐIỆN THOẠI <span class="text-danger">*</span></h6>
                            <input type="text" name="phone" required oninput="validatePhone(this)"
                                   class="form-control mb-3" placeholder="Nhập Số điện thoại" value="${account.phone}"
                                   aria-label="Username">
                            <h6>EMAIL <span class="text-danger">*</span></h6>
                            <input type="email" name="email" required
                                   class="form-control mb-3" placeholder="Nhập địa chỉ Email"
                                   aria-label="Username">
                            <h6>MẬT KHẨU <span class="text-danger">*</span></h6>
                            <input type="password" name="password" required
                                   class="form-control mb-2" placeholder="Nhập Mật khẩu"
                                   aria-label="Username">
                            <h6>Địa chỉ</h6>
                            <input type="text" name="address" value="${account.address}"
                                   class="form-control mb-3" placeholder="Nhập địa chỉ"
                                   aria-label="Username">
                            <h6>Ngày sinh <span class="text-danger">*</span></h6>
                            <input type="date" name="dob" max="${now}" required value="${account.dob}"
                                   class="form-control mb-3" placeholder="Nhập ngày sinh"
                                   aria-label="Username">
                            <button type="submit" class="btn btn-dark w-100 mb-2">Đăng ký</button>
                            <div class="text-center commit-meeko mb-3">
                                Meeko cam kết bảo mật và sẽ không bao giờ đăng<br />hay chia sẻ thông tin mà chưa có
                                được sự
                                đồng ý của bạn.
                            </div>
                            <div class=" d-flex justify-content-center position-relative mb-3">
                                <div class="login-other-way rounded-pill">
                                    hoặc đăng nhập qua
                                </div>
                            </div>
                        </form>
                        <form action="loginEmail" method="post">
                            <div class="group-btn-login-social mb-3">
                                <!-- Do login google here, change onclick and href  -->
                                <a class="social-login--google" href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:9999/loginEmail&response_type=code&client_id=583964261490-qa8kt76ed9evd3l597jn9hmsnrm6s97q.apps.googleusercontent.com&approval_prompt=force">
                                    <img width="129px" height="37px" alt="google-login-button"
                                         src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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


            var checkFullName = false;
            var checkPassword = false;

            function validatePhone(input) {
                // Remove non-digit characters
                var value = input.value.replace(/\D/g, '');

                // Limit the length to 10 characters
                if (value.length > 10) {
                    value = value.slice(0, 10);
                }

                // Update the input value
                input.value = value;
            }

            function validateName(input) {
                var value = input.value;
                var regex = /^[A-Za-z\s]+$/;

                if (!regex.test(value)) {
                    document.getElementById('error-fullName').textContent = "Tên của bạn không được có số và ký tự đặc biệt";
                    document.getElementById('error-fullName').style.display = "block";
                    checkFullName = true;
                } else {
                    document.getElementById('error-fullName').textContent = "";
                    document.getElementById('error-fullName').style.display = "none";
                    checkFullName = false;
                }
            }
        </script>
    </body>

</html>