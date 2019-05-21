<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<ul class="w3-ul" >
			<li class="productImageGrid" >사진</li>
			<li class="productNameGrid">제품명</li>
			<li class="lowHopePriceGrid">최저가</li>
			<li class="hide"></li>
		</ul>
		<%
		String search = (String)request.getAttribute("search");
		Collection<Map<String, String>> products = (Collection)request.getAttribute("result");
      	if(products!=null){
		   	for(Map<String, String> product : products) { 
		   	String title = (String)product.get("title");%>
		 	<ul class="w3-ul list product" id="<%=product.get("productId")%>,<%=title%>,
		 	<%=product.get("lprice")%>,<%=product.get("link")%>,<%=product.get("image")%>">
		 		<li class="productImageGrid"> <img src=<%=product.get("image")%> style="width:40%"></li>
				<li class="productNameGrid"><%=product.get("title")%></li>
				<li class="lowHopePriceGrid">
					<span>최저가: <%=product.get("lprice")%> 원</span><br>
				</li>
				<li class="hide"></li>
			</ul>
		<%}
	}%>
<script type="text/javascript">
	//리스트 높이 일정하게
	$(document).ready(function(){
		$(".list li").each(function(){
			$(this).css({
				height: 160
			});
		});		
	});
	
	//희망가격 입력 화면 이동
    $(".product").on("click", function(){
	   location.href="controller?cmd=insertHpriceUI&data=" + $(this).prop("id")
	   })
</script>