/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import models.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
@WebFilter(filterName = "authen", urlPatterns = {"/accountServlet"})
public class Authen implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            res.sendRedirect("main?action=login");
            return;
        }
        AccountDTO acc = (AccountDTO) session.getAttribute("account");
        if (acc == null) {
            res.sendRedirect("main?action=categories");
            return;
        }
        if (acc.getRoleInSystem() == 1) {
            chain.doFilter(request, response);
        } else {
            System.out.println("khogn du quyen truy cap");
            res.sendRedirect("main?action=categories");
        }
    }
}
