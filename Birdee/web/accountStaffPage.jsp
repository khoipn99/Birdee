<%-- 
    Document   : accountStaffPage
    Created on : Jun 16, 2023, 10:56:44 AM
    Author     : vudin
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page import="dao.AccessoryDAO"%>
<%@page import="dto.Accessory"%>
<%@page import="dao.BirdDAO"%>
<%@page import="dto.Bird"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Birdee</title>        
        <script src="mylib/bt5/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css"/>

    <header>
        <%@include file="headHome.jsp" %>
    </header>
</head>
<body>
    <div>
        <h1 style="text-align: center">
            PAGE FOR STAFF PLATFORM
        </h1>
        <br>
        <form action="MainController" method="POST">  
            <div style="text-align: center">
                <button name="action" type="submit" value="Product Page">Product Page</button> 
                <button name="action" type="submit" value="Account Page">Account Page</button>
                <button name="action" type="submit" value="Comment Page">Comment Page</button>
            </div>
        </form>  
    </div>
    <br>
    <div class="container">
        <div>
            <h3>Customer Account</h3>
            <div class="row">

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">                  
                    ID
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    User Name
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Email
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Password
                </div>                             
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Role
                </div>                   
                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Address
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Phone
                </div>                

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    UpDate
                </div>

            </div>
            <br>

            <%
                int id = 0;
                ArrayList<Account> accountCustomerList = AccountDAO.getAllCustomerAccount();
                for (Account account : accountCustomerList) {
                    id++;

            %>   
            <div class="row">
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= id%>
                </div>               
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%=  account.getUsername() %>
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account.getEmail() %>                  
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account.getPassword() %>                  
                </div>
                       
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Customer
                </div>                                         
                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account.getAddress() %>
                </div>
                
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account.getPhone() %>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <a href="#">Update</a>
                </div>                            
            </div>
            <br>
            <%                }
            %>



        </div>
        <br>
        <br>
        <div>
            <h3>Shop Account</h3>
            <div class="row">

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">                  
                    ID
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    User Name
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Email
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Password
                </div>                             
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Role
                </div>                   
                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Address
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Phone
                </div>                

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    UpDate
                </div>

            </div>
            <br>

            <%
                int id2 = 0;
                ArrayList<Account> accountShop = AccountDAO.getAllShopAccount();
                for (Account account2 : accountShop) {
                    id2++;

            %>   
            <div class="row">
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= id2%>
                </div>               
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%=  account2.getUsername() %>
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account2.getEmail() %>                  
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account2.getPassword() %>                  
                </div>
                       
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Shop Staff
                </div>                                         
                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account2.getAddress() %>
                </div>
                
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= account2.getPhone() %>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <a href="#">Update</a>
                </div>                            
            </div>
            <br>
            <%                }
            %>



        </div>        

    </div>    


    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>
</html>

