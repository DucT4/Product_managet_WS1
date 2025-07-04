<%-- 
    Document   : category-list.jsp
    Created on : Jun 25, 2025, 9:41:06 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách danh mục</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <style>
            body {
                background: #f4f6fb;
            }
            .category-table-container {
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 2px 16px rgba(0,0,0,0.07);
                padding: 32px 28px 28px 28px;
                max-width: 900px;
                margin: 0 auto;
                margin-top: 40px;
            }
            .category-table-container h2 {
                color: #2d3a4a;
                font-weight: 700;
                margin-bottom: 24px;
                text-align: center;
            }
            .category-table th {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                font-weight: 600;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }
            .category-table td, .category-table th {
                vertical-align: middle;
                text-align: center;
            }
            .category-table input[readonly] {
                background: #e9ecef;
                color: #888;
                font-weight: 600;
                border: none;
                text-align: center;
            }
            .category-table input[type="text"] {
                border-radius: 6px;
                border: 1px solid #e3e6f0;
                padding: 6px 10px;
                font-size: 15px;
                background: #f9fafd;
                transition: border 0.2s;
            }
            .category-table input[type="text"]:focus {
                border-color: #667eea;
                background: #fff;
                outline: none;
            }
            .btn-success {
                background: linear-gradient(45deg, #28a745, #218838);
                border: none;
                color: #fff;
                font-weight: 600;
                border-radius: 20px;
                padding: 6px 18px;
                transition: background 0.2s;
            }
            .btn-success:hover {
                background: linear-gradient(45deg, #218838, #28a745);
            }
            .btn-danger {
                background: linear-gradient(45deg, #dc3545, #c82333);
                border: none;
                color: #fff;
                font-weight: 600;
                border-radius: 20px;
                padding: 6px 18px;
                transition: background 0.2s;
            }
            .btn-danger:hover {
                background: linear-gradient(45deg, #c82333, #dc3545);
            }
            .footer {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                margin-top: 50px;
                border-radius: 0 0 12px 12px;
                padding: 16px 0;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty sessionScope.account}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <%@include file="/admin-menu.jsp" %>
        <div class="container category-table-container mt-4">
            <h2 class="mb-4">Danh sách danh mục</h2>
            <table class="table category-table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên danh mục</th>
                        <th>Ghi chú</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${categories}" var="category">
                        <c:if test="${category.isActive}">
                            <tr>
                                <td>
                                    <input type="text" value="${category.typeId}" readonly style="width:60px"/>
                                </td>
                                <td>
                                    <!-- Form Update -->
                                    <form action="updateCategoryServlet" method="get" style="display:inline;">
                                        <input type="hidden" name="id" value="${category.typeId}" />
                                        <input type="text" name="name" value="${category.categoryName}" style="display:inline;width:150px"/>
                                </td>
                                <td>
                                        <input type="text" name="memo" value="${category.memo}" style="display:inline;width:150px"/>
                                </td>
                                <td>
                                        <button type="submit" class="btn btn-success btn-sm">Cập nhật</button>
                                    </form>
                                    <!-- Form Delete -->
                                    <form action="main" method="post" style="display:inline;" onsubmit="return confirm('Bạn chắc chắn muốn xóa?');">
                                        <input type="hidden" name="action" value="delete" />
                                        <input type="hidden" name="id" value="${category.typeId}" />
                                        <button type="submit" class="btn btn-danger btn-sm ms-1">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <footer class="footer mt-auto py-3">
            <div class="container text-center">
                <span class="text-muted">© 2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
