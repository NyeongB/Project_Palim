package com.palim.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.HopeDataDAO;

public class SeizeTodayAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> result = new ArrayList();
		result = new HopeDataDAO().getSeizeToday(8);
		request.setAttribute("result", result);
		return "seizeToday.jsp";
	}
}
