
package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

@WebServlet(name="sortByPriceController", urlPatterns="/sortByPriceController")
public class SortByPriceController extends HttpServlet { 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sort = req.getParameter("sortOrder");
        List<ProductDTO> listSort = new ArrayList<>();
        ProductDAO dao = new ProductDAO();
        listSort = dao.sortByPrice(sort); 
        req.setAttribute("LIST_SORT", listSort);
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }
}