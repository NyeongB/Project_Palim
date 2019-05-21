package com.palim.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ApiDAO {
	
	public List getSearchList(String search, int number)throws ServletException, IOException {
	      String address = "http://localhost:8888/Project_Palim/APIJson/"+search+".txt";
	      List resultList = new ArrayList();
	      BufferedReader br;
	      URL url;
	      HttpURLConnection conn;
	      String protocol = "GET";
	      url = new URL(address);
	      conn = (HttpURLConnection)url.openConnection();
	      conn.setRequestMethod(protocol);
	      try {
	         br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         String json = br.readLine();

	         JSONParser parser = new JSONParser();
	         JSONObject obj;
	         try {
	            obj = (JSONObject)parser.parse(json);
	            JSONArray items = (JSONArray)obj.get("items");
	                  
	            Collection<Map<String,String>> list = new ArrayList();   
	            
	            for(int i =0; i<items.size();i++ ){
	               Map<String, String> input = new HashMap();
	               JSONObject tmp = (JSONObject)items.get(i);
	               input.put("productId", (String)tmp.get("productId"));
	               String title2=(String)tmp.get("title");
	               String title=title2.replace("<b>", "");
	               title=title.replace("</b>", "");
	               input.put("title",title);
	               input.put("link", (String)tmp.get("link"));
	               input.put("image", (String)tmp.get("image"));
	               input.put("lprice", (String)tmp.get("lprice"));
	               input.put("productType", (String)tmp.get("productType"));
	               if(Integer.parseInt((String)tmp.get("productType"))!=1){
	                   continue;
	                }
	               list.add(input);
	                  if((i+1)%number==0 || i==items.size()-1) {
	                     List addList = new ArrayList();
	                     addList.addAll(list);
	                     resultList.add(addList);
	                     list.clear();
	                  }               
	               }
	            } catch (ParseException e) {
	            e.printStackTrace();
	         }   
	      } catch (java.io.FileNotFoundException e) {
	         resultList=null;
	      }      
	      return resultList;
	   }	
}
