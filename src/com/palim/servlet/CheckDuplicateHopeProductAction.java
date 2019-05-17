package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class CheckDuplicateHopeProductAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String productID = request.getParameter("productID");
		boolean result = false;
		result = new HopeDataDAO().checkDuplicateHopeProduct((String)session.getAttribute("userID"), productID);
		request.setAttribute("result", result);
				
		return "results/checkDuplicateHopeProductResult.jsp";
		
	}

}
