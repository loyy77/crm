package org.crm.dao.impl;

import org.crm.dao.ActivityDao;
import org.crm.entity.Activity;
import org.crm.dao.CustomerDao;
import org.crm.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: loyy
 * Date: 13-7-17
 * Time: ÏÂÎç4:57
 * To change this template use File | Settings | File Templates.
 */
@Component
public class ActivityDaoImpl implements ActivityDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
@Autowired
private CustomerDao customerDao;


    @Override
    public int add(final Activity a) {
    final String sql="insert into activity(id,customerId,atvDate,place,title,description) values(?,?,?,?,?,?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {

            @Override
            public PreparedStatement createPreparedStatement(Connection conn)
                    throws SQLException {
                PreparedStatement ps = conn.prepareStatement(sql,
                        new String[] { "id" });
                ps.setInt(1,a.getId());
                ps.setInt(2,a.getCustomerId().getId());
                ps.setDate(3, a.getAtvDate());
                ps.setString(4, a.getPlace());
                ps.setString(5,a.getTitle());
                ps.setString(6,a.getDescription());

                return ps;
            }
        }, keyHolder);
        return keyHolder.getKey().intValue(); }

    @Override
    public boolean del(final int id) {
        return jdbcTemplate.update("delete from activity where id=?",new Object[]{id})>0?true:false; //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean update(Activity a) {
        return jdbcTemplate.update("update activity set customerId=?,atvDate=?,place=?,title=?,description=? where id=?",new Object[]{a.getCustomerId().getId(),a.getAtvDate(),a.getPlace(),a.getTitle(),a.getDescription(),a.getId()})>0?true:false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Activity get(int id) {
        return jdbcTemplate.queryForObject("select id,customerId,atvDate,place,title,description from activity where id=?",new Object[]{id}, new RowMapper<Activity>() {
            @Override
            public Activity mapRow(ResultSet resultSet, int i) throws SQLException {
                Activity a= new Activity(resultSet.getInt("id"),customerDao.get(resultSet.getInt("customerId")),resultSet.getDate("atvDate"),resultSet.getString("place"), resultSet.getString("description"));

                return a;
            }
        });
    }

    @Override
    public List<Activity> listByCustomerId(int customerId,int page,int pagesize) {
        String sql="select id,customerId,atvDate,place,title,description from activity  where customerId=?";
       final Customer customer= customerDao.get(customerId);

        return jdbcTemplate.query(sql,new Object[]{customerId},new RowMapper<Activity>() {
            @Override
            public Activity mapRow(ResultSet resultSet, int i) throws SQLException {
                Activity a= new Activity(resultSet.getInt("id"),customer,resultSet.getDate("atvDate"),resultSet.getString("place"), resultSet.getString("title"),resultSet.getString("description"));


                a.setCustomerName(customer.getName());

                return a;   //To change body of implemented methods use File | Settings | File Templates.
        }
        });
    }

    @Override
    public List<Activity> list() {
        String sql="select id,customerId,atvDate,place,description from activity ";



        return jdbcTemplate.query(sql,new RowMapper<Activity>() {
            @Override
            public Activity mapRow(ResultSet resultSet, int i) throws SQLException {
                Activity a= new Activity(resultSet.getInt("id"),customerDao.get(resultSet.getInt("customerId")),resultSet.getDate("atvDate"),resultSet.getString("place"), resultSet.getString("description"));
                a.setCustomerName(a.getCustomerId().getName());

                return a;   //To change body of implemented methods use File | Settings | File Templates.
            }
        });
        }
}
