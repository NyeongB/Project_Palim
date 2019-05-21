package com.palim.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.HopeDataDAO;

public class SeizeTodayAppPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> result = new ArrayList();
		int page = Integer.parseInt(request.getParameter("page"));
		result = new HopeDataDAO().getSeizeToday(8);
		int min=0;
		int max=4;
		if(page==2) {
			min=4; max=8;
		}
		request.setAttribute("min", min);
		request.setAttribute("max", max);
		request.setAttribute("result", result);
		return "results/seizeTodayApp.jsp";
	}

}
