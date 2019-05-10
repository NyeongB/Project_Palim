package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class FindPWSetPWAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		boolean result = false;
		HttpSession session = request.getSession(true);
		String userID= (String) session.getAttribute("findUserID");
		String password = request.getParameter("password");
		
        result = new UserDataDAO().updatePW(password, userID);                                                                                                                                                                                                                   
		request.setAttribute("result", result);
		return "results/findPWSetPWResult.jsp";
	}

}
