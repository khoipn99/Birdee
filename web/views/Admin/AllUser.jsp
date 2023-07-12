<%-- 
    Document   : AllUser
    Created on : Jul 11, 2023, 8:15:40 PM
    Author     : nguyenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>

        <%@ include file="../../includes/admin_header.jsp" %>
        <%@ include file="navbarAdmin.jsp" %>

        <!-- Admin Products wrapper -->
        <section style="margin-left: 280px; height: calc(100vh - 83px); overflow-y: auto;">
            <div class="p-4">
                <h5>
                    Quản lý nhân viên
                </h5>
                <div class="d-flex justify-content-end mt-4">
                    <a style="width: 200px;" data-bs-target="#addItem" data-bs-toggle="modal" type="button"
                       class="btn btn-success">
                        <i class="fa-solid fa-plus"></i>
                        Thêm nhân viên</a>
                </div>
                <div class="mt-3 d-flex gap-4 align-items-center">
                    <div class="form-outline" style="width: 100%;">
                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                    </div>
                    <!-- <select class="form-select" style="width: 200px;" id="city" required="">
                        <option value="">Chọn loại sản phẩm</option>
                        <option>Tất cả</option>
                        <option>Chim cảnh</option>
                    </select> -->
                </div>
                <div class="mt-4">
                    <c:if test="${not empty message}">
                        <p class="text-danger fw-bold">${message}</p>
                    </c:if>
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">#</th>
                                <th scope="col">Tên nhân viên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Ngày sinh</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Vai trò</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="i" value="0" />
                            <c:forEach var="user" items="${users}">
                                <c:set var="i" value="${Integer.parseInt(i) + 1}" />
                                <tr>
                                    <th class="d-flex align-items-center" style="height: 78px;" scope="row">${i}</thc>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${user.fullName}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${user.email}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${user.dob}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${user.address}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${user.role.name}
                                        </div>
                                    </td>
                                    <td class="d-flex gap-2 align-items-center" style="height: 78px;">
                                        <button href="/admin-product-detail.html" type="button"
                                                class="btn btn-outline-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#view_user-${user.userID}">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                        <!-- Modal View Detail-->
                                        <div class="modal fade" id="view_user-${user.userID}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Thông tin nhân viên
                                                        </h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-4 col-12">
                                                                <div>
                                                                    <img style="width: 100%; height: 200px; object-fit: cover; border-radius: 18px;"
                                                                         src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"
                                                                         alt="pet-shop">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8 col-12">
                                                                <h3 style="font-weight: 400; margin-bottom: 8px;">${user.fullName}
                                                                </h3>
                                                                <div
                                                                    class="d-flex align-items-center gap-3 justify-content-between">
                                                                    <p class="mb-0" style="font-weight: 700; font-size: 16px;">
                                                                        ${user.email}</p>
                                                                    <p class="mb-0">
                                                                        <span style="font-weight: bold;">Vai trò:</span> ${user.role.name}
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
                                                                                ${user.gender}</p>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <p class="mb-0"><span
                                                                                    style="font-weight: bold;">Ngày
                                                                                    sinh:</span> ${user.dob}</p>
                                                                        </div>
                                                                    </div>
                                                                    <p class="mb-0 mt-1"><span style="font-weight: bold;">Địa
                                                                            chỉ:</span> ${user.address}
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

                                        <!-- Edit button -->
                                        <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#update_user-${user.userID}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <!-- Modal Edit Detail-->
                                        <div class="modal fade" id="update_user-${user.userID}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Sửa nhân viên
                                                        </h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <form method="POST" action="/adminUserUpdate" class="update-form"
                                                              id="update-form" >
                                                            <div class="col mb-3">
                                                                <input type="hidden" name="userID" value="${user.userID}">
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Tên
                                                                            nhân viên:</label>
                                                                        <input type="text" class="form-control"
                                                                               id="category-film" name="fullName" value="${user.fullName}" required>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Ngày
                                                                            sinh:</label>
                                                                        <input type="date" class="form-control"
                                                                               id="category-film" name="dob" value="${user.dob}" required>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Giới
                                                                            tính: </label>
                                                                        <select class="form-select"
                                                                                aria-label="Default select example" id="gender"
                                                                                name="gender" required>
                                                                            <option disabled>Chọn giới tính</option>
                                                                            <c:choose>
                                                                                <c:when test='${user.gender eq "Nam"}'>
                                                                                    <option value="Nam" selected>Nam</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="Nam">Nam</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <c:choose>
                                                                                <c:when test='${user.gender eq "Nữ"}'>
                                                                                    <option value="Nữ" selected>Nữ</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="Nữ">Nữ</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="category-film"
                                                                               class="col-form-label">Gmail:</label>
                                                                        <input type="text" class="form-control"
                                                                               id="category-film" name="email" value="${user.email}">
                                                                        <c:if test="${EMAIL_INVALID}">
                                                                            <span class="text-danger">Email already existed!</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3 mt-3">
                                                                    <label for="exampleFormControlFile1">Ảnh:</label>
                                                                    <input type="file" class="form-control-file mt-2"
                                                                           name="file" id="file" accept="image/*"s>
                                                                </div>
                                                                <!--                                                                <div class="mt-3">
                                                                                                                                    Địa chỉ:
                                                                                                                                </div>
                                                                                                                                <div class="row mt-2">
                                                                                                                                    <div class="col-4">
                                                                                                                                        <select class="form-select" id="city" required="">
                                                                                                                                            <option value="">Chọn tỉnh/ thành phố</option>
                                                                                                                                            <option>Hà Nội</option>
                                                                                                                                        </select>
                                                                                                                                    </div>
                                                                                                                                    <div class="col-4">
                                                                                                                                        <select class="form-select" id="ward" required="">
                                                                                                                                            <option value="">Chọn quận/ huyện</option>
                                                                                                                                            <option>Hà Nội</option>
                                                                                                                                        </select>
                                                                                                                                    </div>
                                                                                                                                    <div class="col-4">
                                                                                                                                        <select class="form-select" id="street" required="">
                                                                                                                                            <option value="">Chọn phường/ xã</option>
                                                                                                                                            <option>Từ Liêm</option>
                                                                                                                                        </select>
                                                                                                                                    </div>
                                                                                                                                </div>-->
                                                                <div class="mt-2 mb-3">
                                                                    <label for="category-film" class="col-form-label">Địa chỉ
                                                                        chi tiết:</label>
                                                                    <input type="text" class="form-control" id="category-film"
                                                                           name="address" value="${user.address}">
                                                                </div>
                                                                <!-- <div class="mb-3">
                                                                    <label for="category-film" class="col-form-label">Mô
                                                                        tả:</label>
                                                                    <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                                                                </div> -->
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
                                                data-bs-target="#delete_user-${user.userID}">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <!-- Modal Delete Detail-->
                                        <div class="modal fade" id="delete_user-${user.userID}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa
                                                            nhân viên
                                                        </h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        ${user.fullName}
                                                    </div>
                                                    <form action="/adminUserDelete" method="post">
                                                        <input type="hidden" class="form-control" id="id" name="userID"
                                                               value="${user.userID}">
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
            <footer class="position-absolute bottom-0 end-0 start-0 text-center p-3" style="background-color: #21D192">
                © 2023 Copyright by Birdee
            </footer>
        </section>

        <!-- Modal Add Product Detail-->
        <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm nhân viên mới
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="/adminUserAdd" class="register-form" id="register-form"
                              >
                            <div class="col mb-3">
                                <div class="row">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Tên nhân viên:</label>
                                        <input type="text" class="form-control" id="category-film" name="fullName" required>
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Ngày sinh:</label>
                                        <input type="date" class="form-control" id="category-film" name="dob" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Giới tính: </label>
                                        <select class="form-select" aria-label="Default select example" id="gender"
                                                name="gender" required>
                                            <option selected disabled>Chọn giới tính</option>
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Gmail:</label>
                                        <input type="email" class="form-control" id="category-film" name="email">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Số điện thoại:</label>
                                        <input type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Mật khẩu:</label>
                                        <input type="text" class="form-control" id="password" name="password">
                                    </div>
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="exampleFormControlFile1">Ảnh:</label>
                                    <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*"
                                           >
                                </div>
                                <!--                                <div class="mt-3">
                                                                    Địa chỉ:
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-4">
                                                                        <select class="form-select" id="city" required="">
                                                                            <option value="">Chọn tỉnh/ thành phố</option>
                                                                            <option>Hà Nội</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <select class="form-select" id="ward" required="">
                                                                            <option value="">Chọn quận/ huyện</option>
                                                                            <option>Hà Nội</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <select class="form-select" id="street" required="">
                                                                            <option value="">Chọn phường/ xã</option>
                                                                            <option>Từ Liêm</option>
                                                                        </select>
                                                                    </div>
                                                                </div>-->
                                <div class="mt-2 mb-3">
                                    <label for="category-film" class="col-form-label">Địa chỉ chi tiết:</label>
                                    <input type="text" class="form-control" id="category-film" name="address">
                                </div>
                                <!-- <div class="mb-3">
                                    <label for="category-film" class="col-form-label">Mô
                                        tả:</label>
                                    <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                                </div> -->
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
