/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package models.DAO;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface Accessible <T> {
    int insertRec(T object);
    int updateRec(T object);
    int deleteRec(T object);
    T getObjectById(String id);
    List<T> listAll();
}
