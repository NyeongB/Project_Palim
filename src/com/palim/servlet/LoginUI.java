package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class LoginUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
		return "login.jsp";
	}

}
