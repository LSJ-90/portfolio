package com.hoge.exception;

public class LoginErrorException extends CustomException {

	private static final long serialVersionUID = 6771482735955299710L;

	public LoginErrorException(String message) {
		super(message);
	}
}
