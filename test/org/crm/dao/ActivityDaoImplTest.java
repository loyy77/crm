package org.crm.dao;

import junit.framework.Assert;
import org.crm.entity.Activity;
import org.crm.entity.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * Created with IntelliJ IDEA.
 * User: loyy
 * Date: 13-7-17
 * Time: ÏÂÎç5:42
 * To change this template use File | Settings | File Templates.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:WebContent/WEB-INF/spring/persistence-context.xml")
public class ActivityDaoImplTest {
    @Autowired
    private ActivityDao activityDao;

    @Test
    public void testAll(){


        activityDao.del(9999);


        //

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-hh hh:mm:ss");
      java.util.  Date now=new java.util.Date();
        java.sql.Timestamp ts=new Timestamp(now.getTime());
        System.out.println(ts);
        Customer customer=new Customer();
        customer.setId(1);
       Activity a=new Activity(9999,customer,new Date(now.getTime()),"asdasd","asd","asd");
       int rst= activityDao.add(a);
        Assert.assertTrue(rst>0);
       a=activityDao.get(9999);
        a.setTitle("newTitle");
        activityDao.update(a);


        Assert.assertEquals("newTitle",a.getTitle());
        Assert.assertTrue(activityDao.del(9999));
    }





}
