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
	 * 创建销售机会
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
	 * 销售机会的列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/list")
	public @ResponseBody
	String proccessList(Model model, String page, String pagesize) {

		log.info("分页信息:" + page + "," + pagesize);
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
			log.error("List到JSON转换出错");
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
	 * 根据id删除销售机会
	 * 
	 * @return
	 */

	@RequestMapping("/chance/doChanceDel")
	public String doChanceDel(int chanceId, Model model) {

		if (this.chanceBiz.del(chanceId)) {
			log.debug("删除销售机会，ID：" + chanceId);
			model.addAttribute("result", "success");
			return this.toList(model);
		}

		return "redirect:/chance/toList";
	}

	/**
	 * 修改销售机会
	 * 
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/doChanceModify")
	public String doChanceModify(String userId, Users user, Chance chance,
			Model model) {

		log.debug("执行修改销售机会");
		user = usersBiz.getById(Integer.valueOf(userId));
		log.debug("user:" + user);
		log.debug(chance);
		int roleId = user.getRoleId();
		// 管理员和销售主管
		if (roleId == Constant.ROLE_ADMIN
				|| roleId == Constant.ROLE_SALES_SUPERVISOR) {

			if (chanceBiz.udpate(chance)) {
				log.debug("设置result==success");
				model.addAttribute("result", "success");
				return this.toList(model);
			}

		} else {
			log.debug("权限不够");
		}
		log.debug("出错，执行修改销售机会");
		return "error";
	}

	/**
	 * 执行指派操作
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

		log.debug("开始执行指派销售人员操作");
		user = (Users) session.getAttribute(Constant.CURRENT_USER);
		chance.setId(Integer.valueOf(chanceId));
		if (user.getRoleId() == Constant.ROLE_ADMIN
				|| user.getRoleId() == Constant.ROLE_SALES_SUPERVISOR) {
			chance.setAssignDate(new Utils().getNowDate());
			if (chanceBiz.assign(chance)) {

				log.debug("指派成功");
				return this.toList(model);
			} else {
				log.debug("指派失败");
			}
		} else {
			log.debug("用户不是管理员或销售主管，不能进行此项操作." + user.getRoleId());
		}

		return this.toList(model);
	}

	/**
	 * 显示chanceList.jsp
	 * 
	 * @return
	 */
	@RequestMapping("/chance/toList")
	public String toList(Model model) {

		return "chanceList";
	}

	/**
	 * 转到销售机会添加页面
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
		log.debug("转到销售机会添加页面");

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
	 * 转到销售机会修改页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/toChanceModify")
	public String toChanceModify(int chanceId, Model model, Users user) {
		log.debug("转到销售机会修改页面");
		log.debug(user);
		Chance chance = chanceBiz.get(chanceId);
		model.addAttribute("chance", chance);
		model.addAttribute("op", "update");
		model.addAttribute("assignList", usersBiz.list());

		return "chanceAdd";
	}

	/**
	 * 转到指派页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/toChanceAssign")
	public String toChanceAssign(int chanceId, Model model) {
		log.debug("转到给销售机会指派销售人员页面");
		Chance chance = chanceBiz.get(chanceId);
		model.addAttribute("chance", chance);
		model.addAttribute("op", "assign");
		// int id = chance.getAssignId().getUserId();
		model.addAttribute("assignList", usersBiz.list());

		return "chanceAdd";
	}

	// #####客户开发计划
	@RequestMapping("/chance/toDevList")
	public String toDevList() {

		return "devList";
	}

	/**
	 * 开发计划的列表（分页）
	 * 
	 * @param model
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@RequestMapping("/chance/doDevList")
	public @ResponseBody
	String doDevList(Model model, String page, String pagesize) {
		log.debug("开始获取销售机会列表..");
		log.info("分页信息:" + page + "," + pagesize);
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
			log.error("List到JSON转换出错");
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
	 * 开发成功
	 * 
	 * @param chanceId
	 * @return ajax 是否成功了
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
	 * 开发失败
	 */
	@RequestMapping("/plan/doDevFail")
	public @ResponseBody
	String devFail(String chanceId) {
		return chanceBiz.devFailure(Integer.valueOf(chanceId)) ? "success"
				: "fail";
	}
}
