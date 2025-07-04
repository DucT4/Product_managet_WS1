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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <style>
        body {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-form {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 24px rgba(102,126,234,0.13);
            padding: 40px 32px 32px 32px;
            max-width: 400px;
            width: 100%;
        }
        .login-form h2 {
            font-weight: 800;
            color: #764ba2;
            letter-spacing: 1px;
            margin-bottom: 24px;
            text-shadow: 0 2px 8px rgba(102,126,234,0.08);
        }
        .form-label {
            font-weight: 600;
            color: #667eea;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #e3e6f0;
            box-shadow: none;
            transition: border-color 0.2s;
        }
        .form-control:focus {
            border-color: #764ba2;
            box-shadow: 0 0 0 0.2rem rgba(118,75,162,0.08);
        }
        .btn-primary {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border: none;
            font-weight: 700;
            letter-spacing: 0.5px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(102,126,234,0.10);
            transition: background 0.15s, box-shadow 0.15s;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #764ba2 0%, #667eea 100%);
            box-shadow: 0 4px 16px rgba(102,126,234,0.13);
        }
        @media (max-width: 576px) {
            .login-form {
                padding: 24px 8px 18px 8px;
            }
        }
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
                    <input type="text" id="account" name="account" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
