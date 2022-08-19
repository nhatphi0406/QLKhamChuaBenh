/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.thnp.service;

import com.thnp.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author nhatp
 */
public interface UserService extends UserDetailsService {
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getUsers(String kw, int page);
    User getUserById(int userId);
    long coutStaff();
    boolean addOrUpdate(User user);
}
