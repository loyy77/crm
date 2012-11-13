package org.crm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.crm.common.Constant;
import org.crm.entity.Users;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UsersInterceptor implements HandlerInterceptor {

	Logger log = Logger.getLogger(getClass());

	@Override
	public void afterCompletion(HttpServletRequest req,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

		log.debug("after3");

	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp,
			Object arg2, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse respon, Object arg2) throws Exception {
		req.setCharacterEncoding("utf-8");
		respon.setContentType("text/plain;charset=utf-8");
		HttpSession session = req.getSession();

		Users user = (Users) session.getAttribute(Constant.CURRENT_USER);
		log.debug("进入拦截器1，" + user);
		log.debug("chance:" + session.getAttribute("chance"));
		log.debug(arg2);
		if (null == user || user.getUserId() == 0) {
			log.debug("没检测到用户状态，转向登录界面。。");

			// req.getRequestDispatcher("/user/toLogin").forward(req, respon);
			respon.sendRedirect("/crm/user/toLogin");
			return false;

		} else {
			return true;
		}

	}

}
