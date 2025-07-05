package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "discountFilterController", urlPatterns = "/discountFilterController")
public class DiscountFilterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy giá trị discountRange từ request
        String discountRange = req.getParameter("discountRange");
         System.out.println("rang discount: " + discountRange);
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> filteredProducts = dao.filterByDiscountRange(discountRange);
        System.out.println("size filter discount: " + filteredProducts.size());
        // Đưa danh sách sản phẩm đã lọc vào requestScope
        req.setAttribute("FILTERED_DISCOUNT_PRODUCTS", filteredProducts);

        // Forward về trang product-management.jsp
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }

}
