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
                    Quản lý sản phẩm
                </h5>
                <div class="d-flex justify-content-end mt-4">
                    <a style="width: 200px;" data-bs-target="#addItem" data-bs-toggle="modal" type="button"
                       class="btn btn-success">
                        <i class="fa-solid fa-plus"></i>
                        Thêm sản phẩm</a>
                </div>
                <div class="mt-3 d-flex gap-4 align-items-center">
                    <div class="form-outline" style="width: 100%;">
                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                    </div>
                    <select class="form-select" style="width: 200px;" id="city" required="">
                        <option disabled selected value="">Chọn loại sản phẩm</option>
                        <option>Tất cả sản phẩm</option>
                        <c:forEach items="${sessionScope.tags}" var="t">
                            <c:forEach var="c" items="${t.categories}">
                                <option>${c.categoryName}</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
                <div class="mt-4">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">#</th>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Loại sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Mô tả</th>
                                <th scope="col">Giá tiền</th>
                                <th scope="col" style="width: 180px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${requestScope.listProduct}">
                                <% 
                                    String itemName = "#item";
                                %>
                                <tr>
                                    <th class="d-flex align-items-center" style="height: 78px;" scope="row">1</thc>
                                    <td style="width: 30%; height: 78px;">
                                        <div class="d-flex gap-2 align-items-center">
                                            <img src="${product.images[0]}"
                                                 class="rounded-2" style="width: 60px; height: 60px; object-fit: contain;" />
                                            <h6>${product.name}</h6>
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            ${product.category.categoryName}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            ${product.quantity}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            <%= itemName %>
                                        </div>
                                    </td>
                                    <td style="height: 78px; max-width: 100px">
                                        <div class="d-flex align-items-center h-100 text-truncate" style="max-width: 100px;">
                                            ${product.description}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            ${product.price} 
                                        </div>
                                    </td>
                                    <td class="d-flex gap-2 align-items-center" style="width: 180px; height: 78px;">
                                        <button href="/admin-product-detail.html" type="button"
                                                class="btn btn-outline-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#itemDetail">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                        <!--Modal View Detail-->
                                        <div class="modal fade" id="itemDetail" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Chi tiết sản phẩm</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-4 col-12">
                                                                <div>
                                                                    <img style="width: 200px; height: 100%; object-fit: cover; border-radius: 18px;"
                                                                         src="https://petmaster.vn/petroom/wp-content/uploads/2021/11/cac-nuoi-chim-vanh-khuyen-1.jpg"
                                                                         alt="pet-shop">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8 col-12">
                                                                <div
                                                                    style="font-size: 18px; color: #333; margin-bottom: 10px; font-weight: bold;">
                                                                    ${product.category.categoryName}
                                                                </div>
                                                                <h3 style="font-weight: 400; margin-bottom: 8px;"> ${product.name}</h3>
                                                                <div
                                                                    class="d-flex align-items-center gap-3 justify-content-between">
                                                                    <p class="mb-0"
                                                                       style="color: #c83252; font-weight: 700; font-size: 24px;">
                                                                        ${product.price} đ</p>
                                                                    <p class="mb-0">
                                                                        <span style="font-weight: bold;">Số lượng còn
                                                                            lại:</span> ${product.quantity}
                                                                    </p>
                                                                </div>
                                                                <div
                                                                    style="height: 1px; width: 100%; background-color: #33333330;">
                                                                </div>
                                                                <div class="mt-3 mb-4">
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <p class="mb-0"><span
                                                                                    style="font-weight: bold;">Giới tính:</span>
                                                                                Đực</p>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <p class="mb-0"><span
                                                                                    style="font-weight: bold;">Ngày
                                                                                    sinh:</span> 21/02/2001</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-1">
                                                                        <div class="col-4">
                                                                            <p class="mb-0"><span
                                                                                    style="font-weight: bold;">Chiều cao:</span>
                                                                                15cm</p>
                                                                        </div>
                                                                        <div class="col-4">
                                                                            <p class="mb-0"><span style="font-weight: bold;">Cân
                                                                                    nặng:</span> 200g</p>
                                                                        </div>
                                                                        <div class="col-4">
                                                                            <p class="mb-0"><span
                                                                                    style="font-weight: bold;">Xuất sứ:</span>
                                                                                Việt Nam</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="mb-0 mt-1"><span style="font-weight: bold;">Mô tả
                                                                            chi tiết:</span> ${product.description}
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Edit button--> 
                                        <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#updateItem">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <!--Modal Edit Detail-->
                                        <div class="modal fade" id="updateItem" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Cập nhật sản phẩm</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <form method="POST" action="/Product/Edit" class="register-form"
                                                              id="register-form" enctype="multipart/form-data">
                                                            <div class="col">
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Tên
                                                                            sản phẩm:</label>
                                                                        <input value="${product.name}" type="text" class="form-control" id="category-film" name="name" required>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Giá:</label>
                                                                        <input value="${product.price}" type="number" class="form-control" id="category-film" name="price" required>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Loại sản phẩm: </label>
                                                                        <select class="form-select" aria-label="Default select example" id="theloai"
                                                                                name="loaisach" required>
                                                                            <option disabled selected value="">Chọn loại sản phẩm</option>
                                                                            <c:forEach items="${sessionScope.tags}" var="t">
                                                                                <c:forEach var="c" items="${t.categories}">
                                                                                    <option>${c.categoryName}</option>
                                                                                </c:forEach>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Số lượng:</label>
                                                                        <input value="${product.quantity}" type="text" class="form-control" id="category-film" name="quantity">
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Trạng thái:</label>
                                                                        <select class="form-select" aria-label="Default select example" id="theloai"
                                                                                name="loaisach" required>
                                                                            <option disabled selected value="">Chọn trạng thái:</option>
                                                                            <option>Đang bán</option>                                                                        <option>Đang bán</option>
                                                                            <option>Dừng bán</option>
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
                                                                    <textarea class="form-control" cols="30" rows="5" name="description">${product.description}</textarea>
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

                                        <!--Delete button-->  
                                        <button type="button" class="btn btn-outline-danger me-2" data-bs-toggle="modal"
                                                data-bs-target="#deleteItem">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <!--Modal Delete Detail-->
                                        <div class="modal fade" id="deleteItem" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa
                                                            sản phẩm
                                                        </h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        ${product.name} - ${product.price}d
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
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- This container belong to FOOTER of ADMIN, DIFFERENT FROM NORMAL FOOTER; DONT copy to JSP, JUST INCLUDE -->

            <%@ include file="../../includes/admin_footer.jsp" %>

        </section>

        <!-- Modal Add Product Detail-->
        <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
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
                                        <label for="category-film" class="col-form-label">Loại sản phẩm: </label>
                                        <select class="form-select" aria-label="Default select example" id="theloai"
                                                name="loaisach" required>
                                            <option disabled selected value="">Chọn loại sản phẩm</option>
                                            <c:forEach items="${sessionScope.tags}" var="t">
                                                <c:forEach var="c" items="${t.categories}">
                                                    <option>${c.categoryName}</option>
                                                </c:forEach>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Số lượng:</label>
                                        <input type="text" class="form-control" id="category-film" name="quantity">
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Trạng thái:</label>
                                        <input type="text" class="form-control" id="category-film" name="price">
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
            </div>
        </div>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</html>
