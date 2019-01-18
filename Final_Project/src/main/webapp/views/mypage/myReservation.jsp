<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="container" style="margin:500 0 0 0">
				<div class="row">
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
					

					<!-- ///////////////////////////////// 여기부터 채우면끝 -->

				</div>
			</div>
		</section>

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