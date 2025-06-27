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
import models.DAO.AccountDAO;
import models.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "accountController", urlPatterns = "/accountServlet")
public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<AccountDTO> listAcc = new ArrayList<>();
        AccountDAO dao = new AccountDAO();
        listAcc = dao.listAll();
        HttpSession s = req.getSession();
        s.setAttribute("LIST_ACCOUNT", listAcc);   
        req.getRequestDispatcher("account-list.jsp").forward(req, resp);
    }

}
