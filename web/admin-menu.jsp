<%-- 
    Document   : admin-menu.jsp
    Created on : Jun 25, 2025, 9:36:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Menu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/admin-menu.css">
       
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="dashboard.jsp">
                    <i class="fa-solid fa-cubes"></i> Admin Panel
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar" aria-controls="adminNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="adminNavbar">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp"><i class="fa-solid fa-chart-line"></i>Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="accountServlet"><i class="fa-solid fa-users"></i>Tài khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="main?action=categories"><i class="fa-solid fa-list"></i>Danh mục</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product-management.jsp"><i class="fa-solid fa-boxes-stacked"></i>Sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewedProduct.jsp"><i class="fa-solid fa-boxes-stacked"></i>San pham da xem</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="main?action=logout"><i class="fa-solid fa-sign-out-alt"></i>Đăng xuất</a>
                        </li>
                    </ul>
                    <c:if test="${not empty sessionScope.account}">
                        <span class="user-greeting">
                            <i class="fa-solid fa-user-circle"></i>
                            Xin chào, ${sessionScope.account.lastName} ${sessionScope.account.firstName}
                        </span>
                    </c:if>
                </div>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
