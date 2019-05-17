<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<style>
/** 웹 */
#productTitle{
	font-size: 27pt;
	margin:30;
}
#lprice {
	font-size: 17pt;
}
.rprice {
	font-size: 15pt;
}
#goToBuy{
	font-size: 15pt;
}
.submit {
	margin-left: 10;
}

/**모바일*/
@media screen and (max-width:400px){
#productTitle{
	font-size: 19pt; 
	margin-top: 0;
}
#lprice {
	font-size: 15pt;
}
.rprice {
	font-size: 13pt;
}
#goToBuy{
	margin-top: 0;
	font-size: 13pt;
}
.submit {
	margin-left: 0;
}
}

</style>
<head>
<title>상품상세검색</title>
</head>

<body>
<!--Content size -->
<div id="main" class="w3-content" style="max-width: 1000px; margin: auto">
	<%@include file="header.jsp"%>
	<!-- 내용 -->
	<div class="w3-container">
		<!-- 이미지 및 제품정보 -->
		<div class="w3-half w3-center" style="padding-top:10%">
			<img id="productImg" src="<%=request.getAttribute("productImg")%>" style="width: 70%;">
		</div>
		<div class="w3-half w3-center" style="padding-top:10%">
			<br>
			<p id="productTitle"><%=request.getAttribute("productTitle")%></p>
			<p id="lprice">최저가: <%=request.getAttribute("productLprice")%> 원</p>	
			<a id="goToBuy" href="<%=request.getAttribute("productLink")%>" class="w3-button" style="color: blue">구매하러가기</a> 
		</div>
	</div>		
		<!-- 희망가격입력 -->
		<div class="w3-center" style="margin-top:10%">
			<p class="rprice w3-center">추천희망가 : <span id="rprice" class="rprice"></span>원</p>
			<div id="inform"></div>
			<div class="w3-bar">
				<input type="text" id="hopePrice" name="hopePrice" class="w3-input w3-bar-item w3-border" placeholder="희망가격입력">
				<input type="button" id="submit" class="submit w3-bar-item w3-button w3-border w3-light-grey" style="font-size: 15px;" value="확인"> 
			</div>
		</div>	
</div>

</body>
</html>
<%@include file="footer.jsp"%>

<script>


	//중복 상품 체크
	var checkDuplicate = function() {		
		$.ajax({
			url : "controller?cmd=checkDuplicateHopeProductAction",
			data : {
				productID : '<%=request.getAttribute("productId")%>'
			},
			success : function(result){
				if(JSON.parse(result)){
					$( "#inform" ).html("<font color='red'>희망리스트에 상품이 담겨있습니다.</font>");
					$( "#hopePrice" ).attr("disabled", true);
				}
			}
		})
	}
	
	
	//로그인 안했을 시 hopePrice disabled
	if("${userID}" == "") {
		$( "#hopePrice" ).attr("placeholder", "로그인 후 이용가능");
		$( "#hopePrice" ).attr("disabled", true);
	} else {
		checkDuplicate();
	}
	
	//완료 클릭 시 희망가격 리스트 중복체크 - 없으면 리스트 넣기  ++++++ hopePrice>=lprice 입력 막기!! 
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=insertHpriceAction",
			data : {
				productID : '<%=request.getAttribute("productId")%>',
				productImg : $( "#productImg" ).attr("src"),
				productLink: $( "#goToBuy" ).attr("href"),
				productTitle : $( "#productTitle" ).text(),
				hopePrice : $( "#hopePrice" ).val(),
				lprice : $.trim('<%=request.getAttribute("productLprice")%>')
			},
			success : function(result){
				$( "#inform" ).html($.trim(result));
				setTimeout(function(){         
	            	location.href="";
	            	$("#inform").parentNode.removeChild($("#inform"));
	            },1000);
	            document.body.appendChild($("#inform"));
			}
		})
	});
		
	
	//추천금액 100원단위로 끊음
	var lprice=0;
	   lprice=<%=request.getAttribute("productLprice")%>
	   if(lprice<100000){
	      $("#rprice").html(parseInt(lprice*0.9*0.01)*100)
	   } else if(lprice<500000) {
	      $("#rprice").html(parseInt(lprice*0.92*0.01)*100)
	   } else if(lprice<1000000) {
	      $("#rprice").html(parseInt(lprice*0.94*0.01)*100)
	   } else if(lprice<5000000) {
	      $("#rprice").html(parseInt(lprice*0.96*0.01)*100)
	   } else if(lprice<10000000) {
	      $("#rprice").html(parseInt(lprice*0.98*0.01)*100)
	   } else {
	      $("#rprice").html(parseInt(lprice*0.99*0.01)*100)
	   }

	//희망가격 최저가보다 낮은 금액만 입력가능
	$("#hopePrice").on("keyup", function(){
		if(parseInt($("#hopePrice").val())>=lprice) {
			$( "#inform" ).html("<font color='red'>최저가보다 적은 가격만 입력할 수 있습니다.</font>");
			$( "#submit" ).attr("disabled", true);
		} else {
			$("#inform").html("");
			$( "#submit" ).attr("disabled", false);
		}	
   })     
	   
	   
</script>