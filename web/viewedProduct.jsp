<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sản phẩm đã xem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6fb;
            min-height: 100vh;
        }
        .container {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(102,126,234,0.10);
            padding: 36px 32px 32px 32px;
            margin-top: 48px;
            margin-bottom: 32px;
            max-width: 1000px;
        }
        h2 {
            font-weight: 800;
            color: #764ba2;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px rgba(102,126,234,0.08);
        }
        .product-card {
            border: 1px solid #e3e6f0;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            background: #f9fafd;
            box-shadow: 0 2px 8px rgba(102,126,234,0.05);
        }
        .product-card img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 24px;
            border: 1px solid #e3e6f0;
        }
        .product-info {
            flex: 1;
        }
        .product-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 6px;
        }
        .product-meta {
            font-size: 0.98rem;
            color: #666;
        }
        .product-price {
            color: #28a745;
            font-weight: 700;
            font-size: 1.1rem;
        }
        .product-discount {
            color: #ff9800;
            font-weight: 600;
            margin-left: 10px;
        }
        .no-viewed {
            text-align: center;
            color: #888;
            font-size: 1.1rem;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4"><i class="fas fa-eye me-2"></i>Sản phẩm đã xem</h2>
        <c:choose>
            <c:when test="${not empty sessionScope.LIST_PRODUCT_VIEWED}">
                <c:forEach var="product" items="${sessionScope.LIST_PRODUCT_VIEWED}">
                    <div class="product-card">
                        <a href="main?action=productDetail&productId=${product.productId}">
                            <img src="images/${product.productImage}" alt="${product.productName}" />
                        </a>
                        <div class="product-info">
                            <div class="product-title">
                                <a href="main?action=productDetail&productId=${product.productId}" style="text-decoration:none; color:inherit;">
                                    ${product.productName}
                                </a>
                            </div>
                            <div class="product-meta">
                                Danh mục: <span>${product.type.categoryName}</span>
                                <br/>
                                Ngày đăng: <span>${product.postedDate}</span>
                            </div>
                            <div class="mt-2">
                                <span class="product-price">${product.price} VND</span>
                                <c:if test="${product.discount > 0}">
                                    <span class="product-discount">- ${product.discount}%</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-viewed">
                    <i class="fas fa-info-circle me-2"></i>Bạn chưa xem sản phẩm nào.
                </div>
            </c:otherwise>
        </c:choose>
        <div class="mt-4">
            <a href="index.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left me-2"></i>Quay lại trang chủ</a>
        </div>
    </div>
    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <span><i class="fas fa-copyright me-2"></i>2025 Product Management System</span>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
