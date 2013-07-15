package org.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.crm.biz.ChanceBiz;
import org.crm.biz.UsersBiz;
import org.crm.common.Constant;
import org.crm.common.Utils;
import org.crm.entity.Chance;
import org.crm.entity.Linkman;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("user")
public class ChanceController {
	Logger log = Logger.getLogger(ChanceController.class);
	@Autowired
	private ChanceBiz chanceBiz;
	@Autowired
	private UsersBiz usersBiz;

	/**
	 * �������ۻ���
	 * 
	 * @param user
	 * @return
	 */
	@ModelAttribute("chance")
	public Chance createChance(@ModelAttribute("user") Users user) {
		Chance chance = new Chance();
		chance.setCreateId(user);
		chance.setAssignId(null);
		return chance;
	}

	/**
	 * 
	 * @param user
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/doChance")
	public String proccessChanceSubmit(Chance chance,
			@ModelAttribute("user") Users user) {
		// Users u = new Users();
		// // u.setUserId(99999);
		chance.setAssignId(null);
		chance.setCreateId(user);
		chanceBiz.add(chance);
		return "redirect:/chance/toList";
	}

	/**
	 * ���ۻ�����б�
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/list")
	public @ResponseBody
	String proccessList(Model model, String page, String pagesize) {

		log.info("��ҳ��Ϣ:" + page + "," + pagesize);
		if (null == page) {
			page = "1";
		}
		if (null == pagesize) {
			pagesize = "5";
		}
		List<Chance> list = chanceBiz.list(Integer.valueOf(page),
				Integer.valueOf(pagesize));
		ObjectMapper map = new ObjectMapper();
		String rst = "";
		try {
			rst = map.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			log.error("List��JSONת������");
			e.printStackTrace();
		}
		log.info(rst);
		int totalCount = chanceBiz.getTotalCount();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"Rows\":");
		sb.append(rst);
		sb.append(",\"Total\":");
		sb.append(totalCount + "}");
		rst = sb.toString();
		return rst;
	}

	/**
	 * ����idɾ�����ۻ���
	 * 
	 * @return
	 */

	@RequestMapping("/chance/doChanceDel")
	public String doChanceDel(int chanceId, Model model) {

		if (this.chanceBiz.del(chanceId)) {
			log.debug("ɾ�����ۻ��ᣬID��" + chanceId);
			model.addAttribute("result", "success");
			return this.toList(model);
		}

		return "redirect:/chance/toList";
	}

	/**
	 * �޸����ۻ���
	 * 
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/doChanceModify")
	public String doChanceModify(String userId, Users user, Chance chance,
			Model model) {

		log.debug("ִ���޸����ۻ���");
		user = usersBiz.getById(Integer.valueOf(userId));
		log.debug("user:" + user);
		log.debug(chance);
		int roleId = user.getRoleId();
		// ����Ա����������
		if (roleId == Constant.ROLE_ADMIN
				|| roleId == Constant.ROLE_SALES_SUPERVISOR) {

			if (chanceBiz.udpate(chance)) {
				log.debug("����result==success");
				model.addAttribute("result", "success");
				return this.toList(model);
			}

		} else {
			log.debug("Ȩ�޲���");
		}
		log.debug("����ִ���޸����ۻ���");
		return "error";
	}

	/**
	 * ִ��ָ�ɲ���
	 * 
	 * @param session
	 * @param user
	 * @param chanceId
	 * @param chance
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/doChanceAssign")
	public String doChanceAssign(HttpSession session, Users user,
			String chanceId, Chance chance, Model model) {

		log.debug("��ʼִ��ָ��������Ա����");
		user = (Users) session.getAttribute(Constant.CURRENT_USER);
		chance.setId(Integer.valueOf(chanceId));
		if (user.getRoleId() == Constant.ROLE_ADMIN
				|| user.getRoleId() == Constant.ROLE_SALES_SUPERVISOR) {
			chance.setAssignDate(new Utils().getNowDate());
			if (chanceBiz.assign(chance)) {

				log.debug("ָ�ɳɹ�");
				return this.toList(model);
			} else {
				log.debug("ָ��ʧ��");
			}
		} else {
			log.debug("�û����ǹ���Ա���������ܣ����ܽ��д������." + user.getRoleId());
		}

		return this.toList(model);
	}

	/**
	 * ��ʾchanceList.jsp
	 * 
	 * @return
	 */
	@RequestMapping("/chance/toList")
	public String toList(Model model) {

		return "chanceList";
	}

