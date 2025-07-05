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
import java.util.List;
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "searchByName", urlPatterns = "/searchByNameServlet")
public class SearchByNameProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchName = req.getParameter("searchName");
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> baseList = null;
        HttpSession session = req.getSession();
        baseList = (List<ProductDTO>) session.getAttribute("PRO_LIST");
        // Ưu tiên search trên danh sách đã lọc hoặc phân loại (request scope)
        if (req.getAttribute("FILTERED_PRODUCTS") != null) {
            baseList = (List<ProductDTO>) req.getAttribute("FILTERED_PRODUCTS");
        } else if (req.getAttribute("CLASSIFIED_PRO_LIST") != null) {
            baseList = (List<ProductDTO>) req.getAttribute("CLASSIFIED_PRO_LIST");
        }  else {
            baseList = dao.listAll();
        }

        List<ProductDTO> searchedList = dao.searchByNameInList(baseList, searchName);
        req.setAttribute("SEARCHED_PRODUCTS", searchedList);
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }
}
