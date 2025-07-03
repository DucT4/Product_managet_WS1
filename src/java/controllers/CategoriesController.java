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
import models.DTO.CategoryDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "categoriesController", urlPatterns = "/categoryServlet")
public class CategoriesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> listCategories = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        dao.updateCategoryStatus();
        listCategories = dao.listAll();
        boolean active = listCategories.get(0).isIsActive();
        System.out.println("trang thai : " + active);
        System.out.println("lít cate: " + listCategories.size());
//        HttpSession session = req.getSession();
//        session.setAttribute("categories", listCategories);
        req.setAttribute("categories", listCategories);

        req.getRequestDispatcher("category-list.jsp").forward(req, resp);

    }

}
