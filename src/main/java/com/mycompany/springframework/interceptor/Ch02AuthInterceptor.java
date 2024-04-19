package com.mycompany.springframework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch02AuthInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//요청 매핑 메소드 참조 객체
		HandlerMethod hm = (HandlerMethod) handler;
		log.info("Auth");
		//요청 매핑 메소드에@Auth가 붙어있지 않다면 null 아니라면 not null
		Auth auth = hm.getMethodAnnotation(Auth.class);
		if(auth == null) {
			return true;
		}else {
			boolean loginStatus = true;
			if(loginStatus) {
				return true;
			}else {
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
	}
}

