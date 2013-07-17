package org.crm.dao;

import org.crm.entity.Activity;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: loyy
 * Date: 13-7-17
 * Time: обнГ4:54
 * To change this template use File | Settings | File Templates.
 */
public interface ActivityDao {

    int add(Activity a);
    boolean del(int id);
    boolean update(Activity a);
    Activity get(int id);
    List<Activity> listByCustomerId(int customerId);
     List<Activity> list();


}
