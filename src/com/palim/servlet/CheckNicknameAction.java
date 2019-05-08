package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.UserDataDAO;

public class CheckNicknameAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		boolean result = false;
		String nickname = request.getParameter("nickname");
		result = new UserDataDAO().checkNickname(nickname);
		request.setAttribute("result", result);
		return "results/checkNicknameResult.jsp";
	}

}
