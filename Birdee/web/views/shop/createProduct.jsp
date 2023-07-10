<%-- 
    Document   : home
    Created on : Jun 27, 2023, 6:36:16 PM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- This container belong to HEADER -->
        <%@include file="../../includes/header.jsp" %>

        <!-- seller product wrapper  -->
        <section class="p-5 container">
            <div>
                <h4>Đăng bán một sản phẩm mới</h4>
                <div>
                    <form method="POST" action="/Product/Add" class="register-form" id="register-form"
                          enctype="multipart/form-data">
                        <div class="col">
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Tên
                                        sản phẩm:</label>
                                    <input type="text" class="form-control" id="category-film" name="name" required>
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Giá:</label>
                                    <input type="number" class="form-control" id="category-film" name="price" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Loại
                                        sản phẩm: </label>
                                    <select class="form-select" aria-label="Default select example" id="theloai"
                                            name="loaisach" required>
                                        <option value="" selected>Choose category</option>
                                        <option value="@item1.id_category">@item1.name
                                        </option>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Xuất
                                        xứ:</label>
                                    <input type="number" class="form-control" id="category-film" name="origin">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Cân
                                        nặng:</label>
                                    <input type="text" class="form-control" id="category-film" name="weight">
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Chiều
                                        cao:</label>
                                    <input type="number" class="form-control" id="category-film" name="price">
                                </div>
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Giới
                                        tính:</label>
                                    <select class="form-select" style="width: 200px;" id="city" required="">
                                        <option value="">Chọn giới tính</option>
                                        <option>Đực</option>
                                        <option>Cái</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 mt-3">
                                <label for="exampleFormControlFile1">Ảnh:</label>
                                <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*"
                                       required>
                            </div>
                            <div class="mb-3">
                                <label for="category-film" class="col-form-label">Mô
                                    tả:</label>
                                <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                            </div>
                        </div>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Đóng
                        </button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                </div>
            </div>
        </section>
        <%@include file="../../includes/footer.jsp" %>
        <%@include file="../../includes/cart.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>