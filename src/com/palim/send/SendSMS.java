package com.palim.send;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class SendSMS {
	
	public String sendCertificateNumber(String to) {
		boolean result=false;
		String certificateNumber=(""+Math.random()).substring(2,8);
		SendInfoVO s = new SendInfoVO();
	    Message coolsms = new Message(s.getApi_key(), s.getApi_secret());
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);
	    params.put("from", "01099031063");
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 ["+certificateNumber+"]입니다");    
	    params.put("app_version", "test app 1.2"); // application name and version    

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      if(obj.get("success_count").toString().equals("1")){
	    	  result=true;
	      }
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    if(result)
	    	return certificateNumber;
	    else
	    	return "";
	}
	
	public boolean sendSMSAlarm(String to, String nickname, String productTitle) {
		boolean result=false;
		SendInfoVO s = new SendInfoVO();
	    Message coolsms = new Message(s.getApi_key(), s.getApi_secret());
	    	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);
	    params.put("from", "01099031063");
	    params.put("type", "SMS");
	    params.put("text", "[Palim]\n"+nickname+"님 희망하신 제품"+productTitle+"이 희망가에 도달 하였습니다.");    
	    params.put("app_version", "test app 1.2"); // application name and version    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      if(obj.get("success_count").toString().equals("1")){
	    	  result=true;
	      }
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    return result;	    
	}
	
	public boolean sendSMSMessage(String to, String productLink) {
		boolean result=false;
		SendInfoVO s = new SendInfoVO();
		Message coolsms = new Message(s.getApi_key(), s.getApi_secret());
	    	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);
	    params.put("from", "01099031063");
	    params.put("type", "SMS");
	    params.put("text", "링크: "+productLink);
	    params.put("app_version", "test app 1.2"); // application name and version
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      if(obj.get("success_count").toString().equals("1")){
	    	  result=true;
	      }
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    return result;
	}
	
}
