<%-- 
    Document   : product-management.jsp
    Created on : Jun 25, 2025, 9:41:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lý sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/product-management.css">
    </head>
    <body>

        <c:if test="${sessionScope.account.roleInSystem != 1}">
            <c:redirect url="index.jsp"/>
        </c:if>
        <%@include file="/admin-menu.jsp" %>
        <div class="container mt-4">
            <h2 class="mb-4"><i class="fas fa-box-open me-3"></i>Quản lý sản phẩm</h2>

            <%-- Form tìm kiếm theo tên sản phẩm --%>
            <form action="main" method="get" class="mb-3">
                <input type="hidden" name="action" value="searchByname" />
                <input type="text" name="searchName" placeholder="Nhập tên sản phẩm" />
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            </form>

            <%-- Form lọc theo giá --%>
            <form action="main" method="get" class="mb-3">
                <input type="hidden" name="action" value="filterByPriceRangeType" />
                <label for="priceRange" class="form-label">Lọc theo phạm vi giá:</label>
                <select name="priceRange" id="priceRange" class="form-select" style="width:auto;display:inline-block;">
                    <option value="">-- Chọn phạm vi giá --</option>
                    <option value="under1m">Dưới 1 triệu</option>
                    <option value="1mto2m">Từ 1 triệu đến 2 triệu</option>
                    <option value="2mto5m">Từ 2 triệu đến 5 triệu</option>
                    <option value="above5m">Trên 5 triệu</option>
                </select>
                <button type="submit" class="btn btn-success">Lọc</button>
            </form>

            <%-- Hiển thị danh sách sản phẩm theo chức năng đang thực thi --%>
            <c:choose>
                <%-- Nếu có danh sách sản phẩm tìm kiếm, chỉ hiển thị danh sách này --%>
                <c:when test="${not empty requestScope.SEARCHED_PRODUCTS}">
                    <h4>Kết quả tìm kiếm sản phẩm</h4>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-tag me-2"></i>Tên sản phẩm</th>
                                <th><i class="fas fa-image me-2"></i>Ảnh</th>
                                <th><i class="fas fa-list me-2"></i>Danh mục</th>
                                <th><i class="fas fa-dollar-sign me-2"></i>Giá</th>
                                <th><i class="fas fa-percentage me-2"></i>Giảm giá</th>
                                <th><i class="fas fa-calendar me-2"></i>Ngày đăng</th>
                                <th><i class="fas fa-cogs me-2"></i>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.SEARCHED_PRODUCTS}" var="product">
                                <tr>
                                    <td>
                                        <input type="text" name="productId" value="${product.productId}" readonly class="form-control-plaintext" style="width: 80px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="productName" value="${product.productName}" class="form-control-plaintext" style="width: 180px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="productImg" value="${product.productImage}" class="form-control-plaintext" style="width: 120px;"/>
                                        <img src="images/${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail ms-2">
                                    </td>
                                    <td>
                                        <input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly class="form-control-plaintext" style="width: 120px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="price" value="${product.price}" class="form-control-plaintext" style="width: 100px;"/> <span class="text-success fw-bold">VND</span>
                                    </td>
                                    <td>
                                        <input type="text" name="discount" value="${product.discount}" class="form-control-plaintext" style="width: 60px;"/><span class="text-warning fw-bold">%</span>
                                    </td>
                                    <td>
                                        <input type="text" name="postedDate" value="${product.postedDate}" readonly class="form-control-plaintext" style="width: 120px;"/>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </button>
                                        <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash me-1"></i>Xóa
                                        </a>
                                        <a href="main?action=product-detail&id=${product.productId}" class="btn btn-sm btn-success">
                                            <i class="fas fa-info-circle me-1"></i>Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <%-- Nếu có danh sách sản phẩm lọc theo giá, chỉ hiển thị danh sách này --%>
                <c:when test="${not empty requestScope.FILTERED_PRODUCTS}">
                    <h4>Kết quả lọc theo phạm vi giá</h4>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-tag me-2"></i>Tên sản phẩm</th>
                                <th><i class="fas fa-image me-2"></i>Ảnh</th>
                                <th><i class="fas fa-list me-2"></i>Danh mục</th>
                                <th><i class="fas fa-dollar-sign me-2"></i>Giá</th>
                                <th><i class="fas fa-percentage me-2"></i>Giảm giá</th>
                                <th><i class="fas fa-calendar me-2"></i>Ngày đăng</th>
                                <th><i class="fas fa-cogs me-2"></i>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.FILTERED_PRODUCTS}" var="product">
                                <tr>
                                    <td>
                                        <input type="text" name="productId" value="${product.productId}" readonly class="form-control-plaintext" style="width: 80px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="productName" value="${product.productName}" class="form-control-plaintext" style="width: 180px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="productImg" value="${product.productImage}" class="form-control-plaintext" style="width: 120px;"/>
                                        <img src="images/${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail ms-2">
                                    </td>
                                    <td>
                                        <input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly class="form-control-plaintext" style="width: 120px;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="price" value="${product.price}" class="form-control-plaintext" style="width: 100px;"/> <span class="text-success fw-bold">VND</span>
                                    </td>
                                    <td>
                                        <input type="text" name="discount" value="${product.discount}" class="form-control-plaintext" style="width: 60px;"/><span class="text-warning fw-bold">%</span>
                                    </td>
                                    <td>
                                        <input type="text" name="postedDate" value="${product.postedDate}" readonly class="form-control-plaintext" style="width: 120px;"/>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </button>
                                        <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash me-1"></i>Xóa
                                        </a>
                                        <a href="main?action=product-detail&id=${product.productId}" class="btn btn-sm btn-success">
                                            <i class="fas fa-info-circle me-1"></i>Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>



                <%-- Nếu có danh sách sản phẩm đã phân loại, chỉ hiển thị danh sách này --%>
                <c:when test="${not empty requestScope.CLASSIFIED_PRO_LIST}">
                    <h4>Danh sách sản phẩm đã phân loại</h4>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-tag me-2"></i>Tên sản phẩm</th>
                                <th><i class="fas fa-image me-2"></i>Ảnh</th>
                                <th><i class="fas fa-list me-2"></i>Danh mục</th>
                                <th><i class="fas fa-dollar-sign me-2"></i>Giá</th>
                                <th><i class="fas fa-percentage me-2"></i>Giảm giá</th>
                                <th><i class="fas fa-calendar me-2"></i>Ngày đăng</th>
                                <th><i class="fas fa-cogs me-2"></i>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.CLASSIFIED_PRO_LIST}" var="product">
                            <form action="main">
                                <input type="hidden" name="action" value="updateProduct" />
                                <input type="hidden" name="brief" value="${product.brief}" />
                                <input type="hidden" name="unit" value="${product.unit}" />
                                <tr>
                                    <td>
                                        <input type="text" name="productId" value="${product.productId}" readonly />
                                    </td>
                                    <td>
                                        <input type="text" name="productName" value="${product.productName}" />
                                    </td>
                                    <td>
                                        <input type="text" name="productImg" value="${product.productImage}" />
                                        <img src="images/${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail">
                                    </td>
                                    <td>
                                        <input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly/>
                                    </td>
                                    <td>
                                        <input type="text" name="price" value="${product.price}" /> <span class="text-success fw-bold">VND</span>
                                    </td>
                                    <td>
                                        <input type="text" name="discount" value="${product.discount}" /><span class="text-warning fw-bold">%</span>
                                    </td>
                                    <td>
                                        <input type="text" name="postedDate" value="${product.postedDate}" readonly />
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </button>
                                        <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash me-1"></i>Xóa
                                        </a>
                                        <a href="main?action=product-detail&id=${product.productId}" class="btn btn-sm btn-success">
                                            <i class="fas fa-info-circle me-1"></i>Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>

                <%-- Nếu không có chức năng nào ở trên, hiển thị danh sách sản phẩm mặc định --%>
                <c:otherwise>
                    <h4>Danh sách sản phẩm</h4>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-tag me-2"></i>Tên sản phẩm</th>
                                <th><i class="fas fa-image me-2"></i>Ảnh</th>
                                <th><i class="fas fa-list me-2"></i>Danh mục</th>
                                <th><i class="fas fa-dollar-sign me-2"></i>Giá</th>
                                <th><i class="fas fa-percentage me-2"></i>Giảm giá</th>
                                <th><i class="fas fa-calendar me-2"></i>Ngày đăng</th>
                                <th><i class="fas fa-cogs me-2"></i>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.PRO_LIST}" var="product">
                            <form action="main">
                                <input type="hidden" name="action" value="updateProduct" />
                                <input type="hidden" name="brief" value="${product.brief}" />
                                <input type="hidden" name="unit" value="${product.unit}" />
                                <tr>
                                    <td>
                                        <input type="text" name="productId" value="${product.productId}" readonly />
                                    </td>
                                    <td>
                                        <input type="text" name="productName" value="${product.productName}" />
                                    </td>
                                    <td>
                                        <input type="text" name="productImg" value="${product.productImage}" />
                                        <img src="images/${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail">
                                    </td>
                                    <td>
                                        <input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly/>
                                    </td>
                                    <td>
                                        <input type="text" name="price" value="${product.price}" /> <span class="text-success fw-bold">VND</span>
                                    </td>
                                    <td>
                                        <input type="text" name="discount" value="${product.discount}" /><span class="text-warning fw-bold">%</span>
                                    </td>
                                    <td>
                                        <input type="text" name="postedDate" value="${product.postedDate}" readonly />
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </button>
                                        <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash me-1"></i>Xóa
                                        </a>
                                        <a href="main?action=product-detail&id=${product.productId}" class="btn btn-sm btn-success">
                                            <i class="fas fa-info-circle me-1"></i>Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <footer class="footer mt-auto py-3">
            <div class="container text-center">
                <span><i class="fas fa-copyright me-2"></i>2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
