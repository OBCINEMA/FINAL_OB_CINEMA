<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
 <script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
<head>

<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}

.table-borderless>tbody>tr>td, .table-borderless>tbody>tr>th,
	.table-borderless>tfoot>tr>td, .table-borderless>tfoot>tr>th,
	.table-borderless>thead>tr>td, .table-borderless>thead>tr>th {
	border: none;
}
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- Favicons -->
<link rel="shortcut icon" href="<%=KPath%>/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=KPath%>/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=KPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=KPath%>/css/plugins.css">
<link rel="stylesheet" href="<%=KPath%>/style.css">

<!-- Color Variations -->
<!-- 헤더 로그인 버튼 색상 -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

<!-- Cusom css -->
<%-- <link rel="stylesheet" href="<%=KPath%>/css/custom.css"> --%> 

<!-- Modernizer js -->
<%-- <script src="<%=KPath%>/js/vendor/modernizr-3.5.0.min.js"></script> --%>

	<script>

	//극장 상세정보 모달용 변수 선언
	var theaterOne;
	var t_detail_name;
	var t_detail_img1;
	var t_detail_contents;
	var t_detail_phone;
	var t_detail_adress;
	var t_detail_img2;
	var t_detail_img3;
	var t_detail_img4;
	
	//극장 상세 모달
	function theaterDetailModalOn(){
		t_detail_name = theaterOne.name;
		t_detail_img1 = theaterOne.img1;
		t_detail_contents = theaterOne.content;
		t_detail_phone = theaterOne.phone;
		t_detail_adress = theaterOne.adress;
		t_detail_img2 = theaterOne.img2;
		t_detail_img3 = theaterOne.img3;
		t_detail_img4 = theaterOne.img4;
		
		console.log('t_detail_name : ' + t_detail_name);
		console.log('t_detail_img1 : ' + t_detail_img1);
		console.log('t_detail_contents : ' + t_detail_contents);
		console.log('t_detail_phone : ' + t_detail_phone);
		console.log('t_detail_adress : ' + t_detail_adress);
		console.log('t_detail_img2 : ' + t_detail_img2);
		console.log('t_detail_img3 : ' + t_detail_img3);
		console.log('t_detail_img4 : ' + t_detail_img4);
		console.log('test완료');
		
		$('#myModalTheaterDetail-name').html(t_detail_name);
		$('#myModalTheaterDetail-img1').html('<img src="/resources/theaterimg/'+t_detail_img1+'" alt="service thumb" style="width: 100%;">');
		$('#myModalTheaterDetail-contents').html(t_detail_contents);
		$('#myModalTheaterDetail-phone').html(t_detail_phone);
		$('#myModalTheaterDetail-adress').html(t_detail_adress);
		$('#myModalTheaterDetail-img2').html('<img src="/resources/theaterimg/'+t_detail_img2+'" alt="service thumb" style="width: 100%;">');
		$('#myModalTheaterDetail-img3').html('<img src="/resources/theaterimg/'+t_detail_img3+'" alt="service thumb" style="width: 100%;">');
		$('#myModalTheaterDetail-img4').html('<img src="/resources/theaterimg/'+t_detail_img4+'" alt="service thumb" style="width: 100%;">');
		
	    modal3.style.display = "block";
	}
	
		//달력
			
			$(document).ready(function() {
				$('#Date').change(function() {
					$("#showData").empty();
					$("#showSeat").empty();
					$("#screenSeat").empty();
				});	
				
			$('#Date').datepicker({
				dateFormat: 'yy-mm-dd',
				language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
				pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
				defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
				todayHighlight: true,
				autoclose: true,
				showOn: "both",
				buttonImage: "resources/img/date.png ", 
				buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
				buttonText: "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트    
				yearSuffix: "년",
				monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'], //달력의 월 부분 텍스트
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip 텍스트
				dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
				dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 부분 Tooltip 텍스트
				  
				//In Datepicker set the Calendar display start with Sunday (by default datepicker starts from Sunday)
				firstDay: 1,	
				  
				  //해당주만 선택가능하게..
		          //Before Populating the Calendar set the Enabled &amp; Disabled Dates using beforeShowDay(Date) function
				  beforeShowDay: function (date) {
			            //Get today's date
						var monday = new Date();
			            //Set the time of today's date to 00:00:00 
						monday.setHours(0,0,0,0);
			            /*
			            Below Line sets the Date to Monday (Start of that Week)
			            (monday.getDay() || 7) returns the value of getDay() 
			            ie., [ 1 - Mon, 2 - Tue, 3 - Wed, 4 - Thu, 5 - Fri, 6 - Sat ]  
			            except for Sunday where it returns 7. 
			            The return value is used to calculate the Date of that Week's Monday
			            */
						monday.setDate(monday.getDate() + 1 - (monday.getDay() || 7));
			            //Set the Date to Monday
						var sunday = new Date(monday);
			            //Now add 6 to Monday to get the Date of Sunday (End of that Week)
						sunday.setDate(monday.getDate() + 6);
			            //Now return the enabled and disabled dates to datepicker
						return [(date >= monday && date <= sunday), ''];
					}
				});
			theater('${movieRes.m_id }','${movieRes.title }','${movieRes.director }','${movieRes.gnr }','${movieRes.runningtime }','${movieRes.poster }');
			$('#Date').datepicker('setDate', 'today');
		});
	
		//극장
		function theater(m_id,title,director,gnr,runnintime,poster) {
	// 		alert(m_id,title,director,gnr,runnintime,poster);
			$("#theater").empty();
			$("#screen").empty();
			$("#time").empty();
			$("#showData").empty();
			$("#showSeat").empty();
			$("#theaterImg").empty();
			$("#screenSeat").empty();
			
			$.ajax({
				type : "POST",
				dataType : "json",
				data : {'m_id':m_id},
				url : "movie_theater.do",
				success : function(data) {
					var str = "";
					var strr = "";
					var strrr = "";
					
					$.each(data, function(member){
						str += '<input type="button" style="margin-top: 5px;" class="btn btn-light btn-lg" onclick="fnTest('+ m_id + ',' + this.t_id + ',' + "'" + this.img1 + "'," + "'" + this.name + "'" + ')" value=' + this.name + '>';
						
					});
					$("#showTheater").html(str);
					strr += strr += '<img src="resources/movieimg/' + poster + '" width="80">';
					$("#moviePoster").html(strr);
					
					strrr += title + '<br>' + director + '<br>' + gnr + '<br>' + runnintime;
					$("#movieDetail").html(strrr)
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러1111 발생~~ \n" + textStatus + " : " + errorThrown);
			    }
			})
		}
		
		//상영관
		function fnTest(m_id,t_id,img,name) {
			$("#showSeat").empty();
			$("#screenSeat").empty();
				$.ajax({
					type : "POST",
					dataType : "json",
					data : {'m_id':m_id},
					url : "theater.do?t_id="+t_id,
					success : function(data) {
						console.log("data : " + data);
						scheduleList = data.scheduleList;
						theaterOne = data.theaterOne;
						
						console.log("scheduleList : " + scheduleList);
						console.log("theaterOne : " + theaterOne);
						
						var str = "";
						var i = 1;
						
						$("#theater").html("극장 " + name);
						
						var strr = "";
						strr += '<img src="resources/theaterimg/' + img + '" width="300"><li><a onclick="theaterDetailModalOn()" style="color : #ce2c3c">극장정보 상세보기</a></li>';
						
						$("#theaterImg").html(strr);
						
						var idArr = new Array();
						$.each(scheduleList, function(member){
							var num = idArr.indexOf(this.scr_id);
							var now = new Date().getHours();
							
							if(num != -1 && this.time>now) {
								if(this.time == 8) {												  
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',8)" value="8시">';
								} else if (this.time == 11){
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',11)" value="11시">';
								} else if (this.time == 14){
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',14)" value="14시">';
								} else if (this.time == 17){
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',17)" value="17시">';
								} else if (this.time == 20){
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',20)" value="20시">';
								} else if (this.time == 23){
									str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',23)" value="23시">';
								}
							}
							
							if(num == -1 && this.time>now) {
							str += '<h4 style="font-weight: bold; text-align: center; ">상영관' + i +'</h4>';
							if(this.time == 8) {
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',8)" value="8시">';
							} else if (this.time == 11){
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',11)" value="11시">';
							} else if (this.time == 14){
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',14)" value="14시">';
							} else if (this.time == 17){
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',17)" value="17시">';
							} else if (this.time == 20){
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',20)" value="20시">';
							} else if (this.time == 23){
								str += '<input type="button" style="width: 80px;margin-left: 10px;margin-right: 10px;margin-top: 10px;" class="btn btn-light btn-lg" onclick="seat('+ m_id + ',' + this.scr_id + ',' + "'" + t_id + "'" + ',23)" value="23시">';
							}
							i++;
							};
							idArr.push(this.scr_id);
							
						});
						
						$("#showData").html(str);
					},
					error : function(jqXHR, textStatus, errorThrown) {
				        alert("에러2222 발생~~ \n" + textStatus + " : " + errorThrown);
				    }
				})
		}
		
		//좌석 모달
		function seat(m_id,scr_id,t_id,time) {
			$.ajax({
				type : "POST",
				dataType : "json",
				data : {'m_id':m_id,'scr_id':scr_id,'time':time,'date':$("#Date").val()},
				url : "screenSeat.do",
				success : function(data) {
					var str = "";
					
					var strrr="";
					strrr = data.scr_name;
					$("#screen").html("상영관 " + strrr);
					
					var strr="";
					strr = time;
					$("#time").html("시간 " + strr);
					
					var strrrr="";
					
					showSeat(m_id,scr_id,time,data.scr_seat_row,data.scr_seat_col);
					
					str += '상영관 - '+data.scr_name+'<br>';
					str += '남은 좌석 - '+data.restSeat+'<br>';
					str += '예매가능좌석 - <input type="button" name="check_seat" style="width: 12px;height: 12px;padding-right: 0px;padding-left: 0px; background-color: #007bff;"><br>';
					str += '예매불가좌석 - <input type="button" name="check_seat" style="width: 12px;height: 12px;padding-right: 0px;padding-left: 0px; background-color: #888;">';
					str += '<div class="row">';
					str += '<div class="col-md-4">';
					str += '<input type="hidden" name = "scr_id" value=' + scr_id + '>';
					str += '<input type="hidden" name = "time" value=' + time + '>';
					str += '<input type="hidden" name = "t_id" value=' + t_id + '>';
					str += '<input type="hidden" name = "m_id" value=' + m_id + '>';
					
					strrrr += '<input type="submit" value="좌석선택" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px;">';
					$("#next").html(strrrr);
					
					str += '</div>';
					str += '</div>';
					$("#showSeat").html(str);
				},
				error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러3333 발생~~ \n" + textStatus + " : " + errorThrown);
			    }
			});
		}
		
		function showSeat(m_id,scr_id,time,row,col) {
			$.ajax({
				type : "POST",
				dataType : "json",
				data : {'m_id':m_id,'scr_id':scr_id,'time':time,'date':$("#Date").val()},
				url : "schedule_pre.do",
				success : function(data) {
					console.log(m_id);
					console.log(scr_id);
					console.log(time);
					console.log($("#Date").val());
					console.log(row);
					console.log(col);
					var str = "";
					var a;
					var b;
					
					for(a=1; a<=row; a++) {
						str += '<span>';
						for(b=1; b<=col; b++) {
								str += '<label><input type="button" name="check_seat"';
								str += 'id = ' + '"' + a + b + '"' + 'style="width: 12px;height: 12px;padding-right: 0px;padding-left: 0px; background-color: #007bff;"';
								str += '>';
								str += '</label>';
						}
						str += '<span>';
						str += '<br>';
					}
					$("#screenSeat").html(str);
					for(a=1; a<=row; a++) {
						for(b=1; b<=col; b++) {
							$.each(data, function(member){
								if(a == this.seat_row && b == this.seat_col) {
									$("#"+a+b).css('background-color', '#888');
									
								}
							});
						};
						}
					},
				error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러444 발생~~ \n" + textStatus + " : " + errorThrown);
			    }
			})
		}
	</script>
