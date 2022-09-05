/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.controller;

import com.thnp.service.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author nhatp
 */
@Controller
@RequestMapping("/sysadmin")
public class SysAdminController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("")
    public String list(Model model, @RequestParam(required = false) Map<String, String> params) {
        
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        model.addAttribute("staff", this.userService.getUserByAdmin(kw, page));
        
        model.addAttribute("staffCounter", this.userService.coutStaff());
        
        return "super-admin";
    }
    
    @GetMapping("/grant-permission/{staffId}")
    public String updateAdmin(Model model, @PathVariable(value = "staffId") int staffId) {
        
        if (this.userService.updateAdmin(staffId) == true)
            return "redirect:/sysadmin";
        else
            model.addAttribute("errMsg", "Cap quyen that bai!!!");
        return "super-admin";
    }
}
