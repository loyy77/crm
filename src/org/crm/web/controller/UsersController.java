package org.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.crm.biz.UsersBiz;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class UsersController {
	@Autowired
	private UsersBiz usersBiz;

	@ModelAttribute("user")
	public Users createUsers() {

		return new Users();
	}

	@RequestMapping(method = RequestMethod.GET)
	public void doGet() {

	}

	@RequestMapping(method = RequestMethod.POST)
	public String proccessSubmit(Users user, BindingResult result, Model model,HttpSession session) {

		System.out.println("login..");

		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute("user", curruser);
			session.setAttribute("user", curruser);
			return "main";
		}
		return "redirect:/login";

	}
}
