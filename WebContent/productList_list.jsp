<%@page import="java.util.Map"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	.hide {
		display: none;
	}	
	li {
		text-align : center; 
		float : left;
	}
	ul { 
		clear : both;
		text-align: center;
	}
	.productImageGrid{ width : 40%; }
	.productNameGrid{ width : 20%; }
	.lowHopePriceGrid{ width : 40%; }
</style>
<html>
<title>검색결과 조회</title>
<body>
	<!--Content size -->
	<div id="main" class="w3-main w3-content" style="max-width: 1000px;">	
	<%@include file="header.jsp"%>
	<%@include file="header_Search.jsp"%>
		<div class="w3-right">
			<button id="moveImg" class="w3-button w3-white w3-hide-small" value=<%=request.getAttribute("searchKeyword")%>>
				<i class="w3-margin-right"><img src="Image/thumbnail.png" style="width:14px; height:14px;"></i>이미지보기
			</button>
			<button id="moveList" class="w3-button w3-white w3-hide-small" value=<%=request.getAttribute("searchKeyword")%>>
				<i class="fa fa-bars w3-margin-right"></i>목록보기
			</button>
		</div>
		<!--상품 리스트 - 목록보기 -->
		 <div id="list" class="w3-content">
			<ul class="w3-ul">
				<li class="productImageGrid" >사진</li>
				<li class="productNameGrid">제품명</li>
				<li class="lowHopePriceGrid">최저가</li>
				<li class="hide"></li>
			</ul>
		<%
		String search = (String)request.getAttribute("search");
		int pageNum = (int)request.getAttribute("pageNum");
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
		</div>

		<!-- 페이지 이동 바-->
		<div class="w3-center w3-margin-top w3-padding-32" id="page" style="margin-top:5%">
			<div class="w3-bar">				
				<%for(int j=1; j<=pageNum; j++) { %> 
				<a  class="w3-bar-item w3-button w3-hover-black" id="<%=j%>"><%=j%></a>
				<%}%>				
			</div>
		</div>
	</div>
</body>
</html>

<%@include file="footer.jsp"%>

<script type="text/javascript">

	//이미지보기 누르면 이동
	 $( "#moveList" ).on("click", function(){	
	   location.href="controller?cmd=searchListAction&inputData=" + encodeURI(encodeURIComponent($( "#moveList" ).val()))
   });
   
   $( "#moveImg" ).on("click", function(){	
	   location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent($( "#moveImg" ).val()))
   }); 
	
	//웹사이즈 조절 시 리스트 구조 바꾸기
	$(window).resize(function(){
		if($(window).width() >= 400) {
			$( ".productImageGrid" ).show();
			$( ".productNameGrid" ).show();
			$( ".lowHopePriceGrid" ).show();
			$( ".updatePriceGrid" ).show();
			$( ".appProductImageName" ).hide();
			$( ".appLowHopePrice" ).hide();			
		} else {
			$( ".appProductImageName" ).show();
			$( ".appLowHopePrice" ).show();
			$( ".productImageGrid" ).hide();
			$( ".productNameGrid" ).hide();
			$( ".lowHopePriceGrid" ).hide();
			$( ".updatePriceGrid" ).hide();
		}
	});

	//리스트 높이 일정하게
		$(document).ready(function(){
			$(".list li").each(function(){
				$(this).css({
					height: 160
				});
			});		
		});
	
<%-- 	//페이지 앞으로 이동
	   $("#movePreviousPage").on("click", function(){
	      $.ajax({
	         url : "controller?cmd=plistPreviousPageAction",
	         data : {
	               inputData : '<%=search%>',	               
	         },
	         success : function(result){
	            $("#page").html(result).trigger("create")
	         }
	      })
	   });
	   
	   //페이지 뒤로 이동
	   $("#moveNextPage").on("click", function(){
	      $.ajax({
	         url : "controller?cmd=plistNextPageAction",
	         data : {
	               inputData : '<%=search%>',
	               page : $(".page").prop("id")
	         },
	         success : function(result){
	            $("#page").html(result)
	         }
	      })
	   });
	   	    --%>
	   //페이지 번호 클릭 시 해당 페이지로 이동
	   <%for(int k=1;k<=pageNum; k++) {%>
	   $("#<%=k%>").on("click", function(){
	      $.ajax({
	         url : "controller?cmd=plistPageAction",
	         data : {            
	               inputData : '<%=search%>',
	               page : $(this).prop("id")
	         },
	         success : function(result){
	        	 $("#list").html(result)
	         }
	      })
	   });
	   <%}%>
	   
	   //희망가격 입력 화면 이동
	    $(".product").on("click", function(){
		   location.href="controller?cmd=insertHpriceUI&data=" + $(this).prop("id")
		   })
</script>