package org.crm.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.crm.biz.CustomerBiz;
import org.crm.biz.LinkmanBiz;
import org.crm.common.Utils;
import org.crm.entity.Customer;
import org.crm.entity.Linkman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class LinkmanController {
	@Autowired
	private LinkmanBiz linkmanBiz;
	@Autowired
	private CustomerBiz customerBiz;
	Logger log = Logger.getLogger(getClass());

	/**
	 * ���ݿͻ�id�ŷ��ض�Ӧ����ϵ���б�
	 * 
	 * @param custId
	 * @param model
	 * @return
	 */
	@RequestMapping("/linkman/list")
	public @ResponseBody
	String doList(String custId, Model model) {
		log.debug(custId);
		model.addAttribute("linkmanList",
				linkmanBiz.findByCustId(Integer.valueOf(custId)));

		List<Linkman> list = linkmanBiz.findByCustId(Integer.valueOf(custId));
		ObjectMapper om = new ObjectMapper();
		String rst = "";

		try {
			rst = om.writeValueAsString(list);
			rst = new Utils().formatLigerGridJSON(rst,
					linkmanBiz.getTotalCount());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		log.debug(rst);
		return rst;
	}

	/**
	 * �����ϵ��
	 * 
	 * @param custId
	 * @param linkman
	 * @param model
	 * @return
	 */
	@RequestMapping("/linkman/add")
	public String doAdd(String customerId, Linkman linkman, Model model) {
		log.debug(customerId);
		log.debug(linkman);
		log.debug("ִ�������ϵ�˲���");
		Customer c = new Customer();
		c.setId(Integer.valueOf(customerId));
		linkman.setCustomerId(c);
		linkmanBiz.add(linkman);
		return this.toList(customerId, model);
	}

	/**
	 * ɾ��һ����ϵ��
	 * 
	 * @param linkmanId
	 * @return
	 */
	@RequestMapping("/linkman/del")
	public @ResponseBody
	String doDel(String linkmanId) {
		log.debug("ɾ��..");
		return linkmanBiz.del(Integer.valueOf(linkmanId)) ? "success" : "fail";
	}

	/**
	 * ����༭
	 * 
	 * @param linkman
	 * @return
	 */
	@RequestMapping("/linkman/update")
	public String doUpdate(String custId, Linkman linkman, Model model) {
		log.debug("����༭");
		if (linkmanBiz.update(linkman)) {
			model.addAttribute("result", "success");
		} else {
			model.addAttribute("result", "fail");
		}
		return this.toList(custId, model);
	}

	// ��תҳ��ķ���***************************************************************************

	/**
	 * ת����ϵ���б�
	 * 
	 * @param custId
	 * @param model
	 * @return
	 */
	@RequestMapping("/linkman/toList")
	public String toList(String custId, Model model) {

		model.addAttribute("custId", custId);

		model.addAttribute("customer", customerBiz.get(Integer.valueOf(custId)));
		return "linkmanList";
	}

	/**
	 * ת�������ҳ�桢�༭ҳ�棩
	 * 
	 * @param custId
	 * @return
	 */
	@RequestMapping("/linkman/toEdit")
	public String toEdit(String custId, String op, Model model) {
		log.debug("��ת���ҳ��");
		if ("update".equals(op)) {
			model.addAttribute("op", "update");
			model.addAttribute("result", "update");
		}
		model.addAttribute("custId", custId);
		return "linkmanUpdate";
	}

	@RequestMapping("/linkman/toUpdate")
	public String toUpdate(String custId, String linkmanId, String op,
			Model model) {
		log.debug("��ת�༭ҳ��");
		model.addAttribute("linkman",
				linkmanBiz.get(Integer.valueOf(linkmanId)));
		model.addAttribute("op", "update");
		model.addAttribute("custId", custId);
		// model.addAttribute("custId", custId);
		return "linkmanUpdate";
	}

}
