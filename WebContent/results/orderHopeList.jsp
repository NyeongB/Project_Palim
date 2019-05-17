<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>    

		<div id=<%=(int)request.getAttribute("currentPage")%> class="page">
			<ul class="w3-ul">
				<li class="checkboxGrid"><input type="checkbox" id="checkboxAll"></li> 
				<li class="regiDayGrid">등록일</li> 
				<li class="productImageGrid" >사진</li>
				<li class="productNameGrid">제품명</li>
				<li class="lowHopePriceGrid">최저가/희망가</li>
				<li class="updatePriceGrid">수정/삭제</li>			
				<li class="appProductImageName">등록일/사진/제품명</li>
				<li class="appLowHopePrice">최저가/희망가</li>
				<li class="hide"></li>
			</ul>
			
	<% Collection<Map<String, String>> list = (Collection)request.getAttribute("order");
		int currentPage = (int)request.getAttribute("currentPage");
   		int cnt=1;
   		if(list!=null){
	   		for(Map<String, String> x :list) { %>
			<ul class=productTitle><%=x.get("PRODUCT_TITLE")%></ul>
			<ul class="w3-ul accordion list" id='<%=(String.valueOf(x.get("PRODUCT_ID")))%>'>			
				<li class="checkboxGrid"><input type="checkbox" id='<%=String.valueOf(x.get("HOPE_PRICE"))%>' class="checkbox" name='<%=(String.valueOf(x.get("PRODUCT_ID")))%>' value='<%=String.valueOf(x.get("LPRICE"))%>'></li>
				<li class="regiDayGrid"><%=x.get("REGI_DAY")%></li> 
				<li class="productImageGrid"><img src=<%=x.get("PRODUCT_IMG")%>></li>
				<li class="productNameGrid"><%=x.get("PRODUCT_TITLE")%></li>
				<li class="lowHopePriceGrid">
					<span>최저가: <%=String.valueOf(x.get("LPRICE"))%>원</span><br>
					<span>희망가: <input type="text" class="hopePrice" value=<%=String.valueOf(x.get("HOPE_PRICE"))%> disabled>원</span>
				</li>
				<li class="updatePriceGrid">
					<a href="javascript:void(0);" id="<%=String.valueOf(x.get("LPRICE"))%>" class="modify" style="color: blue" >수정</a>
					<a href="javascript:void(0);" id="delete" class="delete" style="color: blue" >삭제</a>
					<div class="deleteInform" style="margin-top:30; color:red"></div>
				</li>				
				<li class="appProductImageName">
					<div class="w3-container">
						<p><%=x.get("REGI_DAY")%></p>
					    <img src=<%=x.get("PRODUCT_IMG")%>>					    	
					</div>
				</li>
				<li class="appLowHopePrice">
						<p>최저가: </p> 
						<p><%=String.valueOf(x.get("LPRICE"))%></p>
						<p>희망가: </p>
						<input type="text" class="hopePrice" value=<%=String.valueOf(x.get("HOPE_PRICE"))%> disabled>원
						<p><a href="javascript:void(0);" id="<%=String.valueOf(x.get("LPRICE"))%>" class="modify">수정</a>
						<a href="javascript:void(0);" id="delete" class="delete">삭제</a></p>
						<div class="deleteInform" style="margin-top:10; color:red; font-size:10"></div>
				</li>							
				<li class="hide"></li>
			</ul>			
			<ul class="curve_chart" style="display: none; padding:0;"></ul>
			<%cnt++;}}%>
		</div>
		<!-- 최초최저가, 현재최저가 차이 구하기 -->
		<div class="w3-container" style="margin-top:3%; text-align: right">
			<span id="firstLprice" style="color: fuchsia;">원 : 최초 최저가</span><br>
			-<span id="nowLprice" style="color: blue;">원 : 현재 최저가</span><br>
			<span id="subtraction" style="color: green">원</span>
		</div>
		
		
