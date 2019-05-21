<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%List<Map<String, String>> result = (List)request.getAttribute("result");
      if(result!=null){
    	  for(int i=(int)request.getAttribute("min"); i<(int)request.getAttribute("max"); i++) { 
	   			Map<String, String> product=result.get(i);%>
	        <div class="product">
	            <a href="<%=product.get("productLink")%>"><img src=<%=product.get("productImg")%>></a>          
	            <p class="title"><%=product.get("productTitle")%></p>
	            <p><%=product.get("lPrice")%>¿ø</p>
	            <p style="color:red"><%= String.format("%.2f",Double.parseDouble(product.get("percentage"))) %>%</p>
	        </div>
	         <%}
	   	}%>