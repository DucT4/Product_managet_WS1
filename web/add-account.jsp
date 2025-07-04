<%-- 
    Document   : add-account.jsp
    Created on : Jun 25, 2025, 9:40:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <style>
        .form-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.07);
            padding: 32px 28px 28px 28px;
            max-width: 520px;
            margin: 0 auto;
            margin-top: 32px;
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
        .form-control, .form-select {
            border: 1px solid #e3e6f0;
            border-radius: 6px;
            padding: 10px 14px;
            font-size: 15px;
            background: #f9fafd;
            transition: border 0.2s;
        }
        .form-control:focus, .form-select:focus {
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
        .form-check-label {
            font-weight: 500;
            color: #555;
        }
        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }
        @media (max-width: 600px) {
            .form-container {
                padding: 18px 8px 18px 8px;
                max-width: 100%;
            }
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
    <c:if test="${empty sessionScope.account}">
        <c:redirect url="login.jsp"/>
    </c:if>
   
    <%@include file="/admin-menu.jsp" %>
    <div class="container mt-4">
        <div class="form-container">
            <h2 class="mb-4">Thêm tài khoản mới</h2>
            <form action="main" method="post">
                <input type="hidden" name="action" value="add-account" />
                <div class="mb-3">
                    <label for="account" class="form-label">Tài khoản:</label>
                    <input type="text" id="account" name="account" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="firstName" class="form-label">Họ:</label>
                    <input type="text" id="firstName" name="firstName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Tên:</label>
                    <input type="text" id="lastName" name="lastName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại:</label>
                    <input type="text" id="phone" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="birthday" class="form-label">Ngày sinh:</label>
                    <input type="date" id="birthday" name="birthday" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">Giới tính:</label>
                    <select id="gender" name="gender" class="form-select" required>
                        <option value="true">Nam</option>
                        <option value="false">Nữ</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Vai trò:</label>
                    <select id="role" name="role" class="form-select" required>
                        <option value="1">Admin</option>
                        <option value="2">Staff</option>
                    </select>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" id="isActive" name="isActive" class="form-check-input" checked>
                    <label for="isActive" class="form-check-label">Kích hoạt</label>
                </div>
                <button type="submit" class="btn btn-primary">Thêm</button>
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
