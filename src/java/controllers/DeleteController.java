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
@WebServlet(name = "deleteController", urlPatterns = "/deleteServlet")
public class DeleteController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                CategoryDTO category = new CategoryDTO();
                category.setTypeId(id);
                CategoryDAO dao = new CategoryDAO();
                int result = dao.deleteRec(category);
                System.out.println("Deleted rows: " + result);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // Sau khi xóa xong, chuyển về trang danh sách
        resp.sendRedirect("main?action=categories");
    }
}
