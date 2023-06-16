<%-- 
    Document   : UpdateBirdForm
    Created on : Jun 12, 2023, 4:28:58 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container">
            <h1 style="text-align: center; color: green">Update Bird</h1>  
            <form id="birdForm" action="MainController" method="post">
                <c:forEach var="UP" items="${requestScope.bird}">
                    <div class="vertical-table">
                        <!--                                            <div class="table-row">
                                                                        <div class="table-header">IMG</div>
                                                                        <div>
                                                                            <div class="image-upload-wrap">
                                                                                <input class="file-input" type="file" id="imageUpload" name="images[]" onchange="handleImageUpload(event)" multiple required>
                                                                            </div>
                                                                            <div id="preview-container" class="preview-container"></div>
                                                                        </div>
                                                                    </div>-->
                        <div>
                            <input type="hidden" name="BirdID" value="${UP.getBird_id()}"/>
                        </div>
                        <div class="table-row">
                            <div class="table-header">Bird name:</div>
                            <div><input type="text" required name="birdName" value="${UP.getBird_name()}" class="form-control"></div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Date of birth:</div>
                            <div><input type="date" name="dob" value="${UP.getDob()}" class="form-control"></div>
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
                            <div><input type="number" name="height" value="${UP.getHeight()}" min="0" class="form-control"></div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Weight:</div>
                            <div><input type="number" name="weight" value="${UP.getWeight()}" min="0" class="form-control"></div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Origin:</div>
                            <div><input type="text" name="origin" value="${UP.getOrigin()}" class="form-control"></div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Description:</div>
                            <div>
                                <textarea name="description" class="form-control"><c:out value="${UP.getDescription()}"/></textarea>
                            </div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Quantity:</div>
                            <div><input type="number" name="quantity" value="${UP.getQuantity()}" min="0" class="form-control"></div>
                        </div>

                        <div class="table-row">
                            <div class="table-header">Price:</div>
                            <div><input type="number" name="price" value="${UP.getPrice()}" min="0" class="form-control"></div>
                        </div>
                        <input type="hidden" name="shopEmail" value="${sessionScope.cEmail}"/>
                        <button type="submit" value="UpdateB" name="action" class="btn btn-primary update-button" >Save</button>
                        <button type="button" name="action" class="btn btn-danger cancel-button">Cancel</button>
                    </div>
                </c:forEach>

            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="shopStaff.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var cancelButton = document.querySelector("#birdForm button.cancel-button");
                var saveButton = document.querySelector("#birdForm button.update-button");

                cancelButton.addEventListener("click", function (event) {
                    event.preventDefault();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có muốn hủy hành động?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((confirm) => {
                        if (confirm) {
                            window.location.href = "MainController?action=ShowBList&shopEmail=${sessionScope.cEmail}";
                        }
                    });
                });

                saveButton.addEventListener("click", function (event) {
                    event.preventDefault();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có muốn cập nhật con chim này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((confirm) => {
                        if (confirm) {
                            swal({
                                title: "Cập nhật chim thành công!",
                                timer: 1000,
                                buttons: false
                            });
                            setTimeout(function () {
                                var form = document.getElementById("birdForm");
                                var actionInput = document.createElement("input");
                                actionInput.setAttribute("type", "hidden");
                                actionInput.setAttribute("name", "action");
                                actionInput.setAttribute("value", "UpdateB");
                                form.appendChild(actionInput);
                                form.submit();
                            }, 2000);
                        }
                    });
                });
            });
        </script>



    </body>
</html>
