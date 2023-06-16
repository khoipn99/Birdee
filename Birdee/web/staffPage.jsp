<%-- 
    Document   : staffPage
    Created on : Jun 2, 2023, 9:35:23 PM
    Author     : ACE
--%>

<%@page import="dao.AccessoryDAO"%>
<%@page import="dto.Accessory"%>
<%@page import="dao.BirdDAO"%>
<%@page import="dto.Bird"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js%22%3E"></script>
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
                <button type="submit" value="Product Page" name="action">Product Page</button> 
                <button type="submit" value="Account Page" name="action">Account Page</button>
                <button name="action" type="submit" value="Comment Page">Comment Page</button>
            </div>

        </form>
    </div>
    <br>
    <div class="container">
        <div>
            <h3>Bird</h3>
            <div class="row">

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">                  
                    ID
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Image
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Name
                </div>                 
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Birth Day
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Gender
                </div>                   
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Origin
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Quantity
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Price
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Email_shop
                </div>

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    UpDate
                </div>

            </div>
            <br>

            <%
                int id = 0;
                ArrayList<Bird> birdList = BirdDAO.getBird("");
                for (Bird b : birdList) {
                id++;

            %>   
            <div class="row">
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= id %>
                    <input type="hidden" name="BirdID" value="<%= b.getBird_id()%>">
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <img src="<%= BirdDAO.getMainBirdImg(b.getBird_id())%>" style="width: 100%; height: 80px">
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getBird_name()%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getDob()%>
                </div>
                <%
                    if (b.isGender()) {
                %>               
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Male
                </div>
                <%
                } else {
                %> 
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Female
                </div>
                <%
                    }
                %>                
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getOrigin()%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getQuantity()%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getPrice()%>
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= b.getEmail_shop_staff()%>   
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    
                    <a href="MainController?action=staffDeleteBird&staffBirdID=<%= b.getBird_id() %>"><h5 style="width: 100%; height: 40%">Delete</h5></a>         
                    
                </div>

            </div>

            <br>
            <%                }
            %>

            <!--            <script>
                $(document).ready(function () {
                    $(document.body).on('click', '.delete-button', function (event) {
                        var birdID = $(this).siblings("input[name='BirdID']").val();
                        swal({
                            title: "Cảnh báo",
                            text: "Bạn có chắc chắn muốn xóa con chim này?",
                            buttons: ["Hủy bỏ", "Đồng ý"]
                        }).then((Confirm) => {
                            if (Confirm) {
                                swal({
                                    title: "Đã xóa bird thành công!",
                                    timer: 1000,
                                    buttons: false
                                });
                                setTimeout(function () {
                                    window.location = "MainController?action=StaffDeleteBird&BirdIDStaff=" + birdID;
                                }, 2000);
                            }
                        });
                    });
                });
            </script>-->



        </div>
        <br>
        <br>
        <div>
            <h3>Accessory</h3>
            <div class="row">

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">                  
                    ID
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Image
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Name
                </div>                                                                               
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Quantity
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Price
                </div>
                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    Email_shop
                </div>

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    UpDate
                </div>

            </div>
            <br>

            <%
                int id2 = 0;
                ArrayList<Accessory> accessoryList = AccessoryDAO.getAccessorys();
                for (Accessory a : accessoryList) {
                    id2++;

            %>   
            <div class="row">
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= id2%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <img src="<%= AccessoryDAO.getMainAccessoryImg(a.getAccessory_id())%>" style="width: 100%; height: 80px">
                </div>
                <div class="col-md-2" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= a.getName()%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= a.getQuantity()%>
                </div>

                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= a.getPrice()%>
                </div>

                <div class="col-md-3" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <%= a.getEmail_shop_staff()%>
                </div>
                <div class="col-md-1" style="border: 1px; border-style: solid; border-color: greenyellow">
                    <a href="MainController?action=staffDeleteAccessory&staffAccessoryID=<%= a.getAccessory_id() %>"><h5 style="width: 100%; height: 40%">Delete</h5></a>   
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
