/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.thnp.service;

import com.thnp.pojo.Product;
import java.util.List;

/**
 *
 * @author nhatp
 */
public interface ProductService {
    List<Product> getProducts(String kw, int page);
    int countProduct();
    boolean addProduct(Product p);
    boolean deleteProduct(int id);
    //List<Object[]> countProdsByCate();
    //List<Object[]> revenueStats(int quarter, int year);
    Product getProductById(int productId);
    boolean updateProduct(Product p);
}
