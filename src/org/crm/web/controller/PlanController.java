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
			log.debug("���ɵ�JSON��" + rst);

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
		log.debug("�ٴ���" + rst);
		return rst;
	}

	@RequestMapping(value = "/plan/doUpdatePlan")
	public @ResponseBody
	String doUpdatePlan(Plan plan, String planId, String planTodo, Model model) {
		log.debug(plan);
		log.debug(planId);
		log.debug("old:" + planTodo);
		try {
			// ���룬ajax�����룬��Ĭ��ʹ��utf8���뷢����Ϣ����ҳ��ʹ��encodeURI("");�����ı��룬��������롣
			if (null != plan.getPlanResult()
					&& !plan.getPlanResult().equals("null")) {
				plan.setPlanResult(URLDecoder.decode(plan.getPlanResult(),
						"utf-8"));
				if (planBiz.update(plan.getPlanResult(), plan.getId())) {
					log.debug("�������");
					return "success";
				}
			}
			if (null != plan.getPlanTodo()
					&& !plan.getPlanTodo().equals("null")) {
				plan.setPlanTodo(URLDecoder.decode(plan.getPlanTodo(), "utf-8"));
				if (planBiz.update(plan)) {
					log.debug("�������");
					return "success";
				}
			}

			log.debug(plan.getPlanTodo());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}

		log.debug("����ʧ�ܣ�");
		return "fail";
	}

	@RequestMapping(value = "/plan/del")
	public @ResponseBody
	String doDeletePlan(String id) {
		if (planBiz.delete(Integer.valueOf(id))) {
			log.debug("ɾ���ɹ�");
		} else {
			log.debug("ɾ��ʧ��");
		}
		return null;
	}

	@RequestMapping(value = "/plan/add")
	public @ResponseBody
	String doAddPlan(Plan plan) {
		String msg = "fail";

		if (planBiz.add(plan)) {
			msg = "success";
			log.debug("��ӳɹ�" + plan);
		} else {
			log.debug("���ʧ��");
		}
		return msg;
	}

	/**
	 * ҳ����ת��devPlan.jsp
	 * 
	 * @param chanceId
	 * @param model
	 * @return
	 */
	@RequestMapping("/plan/toDevPlan")
	public String toDevPlan(String chanceId, Model model) {
		model.addAttribute(chanceBiz.get(Integer.valueOf(chanceId)));
		model.addAttribute("op", "forward");
		return "devPlan";
	}

}
