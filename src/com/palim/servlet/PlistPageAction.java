package com.palim.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.dao.ApiDAO;


public class PlistPageAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String search = request.getParameter("inputData");	
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int movePage=currentPage;
		ApiDAO conn = new ApiDAO();
		List searchList = conn.getSearchList(search,5);
		
		request.setAttribute("search",search);
		request.setAttribute("result", searchList.get(movePage-1));
		request.setAttribute("currentPage", movePage);
		return "results/moveProductList_list.jsp";
	}
}