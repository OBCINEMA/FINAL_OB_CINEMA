<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<!DOCTYPE html>
<html>
<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<title>예매내역 조회/취소</title>

<!-- Favicons -->
<link rel="shortcut icon" href="/resources/theme/images/favicon.ico">
<link rel="apple-touch-icon" href="/resources/theme/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="/resources/theme/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/theme/css/plugins.css">
<link rel="stylesheet" href="/resources/theme/style.css">

<!-- Color Variations -->
<link rel="stylesheet" href="/resources/theme/css/color-variations.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
	
	#bg1 {
		background-color: #ece6cc;
	}
	#dogimg{
		width: 300px;
		height: 200px;
	}
	#attach1{
		display: inline-block;
		width: 300px;
		height: 150px;
		margin: 1em;
		margin-top: -30px;
	}
	#attach2{
		display: inline-block;
		width: 400px;
		height: 250px;
		margin: 1em;
		margin-top: -30px;
	}
	#bold{
		font-weight: bold;
	}
	#subject{
		display: inline;
		font-size: 30px;
	}
	#icon1{
		width: 60px;
	}
	#nav{
		background-color: #8f784b;
	}
	#abc a{
		color: white;
	}
	#paw{
		width: 30px;
		height: 30px;
	}
	.list-group-item{
		color:#8f784b;
		font-weight: bold;
	}
	#fontweight{
		font-size: 2rem;
	}
	
</style>
<script>
// $(document).ready(function() {
//     var money = "${scheduleList[0].price}"; //2,312,000원
//     money = Number(money);
    
//     var k = 1;
//     for (var j in "${scheduleList[k].price}") {
//     	k++;
//     }
    
//     money = money * k;
//     money = money.toLocaleString();
//     $("#totPrice").append(money);
//     });
</script>
</head>
<body>
	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		
		<!--메인 영역 Content -->
		<main class="page-content" style="margin-top:146px">
		
			<!-- Sidebar -->
<!-- 			<div class="col-lg-3" style="position: fixed; display: inline-block"> -->
<!-- 				<div class="widgets widgets-leftside" style="margin:0"> -->
				
<!-- 					Single Widget -->
<!-- 					<div class="single-widget widget-categories"> -->
<!-- 						<h5 class="widget-title">My Page</h5> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 							<a href="/myReservation.do">예매내역 조회/취소</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 							<a href="/updateUsersGo.do">내 정보 수정</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					// Single Widget -->
				
<!-- 				</div> -->
<!-- 			</div> -->
			<!--// Sidebar -->
			
			<!-- 본문 -->
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
	<div class="container" style="margin-top: 180px;">	
		<div class="row">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">	
	<thead>
		<tr>
			<th style="background-color: #fafafa; text-align: center;">사진</th>
			<th style="background-color: #fafafa; text-align: center;">제목</th>
			<th style="background-color: #fafafa; text-align: center;">극장</th>
			<th style="background-color: #fafafa; text-align: center;">상영관</th>
			<th style="background-color: #fafafa; text-align: center;">일자</th>
			<th style="background-color: #fafafa; text-align: center;">시간</th>
			<th style="background-color: #fafafa; text-align: center;">좌석</th>
			<th style="background-color: #fafafa; text-align: center;">가격</th>
			<th style="background-color: #fafafa; text-align: center;">예매취소</th>
		</tr>
	</thead>
	<tbody>
 		<c:forEach var="i" begin="0"
								end="${reservationList.size()-1 }" step="1"> 
		<tr>
			<td style="text-align: center">${movieList[i].poster}</td>
			<td style="text-align: center">${movieList[i].title}</td>
			<td style="text-align: center">${theaterList[i].name}</td>
			<td style="text-align: center">${screenList[i].scr_name}</td>			
			<td style="text-align: center">${reservationList[i].r_date}</td>
			<td style="text-align: center">${scheduleList[i].time}</td>
			<td style="text-align: center">${reservationList[i].seat_row}/${reservationList[i].seat_col}</td>
			<td style="text-align: center" id="totPrice">&#8361;${scheduleList[i].price}</td>
			<td style="text-align: center"><input type="button" value="예매취소" onclick="sendPay(this.form)" class="cr-btn cr-btn-sm" style="background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px"></td>
		</tr>
 		</c:forEach> 
	</tbody>
	</table>
	</div>
    </div>
	<br><br>
					<!-- ///////////////////////////////// 여기부터 채우면끝 -->
		</main>
		<!-- //메인 끝 -->

		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->
	
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</body>
</html>