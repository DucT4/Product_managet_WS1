<%-- 
    Document   : product-management.jsp
    Created on : Jun 25, 2025, 9:41:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lý sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <style>
            body {
                background: #f4f6fb;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            .container {
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 4px 24px rgba(102,126,234,0.10);
                padding: 36px 32px 32px 32px;
                margin-top: 48px;
                margin-bottom: 32px;
                max-width: 1200px;
            }
            h2 {
                font-weight: 800;
                color: #764ba2;
                letter-spacing: 1px;
                text-shadow: 0 2px 8px rgba(102,126,234,0.08);
            }
            form[action="main"][method="get"] {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-bottom: 24px;
            }
            form[action="main"][method="get"] input[type="text"] {
                border-radius: 8px;
                border: 1px solid #e3e6f0;
                background: #f9fafd;
                font-size: 1rem;
                padding: 8px 12px;
                width: 260px;
                transition: border 0.2s;
            }
            form[action="main"][method="get"] input[type="text"]:focus {
                border-color: #764ba2;
                background: #fff;
                box-shadow: 0 0 0 0.2rem rgba(118,75,162,0.08);
            }
            form[action="main"][method="get"] button {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                border: none;
                border-radius: 8px;
                font-weight: 700;
                padding: 8px 22px;
                font-size: 1rem;
                transition: background 0.2s;
            }
            form[action="main"][method="get"] button:hover {
                background: linear-gradient(90deg, #764ba2 0%, #667eea 100%);
            }
            .table {
                background: #fff;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 2px 12px rgba(102,126,234,0.07);
            }
            .table thead th {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                font-weight: 700;
                border: none;
                font-size: 1.05rem;
                vertical-align: middle;
            }
            .table-striped > tbody > tr:nth-of-type(odd) {
                background-color: #f9fafd;
            }
            .table td, .table th {
                vertical-align: middle;
                padding: 12px 10px;
            }
            .table input[type="text"] {
                border: 1px solid #e3e6f0;
                border-radius: 6px;
                padding: 4px 8px;
                font-size: 0.98rem;
                width: 100%;
                background: #f9fafd;
                transition: border 0.2s;
            }
            .table input[type="text"]:focus {
                border-color: #764ba2;
                background: #fff;
            }
            .btn-warning {
                background: linear-gradient(90deg, #ffd700 0%, #ffb347 100%);
                color: #764ba2;
                border: none;
                font-weight: 700;
                border-radius: 6px;
                padding: 5px 14px;
                margin-right: 6px;
                transition: background 0.2s, color 0.2s;
            }
            .btn-warning:hover {
                background: linear-gradient(90deg, #ffb347 0%, #ffd700 100%);
                color: #333;
            }
            .btn-danger {
                background: linear-gradient(90deg, #ff5858 0%, #f857a6 100%);
                color: #fff;
                border: none;
                font-weight: 700;
                border-radius: 6px;
                padding: 5px 14px;
                transition: background 0.2s;
            }
            .btn-danger:hover {
                background: linear-gradient(90deg, #f857a6 0%, #ff5858 100%);
            }
            .img-thumbnail {
                border-radius: 8px;
                border: 1px solid #e3e6f0;
                margin-left: 8px;
                box-shadow: 0 1px 4px rgba(102,126,234,0.08);
            }
            .footer {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                margin-top: auto;
                border-radius: 0 0 12px 12px;
                padding: 16px 0;
                box-shadow: 0 -2px 12px rgba(102,126,234,0.08);
            }
            @media (max-width: 991.98px) {
                .container {
                    padding: 18px 8px 18px 8px;
                }
                h2 {
                    font-size: 1.5rem;
                }
                .table th, .table td {
                    font-size: 0.95rem;
                    padding: 8px 4px;
                }
            }
            @media (max-width: 576px) {
                .container {
                    padding: 10px 2px 10px 2px;
                }
                h2 {
                    font-size: 1.1rem;
                }
                .table th, .table td {
                    font-size: 0.85rem;
                    padding: 6px 2px;
                }
            }
        </style>
    </head>
    <body>

        <c:if test="${sessionScope.account.roleInSystem != 1}">
            <c:redirect url="index.jsp"/>
        </c:if>
        <%@include file="/admin-menu.jsp" %>
        <div class="container mt-4">
            <h2 class="mb-4"><i class="fas fa-box-open me-3"></i>Quản lý sản phẩm</h2>
            <form action="main" method="get">
                <input type="hidden" name="action" value="searchByname" />
                <input type="text" name="searchName" placeholder="Nhập tên sản phẩm" />
                <button type="submit">Tìm kiếm</button>
            </form>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th><i class="fas fa-hashtag me-2"></i>ID</th>
                        <th><i class="fas fa-tag me-2"></i>Tên sản phẩm</th>
                        <th><i class="fas fa-image me-2"></i>Ảnh</th>
                        <th><i class="fas fa-list me-2"></i>Danh mục</th>
                        <th><i class="fas fa-dollar-sign me-2"></i>Giá</th>
                        <th><i class="fas fa-percentage me-2"></i>Giảm giá</th>
                        <th><i class="fas fa-calendar me-2"></i>Ngày đăng</th>
                        <th><i class="fas fa-cogs me-2"></i>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.PRO_LIST}" var="product">
                    <form action="main">
                        <input type="hidden" name="action" value="updateProduct" />
                        <input type="hidden" name="brief" value="${product.brief}" />
                        <input type="hidden" name="unit" value="${product.unit}" />
                        <tr>
                            <td>
                                <input type="text" name="productId" value="${product.productId}" readonly />
                            </td>
                            <td>
                                <input type="text" name="productName" value="${product.productName}" />
                            </td>
                            <td>
                                <input type="text" name="productImg" value="${product.productImage}" />
                                <img src="images/${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail">
                            </td>
                            <td>
                                <input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly/>
                            </td>
                            <td>
                                <input type="text" name="price" value="${product.price}" /> <span class="text-success fw-bold">VND</span>
                            </td>
                            <td>
                                <input type="text" name="discount" value="${product.discount}" /><span class="text-warning fw-bold">%</span>
                            </td>
                            <td>
                                <input type="text" name="postedDate" value="${product.postedDate}" readonly />
                            </td>
                            <td>
                                <button type="submit" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit me-1"></i>Sửa
                                </button>
                                <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                    <i class="fas fa-trash me-1"></i>Xóa
                                </a>
                             <a href="main?action=product-detail&id=${product.productId}" class="btn btn-sm btn-success">
                                    <i class="fas fa-trash me-1"></i>Chi tiêts
                                </a>
                            </td>
                        </tr>
                    </form>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <footer class="footer mt-auto py-3">
            <div class="container text-center">
                <span><i class="fas fa-copyright me-2"></i>2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
