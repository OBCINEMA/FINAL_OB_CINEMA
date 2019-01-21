<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
</head>
<body>
	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		
		<!--메인 영역 Content -->
		<main class="page-content" style="margin-top:146px">
		
		<section class="services-area section-padding-lg bg-grey" style="position:relative; margin:0; padding:0;">
			<!-- Sidebar -->
			<div class="col-lg-3" style="position: fixed; display: inline-block">
				<div class="widgets widgets-leftside" style="margin:0">
				
					<!-- Single Widget -->
					<div class="single-widget widget-categories">
						<h5 class="widget-title">My Page</h5>
						<ul>
							<li>
							<a href="/myReservation.do">예매내역 조회/취소</a>
							</li>
							<li>
							<a href="/updateUsersGo.do">내 정보 수정</a>
							</li>
						</ul>
					</div>
					<!--// Single Widget -->
				
				</div>
			</div>
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
		</tr>
	</thead>
	<tbody>	
		<tr>
			<td  style="text-align: center"><img src="resources/movieimg/${movieVO.poster }" width="100"></td>
			<td style="text-align: center"></td>
			<td style="text-align: center"></td>
			<td style="text-align: center"></td>			
			<td style="text-align: center"></td>
			<td style="text-align: center"></td>
			<td style="text-align: center"> 
			</td>
			<td style="text-align: center" id="totPrice">&#8361;</td>
		</tr>	
	</tbody>
	</table>
	</div>
    </div>
	<br><br>
	
	<form>
		<div class="container"  style="margin-bottom: 30px">	
		<div class="row">
		<table class="table table-bordered bordertable th120" >
		<tr><th style="background-color: #fafafa">결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		신용카드&nbsp<input type="radio" name="pay_type" value="card" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		핸드폰&nbsp<input type="radio" name="pay_type" value="phone" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		계좌입금&nbsp<input type="radio" name="pay_type" value="Transfer" style="display: inline-block; width: 15px; margin-top: 0px;">
		</td></tr>
		<tr><td colspan="2" style="text-align: center;">
			<input type="button" value="결제하기" onclick="sendPay(this.form)" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px">
			<input type="reset" value="취소하기" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px;">
		</td></tr>
		</table>
		</div>
		</div>
	</form>

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