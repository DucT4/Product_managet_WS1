/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.DTO.CategoryDTO;
import models.DTO.ProductDTO;
import util.ConnectDB;

/**
 *
 * @author Admin
 */
public class CategoryDAO implements Accessible<CategoryDTO> {

    @Override
    public int insertRec(CategoryDTO object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int updateRec(CategoryDTO category) {
        int result = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = ConnectDB.getConnection();
            String sql = "UPDATE [dbo].[categories]\n"
                    + "   SET [categoryName] = ?,\n"
                    + "       [memo] = ?\n"
                    + " WHERE typeId = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getMemo());
            ps.setInt(3, category.getTypeId());
            result = ps.executeUpdate();
            System.out.println("rows update: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int deleteRec(CategoryDTO category) {
        int result = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = ConnectDB.getConnection();
            String sql = "DELETE FROM products WHERE typeId = ?\n"
                    + "DELETE FROM categories WHERE typeId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, category.getTypeId());
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public CategoryDTO getObjectById(String id) {
        CategoryDTO category = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();
            //tao cau lenhj query
            String sql = "SELECT [typeId]\n"
                    + "      ,[categoryName]\n"
                    + "      ,[memo]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[categories]\n"
                    + "  WHERE typeId=?";
            // tao doi tg query
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            //thuc thi
            rs = ps.executeQuery();
            // luu tru doi tg
            while (rs.next()) {
                int rsId = rs.getInt("typeId");
                String categoryName = rs.getString("categoryName");
                String memo = rs.getString("memo");
                boolean isActive = rs.getBoolean("isActive");
                category = new CategoryDTO(rsId, categoryName, memo, isActive);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    @Override
    public List<CategoryDTO> listAll() {
        List<CategoryDTO> list = new ArrayList<>();

        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();

            //cau query
            String sql = "SELECT [typeId]\n"
                    + "      ,[categoryName]\n"
                    + "      ,[memo]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[categories]";
            //tao doi tg query
            PreparedStatement ps = conn.prepareStatement(sql);
            //thuc thi 
            rs = ps.executeQuery();
            // duyet tung dong ket qua
            while (rs.next()) {
                int typeID = rs.getInt("typeId");
                String categoryName = rs.getString("categoryName");
                String memo = rs.getString("memo");
                boolean isActive = rs.getBoolean("isActive");
                System.out.println("is active :" + isActive);
                // tao doi tg category
                CategoryDTO category = new CategoryDTO(typeID, categoryName, memo, isActive);
                list.add(category);
            }
            System.out.println("eee" + conn.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //update status 
    public void updateCategoryStatus() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            // Lấy danh sách tất cả category và product
            CategoryDAO cateDAO = new CategoryDAO();
            List<CategoryDTO> listCategories = cateDAO.listAll();

            ProductDAO proDao = new ProductDAO();
            List<ProductDTO> listProducts = proDao.listAll();

            // Mở kết nối một lần
            conn = ConnectDB.getConnection();

            String sql = "UPDATE categories SET isActive = ? WHERE typeId = ?";
            ps = conn.prepareStatement(sql);

            for (CategoryDTO category : listCategories) {
                int count = 0;
                for (ProductDTO product : listProducts) {
                    if (product.getType().getTypeId() == category.getTypeId()) {
                        count++;
                    }
                }
                System.out.println("cate name:" + category.getCategoryName());
                System.out.println("count " + count );
                boolean isActive = count > 0;
                System.out.println("active :" + isActive);
                ps.setBoolean(1, isActive);
                ps.setInt(2, category.getTypeId());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

}
