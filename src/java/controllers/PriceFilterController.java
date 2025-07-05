package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

@WebServlet(name = "priceFilterController", urlPatterns = "/priceFilterController")
public class PriceFilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rangeType = req.getParameter("priceRange");
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> filteredProducts = dao.filterByPriceRangeType(rangeType);
        req.setAttribute("FILTERED_PRODUCTS", filteredProducts);
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }
}
