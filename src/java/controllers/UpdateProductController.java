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
import java.io.IOException;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updateProductController", urlPatterns = "/updateProductServlet")
public class UpdateProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String productName = req.getParameter("productName");
        String productImage = req.getParameter("productImg");
//        CategoryDTO category = new CategoryDTO();
//        category.setCategoryName(req.getParameter("productCategoryName"));
//        String typeName = req.getParameter("productCategoryName");
//        String postedDateStr = req.getParameter("postedDate");
        int priceStr = Integer.parseInt(req.getParameter("price"));
        int discountStr = Integer.parseInt(req.getParameter("discount"));
        String brief = req.getParameter("brief");
        String unit = req.getParameter("unit");
//        String accountId = req.getParameter("accoun");

        try {
            ProductDTO product = new ProductDTO(productId, productName, productImage, brief, unit, priceStr, discountStr);

            ProductDAO dao = new ProductDAO();
            int result = dao.updateRec(product);
            if (result > 0) {
                System.out.println("update success: " + result);
                req.getRequestDispatcher("main?action=productManager").forward(req, resp);
            } else {
                System.out.println("update failed: ");
                req.getRequestDispatcher("main?action=productManager").forward(req, resp);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            req.setAttribute("error", "Lỗi cập nhật sản phẩm: " + e.getMessage());
        }

    }

}