<script>
	//웹사이즈 조절 시 리스트 구조 바꾸기
	$(window).resize(function(){
		if($(window).width() >= 400) {
			$( ".productImageGrid" ).show();
			$( ".productNameGrid" ).show();
			$( ".lowHopePriceGrid" ).show();
			$( ".updatePriceGrid" ).show();
			$( ".appProductImageName" ).hide();
			$( ".appLowHopePrice" ).hide();
		} else {
			$( ".appProductImageName" ).show();
			$( ".appLowHopePrice" ).show();
			$( ".productImageGrid" ).hide();
			$( ".productNameGrid" ).hide();
			$( ".lowHopePriceGrid" ).hide();
			$( ".updatePriceGrid" ).hide();
			$( ".checkboxGrid").hide();
		}
	});
	
	//리스트 높이 일정하게
	$(document).ready(function(){				
		if($(window).width() >= 400) {
		$(".list li").each(function(){
			$(this).css({				
				height:280
			});
		});	} else {
			$(".list li").each(function(){
				$(this).css({				
					height:180
				});
			});	
		}			
	});
	
	//리스트 클릭 시 그래프 보여주기
	
	$(".accordion").on("click", function() {		
		var panel = this.nextElementSibling;
		if (panel.style.display === "block") {
			panel.style.display = "none"; //안보여주기
		} else {
			panel.style.display = "block";
		}
	});
	
	google.charts.load('current', {'packages' : [ 'corechart' ]	});
	google.charts.setOnLoadCallback(drawChart);	
	
	function drawChart() {
		<%for(int i=0; i<(cnt-1); i++) {%>
		var curves<%=i%> = document.querySelectorAll(".curve_chart")[<%=i%>];
		var data = google.visualization		
		.arrayToDataTable([ [ 'Date', 'price' ], <% Collection<Map<String, String>> graph = (Collection)request.getAttribute("graph"+""+(i+1));   		 
   		if(graph!=null){
   		   for(Map<String, String> x :graph) { %>[ '<%=x.get("LPRICE_UPDAY")%>', <%=(String.valueOf(x.get("LPRICE")))%> ],<%}}%>]);
		var options = {
			curveType : 'function',
			legend : {
				position : 'bottom'
			},
			height : 300,
			width : 850,
		};
		var options2 = {
			curveType : 'function',
			legend : {
				position : 'bottom'
			},
			height : 150,
			width : 380,
		};			
		var chart<%=i%> = new google.visualization.LineChart(curves<%=i%>);
		if ($(window).width() >= 400) {
			chart<%=i%>.draw(data, options);
		} else {
			chart<%=i%>.draw(data, options2);
		}
		<%}%>
	}	

	//수정버튼 클릭 시 확인,취소로 변경
	<%for(int i=0; i<2*(cnt-1); i++) {%>
	$( ".modify" ).eq(<%=i%>).on("click", function(e) {
		e.stopPropagation();
		$( ".hopePrice" ).eq(<%=i%>).attr('disabled', false);
		$( ".delete" ).eq(<%=i%>).html('<a href="javascript:void(0);" id="cancel" style="color: blue" onclick="cancelModify()">취소</a>');
		$(this).html('<a href="javascript:void(0);" id="submit<%=i%>" style="color: blue">확인</a>');
		var productID;
		if(<%=i%2==0%>) {
			productID = $(".list").eq(<%=i/2%>).prop("id");
		} else{
			productID = $(".list").eq(<%=(i-1)/2%>).prop("id");
		} 
			var lprice="";
			lprice=$(this).prop("id")
	      //확인 클릭시 희망가격 업데이트
	      $("#submit<%=i%>").on("click", function() {
	         $.ajax({
	         url : "controller?cmd=updateHpriceAction",
	         data : {
	            hopePrice : $(".hopePrice").eq(<%=i%>).val(),
	            productID : productID,
	            lprice : lprice
	         },
	         success : function(result){
	            var deleteInform = $( ".deleteInform" ).eq(<%=i%>);
	            deleteInform.html(result);
	            if($.trim(result)=="수정성공"){
	               $( ".deleteInform" ).eq(<%=i%>).css("color","blue")
	            }
	            setTimeout(function(){                
	               location.href="controller?cmd=hopeListUI";
	               deleteInform.parentNode.removeChild(deleteInform);
	                   },1000);
	                document.body.appendChild(deleteInform);      
	         }
	          });
	      });
	});
	<%}%>	
	
	//삭제기능
	<%for(int i=0; i<2*(cnt-1); i++) {%>
	$( ".delete" ).eq(<%=i%>).on("click", function(e) {
		e.stopPropagation();
		var productID;
		if(<%=i%2==0%>) {
			productID = $(".list").eq(<%=i/2%>).prop("id");
		} else{
			productID = $(".list").eq(<%=(i-1)/2%>).prop("id");
		}
		$.ajax({
			url : "controller?cmd=deleteHpriceAction",
			data : {
				productID : productID
			},
			success : function(result){
			var deleteInform = $( ".deleteInform" ).eq(<%=i%>);
			var msg = "삭제 오류";
			if(JSON.parse(result)){
				msg="상품이 삭제됩니다.";
			}
			deleteInform.html(msg);
			setTimeout(function(){ 					
				location.href="controller?cmd=hopeListUI";
				deleteInform.parentNode.removeChild(deleteInform);
	       		},1000);
	       	document.body.appendChild(deleteInform);				
			}			
		});
	});
	<%}%>
	
	//체크박스 전체 버튼 클릭시 모두 해제, 모두 선택
	$("#checkboxAll").on("click", function() {
		var lpriceSum=0, sub=0;  
		var productID = [];
		if($(this).is(':checked')) {
    		$(".checkbox").each(function(){
	    		$(this).prop('checked', true)    			   
	    		//선택된 상품 가격정보
	    		if($(this).is(':checked')) {
	    			lpriceSum+=parseInt($(this).val()) //선택된 상품들의 현재 최저가 계산
	    			productID.push($(this).attr("name")) //선택된 productID담기
	    		}
    	    });
    	} else {
    		$(".checkbox").each(function(){
    		   $(this).prop('checked', false) 
    	    });
    	}
		
		jQuery.ajaxSettings.traditional = true;
		//productID가 아무것도 선택이 안되어 있으면 ajax로 보내지 않고 빈문자열을 보여줌
		if(productID.length!=0) {
			$.ajax({
				url : "controller?cmd=getLpriceFirstDayAction",
				data : {
							productID : productID
						},
				success : function(result){
							sub=parseInt(JSON.parse(result))-lpriceSum
							$('#firstLprice').html(result+"원 : 최초최저가");
							if(sub>0) {
								$('#subtraction').html('<span id="subtraction" style="color: green">'+sub+'원 save</span>');
							} 
							if(sub==0){
								$('#subtraction').html('<span id="subtraction" style="color: green">'+sub+'원</span>');
							}
							if(sub<0) {
								sub*=(-1);
								$('#subtraction').html('<span id="subtraction" style="color: red">'+sub+'원 lost</span>');
							}
						}
			}) 
		} else {
			$('#firstLprice').html("원 : 최초최저가");
			$('#subtraction').html('<span id="subtraction" style="color: green">원 save</span>');
		}
		//현재 최저가 보여주기, 아무것도 선택이 안되어 있으면	0원이라고 띄우지 않기위해서 새로선언
		if(lpriceSum==0)
			$('#nowLprice').html("원 : 현재최저가");
		else
			$('#nowLprice').html(lpriceSum+"원 : 현재최저가");
       });
	
	//체크박스 하나하나 이벤트 
	$(".checkbox").on("click", function(){
		var lpriceSum=0, sub=0;
		var result=true;
		var productID = [];		
		$(".checkbox").each(function(){
			result*=$(this).is(':checked');
			if($(this).is(':checked')){
				lpriceSum+=parseInt($(this).val())
			 	productID.push($(this).attr("name"))
			}
		});
		//체크박스가 모두 선택되면 전체체크박스를 체크 함, 아닐경우 해제
		if(result==1){
			$('#checkboxAll').prop('checked', true)
		}
		else{
			$('#checkboxAll').prop('checked', false)
		}
		
		jQuery.ajaxSettings.traditional = true;
		if(productID.length!=0) {
			$.ajax({
				url : "controller?cmd=getLpriceFirstDayAction",
				data : {
							productID : productID
						},
				success : function(result){
							sub=parseInt(JSON.parse(result))-lpriceSum
							$('#firstLprice').html(result+"원 : 최초최저가");							
							if(sub>0) {
								$('#subtraction').html('<span id="subtraction" style="color: green">'+sub+'원 save</span>');
							} 							
							if(sub==0){
								$('#subtraction').html('<span id="subtraction" style="color: green">'+sub+'원</span>');
							}							
							if(sub<0) {
								sub*=(-1);
								$('#subtraction').html('<span id="subtraction" style="color: red">'+sub+'원 lost</span>');
							}
						}
			}) 
		} else {
			$('#firstLprice').html("원 : 최초최저가");
			$('#subtraction').html('<span id="subtraction" style="color: green">원 save</span>');
		}
		
		if(lpriceSum==0)
			$('#nowLprice').html("원 : 현재최저가");
		else
			$('#nowLprice').html(lpriceSum+"원 : 현재최저가");
	}); 
	
	//취소기능
	var cancelModify = function() {
		location.href ="";
	}
	
	//그래프 막기
	$(".checkboxGrid").on("click", function(e) {
		e.stopPropagation();
	});
	$(".delete").on("click", function(e) {
		e.stopPropagation();
	});
	$(".hopePrice").on("click", function(e) {
		e.stopPropagation();
	});
	
	//체크박스
	var checkAll = document.querySelectorAll(".checkbox");
    document.querySelector("#checkboxAll").onclick = function(){
       if(document.querySelector("#checkboxAll").checked) {
          for (i=0; i<checkAll.length; i++ )
          checkAll[i].checked=true;
       } else {
          for (i=0; i<checkAll.length; i++ )
             checkAll[i].checked=false;
       }
       
       
    };
    
    $(".checkbox").each(function(){
		if(parseInt($(this).prop("id"))>=parseInt($(this).val())){
			alert($(this).attr("name"))
			$.ajax({
				url : "controller?cmd=sendAction",
				data : {
						productID : $(this).attr("name"),
						hprice : $(this).prop("id")
				},
				success : function(result){
					if(JSON.parse(result)){
					alert("알림이 갔어요")
					}
				}
			})
		}
	    });
          
</script>
