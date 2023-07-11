<%@ include file="../includes/header.jsp" %>

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
        <!-- Login wrapper -->
        <div class="d-flex justify-content-center mt-5 mb-5">
            <div class="login-wrapper shadow bg-body rounded">

                <div class="nav group-login-wrapper mb-2 row" id="accountTab" role="tablist">
                    <div class="col-6">
                        <button class="btn-tab-login active w-100" id="pills-login-tab" data-bs-toggle="pill"
                                data-bs-target="#pills-login" type="button" role="tab" aria-controls="pills-login"
                                aria-selected="true">Đăng nhập</button>
                    </div>
                    <div class="col-6">
                        <form action="register" method="get">
                            <button class="btn-tab-login w-100"
                                    type="submit">Đăng kí</button>

                        </form>
                    </div>
                </div>
                <div class="tab-content" id="accountTabContent">
                    <!--Login form-->
                    <div class="tab-pane fade show active body-login-wrapper" id="pills-login" role="tabpanel"
                         aria-labelledby="pills-login-tab">
                        <div>
                            <p>Bạn quên mật khẩu? Nhập địa chỉ email để lấy lại mật khẩu qua email.</p>
                        </div>
                        <form action="login" method="post">
                            <h6>EMAIL <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" name="email" required
                                   placeholder="Nhập địa chỉ Email" aria-label="Username">
                            <button type="submit" class="btn btn-dark w-100 mb-2">LẤY LẠI MẬT KHẨU</button>
                            <div class=" d-flex justify-content-center position-relative mb-3">
                                <div class="login-other-way rounded-pill">
                                    Quay lại TẠI ĐÂY
                                </div>
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

        </script>
    </body>

</html>