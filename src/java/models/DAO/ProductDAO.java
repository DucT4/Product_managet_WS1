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

    //searchByName
    public List<ProductDTO> searchByNameInList(List<ProductDTO> list, String nameProduct) {
        List<ProductDTO> result = new ArrayList<>();
        for (ProductDTO product : list) {
            if (product.getProductName().toLowerCase().contains(nameProduct.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }
    // public List<ProductDTO> searchByName(String nameProduct) {
    //     List<ProductDTO> listPro = new ArrayList<>();
    //     ProductDTO product = null;
    //     Connection conn = null;
    //     ResultSet rs = null;
    //     try {
    //         //connect database
    //         conn = ConnectDB.getConnection();
    //         //tao query
    //         String sql = "SELECT * FROM products WHERE productName LIKE ?";
    //         //tao doi tg query
    //         PreparedStatement ps = conn.prepareStatement(sql);
    //         ps.setString(1, "%" + nameProduct + "%");

    //         //thuc thi
    //         rs = ps.executeQuery();
    //         System.out.println("rs:  " + rs);
    //         while (rs.next()) {
    //             String productId = rs.getString("productId");
    //             String productName = rs.getString("productName");
    //             String productImage = rs.getString("productImage");
    //             String brief = rs.getString("brief");
    //             Date postedDate = rs.getDate("postedDate");
    //             int typeId = rs.getInt("typeId");
    //             String accountID = rs.getString("account");
    //             String unit = rs.getString("unit");
    //             int price = rs.getInt("price");
    //             int discount = rs.getInt("discount");

    //             AccountDAO accDAO = new AccountDAO();
    //             AccountDTO account = accDAO.getObjectById(accountID);
    //             CategoryDAO cateDao = new CategoryDAO();
    //             CategoryDTO category = cateDao.getObjectById(String.valueOf(typeId));

    //             String categoryName = category.getCategoryName();
    //             System.out.println("category name: " + categoryName);
    //             product = new ProductDTO(productId, productName, productImage, brief, postedDate, category, account, unit, price, discount);
    //             System.out.println("product : " + product);
    //             listPro.add(product);
    //         }
    //     } catch (Exception e) {
    //         try {
    //             if (conn != null) {
    //                 conn.close();
    //             }
    //         } catch (Exception e2) {
    //             System.out.println(e.getMessage());
    //         }
    //     }

    //     return listPro;
    // }

    //classifyCustomer
    /**
     * Hàm này xử lý phân loại khách hàng dựa trên giá trung bình (avg) của các sản phẩm đã xem.
     * Nếu avg <= 5000: khách hàng loại "thấp", trả về các sản phẩm giá <= 5000.
     * Nếu 5000 < avg <= 10000: khách hàng loại "ổn định", trả về các sản phẩm giá > 5000 và <= 10000.
     * Nếu avg > 10000: khách hàng loại "cao", trả về các sản phẩm giá > 10000.
     * 
     * Hàm này xử lý đúng logic phân loại khách hàng theo giá sản phẩm.
     */
    public List<ProductDTO> classifyCustomer(double avg) {
        List<ProductDTO> listPro = new ArrayList<>();
        // Xác định loại khách hàng dựa trên avg
        if (avg <= 100000 && avg > 0) {
 
            for (ProductDTO productDTO : this.listAll()) {
                if (productDTO.getPrice() <= 100000) {
                    listPro.add(productDTO);
                }
            }
        } else if (avg > 100000 && avg <= 200000) {
          
            for (ProductDTO productDTO : this.listAll()) {
                if (productDTO.getPrice() > 100000 && productDTO.getPrice() <= 200000) {
                    listPro.add(productDTO);
                }
            }
        } else if (avg > 250000) {

            for (ProductDTO productDTO : this.listAll()) {
                if (productDTO.getPrice() > 250000) {
                    listPro.add(productDTO);
                }
            }
        }
        return listPro;
    }

    //loc san pham theo khoang gia
    public List<ProductDTO> filterByPriceRangeType(String rangeType) {
        int min = 0, max = Integer.MAX_VALUE;
        switch (rangeType) {
            case "under1m":
                max = 1000000;
                break;
            case "1mto2m":
                min = 1000000;
                max = 2000000;
                break;
            case "2mto5m":
                min = 2000000;
                max = 5000000;
                break;
            case "above5m":
                min = 5000000;
                break;
            default:
                // Lấy tất cả
        }
        List<ProductDTO> listPro = new ArrayList<>();
        for (ProductDTO product : this.listAll()) {
            int price = product.getPrice();
            if (price >= min && price <= max) {
                listPro.add(product);
            }
        }
        return listPro;
    }
    // search by discount
    // Lọc sản phẩm theo mức giảm giá (discount)
    public List<ProductDTO> filterByDiscountRange(String discountRange) {
        int min = 0, max = 100;
        switch (discountRange) {
            case "0to10":
                min = 0;
                max = 10;
                break;
            case "10to20":
                min = 10;
                max = 20;
                break;
            case "20to50":
                min = 20;
                max = 50;
                break;
            case "above50":
                min = 50;
                max = 100;
                break;
            default:
                // Lấy tất cả
                min = 0;
                max = 100;
        }
        List<ProductDTO> filteredList = new ArrayList<>();
        for (ProductDTO product : this.listAll()) {
            int discount = product.getDiscount();
            if (discount >= min && discount <= max) {
                filteredList.add(product);
            }
        }
        return filteredList;
    }

    //sort by price
    /**
     * Sắp xếp danh sách sản phẩm theo giá.
     * 
     * @param sortOrder Thứ tự sắp xếp: "asc" cho tăng dần, "desc" cho giảm dần. Nếu null hoặc khác, giữ nguyên thứ tự gốc.
     * @return Danh sách sản phẩm đã được sắp xếp theo giá.
     */
  public List<ProductDTO> sortByPrice(String sortOrder) {
      // Lấy toàn bộ danh sách sản phẩm
      List<ProductDTO> productList = new ArrayList<>(this.listAll());
      // Nếu sortOrder không null, thực hiện sắp xếp
      if (sortOrder != null) {
          if (sortOrder.equalsIgnoreCase("asc")) {
              // Sắp xếp tăng dần theo giá
              productList.sort((p1, p2) -> Integer.compare(p1.getPrice(), p2.getPrice()));
          } else if (sortOrder.equalsIgnoreCase("desc")) {
              // Sắp xếp giảm dần theo giá
              productList.sort((p1, p2) -> Integer.compare(p2.getPrice(), p1.getPrice()));
          }
          // Nếu sortOrder không phải "asc" hoặc "desc", giữ nguyên thứ tự gốc
      }
      return productList;
  }
}
