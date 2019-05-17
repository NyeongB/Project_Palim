package com.palim.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;
import com.palim.send.SendEmail;
import com.palim.send.SendSMS;

public class SendAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		HopeDataDAO h  =  new HopeDataDAO();
		String userID = (String)session.getAttribute("userID");
		String productID="", phone, nickname ,productTitle, productLink, alarm, email, hprice;
		boolean result=false;
		Collection<String> productList= h.getLowData();
		SendSMS sendSMS = new SendSMS();
		SendEmail sendEmail = new SendEmail(); 
		Collection<Map<String, String>> sendList;	
		//상품정보 얻기
		for(String tempProductID : productList) {
			sendList=h.sendAlarmList(tempProductID);			
		//알림보내기
			for(Map<String, String> sendMap : sendList){				
				phone=sendMap.get("PHONE"); nickname=sendMap.get("NICKNAME"); productTitle=sendMap.get("PRODUCT_TITLE"); productLink=sendMap.get("PRODUCT_LINK");
				alarm=sendMap.get("ALARM"); email=sendMap.get("USER_ID"); hprice=String.valueOf(sendMap.get("HOPE_PRICE"));
				switch(alarm) {
				case "M" :
		               result=sendEmail.sendEmail(email, nickname, productTitle, hprice, productLink);
		               if(result) {
		                  h.updateAlarmProduct(productID, userID);
		               }
		               break;
		            case "T" :
		               if(sendSMS.sendSMSAlarm(phone, nickname, productTitle)&&sendSMS.sendSMSMessage(phone, productLink)) {
		                  h.updateAlarmProduct(productID, userID);
		                  result=true;
		               }
		               break;
		            case "B" :
		               if(sendSMS.sendSMSAlarm(phone, nickname, productTitle)&&
		               sendSMS.sendSMSMessage(phone, productLink)&&
		               sendEmail.sendEmail(email, nickname, productTitle, hprice, productLink)) {
		                  h.updateAlarmProduct(productID, userID);
		                  result=true;
		               }
					break;
				}
			}
		}
		request.setAttribute("result",result);
		return "results/sendOK.jsp";
	}

}
