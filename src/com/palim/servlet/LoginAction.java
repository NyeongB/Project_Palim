package com.palim.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		Map<String, String> userData = new UserDataDAO().login(id, password);
		if(userData!=null){
			session.setAttribute("userID", userData.get("USER_ID"));		
			session.setAttribute("nickname", userData.get("NICKNAME"));
			session.setAttribute("phone", userData.get("PHONE"));
		}
			return "results/loginResult.jsp";
	}

}
