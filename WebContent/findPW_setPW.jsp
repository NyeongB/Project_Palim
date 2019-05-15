<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<head>
<title>비밀번호재설정</title>
<body>
		<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header_Logo.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<h1 class="w3-xxlarge">비밀번호재설정</h1>
				<p>새로운 비밀번호를 입력해주세요</p>
		</header>
		<!-- 안쪽 틀 -->
		<div class="w3-content" style="max-width: 550px; margin: auto;">
			<!-- 아이디(이메일) -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<font size="5"><%=session.getAttribute("findUserID") %></font>
				</div>
			</div>
			<!-- 비밀번호(8~15자리 이내) -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password1" class="w3-input w3-border" style="width:78%" maxlength="15" placeholder="비밀번호(8~15자리 이내)">
					<div id="pwLengthCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 비밀번호확인 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password2" class="w3-input w3-border" maxlength="15" style="width:78%" placeholder="비밀번호 재확인">
					<div id="pwSameCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 10%">
			<div id="checkPasswordFail" style="margin:3%; color:red"></div>
				<div class="w3-bar">
					<input type="button" id="submit" class="w3-btn w3-light-grey w3-border w3-bar-item" value="완료">
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
	//비밀번호1에서 onchange시 길이 8자미만이면 1번value 비우기, 1과 2 값 일치 안하면 2번 value 비우기 (미완성)
	$( "#password1" ).on("change", function() {
		if($( "#password1" ).val().length >= 8 ) {
			$( "#pwLengthCheck" ).html("");
		} else {
			$( "#pwLengthCheck" ).html("8~15자로 입력해주세요");
			$( "#password1" ).val("");
		}
		if($( "#password1" ).val()!=$( "#password2" ).val()) {
			$( "#password2" ).val("");
		} 		
	});
	
	//비밀번호2 입력시 비밀번호1과 동일하지않으면 x띄우기 (미완성)
   	$( "#password2" ).on("change", function() {
   		if($( "#password1" ).val()==$( "#password2" ).val()) {
   			$( "#pwSameCheck" ).html("");
   		} else {
   			$( "#pwSameCheck" ).html("비밀번호가 일치하지 않습니다");
   			$( "#password2" ).val("");
   		}
  	});
	
	//완료 버튼 클릭 시 
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=findPWSetPWAction",
			data : {
				password : $( "#password1" ).val(),
			},
			success : function(result) {
				if(JSON.parse(result)){
					$( "#checkPasswordFail" ).html("비밀번호가 변경되었습니다.");
					setTimeout(function(){         
				        location.href="controller?cmd=loginUI";
				        $("#checkPasswordFail").parentNode.removeChild($("#checkPasswordFail"));
			       	},1000);
			       	document.body.appendChild($("#checkPasswordFail"));					
				}else{
					$( "#checkPasswordFail" ).html("다시 시도해주세요");
					location.href = "controller?cmd=findPWSetPWUI";
				}
			}			
		})
	
	})
	
	
</script>