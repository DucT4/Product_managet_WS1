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
        <link rel="stylesheet" href="css/category-list.css">
       
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
