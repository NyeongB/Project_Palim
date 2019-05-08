package com.palim.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.UserDataDAO;

public class AddMemberAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String userID = request.getParameter("id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String phoneFirst = request.getParameter("phoneFirst");
		String phoneRest = request.getParameter("phoneRest");
		String phone = phoneFirst + phoneRest;
		String getAlarm = request.getParameter("alarm");
		boolean flag=false;
		String page="results/addMemberError.jsp";		
		request.setAttribute("userID",false);
		request.setAttribute("password",false);
		request.setAttribute("nickname",false);
		request.setAttribute("phoneRest",false);
		request.setAttribute("getAlarm",false);
		
		if(userID.equals("")) {
			request.setAttribute("userID",true);
			flag=true;
		}
		if(password.equals("")){			
			request.setAttribute("password", true);
			flag=true;
		}
		if(nickname.equals("")){			
			request.setAttribute("nickname",true);
			flag=true;
		}
		if(phoneRest==""){
			request.setAttribute("phoneRest", true);
			flag=true;
		}
		if(getAlarm.equals("")){
			request.setAttribute("getAlarm",true);
			flag=true;
		}
		
		if(!flag){	
			boolean result = new UserDataDAO().addMember(userID, password, nickname, phone, getAlarm);
			if(result){
				page = "results/addMemberOK.jsp";
			}
		}	
		return page;
	}
}