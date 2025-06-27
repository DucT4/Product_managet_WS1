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
import util.ConnectDB;

/**
 *
 * @author Admin
 */
public class AccountDAO implements Accessible<AccountDTO> {

    @Override
    public int insertRec(AccountDTO account) {
        int result = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = ConnectDB.getConnection();
            String sql = "INSERT INTO accounts "
                    + "([account], [pass], [firstName], [lastName], [birthday], [gender], [phone], [isUse], [roleInSystem]) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, account.getAccoun());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFirstName());
            ps.setString(4, account.getLastName());
            // birthday: java.util.Date -> java.sql.Date
            if (account.getBirthDay() != null) {
                ps.setDate(5, new java.sql.Date(account.getBirthDay().getTime()));
            } else {
                ps.setDate(5, null);
            }
            ps.setBoolean(6, account.isGender());
            ps.setString(7, account.getPhone());
            ps.setBoolean(8, account.isIsUse());
            ps.setInt(9, account.getRoleInSystem());

            result = ps.executeUpdate();
            System.out.println("Insert account: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
        return result;
    }

    @Override
    public int updateRec(AccountDTO account) {
        int rs = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            //ket noi database
            conn = ConnectDB.getConnection();
            String sql = "UPDATE [dbo].[accounts]\n"
                    + "   SET [pass] =?,\n"
                    + "      [lastName] = ?,\n"
                    + "      [firstName] = ?,\n"
                    + "      [birthday] = ?,\n"
                    + "      [gender] = ?,\n"
                    + "      [phone] = ?,\n"
                    + "      [isUse] = ?,\n"
                    + "      [roleInSystem] =?\n"
                    + " WHERE  [account]=?";
            ps = conn.prepareStatement(sql);

            ps.setString(1, account.getPassword());
            ps.setString(2, account.getLastName());
            ps.setString(3, account.getFirstName());
            if (account.getBirthDay() != null) {
                ps.setDate(4, new java.sql.Date(account.getBirthDay().getTime()));
            } else {
                ps.setNull(4, java.sql.Types.DATE);
            }
            ps.setBoolean(5, account.isGender());
            ps.setString(6, account.getPhone());
            ps.setBoolean(7, account.isIsUse());
            ps.setInt(8, account.getRoleInSystem());
            ps.setString(9, account.getAccoun());
            rs = ps.executeUpdate();
            System.out.println("row update: " + rs);
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rs;
    }

    @Override
    public int deleteRec(AccountDTO account) {
        int result = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = ConnectDB.getConnection();
            String sql = "DELETE FROM accounts WHERE account = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, account.getAccoun());
            result = ps.executeUpdate();
            System.out.println("Deleted account: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
        return result;
    }

    @Override
    public AccountDTO getObjectById(String account) {
        AccountDTO acc = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();
            //tao cau lenhj query
            String sql = "SELECT [account]\n"
                    + "      ,[pass]\n"
                    + "      ,[lastName]\n"
                    + "      ,[firstName]\n"
                    + "      ,[birthday]\n"
                    + "      ,[gender]\n"
                    + "      ,[phone]\n"
                    + "      ,[isUse]\n"
                    + "      ,[roleInSystem]\n"
                    + "  FROM [dbo].[accounts] a\n"
                    + "  WHERE a.account=?";
            // tao doi tg query
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account);
            //thuc thi
            rs = ps.executeQuery();
            // luu tru doi tg
            while (rs.next()) {
                String rsAcc = rs.getString("account");
                String password = rs.getString("pass");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                Date birthDay = rs.getDate("birthday");
                boolean gender = rs.getBoolean("gender");
                String phone = rs.getString("phone");
                boolean isUse = rs.getBoolean("isUse");
                int roleInSystem = rs.getInt("roleInSystem");
                acc = new AccountDTO(account, password, firstName, lastName, birthDay, gender, phone, isUse, roleInSystem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } 
        return acc;
    }

    @Override
    public List<AccountDTO> listAll() {
        List<AccountDTO> listAcc = new ArrayList<>();
        AccountDTO account = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            //connect database
            conn = ConnectDB.getConnection();
            //tao cau query
            String sql = "SELECT [account]\n"
                    + "      ,[pass]\n"
                    + "      ,[lastName]\n"
                    + "      ,[firstName]\n"
                    + "      ,[birthday]\n"
                    + "      ,[gender]\n"
                    + "      ,[phone]\n"
                    + "      ,[isUse]\n"
                    + "      ,[roleInSystem]\n"
                    + "  FROM [dbo].[accounts] ";
            PreparedStatement ps = conn.prepareStatement(sql);
            //thuc thi
            rs = ps.executeQuery();
            while (rs.next()) {
                account = new AccountDTO(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getDate("birthday"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem")
                );
                listAcc.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAcc;
    }

    //feature login
    // AccountDAO.java
    public AccountDTO checkLogin(String account, String password) {
        AccountDTO result = null;
        Connection conn = null;
        try {
            conn = ConnectDB.getConnection();
            if (conn != null) {
                String sql = "SELECT [account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem] "
                        + "FROM [dbo].[accounts] WHERE account= ? and pass =?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, account);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    result = new AccountDTO(
                            rs.getString("account"),
                            rs.getString("pass"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getDate("birthday"),
                            rs.getBoolean("gender"),
                            rs.getString("phone"),
                            rs.getBoolean("isUse"),
                            rs.getInt("roleInSystem")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
