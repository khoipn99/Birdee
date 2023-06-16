<%-- 
    Document   : AddBirdForm
    Created on : Jun 10, 2023, 12:24:04 AM
    Author     : ASUS
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bird Form</title>
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

        <style>
            .preview-image {
                margin: 20px;
                width: 200px;
                height: 200px;
            }   
        </style>
    </head>
    <body>
        <div class="container">
            <div id="alertContainer" class="container">

            </div>
            <h1 style="text-align: center; color: green">Add Bird</h1>  
            <form id="birdForm" action="MainController" method="post">
                <div class="vertical-table">
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
                        <div class="table-header">Bird name:</div>
                        <div><input type="text" name="birdName" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Date of birth:</div>
                        <div><input  type="date" name="dob" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Gender:</div>
                        <div>
                            <select name="gender" required class="form-control">
                                <option value="true">Male</option>
                                <option value="false">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Height:</div>
                        <div><input type="number" name="height" min="0" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Weight:</div>
                        <div><input type="number" name="weight" min="0" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Origin:</div>
                        <div><input type="text" name="origin" class="form-control"></div>
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
                    <div class="table-row">
                        <div class="table-header">Email:</div>
                        <div><input readonly="" type="text" name="emailShop" value="${sessionScope.cEmail}" class="form-control"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-header">Email_platform_staff</div>
                        <div><input readonly="" type="text" name="emailPlatform" value="staff@gmail.com" class="form-control"></div>
                    </div> 
                    <button type="submit" value="addbird" name="action" class="btn btn-primary add-button" onclick="showConfirmation('save', event)">Save</button>
                    <button type="button" class="btn btn-danger cancel-button" onclick="showConfirmation('cancel', event)">Cancel</button>
                    
                </div>
            </form>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="shopStaff.js"></script>
        
    </body>
</html>
