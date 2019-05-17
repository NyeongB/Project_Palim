package com.palim.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class HopeListNextPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		//데이터 받아오기
		HttpSession session = request.getSession(true);
		String userID = (String)session.getAttribute("userID");
		String orderName = request.getParameter("orderName");
		
		Collection<Map<String, String>> orderList=null;
		HopeDataDAO h = new HopeDataDAO();
		
		//페이지 선언
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int maxPage = h.countAllPages(userID);
		int page=maxPage;
		if(currentPage<maxPage){
			page=currentPage+1;
		}
		
		//회원이 등록한 상품 개수
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
