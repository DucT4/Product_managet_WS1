<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User & Categories Overview</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <style>
            body {
                background: #f4f6fb;
            }
            .overview-box {
                background: #fff;
                border-radius: 14px;
                box-shadow: 0 2px 16px rgba(102,126,234,0.09);
                padding: 36px 32px 32px 32px;
                max-width: 950px;
                margin: 0 auto;
                margin-top: 48px;
            }
            .avatar {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2.2rem;
                font-weight: 700;
                margin-right: 18px;
                box-shadow: 0 2px 8px rgba(102,126,234,0.13);
            }
            .user-info-title {
                font-size: 1.2rem;
                font-weight: 700;
                color: #2d3a4a;
                margin-bottom: 2px;
            }
            .info-label {
                font-weight: 600;
                color: #667eea;
                margin-right: 8px;
            }
            .list-group-item {
                background: #f9fafd;
                border: none;
                border-bottom: 1px solid #e3e6f0;
                font-size: 1rem;
                padding: 12px 18px;
            }
            .list-group-item:last-child {
                border-bottom: none;
            }
            .category-title {
                font-size: 1.15rem;
                font-weight: 700;
                color: #764ba2;
                margin-bottom: 12px;
                letter-spacing: 0.5px;
            }
            .list-group .list-group-item {
                border-radius: 8px;
                margin-bottom: 8px;
                background: #fff;
                box-shadow: 0 1px 4px rgba(102,126,234,0.04);
            }
            .fw-semibold {
                font-weight: 600 !important;
            }
            .footer {
                background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                margin-top: 50px;
                border-radius: 0 0 12px 12px;
                padding: 16px 0;
            }
            @media (max-width: 991.98px) {
                .overview-box {
                    padding: 18px 8px 18px 8px;
                }
                .avatar {
                    width: 48px;
                    height: 48px;
                    font-size: 1.5rem;
                }
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
                        <li class="list-group-item"><span class="info-label">Tài khoản:</span> ${sessionScope.account.account}</li>
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
        <footer class="footer mt-auto py-3">
            <div class="container text-center">
                <span class="text-muted">© 2025 Product Management System</span>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
