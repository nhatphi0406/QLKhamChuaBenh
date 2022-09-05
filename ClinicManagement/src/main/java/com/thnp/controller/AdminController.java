/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.controller;

import com.thnp.pojo.Category;
import com.thnp.pojo.Product;
import com.thnp.pojo.User;
import com.thnp.service.CategoryService;
import com.thnp.service.ProductService;
import com.thnp.service.UserService;
import java.util.Map;
import javax.validation.Valid;
//import com.thnp.validator.WebAppValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author nhatp
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
//    @Autowired
//    private WebAppValidator productValidator;
    
//    @InitBinder
//    public void initBinder(WebDataBinder bider) {
//        bider.setValidator(productValidator);
//    }

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
    }

    @GetMapping("/products")
    public String list(Model model, 
            @RequestParam(required = false) Map<String, String> params) {
        
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        String cateId = params.get("CateId");
        if (cateId == null) {
            model.addAttribute("products", this.productService.getProducts(kw, page));
        } else {
            Category c = this.categoryService.getCategoryById(Integer.parseInt(cateId));
            model.addAttribute("products", c.getProductCollection());
        }
        
        model.addAttribute("productCounter", this.productService.countProduct());

        return "product";
    }
    
    @GetMapping("/products/product-detail/{productId}")
    public String proDetail(Model model, @PathVariable(value = "productId") int productId) {
        model.addAttribute("product", this.productService.getProductById(productId));
        
        return "product-detail";
    }

    @GetMapping("/products/add-product")
    public String addProductView(Model model) {
        model.addAttribute("product", new Product());
        return "add-product";
    }

    @PostMapping("/products/add-product")
    public String addProduct(Model model, @ModelAttribute(value = "product") @Valid Product product,
            BindingResult result) {

        if (!result.hasErrors()) {
            if (this.productService.addProduct(product) == true)          
                return "redirect:/admin/products";
            else 
                model.addAttribute("errMsg", "Da co loi xay ra!");
        }
        
        return "product";
    }
    
    @GetMapping("/products/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable(value = "productId") int productId) {
        
        model.addAttribute("product", this.productService.getProductById(productId));
        
        return "update-product";
    }
    
    @PostMapping("/products/update-product/{productId}")
    public String updateProduct(Model model, @ModelAttribute(value = "product") Product product) {

        
            if (this.productService.updateProduct(product) == true)          
                return "redirect:/admin/products";
        
        return "product";
    }
    
    @GetMapping("/products/delete-product/{productId}")
    public String deleteProduct(Model model, @PathVariable(value = "productId") int productId) {
        
        if (this.productService.deleteProduct(productId) == true)
            return "redirect:/admin/products";
        
        return "product";
    }
    
    @GetMapping("/staff")
    public String staff(Model model, @RequestParam(required = false) Map<String, String> params) {
        
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        model.addAttribute("staff", this.userService.getUserByAdmin(kw, page));
        
        model.addAttribute("staffCounter", this.userService.coutStaff());
        
        return "staff";
    }
    
    @GetMapping("/staff/staff-detail/{staffId}")
    public String staffDetail(Model model, @PathVariable(value = "staffId") int staffId) {
        
        model.addAttribute("staff", this.userService.getUserById(staffId));
        
        return "staff-detail";
    }
      
    @GetMapping("/staff/add-staff")
    public String addStaff(Model model) {
        
        model.addAttribute("user", new User());
        
        return "add-staff";
    }
    
    @PostMapping("/staff/add-staff")
    public String addStaff(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        
        if (!result.hasErrors()) {
            if (this.userService.addStaff(user) == true)          
                return "redirect:/admin/staff";
            else 
                model.addAttribute("errMsg", "Da co loi xay ra!");
        }
        
        return "add-staff";
    }
    
    @GetMapping("staff/delete-staff/{staffId}")
    public String deleteStaff(Model model, @PathVariable(value = "staffId") int staffId) {
        
        if (this.userService.deleteStaff(staffId) == true)
            return "redirect:/admin/staff";
            
        return "staff";
    }
}
