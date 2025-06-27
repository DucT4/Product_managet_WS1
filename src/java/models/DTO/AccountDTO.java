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
public class AccountDTO implements Serializable{
    private String accoun;
    private String password;
    private String firstName;
    private String lastName;
    private Date birthDay;
    private boolean gender;
    private String phone;
    private boolean isUse;
    private int roleInSystem;

    public AccountDTO() {
    }

    public AccountDTO(String accoun, String password, String firstName, String lastName, Date birthDay, boolean gender, String phone, boolean isUse, int roleInSystem) {
        this.accoun = accoun;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDay = birthDay;
        this.gender = gender;
        this.phone = phone;
        this.isUse = isUse;
        this.roleInSystem = roleInSystem;
    }

    public AccountDTO(String accoun, String password) {
        this.accoun = accoun;
        this.password = password;
    }

    public String getAccoun() {
        return accoun;
    }

    public void setAccoun(String accoun) {
        this.accoun = accoun;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isIsUse() {
        return isUse;
    }

    public void setIsUse(boolean isUse) {
        this.isUse = isUse;
    }

    public int getRoleInSystem() {
        return roleInSystem;
    }

    public void setRoleInSystem(int roleInSystem) {
        this.roleInSystem = roleInSystem;
    }
    
}
