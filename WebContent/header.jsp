<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a, .w3-button {
	font-size: medium;
}
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
 font-family: 'Nanum Gothic', sans-serif;
} 
</style>

<body>
<!-- 웹 로그인 버젼 -->
<div id="header" class="w3-white w3-xlarge web login" style="max-width:1000px; margin:auto; margin-top:1%;">
    <div class="w3-left" style="margin-top: 1%; margin-left:20px; width:25%;">
	    <a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:58%; height:5%;"></a>	
	</div>    
    <div class="w3-right">
    	<div class="w3-dropdown-hover w3-white">
			<button class="w3-button"><%=session.getAttribute("nickname")%><i class="fa fa-caret-down"></i></button>
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
	<div class="w3-left" style="margin-top: 1%; margin-left:20px; width:25%;">
	    <a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:58%; height:5%;"></a>	
	</div>
	<div class="w3-white w3-right">
		<a href="controller?cmd=loginUI" class="w3-bar-item w3-button" >로그인</a> 
		<a href="controller?cmd=addMemberUI" class="w3-bar-item w3-button" >회원가입</a>
	</div>
</div>
<!-- 앱 로그인 버젼 --> 
<div class="w3-xlarge w3-white app login" style="max-width:900px; margin:auto; margin-top:1%;">
    <div class="w3-left" style="margin-left:20px; width:25%; margin-top:2%;">
	    <a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:100%; height:5%;"></a>	
	</div>    
	    <div class="w3-right">
		    <div class="w3-dropdown-hover w3-white">
				<button class="w3-button"><%=session.getAttribute("nickname")%><i class="fa fa-caret-down"></i></button>
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
    <div class="w3-left" style="margin-top: 2%; margin-left:20px; width:25%;">
	   	<a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:100%; height:5%;"></a>	
	</div>
	<div class="w3-white w3-right">
		<a href="controller?cmd=loginUI" class="w3-bar-item w3-button" >로그인</a> 
		<a href="controller?cmd=addMemberUI" class="w3-bar-item w3-button" >회원가입</a>
	</div>	 
</div>
	
  
</body>
<script type="text/javascript">
if($(window).width() >= 400) {
   $( ".app" ).hide();
} else {
   $( ".web" ).hide();
}
if("${nickname}" == "") { //로그인을 안했으면
	$( ".login" ).hide();
} else {
	$( ".nologin" ).hide();
}
</script>