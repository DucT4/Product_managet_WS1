/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.DTO.AccountDTO;
import models.DTO.CategoryDTO;
import models.DTO.ProductDTO;
import util.ConnectDB;

/**
 *
 * @author Admin
 */
public class ProductDAO implements Accessible<ProductDTO> {

    @Override
    public int insertRec(ProductDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int updateRec(ProductDTO product) {
        int rs = 0;
        Connection conn = null;

        try {
            //ket noi database
            conn = ConnectDB.getConnection();
            //tao cau query
            String sql = "UPDATE [dbo].[products]\n"
                    + "   SET [productName] = ?,\n"
                    + "      [productImage] = ?,\n"
                    + "      [brief] = ?,\n"
                    + "      [unit] = ?,\n"
                    + "      [price] = ?,\n"
                    + "      [discount] = ?\n"
                    + " WHERE productId=?";
            //tao doi tg query
            System.out.println("update AAA");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductImage());
            ps.setString(3, product.getBrief());
            ps.setString(4, product.getUnit());
            ps.setInt(5, product.getPrice());
            ps.setInt(6, product.getDiscount());
            ps.setString(7, product.getProductId());
            rs = ps.executeUpdate();
            System.out.println("rows update: " + rs);
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
                System.out.println(e2.getMessage());
            }
            System.out.println(e.getMessage());
        }
        return rs;
    }

    @Override
    public int deleteRec(ProductDTO product) {
        int rs = 0;
        Connection conn = null;
        try {
            conn = ConnectDB.getConnection();
            String sql = "DELETE FROM [dbo].[products]\n"
                    + "      WHERE  productId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getProductId());
            System.out.println("delete rows:");
            rs = ps.executeUpdate();

            System.out.println("rows delete: " + rs);
        } catch (Exception e) {

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
                System.out.println(e2.getMessage());
            }
        }
        return rs;
    }

    @Override
    public ProductDTO getObjectById(String id) {
        ProductDTO product = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();
            //tao cau lenhj query
            String sql = "SELECT [productId]\n"
                    + "      ,[productName]\n"
                    + "      ,[productImage]\n"
                    + "      ,[brief]\n"
                    + "      ,[postedDate]\n"
                    + "      ,[typeId]\n"
                    + "      ,[account]\n"
                    + "      ,[unit]\n"
                    + "      ,[price]\n"
                    + "      ,[discount]\n"
                    + "  FROM [dbo].[products] p\n"
                    + "  WHERE p.productId =?";
            // tao doi tg query
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            //thuc thi
            rs = ps.executeQuery();
            // luu tru doi tg
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                int typeId = rs.getInt("typeId");
                String accountId = rs.getString("account");
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");

                CategoryDAO categoryDAO = new CategoryDAO();
                CategoryDTO type = categoryDAO.getObjectById(String.valueOf(typeId));
                AccountDAO accountDAO = new AccountDAO();
                AccountDTO account = accountDAO.getObjectById(accountId);

                product = new ProductDTO(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<ProductDTO> listAll() {
        List<ProductDTO> list = new ArrayList<>();

        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();

            //cau query
            String sql = "SELECT [productId]\n"
                    + "      ,[productName]\n"
                    + "      ,[productImage]\n"
                    + "      ,[brief]\n"
                    + "      ,[postedDate]\n"
                    + "      ,[typeId]\n"
                    + "      ,[account]\n"
                    + "      ,[unit]\n"
                    + "      ,[price]\n"
                    + "      ,[discount]\n"
                    + "  FROM [dbo].[products]";
            //tao doi tg query
            PreparedStatement ps = conn.prepareStatement(sql);
            //thuc thi 
            rs = ps.executeQuery();
            // duyet tung dong ket qua
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String brief = rs.getString("brief");
                Date postedDate = rs.getDate("postedDate");
                int typeId = rs.getInt("typeId");
                String accountId = rs.getString("account");
                String unit = rs.getString("unit");
                int price = rs.getInt("price");
                int discount = rs.getInt("discount");

                CategoryDAO categoryDAO = new CategoryDAO();
                CategoryDTO type = categoryDAO.getObjectById(String.valueOf(typeId));
                AccountDAO accountDAO = new AccountDAO();
                AccountDTO account = accountDAO.getObjectById(accountId);

                ProductDTO product = new ProductDTO(productId, productName, productImage, brief, postedDate, type, account, unit, price, discount);
                list.add(product);
            }
            System.out.println("eee" + conn.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
