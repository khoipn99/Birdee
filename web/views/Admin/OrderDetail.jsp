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
                <div class="d-flex gap-3 align-items-center">
                    <!--Href to page order request--> 
                    <a>
                        <i class="fa-solid fa-chevron-left"></i>
                    </a>
                    <h5 class="mb-0">
                        Chi tiết đơn hàng 
                    </h5>
                </div>
                <div class="mt-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="container mb-5 mt-3">
                                <div class="d-flex align-items-center gap-3 justify-content-between">
                                    <p class="mb-0" style="color: #7e8d9f;font-size: 20px;">Invoice &gt;&gt; <strong>ID: #123-123</strong>
                                    </p>
                                    <select class="form-select" style="width: 200px;" id="city" required="">
                                        <option disabled selected hidden>Chọn trạng thái</option>
                                        <option>Ðang giao hàng</option>
                                        <option>Ðã giao hàng</option>
                                    </select>
                                </div>
                                <div class="container mt-3">
                                    <div class="row">
                                        <div class="col-xl-8">
                                            <ul class="list-unstyled">
                                                <li class="text-muted">To: <span style="color:#8f8061 ;">John Bootstrap</span></li>
                                                <li class="text-muted">Street, City</li>
                                                <li class="text-muted">State, Country</li>
                                                <li class="text-muted"><i class="fas fa-phone"></i> 123-456-789</li>
                                            </ul>
                                        </div>
                                        <div class="col-xl-4">
                                            <ul class="list-unstyled">
                                                <li class="text-muted"><i class="fas fa-circle" style="color:#8f8061 ;"></i> <span
                                                        class="fw-bold">ID:</span>#123-456</li>
                                                <li class="text-muted"><i class="fas fa-circle" style="color:#8f8061 ;"></i> <span
                                                        class="fw-bold">Creation Date: </span>Jun 23,2021</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row my-2 mx-1 justify-content-center">
                                        <table class="table table-striped table-borderless">
                                            <thead style="background-color:#84B0CA ;" class="text-white">
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Qty</th>
                                                    <th scope="col">Unit Price</th>
                                                    <th scope="col">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td class="d-flex align-items-center gap-2">
                                                        <img class="rounded-3" style="width: 40px; height: 40px; object-fit: cover;"
                                                             src="https://inoxthaian.vn/wp-content/uploads/2021/02/hinh-anh-chim-chao-mao-trong-tu-nhien.jpg"
                                                             alt="birdee">
                                                        <div style="font-weight: bold;" class="text-center">Chim
                                                            cảnh</div>
                                                    </td>
                                                    <td>4</td>
                                                    <td>$200</td>
                                                    <td>$800</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td class="d-flex align-items-center gap-2">
                                                        <img class="rounded-3" style="width: 40px; height: 40px; object-fit: cover;"
                                                             src="https://inoxthaian.vn/wp-content/uploads/2021/02/hinh-anh-chim-chao-mao-trong-tu-nhien.jpg"
                                                             alt="birdee">
                                                        <div style="font-weight: bold;" class="text-center">Chim
                                                            cảnh</div>
                                                    </td>
                                                    <td>1</td>
                                                    <td>$10</td>
                                                    <td>$10</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td class="d-flex align-items-center gap-2">
                                                        <img class="rounded-3" style="width: 40px; height: 40px; object-fit: cover;"
                                                             src="https://inoxthaian.vn/wp-content/uploads/2021/02/hinh-anh-chim-chao-mao-trong-tu-nhien.jpg"
                                                             alt="birdee">
                                                        <div style="font-weight: bold;" class="text-center">Chim
                                                            cảnh</div>
                                                    </td>
                                                    <td>1</td>
                                                    <td>$300</td>
                                                    <td>$300</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <p class="text-black float-start text-end"><span class="text-black me-3"> Total
                                                Amount</span><span style="font-size: 25px;">$1221</span></p>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
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
