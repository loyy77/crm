package org.crm.web.controller;

import org.crm.biz.UsersBiz;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class UsersController {
	
	public  static  String CURRENT_USER="user";
	@Autowired
	private UsersBiz usersBiz;

	@ModelAttribute("user")
	public Users createUsers() {

		return new Users();
	}

	@RequestMapping(method = RequestMethod.GET)
	public void doGet() {

	}

	//@RequestMapping("/login")
	@RequestMapping(method=RequestMethod.POST)
	public String proccessSubmit(Users user, BindingResult result, Model model) {

		System.out.println("login..");

		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null!=curruser&&curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute(CURRENT_USER, curruser);
			
			//session.setAttribute("user", curruser);
			return "main";
		}
	
		return "login";

	}
	@RequestMapping("/login1")
	public @ResponseBody String ajaxLogin(Users user,Model model){
		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null!=curruser&&curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute("user", curruser);
			return "true";
		}else {
			return "false";
		}
		//return null;
	}
}
