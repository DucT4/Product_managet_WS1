<%-- 
    Document   : login
    Created on : Jun 20, 2025, 2:04:30 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-form { max-width: 400px; margin: 2rem auto; padding: 2rem; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <%@include file="/menu.jsp" %>
    <div class="container">
        <div class="login-form">
            <h2 class="text-center mb-4">Đăng nhập</h2>
            <form action="main" method="post">
                <input type="hidden" name="action" value="login" />
                <div class="mb-3">
                    <label for="account" class="form-label">Tài khoản:</label>
                    <input type="text"  name="account" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password"  name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

</html>
