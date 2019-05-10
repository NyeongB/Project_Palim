<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<head>
<title>비밀번호재설정</title>
<style>
#findPWEmailFail {
margin-left:25%
}
@media screen and (max-width:400px) {
	#findPWEmailFail {
	margin-left:15%
	}
</style>
<body>
	<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto; ">
		<%@include file="header_Logo.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<h1 class="w3-xxlarge">비밀번호재설정</h1>
		</header>
		<div class="w3-center">
			<p>아이디(이메일)를 입력해주세요</p>
			<br>
		</div>
		<!-- 안쪽 틀 -->
		<div class="w3-content" style="max-width: 550px; margin: auto;">
			<!-- 아이디(이메일)확인 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="email" id="id" name="id" class="w3-input w3-border" style="width:78%" placeholder="아이디(이메일)">
				</div>
			</div>
			<div id="findPWEmailFail" style="color:red"></div>
			<!-- 확인취소버튼 -->	
			<div class="w3-center" style="margin-top: 10%">
				<div class="w3-bar">
					<input type="button" id="next" class="w3-btn w3-light-grey w3-border w3-bar-item" value="다음">
					<input type="button" id="cancel" class="w3-btn w3-light-grey w3-border w3-bar-item" style="margin-left: 50px" value="취소">
				</div>
			</div>	
		</div>	
	</div>	
<%@include file="footer.jsp"%>	
</body>
</html>


<script type="text/javascript">
	//취소버튼 클릭 시 홈으로 이동	
	$( "#cancel" ).on("click", function(){
			location.href="controller?cmd=loginUI"
	});
	$( "#next" ).on("click", function() {
		<%session.invalidate();%>
		$.ajax({
			url : "controller?cmd=findPWEmailAction",
			data : {
				id : $( "#id" ).val(),
			},
			success : function(result) {
				if($.trim(result)==""){
					$( "#findPWEmailFail" ).html("아이디(이메일)를 다시 확인해주세요");
				}else{
					$( "#findPWEmailFail" ).html("");						 
					location.href = "controller?cmd=findPWPhoneUI";
				}
			}			
		})
	
	});
	
</script>