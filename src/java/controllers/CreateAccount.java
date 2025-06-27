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
import java.util.Date;
import java.util.List;
import models.DAO.AccountDAO;
import models.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "createAccount", urlPatterns = "/createAccountController")
public class CreateAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accoun = req.getParameter("account");
        String password = req.getParameter("password");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String birthDayStr = req.getParameter("birthDay");
        String genderStr = req.getParameter("gender");
        String roleStr = req.getParameter("role");
        String isActiveStr = req.getParameter("isActive");

// Chuyển đổi kiểu dữ liệu
        java.sql.Date birthDay = null;
        if (birthDayStr != null && !birthDayStr.isEmpty()) {
            birthDay = java.sql.Date.valueOf(birthDayStr);
        }
        boolean gender = "true".equalsIgnoreCase(genderStr);
        int roleInSystem = Integer.parseInt(roleStr);
        boolean isUse = isActiveStr != null;
        AccountDTO account = new AccountDTO(accoun, password, firstName, lastName, birthDay, gender, phone, isUse, roleInSystem);
        AccountDAO dao = new AccountDAO();
        dao.insertRec(account);
        List<AccountDTO> listAcc = new ArrayList<>();   
        listAcc = dao.listAll();
        HttpSession s = req.getSession();
        s.setAttribute("LIST_ACCOUNT", listAcc);
        req.getRequestDispatcher("account-list.jsp").forward(req, resp);
    }

}
