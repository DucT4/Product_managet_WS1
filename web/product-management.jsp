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
        <style>
            body {
                background-color: #f8f9fa;
            }
            
            .container {
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                padding: 30px;
                margin-top: 20px;
            }
            
            h2 {
                color: #2c3e50;
                font-weight: 600;
                border-bottom: 3px solid #007bff;
                padding-bottom: 10px;
                margin-bottom: 30px;
            }
            
            .table {
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            
            .table thead th {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                font-weight: 600;
                text-align: center;
                border: none;
                padding: 15px 10px;
            }
            
            .table tbody tr {
                transition: all 0.3s ease;
            }
            
            .table tbody tr:hover {
                background-color: #f8f9fa;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            
            .table td {
                vertical-align: middle;
                padding: 12px 8px;
                border-color: #e9ecef;
            }
            
            /* Styling cho input fields */
            input[type="text"] {
                border: 1px solid #e3e6f0;
                border-radius: 5px;
                padding: 8px 10px;
                width: 100%;
                font-size: 13px;
                transition: all 0.3s ease;
                background: #fff;
            }
            
            input[type="text"]:focus {
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
                outline: none;
                background: #f8f9fa;
            }
            
            input[type="text"]:read-only {
                background-color: #e9ecef;
                cursor: not-allowed;
                font-weight: 600;
                color: #6c757d;
            }
            
            /* Styling cho buttons */
            .btn {
                border-radius: 20px;
                font-weight: 500;
                transition: all 0.3s ease;
                margin: 2px;
            }
            
            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            
            .btn-warning {
                background: linear-gradient(45deg, #ffc107, #ff8f00);
                border: none;
                color: white;
            }
            
            .btn-warning:hover {
                background: linear-gradient(45deg, #ff8f00, #ffc107);
                color: white;
            }
            
            .btn-danger {
                background: linear-gradient(45deg, #dc3545, #c82333);
                border: none;
            }
            
            .btn-danger:hover {
                background: linear-gradient(45deg, #c82333, #dc3545);
            }
            
            /* Image styling */
            .img-thumbnail {
                border: 2px solid #007bff;
                border-radius: 8px;
                transition: all 0.3s ease;
                margin-left: 10px;
            }
            
            .img-thumbnail:hover {
                transform: scale(1.1);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            
            /* Footer styling */
            .footer {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                margin-top: 50px;
            }
            
            /* Responsive adjustments */
            @media (max-width: 768px) {
                .container {
                    padding: 15px;
                    margin: 10px;
                }
                
                .table {
                    font-size: 12px;
                }
                
                input[type="text"] {
                    font-size: 11px;
                    padding: 6px 8px;
                }
                
                .btn {
                    font-size: 11px;
                    padding: 4px 8px;
                }
            }
            
            /* Animation for page load */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            .container {
                animation: fadeInUp 0.6s ease-out;
            }
            
            /* Custom scrollbar */
            ::-webkit-scrollbar {
                width: 8px;
            }
            
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
                border-radius: 10px;
            }
            
            ::-webkit-scrollbar-thumb {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 10px;
            }
            
            ::-webkit-scrollbar-thumb:hover {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
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
<!--                          <input type="hidden" name="accoun" value="${product.account.accoun}" />-->
                        <tr>
                            <td> <input type="text" name="productId" value="${product.productId}" readonly />
                            </td>
                            <td><input type="text" name="productName" value="${product.productName}" />
                                </td>
                            <td><input type="text" name="productImg" value="${product.productImage}" />
                                <img src="${product.productImage}" width="50" alt="${product.productName}" class="img-thumbnail"></td>
                            <td><input type="text" name="productCategoryName" value="${product.type.categoryName}" readonly/></td>
                            <td><input type="text" name="price" value="${product.price}" /> <span class="text-success fw-bold">VND</span></td>
                            <td><input type="text" name="discount" value="${product.discount}" /><span class="text-warning fw-bold">%</span></td>
                            <td><input type="text" name="postedDate" value="${product.postedDate}" readonly /> </td>
                            <td>
                                <button type="submit" class="btn btn-sm btn-warning">
                                    <i class="fas fa-edit me-1"></i>Sửa
                                </button>
                                <a href="main?action=deleteProduct&productId=${product.productId}" class="btn btn-sm btn-danger">
                                    <i class="fas fa-trash me-1"></i>Xóa
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
