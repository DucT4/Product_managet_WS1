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
@WebServlet(name = "productDetails", urlPatterns = "/productServlet")
public class ProductDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        ProductDAO dao = new ProductDAO();
        ProductDTO product = new ProductDTO();
        product = dao.getObjectById(id);
        System.out.println("ten : " +product.getUnit());
        
        HttpSession session = req.getSession();
        session.setAttribute("Product", product);
        req.getRequestDispatcher("product-details.jsp").forward(req, resp);
    }

}
