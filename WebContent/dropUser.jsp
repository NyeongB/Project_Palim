<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
#title {
		font-size:27pt;
	}
#id {
	font-size: 15pt;
}
#dropUserFail {
	margin-left: 30%
}

@media screen and (max-width:400px) {
	#title {
		font-size:25pt;
	}
	#id {
		font-size: 13pt;
	}
	#dropUserFail {
		margin-left: 20%
	}
}
</style>
<html>
<head>
<title>회원탈퇴</title>
</head>

<body>
	<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<p id="title" style="margin: 0">회원탈퇴</p>
		</header>
	<!-- sideMenu -->
	<%@include file="main_Sidebar.jsp" %>
	<!-- 메일,회원탈퇴 -->
	<div class="w3-twothird" style="margin-top:5%">
		<!-- 아이디(이메일) -->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div id="id" class="w3-rest" style="width: 85%">
					<%=session.getAttribute("userID") %>
				</div>
			</div>	
   		<!-- 비밀번호-->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password" name="password" class="w3-input w3-border" style="width:77%" maxlength=15 placeholder="비밀번호(8~15자리 이내)" required="required">
				</div>				
			</div>
			<div id="dropUserFail"></div>
		<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 10%">
				<div class="w3-bar">
					<input type="button" id="submit" class="w3-btn w3-light-grey w3-border w3-bar-item" value="완료">
					<input type="button" id="cancel" class="w3-btn w3-light-grey w3-border w3-bar-item" style="margin-left: 50px" value="취소">
				</div>
			</div>
	</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>


<script type="text/javascript">
	//취소버튼 클릭 시 홈으로 이동	
	$( "#cancel" ).on("click", function(){
			location.href="controller?cmd=homeUI";
	});
	// 완료 버튼 누를시 확인 과정
	$( "#submit" ).on("click", function() {
		$.ajax({
		url : "controller?cmd=dropUserAction",
		data : {
			password : $( "#password" ).val()
		},
		success : function(result) {
			if(JSON.parse(result)) {
				if(confirm("정말 탈퇴하시겠습니까?")==true) { 		//confirm은 alert와 비슷한데 확인/취소 두개 버튼이 뜨는 창. 각각 true/false값 가짐
					alert("탈퇴 완료되었습니다.");
					location.href="controller?cmd=logoutAction";
				} else {
					return false;
				}
			} else{
				$( "#dropUserFail" ).html("<font color=red>올바른 비밀번호를 입력해주세요</font>");
				$( "#password" ).val("");
			}
		}
		})
	});


</script>