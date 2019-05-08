<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
/** 웹 */
#title {
		font-size:27pt;
	}
#subtitle {
	font-size: 13pt;
}
#id {
	font-size: 15pt;
}
#content {
	margin-top: 10%;
}

#updateMainFail{
		margin-left: 30%;
	}

/** 모바일 */
@media screen and (max-width:400px) {
	#title {
		font-size:25pt;
	}
	#subtitle {
		font-size: 10pt;
	}
	#id {
		font-size: 13pt;
	}
	#content {
		margin-top: 17%;
	}
	
	#updateMainFail{
		margin-left: 25%;
	}
}
</style>
<head>
<title>회원정보수정</title>
</head>

<body>
<!-- Content 크기 -->
<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
<%@include file="header.jsp"%>
	<header class="w3-container w3-center" style="padding-top: 80px;">
		<p id="title" style="margin: 0;">회원정보수정</p>
		<p id="subtitle" style="margin: 0;">-본인 확인을 위해 비밀번호를 다시 입력해주세요-</p>
	</header>	
			
	<!-- 본문시작 -->
	<div id="content" class="w3-content" style="max-width: 550px">		
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
					<input type="password" id="password" name="password" class="w3-input w3-border" style="width:70%" maxlength=15 placeholder="비밀번호 입력">
				</div>
			</div>
			<div id="updateMainFail" style="color: red"></div>	
		<div class="w3-center w3-margin-top">
			<div class="w3-bar">
				<input type="button" id="submit" class="w3-button w3-light-grey w3-border w3-margin-top w3-bar-item" value="확인">
				<input type="button" id="cancel" class="w3-button w3-light-grey w3-border w3-margin-top w3-bar-item" style="margin-left: 50px"  value="취소">
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
			location.href="controller?cmd=homeUI";
	});
	
	
	//확인 버튼 클릭
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=updateMainAction",
			data : {
				password : $( "#password" ).val(),
			},
			success : function(result) {
				if(JSON.parse(result)) {
					location.href="controller?cmd=updatePWUI" ;	
				} else{
					$("#updateMainFail").html('비밀번호를 다시 입력해주세요');		
					
				} 
			}			
		})
	
	})
</script>



