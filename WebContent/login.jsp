<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<title>로그인</title>
<style>
#loginFail {
margin-left:25%
}
@media screen and (max-width:400px) {
	#loginFail {
	margin-left:8%
	}
</style>
<body>
<!-- 바깥 틀 -->
<div id="main" class="w3-content" style="max-width: 1000px; margin: auto; ">
<%@ include file="header_Logo.jsp" %>
	<header class="w3-container w3-center" style="padding-top: 80px;">
		<h1 class="w3-xxlarge">로그인</h1>
	</header>
<br>
<br>	
<!-- 안쪽 틀 -->
	<div style="max-width: 600px; margin: auto;">
		<!-- 아이디(이메일) -->
			<div class="w3-row w3-section" style="margin-left: 10%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="email" id="id" name="id" class="w3-input w3-border" style="width:77%" placeholder="아이디(이메일)">
				</div>	
			</div>
			<!-- 비밀번호(8~15자리 이내) -->
			<div class="w3-row w3-section" style="margin-left: 10%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password" name="password" class="w3-input w3-border" style="width:77%" maxlength="15" placeholder="비밀번호(8~15자리 이내)">
				</div>	
			</div>
		<!-- 로그인/취소 -->
		<div class="w3-center" style="margin-top: 50px;">
		<div id="logincheck" style="color:red; margin-bottom:10"></div>
	 		<div class="w3-bar">			
				<input type="button" id = "submit" class="w3-input w3-button w3-border w3-light-grey w3-bar-item" value="로그인">
				<input type="button" id = "cancel" class="w3-input w3-button w3-border w3-light-grey w3-bar-item" style="margin-left: 50px" value="취소">
				
			</div>
		</div>
		<!-- 아이디찾기, 비밀번호 찾기, 회원가입 -->
		<div class="w3-center" style="margin-top: 70px;">
			<div class="w3-bar">
				<a href="controller?cmd=findIDUI" >아이디찾기</a> | 
				<a href="controller?cmd=findPWEmailUI" >비밀번호재설정</a> | 
				<a href="controller?cmd=addMemberUI" >회원가입</a>
			</div>
		</div>	
			
	</div><!-- 안쪽 틀 -->
		
</div><!-- 바깥 틀 -->
	<%@include file="footer.jsp"%>
</body>
</html>

<script type="text/javascript">
	
	//취소버튼 클릭 시 홈으로 이동	
	$( "#cancel" ).on("click", function(){
			location.href="controller?cmd=homeUI";
	});
		
	//로그인 버튼 클릭
	   $( "#submit" ).on("click", function() {
	      $.ajax({
	         url : "controller?cmd=loginAction",
	         data : {
	            id : $( "#id" ).val(),
	            password : $( "#password" ).val(),
	         },
	         success : function(result) {
	        	console.log(result);        
	            if($.trim(result)=="") {
	               $("#logincheck").html("아이디 혹은 비밀번호를 확인해주세요");
	            } else{
	               $("#logincheck").html('');      
	               location.href="controller?cmd=homeUI" ;
	            } 
	         }         
	      })
	   
	   })
	
		
</script>

    