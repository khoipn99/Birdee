<%-- 
    Document   : EditCusProfile
    Created on : Jun 15, 2023, 1:58:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController">
            <p>Account's Name: <input type="text" name="UName"></p>
            <p>Address: <input type="text" name="UAddress"></p>
            <p>Phonenumber: <input type="number" name="UphoneNumber" id="phoneNumber-input" pattern="[0-9]{10,11}" onblur="checkphoneNumber()"></p>
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
                            <p><input type="submit" value="EditCusProfile" name="action"></p>
        </form>
    </body>
</html>
