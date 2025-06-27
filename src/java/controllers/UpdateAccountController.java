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
import models.DAO.AccountDAO;
import models.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updateController", urlPatterns = "/updateAccountServlet")
public class UpdateAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accoun = req.getParameter("account");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String birthDayStr = req.getParameter("birthDay");
        String genderStr = req.getParameter("gender");
        String roleStr = req.getParameter("role");
        String password = req.getParameter("password");

// Chuyển đổi kiểu dữ liệu
        java.sql.Date birthDay = null;
        if (birthDayStr != null && !birthDayStr.isEmpty()) {
            birthDay = java.sql.Date.valueOf(birthDayStr); 
        }
        boolean gender = "true".equalsIgnoreCase(genderStr);
        int roleInSystem = Integer.parseInt(roleStr);
        AccountDTO account = new AccountDTO(accoun, password, firstName, lastName, birthDay, gender, phone, gender, roleInSystem);
       
        AccountDAO dao = new AccountDAO();
        dao.updateRec(account);
        System.out.println("aaa");
       req.getRequestDispatcher("main?action=account").forward(req, resp);
    }

}
