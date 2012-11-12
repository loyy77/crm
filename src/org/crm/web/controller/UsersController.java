package org.crm.web.controller;

import org.apache.log4j.Logger;
import org.crm.biz.UsersBiz;
import org.crm.common.Constant;
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
	Logger log = Logger.getLogger(UsersController.class);

	@Autowired
	private UsersBiz usersBiz;

	@ModelAttribute("user")
	public Users createUsers() {

		return new Users();
	}

	@RequestMapping(method = RequestMethod.GET)
	public void doGet() {

	}

	/**
	 * 
	 * @param user
	 * @param result
	 * @param model
	 * @return
	 */
	// @RequestMapping("/login")
	@RequestMapping(method = RequestMethod.POST)
	public String proccessSubmit(Users user, BindingResult result, Model model) {
		log.debug("用户登录");

		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null != curruser && curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute(Constant.CURRENT_USER, curruser);
			log.debug("登入成功,");

			return "main";
		}

		return "login";

	}

	/**
	 * 
	 * 
	 */
	@RequestMapping("/login1")
	public @ResponseBody
	String ajaxLogin(Users user, Model model) {
		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null != curruser && curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute("user", curruser);
			return "true";
		} else {
			return "false";
		}
		// return null;
	}
}
