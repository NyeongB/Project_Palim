package com.palim.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.HopeDataDAO;

public class SeizeTodayAppAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> result = new ArrayList();
		result = new HopeDataDAO().getSeizeToday(4);		
		request.setAttribute("result", result);
		return "seizeTodayApp.jsp";
	}
}