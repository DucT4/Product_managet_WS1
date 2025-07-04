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
@WebServlet(name = "deleteProductController", urlPatterns = "/deleteProductServlet")
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productID = req.getParameter("productId");
        System.out.println("product ID : " + productID);
        ProductDTO product = new ProductDTO();
        ProductDAO dao = new ProductDAO();
        product = dao.getObjectById(productID);
        System.out.println("product:  " + product.toString());
        if (dao.deleteRec(product) > 0) {
            System.out.println("DELETE SUCCESS: ");
            req.getRequestDispatcher("main?action=productManager").forward(req, resp);
        } else {
            System.out.println("DELETE FAILED!!!");
            req.getRequestDispatcher("main?action=productManager").forward(req, resp);
        }
        System.out.println("delete product");

    }

}
