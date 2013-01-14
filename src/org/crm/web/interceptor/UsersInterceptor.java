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
		//���������iframe session��ʧ������
	
		
//		���Զ�URL ��/user�������� 
		if (req.getServletPath().startsWith("/user")) {
			return true;

		}
		req.setCharacterEncoding("gbk");
		respon.setHeader("P3P", "CP=CAO PSA OUR");
		
		respon.setContentType("text/html;charset=gbk");
		// ajax����������Ϊ utf-8
		if (isAjaxRequest(req)) {
			req.setCharacterEncoding("utf-8");
			respon.setContentType("text/html;charset=utf-8");
		}
		HttpSession session = req.getSession();
		Users user = (Users) session.getAttribute(Constant.CURRENT_USER);
		log.debug("����������1��" + user);
		log.debug("chance:" + user);
		if (null == user || user.getUserId() == 0) {
			log.debug("û��⵽�û�״̬��ת���¼���档��");
			PrintWriter out = respon.getWriter();
			out.write("<script type=\"text/javascript\">");

			out.write("self.parent.location.href='" + req.getContextPath()
					+ "/user/toLogin'");
			// out.write("$.ligerDialog.warn('��ʧ��¼״̬�������µ�¼����')");
			out.write("</script>");
			out.flush();
			out.close();
			return false;
		} else {
			log.debug("��⵽�û���¼�����С�");
			return true;
		}

	}

	// �Ƿ���ajax����
	public static boolean isAjaxRequest(HttpServletRequest req) {
		String requestedWith = req.getHeader("X-Requested-With");
		return requestedWith != null ? "XMLHttpRequest".equals(requestedWith)
				: false;
	}

}
