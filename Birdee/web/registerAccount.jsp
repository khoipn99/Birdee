<%-- 
    Document   : registerAccount
    Created on : Jun 1, 2023, 8:06:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee - Register</title>
        <link  rel="icon" type="image/png" href="mylib/img/logo2.png">
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="mylib/img"/>
        <link rel="stylesheet" href="mylib/fontawesome-free-6.4.0-web/css/all.css"/>
        <link rel="stylesheet" href="mylib/fontawesome-free-6.4.0-web/css/all.min.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap-grid.min.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap-grid.css"/>
        <link rel="stylesheet" href="mylib/bt5/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>     
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/popper.min.js"></script>
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <section class="headlogin">
            <div class="container py-3 head115">
                <div class="row">
                    <div class="col he999"><a href="MainController?action="><img src="mylib/img/haiquangdoi.png" alt=""></a>
                    </div>
                     <div class="col">
                        <p class="headlogin111" style="color: white;">Đăng Ký</p>   
                     </div>
                </div>
                </div>
        </section>
         <section class="login2">
            <div class="container">
                <div class="row py-3">

                    <div class="col re5  py-3">
                        <div class="re6">
                            <c:set var="msg" value="${requestScope.msg}" />
                                        <c:if test="${msg != null}">
                                            <p style="color: red">${msg}</p> 
                                        </c:if>
                        <form action="MainController">
                            <p>Enter your name: <input type="text" name="userName" required=""/></p>
                            <p>Enter your phone number: <input type="number" name="phoneNumber" id="phoneNumber-input" pattern="[0-9]{10,11}" required onblur="checkphoneNumber()"></p>
                            <div id="phoneNumber-error" style="color: red; display: none;">Nhập sai số điện thoại</div>
                            <script>
                                function checkphoneNumber() {
                                    var phoneNumberInput = document.getElementById("phoneNumber-input");
                                    var errorDiv = document.getElementById("phoneNumber-error");

                                    if (phoneNumberInput.value.length < 10 || phoneNumberInput.value.length > 11) {
                                        errorDiv.style.display = "block";
                                    } else {
                                        errorDiv.style.display = "none";
                                    }
                                }
                            </script>
                            <p>Enter your email: <input type="email" id="email" name="email" onblur="validateEmail()" required></p>
                            <div id="email-error" style="color: red;"></div>
                            <script>
                                function validateEmail() {
                                    var emailInput = document.getElementById("email");
                                    var emailError = document.getElementById("email-error");
                                    var isValid = emailInput.checkValidity();
                                    if (!isValid) {
                                        emailError.innerHTML = "Vui lòng nhập địa chỉ email hợp lệ!";
                                    } else {
                                        emailError.innerHTML = "";
                                    }
                                }
                            </script>
                            <p>Enter your Address: <br><p><label for="province-select">Tỉnh/thành phố:</label>
                                <select id="province-select" name="province">
                                    <option value="">-- Chọn tỉnh/thành phố --</option>
                                </select></p>
                            <p><label for="district-select">Quận/huyện:</label>
                                <select id="district-select" name="district">
                                    <option value="">-- Chọn quận/huyện --</option>
                                </select></p>
                            <p><label for="ward-select">Xã/phường:</label>
                                <select id="ward-select" name="ward">
                                    <option value="">-- Chọn xã/phường --</option>
                                </select></p>
                            <script src="getAddress.js"></script>
                            </p>
                            <p>Specific address: <input type="text" name="spec_address"></p>
                            <p>Password: <input type="password" id="password" name="password"></p>
                            <p>Confirm Password: <input type="password" id="confirm-password" name="confirm-password"><br></p>
                            <div id="password-strength" style="display:none;color:red;"></div>
                            <div id="password-match" style="display:none;color:red;"></div>
                            <script>
                                const passwordInput = document.getElementById("password");
                                const confirmPasswordInput = document.getElementById("confirm-password");
                                const passwordStrengthMessage = document.getElementById("password-strength");
                                const passwordMatchMessage = document.getElementById("password-match");

                                passwordInput.addEventListener("input", function () {
                                    let password = passwordInput.value;
                                    if (!validatePassword(password)) {
                                        passwordStrengthMessage.style.display = "block";
                                        passwordStrengthMessage.innerText = "Password is not strong enough.";
                                    } else {
                                        passwordStrengthMessage.style.display = "none";
                                    }
                                });

                                confirmPasswordInput.addEventListener("input", function () {
                                    let password = passwordInput.value;
                                    let confirmPassword = confirmPasswordInput.value;

                                    if (password != confirmPassword) {
                                        passwordMatchMessage.style.display = "block";
                                        passwordMatchMessage.innerText = "Passwords do not match.";
                                    } else {
                                        passwordMatchMessage.style.display = "none";
                                    }
                                });

                                function validatePassword(password) {
                                    // Password must have at least one uppercase letter, one lowercase letter,
                                    // one digit, and one special character, and be at least 8 characters long
                                    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                                    return regex.test(password);
                                }
                            </script>
                            <p><input type="submit" style="font-weight: bold;" value="Register" name="action" id="check-button"></p>
                        </form>
                    </div>
                    </div>
                    <div class="col l111">
                        <div class="l12"><img src="mylib/img/logo2.png" alt=""></div> 
                    </div>
                </div>
            </div>
       
    </section>    
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
