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
@WebServlet(name = "classifyCustomerController", urlPatterns = "/classifyCustomerController")
public class ClassifyCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy danh sách sản phẩm đã xem từ session giống ProductDetails.java
        HttpSession session = req.getSession();
        List<ProductDTO> listViewed = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT_VIEWED");
        if (listViewed == null) {
            listViewed = new ArrayList<>();
        }
        System.out.println("listViewed size   : " + listViewed.size());
        // Nếu chưa xem sản phẩm nào thì chuyển hướng về trang quản lý sản phẩm với thông báo
        if (listViewed.isEmpty()) {
            req.setAttribute("CLASSIFY_MESSAGE", "Bạn chưa xem sản phẩm nào để phân loại.");
            req.getRequestDispatcher("product-management.jsp").forward(req, resp); 
            return;
        }

        // Tính trung bình giá sản phẩm đã xem
        int totalPrice = 0;
        for (ProductDTO pro : listViewed) {
            totalPrice += pro.getPrice();
        }
        double avg = (double) totalPrice / listViewed.size();

        // Lấy danh sách sản phẩm phù hợp với trung bình giá
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> listProSelected = dao.classifyCustomer(avg);
        System.out.println("listProSelected: " + listProSelected);
        // Đưa danh sách sản phẩm phân loại vào request để hiển thị ở product-management.jsp
        req.setAttribute("CLASSIFIED_PRO_LIST", listProSelected);
        req.setAttribute("CLASSIFY_MESSAGE", "Đã phân loại sản phẩm theo mức giá trung bình bạn đã xem (" + avg + " VND).");
        System.out.println("listProSelected size: " + listProSelected.size());
        System.out.println("avg: " + avg);
        // Chuyển hướng về trang quản lý sản phẩm để hiển thị sản phẩm phân loại
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }

}
