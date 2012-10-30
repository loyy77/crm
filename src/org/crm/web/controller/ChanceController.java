package org.crm.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.crm.biz.ChanceBiz;
import org.crm.common.Utils;
import org.crm.entity.Chance;
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
/**
 * @param user
 * @return
 */
	@ModelAttribute("chance")
	public Chance createChance(@ModelAttribute("user") Users user) {
		Chance chance = new Chance();

		chance.setCreateId(user);
		Users u = new Users();
		u.setUserId(99999);
		chance.setAssignId(u);
		return chance;
	}

	/**
	 * 
	 * @param request
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/doChance")
	public String proccessChanceSubmit(Chance chance,
			@ModelAttribute("user") Users user) {
		Users u = new Users();
		u.setUserId(99999);
		chance.setAssignId(u);
		chance.setCreateId(user);
		chanceBiz.add(chance);
		return "redirect:/chance/toList";
	}

	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/list")
	public @ResponseBody
	String proccessList(Model model) {
		List list = chanceBiz.list();
		ObjectMapper map = new ObjectMapper();
		String rst = "";
		try {
			rst = map.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		log.info(rst);

		StringBuilder sb = new StringBuilder();
		sb.append("{      \"Rows\":");
		sb.append(rst);
		sb.append(",\"Total\":12}");
		rst = sb.toString();
		return rst;
	}

	/**
	 * 
	 * @return
	 */
	
	@RequestMapping("/chance/doChanceDel")
	public String doChanceDel(int chanceId) {
		
		if(this.chanceBiz.del(chanceId)){
			return "redirect:/chance/toList";
		}
		return "redirect:/chance/toList";
	}
	/**
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/doChanceModify")
	public String doChanceModify(Chance chance){
		//log.debug("");
		if(!chanceBiz.udpate(chance)){
			return "error";
		}
		return "redirect:/chance/toList";
	}

	/**
	 * 转到chanceList.jsp
	 * 
	 * @return
	 */
	@RequestMapping("/chance/toList")
	public String toList() {
		return "chanceList";
	}

	/**
	 * @param request
	 * @param user
	 * @param model
	 * @param chance
	 * @return
	 */
	@RequestMapping("/chance/toChanceAdd")
	public String toSalesOpptyManage(WebRequest request,
			@ModelAttribute("user") Users user, Model model, Chance chance) {
		System.out.println("SalesOpptyManage........");

		log.info(user.getLoginName());
		Chance chan = new Chance();
		chan.setCreateDate(new Utils().getNowDate());
		chan.setAssignDate(chan.getCreateDate());
		chan.setCreateId(user);
		Users u = new Users();
		u.setUserId(99999);
		chan.setAssignId(u);
		model.addAttribute("chance", chan);
		return "chanceAdd";
	}
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping("/chance/toChanceModify")
	public String toChanceModify(int chanceId,Model model){
		Chance chance=chanceBiz.get(chanceId);
		model.addAttribute("chance", chance);
		model.addAttribute("op", "update");
		return "chanceAdd";
	}
}
