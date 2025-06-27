<%-- 
    Document   : admin-menu.jsp
    Created on : Jun 25, 2025, 9:36:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <c:if test="${not empty sessionScope.account}">
                    <span>Hello, ${sessionScope.account.lastName} ${sessionScope.account.firstName}</span>
                </c:if>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                        <!--<li class="nav-item"><a class="nav-link" href="add-account.jsp">Create Acccount</a></li>-->
                        <li class="nav-item"><a class="nav-link" href="main?action=account">Account </a></li>
                        <li class="nav-item"><a class="nav-link" href="main?action=categories">Categories</a></li>  
                        <li class="nav-item"><a class="nav-link" href="product-management.jsp">Sản phẩm</a></li>
                        <li class="nav-item"><a class="nav-link" href="main?action=logout">Đăng xuất</a></li>

                    </ul>
                </div>
            </div>
        </nav>

    </body>
</html>
