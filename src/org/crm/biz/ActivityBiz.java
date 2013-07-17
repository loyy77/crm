package org.crm.biz;

import org.crm.dao.ActivityDao;
import org.crm.entity.Activity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: loyy
 * Date: 13-7-17
 * Time: ÏÂÎç6:52
 * To change this template use File | Settings | File Templates.
 */
@Component
public class ActivityBiz {
    @Autowired
    private ActivityDao activityDao;

    public List<Activity> listByCustomerId(int custId,int page,int pagesize){
        return activityDao.listByCustomerId(custId,page,pagesize);
    }

    public List<Activity> list(){
        return activityDao.list();
    }
}
