<%-- 
    Document   : leftCart
    Created on : Jun 28, 2023, 8:13:38 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal mobile nav responsive -->
<div class="modal left fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Left Sidebar</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Left Side bar
                </p>
            </div>
        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->
<!-- Modal mobile nav responsive-->

<!-- Modal cart, CUT IN IN SEPARATE JSP FILE -->
<div class="modal right fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Giỏ hàng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <c:if test="${sessionScope.account != null}">
                <!-- List items in Cart Will Show here -->
                <div class="modal-body">
                    <!-- Firt item -->
                    <div class="row">
                        <div class="col-4">
                            <img src="https://petmaster.vn/petroom/wp-content/uploads/2021/11/cac-nuoi-chim-vanh-khuyen-1.jpg"
                                 class="rounded-2" style="width: 100%; height: 100%; object-fit: contain" />
                        </div>
                        <div class="col-8">
                            <h6>Chim Vành khuyên himalaya</h6>
                            <div style="color: #c83152;">
                                390000₫
                            </div>
                            Số lượng: <input type="number" style="width: 100px; margin-top: 4px;" name="qty" value="1">
                        </div>
                    </div>
                </div>
                <!-- List items in Cart Will Show here -->

                <div class="modal-footer d-block w-100">
                    <form action="billDetail">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6>Tổng tiền:</h6>
                            <p style="color: #c83252; font-weight: bold; ">120.000 đ</p>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Thanh toán</button>
                    </form>
                </div>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <div class="text-center w-100">
                    <p style="color: #c83252; font-weight: bold; ">Bạn cần đăng nhập để xem giỏ hàng</p>       
                </div>
            </c:if>
        </div>
    </div>
</div>

