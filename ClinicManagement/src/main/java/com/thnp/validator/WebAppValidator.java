///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.thnp.validator;
//
//import com.thnp.pojo.Product;
//import java.util.Set;
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.Validator;
//
///**
// *
// * @author nhatp
// */
//@Component
//public class WebAppValidator implements Validator {
//    
//    private Set<Validator> springValidator;
//
//    @Override
//    public boolean supports(Class<?> type) {
//        return Product.class.isAssignableFrom(type);
//    }
//
//    @Override
//    public void validate(Object o, Errors errors) {
//        for (Validator v: this.springValidator)
//            v.validate(o, errors);
//    }
//
//    /**
//     * @param springValidator the springValidator to set
//     */
//    public void setSpringValidator(Set<Validator> springValidator) {
//        this.springValidator = springValidator;
//    }
//    
//}
