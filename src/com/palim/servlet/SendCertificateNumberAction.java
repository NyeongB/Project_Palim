package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.palim.send.SendSMS;

public class SendCertificateNumberAction implements Action{

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {

		String phoneFirst = request.getParameter("phoneFirst");
		String phoneRest = request.getParameter("phoneRest");
		
		SendSMS s = new SendSMS();
		String certificateNumber = s.sendCertificateNumber(phoneFirst+phoneRest);
		
		request.setAttribute("certificateNumber", certificateNumber);
		return "results/sendCertificateNumberResult.jsp";
	}	
}