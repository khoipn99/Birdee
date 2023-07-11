<%@page contentType="text/html" pageEncoding="UTF-8" %>

<section class="position-absolute d-flex flex-column flex-shrink-0 p-3"
         style="width: 280px; height: calc(100vh - 83px); z-index: 10; background-color: #c8325230;">
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="/admin-request.html" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-solid fa-cart-shopping me-2"></i>Đơn hàng mua
            </a>
        </li>
        <li>
            <a href="/admin-category.html" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-regular fa-copyright me-2"></i>Loại sản phẩm
            </a>
        </li>
        <li>
            <a href="/admin-product.html" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16">
                <use xlink:href="#grid"></use>
                </svg>
                <i class="fa-solid fa-gift me-2"></i>Sản phẩm
            </a>
        </li>
    </ul>
    <hr>
    <div class="dropdown">
        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
           id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
            <strong>Admin</strong>
        </a>
        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
            <li><a class="dropdown-item" href="#">Sign out</a></li>
        </ul>
    </div>
</section>