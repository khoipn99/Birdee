<%-- 
    Document   : navbarAdmin
    Created on : Jul 12, 2023, 6:51:41 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Nav bar ADMIN wrapper, DONOT COPY THIS, JUST INCLUDE -->
<section class="position-absolute d-flex flex-column flex-shrink-0 p-3"
         style="width: 280px; height: calc(100vh - 83px); z-index: 10; background-color: #21D19270;">
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="<%= request.getContextPath() %>/orderRequest" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-solid fa-cart-shopping me-2"></i>Yêu cầu mua
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath() %>/listOrder" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-regular fa-copyright me-2"></i>Đơn hàng đã xác nhận
            </a>
        </li>
        <li>
            <a href="/shop/product" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-regular fa-copyright me-2"></i>Quản lý sản phẩm
            </a>
        </li>
    </ul>
    <hr>
    <div class="dropdown">
        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
           id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
            <strong>Hi shop: ${sessionScope.account.fullName}</strong>
        </a>
        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/logout">Đăng xuất</a></li>
        </ul>
    </div>
</section>
