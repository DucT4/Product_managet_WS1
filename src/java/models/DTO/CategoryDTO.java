/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.DTO;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CategoryDTO implements Serializable {

    private int typeId;
    private String categoryName;
    private String memo;
    private boolean isActive;

    public CategoryDTO() {
    }

    public CategoryDTO(int typeId, String categoryName, String memo, boolean isActive) {
        this.typeId = typeId;
        this.categoryName = categoryName;
        this.memo = memo;
        this.isActive = isActive;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }



    public CategoryDTO(int typeId, String categoryName, String memo) {
        this.typeId = typeId;
        this.categoryName = categoryName;
        this.memo = memo;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

}
