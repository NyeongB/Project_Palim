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

#phone{
	font-size: 15pt;
}

#alarm{
	font-size: 15pt;
}

#alarmSub{
	font-size: 11pt;
}
#updateAlarmFail {
	margin-left: 27%
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
	
	#phone{
		font-size: 13pt;
	}
	
	#alarm{
		font-size: 13pt;
	}
	
	#alarmSub{
		font-size: 10pt;
	}
	#updateAlarmFail {
		margin-left: 20%
}
	
}
</style>
<html>

<head>
<title>알람수신방법수정</title>
</head>

<body>
<!-- Content 크기 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>
	<header class="w3-container w3-center" style="padding-top: 80px;"> 
		<p id="title" style="margin: 0">회원정보수정</p>
		<p id="subtitle" style="margin: 0">-알림수신방법수정-</p>
	</header>
	
	<!-- SideBar -->
	<%@include file="main_Sidebar.jsp" %>
	<div class="w3-twothird" style="margin-top:5%" >
		<!-- 아이디(이메일) -->
		<div class="w3-row w3-section" style="margin-left: 15%" >
			<div class="w3-col" style="width: 15%; text-align: center">
				<i class="w3-xlarge fa fa-envelope"></i>
			</div>
			<div id="id" class="w3-rest" style="width: 85%">
				<%=session.getAttribute("userID") %>
			</div>
		</div>
		<!-- 핸드폰번호 -->	
		<div class="w3-row w3-section" style="margin-left: 15%">
			<div id="id" class="w3-col" style="width: 15%; text-align: center">
				<i class="w3-xxlarge fa fa-mobile" ></i>
			</div>
			<div id="phone" class="w3-rest" style="width: 85%" >
				<%=session.getAttribute("phone") %>
			</div>
		</div>
		
		<!-- 알림수신방법 -->
			<div class="w3-row w3-section" style="margin-left: 15%">
				<div  class="w3-col" style="width: 15%; text-align: center">
					<i class="fa fa-bell" style="font-size: 22pt"></i>
				</div>
  				<div  class="w3-rest" style="width: 85%">
	   				<div id="alarm">희망가격 도달 알리미</div>
  					<div id="alarmSub" class="w3-bar w3-mobile" style="margin-top: 5%">
  						<div class="w3-bar-item" style="padding-top:1; padding-left:0"><input type="checkbox" id="mail" name="alarm" class="w3-check" value="M"> 메일로 수신 </div>
  						<div class="w3-bar-item" style="padding-top:1; padding-left:0"><input type="checkbox" id="message" name="alarm" class="w3-check" value="T"> SMS로 수신 </div>
   					</div>
  				</div>	
  			</div>
  			
 			<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 10%">
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
			location.href="controller?cmd=homeUI"
	});

	$( "#submit" ).on("click", function() {
		//1. 알림수신방법 체크된 값을 배열에 담기
		var checkAlarm = [];
		$("input[name='alarm']:checked").each(function() {
			 checkAlarm.push($(this).val());
			 if(checkAlarm.length==2) {
				 getAlarm="B"
			 } else
				 getAlarm=checkAlarm[0];
		})
				
		//2. 회원가입 값들 모두 넘기기	
		$.ajax({
			url : "controller?cmd=updateAlarmAction",
			data : {
				alarm : getAlarm
			},
			success : function(result) {				
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
