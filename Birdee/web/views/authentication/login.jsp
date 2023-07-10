<%-- 
    Document   : login
    Created on : Jun 27, 2023, 7:48:05 PM
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
        <!-- Login wrapper -->
        <section class="p-5">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="/images/logo2.png" class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="login" method="post">
                            <h1>Đăng nhập với tài khoản</h1>
                            <!-- Email input -->
                            <div class="form-outline mt-4 mb-4">
                                <div class="form-floating mb-4">
                                    <input type="text" name="uid" id="form12" class="form-control" placeholder="Example" value="${sessionScope.uid}"/>
                                    <label for="form12">Tên đăng nhập</label>
                                </div>
                            </div>
                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <div class="form-floating mb-4">
                                    <input type="password" name="pwd" id="formpwd" class="form-control" placeholder="Password" value="${sessionScope.pwd}"/>
                                    <label for="formpwd">Mật khẩu</label>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" value="true" name="remember" id="form2Example3" 
                                           <c:if test="${sessionScope.remember == true}">
                                    checked
                                    </c:if>
                                    />
                                    <label class="form-check-label" for="form2Example3">
                                        Ghi nhớ
                                    </label>
                                </div>
                                <a href="/forgot-password.html" class="text-body">Quên mật khẩu?</a>
                            </div>
                            <c:if test="${isFail == true}">
                                <p style="color: red">Sai tài khoản hoặc mật khẩu! Vui lòng thử lại!</p>
                            </c:if>
                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-success btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>
                        </form>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Không có tài khoản? <a href="register"
                                                                                       class="link-danger">Đăng kí</a></p>
                    </div>
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
