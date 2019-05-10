package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class FindPWEmailAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		boolean result = false;
		String userID=request.getParameter("id");
		result=new UserDataDAO().checkValidID(userID);
			
		if(result) {
			session.setAttribute("findUserID", userID);
		}
		
		return "results/findPWEmailResult.jsp";
	}
}
