package com.kh.tripick.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	/*
	 *  Interceptor (정확히는 HandlerInterceptro)
	 *  
	 *  -- Controller가 실행되기 전 실행된 후 낚아채서 실행할 내용을 작성 가능
	 *  - 로그인 유/무 판단, 회원의 권한체크
	 *  
	 *  preHandle(전처리) : DispatcherServlet이 컨트롤러를 호출하기 전에 낚아채는 영역
	 *  postHandle(후처리) : 컨트롤러에서 요청 처리 후 DispatcherServlet으로 view 정보가 리턴되는 순간 낚아채는 영역
	 *  
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		// true 리턴 시 => 기존 요청 흐름대로 해당 Controller 정상 실행
		// false 리턴 시 => Controller 실행 안됨
		
		HttpSession session = request.getSession();
		// 현재 요청을 보낸 사람이 로그인되어있을 경우 => Controller 실행
		// 어떤 요청이 들어왔을때 실행할건지 ->servlet-context.xml파일에 지정
		if(request.getAttribute("loginUser") !=null) {
			return true;
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	
}
