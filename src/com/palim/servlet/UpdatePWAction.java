package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class UpdatePWAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean result = false;
		String password = request.getParameter("password");
		
		result = new UserDataDAO().updatePW(password, (String)session.getAttribute("userID"));
		request.setAttribute("result", result);
		
		return "results/updatePWResult.jsp";
	}

}
