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
import models.DAO.ProductDAO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name="searchByName" , urlPatterns = "/searchByNameServlet")
public class SearchByName  extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          String searchName = req.getParameter("searchName");
          System.out.println("search name : " + searchName);
         List<ProductDTO> listPro = new ArrayList<>();
         ProductDAO dao = new ProductDAO();
         listPro = dao.searchByName(searchName);
         if (listPro!=null) {
             System.out.println("list search" + listPro.size());
               System.out.println("search Successfull!!!");
               HttpSession s = req.getSession();
                s.setAttribute("PRO_LIST", listPro);
               req.getRequestDispatcher("product-management.jsp").forward(req, resp);
        } else {
             System.out.println("search failed!!!");
               req.getRequestDispatcher("product-management.jsp").forward(req, resp);
         }
    }
    
}
