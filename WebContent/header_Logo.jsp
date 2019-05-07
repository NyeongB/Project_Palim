<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<div id="header" class="w3-white w3-xlarge web" style="max-width:1000px; margin:auto; margin-top:1%">
    <div class="w3-left" style="margin-top: 1%; margin-left:20px; width:25%;">
	    <a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:57%; height:6%;"></a>	
	</div>
</div>
<div class="w3-white w3-xlarge app" style="max-width:1000px; margin:auto; margin-top:1%">
    <div class="w3-left" style="margin-top: 2%; margin-left:20px; width:25%;">
	    <a href="controller?cmd=homeUI"><img src="Image/Palim.jpg" style="width:100%; height:5%;"></a>	
	</div> 
</div>

<script type="text/javascript">
if($(window).width() >= 400) {
   $( ".app" ).hide();
} else {
   $( ".web" ).hide();
}
</script>