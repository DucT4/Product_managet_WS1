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
import java.util.List;
import models.DAO.CategoryDAO;
import models.DAO.ProductDAO;
import models.DTO.CategoryDTO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "productManagerController", urlPatterns = "/productManagerServlet")
public class ProductManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<ProductDTO> listPro = new ArrayList<>();
        List<CategoryDTO> listCategories = new ArrayList<>();
        ProductDAO daoPro = new ProductDAO();
        CategoryDAO daoCate = new CategoryDAO();
        listPro = daoPro.listAll();
        listCategories = daoCate.listAll();
        HttpSession session = req.getSession();
          
        session.setAttribute("categories", listCategories);
        session.setAttribute("PRO_LIST", listPro);
        System.out.println("aaaaa");
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }

}
