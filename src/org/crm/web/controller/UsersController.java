package org.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/login")
public class UsersController {
	@RequestMapping(method = RequestMethod.POST)
	public String welcome() {
		return "login";
	}
}
