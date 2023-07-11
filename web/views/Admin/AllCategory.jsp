<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Product</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>

        <%@ include file="../../includes/admin_header.jsp" %>
        <%@ include file="../../includes/admin_left.jsp" %>

        <!-- Admin Products wrapper -->
        <section style="margin-left: 280px; height: calc(100vh - 83px); overflow-y: auto;">
            <div class="p-4 mb-5">
                <h5>
                    Quản lý loại sản phẩm
                </h5>
                <div class="d-flex justify-content-end mt-4">
                    <a style="width: 200px;" data-bs-target="#addItem" data-bs-toggle="modal" type="button"
                       class="btn btn-success">
                        <i class="fa-solid fa-plus"></i>
                        Thêm loại sản phẩm</a>
                </div>
                <!-- <div class="mt-3 d-flex gap-4 align-items-center">
                    <div class="form-outline" style="width: 100%;">
                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                    </div>
                    <select class="form-select" style="width: 200px;" id="city" required="">
                        <option value="">Chọn loại sản phẩm</option>
                        <option>Tất cả</option>
                        <option>Chim cảnh</option>
                    </select>
                </div> -->
                <div class="mt-4">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">#</th>
                                <th scope="col">Loại sản phẩm</th>
                                <th scope="col">Mô tả</th>                                
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="d-flex align-items-center" style="height: 78px;" scope="row">1</thc>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        Chim cảnh
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center text-truncate" style="height: 100%; max-width: 100px">
                                        Mô ta description
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        Chim cảnh
                                    </div>
                                </td>
                                <td class="d-flex gap-2 align-items-center" style="height: 78px;">
                                    <!-- Edit button -->
                                    <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                            data-bs-target="#updateItem">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                    <!-- Modal Edit Detail-->
                                    <div class="modal fade" id="updateItem" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Cập nhật loại sản phẩm
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <div class="modal-body">
                                                    <form method="POST" action="/Category/Update" class="register-form"
                                                          id="register-form" enctype="multipart/form-data">
                                                        <div class="col mb-4">
                                                            <div>
                                                                <div class="mb-3">
                                                                    <label for="category-film" class="col-form-label">Loại
                                                                        sản phẩm:</label>
                                                                    <input type="text" class="form-control"
                                                                           id="category-film" name="name" required>
                                                                </div>
                                                                <div>
                                                                    <label for="category-film" class="col-form-label">Mô
                                                                        tả:</label>
                                                                    <textarea class="form-control" cols="30" rows="5"
                                                                              name="description"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Delete button  -->
                                    <button type="button" class="btn btn-outline-danger me-2" data-bs-toggle="modal"
                                            data-bs-target="#deleteItem">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <!-- Modal Delete Detail-->
                                    <div class="modal fade" id="deleteItem" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa
                                                        loại sản phẩm
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <div class="modal-body">
                                                    Chim cảnh
                                                </div>
                                                <form action="/Product/Delete" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id"
                                                           value="@item.id_book">
                                                    <div class="modal-footer">
                                                        <button style="width:100px" type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                        <button style="width:100px" type="submit" class="btn btn-danger">
                                                            Xóa</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <%@ include file="../../includes/admin_footer.jsp" %>

        </section>

        <!-- Modal Add Category Detail-->
        <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm loại sản phẩm
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="/Category/Add" class="register-form" id="register-form"
                              enctype="multipart/form-data">
                            <div class="col mb-4">
                                <div>
                                    <div class="mb-3">
                                        <label for="category-film" class="col-form-label">Loại
                                            sản phẩm:</label>
                                        <input type="text" class="form-control" id="category-film" name="name" required>
                                    </div>
                                    <div>
                                        <label for="category-film" class="col-form-label">Mô
                                            tả:</label>
                                        <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Đóng
                            </button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</html>
