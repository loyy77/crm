package org.crm.web.interceptor;

import java.io.PrintWriter;

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

		log.debug(req.getServletPath());
		//下面这句解决iframe session丢失的问题
	
		
//		忽略对URL “/user”的拦截 
		if (req.getServletPath().startsWith("/user")) {
			return true;

		}
		req.setCharacterEncoding("gbk");
		respon.setHeader("P3P", "CP=CAO PSA OUR");
		
		respon.setContentType("text/html;charset=gbk");
		// ajax的请求编码改为 utf-8
		if (isAjaxRequest(req)) {
			req.setCharacterEncoding("utf-8");
			respon.setContentType("text/html;charset=utf-8");
		}
		HttpSession session = req.getSession();
		Users user = (Users) session.getAttribute(Constant.CURRENT_USER);
		log.debug("进入拦截器1，" + user);
		log.debug("chance:" + user);
		if (null == user || user.getUserId() == 0) {
			log.debug("没检测到用户状态，转向登录界面。。");
			PrintWriter out = respon.getWriter();
			out.write("<script type=\"text/javascript\">");

			out.write("self.parent.location.href='" + req.getContextPath()
					+ "/user/toLogin'");
			// out.write("$.ligerDialog.warn('丢失登录状态，请重新登录。。')");
			out.write("</script>");
			out.flush();
			out.close();
			return false;
		} else {
			log.debug("检测到用户登录，放行。");
			return true;
		}

	}

	// 是否是ajax请求
	public static boolean isAjaxRequest(HttpServletRequest req) {
		String requestedWith = req.getHeader("X-Requested-With");
		return requestedWith != null ? "XMLHttpRequest".equals(requestedWith)
				: false;
	}

}
