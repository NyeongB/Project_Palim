<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
 font-family: 'Nanum Gothic', sans-serif;
} 
a, .w3-button {
	font-size: medium;
}
#seizeImg {
	width : 30%;
}
.searchKeyword {
	display: none;
	font-size: 14pt;
}

@media screen and (max-width:400px) { 
#seizeImg {
	width:40%;
}
#keyword {
margin-top: 4%;
margin-bottom: 5%
}
</style>

<html>
<head>
<title>Palim</title>
</head>
<body>
<!--Content size -->
	<div id="main" class="w3-xlarge x3-content"style="max-width: 1000px; margin: auto;">
	<!-- 웹 로그인 버젼 -->
	<div id="header" class="w3-white w3-xlarge web login" style="max-width:1000px; margin:auto; margin-top:1%;">
	    <div class="w3-right">
	    	<div class="w3-dropdown-hover w3-white">
				<button class="w3-button"><c:out value="${nickname}"></c:out><i class="fa fa-caret-down"></i></button>
				<span class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="controller?cmd=updateMainUI" class="w3-bar-item w3-button">회원정보수정</a>
					<a href="controller?cmd=logoutAction" class="w3-bar-item w3-button">로그아웃</a>
				</span>
				</div>
				<a href="controller?cmd=hopeListUI" class="w3-bar-item w3-button">희망리스트</a>		
		</div>  
	</div> 
	<!-- 웹 로그인 안한 버젼 -->
	<div id="header" class="w3-white w3-xlarge web nologin"	style="max-width: 1000px; margin: auto; margin-top:1%">
		<div class="w3-white w3-right">
			<a href="controller?cmd=loginUI" class="w3-bar-item w3-button" >로그인</a> 
			<a href="controller?cmd=addMemberUI" class="w3-bar-item w3-button" >회원가입</a>
		</div>
	</div>
	<!-- 앱 로그인 버젼 --> 
	<div class="w3-xlarge w3-white app login" style="max-width:900px; margin:auto; margin-top:1%;">
	       <div class="w3-right">
			    <div class="w3-dropdown-hover w3-white">
					<button class="w3-button"><c:out value="${nickname}"></c:out><i class="fa fa-caret-down"></i></button>
					<span class="w3-dropdown-content w3-card-4 w3-bar-block">
						<a href="controller?cmd=updateMainUI" class="w3-bar-item w3-button">회원정보수정</a>
						<a href="controller?cmd=logoutAction" class="w3-bar-item w3-button">로그아웃</a>
					</span>
				</div>
					<a href="controller?cmd=hopeListUI" class="w3-bar-item w3-button">희망리스트</a>				
			</div>  
	</div>
	<!-- 앱 로그인 안한 버젼 -->
	<div class="w3-white w3-xlarge app nologin" style="max-width:1000px; margin:auto; margin-top:1%">
	   	<div class="w3-white w3-right">
			<a href="controller?cmd=loginUI" class="w3-bar-item w3-button" >로그인</a> 
			<a href="controller?cmd=addMemberUI" class="w3-bar-item w3-button" >회원가입</a>
		</div>	 
	</div>
	<br><br>
	<!-- 로고 -->
	<div class="w3-center w3-container" style="margin-top:2%;margin-bottom:7%;">
		<a href="controller?cmd=homeUI"><img src="Image\Palim.jpg" width="50%" height="15%"></a>
	</div>
	<!-- 검색창 -->
			<div class="w3-quarter w3-container"></div>
			<div class="w3-half w3-center">
				<input type="text" id="inputData" style="width: 80%; height: 43px; font-size: 14pt;">
				<a><i id="search" class="fa fa-search " style="margin-left:1%; font-size:19pt;"></i></a>
			</div>
			<div id="keyword" class="w3-quarter w3-center">
				<div class="searchKeyword">1. <span>드론</span></div>
				<div class="searchKeyword">2. <span>3D프린터</span></div>
				<div class="searchKeyword">3. <span>시마드론 x5sc</span></div>
				<div class="searchKeyword">4. <span>스마트밴드</span></div>
				<div class="searchKeyword">5. <span>스마트워치</span></div>
				<div class="searchKeyword">6. <span>핏빗차지2</span></div>
				<div class="searchKeyword">7. <span>AI스피커</span></div>
				<div class="searchKeyword">8. <span>팬텀4프로</span></div>
				<div class="searchKeyword">9. <span>코아 ck hr</span></div>
				<div class="searchKeyword">10. <span>신도리코 dp201</span></div>  				
			</div>
			<br>
			<div class="w3-center" style="margin-top: 10px;">
				<img id="seizeImg" src="Image/seizeTodayImg.png">
			</div>	
	</div>	
</body>
</html>
<%@include file="footer.jsp"%>
<script>
	//헤더 부분
	if($(window).width() >= 400) {
	   $( ".app" ).hide();	
	} else {
	   $( ".web" ).hide();
	}
	
	//seizeToday 이동
	$("#seizeImg").on("click",function(){
		if($(window).width() >= 400) {
			location.href="controller?cmd=seizeTodayAction"
		} else {
			location.href="controller?cmd=seizeTodayAppAction&page=1"
		}
	})
	
	 //검색창 입력후 돋보기 클릭 시  값 넘기기
	$( "#search" ).on( "click", function() {
		if($(window).width() >= 400) {
			location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).val()))
		} else {
			location.href="controller?cmd=searchAppAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).val()))
		}
	});
	//검색창 입력후 엔터치면 값 넘기기
	$( "#inputData" ).on( "keydown", function(event) {
		if(event.which==13) {
			if($(window).width() >= 400) {
				location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).val()))
			} else {
				location.href="controller?cmd=searchAppAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).val()))
			}
		}
	});
	//인기검색어 클릭 시 값 넘기기
	$(".searchKeyword").on("click", function() {
		var key = $(this).children("span").text();
		if($(window).width() >= 400) {
			location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent(key))
		} else {
			location.href="controller?cmd=searchAppAction&inputData=" + encodeURI(encodeURIComponent(key))
		}
	})	
	
	//로그인을 안했으면
	if("${nickname}" == "") { 
		$( ".login" ).hide();
	} else {
		$( ".nologin" ).hide();
	}	
	
	

	//인기검색어 효과
	var slideIndex = 0;
	carousel();
	function carousel() {
	    var i;
	    var x = $(".searchKeyword");
	    for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none"; 
	    }
	    slideIndex++;
	    if (slideIndex > x.length) {slideIndex = 1} 
	    x[slideIndex-1].style.display = "block"; 
	    setTimeout(carousel, 1800);
	   	x.on("mouseover", function() {
	   	    var x = document.getElementById("demoDrop");
	   	    if (x.className.indexOf("w3-show") == -1) {
	   	        x.className += " w3-show";
	   	    } else { 
	   	        x.className = x.className.replace(" w3-show", "");
	   	    }
	   	})
	}
</script>