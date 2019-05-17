package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class DeleteHpriceAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String productID = request.getParameter("productID");
		String userID = (String)session.getAttribute("userID");
		boolean result = new HopeDataDAO().deleteHopeProduct(productID, userID);
		request.setAttribute("result", result);		
		return "results/deleteHpriceResult.jsp";
	}
}
