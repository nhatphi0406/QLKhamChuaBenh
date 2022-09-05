/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.controller;

import com.thnp.pojo.User;
import com.thnp.service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        if (!result.hasErrors()) {

            if (user.getPassword().isEmpty()
                    || !user.getPassword().equals(user.getConfirmPassword())) {
                model.addAttribute("errMsg", "Mat khau KHONG khop!!!");
            } else {
                
                if (this.userDetailsService.addUser(user) == true) {
                    return "redirect:/login";
                }

                model.addAttribute("errMsg", "Co loi xay ra, vui long quay lai sau!!!");
            }

            return "register";
        }

        return "register";
    }

//    @GetMapping("/admin/staff")
//    public String Staff(Model model, @RequestParam(required = false) Map<String, String> params) {
//        String kw = params.getOrDefault("kw", null);
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
//        model.addAttribute("staff", this.userDetailsService.getUsers(kw, page));
//        model.addAttribute("userCounter", this.userDetailsService.coutStaff());
//        return "staff";
//    }
//
//    @GetMapping("/admin/staff/staff-detail/{userId}")
//    public String detail(@PathVariable(value = "userId") int userId, Model model) {
//        model.addAttribute("staff", this.userDetailsService.getUserById(userId));
//        return "staff-detail";
//    }
}
