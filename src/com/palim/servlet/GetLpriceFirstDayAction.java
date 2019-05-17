package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class GetLpriceFirstDayAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HopeDataDAO h = new HopeDataDAO();
		String[] productID = request.getParameterValues("productID");
		String userID =(String)session.getAttribute("userID");
		int result=0;
		for(String temp : productID) {
			result+=h.getLowPriceFirstDay(temp, userID);
		}
		request.setAttribute("firstLpriceSum",result);
		return "results/getLpriceFirstDay.jsp";
	}
}
