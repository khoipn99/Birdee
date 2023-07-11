<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${sessionScope.textSearch == null || sessionScope.textSearch == ''}">
    <div class="title-collection mt-3 mb-3">Sản phẩm </div>
    <div class="list-filter-category-wrapper d-flex justify-content-between align-items-center">
        <div class="list-category-wrapper d-flex gap-2">
            <div class="category-item-wrapper text-truncate text-center rounded-pill">
                Mềm mại
            </div>
            <div class="category-item-wrapper text-truncate text-center rounded-pill">
                Thư giãn mỗi ngày
            </div>
        </div>
        <div class="filter-order-wrappper d-flex align-items-center gap-3">
            <div class="filter-text">Sắp xếp theo</div>
            <!-- <div class="dropdown dropdown-menu-end">
                <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown link
                </a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
            </div> -->
            <form id="frm-sort" action="product" method="post">
                <input type="hidden" name="action" value="sort">
                <select class="form-select" name="sortOption" onchange="submitForm()" aria-label="Default select example">
                    <option value="-1"
                            <c:if test="${sortOption == -1}">selected</c:if>
                                >Mặc định</option>
                            <option value="1"
                            <c:if test="${sortOption == 1}">selected</c:if>
                                >A → Z</option>
                            <option value="2"
                            <c:if test="${sortOption == 2}">selected</c:if>
                                >Z → A</option>
                            <option value="3"
                            <c:if test="${sortOption == 3}">selected</c:if>
                                >Giá tăng dần</option>
                            <option value="4"
                            <c:if test="${sortOption == 4}">selected</c:if>
                                >Giá giảm dần</option>
                    </select>
                </form>
            </div>
        </div>
</c:if>
<script>
    function submitForm() {
        document.getElementById("frm-sort").submit();
    }
</script>