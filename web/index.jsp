<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang quản lý</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">    
    <link rel="stylesheet" href="css/index.css">
     
</head>
<body>
    <%@include file="/menu.jsp" %>
    <!-- Hero section -->
    <div class="hero-section">
        <div class="container">
            <div class="hero-title">Product Management System</div>
            <div class="hero-desc">
                Hệ thống quản lý sản phẩm và tài khoản hiện đại, dễ sử dụng, bảo mật cao.<br>
                Quản lý danh mục, sản phẩm, tài khoản và nhiều tính năng tiện ích cho doanh nghiệp.
            </div>
            <a href="login.jsp" class="btn btn-light btn-lg px-4 shadow-sm">Đăng nhập quản trị</a>
        </div>
    </div>
    <!-- Features -->
    <div class="container mt-5">
        <h2 class="mb-4 text-center fw-bold">Các chức năng nổi bật</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-box-seam"></i></div>
                    <h5 class="fw-bold mb-2">Quản lý sản phẩm</h5>
                    <div>Thêm, sửa, xóa, tìm kiếm và phân loại sản phẩm theo danh mục. Hỗ trợ upload hình ảnh, mô tả chi tiết.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-people"></i></div>
                    <h5 class="fw-bold mb-2">Quản lý tài khoản</h5>
                    <div>Phân quyền Admin/Staff, quản lý thông tin cá nhân, trạng thái tài khoản, bảo mật đăng nhập và đăng xuất an toàn.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-tags"></i></div>
                    <h5 class="fw-bold mb-2">Quản lý danh mục</h5>
                    <div>Tạo và chỉnh sửa các danh mục sản phẩm, hỗ trợ phân loại, ghi chú, giúp quản lý kho hàng hiệu quả.</div>
                </div>
            </div>
        </div>
        <div class="row mt-4 g-4">
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-bar-chart"></i></div>
                    <h5 class="fw-bold mb-2">Thống kê & Dashboard</h5>
                    <div>Xem nhanh số lượng sản phẩm, tài khoản, danh mục và các báo cáo tổng quan trực quan.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-shield-lock"></i></div>
                    <h5 class="fw-bold mb-2">Bảo mật</h5>
                    <div>Đăng nhập bảo mật, phân quyền, kiểm soát truy cập và quản lý session an toàn.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card h-100 text-center p-4">
                    <div class="feature-icon mb-3"><i class="bi bi-ui-checks"></i></div>
                    <h5 class="fw-bold mb-2">Giao diện thân thiện</h5>
                    <div>Thiết kế responsive, dễ sử dụng trên mọi thiết bị, thao tác nhanh chóng, trải nghiệm người dùng tối ưu.</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="contact-box text-center">
                    <h4 class="mb-3 fw-bold">Liên hệ & Hỗ trợ</h4>
                    <div>Email: <a href="mailto:support@productsystem.com">support@productsystem.com</a></div>
                    <div>Hotline: <b>0123 456 789</b></div>
                    <div>Địa chỉ: FPT University, TP.HCM</div>
                    <div class="mt-3">
                        <a href="login.jsp" class="btn btn-primary px-4">Đăng nhập quản trị</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer mt-5 py-3">
        <div class="container text-center">
            <span class="text-muted">© 2025 Product Management System</span>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
