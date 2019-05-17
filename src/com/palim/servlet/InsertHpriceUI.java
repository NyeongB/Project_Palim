package com.palim.servlet;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class InsertHpriceUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userID = (String)session.getAttribute("userID");
		String data = request.getParameter("data");
		String [] dataArray = new String[5];
		StringTokenizer st = new StringTokenizer(data, ",");
		for(int i=0; i<5; i++) {
			dataArray[i]=st.nextToken();
		}
		String productId = dataArray[0];
		String productTitle = dataArray[1];
		String productLprice = dataArray[2];
		String productLink = dataArray[3];
		String productImg = dataArray[4];
		
		request.setAttribute("productId", productId);
		request.setAttribute("productTitle", productTitle);
		request.setAttribute("productLprice", productLprice);
		request.setAttribute("productLink", productLink);
		request.setAttribute("productImg", productImg);
		
		return "insertHopePrice.jsp";		
	}

}
