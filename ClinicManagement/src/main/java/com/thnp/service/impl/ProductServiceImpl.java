/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.thnp.pojo.Product;
import com.thnp.repository.ProductRepository;
import com.thnp.service.ProductService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nhatp
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public int countProduct() {
        return this.productRepository.countProduct();
    }

    @Override
    public boolean addProduct(Product p) {

        try {
            Map r = this.cloudinary.uploader().upload(p.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            p.setImage((String) r.get("secure_url"));
            p.setActive(Boolean.TRUE);
            
            return this.productRepository.addProduct(p);
        } catch (IOException ex) {
            System.err.println("== ADD PRODUCT ==" + ex.getMessage());
        }

        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return this.productRepository.deleteProduct(id);
    }

    @Override
    public Product getProductById(int productId) {
        return this.productRepository.getProductById(productId);
    }

    @Override
    public List<Product> getProducts(String kw, int page) {
        return this.productRepository.getProducts(kw, page);
    }

    @Override
    public boolean updateProduct(Product prdct) {
        return this.productRepository.updateProduct(prdct);
    }

}
