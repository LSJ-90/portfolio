package com.hoge.exception;

/**
 * LoginException을 처리하기 위한 클래스
 * @author 이승준
 *
 */
public class LoginException extends CustomException {

	private static final long serialVersionUID = 5417052090947671970L;

	public LoginException(String message) {
		super(message);
	}
}
