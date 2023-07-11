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
                    Tất cả đơn mua hàng
                </h5>
                <div class="mt-3 d-flex gap-4 align-items-center">
                    <div class="form-outline" style="width: 100%;">
                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                    </div>
                    <select class="form-select" style="width: 200px;" id="city" required="">
                        <option value="">Chọn loại sản phẩm</option>
                        <option>Tất cả</option>
                        <option>Chim cảnh</option>
                    </select>
                </div>
                <div class="mt-3">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">#</th>
                                <th scope="col">Đơn hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col">Khách hàng</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col" style="width: 110px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="d-flex align-items-center" style="height: 78px;" scope="row">1</thc>
                                <td style="width: 20%; height: 78px;">
                                    <div class="d-flex gap-2 align-items-center" style="height: 100%;">
                                        <h6>Chim vành khuyên</h6>
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        22/12/2001
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        Đực
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        20000đ
                                    </div>
                                </td>
                                <td style="height: 78px;">
                                    <div class="d-flex align-items-center" style="height: 100%;">
                                        Ðã giao hàng
                                    </div>
                                </td>
                                <td class="d-flex gap-2 align-items-center" style=" height: 78px;">
                                    
                                    <!--click this item to go to OrderDetail.jsp-->
                                    <button type="button" class="btn btn-outline-success me-2">
                                        <i class="fa-solid fa-eye"></i>
                                    </button>

                                    <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                            data-bs-target="#updateItem">
                                        <i class="fa-regular fa-circle-check"></i>
                                    </button>
                                    <!-- Modal Approve Detail-->
                                    <div class="modal fade" id="updateItem" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận hành động</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <div class="modal-body">
                                                    <form method="POST" action="/Product/Add" class="register-form"
                                                          id="register-form" enctype="multipart/form-data">
                                                        <div class="col mb-4">
                                                            <h6>Bạn có chắc chắn muốn đăng bán sản phẩm này trên trang web
                                                                của mình không?</h6>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-outline-danger me-2" data-bs-toggle="modal"
                                            data-bs-target="#deleteItem">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <!-- Modal Deny Detail-->
                                    <div class="modal fade" id="deleteItem" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận hành động</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="col mb-4">
                                                        <h6>Bạn có chắc chắn muốn từ chối đăng bán sản phẩm này trên trang
                                                            web
                                                            của mình không?</h6>
                                                    </div>
                                                </div>
                                                <form action="/Product/Delete" method="post">
                                                    <input type="hidden" class="form-control" id="id" name="id"
                                                           value="@item.id_book">
                                                    <div class="modal-footer">
                                                        <button style="width:100px" type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Close
                                                        </button>
                                                        <button style="width:100px" type="submit" class="btn btn-danger">
                                                            Delete</button>
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
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</html>
