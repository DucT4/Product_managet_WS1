<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User & Categories Overview</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
        <style>
            body {
                background: #f4f6f9;
            }
            .overview-box {
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 2px 8px #eaeaea;
                padding: 32px 24px 24px 24px;
                margin: 40px auto 32px auto;
                max-width: 900px;
            }
            .user-info-title {
                font-size: 1.3rem;
                font-weight: 600;
                margin-bottom: 18px;
            }
            .category-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 12px;
            }
            .list-group-item {
                font-size: 1.05rem;
            }
            .info-label {
                color: #888;
                min-width: 120px;
                display: inline-block;
            }
            .avatar {
                width: 60px;
                height: 60px;
                background: #eee;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.8rem;
                font-weight: bold;
                color: #888;
                margin-right: 16px;
            }
        </style>
    </head>
    <body>
        <%@include file="/admin-menu.jsp" %>
        <div class="overview-box">
            <div class="row">
                <!-- User Info -->
                <div class="col-md-5 mb-4 mb-md-0">
                    <div class="d-flex align-items-center mb-3">
                        <div class="avatar">
                            <c:out value="${sessionScope.account.lastName != null ? sessionScope.account.lastName.substring(0,1) : 'U'}"/>
                        </div>
                        <div>
                            <div class="user-info-title">Thông tin người dùng</div>
                            <div>
                                <span class="fw-bold">${sessionScope.account.lastName} ${sessionScope.account.firstName}</span>
                                <span class="badge bg-info ms-2">
                                    <c:choose>
                                        <c:when test="${sessionScope.account.roleInSystem == 1}">Administrator</c:when>
                                        <c:otherwise>Staff</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                    </div>
                    <ul class="list-group list-group-flush mb-2">
                        <li class="list-group-item"><span class="info-label">Tài khoản:</span> ${sessionScope.account.accoun}</li>
                        <li class="list-group-item"><span class="info-label">Ngày sinh:</span>
                            <fmt:formatDate value="${sessionScope.account.birthDay}" pattern="dd/MM/yyyy"/>
                        </li>
                        <li class="list-group-item"><span class="info-label">Giới tính:</span>
                            <c:choose>
                                <c:when test="${sessionScope.account.gender}">Nam</c:when>
                                <c:otherwise>Nữ</c:otherwise>
                            </c:choose>
                        </li>
                        <li class="list-group-item"><span class="info-label">Số điện thoại:</span> ${sessionScope.account.phone}</li>
                        <li class="list-group-item"><span class="info-label">Trạng thái:</span>
                            <c:choose>
                                <c:when test="${sessionScope.account.isUse}">Đang hoạt động</c:when>
                                <c:otherwise>Đã khóa</c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </div>
                <!-- Category List -->
                <div class="col-md-7">
                    <div class="category-title mb-2">Danh mục sản phẩm</div>
                    <ul class="list-group shadow-sm">
                        <c:forEach items="${sessionScope.categories}" var="category">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span class="fw-semibold text-primary">${category.categoryName}</span>
                                <span class="text-muted small">${category.memo}</span>
                            </li>
                        </c:forEach>
                        <c:if test="${empty sessionScope.categories}">
                            <li class="list-group-item text-muted text-center">Chưa có danh mục nào.</li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <footer class="footer mt-auto py-3 bg-light">
            <div class="container text-center">
                <span class="text-muted">© 2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
