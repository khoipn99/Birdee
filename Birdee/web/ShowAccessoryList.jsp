<%-- 
    Document   : ShowAccessoryList
    Created on : Jun 16, 2023, 4:57:16 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.AccessoryDAO" %>
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
        <title>Show Accessory</title>
    </head>
    <body>
        <header>
            <%@ include file = "Shopstaff_Navbar.jsp"%>
        </header>
        <h1 class="top1">Accessory</h1>
        <div class="container">
            <div style="margin: 10px">
                <form action="AddAccessoryForm.jsp" method="POST">
                    <button class="btn btn-success" type="submit">Add Accessory</button>
                </form>    
            </div>
            <div class="border border-2 border-dark">
                <table id="accessoryTable" class="display table-hoover align-middle" style="width:100%;">
                    <thead>
                        <tr>
                            <th>IMG</th>
                            <th>Accessory name</th>
                            <th>Description</th>
                            <th>Quantity</th>           
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="AL" items="${requestScope.accessory}">
                            <tr >
                                <td>
                                    <c:forEach var="url" items="${AccessoryDAO.getAccessoryImg(AL.getAccessory_id())}">
                                        <img class="ShopIMG" alt="..." src="${url}">
                                    </c:forEach>
                                </td>
                                <td>${AL.getName()}</td>
                                <td>${AL.getDescription()}</td>
                                <td>${AL.getQuantity()}</td>
                                <td>${AL.getPrice()}</td>
                        <form action="MainController" method="POST">
                            <td>
                                <div style="display: flex; align-items: center;">
                                    <button type="button" class="btn btn-danger delete-button">
                                        <input type="hidden" name="shopEmail" value="${sessionScope.cEmail}">
                                        <input type="hidden" name="A_ID"  value="${AL.getAccessory_id()}">
                                        <i class="bi bi-trash"></i> Xóa
                                    </button>
                                    <button type="submit" value="UpdateAccessoryF" name="action" class="btn btn-link" onclick="showEditForm(${AL.getAccessory_id()})">
                                        <input type="hidden" name="A_ID"  value="${AL.getAccessory_id()}">
                                        <i class="bi bi-pencil"></i> Chỉnh sửa
                                    </button>
                                </div>
                            </td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="shopStaff.js"></script>
        <script>
            $(document).ready(function () {
                $(document.body).on('click', '.delete-button', function (event) {
                    var A_ID = $(this).closest("tr").find("input[name='A_ID']").val();
                    var shopEmail = $(this).closest("tr").find("input[name='shopEmail']").val();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn muốn phụ kiện này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((Confirm) => {
                        if (Confirm) {
                            swal({
                                title: "Đã xóa phụ kiện thành công!",
                                timer: 1000,
                                buttons: false
                            });
                            setTimeout(function () {
                                window.location = "MainController?action=deleteTemp&A_ID=" + A_ID + "&shopEmail=" + shopEmail;
                            }, 2000);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
