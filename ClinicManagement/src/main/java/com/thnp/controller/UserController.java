/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.controller;

import com.thnp.pojo.User;
import com.thnp.service.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author nhatp
 */
@Controller
public class UserController {
    
    @Autowired
    private UserService userDetailsService;
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    
    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userDetailsService.addUser(user) == true)
                return "redirect:/login";
            else
                errMsg = "Da co loi xay ra!!!";
        } else {
            errMsg = "Mat khau khong khop!!!";
        }
        model.addAttribute("errMsg", errMsg);
        
        return "register";
    }
    
    @GetMapping("/admin/staff")
    public String Staff(Model model, @RequestParam(required = false) Map<String, String> params) {
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("staff", this.userDetailsService.getUsers(kw, page));
        model.addAttribute("userCounter", this.userDetailsService.coutStaff());
        return "staff";
    }
    
    @GetMapping("/admin/staff/staff-detail/{userId}")
    public String detail(@PathVariable(value = "userId") int userId, Model model) {
        model.addAttribute("staff", this.userDetailsService.getUserById(userId));
        return "staff-detail";
    }
}
