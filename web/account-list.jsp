<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <style>
        .account-table-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.07);
            padding: 32px 24px;
            margin-top: 32px;
        }
        .account-table thead th {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            font-weight: 600;
            text-align: center;
            border: none;
            padding: 16px 10px;
        }
        .account-table tbody tr {
            transition: background 0.2s;
        }
        .account-table tbody tr:hover {
            background: #f0f4fa;
        }
        .account-table td, .account-table th {
            vertical-align: middle;
            padding: 12px 8px;
            border-color: #e9ecef;
        }
        .account-table input[type="text"], 
        .account-table input[type="date"], 
        .account-table select {
            border: 1px solid #e3e6f0;
            border-radius: 6px;
            padding: 8px 12px;
            width: 100%;
            font-size: 15px;
            background: #f9fafd;
            transition: border 0.2s;
        }
        .account-table input[type="text"]:focus, 
        .account-table input[type="date"]:focus, 
        .account-table select:focus {
            border-color: #667eea;
            background: #fff;
            outline: none;
        }
        .account-table input[readonly] {
            background: #e9ecef;
            color: #888;
            font-weight: 600;
        }
        .btn-success {
            background: linear-gradient(45deg, #28a745, #218838);
            border: none;
            color: #fff;
        }
        .btn-success:hover {
            background: linear-gradient(45deg, #218838, #28a745);
        }
        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #c82333);
            border: none;
            color: #fff;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #c82333, #dc3545);
        }
        .create-account-link {
            display: inline-block;
            margin-top: 18px;
            font-weight: 600;
            color: #667eea;
            background: #f4f6fb;
            border-radius: 8px;
            padding: 10px 22px;
            text-decoration: none;
            transition: background 0.2s, color 0.2s;
        }
        .create-account-link:hover {
            background: #667eea;
            color: #fff;
            text-decoration: none;
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
