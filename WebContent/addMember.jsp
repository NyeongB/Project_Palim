<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<!-- 바깥 틀 -->
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header_Logo.jsp"%>
		<header class="w3-container w3-center" style="padding-top: 80px;">
			<h1 class="w3-xxlarge">회원가입</h1>
		</header>
		<!-- 안쪽 틀 -->
		<div id="content" class="w3-content" style="max-width: 550px; margin: auto;">
			<!-- 아이디(이메일) -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="email" id="id" name="id" class="w3-input w3-border" style="width:95%" placeholder="아이디(이메일)">
					<div id="idCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 비밀번호(8~15자리 이내) -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password1" name="password" class="w3-input w3-border" style="width:95%" maxlength=15 placeholder="비밀번호(8~15자리 이내)">
					<div id="pwLengthCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 비밀번호확인 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-lock"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="password" id="password2" name="password" class="w3-input w3-border" maxlength="15" style="width:95%" placeholder="비밀번호 재확인">
					<div id="pwSameCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 닉네임 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="w3-xxlarge fa fa-user"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<input type="text" id="nickname" name="nickname" class="w3-input w3-border" style="width:95%" maxlength="5" placeholder="닉네임(1~5자리)">
					<div id="nicknameCheck" style="padding-top:5px; color: red"></div>
				</div>
			</div>
			<!-- 핸드폰번호 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="fa fa-mobile" style="font-size: 35pt"></i>
				</div>
				<div class="w3-rest" style="width: 85%">
					<div class="w3-bar">
						<select id="phoneFirst" name="phonefirst" class="w3-select w3-border w3-bar-item" style="width: 25%; height: 41px; margin-right:1%; padding-left: 3; text-align: center">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						<input type="text" id="phoneRest" name="phonerest" class="w3-input w3-border w3-bar-item" style="width: 45%; height: 41px; margin-right:4%" maxlength="8">
						<div id="checkCertificate"><button type="button" id="certificate" class="w3-button w3-light-grey w3-border w3-bar-item w3-center" disabled style="width: 20%; height: 41px; padding-left:5; padding-right: 5">인증</button></div>
					</div>
					<!-- 인증번호 입력창 -->
					<input id="inputCertificate" type="text" class="w3-input w3-border" style="width:71%; margin-top:1" maxlength="6" placeholder="인증번호 6자리 숫자 입력">
					<div id="phoneCheck" style="padding-top:5px; color: red"></div>
					<!-- 인증번호 문구 div -->
					<div id="inform" style="width:95%; margin-top:2; padding-left:3; font-size: 10pt"></div>
				</div>
			</div>
			<!-- 알림수신방법 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 15%; text-align: center">
					<i class="fa fa-bell" style="font-size: 22pt"></i>
				</div>
  				<div class="w3-rest" style="width: 85%">
	   				<div>희망가격 도달 알리미</div>
  					<div class="w3-bar w3-mobile">
  						<div class="w3-bar-item" style="padding-top:1; padding-left:0"><input type="checkbox" id="mail" name="alarm" class="w3-check alarm" value="M"> 메일로 수신 </div>
  						<div class="w3-bar-item" style="padding-top:1; padding-left:0"><input type="checkbox" id="message" name="alarm" class="w3-check alarm" value="T"> SMS로 수신 </div>
   					</div>
   					<div id="alarmCheck" style="padding-top:1; color: red"></div>
  				</div>  					
  			</div>
  			<div id="result" class="w3-center"></div>
 			<!-- 완료/취소 -->
			<div class="w3-center" style="margin-top: 8%">
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

	//아이디 중복체크(ajax)
	$( "#id" ).on("keyup", function() {
		$.ajax({
			url : "controller?cmd=checkIDAction",
			data : {
				id : $( "#id" ).val()
			},
			success : function(result){
				if(JSON.parse(result)) {
					$( "#idCheck" ).html("이미 사용중인 아이디 입니다.");
				} else {
					$( "#idCheck" ).html("");
				}
			}		
		})
	});	
	
	//비밀번호 길이체크(틀리면 password1 입력값 지우기)
   $("#password1").on("change", function(){
      if($("#password1").val().length<8){
         $("#pwLengthCheck").html("8~15자로 입력해주세요");
         $( "#password1" ).val("");
      }else{
         $("#pwLengthCheck").html("");
      }
      
      //일치여부체크(다르면 password2 입력값 지우기)
      if($("#password1").val()!=$("#password2").val()){
         $("#password2").val("");
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

	//휴대폰 번호 중복 체크(ajax)
	$( "#phoneRest" ).on("keyup", function() {
		$.ajax({
			url : "controller?cmd=checkPhoneAction",
			data : {
				 phoneFirst : $( "#phoneFirst" ).val(),
				 phoneRest : $( "#phoneRest" ).val(),
				
			},
			success : function(result){
				if(JSON.parse(result)) {
					$( "#phoneCheck" ).html("<font color=red>이미 사용중인 번호입니다.</font>");
					 $( "#certificate" ).attr("disabled", true);				
				} else {
					$( "#phoneCheck" ).html("");
					$( "#certificate" ).attr("disabled", false);
				}
			}		
		})
	});

	//인증번호 전송
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
                        $( "#inform" ).html("<font color=blue>인증되었습니다.</font>");
                         setTimeout(function(){
                        	 $( "#inform" ).html("");
                            },1000);                            
                     } else {
                        $( "#inform" ).html("<font color=red>인증실패</font>")                        
                     }
                  })
               }
         }
      })
   });
	
	//취소버튼 클릭 시 홈으로 이동	
	$( "#cancel" ).on("click", function(){
			location.href="controller?cmd=homeUI";				
	});
	
	//전체 값 넘기기
 	$( "#submit" ).on("click", function() {
       if($("#idCheck").text()==""&&$("#nicknameCheck").text()==""&&$("#inform").text()==""&&$("#alarmCheck").text()==""&&$("#pwLengthCheck").text()==""&&$("#pwSameCheck").text()=="") {
       //1. 알림수신방법 체크된 값을 배열에 담기
      var checkAlarm = [];
      var getAlarm="";
      $("input[name='alarm']:checked").each(function() {
          checkAlarm.push($(this).val());
          if(checkAlarm.length==2) 
             getAlarm="B"
          if(checkAlarm.length==1)
             getAlarm=checkAlarm[0];
      })
      //2. 회원가입 값들 모두 넘기기   
      $.ajax({
         url : "controller?cmd=addMemberAction",
         data : {
            id : $( "#id" ).val(),
            password : $( "#password1" ).val(),
            nickname : $( "#nickname" ).val(),
            phoneFirst : $( "#phoneFirst" ).val(),
            phoneRest : $( "#phoneRest" ).val(),
            alarm : getAlarm
         },
         success : function(result) {            
             if($.trim(result) == "회원가입 성공") {
                $( "#result" ).html(result);
                setTimeout(function(){         
                    location.href="controller?cmd=homeUI";
                    $("#result").parentNode.removeChild($("#result"));
                   },1000);
                   document.body.appendChild($("#result"));
             } else {                         
                $("#content").html(result);
             }                              
         }         
      }) } else {
         location.href="";
      }
   }); 
</script>