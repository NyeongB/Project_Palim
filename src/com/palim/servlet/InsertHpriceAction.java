package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class InsertHpriceAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userID = (String)session.getAttribute("userID");
		String productID = request.getParameter("productID");
		String productImg = request.getParameter("productImg");
		String productLink = request.getParameter("productLink");
		String productTitle = request.getParameter("productTitle");
		String hopePrice = request.getParameter("hopePrice");
		int lprice = Integer.parseInt(request.getParameter("lprice"));

		HopeDataDAO h = new HopeDataDAO();
		
		boolean result = h.addHopeList(productID, productImg, productLink, productTitle, Integer.parseInt(hopePrice), userID);
		int hopeDataSeq = h.getHopeDataSeq(productID, userID);
		h.addLowPricePerDay(lprice, hopeDataSeq, 1);
		
		if(result){
			return "results/insertHpriceActionOK.jsp";
		} else {
			return "results/insertHpriceActionError.jsp";
		}
		
		
	}

}
