<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#title {
		font-size:27pt;
	}
#subtitle {
	font-size: 13pt;
}
#id {
	font-size: 15pt;
}
#updateNicknameFail {
	margin-left:30%;
}

@media screen and (max-width:400px) {
	#title {
		font-size:25pt;
	}
	#subtitle {
		font-size: 15pt;
	}
	#id {
		font-size: 13pt;
	}
	#updateNicknameFail {
		margin-left:25%
	}
}
</style>
<html>
<head>
<title>닉네임수정</title>
</head>

<body>
	<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<p id="title" style="margin: 0">회원정보수정</p>
			<p id="subtitle" style="margin: 0">-닉네임수정-</p>
		</header>
	<!-- SideBar -->
	<%@include file="main_Sidebar.jsp"%>
		<div class="w3-twothird" style="margin-top:5%">
			<!-- 아이디(이메일) -->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div id="id" class="w3-rest" style="width: 85%">
					<%= session.getAttribute("userID") %>
				</div>
			</div>	
			<!-- 닉네임 -->
			<div class="w3-row w3-section" style="margin-left: 15%">
					<div class="w3-col" style="width: 15%; text-align: center">
						<i class="w3-xxlarge fa fa-user"></i>
					</div>
					<div class="w3-rest" style="width: 85%">
						<input type="text" id="nickname" name="nickname" class="w3-input w3-border" style="width:57%" maxlength="5" placeholder="닉네임(1~5자리)">
						<div id="nicknameCheck" style="padding-top:5px; color: red"></div>
					</div>
			</div>
			<div></div>
			<!-- 완료, 취소 --> 
			<div class="w3-center" style="margin-top: 10%">
				<div id="result" style="margin-bottom:10; color:red"></div>
				<div class="w3-bar">
					<input type="button" id="submit" class="w3-button w3-light-grey w3-border w3-bar-item" value="완료">
					<input type="button" id="cancel" class="w3-button w3-light-grey w3-border w3-bar-item" style="margin-left: 50px" value="취소">
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
	
	//완료버튼 클릭 시 닉네임 변경
	$( "#submit" ).on("click", function() {
		$.ajax({
			url : "controller?cmd=updateNicknameAction",
			data : {
				 nickname : $( "#nickname" ).val(),
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
	
	//닉네임 중복체크(ajax)
	$( "#nickname" ).on("keyup", function() {
		$.ajax({
			url : "controller?cmd=checkNicknameAction",
			data : {
				nickname : $( "#nickname" ).val()
			},
			success : function(result){
				if(JSON.parse(result)) {
					$( "#nicknameCheck" ).html("이미 사용중인 닉네임입니다.");
				} else {
					$( "#nicknameCheck" ).html("");
				}
			}		
		})
	});
	
</script>
