package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.UserDataDAO;

public class UpdateNicknameAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean result = true;
		String nickname = request.getParameter("nickname");
		
		result = new UserDataDAO().updateNickname(nickname, (String)session.getAttribute("userID"));
		request.setAttribute("result", result);
		session.setAttribute("nickname", nickname);
		
		
		return "results/updateNicknameResult.jsp";
	}

}
