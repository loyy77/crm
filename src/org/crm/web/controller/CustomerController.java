package org.crm.web.controller;

import java.util.List;

import org.crm.biz.CustomerBiz;
import org.crm.biz.DictBiz;
import org.crm.entity.Customer;
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

	/**
	 * �򿪿ͻ���Ϣ�����ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/cust/toList")
	public String toList() {
		return "custList";
	}

	/**
	 * ��ȡ���õĿͻ���Ϣ
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
	 * �򿪱༭ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/cust/toCustEdit")
	public String toCustEdit(String custId, Model model) {
		Customer c = customerBiz.get(Integer.valueOf(custId));

		model.addAttribute("customer", c);
		// ����
		model.addAttribute("regionList", dictBiz.getRegion());
		// �ͻ��ȼ�
		model.addAttribute("custLevel", dictBiz.getCustLevel());

		return "custUpdate";
	}
}
