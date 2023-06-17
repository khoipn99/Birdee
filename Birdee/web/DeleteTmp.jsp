<%-- 
    Document   : DeleteTmp
    Created on : Jun 14, 2023, 1:58:11 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.BirdDAO" %>
<%@page import="dao.AccessoryDAO"  %>
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
        <title>Delete Table</title>
    </head>
    <body>
        <header>
            <%@ include file = "Shopstaff_Navbar.jsp"%>
        </header>
        <h1 class="top1">Bird Table Deleted</h1>
        <div class="container">
            <div id="alertContainer" class="container">
            </div>
            <div class="border border-2 border-dark">
                <form action="MainController" method="post">
                    <table id="birdTable" class="display table-hoover align-middle" style="width:100%;">
                        <thead>
                            <tr>
                                <th>IMG</th>
                                <th>Bird name</th>
                                <th>Date of birth</th>
                                <th>Gender</th>
                                <th>Height</th>
                                <th>Weight</th>
                                <th>Origin</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="BL" items="${requestScope.bird}">
                                <tr>
                                    <td>
                                        <c:forEach var="url" items="${BirdDAO.getBirdImg(BL.getBird_id())}">
                                            <img class="img-thumbnail" alt="..." src="${url}">
                                        </c:forEach>
                                    </td>
                            <input type="hidden" name="BirdID" value="${BL.getBird_id()}"/>
                            <input type="hidden" name="shopEmail" value="${sessionScope.cEmail}">
                            <td>
                                <input type="hidden" name="Birdname" value="${BL.getBird_name()}"/>
                                ${BL.getBird_name()}
                            </td>
                            <td>
                                <input type="hidden" name="dob" value="${BL.getDob()}"/>
                                <span>${BL.getDob()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="gender" value="${BL.isGender()}"/>
                                <span>${BL.isGender()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="height" value="${BL.getHeight()}"/>
                                <span>${BL.getHeight()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="weight" value="${BL.getWeight()}"/>
                                <span>${BL.getWeight()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="origin" value="${BL.getOrigin()}"/>
                                <span>${BL.getOrigin()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="description" value="${BL.getDescription()}"/>
                                <span>${BL.getDescription()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="quantity" value="${BL.getQuantity()}"/>
                                <span>${BL.getQuantity()}</span>
                            </td>
                            <td>
                                <input type="hidden" name="price" value="${BL.getPrice()}"/>
                                <span>${BL.getPrice()}</span>
                            </td>
                            <td>
                                <div style="display: flex; align-items: center;">
                                    <button type="button" value="restore" name="action" class="btn btn-link restore-button-B" title="Khôi phục">
                                        <i class="bi bi-pencil">Khôi phục</i> 
                                    </button>
                                </div>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <h1 class="top1">Accessory Table Deleted</h1>
        <div class="container">
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
                                    <button type="button" value="restore" name="action" class="btn btn-link restore-button-A" title="Khôi phục">
                                        <input type="hidden" name="shopEmail" value="${sessionScope.cEmail}">
                                        <input type="hidden" name="A_ID"  value="${AL.getAccessory_id()}">
                                        <i class="bi bi-pencil">Khôi phục</i> 
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
                $(document.body).on('click', '.restore-button-B', function (event) {
                    var birdId = $(this).closest("tr").find("input[name='BirdID']").val();
                    var shopEmail = $(this).closest("tr").find("input[name='shopEmail']").val();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn muốn phục hồi sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((willRestore) => {
                        if (willRestore) {
                            swal({
                                title: "Đã phục hồi thành công!",
                                timer: 1500,
                                buttons: false
                            });
                            setTimeout(function () {
                                window.location = "MainController?action=restore&BirdID=" + birdId + "&shopEmail=" + shopEmail;
                            }, 2000);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $(document.body).on('click', '.restore-button-A', function (event) {
                    var A_ID = $(this).closest("tr").find("input[name='A_ID']").val();
                    var shopEmail = $(this).closest("tr").find("input[name='shopEmail']").val();
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn muốn phục hồi sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((willRestore) => {
                        if (willRestore) {
                            swal({
                                title: "Đã phục hồi thành công!",
                                timer: 1500,
                                buttons: false
                            });
                            setTimeout(function () {
                                window.location = "MainController?action=restore&A_ID=" + A_ID + "&shopEmail=" + shopEmail;
                            }, 2000);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
