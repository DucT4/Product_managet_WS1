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
import java.text.SimpleDateFormat;
import java.util.Date;
import models.DAO.ProductDAO;
import models.DAO.CategoryDAO;
import models.DAO.AccountDAO;
import models.DTO.ProductDTO;
import models.DTO.CategoryDTO;
import models.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name="updateProductController" , urlPatterns = "/updateProductServlet")
public class UpdateProductController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String productName = req.getParameter("productName");
        String productImage = req.getParameter("productImg");
        String typeName = req.getParameter("productCategoryName");
        String postedDateStr = req.getParameter("postedDate");
        String priceStr = req.getParameter("price");
        String discountStr = req.getParameter("discount");
        String brief = req.getParameter("brief");
        String unit = req.getParameter("unit");
        String accountId = req.getParameter("accoun");

        try {
            // Parse postedDate
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date postedDate = sdf.parse(postedDateStr);

            // Lấy CategoryDTO từ tên (hoặc cần sửa lại nếu là id)
            CategoryDAO categoryDAO = new CategoryDAO();
            CategoryDTO category = null;
            for (CategoryDTO c : categoryDAO.listAll()) {
                if (c.getCategoryName().equals(typeName)) {
                    category = c;
                    break;
                }
            }
            // Lấy AccountDTO từ id
            AccountDAO accountDAO = new AccountDAO();
            AccountDTO account = accountDAO.getObjectById(accountId);

            int price = (int) Double.parseDouble(priceStr);
            int discount = Integer.parseInt(discountStr);

            ProductDTO product = new ProductDTO(
                productId,
                productName,
                productImage,
                brief,
                postedDate,
                category,
                account,
                unit,
                price,
                discount
            );
            ProductDAO dao = new ProductDAO();
            dao.updateRec(product);
            System.out.println("update success: ");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Lỗi cập nhật sản phẩm: " + e.getMessage());
        }
        req.getRequestDispatcher("main?action=productManager").forward(req, resp);
    }
    
            
}
