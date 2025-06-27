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
import models.DAO.CategoryDAO;
import models.DTO.CategoryDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updateCategoryController", urlPatterns = "/updateCategoryServlet")
public class UpdateCategoryController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("BBBBB");
        int id =  Integer.parseInt(req.getParameter("id")) ;
        String name = req.getParameter("name");
        String memo = req.getParameter("memo");
        CategoryDTO category = new CategoryDTO(id, name, memo);
        System.out.println("id :" + category.getTypeId());
        CategoryDAO dao = new CategoryDAO();
        dao.updateRec(category);  
        System.out.println("BBBB");
        req.getRequestDispatcher("main?action=categories").forward(req, resp);
    }
    
}
