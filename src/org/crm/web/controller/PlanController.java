/**
 * 
 */
package org.crm.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.log4j.Logger;
import org.crm.biz.ChanceBiz;
import org.crm.biz.PlanBiz;
import org.crm.entity.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author lishixi
 * 
 */
@Controller
@SessionAttributes("plan")
public class PlanController {
	Logger log = Logger.getLogger(getClass());
	@Autowired
	private PlanBiz planBiz;
	@Autowired
	private ChanceBiz chanceBiz;

	@RequestMapping(value = "/plan/toDevAdd")
	public String toDevList(Model model, String chanceId) {

		List<Plan> planList = planBiz.list(Integer.valueOf(chanceId));
		model.addAttribute(planList);
		model.addAttribute("chance", chanceBiz.get(Integer.valueOf(chanceId)));
		return "devPlan";
	}

	@RequestMapping(value = "/plan/planList")
	public @ResponseBody
	String getPlanListByChanceId(String chanceId) {
		List<Plan> list = planBiz.list(Integer.valueOf(chanceId));
		ObjectMapper om = new ObjectMapper();
		String rst = "";
		try {

			rst = om.writeValueAsString(list);
			log.debug("生成的JSON：" + rst);

		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		StringBuilder sb = new StringBuilder();
		sb.append("{\"Rows\":");
		sb.append(rst);
		// sb.append(",\"Total\":");
		// sb.append(totalCount);
		sb.append("}");
		rst = sb.toString();
		log.debug("再处理：" + rst);
		return rst;
	}

	@RequestMapping(value = "/plan/doUpdatePlan")
	public @ResponseBody
	String doUpdatePlan(Plan plan, String planId, String planTodo, Model model) {
		log.debug(plan);
		log.debug(planId);
		log.debug("old:" + planTodo);
		try {
			// 解码，ajax会乱码，它默认使用utf8编码发送信息，在页面使用encodeURI("");给中文编码，在这里解码。
			plan.setPlanTodo(URLDecoder.decode(plan.getPlanTodo(), "utf-8"));
			log.debug(plan.getPlanTodo());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// plan.setId(Integer.valueOf(planId));
		// plan.setPlanTodo(planTodo);
		if (planBiz.update(plan)) {
			log.debug("更新完成");
		} else {
			log.debug("更新失败！");
		}
		return null;
	}

	@RequestMapping(value = "/plan/del")
	public @ResponseBody
	String doDeletePlan(String id) {
		if (planBiz.delete(Integer.valueOf(id))) {
			log.debug("删除成功");
		} else {
			log.debug("删除失败");
		}
		return null;
	}

	@RequestMapping(value = "/plan/add")
	public @ResponseBody
	String doAddPlan(Plan plan) {
		log.debug(plan);
		String msg = "fail";

		if (planBiz.add(plan)) {
			msg = "success";
			log.debug("添加成功");
		} else {
			log.debug("添加失败");
		}
		return msg;
	}
}
