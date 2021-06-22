package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		if( session.getAttribute("uname") == null ) {
			response.sendRedirect(request.getContextPath()+"/home/login.htm");
			return false;
		}
		if( session.getAttribute("uname").equals("admin") == false ) {
			response.sendRedirect(request.getContextPath()+"/home/login.htm");
			return false;
		}
		return true;
	}
}
