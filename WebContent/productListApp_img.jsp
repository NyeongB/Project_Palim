<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#font {
   font-size:13pt;
}
.product{
	width : 25%;
	height : 30%;
	float: left;
	padding-left : 5;
}
img {
	width : 60%;
	height: 50%;
}
.title {
	height:8%;
	text-overflow:ellipsis;
	white-space:nowrap;
	word-wrap:normal;
	overflow:hidden; 
}
@media screen and (max-width:400px) {
#font {
   font-size:8pt;
}
.product{
   width:50%;
   float: left;
}
.title {
	height : 10%;
	text-overflow:ellipsis;
	white-space:nowrap;
	word-wrap:normal;
	overflow:hidden;
}
}
</style>
<html>
<title>검색결과 조회</title>
<body>
<!--Content size -->
<div id="main" class="w3-container" style="max-width: 1000px; margin: auto">
<%@include file="header.jsp" %>
<%@include file="header_Search.jsp"%>
      <!-- 이미지/목록 조회방법 선택 -->
      <div class="w3-right w3-margin-bottom">
         <button id="moveImg" class="w3-button w3-white w3-hide-small" value=<%=request.getAttribute("searchKeyword")%>>
            <i class="w3-margin-right"><img src="Image/thumbnail.png" style="width:14px; height:14px;"></i>이미지보기
         </button>
         <button id="moveList" class="w3-button w3-white w3-hide-small" value=<%=request.getAttribute("searchKeyword")%>>
            <i class="fa fa-bars w3-margin-right"></i>목록보기
         </button>
      </div>
   <!-- 검색내용 First Grid-->
   <div id="list" class="w3-main w3-content" style="max-width: 1000px;">
      <!-- 이미지출력부분 -->
       <div class="w3-row-padding w3-center">
      <% 
      	String search = (String)request.getAttribute("search");
     	int pageNum = (int)request.getAttribute("pageNum");
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
<%@include file="footer.jsp" %>
<script type="text/javascript">
   
 //페이지 앞으로 이동
   $("#movePreviousPage").on("click", function(){
      $.ajax({
         url : "controller?cmd=pimgPreviousPageAction",
         data : {
               inputData : '<%=search%>',
               page : '<%=currentPage%>'
         },
         success : function(result){
            $("#list").html(result)
         }
      })
   });
   
   //페이지 뒤로 이동
   $("#moveNextPage").on("click", function(){
      $.ajax({
         url : "controller?cmd=pimgNextPageAction",
         data : {
               inputData : '<%=search%>',
               page : '<%=currentPage%>',
               lastPage : '<%=pageNum%>'
         },
         success : function(result){
            $("#list").html(result)
         }
      })
   });
   
   //페이지 번호 클릭 시 해당 페이지로 이동
   <%for(int k=1;k<=pageNum; k++) {%>
   $("#<%=k%>").on("click", function(){
      $.ajax({
         url : "controller?cmd=pimgAppPageAction",
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
   
   $(".product").on("click", function(){
		 location.href="controller?cmd=insertHpriceUI&data=" + $(this).prop("id")	  
	   })
</script>