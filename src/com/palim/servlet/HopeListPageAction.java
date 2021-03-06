package com.palim.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class HopeListPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		//데이터 받기
		HttpSession session = request.getSession(true);
		String userID = (String)session.getAttribute("userID");
		String orderName = request.getParameter("orderName");
		int page = Integer.parseInt(request.getParameter("page"));		
		
		HopeDataDAO h = new HopeDataDAO();
		Collection<Map<String, String>> orderList=null;
		
		//회원이 등록한 상품개수
		int cnt=0;
		
		//선택한 순서대로 정렬
		switch(orderName) {
			case "regiDesc" :
				orderList=h.orderByRegistrationDescPage(userID,page);								
				for(Map<String, String> m : orderList){		
					cnt++;
					request.setAttribute("graph"+cnt, h.getGraphData(String.valueOf((m.get("PRODUCT_ID"))), userID));					
				}
				request.setAttribute("order",orderList);
				request.setAttribute("currentPage", page);
				break;
			
			case "regi" :
				orderList=h.orderByRegistrationPage(userID,page);								
				for(Map<String, String> m : orderList){			
					cnt++;
					request.setAttribute("graph"+cnt, h.getGraphData(String.valueOf((m.get("PRODUCT_ID"))), userID));					
				}
				request.setAttribute("order",orderList);
				request.setAttribute("currentPage", page);
				break;
			
			case "lprice" :
				orderList=h.orderByLpricePage(userID,page);								
				for(Map<String, String> m : orderList){			
					cnt++;
					request.setAttribute("graph"+cnt, h.getGraphData(String.valueOf((m.get("PRODUCT_ID"))), userID));					
				}
				request.setAttribute("order",orderList);
				request.setAttribute("currentPage", page);
				break;
			
			case "hprice" :
				orderList=h.orderByHpricePage(userID,page);								
				for(Map<String, String> m : orderList){
					cnt++;
					request.setAttribute("graph"+cnt, h.getGraphData(String.valueOf((m.get("PRODUCT_ID"))), userID));					
				}
				request.setAttribute("order",orderList);
				request.setAttribute("currentPage", page);
				break;			
			default :
				return "controller?cmd=hopeListUI";
		}
		
		return "results/orderHopeList.jsp";
	}
}
