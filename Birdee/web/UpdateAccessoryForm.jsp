<%-- 
    Document   : UpdateAccessoryForm
    Created on : Jun 16, 2023, 1:03:33 PM
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
            <h1 style="text-align: center; color: green">Update Accessory</h1>  
            <form id="AccessoryForm" action="MainController" method="post">
                <c:forEach var="UP" items="${requestScope.accessory}">
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
                            <input type="hidden" name="A_ID" value="${UP.getAccessory_id()}"/>
                        </div>
                        <div class="table-row">
                            <div class="table-header">Accessory name:</div>
                            <div><input type="text" required name="AccessoryName" value="${UP.getName()}" class="form-control"></div>
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
                        <button type="submit" value="UpdateA" name="action" class="btn btn-primary update-button" >Save</button>
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
                var cancelButton = document.querySelector("#AccessoryForm button.cancel-button");
                var saveButton = document.querySelector("#AccessoryForm button.update-button");

                cancelButton.addEventListener("click", function (event) {
                    event.preventDefault();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có muốn hủy hành động?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((confirm) => {
                        if (confirm) {
                            window.location.href = "MainController?action=ShowAList&shopEmail=${sessionScope.cEmail}";
                        }
                    });
                });

                saveButton.addEventListener("click", function (event) {
                    event.preventDefault();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có muốn cập nhật phụ kiện này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((confirm) => {
                        if (confirm) {
                            swal({
                                title: "Cập nhật phụ kiện cho chim thành công!",
                                timer: 1000,
                                buttons: false
                            });
                            setTimeout(function () {
                                var form = document.getElementById("AccessoryForm");
                                var actionInput = document.createElement("input");
                                actionInput.setAttribute("type", "hidden");
                                actionInput.setAttribute("name", "action");
                                actionInput.setAttribute("value", "UpdateA");
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
