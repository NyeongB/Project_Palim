package com.palim.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class HopeListUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HopeDataDAO h = new HopeDataDAO();
		HttpSession session = request.getSession(true);
		int cnt=1;
		String userID = (String)session.getAttribute("userID");
		request.setAttribute("order", h.orderByRegistrationDescPage(userID,1));		
		Collection<Map<String, String>> c = h.orderByRegistrationDescPage(userID,1);
		
		for(Map<String, String> m : c){			
			request.setAttribute("graph"+cnt, h.getGraphData(String.valueOf((m.get("PRODUCT_ID"))), userID));			
			cnt++;
		}
		request.setAttribute("orderName","regiDesc");
		request.setAttribute("currentPage", 1);
		request.setAttribute("sort", "registrationDesc");
		request.setAttribute("pageNum", h.countAllPages(userID));
		return "hopeList.jsp";
	}
}
