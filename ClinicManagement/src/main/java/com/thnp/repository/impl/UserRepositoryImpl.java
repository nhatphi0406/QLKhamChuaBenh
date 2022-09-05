/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thnp.repository.impl;

import com.thnp.pojo.Product;
import com.thnp.pojo.User;
import com.thnp.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author nhatp
 */
@Repository
@Transactional
@PropertySource("classpath:databases.properties")
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public boolean addUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }

        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return q.getResultList();

    }

    @Override
    public List<User> getUsers(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (kw != null) {
            Predicate p = builder.like(root.get("lastName").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("id")));

        org.hibernate.query.Query q = session.createQuery(query);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);

        }

        return q.getResultList();
    }

    @Override
    public User getUserById(int userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(User.class, userId);
    }

    @Override
    public long coutStaff() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From User "
                + "Where userRole = 'ROLE_DOCTOR' Or userRole = 'ROLE_NURSE'");
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdate(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);

            return true;
        } catch (Exception ex) {
            System.err.println("== ADD USER ERRPR ==" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<User> getUserByAdmin(String kw, int page) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        
        Predicate pre = builder.equal(root.get("active"), Boolean.TRUE);
        
        Predicate p1 = builder.equal(root.get("userRole").as(String.class),
                "ROLE_DOCTOR");
        Predicate p2 = builder.equal(root.get("userRole").as(String.class),
                "ROLE_NURSE");
        Predicate p3 = builder.or(p1,p2);
        
        Predicate p4 = builder.and(pre, p3);
        
        if (kw != null) {
            Predicate p = builder.like(root.get("lastName").as(String.class),
                    String.format("%%%s%%", kw));
            Predicate p5 = builder.and(p, p4);
            query = query.where(p5);
        } else {
            query.where(p4);
        }
        
        query = query.orderBy(builder.desc(root.get("id")));

        org.hibernate.query.Query q = session.createQuery(query);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            q.setFirstResult(start);
            q.setMaxResults(size);
        }

        return q.getResultList();

    }

    @Override
    public boolean deleteStaff(int id) {
        
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            User u = session.get(User.class, id);
            u.setActive(Boolean.FALSE );
            //session.delete(p);
            session.update(u);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }

    @Override
    public boolean addStaff(User user) {
        
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            session.save(user);
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateAdmin(int id) {
        
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            User u = session.get(User.class, id);
            u.setUserRole(User.ADMIN);
            //session.delete(p);
            session.update(u);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } 
    }

}
