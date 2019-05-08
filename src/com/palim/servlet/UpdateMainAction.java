package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class UpdateMainAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("userID");
		String password=request.getParameter("password");
				
		boolean result=false;
		result=new UserDataDAO().checkPW(id, password);
		request.setAttribute("result", result);
		
		return "results/updateMainResult.jsp";
	}

}
