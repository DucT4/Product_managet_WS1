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
import models.DAO.CategoryDAO;
import models.DAO.ProductDAO;
import models.DTO.AccountDTO;
import models.DTO.CategoryDTO;
import models.DTO.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginServlet"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String account = req.getParameter("account");
            String password = req.getParameter("password");
            HttpSession session = req.getSession();

            if (account == null || account.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                session.setAttribute("error", "Tên đăng nhập và mật khẩu không được để trống.");
                resp.sendRedirect("main?action=login");
                return;
            }
            AccountDAO dao = new AccountDAO();
            AccountDTO acc = dao.checkLogin(account, password);
//            System.out.println("role in system: " + acc.getRoleInSystem());
            if (account != null) {
                System.out.println("login success!!! ");
                session.setAttribute("account", acc);
                System.out.println("login success!!");
                List<ProductDTO> listPro = new ArrayList<>();
                List<CategoryDTO> listCategories = new ArrayList<>();
                ProductDAO daoPro = new ProductDAO();
                CategoryDAO daoCate = new CategoryDAO();
                listPro = daoPro.listAll();
                listCategories = daoCate.listAll();
                session.setAttribute("categories", listCategories);
                session.setAttribute("PRO_LIST", listPro);
                //
                      AccountDTO acc1 = (AccountDTO) session.getAttribute("account");
                      System.out.println("role sytem in list: " + acc1.getRoleInSystem());
                resp.sendRedirect("main?action=categories");
            } else {
                System.out.println("login failed!!");
                session.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu.");
                resp.sendRedirect("main?action=login");
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

    }
}
