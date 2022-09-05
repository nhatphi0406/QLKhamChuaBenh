/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.validator;

import com.thnp.pojo.Product;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author nhatp
 */
//@Component
//public class ProductValidator implements Validator {
//
//    @Override
//    public boolean supports(Class<?> type) {
//        return Product.class.isAssignableFrom(type);
//    }
//
//    @Override
//    public void validate(Object o, Errors errors) {
//        Product p = (Product) o;
//        if (!p.getName().contains("THNP"))
//            errors.rejectValue("name", "product.name.myErr");
//    }
//    
//}
