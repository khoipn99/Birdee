<%-- 
    Document   : AddAccessoryForm
    Created on : Jun 16, 2023, 3:06:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container py-3">
            <div class="row" style="width: 80%; margin: 0 auto">

            
            <div id="alertContainer" class="container">

            </div>
            <h1 style="text-align: center; color: green">Add Accessory</h1>  
            <form id="AccessoryForm" action="MainController" method="post">
                <div class="vertical-table py-3">
                    <!-- <div class="table-row">
 <div class="table-header">IMG</div>
  <div>
    <div class="image-upload-wrap">
     <input class="file-input" type="file" id="imageUpload" name="images[]" onchange="handleImageUpload(event)" multiple required>
</div>
  <div id="preview-container" class="preview-container"></div>
</div>
                        </div>-->

                    <div class="table-row">
                        <div class="table-header">Accessory name:</div>
                        <div><input type="text" name="AccessoryName" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Description:</div>
                        <div><textarea name="description" class="form-control"></textarea></div>
                    </div>

                    <div class="table-row">
                        <div class="table-header">Quantity:</div>
                        <div><input type="number" name="quantity" min="0" class="form-control"></div>
                    </div>

                    <div class="table-row">
                        <div class="table-header">Price:</div>
                        <div><input type="number" name="price" min="0" class="form-control"></div>
                    </div>

                    <div class="table-row py-3">
                        <div class="table-header">Email:</div>
                        <div><input readonly="" type="text" name="emailShop" value="${sessionScope.cEmail}" class="form-control"></div>
                    </div>
                    <div class="table-row py-3">
                        <div class="table-header">Email_platform_staff</div>
                        <div><input readonly="" type="text" name="emailPlatform" value="staff@gmail.com" class="form-control"></div>
                    </div>
                    <button type="submit" value="AddAccessory" name="action" class="btn btn-primary add-button-A" onclick="showConfirmation2('save', event)">Save</button>
                    <button type="button" class="btn btn-danger cancel-button-A" onclick="showConfirmation2('cancel', event)">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="shopStaff.js"></script>
</body>
</html>
