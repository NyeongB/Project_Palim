package com.palim.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;


public class UpdatePhoneAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean result = true;
		String phoneFirst = request.getParameter("phoneFirst");
		String phoneRest = request.getParameter("phoneRest");
		String phone = phoneFirst + phoneRest;

		result=new UserDataDAO().updatePhone(phone, (String)session.getAttribute("userID"));

		request.setAttribute("result", result);
		session.setAttribute("phone", phone);
		return "results/updatePhoneResult.jsp";
	}

}
