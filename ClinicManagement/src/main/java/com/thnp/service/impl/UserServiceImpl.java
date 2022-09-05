/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.thnp.pojo.User;
import com.thnp.repository.UserRepository;
import com.thnp.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author nhatp
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEndcoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public boolean addUser(User user) {

        try {
            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String img = (String) r.get("secure_url");
            user.setAvatar(img);
            String pass = user.getPassword();
            user.setPassword(this.passwordEndcoder.encode(pass));
            user.setUserRole(User.USER);
            user.setActive(Boolean.TRUE);
            
            return this.userRepository.addUser(user);
        } catch (IOException ex) {
            System.err.println("== ADD USER ==" + ex.getMessage());
        }
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("User does not exist!!!");
        }

        User u = users.get(0);

        //Chi? du?ng user duo?c quyê`n gi` trong chuong tri`nh
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getUserRole()));

        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public List<User> getUsers(String kw, int i) {
        return this.userRepository.getUsers(kw, i);
    }

    @Override
    public User getUserById(int userId) {
        return this.userRepository.getUserById(userId);
    }

    @Override
    public long coutStaff() {
        return this.userRepository.coutStaff();
    }

    @Override
    public boolean addOrUpdate(User user) {
        return false;
    }

    @Override
    public List<User> getUserByAdmin(String kw, int page) {  
        return this.userRepository.getUserByAdmin(kw, page);
    }

    @Override
    public boolean deleteStaff(int i) {
        return this.userRepository.deleteStaff(i);
    }

    @Override
    public boolean addStaff(User user) {
        
        try {
            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String img = (String) r.get("secure_url");
            user.setAvatar(img);
            String pass = user.getPassword();
            user.setPassword(this.passwordEndcoder.encode(pass));
            user.setActive(Boolean.TRUE);
            
            return this.userRepository.addStaff(user);
        } catch (IOException ex) {
            System.err.println("== ADD USER ==" + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateAdmin(int i) {
        return this.userRepository.updateAdmin(i);
    }

}
