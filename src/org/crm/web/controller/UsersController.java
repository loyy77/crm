package org.crm.web.controller;

import org.apache.log4j.Logger;
import org.crm.biz.UsersBiz;
import org.crm.common.Constant;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(Constant.CURRENT_USER)
public class UsersController {
	Logger log = Logger.getLogger(UsersController.class);

	@Autowired
	private UsersBiz usersBiz;

	@RequestMapping(value = "/user/toLogin")
	public String toLogin() {
		return "login";
	}
    @RequestMapping(value = "/user/toMain")
    public String toMain(Users user, Model model){
        return "main";
    }

	/**
	 * 
	 * @param user
	 * @param result
	 * @param model
	 * @return
	 */
	// @RequestMapping("/login")
	@RequestMapping(value = "/user/login")
	public String proccessSubmit(Users user, BindingResult result, Model model) {
		log.debug("�û���¼");

        Users   curruser= usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null != curruser && curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute(Constant.CURRENT_USER, curruser);
			log.debug("����ɹ�,");

			return "main";
		}

        return "login";

	}

    /**
     * �û��˳�
     * @param user
     * @return ת����½ҳ��
     */
    @RequestMapping("/user/exit")
    public String userExit(Users user){
        if(null!=user){
            user=null;
        }

        return "login";
    }

	/**
	 * 
	 * 
	 */
	@RequestMapping("/user/login1")
	public @ResponseBody
	String ajaxLogin(Users user, Model model) {
		Users curruser = usersBiz.login(user.getLoginName(),
				user.getLoginPass());
		if (null != curruser && curruser.getUserId() > 0
				&& curruser.getLoginName().trim().length() > 1) {
			model.addAttribute(Constant.CURRENT_USER, curruser);
            System.out.println("Ajax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            log.debug("ajax����ɹ�,");
           // return this.toMain(user,model);
            return "true";
		} else {
			return "false";
		}
		// return null;
	}
}
