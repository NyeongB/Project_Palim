<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
      <!-- 이미지출력부분 -->
       <div class="page w3-row-padding w3-center" id="<%=(int)request.getAttribute("currentPage")%>">
      <% 
      	String search = (String)request.getAttribute("search");
    	int currentPage = (int)request.getAttribute("currentPage");
      	List<Map<String,String>> result = (List)request.getAttribute("result");
		for(Map<String,String> outMap : result) {
			String productId = outMap.get("productId");
			String title = outMap.get("title");
			String link = outMap.get("link");
			String image = outMap.get("image");
			String lprice = outMap.get("lprice");
			String productType = outMap.get("productType");
		%>
       <div class="product" id="<%=productId%>,<%=title%>,<%=lprice%>,<%=link%>,<%=image%>">
            <img src=<%=image%>>            
            <p><%=title%></p>
            <p ><%=lprice %>원</p>
        </div>
       <%}%> 
       </div>


<script>
$(".product").on("click", function(){
	 location.href="controller?cmd=insertHpriceUI&data=" + $(this).prop("id")	  
  })
  
if(document.body.clientHeight-$(".foot").height()>$("#main").height()){
    $(".foot").css({position: "fixed", bottom:0});
    $(".foot").css("width", "100%");
 } else {
	$(".foot").css({position: "", bottom:""});
 }
</script>     