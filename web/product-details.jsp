<%-- 
    Document   : product-details.jsp
    Created on : Jun 25, 2025, 9:38:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiết sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css"> 
        <link rel="stylesheet" href="css/product-details.css">
    
    </head>
    <body>
        <%-- 
            Giải thích:
            - <c:choose> là thẻ JSTL dùng để thực hiện cấu trúc điều kiện (tương tự như switch-case hoặc if-else if-else trong Java).
            - <c:when> là nhánh điều kiện, nếu biểu thức test đúng thì nội dung bên trong sẽ được thực thi.
            - <c:otherwise> là nhánh mặc định, sẽ thực thi nếu tất cả các <c:when> đều sai.
            Ở đây, nếu sessionScope.account khác rỗng (đã đăng nhập), sẽ include menu admin. Ngược lại, sẽ include menu thường.
        --%>
        <c:choose>
            <c:when test="${not empty sessionScope.account}">
                <%-- Nếu đã đăng nhập, hiển thị menu admin --%>
                <jsp:include page="admin-menu.jsp" />
            </c:when>
            <c:otherwise>
                <%-- Nếu chưa đăng nhập, hiển thị menu thường --%>
                <jsp:include page="menu.jsp" />
            </c:otherwise>
        </c:choose>
        <div class="container mt-4">
            <div class="product-details">
                <div class="row">
                    <form action="main">
                        <div class="col-md-6">
                            <img src="${sessionScope.Product.productImage}" alt="${sessionScope.Product.productName}" class="img-fluid rounded">
                        </div>
                        <div class="col-md-6">
                            <h2>${sessionScope.Product.productName}</h2>
                            <p>Giá: ${sessionScope.Product.price} VND</p>
                            <p>Giảm giá: ${sessionScope.Product.discount}%</p>
                            <p>Đơn vị: ${sessionScope.Product.unit}</p>
                            <p>Mô tả: ${sessionScope.Product.brief}</p>
                            <button class="btn btn-success">Thêm vào giỏ hàng</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <footer class="footer mt-auto py-3 bg-light">
            <div class="container text-center">
                <span class="text-muted">© 2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
