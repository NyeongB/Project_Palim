<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
 font-family: 'Nanum Gothic', sans-serif;
} 
</style>

<div class="w3-container w3-center w3-padding-16 web" style="margin-bottom: 5px">
	<div class="w3-quarter w3-container"></div>
	<div class="w3-half w3-container w3-center">
	<input type="text" class="inputData" style="width: 87%; height: 5%; font-size: 13pt; margin-top: 8%;margin-bottom:7%" >
	<i class="search fa fa-search" style="margin-left: 2%; font-size:32px;"></i>
	</div>
</div>
<div class="w3-container w3-center w3-padding-16 app" style="margin-bottom: 5px;">
	<div class="w3-quarter w3-container"></div>
	<div class="w3-half w3-container w3-center">
	<input type="text" class="inputData" style="width: 83%; height: 7%; font-size: 13pt; margin-top: 10px;">
	<i class="search fa fa-search" style="margin-left: 2%; font-size:25px;"></i>
	</div>
</div>

<script type="text/javascript">
	if($(window).width() >= 400) {
	   $( ".app" ).hide();
	} else {
	   $( ".web" ).hide();
	}

	//검색창 입력후 돋보기 클릭 시  값 넘기기
	$( ".search" ).on( "click", function() {
		if($(window).width() >= 400) {
			location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent($( ".inputData" ).eq(0).val()))
		} else {
			location.href="controller?cmd=searchAppAction&inputData=" + encodeURI(encodeURIComponent($( ".inputData" ).eq(1).val()))
		}
	});
	//검색창 입력후 엔터치면 값 넘기기
	$( "#inputData" ).on( "keydown", function(event) {
		if(event.which==13) {
			if($(window).width() >= 400) {
				location.href="controller?cmd=searchAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).eq(0).val()))
			} else {
				location.href="controller?cmd=searchAppAction&inputData=" + encodeURI(encodeURIComponent($( "#inputData" ).eq(1).val()))
			}
		}
	});
</script>