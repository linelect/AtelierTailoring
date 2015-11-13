package com.linelect.usersmanager.dao;

import com.linelect.usersmanager.Model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.criterion.Projections;

import java.util.Date;
import java.util.List;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public List<User> getAll(Integer offset, Integer maxResults) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(User.class)
                .setFirstResult(offset!=null?offset:0)
                .setMaxResults(maxResults!=null?maxResults:10)
                .list();
    }

    @Transactional
    public void add(User user) {
        Session session = sessionFactory.getCurrentSession();
        user.setCreatedDate(new Date());
        session.save(user);
    }

    @Transactional
    public User get(long id) {
        Session session = sessionFactory.getCurrentSession();
        return (User)session.get(User.class, id);
    }

    @Transactional
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.get(User.class, id);
        session.delete(user);
    }

    @Transactional
    public void edit(User user) {
        Session session = sessionFactory.getCurrentSession();
        User existUser = (User)session.get(User.class, user.getId());

        existUser.setName(user.getName());
        existUser.setAge(user.getAge());
        existUser.setAdmin(user.isAdmin());
        session.save(existUser);
    }

    @Transactional
    public Long count(){
        Session session = sessionFactory.getCurrentSession();
        return (Long)session.createCriteria(User.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
    }

    @Transactional
    public long countForSearch(String searchBy, String searchString){
        Session session = sessionFactory.getCurrentSession();
        String query = getQueryForSearch(searchBy, searchString);

        return session.createQuery(query).list().size();
    }

    @Transactional
    public List<User> searchUsers(Integer offset, Integer maxResults, String searchBy, String searchString) {
        Session session = sessionFactory.getCurrentSession();
        String query = getQueryForSearch(searchBy, searchString);

        return session.createQuery(query).setFirstResult(offset!=null?offset:0).setMaxResults(maxResults!=null?maxResults:10).list();

    }

    private String getQueryForSearch(String searchBy, String searchString) {
        String query = "";
        if (searchBy.equals("name")) query = "from User where name like '%"+searchString+"%'";
        else query = "from User where "+searchBy+" = '"+searchString+"'";
        return query;
    }
}
