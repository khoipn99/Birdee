<%-- 
    Document   : EditCusProfile
    Created on : Jun 15, 2023, 9:10:35 PM
    Author     : ACE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
    
        <div class="container py-5">
            <div class="row justify-content-center">
                   <div class="col-md-8 col-lg-6">
                     <div class="card shadow-sm">
                         <div class="card-body">  
                    <form action="MainController" method="GET">
                        <h2 class="text-primary mb-4">Edit Customer Profile</h2>
                        <div class="mb-3">
                            <label for="UName" class="form-label font-weight-bold">Account Name</label>
                            <input type="text" id="UName" name="UName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="UAddress" class="form-label font-weight-bold">Address</label>
                            <input type="text" id="UAddress" name="UAddress" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="UPhoneNumber" class="form-label font-weight-bold">Phone Number</label>
                            <input type="number" id="UPhoneNumber" name="UPhoneNumber" class="form-control" pattern="[0-9]{10,11}" onblur="checkPhoneNumber()" required>
                            <div id="phoneNumber-error" style="color: red; display: none;">Invalid phone number format</div>
                            <script>
                              function checkPhoneNumber() {
                                var phoneNumberInput = document.getElementById("UPhoneNumber");
                                var errorDiv = document.getElementById("phoneNumber-error");

                                if (phoneNumberInput.value.length < 10 || phoneNumberInput.value.length > 11) {
                                        errorDiv.style.display = "block";
                                    } else {
                                        errorDiv.style.display = "none";
                                    }
                                }
                            </script>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" name="action" value="EditCusProfile" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                         </div>
                     </div>
                </div>      
            </div>
        </div>





        
      <footer>
            <%@include file="footer.jsp" %>
      </footer>
    </body>
</html>
