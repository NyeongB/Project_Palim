<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
/** 웹 */
#title{
	font-size: 27pt;
}

#subtitle{
	font-size: 13pt;
}

#id{
	font-size: 15pt;
}
#pw1{
	margin-left: 30%
}
#pw2{
	margin-left: 30%
}

/** 모바일 */
@media screen and (max-width: 400px){
	#title{
		font-size: 25pt;
	}
	
	#subtitle{
		font-size: 15pt;
	}
	
	#id{
		font-size: 13pt
	}
	#pw1{
		margin-left: 20%
	}
	#pw2{
		margin-left: 20%
	}
}


</style>
<html>

<head>
<title>비밀번호수정</title>
</head>

<body>
<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>	
	<header class="w3-container w3-center" style="padding-top: 80px;">
		<p id="title" style="margin: 0">회원정보수정</p>
		<p id="subtitle" style="margin: 0">-비밀번호수정-</p>
	</header>
	
	<!-- SideBar -->
	<%@include file="main_Sidebar.jsp" %>
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
		<!-- 비밀번호(8~15자리 이내) -->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password1" name="password" class="w3-input w3-border" style="width:77%" maxlength=15 placeholder="비밀번호(8~15자리 이내)">
					<div id="pwLengthCheck" style="padding-top:5px; color:red"></div>
				</div>
			</div>
			<!-- 비밀번호확인 -->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password2" name="password" class="w3-input w3-border" maxlength="15" style="width:77%" maxlength="15" placeholder="비밀번호 재확인">
					<div id="pwSameCheck" style="padding-top:5px; color:red"></div>
				</div>
			</div>
		<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 10%">
				<div id="result" style="margin-bottom:10; color:red;"></div>
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
			location.href="controller?cmd=homeUI"
	});

	//비밀번호 길이체크(틀리면 password1 입력값 지우기)
	$("#password1").on("change", function(){
		if($("#password1").val().length<8){
			$("#pwLengthCheck").html("8~15자로 입력해주세요");
			$( "#password1" ).val("");
		} else {
			$("#pwLengthCheck").html("");
			if($("#password1").val()!=$("#password2").val()){
				$("#password2").val("");
			}
		}
	
	});
	//일치여부체크(div)
	$( "#password2" ).on("change", function() {
   		if($( "#password1" ).val()==$( "#password2" ).val()) {
   			$( "#pwSameCheck" ).html("");
   		} else {
   			$( "#pwSameCheck" ).html("비밀번호가 일치하지 않습니다");
   			$( "#password2" ).val("");
   		}
  	});
	
	//완료 클릭 시 비밀번호 업데이트, 홈 이동
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=updatePWAction",
			data : {
				 password : $( "#password1" ).val()
			},
			success : function(result){
				if(JSON.parse(result)) {
					$( "#result" ).html('변경되었습니다.');
			    	setTimeout(function(){         
				        location.href="controller?cmd=homeUI";
				        $("#result").parentNode.removeChild($("#result"));
			       	},1000);
			       	document.body.appendChild($("#result"));
			    } else {
			    	$( "#result" ).html('변경되지 않았습니다. 다시 시도해주세요');
			 		location.href="";
				   
			    }			    	
			}
		})
	});
	
</script>