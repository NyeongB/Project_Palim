package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.UserDataDAO;

public class FindIDAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
		String phoneFirst=request.getParameter("phoneFirst");
		String phoneRest=request.getParameter("phoneRest");
		String phone=phoneFirst+phoneRest;
				
		String userID=new UserDataDAO().informID(phone);
		
		
		String page="results/findIDError.jsp";
		
		if(userID!=null){
			request.setAttribute("userID", userID);
			page="results/findIDOK.jsp";
		}		
		return page;
	}

}
