<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
.nanumgothic * {
 font-family: 'Nanum Gothic', sans-serif;
}
.footer {
	margin-top : 3;
	margin-bottom : 3;
	font-size : 10pt;
}
.text {
	font-size : 10pt;
}
.app {
	display : none;
}
@media screen and (max-width:400px) {
.app { 
	display: block;
}
.web {
	display: none;
}
.footer {
	margin : 2;
	font-size : 8pt;
}
}
</style>
 <div class="w3-center w3-highway-blue web foot" style="height:15%">
    <div class="w3-third nanumgothic">
    	<div class="text w3-panel" style="text-align: left; margin-left: 40%">
	    	<h5> CUSTOMER CENTER </h5>
			<p class="footer"> 번호 : 1500-8282 </p>
			<p class="footer"> Mon-Fri 09:30~17:00 </p>
			<p class="footer"> Sat.Sun.Holiday OFF </p>
		</div>
    </div>  
    <div class="w3-third">
      	<h5>Follow us</h5>
      	<p style="margin:3">
			<a href="https://www.facebook.com/profile.php?id=100026074050092" target="_blank"><i class="fa fa-facebook-official w3-hover-opacity w3-xlarge"></i ></a>
		    <a href="https://www.instagram.com/palim8282/" target="_blank"><i class="fa fa-instagram w3-hover-opacity w3-xlarge"></i></a>
			<a href="https://twitter.com/Palim8282" target="_blank"><i class="fa fa-twitter w3-hover-opacity w3-xlarge" ></i></a>     
		</p>
		<p class="footer"> CopyRightⓒ Palim Corp.</p>
		<p class="footer"> All Rights Reserved </p>
    </div>
    <div class="w3-third nanumgothic">    		
		<div class="text w3-panel" style="text-align: right; margin-right: 40%">
			<h5>About Palim</h5>
			<p class="footer"> 상호명 : (주) Palim </p>
			<p class="footer"> 이메일 : palim8282@naver.com </p>
			<p class="footer"> 주소 : 서울특별시 송파구 가락본동 중대로 135 </p>
		</div>
    </div>
  </div>
  <!-- facebook...등 주소 수정할 것 (아이디 만들기) -->
<div class="w3-center w3-highway-blue app foot" style="height:15%;">
     	<p class="nanumgothic">Follow us</p>
      	<p class="footer">
			<a href="https://www.facebook.com/profile.php?id=100026074050092" target="_blank"><i class="fa fa-facebook-official w3-hover-opacity w3-large"></i ></a>
		    <a href="https://www.instagram.com/palim8282/" target="_blank"><i class="fa fa-instagram w3-hover-opacity w3-large"></i></a>
			<a href="https://twitter.com/Palim8282" target="_blank"><i class="fa fa-twitter w3-hover-opacity w3-large" ></i></a>     
		</p>
		<p class="footer nanumgothic"> CopyRightⓒ Palim Corp.</p>
		<p class="footer nanumgothic"> All Rights Reserved </p>
</div> 
  
  
  
<script type="text/javascript">
if(document.body.clientHeight-$(".foot").height()>$("#main").height()){
    $(".foot").css({position: "fixed", bottom:0});
    $(".foot").css("width", "100%");
 } else {
	$(".foot").css({position: "", bottom:""});
 }	
</script>