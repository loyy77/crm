package org.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {
	@RequestMapping("/toSalesOpptyManage")
	public String toSalesOpptyManage(){
		System.out.println("SalesOpptyManage........");
		return "salesOpptyManage";
	}
}
