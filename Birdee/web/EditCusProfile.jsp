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
                            <h2 class="text-primary mb-4">Edit Customer Profile</h2>
                            <form action="MainController">
                                <div class="mb-3">
                                    <label for="UName" class="form-label">Account's Name:</label>
                                    <input type="text" class="form-control" id="UName" name="UName">
                                </div>
                                <div class="mb-3">
                                    <label for="UAddress" class="form-label">Address:</label>
                                    <input type="text" class="form-control" id="UAddress" name="UAddress">
                                </div>
                                <div class="mb-3">
                                    <label for="UphoneNumber" class="form-label">Phonenumber:</label>
                                    <input type="number" class="form-control" id="UphoneNumber" name="UphoneNumber" pattern="[0-9]{10,11}">
                                    <div class="invalid-feedback">Please enter a valid phone number.</div>
                                </div>
                                <p><input type="submit" class="btn btn-primary" value="EditCusProfile" name="action"></p>
                            </form>
                        </div>
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
