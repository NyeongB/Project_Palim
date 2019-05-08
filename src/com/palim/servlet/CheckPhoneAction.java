package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.UserDataDAO;

public class CheckPhoneAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		boolean result =  false;
		String phone = request.getParameter("phoneFirst") + request.getParameter("phoneRest");
		
		result = new UserDataDAO().checkPhone(phone);
		request.setAttribute("result", result);
		return "results/checkPhoneResult.jsp";
	}

}
