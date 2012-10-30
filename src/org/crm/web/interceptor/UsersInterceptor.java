package org.crm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.crm.entity.Users;
import org.crm.web.controller.UsersController;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
public class UsersInterceptor implements HandlerInterceptor {
	final String CURRENT_USER="user";
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp,
			Object arg2, ModelAndView modelAndView) throws Exception {
		HttpSession session=req.getSession();
		Users user=(Users)session.getAttribute(UsersController.CURRENT_USER);
		if(null==user){
			modelAndView.setViewName("redirect:/login");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

}
