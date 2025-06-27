<%-- 
    Document   : menu.jsp
    Created on : Jun 25, 2025, 9:34:11 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <!--<a class="navbar-brand" href="index.jsp">Product Management</a>-->
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>


                        <li class="nav-item" >              
                        <li class="nav-item"><a class="nav-link" href="main?action=portfolio">Danh muc san pham</a></li>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Đăng nhập</a></li>
                    
                    </ul>
                </div>
            </div>
        </nav>

    </body>
</html>


