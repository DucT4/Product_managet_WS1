<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/account-list.css">
</head>
<body>
    <c:if test="${empty sessionScope.account}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <%@include file="/admin-menu.jsp" %>
    <div class="container account-table-container mt-4">
        <h2 class="mb-4" style="color:#2d3a4a; font-weight:700;">Danh sách tài khoản</h2>
        <table class="table account-table table-striped">
            <thead>
                <tr>
                    <th>Tài khoản</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Số điện thoại</th>
                    <th>Vai trò</th>
                    <th>Hành động</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.LIST_ACCOUNT}" var="account">
                    <tr>
                        <!-- Form cập nhật từng dòng, đặt trong từng cột -->
                        <form action="updateAccountServlet" method="get">
                            <td>
                                <input type="text" name="account" value="${account.accoun}" readonly />
                                <input type="hidden" name="password" value="${account.password}" />
                            </td>
                            <td>
                                <input type="text" name="lastName" value="${account.lastName}" style="width: 48%; display: inline-block; margin-right:2%;" />
                                <input type="text" name="firstName" value="${account.firstName}" style="width: 48%; display: inline-block;" />
                            </td>
                            <td>
                                <input type="date" name="birthDay" value="${account.birthDay}" />
                            </td>
                            <td>
                                <select name="gender">
                                    <option value="true" ${account.gender ? 'selected' : ''}>Nam</option>
                                    <option value="false" ${!account.gender ? 'selected' : ''}>Nữ</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="phone" value="${account.phone}" />
                            </td>
                            <td>
                                <select name="role">
                                    <option value="1" ${account.roleInSystem == 1 ? 'selected' : ''}>Admin</option>
                                    <option value="2" ${account.roleInSystem == 2 ? 'selected' : ''}>Staff</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit" class="btn btn-success btn-sm">Cập nhật</button>
                            </td>
                        </form>
                        <td>
                            <a href="main?action=deleteAccount&accountID=${account.accoun}" class="btn btn-sm btn-danger">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <a class="create-account-link" href="add-account.jsp"><i class="fa fa-plus"></i> Tạo tài khoản mới</a>
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
