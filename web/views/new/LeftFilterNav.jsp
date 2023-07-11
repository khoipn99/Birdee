<%-- 
    Document   : LeftFilterNav
    Created on : May 26, 2023, 6:04:08 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Left Filter Wrapper-->
<div class="list-filter-left-content d-none d-lg-block col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
    <div class="mb-3">
        <a href="#" class="text-decoration-none text-black">
            <h6 class="text-uppercase">For him</h6>
        </a>
        <a href="#" class="text-decoration-none text-black">
            <h6 class="text-uppercase">For her</h6>
        </a>
        <a href="#" class="text-decoration-none text-black">
            <h6 class="text-uppercase">For life</h6>
        </a>
    </div>
    <div style="height: 1px; width: 100%; background-color: #00000030; margin-bottom: 16px;"></div>
    <div class="mb-3">
        <h6 class="text-uppercase">Cấp độ thương hiệu</h6>
        <ul style="padding-left: 0;">
            <li class="list-group-item">
                <label class="d-flex align-items-center gap-2">
                    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                    <img
                        src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/5-sao.svg?1678953238323" />
                    5 sao
                </label>
            </li>
            <li class="list-group-item d-flex align-items-center gap-2">
                <label class="d-flex align-items-center gap-2">
                    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                    <img
                        src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/4-sao.svg?1678953238323" />
                    4 sao
                </label>
            </li>
            <li class="list-group-item d-flex align-items-center gap-2">
                <label class="d-flex align-items-center gap-2">
                    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                    <img
                        src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/3-sao.svg?1678953238323" />
                    3 sao
                </label>
            </li>
            <li class="list-group-item d-flex align-items-center gap-2">
                <label class="d-flex align-items-center gap-2">
                    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                    <img
                        src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/2-sao.svg?1678953238323" />
                    2 sao
                </label>
            </li>
            <li class="list-group-item d-flex align-items-center gap-2">
                <label class="d-flex align-items-center gap-2">
                    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                    <img
                        src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/1-sao.svg?1678953238323" />
                    1 sao
                </label>
            </li>
        </ul>
    </div>
    <div style="height: 1px; width: 100%; background-color: #00000030; margin-bottom: 16px;"></div>
    <div>
        <h6 class="text-uppercase">Giá</h6>
        <div class="wrapper">
            <div class="price-input">
                <div class="field">
                    <input type="number" class="input-min" value="0">
                </div>
                <div class="separator">-</div>
                <div class="field">
                    <input type="number" class="input-max" value="10000000"> đ
                </div>
            </div>
            <div class="slider">
                <div class="progress"></div>
            </div>
            <div class="range-input">
                <input type="range" class="range-min" min="0" max="10000000" value="0" step="100">
                <input type="range" class="range-max" min="0" max="10000000" value="100000000"
                       step="100">
            </div>
        </div>
        <button type="button" class="btn btn-dark mt-3">Lọc giá</button>
    </div>
</div>