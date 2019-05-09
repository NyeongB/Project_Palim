package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class DropUserAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		boolean result = false;
		HttpSession session = request.getSession(true);
		String id = (String)session.getAttribute("userID");
		String password = request.getParameter("password");
        
		result = new UserDataDAO().dropUser(id, password);   
		request.setAttribute("result", result);
		
		return "results/dropUserResult.jsp";
	}

}
