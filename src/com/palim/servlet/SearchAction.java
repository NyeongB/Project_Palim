package com.palim.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.ApiDAO;


public class SearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String search = request.getParameter("inputData");
		String searchKeyword = URLDecoder.decode(search,"UTF-8");
		ApiDAO conn = new ApiDAO();
		List searchList = conn.getSearchList(search,8);
		String resultPage;
		if(searchList==null){
			resultPage="productListNosearch.jsp";
		} else {
			int pageNum = searchList.size();
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("search",search);
			request.setAttribute("searchKeyword", searchKeyword);
			request.setAttribute("result", searchList.get(0));
			request.setAttribute("currentPage", 1);
			resultPage= "productList_img.jsp";
		}
		return resultPage;
	}
}
