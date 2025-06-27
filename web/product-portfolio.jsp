<%-- 
    Document   : product-portfolio.jsp
    Created on : Jun 25, 2025, 9:38:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh mục sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .sidebar {
                background: #f8f9fa;
                padding: 1rem;
            }
            .product-grid {
                margin-top: 1rem;
            }
        </style>
    </head>
    <body>
        <%@include file="/menu.jsp" %>
        <div class="container mt-4">
            <div class="row">

                <input type="hidden" name="action" value="portfolio" />
                <div class="col-md-3 sidebar">
                    <h3>Danh mục</h3>
                    <ul class="list-group">
                        <c:forEach items="${sessionScope.categories}" var="category">
                            <li class="list-group-item">
                                <a href="product-portfolio.jsp?categoryId=${category.typeId}">${category.categoryName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-md-9">
                    <h2>Danh sách sản phẩm</h2>
                    <div class="row product-grid">
                        <c:forEach items="${sessionScope.PRO_LIST}" var="product">
                            <div class="col-md-4 col-sm-6">
                                <div class="card mb-4">
                                    <img src="${product.productImage}" class="card-img-top" alt="${product.productName}">
                                    <div class="card-body">
                                        <h5 class="card-title">${product.productName}</h5>
                                        <p class="card-text">${product.price} VND</p>
                                            <a href="main?action=product-detail&id=${product.productId}" class="btn btn-primary">Xem chi tiết</a>                                        
                                        

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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