	/**
	 * ת�����ۻ������ҳ��
	 * 
	 * @param request
	 * @param user
	 * @param model
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/toChanceAdd")
	public String toSalesOpptyManage(WebRequest request,
			@ModelAttribute("user") Users user, Model model, Chance chance) {
		log.debug("ת�����ۻ������ҳ��");

		log.info(user.getLoginName());
		Chance chan = new Chance();
		chan.setCreateDate(new Utils().getNowDate());
		chan.setAssignDate(chan.getCreateDate());
		chan.setCreateId(user);
		Users u = new Users();
		u.setUserId(99999);
		chan.setAssignId(u);
		model.addAttribute("chance", chan);
		model.addAttribute("assignList", usersBiz.list());
		return "chanceAdd";
	}

	/**
	 * ת�����ۻ����޸�ҳ��
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/toChanceModify")
	public String toChanceModify(int chanceId, Model model, Users user) {
		log.debug("ת�����ۻ����޸�ҳ��");
		log.debug(user);
		Chance chance = chanceBiz.get(chanceId);
		model.addAttribute("chance", chance);
		model.addAttribute("op", "update");
		model.addAttribute("assignList", usersBiz.list());

		return "chanceAdd";
	}

	/**
	 * ת��ָ��ҳ��
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/toChanceAssign")
	public String toChanceAssign(int chanceId, Model model) {
		log.debug("ת�������ۻ���ָ��������Աҳ��");
		Chance chance = chanceBiz.get(chanceId);
		model.addAttribute("chance", chance);
		model.addAttribute("op", "assign");
		// int id = chance.getAssignId().getUserId();
		model.addAttribute("assignList", usersBiz.list());

		return "chanceAdd";
	}

	// #####�ͻ������ƻ�
	@RequestMapping("/chance/toDevList")
	public String toDevList() {

		return "devList";
	}

	/**
	 * �����ƻ����б���ҳ��
	 * 
	 * @param model
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@RequestMapping("/chance/doDevList")
	public @ResponseBody
	String doDevList(Model model, String page, String pagesize) {
		log.debug("��ʼ��ȡ���ۻ����б�..");
		log.info("��ҳ��Ϣ:" + page + "," + pagesize);
		if (null == page) {
			page = "1";
		}
		if (null == pagesize) {
			pagesize = "5";
		}
		List<Chance> list = chanceBiz.list(Integer.valueOf(page),
				Integer.valueOf(pagesize), Constant.CHANCE_UNASSIGN);
		ObjectMapper map = new ObjectMapper();
		String rst = "";
		try {
			rst = map.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			log.error("List��JSONת������");
			e.printStackTrace();
		}
		log.info(rst);
		int totalCount = chanceBiz.getTotalCountWithoutUnassgin();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"Rows\":");
		sb.append(rst);
		sb.append(",\"Total\":");
		sb.append(totalCount + "}");
		rst = sb.toString();
		return rst;
	}

	/**
	 * �����ɹ�
	 * 
	 * @param chanceId
	 * @return ajax �Ƿ�ɹ���
	 */
	@RequestMapping("/chance/doDevSuccess")
	public @ResponseBody
	String devSuccess(String chanceId) {
		// , String linkmanName, String linkmanTel, String customerName
		log.debug(chanceId);

		Chance chance = chanceBiz.get(Integer.valueOf(chanceId));
		if (!chanceBiz.devSuccess(Integer.valueOf(chanceId),
				new Linkman(chance.getLinkMan(), chance.getLinkPhone()),
				chance.getCustomerName())) {
			return "fail";
		}
		return "success";
	}

	/**
	 * ����ʧ��
	 */
	@RequestMapping("/plan/doDevFail")
	public @ResponseBody
	String devFail(String chanceId) {
		return chanceBiz.devFailure(Integer.valueOf(chanceId)) ? "success"
				: "fail";
	}
}
