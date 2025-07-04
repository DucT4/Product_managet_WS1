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
        
    
    </head>
    <body>
        <%@include file="/menu.jsp" %>
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
