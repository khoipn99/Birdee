<%-- 
    Document   : registerAccount
    Created on : Jun 1, 2023, 8:06:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="headHome.jsp" %>
    </head>
    <body>
 
         <section class="login2">
            <div class="container">
                <div class="row py-3">
                    
                    <div class="col-md-6  py-3">
                        <div class="re1">
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
                    
                            passwordInput.addEventListener("input", function() {
                                let password = passwordInput.value;
                                if (!validatePassword(password)) {
                                    passwordStrengthMessage.style.display = "block";
                                    passwordStrengthMessage.innerText = "Password is not strong enough.";
                                } else {
                                    passwordStrengthMessage.style.display = "none";
                                }
                            });
                    
                            confirmPasswordInput.addEventListener("input", function() {
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
                                <p><input type="submit" style="font-weight: bold;" value="Register" name="action"></p>
                            </form>
                            </div>
                    </div>
                    <div class="col-md-6  lo1">
                        <img src="mylib/img/logo2.png" alt="">
                    </div>
                </div>
                </div>
            </div>
        </section> 
    </body>
    <footer><%@include file="footer.jsp" %></footer>
</html>
