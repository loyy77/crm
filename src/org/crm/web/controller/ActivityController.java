package org.crm.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.crm.biz.ActivityBiz;
import org.crm.entity.Activity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: loyy
 * Date: 13-7-17
 * Time: ÏÂÎç6:51
 * To change this template use File | Settings | File Templates.
 */
@Controller

public class ActivityController {

@Autowired
private ActivityBiz activityBiz;

    @RequestMapping(value = "atv/list",params = {"custId"})

    public   @ResponseBody String list( HttpServletRequest req,@RequestParam String custId,Model model){
custId=(String)req.getSession().getAttribute("custId");
        System.out.println("custId = " + custId);
       List<Activity> list=activityBiz.list();
        list=activityBiz.listByCustomerId(Integer.parseInt(custId),0,0);
        ObjectMapper om=new ObjectMapper();
        String rr="";
        try {
            rr=om.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        String rst="{\"Rows\":";
        rst+=rr;
        rst+= ",total:3}";

        return rst;
    }
    @RequestMapping(value = "atv/toList")
    public String toList(HttpServletRequest req, @RequestParam String custId,Model model){
        model.addAttribute("custId",custId);

        req.getSession().setAttribute("custId",custId);
        return "activityList";
    }
}
