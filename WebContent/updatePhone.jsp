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
	font-size: 15pt
}
#checkPhone {
	margin-left: 30%
}
.leftDiv {
	margin-left: 15%
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
		font-size: 13pt;
	}
	#checkPhone {
	margin-left: 20%
	}
	.leftDiv {
	margin-left: 0;
	}
}

</style>
<html>
<head>
<title>휴대폰번호수정</title>
</head>

<body>
<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<p id="title" style="margin: 0">회원정보수정</p>
			<p id="subtitle" style="margin: 0">-휴대폰번호수정-</p>
		</header>
	
	<!-- SideBar -->
	<%@include file="main_Sidebar.jsp" %>
	<div class="w3-twothird" style="margin-top:5%">
		<!-- 아이디(이메일) -->
			<div class="w3-row w3-section leftDiv">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div id="id" class="w3-rest" style="width: 85%">
					<%=session.getAttribute("userID")%>
				</div>
			</div>	
		<div class="w3-row w3-section leftDiv">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="fa fa-mobile" style="font-size: 35pt"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<div class="w3-bar">
						<select id="phoneFirst" class="w3-select w3-border w3-bar-item" style="width: 25%; height: 41px; margin-right:1%; padding-left: 3; text-align: center">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						<input type="text" id="phoneRest" class="w3-input w3-border w3-bar-item" style="width: 45%; height: 41px; margin-right:4%" maxlength="8">
						<div id="checkCertificate"><button type="button" id="certificate" class="w3-button w3-light-grey w3-border w3-bar-item w3-center" disabled style="width: 20%; height: 41px; padding-left:5; padding-right: 5">인증</button></div>
					</div>
					<!-- 인증번호 입력창 -->
					<input id="inputCertificate" type="text" class="w3-input w3-border" style="width:71%; margin-top:1" maxlength="6" placeholder="인증번호 6자리 숫자 입력">
					<div id="phoneCheck" style="padding-top:5px; color: red"></div>
					<!-- 인증번호 문구 div -->
					<div id="inform" style="width:95%; margin-top:2; padding-left:3; font-size: 10pt"></div>
				</div>
			</div>
			<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 10%;">
				<div id="result" style="margin-bottom:10"></div>
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
			location.href="controller?cmd=homeUI";
	});
	
	//휴대폰번호 중복 체크
	$( "#phoneRest" ).on("keyup", function() {
		$.ajax({
			url : "controller?cmd=checkPhoneAction",
			data : {
				 phoneFirst : $( "#phoneFirst" ).val(),
				 phoneRest : $( "#phoneRest" ).val(),
				
			},
			success : function(result){
				if(JSON.parse(result)) {
					$( "#phoneCheck" ).html("이미 사용중인 번호입니다.");
					
				} else {
					$( "#phoneCheck" ).html("");
					$("#certificate").attr("disabled", false);
				}
			}		
		})
	});
	
	//인증번호 발송
	$( "#certificate" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=sendCertificateNumberAction",
			data : {
				phoneFirst : $( "#phoneFirst" ).val(),
				phoneRest : $("#phoneRest").val()
			},
			success : function(result){				
					if(result=="") {
						$( "#inform" ).html("<font color=red>인증번호전송에 실패하였습니다.</font>");
					} else {					
						$( "#inform" ).html("<font color=blue>인증번호를 발송했습니다.(유효시간 3분)<br>인증번호가 오지 않으면 <br>입력하신 정보가 정확한지 확인하여 주세요.</font>");
						$("#checkCertificate").html('<button type="button" id="certificate" class="w3-button w3-light-grey w3-border w3-bar-item w3-center" style="width: 20%; height: 41px; padding-left:5; padding-right: 5">확인</button>');
						$("#checkCertificate").on("click", function() {							
							if(JSON.parse(result)==($( "#inputCertificate" ).val())){
								$( "#inform" ).html("<font color=blue>인증되었습니다.</font>")
							} else {
								$( "#inform" ).html("<font color=red>인증번호가 틀렸습니다.</font>")
							}
						})
					}
			}
		})
	});
	
	//완료 클릭 시 번호 업데이트, 홈 이동
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=updatePhoneAction",
			data : {
				 phoneFirst : $( "#phoneFirst" ).val(),
				 phoneRest : $( "#phoneRest" ).val()
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