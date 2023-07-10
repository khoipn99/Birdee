<%-- 
    Document   : cartDetails
    Created on : Jun 28, 2023, 8:31:07 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
        <!-- Css for header group  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>
        <!-- This container belong to HEADER; DONT copy to JSP, JUST INCLUDE -->
        <%@include file="../../includes/header.jsp" %>

        <!-- cart wrapper -->
        <section class="p-5">
            <div style="height: 600px">
                <div class="fs-4" style="font-weight: bold;">Kiểm tra lại giỏ hàng trước khi thanh toán</div>
                <div class="mt-2" style="background-color: #00000030; width: 100%; height: 1px;"></div>
                <div class="mt-2">
                    <!-- This section is table of checkout  -->
                    <table class="table mt-3">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">#</th>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Giá tiền</th>
                                <th class="text-center" scope="col">Số lượng</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col" style="width: 280px;">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="d-flex align-items-center" style="height: 78px;" scope="row">1</thc>
                                <td style="width: 30%; height: 78px;">
                                    <div class="d-flex gap-2 align-items-center">
                                        <img src="https://petmaster.vn/petroom/wp-content/uploads/2021/11/cac-nuoi-chim-vanh-khuyen-1.jpg"
                                             class="rounded-2" style="width: 60px; height: 60px; object-fit: contain" />
                                        <h6>Chim Vành khuyên himalaya</h6>
                                    </div>
                                </td>
                                <td style="height: 78px;">20000đ</td>
                                <td style="height: 78px;" class="text-center">2</td>
                                <td style="height: 78px;">40000đ</td>
                                <td class="d-flex gap-2 align-items-center" style="width: 280px; height: 78px;">
                                    <button type="button" class="btn btn-outline-success me-2">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                        Cập nhật</button>
                                    <button type="button" class="btn btn-danger me-2">
                                        <i class="fa-solid fa-trash"></i>
                                        Xóa</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="mt-4 d-flex justify-content-end align-items-center gap-2">
                        <a href="/index.html" type="button" class="btn btn-outline-success me-2">
                            <i class="fa-solid fa-cart-plus"></i>
                            Mua thêm</a>
                        <!-- Using jsp to checkout, if login or not login  -->
                        <a href="/billDetail" type="button" class="btn btn-success me-2">
                            <i class="fa-solid fa-money-check-dollar"></i>
                            Thanh toán</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- This container belong to FOOTER; DONT copy to JSP, JUST INCLUDE -->
        <%@include file="../../includes/footer.jsp" %>
        <%@include file="../../includes/cart.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>