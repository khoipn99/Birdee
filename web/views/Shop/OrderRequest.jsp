<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shope Order</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>

        <%@ include file="../../includes/admin_header.jsp" %>
        <%@ include file="navbarShop.jsp" %>

        <!-- Admin Products wrapper -->
        <section style="margin-left: 280px; height: calc(100vh - 83px); overflow-y: auto;">
            <div class="p-4 mb-5">
                <h5>
                    Tất cả đơn mua hàng
                </h5>

                <form action="orderRequest" method="post">
                    <div class="mt-3 d-flex gap-4 align-items-center">
                        <div class="form-outline" style="width: 100%;">
                            <input type="hidden" value="search" name="action">
                            <input type="text" name="textSearch" id="form12" class="form-control" placeholder="Tìm kiếm..." value="${textSearch}"/>
                        </div>
                        <select name="sortOption" class="form-select" id="city">
                            <option value="-1" 
                                    <c:if test="${sortOption == -1}">
                                        selected
                                    </c:if>
                                    >Mặc định</option>
                            <option value="1" 
                                    <c:if test="${sortOption == 1}">
                                        selected
                                    </c:if>
                                    >Ngày tăng dần</option>
                            <option value="2"
                                    <c:if test="${sortOption == 2}">
                                        selected
                                    </c:if>
                                    >Ngày giảm dần</option>
                            <option value="3"
                                    <c:if test="${sortOption == 3}">
                                        selected
                                    </c:if>
                                    >Số lượng hàng tăng dần</option>
                            <option value="4"
                                    <c:if test="${sortOption == 4}">
                                        selected
                                    </c:if>
                                    >Số lượng hàng giảm dần</option>
                        </select>
                        <button style="border: none;border-radius: 5px;background-color: #21D192" type="submit">Tìm kiếm</button>
                    </div>
                </form>
                <div class="mt-3">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">ID</th>
                                <th scope="col">Đơn hàng</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Khách hàng</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col" style="width: 110px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="od" items="${list}">
                                <tr>
                                    <th class="d-flex align-items-center" style="height: 78px;" scope="row">${od.oderDetailsID}</thc>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            <h6>
                                                ${od.product.name}
                                                <c:if test="${od.product.classValue != null}">
                                                    <p style="font-size: 12px;color: gray">- ${od.product.classValue}</p>
                                                </c:if>
                                            </h6>
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${od.quantity}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${od.order.dateTime}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            <a href="#">${od.order.orderFromUser.fullName}</a>
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            <c:set var="totalPrice" value="${od.product.price * od.quantity}">
                                            </c:set>

                                            <fmt:formatNumber value="${totalPrice}" pattern="#,##0.000" var="formattedNumber" />
                                            ${formattedNumber}đ
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            <a>${od.order.customerAddress}</a>
                                        </div>
                                    </td>
                                    <td class="d-flex gap-2 align-items-center" style=" height: 78px;">
                                        <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#updateItem_${od.oderDetailsID}">
                                            <i class="fa-regular fa-circle-check"></i>
                                        </button>
                                        <!-- Modal Approve Detail-->
                                        <div class="modal fade" id="updateItem_${od.oderDetailsID}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Xác nhận hành động</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <form method="POST" action="orderRequest">
                                                            <input type="hidden" value="approve" name="action">
                                                            <input type="hidden" value="true" name="approve">
                                                            <input type="hidden" value="${od.oderDetailsID}" name="id">
                                                            <div class="col mb-4">
                                                                <h6>Bạn muốn xác nhận và giao đơn hàng có ID: ${od.oderDetailsID}</h6>
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
                                                data-bs-target="#deleteItem_${od.oderDetailsID}">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <!-- Modal Deny Detail-->
                                        <div class="modal fade" id="deleteItem_${od.oderDetailsID}" tabindex="-1"
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
                                                            <h6>Bạn từ chối đơn hàng có ID: ${od.oderDetailsID}?</h6>
                                                        </div>
                                                    </div>
                                                    <form action="orderRequest" method="post">
                                                        <input type="hidden" value="approve" name="action">
                                                        <input type="hidden" value="false" name="approve">
                                                        <input type="hidden" value="${od.oderDetailsID}" name="id">
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
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="d-flex justify-content-center mt-5">
                        <nav aria-label="Page navigation example col-12">
                            <ul class="pagination">
                                <%--For displaying Previous link except for the 1st page --%>
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="orderRequest?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <%--For displaying Page numbers. The when condition does not display
                                            a link for the current page--%>
                                <c:forEach begin="1" end="${noOfPages}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage eq i}"> 
                                            <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="orderRequest?page=${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                <%--For displaying Next link --%>
                                <c:if test="${currentPage lt noOfPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="orderRequest?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
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
