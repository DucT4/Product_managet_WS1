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
    <style>
        body {
            background: #f4f6fb;
        }
        .form-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.07);
            padding: 32px 28px 28px 28px;
            max-width: 480px;
            margin: 0 auto;
            margin-top: 40px;
        }
        .form-container h2 {
            color: #2d3a4a;
            font-weight: 700;
            margin-bottom: 24px;
            text-align: center;
        }
        .form-label {
            font-weight: 600;
            color: #444;
        }
        .form-control, .form-select, textarea.form-control {
            border: 1px solid #e3e6f0;
            border-radius: 6px;
            padding: 10px 14px;
            font-size: 15px;
            background: #f9fafd;
            transition: border 0.2s;
        }
        .form-control:focus, .form-select:focus, textarea.form-control:focus {
            border-color: #667eea;
            background: #fff;
            outline: none;
        }
        .btn-primary {
            background: linear-gradient(45deg, #667eea, #764ba2);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 20px;
            padding: 10px 32px;
            transition: background 0.2s;
            margin-top: 10px;
            width: 100%;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #764ba2, #667eea);
        }
        .footer {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            margin-top: 50px;
            border-radius: 0 0 12px 12px;
            padding: 16px 0;
        }
        .footer .text-muted {
            color: #fff !important;
        }
    </style>
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
