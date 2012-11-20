package org.crm.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.crm.biz.CustomerBiz;
import org.crm.biz.DictBiz;
import org.crm.biz.UsersBiz;
import org.crm.entity.Customer;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CustomerController {
	@Autowired
	private CustomerBiz customerBiz;
	@Autowired
	private DictBiz dictBiz;
	@Autowired
	private UsersBiz usersBiz;
	Logger log = Logger.getLogger(getClass());

	/**
	 * 打开客户信息管理的页面
	 * 
	 * @return
	 */
	@RequestMapping("/cust/toList")
	public String toList() {
		return "custList";
	}

	/**
	 * 获取可用的客户信息
	 * 
	 * @return
	 */
	@RequestMapping("/cust/list")
	public @ResponseBody
	String doCustList() {
		List<Customer> list = customerBiz.find();
		ObjectMapper om = new ObjectMapper();
		String rst = "";
		StringBuffer sb = new StringBuffer();

		try {
			rst = om.writeValueAsString(list);
			sb.append("{\"Rows\":");
			sb.append(rst);
			sb.append(",");
			sb.append("\"total\":");
			sb.append(customerBiz.getTotalCount());
			sb.append("}");
			rst = sb.toString();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rst;
	}

	/**
	 * 打开编辑页面
	 * 
	 * @return
	 */
	@RequestMapping("/cust/toCustEdit")
	public String toCustEdit(String custId, Model model) {
		Customer c = customerBiz.get(Integer.valueOf(custId));

		model.addAttribute("customer", c);
		// 地区
		model.addAttribute("regionList", dictBiz.getRegion());
		// 客户等级
		model.addAttribute("custLevel", dictBiz.getCustLevel());
		// 客户经理
		model.addAttribute("custManagerList", usersBiz.findCustomerManager());
		return "custUpdate";
	}

	/**
	 * 执行更新
	 * 
	 * @param customer
	 * @param model
	 * @return
	 */
	@RequestMapping("/cust/update")
	public String doUpdate(Customer customer, Model model) {
		log.debug("执行更新");
		log.debug(customer);
		Users user = usersBiz.getById(customer.getManagerId());
		String managerName = user.getTrueName();
		customer.setManagerName(managerName);
		customer.setLevelLabel(dictBiz.getDictItemValueById(Integer
				.valueOf(customer.getLevelLabel())));
		if (customerBiz.udpate(customer)) {

			model.addAttribute("result", "success");
			log.debug("成功");
			return this.toCustEdit(String.valueOf(customer.getId()), model);
		}
		model.addAttribute("result", "fail");
		return this.toCustEdit(String.valueOf(customer.getId()), model);
	}
}
