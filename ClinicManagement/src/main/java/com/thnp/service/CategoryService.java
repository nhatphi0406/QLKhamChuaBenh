/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.thnp.service;

import com.thnp.pojo.Category;
import java.util.List;

/**
 *
 * @author nhatp
 */
public interface CategoryService {
    List<Category> getCategories();
    Category getCategoryById(int cateId);
}
