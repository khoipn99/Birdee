<%-- 
    Document   : register
    Created on : Jun 27, 2023, 7:48:35 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <!-- Css for header group  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="../../includes/header.jsp" %>
        <!-- Register wrapper -->
        <section class="p-5">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="/images/logo2.png" class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="register" method="post">
                            <h1>Đăng ký tài khoản mới</h1>
                            <!-- Email input -->
                            <div class="form-outline mt-4 mb-4">
                                <div class="form-floating mb-4">
                                    <input name="uid" type="text" id="form12" class="form-control"
                                           placeholder="Example" required="" value="${account.username}"/>
                                    <label for="form12">Tên đăng nhập <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="pwd" type="password" id="formpwd" class="form-control"
                                           placeholder="Password" required/>
                                    <label for="formpwd">Mật khẩu <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Re-Password input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="repwd" type="password" id="re-formpwd" class="form-control"
                                           placeholder="Password" required>
                                    <label for="re-formpwd">Nhập lại mật khẩu <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Full name input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="fullName" type="text" id="fullname" class="form-control"
                                           placeholder="Full name" required value="${account.fullName}">
                                    <label for="fullname">Họ và tên <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Phone number input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="phone" type="tel" id="tel" class="form-control" placeholder="Full name" required value="${account.phone}">
                                    <label for="tel">Số điện thoại <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Phone number input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="dob" type="date" max="${now}" id="tel" class="form-control" placeholder="Full name" required value="${account.dob}">
                                    <label for="tel">Ngày sinh <span style="color: red;">*</span></label>
                                </div>
                            </div>

                            <!-- Address input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input name="address" type="text" id="address" class="form-control"
                                           placeholder="Address" value="${account.address}"/>
                                    <label for="address">Địa chỉ</label>
                                </div>
                            </div>
                            <c:if test="${isFail == true}">
                                <p style="color: red">${msg}</p>
                            </c:if>
                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Sign up</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">Already have account? <a href="login"
                                                                                                 class="link-danger">Login</a></p>
                            </div>

                        </form>
                        <div class="position-relative mb-3">
                            <div class="login-other-way rounded-pill">
                                <p class="small fw-bold mt-2 pt-1 mb-0">Hoặc đăng nhập qua</p>
                            </div>
                        </div>
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
        </section>
        <%@include file="../../includes/footer.jsp" %>
    </body>
</html>
