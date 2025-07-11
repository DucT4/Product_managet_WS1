/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.DTO;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author Admin
 */
public class ProductDTO implements Serializable{
     private String productId;
    private String productName;
    private String productImage;
    private String brief;
    private Date postedDate;
    private CategoryDTO type;
    private AccountDTO account;
    private  String unit;
    private int price;
    private int discount;

    public ProductDTO() {
    }

    public ProductDTO(String productId, String productName, String productImage, String brief,  String unit, int price, int discount) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.brief = brief;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }

    public ProductDTO(String productId, String productName, String productImage, String brief, Date postedDate, CategoryDTO type, AccountDTO account, String unit, int price, int discount) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.brief = brief;
        this.postedDate = postedDate;
        this.type = type;
        this.account = account;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }

 

    public ProductDTO(int productId, String productName, String productImage, String brief, String postedDate, String type, String account, String unit, double price, int discount) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CategoryDTO getType() {
        return type;
    }

    public void setType(CategoryDTO type) {
        this.type = type;
    }

    public AccountDTO getAccount() {
        return account;
    }

    public void setAccount(AccountDTO account) {
        this.account = account;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

   



    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }
}