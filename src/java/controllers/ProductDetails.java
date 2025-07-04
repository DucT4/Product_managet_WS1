/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "productDetails", urlPatterns = "/productDetailServlet")
public class ProductDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        ProductDAO dao = new ProductDAO();
        ProductDTO product = dao.getObjectById(id);

        HttpSession session = req.getSession();
        // Lấy danh sách sản phẩm đã xem từ session
        List<ProductDTO> listProductViewed = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT_VIEWED");
        if (listProductViewed == null) {
            listProductViewed = new ArrayList<>();
        }

        // check trugn lap 
        boolean alreadyViewed = false;
        for (ProductDTO p : listProductViewed) {
            if (p.getProductId().equals(product.getProductId())) {
                alreadyViewed = true;
                break;
            }
        }
        if (!alreadyViewed) {
            listProductViewed.add(product);
        }

        session.setAttribute("LIST_PRODUCT_VIEWED", listProductViewed);
        session.setAttribute("Product", product);
        req.getRequestDispatcher("product-details.jsp").forward(req, resp);
    }
    

}
