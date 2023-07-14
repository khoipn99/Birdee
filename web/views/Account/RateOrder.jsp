<%-- 
    Document   : RateOrder
    Created on : Jul 12, 2023, 9:48:17 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="../../css/account.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/layout.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/MyModal.css" rel="stylesheet" type="text/css"/>
        <script src="script.js"></script>
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }

            /* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>
    </head>
    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div style="margin: 5%">
            <!-- Admin Products wrapper -->
            <section>
                <div class="p-4 mb-5">
                    <h5>
                        Đơn hàng
                    </h5>
                    <div class="mt-3">
                        <table class="table">
                            <thead>
                                <tr style="background-color: #21D19240;">
                                    <th scope="col">Đơn hàng</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Ngày đặt hàng</th>
                                    <th scope="col">Số điện thoại đặt hàng</th>
                                    <th scope="col">Thành tiền</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col" style="width: 110px;">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="od" items="${list}">
                                    <tr>
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
                                                ${od.order.customerPhone}
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
                                                ${od.order.customerAddress}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center" style="height: 100%;">
                                                ${od.statusOrder.statusValue}
                                            </div>
                                        </td>
                                        <td style=" height: 78px;">
                                            <c:if test="${od.statusOrder.statusOrderID == 3 && od.isRated == false}">
                                                <div class="d-flex align-items-center" style="height: 100%;">
                                                    <button onclick="rateProduct('${od.oderDetailsID}')" style="border: none;border-radius: 5px; background-color: greenyellow;padding: 5px">
                                                        Đánh giá
                                                    </button>
                                                </div>
                                            </c:if>
                                            <c:if test="${od.statusOrder.statusOrderID == 2 || od.statusOrder.statusOrderID == 1}">
                                                <form id="cancel_${od.oderDetailsID}" action="rateOrder" method="post">
                                                    <input type="hidden" value="${orderDetailID}" name="id">
                                                    <input type="hidden" value="cancel" name="action">
                                                    <input type="hidden" value="${od.oderDetailsID}" name="idOrder">
                                                    <button type="button" onclick="cancelOrder('${od.oderDetailsID}')" style="border: none;border-radius: 5px; background-color: red;padding: 5px">
                                                        Hủy
                                                    </button>
                                                </form>
                                            </c:if>
                                            <c:if test="${od.isRated == true}">
                                                <div class="d-flex align-items-center" style="height: 100%;">
                                                    <span>Đã đánh giá</span>
                                                </div>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <%@ include file="../../includes/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                                                        function cancelOrder(id) {
                                                            var isCancel = confirm("Bạn có chắc hủy đơn hàng này?");
                                                            if (isCancel) {
                                                                document.getElementById('cancel_' + id).submit();
                                                            }
                                                        }

                                                        function rateProduct(id) {
                                                            window.location.href = "rateProduct?id=" + id;
                                                        }
        </script>
    </body>
</html>
