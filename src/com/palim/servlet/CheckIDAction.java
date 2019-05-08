package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.UserDataDAO;

public class CheckIDAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		boolean result = false;
		String id = request.getParameter("id");
		result=new UserDataDAO().checkID(id);
		request.setAttribute("result", result);
		return "results/checkIDResult.jsp";

	}

}
