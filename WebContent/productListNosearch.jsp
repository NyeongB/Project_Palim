<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<title>검색결과 조회</title>
<body>
	<div id="main" class="w3-content" style="max-width: 1000px; margin: auto;">
	<%@include file="header.jsp"%>
	<%@include file="header_Search.jsp"%>
		<div class="w3-right">
			<button class="w3-button w3-white w3-hide-small">
				<i class="w3-margin-right"><img src="Image/thumbnail.png" style="width:14px; height:14px;"></i>이미지보기
			</button>
			<button class="w3-button w3-white w3-hide-small">
				<i class="fa fa-bars w3-margin-right"></i>목록보기
			</button>
		</div>
	
	<!--Content size -->
		<div class="w3-main w3-content w3-padding w3-center" style="max-width: 1000px;">
		<br><br><br>
		<font style="color: blue">찾으시는 상품이 없습니다. 다시 검색해 주세요</font>
		</div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>