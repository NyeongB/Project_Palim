<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<div id="sidebar1" style="width: w3-third">
	<nav class="w3-bar-block w3-large w3-left" style="width:160px;">  
		<h4 class="w3-bar-item"><b>회원정보수정</b></h4>
			<a class="w3-bar-item w3-button" href="controller?cmd=updatePWUI">비밀번호수정</a>
			<a class="w3-bar-item w3-button" href="controller?cmd=updatePhoneUI">휴대폰번호수정</a>
			<a class="w3-bar-item w3-button" href="controller?cmd=updateNicknameUI">닉네임수정</a>
			<a class="w3-bar-item w3-button" href="controller?cmd=updateAlarmUI">알림수신방법수정</a>
		<h4 class="w3-bar-item"><b>회원탈퇴</b></h4>
			<a class="w3-bar-item w3-button" href="controller?cmd=dropUserUI">회원탈퇴</a>	
	</nav>
</div>

<div id="sidebar2" class="w3-bar">
	<div class="w3-dropdown-hover w3-white" style="width:50%">
		<button class="w3-button" style="width:100%">회원정보수정</button>
			<div class="w3-dropdown-content w3-bar-block" style="width:50%">
				<a class="w3-bar-item w3-button" href="controller?cmd=updatePWUI">- 비밀번호수정</a>
				<a class="w3-bar-item w3-button" href="controller?cmd=updatePhoneUI">- 휴대폰번호수정</a>
				<a class="w3-bar-item w3-button" href="controller?cmd=updateNicknameUI">- 닉네임수정</a>
				<a class="w3-bar-item w3-button" href="controller?cmd=updateAlarmUI">- 알림수신방법수정</a>
			</div>
	</div>
		<a class="w3-bar-item w3-button" href="controller?cmd=dropUserUI">- 회원탈퇴</a>
</div>


<script type="text/javascript">

	
	//웹 화면일 때 사이드바 1 호출, 폰 화면일 때 사이드바 2 호출
	if($(window).width() >= 400) {
		$( "#sidebar2" ).hide();
	} else {
		$( "#sidebar1" ).hide();
	}

</script>