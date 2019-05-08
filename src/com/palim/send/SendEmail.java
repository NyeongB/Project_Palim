package com.palim.send;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEmail {
	public boolean sendEmail(String to, String nickname, String productTitle, String hprice, String productLink) {
		  boolean result=false;
		  
		  final SendInfoVO s = new SendInfoVO();
		  
	  // Get the session object
	  Properties props = new Properties();
	  props.put("mail.smtp.host", s.getHost());
	  props.put("mail.smtp.auth", "true");

	  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	   protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication(s.getUser(), s.getPassword());
	   }
	  }); 
	  
	  // Compose the message
	  try {
	   MimeMessage message = new MimeMessage(session);
	   message.setFrom(new InternetAddress(s.getUser()));
	   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	   // Subject
	   message.setSubject("[Palim] Palim에서 알려드립니다.");
	   
	   // Text
	   message.setText(nickname+"님 희망하신 제품 "+productTitle+"이\n 희망가 "+hprice+"원에 도달 하였습니다."
	   		+ "\n 판매사이트로 이동: \n "+productLink);

	   // send the message
	   Transport.send(message);
	   result=true;
	  } catch (MessagingException e) {
	   e.printStackTrace();
	   result=false;
	  }
	  	return result;
	  }
}
