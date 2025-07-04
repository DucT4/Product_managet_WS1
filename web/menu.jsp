<%-- 
    Document   : menu.jsp
    Created on : Jun 25, 2025, 9:34:11 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">    
        <style>
            .navbar-custom {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                box-shadow: 0 2px 12px rgba(102,126,234,0.08);
                border-radius: 0 0 16px 16px;
                padding: 0.5rem 0;
            }
            .navbar-custom .navbar-brand {
                color: #fff;
                font-weight: 700;
                font-size: 1.5rem;
                letter-spacing: 1px;
            }
            .navbar-custom .nav-link {
                color: #f4f6fb !important;
                font-weight: 600;
                margin-right: 10px;
                transition: color 0.2s;
                position: relative;
            }
            .navbar-custom .nav-link.active, 
            .navbar-custom .nav-link:hover {
                color: #ffd700 !important;
            }
            .navbar-custom .nav-link i {
                margin-right: 6px;
            }
            @media (max-width: 991.98px) {
                .navbar-custom .navbar-nav {
                    background: #764ba2;
                    border-radius: 0 0 12px 12px;
                    padding: 10px 0;
                }
                .navbar-custom .nav-link {
                    color: #fff !important;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <i class="fa-solid fa-cubes"></i> Product Management
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i>Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="main?action=portfolio"><i class="fa-solid fa-list"></i>Danh mục sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp"><i class="fa-solid fa-sign-in-alt"></i>Đăng nhập</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
