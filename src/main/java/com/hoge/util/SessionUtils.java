package com.hoge.util;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

// TODO: Session에 관한 공부 더 필요 3월 25일까지 마칠 것
/**
 * HttpSession객체에 속성을 저장, 삭제, 조회하는 기능을 제공하는 유틸클래스다.
 * @author 이승준 
 *
 */
public class SessionUtils {

	/**
	 * 속성명, 속성(객체)를 전달받아서 HttpSession객체에 저장한다.
	 * @param name 속성명
	 * @param value 객체
	 */
	public static void addAttribute(String name, Object value) {
		RequestContextHolder.getRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 속성명을 전달받아서 HttpSession객체에 해당 속성명으로 저장된 속성(객체)을 삭제한다.
	 * @param name 삭제할 속성의 이름
	 */
	public static void removeAttribute(String name) {
		RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 속성명을 전달받아서 HttpSession객체에 해당 속성명으로 저장된 속성(객체)을 반환한다.
	 * @param name 조회할 속성명
	 * @return HttpSession객체에 저장된 속성
	 */
	public static Object getAttribute(String name) {
		return RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	}
	
	public static void sessionInvlidate() {
		((HttpSession)RequestContextHolder.getRequestAttributes().getSessionMutex()).invalidate();
	}
}