</head>
<body>
	<!-- 메인 영역 -->
	<!-- Header 시작 -->
	<jsp:include page="../main/main-header.jsp"></jsp:include>
	<!-- //Header 끝 -->
	<section class="services-area section-padding-lg" style="background-color: #252525">
	<div class="container" style="margin-top: 50px;margin-bottom: 40px;">
			<form action="schedule.do" method="post" style="margin: auto; box-shadow: 10px 10px 6px #121212;">
				<div class="pricing-plan card-group d-flex" style="height: 730px; font-weight: bold; font-size: large;" >
					<div class="card set-price p-1 ">
											<div class="card-header text-center pb-4 item">
							<h5 class="h1 card-title" style="color: black">영화</h5>

						</div>
						<div class="card-body d-flex flex-column" style="height: 500px; overflow:auto;">
							<ul class="list-unstyled text-center">
								<li><c:forEach var="i" begin="0"
										end="${movieList.size()-1 }" step="1">
										<c:if test="${movieList[i].m_id == movieRes.m_id}">
											<a href="#" class="list-group-item"
												onclick="theater('${movieList[i].m_id }','${movieList[i].title }'
							,'${movieList[i].director }','${movieList[i].gnr }','${movieList[i].runningtime }','${movieList[i].poster }');  return false;">${movieList[i].title }</a>
										</c:if>

										<c:if test="${movieList[i].m_id != movieRes.m_id}">
											<a href="#" class="list-group-item"
												onclick="theater('${movieList[i].m_id }','${movieList[i].title }'
							,'${movieList[i].director }','${movieList[i].gnr }','${movieList[i].runningtime }','${movieList[i].poster }'); return false;">${movieList[i].title }</a>
										</c:if>
									</c:forEach></li>
							</ul>
						</div>
						<div class="card-footer d-flex flex-column" style="height: 146px;">

							<ul class="list-unstyled text-center">
								<li>
									<div class="active">
										<span id="moviePoster" style="float: left;"></span>
										<span id="movieDetail" style="font-weight: bold;"></span>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<div class="w-100 d-md-none mt-4"></div>

					<div class="card p-1 starter">
						<div class="card-header text-center pb-4 item">
							<h5 class="h1 card-title" style="color: black">극장</h5>

						</div>
						<div class="card-body d-flex flex-column"  style="height:500px; overflow:auto">

							<ul class="list-unstyled text-center">
							<li><input id="Date" name="date" onclick="date()" style="width: 192px; height: 36px;"></li>
							</ul>
							<span id="showTheater">영화를 선택하면 극장 나옵니다.</span>
							<br>
							<ul class="list-unstyled text-center">
								<li><div id="theaterImg"></div></li>
								
							</ul>
						</div>
						<div class="card-footer d-flex flex-column" style="height: 146px; font-weight: bold;">

							<ul class="list-unstyled text-center">
								<li><div id="theaterImg"></div></li>
							<div id="theaterScreenTime">
							<div class="active">
							<br>
								<span id="theater"></span>
							</div>
							<div class="active">
								<span id="screen"></span>
							</div>
							<div class="active">
								<span id="time"></span>
							</div>
							</div>
							</ul>
						</div>

					</div>

					<div class="w-100 d-md-none mt-4"></div>

					<div class="card advanced p-1">
											<div class="card-header text-center pb-4 item">
							<h5 class="h1 card-title" style="color: black">상영관</h5>

						</div>
						<div class="card-body d-flex flex-column" style="height:500px; overflow:auto;">
						<div >
							<span id="showData">영화와 극장을 선택하면 시간표가 나옵니다.</span>
						</div>
							<ul class="list-unstyled text-center">
								<li>
								<div id="showSeat" style="font-weight: bold; margin-top: 20px;"></div>
								<div id="screenSeat" style="margin-top: 20px;"></div>
								</li>
							</ul>
						</div>
						<div class="card-footer d-flex flex-column" style="height: 146px;">

							<div id="next"></div>
						</div>
					</div>

					<div class="w-100 d-md-none mt-4"></div>

				</div>
			</form>
			
			<!-- 극장정보상세 모달 -->
			<jsp:include page="/views/reservation/myModalTheaterDetail.jsp"></jsp:include>
			
		</div>
		</section>
		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->
		
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</body>
</html>