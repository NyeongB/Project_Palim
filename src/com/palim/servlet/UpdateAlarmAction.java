package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class UpdateAlarmAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String userID= (String)session.getAttribute("userID");
		String alarm= request.getParameter("alarm");
		boolean result = new UserDataDAO().updateAlarm(alarm, userID);		
		request.setAttribute("result", result);
		
		return "results/updateAlarmResult.jsp";
	}

}
