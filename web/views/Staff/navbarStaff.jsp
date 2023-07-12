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
        <li class="nav-item">
            <a href="/adminDashboard" class="nav-link">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#speedometer2"></use>
                </svg>
                <i class="fa-solid fa-chart-line me-2"></i>Thống kê
            </a>
        </li>
        <li>
            <a href="/adminUser" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-solid fa-user-tie me-2"></i>Nhân viên
            </a>
        </li>
    </ul>
    <hr>
    <div class="dropdown">
        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
           id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
            <strong>Admin</strong>
        </a>
        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
            <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
        </ul>
    </div>
</section>
