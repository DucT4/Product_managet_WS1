<%-- 
    Document   : add-category.jsp
    Created on : Jun 25, 2025, 9:41:31 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/add-category.css">
</head>
<body>
    <c:if test="${empty sessionScope.user}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <c:if test="${sessionScope.user.roleInSystem != 1}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="/admin-menu.jsp" %>
    <div class="container mt-4">
        <div class="form-container">
            <h2 class="mb-4">Thêm danh mục mới</h2>
            <form action="add-category" method="post">
                <div class="mb-3">
                    <label for="categoryName" class="form-label">Tên danh mục:</label>
                    <input type="text" id="categoryName" name="categoryName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="memo" class="form-label">Ghi chú:</label>
                    <textarea id="memo" name="memo" class="form-control"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form>
        </div>
    </div>
    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <span class="text-muted">© 2025 Product Management System</span>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
